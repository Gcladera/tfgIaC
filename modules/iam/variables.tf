variable "blue_sky_api_arn" {
  type        = string
  description = "ARN of the BlueSky API Credentials secret"
}

variable "crypto_api_arn" {
  type        = string
  description = "ARN of the Crypto API Credentials secret"
}

variable "schema_database_name" {
  type        = string
  description = "Name of the Glue Schema Database"
}

variable "datalake_bucket_arn" {
  type        = string
  description = "ARN of the datalake S3 bucket"
}
