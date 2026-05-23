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

resource "aws_iam_role_policy" "grafana_ecs_task_athena_lakeformation" {
  name = "grafana-ecs-task-athena-lf"
  role = aws_iam_role.grafana_ecs_task_execution.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "athena:*",
          "glue:GetDatabase",
          "glue:GetDatabases",
          "glue:GetTable",
          "glue:GetTables",
          "glue:GetPartition",
          "glue:GetPartitions",
          "glue:BatchGetPartition",
          "lakeformation:GetDataAccess"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:ListMultipartUploadParts",
          "s3:AbortMultipartUpload",
          "s3:PutObject"
        ]
        Resource = [
          "arn:aws:s3:::s3-athena-query-results-tfgdl",
          "arn:aws:s3:::s3-athena-query-results-tfgdl/*",
          var.datalake_bucket_arn,
          "${var.datalake_bucket_arn}/*"
        ]
      }
    ]
  })
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

resource "aws_iam_user_policy_attachment" "grau_cladera_athena" {
  user       = aws_iam_user.grau_cladera.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
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

# Control d'accessos per a Lake Formation
resource "aws_iam_role" "lakeformation_service_role" {
  name = "LakeFormationServiceRole"
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


resource "aws_iam_role_policy_attachment" "lakeformation_s3_access" {
  role       = aws_iam_role.lakeformation_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
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

resource "aws_iam_role_policy_attachment" "glue_crawler_managed" {
  role       = aws_iam_role.glue_s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "glue_crawler_lakeformation_access" {
  name = "glue-crawler-lakeformation-access"
  role = aws_iam_role.glue_s3_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "lakeformation:GetDataAccess"
        Resource = "*"
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
