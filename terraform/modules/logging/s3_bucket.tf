resource "aws_s3_bucket" "log_archive" {
  bucket = "org-log-archive-bucket"

  force_destroy = false
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.log_archive.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.log_archive.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.log_archive.id

  block_public_acls       = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
}