# create bucket s3
resource "aws_s3_bucket" "dev4" {
  bucket = "gnsantoslabs-dev4"
  acl    = "private"

  tags = {
    Name        = "gnsantoslabs-dev4"
  }
}