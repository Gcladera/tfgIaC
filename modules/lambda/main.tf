resource "aws_lambda_function" "crypto-api-call" {
  function_name = "lambda-gecko"
  role          = var.lambda_gecko_role_arn
  s3_bucket     = "dummy"
  s3_key        = "dummy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 60
  memory_size   = 128
  layers        = [ "arn:aws:lambda:eu-north-1:336392948345:layer:AWSSDKPandas-Python312:22" ]

  vpc_config {
    subnet_ids                  = var.lambda_private_subnet_ids
    security_group_ids          = var.lambda_security_group_ids
  }

  lifecycle {
    ignore_changes = [filename, source_code_hash, s3_bucket, s3_key, image_uri]
  }
  environment {
    variables = {
      "TZ"                = "Europe/Madrid"
    }
  }
}

resource "aws_lambda_function" "posts-api-call" {
  function_name = "lambda-posts"
  role          = var.lambda_posts_role_arn
  s3_bucket     = "dummy"
  s3_key        = "dummy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 180
  memory_size   = 512
  layers        = [ "arn:aws:lambda:eu-north-1:336392948345:layer:AWSSDKPandas-Python312:22" ]

  vpc_config {
    subnet_ids                  = var.lambda_private_subnet_ids
    security_group_ids          = var.lambda_security_group_ids
  }

  lifecycle {
    ignore_changes = [filename, source_code_hash, s3_bucket, s3_key, image_uri]
  }
  environment {
    variables = {
      "TZ"                = "Europe/Madrid"
    }
  }
}

resource "aws_lambda_function" "lambda-gecko-silver" {
  function_name = "lambda-gecko-silver"
  role          = var.lambda_silver_role_arn
  s3_bucket     = "dummy"
  s3_key        = "dummy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 60
  memory_size   = 128
  layers        = [ "arn:aws:lambda:eu-north-1:336392948345:layer:AWSSDKPandas-Python312:22" ]

  vpc_config {
    subnet_ids                  = var.lambda_private_subnet_ids
    security_group_ids          = var.lambda_silver_security_group_ids
  }

  lifecycle {
    ignore_changes = [filename, source_code_hash, s3_bucket, s3_key, image_uri]
  }
  environment {
    variables = {
      "TZ"                = "Europe/Madrid"
    }
  }
}

resource "aws_lambda_function" "lambda-posts-silver" {
  function_name = "lambda-posts-silver"
  role          = var.lambda_silver_role_arn
  s3_bucket     = "dummy"
  s3_key        = "dummy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 180
  memory_size   = 512
  layers        = [ "arn:aws:lambda:eu-north-1:336392948345:layer:AWSSDKPandas-Python312:22" ]

  vpc_config {
    subnet_ids                  = var.lambda_private_subnet_ids
    security_group_ids          = var.lambda_silver_security_group_ids
  }

  lifecycle {
    ignore_changes = [filename, source_code_hash, s3_bucket, s3_key, image_uri]
  }
  environment {
    variables = {
      "TZ"                = "Europe/Madrid"
    }
  }
}
