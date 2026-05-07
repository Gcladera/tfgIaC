variable "execution_role_arn" {
  description = "Execution role ARN for the ECS task"
  type        = string
}

variable "task_role_arn" {
  description = "Task role ARN for the ECS task"
  type        = string
}

variable "ecs_security_group_ids" {
  description = "List of security group IDs for the ECS service"
  type        = list(string)
}

variable "ecs_subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "efs_file_system_id" {
  description = "The ID of the EFS file system"
  type        = string
}

variable "efs_access_point_id" {
  description = "The ID of the EFS access point"
  type        = string
}
