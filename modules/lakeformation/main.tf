data "aws_caller_identity" "grau" {}

resource "aws_lakeformation_data_lake_settings" "settings" {
  admins = [
    data.aws_caller_identity.grau.arn
  ]

  # Al omitir create_database_default_permissions y create_table_default_permissions,
  # se eliminan los permisos IAMAllowedPrincipals por defecto para nuevos recursos.
  # Esto fuerza governance estricta de Lake Formation.
}

# --- REGISTRO DEL BUCKET RAÍZ ---
# Se registra todo el bucket en vez de subfolders individuales.
# AWS normaliza los ARNs quitando trailing slashes, por lo que registrar
# el bucket raíz es más limpio y evita problemas de matching.
resource "aws_lakeformation_resource" "datalake_bucket_registration" {
  arn      = var.s3_bucket_arn
  role_arn = var.lakeformation_service_role_arn
}


# --- PERMISOS DE BASE DE DATOS ---

# El Job de Glue (AWSGlueServiceRole) y el rol del Crawler (S3) necesitan crear y describir
resource "aws_lakeformation_permissions" "database_glue_permissions" {
  for_each    = toset([var.glue_service_role_arn, var.glue_job_role_arn, var.glue_s3_role_arn])
  principal   = each.key
  permissions = ["ALL"]

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


# --- PERMISOS DE TABLAS ---

# Los procesos ETL necesitan leer, escribir, alterar y borrar tablas
resource "aws_lakeformation_permissions" "tables_glue_permissions" {
  for_each    = toset([var.glue_service_role_arn, var.glue_job_role_arn, var.glue_s3_role_arn])
  principal   = each.key
  permissions = ["ALL"]

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
    var.glue_service_role_arn,
    var.glue_job_role_arn,
    var.glue_s3_role_arn,
    var.grafana_task_role_arn
  ]
}

resource "aws_lakeformation_permissions" "location_datalake" {
  for_each    = toset(local.location_principals)
  principal   = each.key
  permissions = ["DATA_LOCATION_ACCESS"]
  data_location { arn = aws_lakeformation_resource.datalake_bucket_registration.arn }
}
