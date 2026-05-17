module "s3" {
  source = "../../modules/s3"
}

module "lambda" {
  source                    = "../../modules/lambda"
  lambda_gecko_role_arn     = module.iam.lambda_gecko_role_arn
  lambda_posts_role_arn     = module.iam.lambda_posts_role_arn
  lambda_private_subnet_ids = module.vpc.private_subnet_ids
  lambda_security_group_ids        = [aws_security_group.lambda-bronze.id]
  lambda_silver_role_arn           = module.iam.lambda_silver_role_arn
  lambda_silver_security_group_ids = [aws_security_group.lambda_silver_sg.id]
}

module "glue" {
  source                = "../../modules/glue"
  glue_service_role_arn = module.iam.glue_service_role_arn
  glue_s3_role_arn      = module.iam.glue_s3_role_arn
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
  source = "../../modules/iam"
  blue_sky_api_arn     = module.secretsmanager.blue_sky_api_arn
  crypto_api_arn       = module.secretsmanager.crypto_api_arn
  schema_database_name = module.glue.schema_database_name
  datalake_bucket_arn  = module.s3.datalake_bucket_arn
}
module "vpc" {
  source = "../../modules/vpc"
}

module "athena" {
  source = "../../modules/athena"
}

provider "aws" {
  region = "eu-north-1"
}

module "secretsmanager" {
  source = "../../modules/secretsmanager"
}

module "lakeformation" {
  source                         = "../../modules/lakeformation"
  s3_bucket_arn                  = module.s3.datalake_bucket_arn
  lakeformation_service_role_arn = module.iam.lakeformation_service_role_arn
  glue_service_role_arn          = module.iam.glue_service_role_arn
  glue_job_role_arn              = module.iam.glue_service_role_arn
  glue_s3_role_arn               = module.iam.glue_s3_role_arn
  glue_database_name             = module.glue.schema_database_name
  grafana_task_role_arn          = module.iam.grafana_ecs_task_execution_role_arn
}