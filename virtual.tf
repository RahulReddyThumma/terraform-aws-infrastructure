resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}


# Create public subnets
resource "aws_subnet" "my_subnet_public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = each.key

  tags = {
    Name = "my_subnet_public_${each.key}"
  }
}

# Create private subnets
resource "aws_subnet" "my_subnet_private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "my_subnet_private_${each.key}"
  }
}
