terraform {
  backend "s3" {
    bucket = "value"
    key = "inno-website.tfstate"
    region = "us-east-1"
    profile = "dev"
    
  }
}