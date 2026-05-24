resource "aws_lakeformation_data_lake_settings" "lakeformation-settings" {
  admins                                = ["arn:aws:iam::544820269502:root", "arn:aws:iam::544820269502:user/grau_cladera"]
  allow_external_data_filtering         = false
  allow_full_table_external_data_access = false
  authorized_session_tag_value_list     = []
  catalog_id                            = null
  external_data_filtering_allow_list    = []
  parameters = {
    CROSS_ACCOUNT_VERSION = "1"
    SET_CONTEXT           = "TRUE"
  }
  read_only_admins        = []
  region                  = "eu-north-1"
  trusted_resource_owners = []
}

# AWSGlueServiceRole
resource "aws_lakeformation_permissions" "glue_service_role_bronze" {
  principal   = var.glue_service_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "glue_service_role_silver" {
  principal   = var.glue_service_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}
resource "aws_lakeformation_permissions" "glue_service_role_gold" {
  principal   = var.glue_service_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/gold"
  }
}
resource "aws_lakeformation_permissions" "glue_service_role_catalog" {
  principal   = var.glue_service_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/catalog"
  }
}
resource "aws_lakeformation_permissions" "glue_service_role_database" {
  principal                     = var.glue_service_role_arn
  permissions                   = ["ALL", "ALTER", "CREATE_TABLE", "DESCRIBE"]
  permissions_with_grant_option = ["ALL", "DESCRIBE"]
  database {
    name = var.schema_database_name
  }
}


# LakeFormationAssumeRoleS3
resource "aws_lakeformation_permissions" "lakeformation_assume_role_s3" {
  principal   = var.lakeformation_service_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = var.datalake_bucket_arn
  }
}

# lambda-posts-role-p6kfn5ls
resource "aws_lakeformation_permissions" "lambda_posts_bronze" {
  principal   = var.lambda_posts_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "lambda_posts_silver" {
  principal   = var.lambda_posts_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}

# lambda-gecko-role-d1cyk3hi
resource "aws_lakeformation_permissions" "lambda_gecko_bronze" {
  principal   = var.lambda_gecko_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "lambda_gecko_silver" {
  principal   = var.lambda_gecko_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}

# lambda-silver-role
resource "aws_lakeformation_permissions" "lambda_silver_bronze" {
  principal   = var.lambda_silver_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "lambda_silver_silver" {
  principal   = var.lambda_silver_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}

# lambda-gecko-silver-role-9npv16f5
resource "aws_lakeformation_permissions" "lambda_gecko_silver_bronze" {
  principal   = var.lambda_gecko_silver_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "lambda_gecko_silver_silver" {
  principal   = var.lambda_gecko_silver_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}

# grafana-ecsTaskExecutionRole
resource "aws_lakeformation_permissions" "grafana_bronze" {
  principal   = var.grafana_ecs_task_execution_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/bronze"
  }
}
resource "aws_lakeformation_permissions" "grafana_silver" {
  principal   = var.grafana_ecs_task_execution_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/silver"
  }
}
resource "aws_lakeformation_permissions" "grafana_gold" {
  principal   = var.grafana_ecs_task_execution_role_arn
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location {
    arn = "${var.datalake_bucket_arn}/gold"
  }
}

resource "aws_lakeformation_permissions" "grafana_describe_tables" {
  principal   = var.grafana_ecs_task_execution_role_arn
  permissions = ["SELECT", "DESCRIBE"]
  table {
    database_name = var.schema_database_name
    wildcard      = true
  }
}
resource "aws_lakeformation_permissions" "grafana_select_columns" {
  principal   = var.grafana_ecs_task_execution_role_arn
  permissions = ["SELECT", "DESCRIBE"]

  table {
    database_name = var.schema_database_name
    wildcard      = true
  }
}
# AWSAthenaSQLRole-mj4jb147
resource "aws_lakeformation_permissions" "athena_sql_database" {
  principal   = var.athena_sql_role_arn
  permissions = ["ALTER", "CREATE_TABLE", "DESCRIBE"]
  database {
    name = var.schema_database_name
  }
}

resource "aws_lakeformation_permissions" "athena_sql_all_tables" {
  principal                     = var.athena_sql_role_arn
  permissions                   = ["ALL"]
  permissions_with_grant_option = ["ALL"]
  table {
    database_name = var.schema_database_name
    wildcard      = true
  }
}

# AWSGlueServiceRole-S3TFG
locals {
  glue_s3_tables = ["trending_silver", "post_content_silver", "sentiment_bronze", "market_ranking_silver", "post_content_gold", "trending_gold", "sentiment_silver"]
}

resource "aws_lakeformation_permissions" "glue_s3_tables_all" {
  for_each                      = toset(local.glue_s3_tables)
  principal                     = var.glue_s3_role_arn
  permissions                   = ["ALL", "ALTER", "DELETE", "DESCRIBE", "DROP", "INSERT"]
  permissions_with_grant_option = ["ALL", "ALTER", "DELETE", "DESCRIBE", "DROP", "INSERT"]
  table {
    database_name = var.schema_database_name
    name          = each.value
  }
}

resource "aws_lakeformation_permissions" "glue_s3_columns_select" {
  for_each                      = toset(local.glue_s3_tables)
  principal                     = var.glue_s3_role_arn
  permissions                   = ["SELECT"]
  permissions_with_grant_option = ["SELECT"]
  table_with_columns {
    database_name = var.schema_database_name
    name          = each.value
    wildcard      = true
  }
}

# AWSServiceRoleForECS
resource "aws_lakeformation_permissions" "ecs_service_role_describe" {
  principal   = "arn:aws:iam::544820269502:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  permissions = ["DESCRIBE"]
  table {
    database_name = var.schema_database_name
    wildcard      = true
  }
}


resource "aws_lakeformation_permissions" "ecs_service_role_select" {
  principal   = "arn:aws:iam::544820269502:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  permissions = ["SELECT", "DESCRIBE"]

  table {
    database_name = var.schema_database_name
    wildcard      = true
  }
}
