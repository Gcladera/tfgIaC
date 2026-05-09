output "ecs_grafana_execution_role_arn" {
  description = "ARN for ECS Grafana Execution Role"
  value       = aws_iam_role.ecs_grafana_execution.arn
}

output "grafana_ecs_task_execution_role_arn" {
  description = "ARN for Grafana ECS Task Execution Role"
  value       = aws_iam_role.grafana_ecs_task_execution.arn
}


output "glue_service_role_arn" {
  value = aws_iam_role.glue_service_role.arn
}

output "glue_s3_role_arn" {
  value = aws_iam_role.glue_s3_role.arn
}

output "lambda_gecko_role_arn" {
  value = aws_iam_role.lambda_gecko.arn
}

output "lambda_posts_role_arn" {
  value = aws_iam_role.lambda_posts.arn
}

output "lambda_silver_role_arn" {
  description = "ARN for Lambda Silver Role"
  value       = aws_iam_role.lambda_silver.arn
}

output "eventbridge_scheduler_lambda_1_role_arn" {
  value = aws_iam_role.eventbridge_scheduler_lambda_1.arn
}

output "eventbridge_scheduler_lambda_2_role_arn" {
  value = aws_iam_role.eventbridge_scheduler_lambda_2.arn
}

output "eventbridge_scheduler_lambda_3_role_arn" {
  description = "ARN for EventBridge Scheduler Lambda 3 Role"
  value       = aws_iam_role.eventbridge_scheduler_lambda_3.arn
}

output "eventbridge_scheduler_lambda_4_role_arn" {
  description = "ARN for EventBridge Scheduler Lambda 4 Role"
  value       = aws_iam_role.eventbridge_scheduler_lambda_4.arn
}