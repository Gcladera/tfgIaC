variable "lambda_gecko_function_arn" {
  type = string
}

variable "lambda_posts_function_arn" {
  type = string
}

variable "lambda_gecko_silver_function_arn" {
  type = string
}

variable "lambda_posts_silver_function_arn" {
  type = string
}

variable "s3_datalake" {
  type = string
}

variable "eventbridge_scheduler_lambda_1_role_arn" {
  type = string
}

variable "eventbridge_scheduler_lambda_2_role_arn" {
  type = string
}

variable "eventbridge_scheduler_lambda_3_role_arn" {
  type = string
}

variable "eventbridge_scheduler_lambda_4_role_arn" {
  type = string
}

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
variable "eventbridge_bronze_crawler_role_arn" {
  type = string
}

variable "eventbridge_silver_crawler_role_arn" {
  type = string
}

variable "eventbridge_gold_crawler_role_arn" {
  type = string
}
