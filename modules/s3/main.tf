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
