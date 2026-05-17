data "aws_caller_identity" "grau" {}

resource "aws_lakeformation_data_lake_settings" "settings" {
  admins = [
    data.aws_caller_identity.grau.arn,
    var.glue_service_role_arn # AWSGlueServiceRole ya tiene acceso TOTAL por ser Admin. No lo metas en ningún recurso de abajo.
  ]
}

# --- REGISTRO DE DIRECTORIOS ---
resource "aws_lakeformation_resource" "bronze_folder_registration" {
  arn      = "${var.s3_bucket_arn}/bronze"
  role_arn = var.lakeformation_service_role_arn
}

resource "aws_lakeformation_resource" "silver_folder_registration" {
  arn      = "${var.s3_bucket_arn}/silver"
  role_arn = var.lakeformation_service_role_arn
}

resource "aws_lakeformation_resource" "gold_folder_registration" {
  arn      = "${var.s3_bucket_arn}/gold"
  role_arn = var.lakeformation_service_role_arn
}


# --- PERMISOS DE BASE DE DATOS (Acotados para evitar el bucle "ALL") ---

# El Job de Glue y el rol S3 solo necesitan crear y describir
resource "aws_lakeformation_permissions" "database_glue_permissions" {
  for_each    = toset([var.glue_job_role_arn, var.glue_s3_role_arn])
  principal   = each.key
  permissions = ["CREATE_TABLE", "DESCRIBE"]

  database {
    name = var.glue_database_name
  }
}

# Grafana solo necesita saber que la base de datos existe
resource "aws_lakeformation_permissions" "database_grafana_permissions" {
  principal   = var.grafana_task_role_arn
  permissions = ["DESCRIBE"]

  database {
    name = var.glue_database_name
  }
}


# --- PERMISOS DE TABLAS (Acotados) ---

# Tus procesos de datos necesitan leer, escribir y ver esquemas (No borrar ni alterar tablas base)
resource "aws_lakeformation_permissions" "tables_glue_permissions" {
  for_each    = toset([var.glue_job_role_arn, var.glue_s3_role_arn])
  principal   = each.key
  permissions = ["SELECT", "INSERT", "DESCRIBE"]

  table {
    database_name = var.glue_database_name
    wildcard      = true
  }
}

# Grafana es estrictamente de solo lectura
resource "aws_lakeformation_permissions" "tables_grafana_permissions" {
  principal   = var.grafana_task_role_arn
  permissions = ["SELECT", "DESCRIBE"]

  table {
    database_name = var.glue_database_name
    wildcard      = true
  }
}


# --- PERMISOS DE UBICACIÓN DE DATOS (DATA LOCATION) ---
locals {
  location_principals = [
    data.aws_caller_identity.grau.arn,
    var.glue_job_role_arn,
    var.glue_s3_role_arn,
    var.grafana_task_role_arn
  ]
}

resource "aws_lakeformation_permissions" "location_bronze" {
  for_each    = toset(local.location_principals)
  principal   = each.key
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location { arn = aws_lakeformation_resource.bronze_folder_registration.arn }
}

resource "aws_lakeformation_permissions" "location_silver" {
  for_each    = toset(local.location_principals)
  principal   = each.key
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location { arn = aws_lakeformation_resource.silver_folder_registration.arn }
}

resource "aws_lakeformation_permissions" "location_gold" {
  for_each    = toset(local.location_principals)
  principal   = each.key
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location { arn = aws_lakeformation_resource.gold_folder_registration.arn }
}
