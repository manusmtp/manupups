provider "aws"{
    region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "manuprasad2021"

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule{
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "manuprasad2021"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
