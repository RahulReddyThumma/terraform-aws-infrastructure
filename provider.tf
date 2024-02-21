provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-rahulreddythumma"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "my-terraform-state-lock"
  }
}