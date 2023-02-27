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
  # Bind security_group to instance 
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

# create new instance - dev 4 - bind resource bucket s3
resource "aws_instance" "dev4" {
  ami = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name = "terraform_aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

# create new instance -dev 5
resource "aws_instance" "dev5" {
  ami = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name = "terraform_aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

# Create security_group
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
}

# create bucket s3
resource "aws_s3_bucket" "dev4" {
  bucket = "gnsantoslabs-dev4"
  acl    = "private"

  tags = {
    Name        = "gnsantoslabs-dev4"
  }
}