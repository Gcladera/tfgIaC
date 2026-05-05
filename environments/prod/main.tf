module "s3" {
  source = "../../modules/s3"
}

module "lambda" {
  source = "../../modules/lambda"
}

module "glue" {
  source = "../../modules/glue"
}

module "eventbridge" {
  source = "../../modules/eventbridge"
}

module "ecs" {
  source = "../../modules/ecs"
}

provider "aws" {
    region = "eu-north-1"
}


import {
  to = module.ecs.aws_ecs_service.grafana
  id = "Grafana-ECS-cluster/grafana-task-service-hdxytfxw"
}
