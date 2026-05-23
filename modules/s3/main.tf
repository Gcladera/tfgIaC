# modules/s3/main.tf

resource "aws_s3_bucket" "s3-datalake" {
  bucket = "amzn-s3-tfgdl"
}

resource "aws_s3_bucket" "aws-glue-assets-eu-north-1" {
  bucket = "aws-glue-assets-544820269502-eu-north-1"
}

resource "aws_s3_bucket" "athena-query-results" {
  bucket = "s3-athena-query-results-tfgdl"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-state-tfgdl"
  force_destroy = false
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "state_privacy" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

