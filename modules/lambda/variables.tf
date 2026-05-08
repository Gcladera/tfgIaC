variable "lambda_gecko_role_arn" {
  type = string
}

variable "lambda_posts_role_arn" {
  type = string
}

variable "lambda_private_subnet_ids" {
  type = list(string)
}

variable "lambda_security_group_ids" {
  type = list(string)
}

variable "lambda_silver_role_arn" {
  type = string
}

variable "lambda_silver_security_group_ids" {
  type = list(string)
}
