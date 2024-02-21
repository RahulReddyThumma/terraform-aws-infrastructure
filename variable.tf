variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_az" {
  description = "The availability zone for the public subnet where the EC2 instance will be created"
  type        = string
  default     = "us-east-1a"
}

variable "public_subnets" {
  description = "A map of public subnets inside the VPC"
  default = {
    "us-east-1a" = "10.0.1.0/24"
    "us-east-1b" = "10.0.2.0/24"
  }
}

variable "private_subnets" {
  description = "A map of private subnets inside the VPC"
  default = {
    "us-east-1a" = "10.0.3.0/24"
    "us-east-1b" = "10.0.4.0/24"
  }
}

variable "key_pair_name" {
  description = "The name of the existing key pair in AWS"
  type        = string
  default     = "terraform"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI to use for the instance"
  default     = "ami-0440d3b780d96b29d"
}

variable "key_name" {
  description = "The key name of the AWS key pair"
  default     = "deployer_key"
}