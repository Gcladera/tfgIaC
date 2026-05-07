module "s3" {
  source = "../../modules/s3"
}

module "lambda" {
  source                = "../../modules/lambda"
  lambda_gecko_role_arn = module.iam.lambda_gecko_role_arn
  lambda_posts_role_arn = module.iam.lambda_posts_role_arn
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
}

module "ecs" {
  source                 = "../../modules/ecs"
  execution_role_arn     = module.iam.ecs_grafana_execution_role_arn
  task_role_arn          = module.iam.grafana_ecs_task_execution_role_arn
  ecs_security_group_ids = [aws_security_group.grafana_sg.id]
  ecs_subnet_ids         = ["subnet-0969d0a4fa4582b70"]
  efs_file_system_id     = module.efs.efs_id
  efs_access_point_id    = module.efs.access_point_id
}

module "efs" {
  source = "../../modules/efs"
}

module "iam" {
  source = "../../modules/iam"
}
module "vpc" {
  source = "../../modules/vpc"
}

provider "aws" {
    region = "eu-north-1"
}

