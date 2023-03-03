# Create instance
resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "dev${count.index}"
  }
  # Bind security_group to instance 
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

# create new instance - dev 4 - bind resource bucket s3
resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

# create new instance -dev 5
resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name #chave-ssh
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

# create dev6 in another region (us-east-2)
#modified ami is security_group

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"  
  ami = var.amis["us-east-2"]  # catch(pegar) in launch instance
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_us_east_2.id}"]
  depends_on = "aws_dynamodb_table.dynamodb-homologacao"
}


resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"  
  ami = var.amis["us-east-2"]  # catch(pegar) in launch instance
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_us_east_2.id}"]
  depends_on = "aws_dynamodb_table.dynamodb-homologacao"
}