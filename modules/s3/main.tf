data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# modules/s3/main.tf

resource "aws_s3_bucket" "s3-datalake" {
  bucket = "amzn-s3-tfgdl"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket      = aws_s3_bucket.s3-datalake.id
  eventbridge = true
}

resource "aws_s3_bucket" "aws-glue-assets-eu-north-1" {
  bucket = "aws-glue-assets-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.region}"
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

