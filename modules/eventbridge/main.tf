resource "aws_scheduler_schedule" "trigger-crypto-api" {
  name                          = "trigger-crypto-api"
  group_name                    = "default"
  region                        = "eu-north-1"
  schedule_expression           = "rate(5 minutes)"
  schedule_expression_timezone  = "Europe/Madrid"
  state                         = "DISABLED"
  
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:lambda:eu-north-1:544820269502:function:lambda-gecko"
    role_arn = "arn:aws:iam::544820269502:role/service-role/Amazon_EventBridge_Scheduler_LAMBDA_e868e70107"

    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}

resource "aws_scheduler_schedule" "trigger-bluesky-api" {
  name                          = "trigger-bluesky-api"
  group_name                    = "default"
  description                   = "A trigger to invoke lambda responsible for acquiring data and saving it to s3. "
  region                        = "eu-north-1"
  schedule_expression           = "rate(15 minutes)"
  schedule_expression_timezone  = "Europe/Madrid"
  state                         = "DISABLED"
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:lambda:eu-north-1:544820269502:function:lambda-posts"
    role_arn = "arn:aws:iam::544820269502:role/service-role/Amazon_EventBridge_Scheduler_LAMBDA_41fe89560a"
    retry_policy {
      maximum_event_age_in_seconds = 86400
      maximum_retry_attempts       = 0
    }
  }
}
