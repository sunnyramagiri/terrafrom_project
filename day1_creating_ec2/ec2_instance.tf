resource "aws_instance" "example" {
    ami = "" # select from aws ec2 instance flavour of ID
    instance_type = "t2.micro"
    count = "" # number of instance
    key_name = "ia"
    subnet_id = "" # pick from the VPC for subnet 
    tags = {
      "name" = "dev" # give as per required
    }
}
