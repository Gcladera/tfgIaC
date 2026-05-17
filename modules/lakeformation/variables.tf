variable "glue_service_role_arn" {
  type = string
}

variable "s3_bucket_arn" {
  type        = string
  description = "ARN of the S3 Bucket"
}

variable "lakeformation_service_role_arn" {
  type        = string
  description = "ARN of the Lake Formation Service Role"
}

variable "glue_job_role_arn" {
  type = string
}

variable "glue_database_name" {
  type = string
}

variable "glue_s3_role_arn" {
  type = string
}

variable "grafana_task_role_arn" {
  type        = string
  description = "ARN for the Grafana ECS Task Execution Role"
}
