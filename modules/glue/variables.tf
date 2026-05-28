variable "glue_service_role_arn" {
  type = string
}

variable "glue_s3_role_arn" {
  type = string
}

variable "datalake_bucket_name" {
  description = "Name of the S3 datalake bucket (used in crawler s3_target paths)"
  type        = string
}

variable "glue_assets_bucket_name" {
  description = "Name of the S3 Glue assets bucket (used in ETL job script_location and TempDir)"
  type        = string
}
