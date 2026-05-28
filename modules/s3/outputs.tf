output "datalake_bucket_name" {
  value = aws_s3_bucket.s3-datalake.bucket
}

output "datalake_bucket_arn" {
  value = aws_s3_bucket.s3-datalake.arn
}

output "athena_results_bucket_arn" {
  description = "ARN of the Athena query results S3 bucket"
  value       = aws_s3_bucket.athena-query-results.arn
}

output "athena_results_bucket_name" {
  description = "Name of the Athena query results S3 bucket"
  value       = aws_s3_bucket.athena-query-results.bucket
}

output "glue_assets_bucket_name" {
  description = "Name of the Glue assets S3 bucket"
  value       = aws_s3_bucket.aws-glue-assets-eu-north-1.bucket
}

