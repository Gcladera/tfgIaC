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

variable "crypto_api_secret_name" {
  type    = string
  default = "CryptoAPICredentials"
}

variable "blue_sky_api_secret_name" {
  type    = string
  default = "BlueSkyAPICredentials"
}
