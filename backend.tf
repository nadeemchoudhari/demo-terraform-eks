terraform {
  backend "s3" {
    bucket = "my-tf-state-demo"
    key   = "terraform.tfstate"
    region = "ap-south-1"
    profile = "admin"
  }
}