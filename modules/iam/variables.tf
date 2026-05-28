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

variable "athena_results_bucket_arn" {
  type        = string
  description = "ARN of the Athena query results S3 bucket"
}

#Crawler IDs - Bronze
variable "glue_workflow_bronze_arn" {
  description = "The ARN of the bronze glue workflow"
  type        = string
}
variable "glue_workflow_silver_arn" {
  description = "The ARN of the silver glue workflow"
  type        = string
}
variable "glue_workflow_gold_arn" {
  description = "The ARN of the gold glue workflow"
  type        = string
}

variable "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  type        = string
  default     = "athena-datacatalog"
}
