# para database na documentacao do terraform - aws_dynamodb_table

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider       = "aws.us-east2"
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}