# for securing the terraform.tsstate file we will use the backend syntax

resource "aws_s3_bucket" "example" {
    bucket = "" # give the unique name 
    tags = {
      "name" = "for which team need"
    }
}