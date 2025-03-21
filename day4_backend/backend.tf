terraform {
  backend "s3" {
    bucket = "value" # after creating the s3 bucket need to past hear
    key = "folder_name/terrafrom.tfstate"
    region = "" # from the main file need
  }
}