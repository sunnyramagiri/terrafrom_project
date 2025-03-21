resource "aws_instance" "modules" {
    ami =  "ami-id" # copy the flavor of image from aws 
    instance_type = "t2.micro"
    count = "" # number of instance required
    subnet_id = "" # copy from VIP subnet_id
    key_name =  example   # create the new key pair
    tags = {
      "name" = "" # give the name of instance 
    }
}