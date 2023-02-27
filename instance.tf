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

# create dev6 in another region (us-east-2)
#modified ami is security_group

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"  
  ami = "ami-0d8f6eb4f641ef691"  # catch(pegar) in launch instance
  instance_type = "t2.micro"
  key_name = "terraform_aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_us_east_2.id}"]
}
