terraform {
  required_version = ">= 1.9.0"

  backend "s3" {
    bucket       = "terraform-state-tfgdl"
    key          = "global/s3/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

module "s3" {
  source = "../../modules/s3"
}

module "lambda" {
  source                           = "../../modules/lambda"
  lambda_gecko_role_arn            = module.iam.lambda_gecko_role_arn
  lambda_posts_role_arn            = module.iam.lambda_posts_role_arn
  lambda_private_subnet_ids        = module.vpc.private_subnet_ids
  lambda_security_group_ids        = [aws_security_group.lambda-bronze.id]
  lambda_silver_role_arn           = module.iam.lambda_silver_role_arn
  lambda_silver_security_group_ids = [aws_security_group.lambda_silver_sg.id]
}

module "glue" {
  source                  = "../../modules/glue"
  glue_service_role_arn   = module.iam.glue_service_role_arn
  glue_s3_role_arn        = module.iam.glue_s3_role_arn
  datalake_bucket_name    = module.s3.datalake_bucket_name
  glue_assets_bucket_name = module.s3.glue_assets_bucket_name
}


module "eventbridge" {
  source                                  = "../../modules/eventbridge"
  lambda_gecko_function_arn               = module.lambda.lambda_gecko_function_arn
  lambda_posts_function_arn               = module.lambda.lambda_posts_function_arn
  eventbridge_scheduler_lambda_1_role_arn = module.iam.eventbridge_scheduler_lambda_1_role_arn
  eventbridge_scheduler_lambda_2_role_arn = module.iam.eventbridge_scheduler_lambda_2_role_arn
  eventbridge_scheduler_lambda_3_role_arn = module.iam.eventbridge_scheduler_lambda_3_role_arn
  eventbridge_scheduler_lambda_4_role_arn = module.iam.eventbridge_scheduler_lambda_4_role_arn
  lambda_gecko_silver_function_arn        = module.lambda.lambda_gecko_silver_function_arn
  lambda_posts_silver_function_arn        = module.lambda.lambda_posts_silver_function_arn
  s3_datalake                             = module.s3.datalake_bucket_name
  glue_workflow_bronze_arn                = module.glue.glue_workflow_bronze_arn
  glue_workflow_silver_arn                = module.glue.glue_workflow_silver_arn
  glue_workflow_gold_arn                  = module.glue.glue_workflow_gold_arn
  eventbridge_bronze_crawler_role_arn     = module.iam.eventbridge_bronze_crawler_role_arn
  eventbridge_silver_crawler_role_arn     = module.iam.eventbridge_silver_crawler_role_arn
  eventbridge_gold_crawler_role_arn       = module.iam.eventbridge_gold_crawler_role_arn
}

module "ecs" {
  source                 = "../../modules/ecs"
  execution_role_arn     = module.iam.ecs_grafana_execution_role_arn
  task_role_arn          = module.iam.grafana_ecs_task_execution_role_arn
  ecs_security_group_ids = [aws_security_group.grafana_sg.id]
  ecs_subnet_ids         = module.vpc.public_subnet_ids
  efs_file_system_id     = module.efs.efs_id
  efs_access_point_id    = module.efs.access_point_id
}

module "efs" {
  source = "../../modules/efs"
}

module "iam" {
  source                    = "../../modules/iam"
  blue_sky_api_arn          = module.secretsmanager.blue_sky_api_arn
  crypto_api_arn            = module.secretsmanager.crypto_api_arn
  schema_database_name      = module.glue.schema_database_name
  datalake_bucket_arn       = module.s3.datalake_bucket_arn
  athena_results_bucket_arn = module.s3.athena_results_bucket_arn
  glue_workflow_bronze_arn  = module.glue.glue_workflow_bronze_arn
  glue_workflow_silver_arn  = module.glue.glue_workflow_silver_arn
  glue_workflow_gold_arn    = module.glue.glue_workflow_gold_arn
}
module "vpc" {
  source = "../../modules/vpc"
}

module "athena" {
  source                     = "../../modules/athena"
  athena_results_bucket_name = module.s3.athena_results_bucket_name
}

provider "aws" {
  region = var.aws_region
}

module "secretsmanager" {
  source = "../../modules/secretsmanager"
}

module "lakeformation" {
  source                              = "../../modules/lakeformation"
  datalake_bucket_arn                 = module.s3.datalake_bucket_arn
  schema_database_name                = module.glue.schema_database_name
  lakeformation_service_role_arn      = module.iam.lakeformation_service_role_arn
  lambda_posts_role_arn               = module.iam.lambda_posts_role_arn
  lambda_gecko_role_arn               = module.iam.lambda_gecko_role_arn
  lambda_silver_role_arn              = module.iam.lambda_silver_role_arn
  lambda_gecko_silver_role_arn        = module.iam.lambda_gecko_silver_role_arn
  grafana_ecs_task_execution_role_arn = module.iam.grafana_ecs_task_execution_role_arn
  glue_s3_role_arn                    = module.iam.glue_s3_role_arn
  athena_sql_role_arn                 = module.iam.athena_sql_role_arn
  glue_service_role_arn               = module.iam.glue_service_role_arn
}
