resource "aws_glue_crawler" "bronze-crypto-market_ranking" {
  name          = "bronze-crypto-market_ranking"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/bronze/crypto-bronze/market-ranking-bronze/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "bronze-crypto-sentiment" {
  name          = "bronze-crypto-sentiment"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/bronze/crypto-bronze/sentiment-bronze/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "bronze-crypto-trending" {
  name          = "bronze-crypto-trending"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/bronze/crypto-bronze/trending-bronze/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "bronze-posts-content" {
  name          = "bronze-posts-content"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for posts content"
  s3_target {
    path = "s3://amzn-s3-tfgdl/bronze/posts-bronze/post-content-bronze/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
}

resource "aws_glue_crawler" "silver-crypto-market_ranking" {
  name          = "silver-crypto-market_ranking-copy"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/silver/crypto-silver/market-ranking-silver/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "silver-crypto-sentiment" {
  name          = "silver-crypto-sentiment"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/silver/crypto-silver/sentiment-silver/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "silver-crypto-trending" {
  name          = "silver-crypto-trending"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/silver/crypto-silver/trending-silver/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "silver-posts-content" {
  name          = "silver-posts-content"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for posts content"
  s3_target {
    path = "s3://amzn-s3-tfgdl/silver/posts-silver/post-content-silver/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
}

resource "aws_glue_crawler" "silver-posts-relationships" {
  name          = "silver-posts-relationships"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for social media accounts relationships"
  s3_target {
    path = "s3://amzn-s3-tfgdl/silver/posts-silver/social-media-relationships-silver/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
}

resource "aws_glue_crawler" "gold-posts-relationships" {
  name          = "gold-posts-relationships"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for social media accounts relationships"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/posts-gold/neo4j/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
}

resource "aws_glue_crawler" "gold-crypto-market_ranking" {
  name          = "gold-crypto-market_ranking"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/crypto-gold/market-ranking-gold/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "gold-crypto-sentiment" {
  name          = "gold-crypto-sentiment"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/crypto-gold/sentiment-gold/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "gold-crypto-trending" {
  name          = "gold-crypto-trending"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for crypto data"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/crypto-gold/trending-gold/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
resource "aws_glue_crawler" "gold-posts-content" {
  name          = "gold-posts-content"
  database_name = "glue-crawler-schema-database"
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for posts content"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/posts-gold/post-content-gold/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
}

#Glue data catalog
#-----------------------

resource "aws_glue_catalog_database" "schema_database" {
  name        = "glue-crawler-schema-database"
  catalog_id  = "544820269502"
  description = "Contenedor de Metadatos: Es una carpeta virtual donde el Crawler guardará las definiciones de las tablas (esquemas, formatos y rutas) que encuentre en tu S3 o base de datos origen. Organización: Permite que herramientas como Amazon Athena o Amazon Redshift Spectrum sepan dónde buscar las tablas para hacer consultas SQL."

}
#ETL Job
#----------------------- 
resource "aws_glue_job" "JobsETLPostsBronzeSilver" {
  name              = "JobsETLPostsBronzeSIlver.py"
  role_arn          = var.glue_service_role_arn
  glue_version      = "5.0"
  worker_type       = "G.1X"
  number_of_workers = 10

  command {
    script_location = "s3://aws-glue-assets-544820269502-eu-north-1/scripts/JobsETLPostsBronzeSIlver.py"
  }

  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-544820269502-eu-north-1/temporary/"
    "--conf"                         = "spark.eventLog.rolling.enabled=true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-544820269502-eu-north-1/sparkHistoryLogs/"
  }
}

resource "aws_glue_job" "relationshipsBronzeSilver" {
  name              = "relationshipsBronzeSilver.py"
  role_arn          = var.glue_service_role_arn
  glue_version      = "5.0"
  worker_type       = "G.1X"
  number_of_workers = 10

  command {
    script_location = "s3://aws-glue-assets-544820269502-eu-north-1/scripts/relationshipsBronzeSilver.py"
  }

  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-544820269502-eu-north-1/temporary/"
    "--conf"                         = "spark.eventLog.rolling.enabled=true"
    "--enable-auto-scaling"          = "true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-544820269502-eu-north-1/sparkHistoryLogs/"
  }
}

resource "aws_glue_job" "ETLjobCryptoBronzeSilver" {
  name              = "ETLjobCryptoBronzeSilver"
  role_arn          = var.glue_service_role_arn
  glue_version      = "5.0"
  worker_type       = "G.1X"
  number_of_workers = 10

  command {
    script_location = "s3://aws-glue-assets-544820269502-eu-north-1/scripts/ETLjobCryptoBronzeSilver.py"
  }

  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-544820269502-eu-north-1/temporary/"
    "--conf"                         = "spark.eventLog.rolling.enabled=true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-544820269502-eu-north-1/sparkHistoryLogs/"
  }
}
