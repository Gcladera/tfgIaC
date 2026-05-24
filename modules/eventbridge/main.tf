resource "aws_scheduler_schedule" "trigger-crypto-api" {
  name                         = "trigger-crypto-api"
  group_name                   = "default"
  region                       = "eu-north-1"
  schedule_expression          = "rate(20 minutes)"
  schedule_expression_timezone = "Europe/Madrid"
  state                        = "DISABLED"

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = var.lambda_gecko_function_arn
    role_arn = var.eventbridge_scheduler_lambda_2_role_arn

    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}

resource "aws_scheduler_schedule" "trigger-bluesky-api" {
  name                         = "trigger-bluesky-api"
  group_name                   = "default"
  description                  = "A trigger to invoke lambda responsible for acquiring data and saving it to s3. "
  region                       = "eu-north-1"
  schedule_expression          = "rate(20 minutes)"
  schedule_expression_timezone = "Europe/Madrid"
  state                        = "DISABLED"
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = var.lambda_posts_function_arn
    role_arn = var.eventbridge_scheduler_lambda_1_role_arn
    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}

resource "aws_scheduler_schedule" "trigger-crypto-api-silver" {
  name                         = "trigger-crypto-api-silver"
  group_name                   = "default"
  description                  = "A trigger to invoke lambda responsible for acquiring data and saving it to s3. "
  region                       = "eu-north-1"
  schedule_expression          = "rate(20 minutes)"
  schedule_expression_timezone = "Europe/Madrid"
  state                        = "DISABLED"
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = var.lambda_gecko_silver_function_arn
    role_arn = var.eventbridge_scheduler_lambda_4_role_arn
    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}

resource "aws_scheduler_schedule" "trigger-bluesky-api-silver" {
  name                         = "trigger-bluesky-api-silver"
  group_name                   = "default"
  description                  = "A trigger to invoke lambda responsible for acquiring data and saving it to s3. "
  region                       = "eu-north-1"
  schedule_expression          = "rate(20 minutes)"
  schedule_expression_timezone = "Europe/Madrid"
  state                        = "DISABLED"
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = var.lambda_posts_silver_function_arn
    role_arn = var.eventbridge_scheduler_lambda_3_role_arn
    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}
