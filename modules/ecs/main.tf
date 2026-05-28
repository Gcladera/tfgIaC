data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_ecs_cluster" "Grafana-ECS-cluster" {
  name   = "Grafana-ECS-cluster"
  region = data.aws_region.current.region
  configuration {
    execute_command_configuration {
      kms_key_id = null
      logging    = "DEFAULT"
    }
  }
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_service" "grafana" {
  name                    = "grafana-task-service-hdxytfxw"
  cluster                 = aws_ecs_cluster.Grafana-ECS-cluster.arn
  task_definition         = "grafana-task:9"
  desired_count           = 1
  launch_type             = "FARGATE"
  enable_ecs_managed_tags = true

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = var.ecs_security_group_ids
    subnets          = ["subnet-0969d0a4fa4582b70"]
  }
}

resource "aws_ecs_task_definition" "grafana_task" {
  container_definitions = jsonencode([{
    environment = [{
      name  = "GF_AWS_PROFILES"
      value = "default"
      }, {
      name  = "GF_INSTALL_PLUGINS"
      value = "grafana-athena-datasource"
    }]
    environmentFiles = []
    essential        = true
    image            = "grafana/grafana:latest"
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"
        awslogs-group         = "/ecs/grafana-task"
        awslogs-region        = data.aws_region.current.region
        awslogs-stream-prefix = "ecs"
      }
      secretOptions = []
    }
    mountPoints = [{
      containerPath = "/var/lib/grafana"
      readOnly      = false
      sourceVolume  = "grafana-efs"
    }]
    name = "grafana"
    portMappings = [{
      appProtocol   = "http"
      containerPort = 3000
      hostPort      = 3000
      name          = "grafana-3000-tcp"
      protocol      = "tcp"
    }]
    systemControls = []
    ulimits        = []
    volumesFrom    = []
  }])
  cpu                      = "512"
  enable_fault_injection   = false
  execution_role_arn       = var.execution_role_arn
  family                   = "grafana-task"
  ipc_mode                 = null
  memory                   = "1024"
  network_mode             = "awsvpc"
  pid_mode                 = null
  region                   = data.aws_region.current.region
  requires_compatibilities = ["FARGATE"]
  skip_destroy             = null
  tags                     = {}
  tags_all                 = {}
  task_role_arn            = var.task_role_arn
  track_latest             = false
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
  volume {
    configure_at_launch = false
    host_path           = null
    name                = "grafana-efs"
    efs_volume_configuration {
      file_system_id          = var.efs_file_system_id
      root_directory          = "/"
      transit_encryption      = "ENABLED"
      transit_encryption_port = 0
      authorization_config {
        access_point_id = var.efs_access_point_id
        iam             = "ENABLED"
      }
    }
  }
}
