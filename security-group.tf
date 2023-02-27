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
  tags ={
    Name = "ssh"
  }
}


# Create security groups in another region (us-east-2)
resource "aws_security_group" "allow_ssh_us_east_2" {
  provider = "aws.us-east-2" # para referencia o provedor aws na us-east-2
  name        = "allow_ssh"
  description = "Allow ssh acess in region us-east-2"

  ingress {
    description      = "Allow ssh acess in region us-east-2"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["187.127.230.180/32"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  tags ={
    Name = "ssh"
  }
}