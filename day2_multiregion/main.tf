provider "aws" {
    region = "us-west-1"
    access_key =   ""
    secret_key = "" 
}

provider "aws" {
    region = "us-east-1"
    alias = "use1"
    access_key = "" # create the IAM user and download the file 
    secret_key = "" # create the IAM user and download the file 
}