data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_scheduler_schedule" "trigger-crypto-api" {
  name                         = "trigger-crypto-api"
  group_name                   = "default"
  region                       = data.aws_region.current.region
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
  region                       = data.aws_region.current.region
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
  region                       = data.aws_region.current.region
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
  region                       = data.aws_region.current.region
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

resource "aws_cloudwatch_event_rule" "s3_bronze_upload_rule" {
  name        = "trigger-crawler-bronze-on-upload"
  description = "Activa el Crawler quan arriba nova dada a la capa Bronze"

  event_pattern = jsonencode({
    "source" : ["aws.s3"],
    "detail-type" : ["Object Created"],
    "detail" : {
      "bucket" : {
        "name" : [var.s3_datalake]
      },
      "object" : {
        "key" : [{ "prefix" : "bronze/" }]
      }
    }
  })
}

resource "aws_cloudwatch_event_rule" "s3_silver_upload_rule" {
  name        = "trigger-crawler-silver-on-upload"
  description = "Activa el Crawler quan arriba nova dada a la capa Silver"

  event_pattern = jsonencode({
    "source" : ["aws.s3"],
    "detail-type" : ["Object Created"],
    "detail" : {
      "bucket" : {
        "name" : [var.s3_datalake]
      },
      "object" : {
        "key" : [{ "prefix" : "silver/" }]
      }
    }
  })
}

resource "aws_cloudwatch_event_rule" "s3_gold_upload_rule" {
  name        = "trigger-crawler-gold-on-upload"
  description = "Activa el Crawler quan arriba nova dada a la capa Gold"

  event_pattern = jsonencode({
    "source" : ["aws.s3"],
    "detail-type" : ["Object Created"],
    "detail" : {
      "bucket" : {
        "name" : [var.s3_datalake]
      },
      "object" : {
        "key" : [{ "prefix" : "gold/" }]
      }
    }
  })
}


resource "aws_cloudwatch_event_target" "start_bronze_workflow" {
  rule     = aws_cloudwatch_event_rule.s3_bronze_upload_rule.name
  arn      = var.glue_workflow_bronze_arn
  role_arn = var.eventbridge_bronze_crawler_role_arn
}

resource "aws_cloudwatch_event_target" "start_silver_workflow" {
  rule     = aws_cloudwatch_event_rule.s3_silver_upload_rule.name
  arn      = var.glue_workflow_silver_arn
  role_arn = var.eventbridge_silver_crawler_role_arn
}

resource "aws_cloudwatch_event_target" "start_gold_workflow" {
  rule     = aws_cloudwatch_event_rule.s3_gold_upload_rule.name
  arn      = var.glue_workflow_gold_arn
  role_arn = var.eventbridge_gold_crawler_role_arn
}
