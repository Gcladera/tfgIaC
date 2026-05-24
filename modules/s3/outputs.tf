output "datalake_bucket_arn" {
  value = aws_s3_bucket.s3-datalake.arn
}

output "athena_results_bucket_arn" {
  description = "ARN of the Athena query results S3 bucket"
  value       = aws_s3_bucket.athena-query-results.arn
}
