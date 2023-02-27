terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create instance
resource "aws_instance" "dev" {
  count = 3
  ami = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name = "terraform_aws"
  tags = {
    Name = "dev${count.index}"
  }
}

# create group security
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh acess"

  ingress {
    description      = "Allow ssh acess"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["187.127.230.180/32"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }