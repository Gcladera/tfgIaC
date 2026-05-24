resource "aws_iam_role" "eventbridge_scheduler_lambda_2" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "Amazon_EventBridge_Scheduler_LAMBDA_e868e70107"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}



resource "aws_iam_role" "rds_monitoring" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "monitoring.rds.amazonaws.com"
      }
      Sid = ""
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "rds-monitoring-role"
  path                  = "/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "glue_service_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = ["glue.amazonaws.com", "lakeformation.amazonaws.com"]
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "AWSGlueServiceRole"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "ecs_grafana_execution" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        ArnLike = {
          "aws:SourceArn" = "arn:aws:ecs:eu-north-1:544820269502:*"
        }
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "ecs-grafana-executionRole"
  path                  = "/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "glue_s3_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["glue.amazonaws.com", "lakeformation.amazonaws.com"]
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "AWSGlueServiceRole-S3TFG"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "eventbridge_scheduler_lambda_1" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "Amazon_EventBridge_Scheduler_LAMBDA_41fe89560a"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "eventbridge_scheduler_lambda_3" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "Amazon_EventBridge_Scheduler_LAMBDA_c658f80d48"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "eventbridge_scheduler_lambda_4" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "aws:SourceAccount" = "544820269502"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "Amazon_EventBridge_Scheduler_LAMBDA_743b537341"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "grafana_ecs_task_execution" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "grafana-ecsTaskExecutionRole"
  path                  = "/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "lambda_gecko" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "lambda-gecko-role-d1cyk3hi"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_role" "lambda_posts" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "lambda-posts-role-p6kfn5ls"
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

resource "aws_iam_user" "grau_cladera" {
  force_destroy        = false
  name                 = "grau_cladera"
  path                 = "/"
  permissions_boundary = null
  tags = {
    "AKIAX5WORSG7MF2V2OWY" = "AWS CLI consola "
  }
  tags_all = {
    "AKIAX5WORSG7MF2V2OWY" = "AWS CLI consola "
  }
}

resource "aws_iam_user" "readonly_user" {
  name = "readonly_user"
  path = "/"

  tags = {
    Description = "Usuari només amb permisos de lectura"
  }
}

resource "aws_iam_user_policy_attachment" "readonly_attach" {
  user       = aws_iam_user.readonly_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "grau_cladera_lakeformation" {
  user       = aws_iam_user.grau_cladera.name
  policy_arn = aws_iam_policy.lakeformation_AdminAccess.arn
}

resource "aws_iam_role_policy_attachment" "lambda_gecko_vpc_access" {
  role       = aws_iam_role.lambda_gecko.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_posts_vpc_access" {
  role       = aws_iam_role.lambda_posts.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role" "lambda_silver" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  name = "lambda-silver-role"
  path = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "lambda_silver_vpc_access" {
  role       = aws_iam_role.lambda_silver.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy" "lambda_silver_s3_access" {
  name = "lambda-silver-s3-access"
  role = aws_iam_role.lambda_silver.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = var.datalake_bucket_arn
      },
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:GetObjectVersion"]
        Resource = "${var.datalake_bucket_arn}/bronze/*"
      },
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject"]
        Resource = "${var.datalake_bucket_arn}/silver/*"
      }
    ]
  })
}

# ──────────────────────────────────────────────
# lambda-gecko-silver-role-9npv16f5
# ──────────────────────────────────────────────
resource "aws_iam_role" "lambda_gecko_silver" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  name = "lambda-gecko-silver-role-9npv16f5"
  path = "/service-role/"
}

resource "aws_iam_role_policy" "lambda_gecko_silver_basic_execution" {
  name = "AWSLambdaBasicExecutionRole-65a56fb0-cea7-4a95-9f8d-a421844d8c8d"
  role = aws_iam_role.lambda_gecko_silver.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:eu-north-1:544820269502:*"
      },
      {
        Effect = "Allow"
        Action = ["logs:CreateLogStream", "logs:PutLogEvents"]
        Resource = [
          "arn:aws:logs:eu-north-1:544820269502:log-group:/aws/lambda/lambda-gecko-silver:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_gecko_silver_vpc_access" {
  role       = aws_iam_role.lambda_gecko_silver.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

# ──────────────────────────────────────────────
# lambda-posts-role inline policies
# ──────────────────────────────────────────────
resource "aws_iam_role_policy" "lambda_posts_basic_execution" {
  name = "AWSLambdaBasicExecutionRole-585cd1dc-3cdc-480e-b732-acd32ca8c468"
  role = aws_iam_role.lambda_posts.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:eu-north-1:544820269502:*"
      },
      {
        Effect = "Allow"
        Action = ["logs:CreateLogStream", "logs:PutLogEvents"]
        Resource = [
          "arn:aws:logs:eu-north-1:544820269502:log-group:/aws/lambda/lambda-posts:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_posts_secrets_manager" {
  role       = aws_iam_role.lambda_posts.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy" "lambda_posts_s3_access" {
  name = "lambdaPostsS3access"
  role = aws_iam_role.lambda_posts.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "Statement1"
        Effect   = "Allow"
        Action   = ["s3:PutObject"]
        Resource = ["${var.datalake_bucket_arn}/*"]
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_posts_secrets" {
  name = "secrets-access"
  role = aws_iam_role.lambda_posts.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "secretsmanager:GetSecretValue"
        Resource = var.blue_sky_api_arn
      }
    ]
  })
}

# ──────────────────────────────────────────────
# lambda-gecko-role inline policies
# ──────────────────────────────────────────────
resource "aws_iam_role_policy" "lambda_gecko_basic_execution" {
  name = "AWSLambdaBasicExecutionRole-585cd1dc-3cdc-480e-b732-acd32ca8c468"
  role = aws_iam_role.lambda_gecko.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:eu-north-1:544820269502:*"
      },
      {
        Effect = "Allow"
        Action = ["logs:CreateLogStream", "logs:PutLogEvents"]
        Resource = [
          "arn:aws:logs:eu-north-1:544820269502:log-group:/aws/lambda/lambda-posts:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_gecko_secrets_manager" {
  role       = aws_iam_role.lambda_gecko.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy" "lambda_gecko_s3_access" {
  name = "lambdaPostsS3access"
  role = aws_iam_role.lambda_gecko.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "Statement1"
        Effect   = "Allow"
        Action   = ["s3:PutObject"]
        Resource = ["${var.datalake_bucket_arn}/*"]
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_gecko_secrets" {
  name = "secrets-access"
  role = aws_iam_role.lambda_gecko.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "secretsmanager:GetSecretValue"
        Resource = var.crypto_api_arn
      }
    ]
  })
}

# ──────────────────────────────────────────────
# LakeFormationAssumeRoleS3
# ──────────────────────────────────────────────
resource "aws_iam_role" "lakeformation_service_role" {
  name = "LakeFormationAssumeRoleS3"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lakeformation.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lakeformation_s3_access" {
  name = "GlueCrawlerS3AccessLakeFormation"
  role = aws_iam_role.lakeformation_service_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "S3BucketAccess"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = [
          var.datalake_bucket_arn,
          "${var.datalake_bucket_arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "glue_service_managed" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "glue_lakeformation_access" {
  name = "glue-lakeformation-access"
  role = aws_iam_role.glue_service_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "lakeformation:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "glue_service_s3_access" {
  name = "glue-etl-s3-access"
  role = aws_iam_role.glue_service_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = var.datalake_bucket_arn
      },
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
        Resource = [
          "${var.datalake_bucket_arn}/bronze/*",
          "${var.datalake_bucket_arn}/silver/*",
          "${var.datalake_bucket_arn}/gold/*"
        ]
      }
    ]
  })
}

# ──────────────────────────────────────────────
# AWSGlueServiceRole-S3TFG (glue_s3_role) policies
# ──────────────────────────────────────────────
resource "aws_iam_role_policy_attachment" "glue_crawler_managed" {
  role       = aws_iam_role.glue_s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy_attachment" "glue_crawler_console_full_access" {
  role       = aws_iam_role.glue_s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}

resource "aws_iam_role_policy_attachment" "glue_crawler_comprehend" {
  role       = aws_iam_role.glue_s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/ComprehendFullAccess"
}

resource "aws_iam_role_policy" "glue_crawler_s3_policy" {
  name = "AWSGLueServiceRole-S3TFG-EZCRC-s3Policy"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject"]
        Resource = ["${var.datalake_bucket_arn}/*"]
        Condition = {
          StringEquals = {
            "aws:ResourceAccount" = "544820269502"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "glue_crawler_lakeformation_role" {
  name = "CrawlerRoleLakeFormation"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "GlueCatalogAccess"
        Effect   = "Allow"
        Action   = ["glue:Get*", "glue:Create*", "glue:Update*"]
        Resource = ["*"]
      },
      {
        Sid      = "LakeFormationAccess"
        Effect   = "Allow"
        Action   = ["lakeformation:GetDataAccess"]
        Resource = ["*"]
      },
      {
        Sid    = "S3Access"
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          var.datalake_bucket_arn,
          "${var.datalake_bucket_arn}/*"
        ]
      },
      {
        Sid      = "CloudWatchLogs"
        Effect   = "Allow"
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "glue_crawler_lakeformation_access" {
  name = "glue-crawler-lakeformation-access"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "GlueCatalogAccess"
        Effect   = "Allow"
        Action   = ["glue:Get*", "glue:Create*", "glue:Update*"]
        Resource = ["*"]
      },
      {
        Sid      = "LakeFormationAccess"
        Effect   = "Allow"
        Action   = ["lakeformation:GetDataAccess"]
        Resource = ["*"]
      },
      {
        Sid    = "S3Access"
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          var.datalake_bucket_arn,
          "${var.datalake_bucket_arn}/*"
        ]
      },
      {
        Sid      = "CloudWatchLogs"
        Effect   = "Allow"
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "glue_crawler_s3_access" {
  name = "glue-crawler-s3-access"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = var.datalake_bucket_arn
      },
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
        Resource = [
          "${var.datalake_bucket_arn}/bronze/*",
          "${var.datalake_bucket_arn}/silver/*",
          "${var.datalake_bucket_arn}/gold/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "glue_crawler_iam_passrole" {
  name = "IAMPassrole"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "iam:PassRole"
        Resource = aws_iam_role.lakeformation_service_role.arn
      }
    ]
  })
}

# ──────────────────────────────────────────────
# grafana-ecsTaskExecutionRole inline policy
# ──────────────────────────────────────────────
resource "aws_iam_role_policy" "grafana_task_execution_policy" {
  name = "grafana-task-execution-policy"
  role = aws_iam_role.grafana_ecs_task_execution.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AthenaPermissions"
        Effect = "Allow"
        Action = [
          "athena:List*",
          "athena:Get*",
          "athena:StartQueryExecution",
          "athena:StopQueryExecution"
        ]
        Resource = "*"
      },
      {
        Sid    = "GlueDataCatalogPermissions"
        Effect = "Allow"
        Action = [
          "glue:GetDatabase",
          "glue:GetDatabases",
          "glue:GetTable",
          "glue:GetTables",
          "glue:GetPartition",
          "glue:GetPartitions",
          "glue:BatchGetPartition"
        ]
        Resource = [
          "arn:aws:glue:*:*:catalog",
          "arn:aws:glue:*:*:database/${var.schema_database_name}",
          "arn:aws:glue:*:*:table/${var.schema_database_name}/*"
        ]
      },
      {
        Sid    = "S3PermissionsForAthenaResults"
        Effect = "Allow"
        Action = [
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:ListMultipartUploadParts",
          "s3:AbortMultipartUpload",
          "s3:CreateBucket",
          "s3:PutObject",
          "s3:PutBucketPublicAccessBlock"
        ]
        Resource = ["*"]
      },
      {
        Sid      = "LakeFormationDataAccess"
        Effect   = "Allow"
        Action   = ["lakeformation:GetDataAccess"]
        Resource = "*"
      },
      {
        Sid    = "S3PermissionsForDataAccess"
        Effect = "Allow"
        Action = [
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          var.datalake_bucket_arn,
          "${var.datalake_bucket_arn}/*"
        ]
      }
    ]
  })
}

# ──────────────────────────────────────────────
# AWSAthenaSQLRole-mj4jb147
# ──────────────────────────────────────────────
resource "aws_iam_role" "athena_sql_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "athena.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  name = "AWSAthenaSQLRole-mj4jb147"
  path = "/service-role/"
}

resource "aws_iam_role_policy" "athena_sql_role_policy" {
  name = "AWSAthenaSQLRolePolicy-mqlgixhyld"
  role = aws_iam_role.athena_sql_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Athena"
        Effect = "Allow"
        Action = [
          "athena:GetPreparedStatement",
          "athena:CreatePreparedStatement",
          "athena:DeletePreparedStatement",
          "athena:UpdatePreparedStatement",
          "athena:ListPreparedStatements"
        ]
        Resource = ["arn:aws:athena:eu-north-1:544820269502:workgroup/athena-datacatalog"]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      },
      {
        Sid    = "AthenaDataCatalog"
        Effect = "Allow"
        Action = ["athena:GetDataCatalog"]
        Resource = [
          "arn:aws:athena:eu-north-1:544820269502:workgroup/athena-datacatalog",
          "arn:aws:athena:eu-north-1:544820269502:datacatalog/*"
        ]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      },
      {
        Sid    = "Glue"
        Effect = "Allow"
        Action = [
          "glue:CreateDatabase", "glue:DeleteDatabase", "glue:GetDatabase", "glue:GetDatabases", "glue:UpdateDatabase",
          "glue:CreateTable", "glue:DeleteTable", "glue:BatchDeleteTable", "glue:UpdateTable", "glue:GetTable", "glue:GetTables",
          "glue:BatchCreatePartition", "glue:CreatePartition", "glue:DeletePartition", "glue:BatchDeletePartition",
          "glue:UpdatePartition", "glue:GetPartition", "glue:GetPartitions", "glue:BatchGetPartition"
        ]
        Resource = ["*"]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      },
      {
        Sid    = "S3Bucket"
        Effect = "Allow"
        Action = ["s3:GetBucketLocation"]
        Resource = [
          "${var.athena_results_bucket_arn}/*",
          var.athena_results_bucket_arn
        ]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      },
      {
        Sid      = "S3AccessGrants"
        Effect   = "Allow"
        Action   = ["s3:GetDataAccess", "s3:GetAccessGrantsInstanceForPrefix"]
        Resource = ["arn:aws:s3:eu-north-1:544820269502:access-grants/default"]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      },
      {
        Sid      = "Lakeformation"
        Effect   = "Allow"
        Action   = ["lakeformation:GetDataAccess"]
        Resource = ["*"]
        Condition = {
          StringEquals = { "aws:ResourceAccount" = "544820269502" }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lakeformation_AdminAccess" {
  name        = "LakeFormationCustomAdminPolicy"
  description = "Politica personalizada para administrar Lake Formation sin bloqueos"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSLakeFormationDataAdminAllow"
        Effect = "Allow"
        Action = [
          "lakeformation:*",
          "lakeformation:PutDataLakeSettings",
          "cloudtrail:DescribeTrails",
          "cloudtrail:LookupEvents",
          "glue:CreateCatalog",
          "glue:UpdateCatalog",
          "glue:DeleteCatalog",
          "glue:GetCatalog",
          "glue:GetCatalogs",
          "glue:GetDatabase",
          "glue:GetDatabases",
          "glue:CreateDatabase",
          "glue:UpdateDatabase",
          "glue:DeleteDatabase",
          "glue:GetConnections",
          "glue:SearchTables",
          "glue:GetTable",
          "glue:CreateTable",
          "glue:UpdateTable",
          "glue:DeleteTable",
          "glue:GetTableVersions",
          "glue:GetPartitions",
          "glue:GetTables",
          "glue:ListWorkflows",
          "glue:BatchGetWorkflows",
          "glue:DeleteWorkflow",
          "glue:GetWorkflowRuns",
          "glue:StartWorkflowRun",
          "glue:GetWorkflow",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets",
          "s3:GetBucketAcl",
          "iam:ListUsers",
          "iam:ListRoles",
          "iam:GetRole",
          "iam:GetRolePolicy"
        ]
        Resource = "*"
      }
    ]
  })
}
