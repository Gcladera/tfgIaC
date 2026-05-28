output "schema_database_name" {
  value = aws_glue_catalog_database.schema_database.name
}

output "glue_workflow_bronze_arn" {
  value = aws_glue_workflow.bronze_crawlers_workflow.arn
}
output "glue_workflow_silver_arn" {
  value = aws_glue_workflow.silver_crawlers_workflow.arn
}
output "glue_workflow_gold_arn" {
  value = aws_glue_workflow.gold_crawlers_workflow.arn
}
