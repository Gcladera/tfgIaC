resource "aws_ecs_service" "grafana" {
  name                    = "grafana-task-service-hdxytfxw"
  cluster                 = "arn:aws:ecs:eu-north-1:544820269502:cluster/Grafana-ECS-cluster"
  task_definition         = "grafana-task:9"
  desired_count           = 0
  launch_type             = "FARGATE"
  enable_ecs_managed_tags = true

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = ["sg-0f99122693a71ba73"]
    subnets          = ["subnet-0969d0a4fa4582b70"]
  }
}