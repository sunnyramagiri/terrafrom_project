resource "aws_s3_bucket" "example" {
    bucket = "" # unique name in the world
    tags = {
      "name" = "" # as we required
    }
}

# for uploading the file in the s3 bucket

resource "aws_s3bucket_object" "example" {
    bucket = aws_s3_bucket.example.id
    key = "" # after creating the file are uploade in the folder
    source  =   "" # copy the file location 
}