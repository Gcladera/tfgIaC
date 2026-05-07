output "efs_id" {
  description = "The ID of the EFS file system"
  value       = aws_efs_file_system.grafana_efs.id
}

output "access_point_id" {
  description = "The ID of the EFS access point"
  value       = aws_efs_access_point.grafana_efs_ap.id
}
