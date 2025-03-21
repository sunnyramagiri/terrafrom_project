variable "cidr" {
  default = "10.0.0.0/24"
}

resource "aws_key_pair" "mykey" {
  key_name   = "sunny-terraform"  # Replace with your desired key name
  public_key = file("")  # Replace with the path to your public key file
}

resource "aws_vpc" "myvpc1" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.myvpc1.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc1.id
}

resource "aws_route_table" "rta1" {
  vpc_id = aws_vpc.myvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_security_group" "websg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc1.id

  ingress {
    description = "HTTP for VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
