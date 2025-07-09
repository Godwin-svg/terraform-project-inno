terraform {
  backend "s3" {
    bucket = "inno-terraform-remote-state"
    key = "inno-terraform-remote-state"
    region = "us-east-1"
    profile = "dev"
    
  }
}