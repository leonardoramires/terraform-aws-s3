resource "aws_s3_bucket" "datalake" {
  bucket = "${var.bucket_name}-${var.account_number}"

  tags = {
    Name        = "Test buscket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
} 

resource "aws_s3_bucket_server_side_encryption_configuration" "server_encrypt" {
  bucket = aws_s3_bucket.datalake.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

