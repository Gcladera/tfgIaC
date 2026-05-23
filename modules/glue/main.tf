resource "aws_glue_crawler" "bronze-crypto-market_ranking" {
  name          = "bronze-crypto-market_ranking"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

resource "aws_glue_crawler" "bronze-crypto-sentiment" {
  name          = "bronze-crypto-sentiment"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "bronze-crypto-trending" {
  name          = "bronze-crypto-trending"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "bronze-posts-content" {
  name          = "bronze-posts-content"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

resource "aws_glue_crawler" "silver-crypto-market_ranking" {
  name          = "silver-crypto-market_ranking-copy"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "silver-crypto-sentiment" {
  name          = "silver-crypto-sentiment"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "silver-crypto-trending" {
  name          = "silver-crypto-trending"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "silver-posts-content" {
  name          = "silver-posts-content"
  database_name = aws_glue_catalog_database.schema_database.name
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
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

resource "aws_glue_crawler" "silver-posts-relationships" {
  name          = "silver-posts-relationships"
  database_name = aws_glue_catalog_database.schema_database.name
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
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

resource "aws_glue_crawler" "gold-posts-nodes" {
  name          = "gold-posts-nodes"
  database_name = aws_glue_catalog_database.schema_database.name
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for social media accounts nodes"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/posts-gold/neo4j/nodes/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "gold-posts-relationships" {
  name          = "gold-posts-relationships"
  database_name = aws_glue_catalog_database.schema_database.name
  role          = var.glue_s3_role_arn
  description   = "a crawler to create a datacatalog for social media accounts relationships"
  s3_target {
    path = "s3://amzn-s3-tfgdl/gold/posts-gold/neo4j/relationships/"
  }
  configuration = jsonencode({
    Version              = 1.0
    CreatePartitionIndex = true
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
  })
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

resource "aws_glue_crawler" "gold-crypto-market_ranking" {
  name          = "gold-crypto-market_ranking"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "gold-crypto-sentiment" {
  name          = "gold-crypto-sentiment"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "gold-crypto-trending" {
  name          = "gold-crypto-trending"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}
resource "aws_glue_crawler" "gold-posts-content" {
  name          = "gold-posts-content"
  database_name = aws_glue_catalog_database.schema_database.name
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
  recrawl_policy {
    recrawl_behavior = "CRAWL_NEW_FOLDERS_ONLY"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  lake_formation_configuration {
    use_lake_formation_credentials = true
  }
}

#Glue data catalog
#-----------------------

resource "aws_glue_catalog_database" "schema_database" {
  name        = "glue-crawler-schema"
  catalog_id  = "544820269502"
  description = "Contenedor de Metadatos: carpeta virtual donde el Crawler guardará las definiciones de las tablas (esquemas, formatos y rutas) que encuentre en tu S3 o base de datos origen. Organización: Permite que herramientas como Amazon Athena o Amazon Redshift Spectrum sepan dónde buscar las tablas para hacer consultas SQL."

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
    "--conf"                         = "spark.eventLog.rolling.enabled=true --conf spark.sql.catalog.glue_catalog.glue.skip-name-validation=true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-enable"
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
    "--conf"                         = "spark.eventLog.rolling.enabled=true --conf spark.sql.catalog.glue_catalog.glue.skip-name-validation=true"
    "--enable-auto-scaling"          = "true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-enable"
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
    "--conf"                         = "spark.eventLog.rolling.enabled=true --conf spark.sql.catalog.glue_catalog.glue.skip-name-validation=true"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-enable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-544820269502-eu-north-1/sparkHistoryLogs/"
  }
}

resource "aws_glue_data_quality_ruleset" "dq_market_ranking_bronze" {
  name        = "dq-rules-market-ranking-bronze"
  description = "Regles de qualitat per a market_ranking_bronze"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "market-ranking-bronze"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0

    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_sentiment_bronze" {
  name        = "dq-rules-sentiment-bronze"
  description = "Regles de qualitat per a sentiment-bronze"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "sentiment-bronze"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0

    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_trending_bronze" {
  name        = "dq-rules-trending-bronze"
  description = "Regles de qualitat per a trending-bronze"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "trending-bronze"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0

    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_post_content_bronze" {
  name        = "dq-rules-post-content-bronze"
  description = "Regles de qualitat per a post-content-bronze"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "post-content-bronze"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0

    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_market_ranking_silver" {
  name        = "dq-rules-market-ranking-silver"
  description = "Regles de qualitat per a market_ranking_silver"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "market_ranking_silver"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      ColumnDataType "current_price" = "Double",
      ColumnValues "current_price" >= 0.0,
      ColumnValues "market_cap" >= 0.0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_trending_silver" {
  name        = "dq-rules-trending-silver"
  description = "Regles de qualitat per a trending_silver"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "trending_silver"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      ColumnDataType "current_price" = "Double",
      ColumnValues "current_price" >= 0.0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_posts_content_silver" {
  name        = "dq-rules-posts-content-silver"
  description = "Regles de qualitat per a posts_content_silver"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "posts_content_silver"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "id",
      IsComplete "cid",
      IsComplete "author_handle",
      ColumnValues "like_count" >= 0,
      ColumnValues "reply_count" >= 0,
      ColumnValues "repost_count" >= 0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_social_media_relationships_silver" {
  name        = "dq-rules-social-media-relationships-silver"
  description = "Regles de qualitat per a social_media_relationships_silver"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "social_media_relationships_silver"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "id",
      IsComplete "author_handle",
      IsComplete "author_did",
      ColumnValues "like_count" >= 0,
      ColumnValues "reply_count" >= 0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_market_ranking_gold" {
  name        = "dq-rules-market-ranking-gold"
  description = "Regles de qualitat per a market_ranking_gold"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "market_ranking_gold"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      ColumnDataType "current_price" = "Double",
      ColumnValues "current_price" >= 0.0,
      ColumnValues "market_cap" >= 0.0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_trending_gold" {
  name        = "dq-rules-trending-gold"
  description = "Regles de qualitat per a trending_gold"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "trending_gold"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      ColumnDataType "current_price" = "Double",
      ColumnValues "current_price" >= 0.0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_sentiment_gold" {
  name        = "dq-rules-sentiment-gold"
  description = "Regles de qualitat per a sentiment_gold"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "sentiment_gold"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "sentiment_up_percentage",
      ColumnValues "sentiment_up_percentage" >= 0.0,
      ColumnValues "sentiment_up_percentage" <= 100.0,
      IsComplete "sentiment_down_percentage",
      ColumnValues "sentiment_down_percentage" >= 0.0,
      ColumnValues "sentiment_down_percentage" <= 100.0,
      IsComplete "watchlist_count",
      ColumnValues "watchlist_count" >= 0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_score_by_crypto_gold" {
  name        = "dq-rules-score-by-crypto-gold"
  description = "Regles de qualitat per a score_by_crypto_gold"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "score_by_crypto_gold"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "sentiment_up_percentage",
      ColumnValues "sentiment_up_percentage" >= 0.0,
      ColumnValues "sentiment_up_percentage" <= 100.0,
      IsComplete "sentiment_down_percentage",
      ColumnValues "sentiment_down_percentage" >= 0.0,
      ColumnValues "sentiment_down_percentage" <= 100.0,
      IsComplete "watchlist_count",
      ColumnValues "watchlist_count" >= 0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_posts_gold_neo4j_nodes" {
  name        = "dq-rules-posts-gold-neo4j-nodes"
  description = "Regles de qualitat per als nodes de Neo4j (Gold)"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "posts_gold_neo4j_nodes"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "id",
      IsComplete "author_handle",
      ColumnValues "like_count" >= 0,
      ColumnValues "reply_count" >= 0,
      ColumnValues "repost_count" >= 0
    ]
  EOF
}

resource "aws_glue_data_quality_ruleset" "dq_posts_gold_neo4j_relationships" {
  name        = "dq-rules-posts-gold-neo4j-relationships"
  description = "Regles de qualitat per a les relacions de Neo4j (Gold)"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "posts_gold_neo4j_relationships"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "id",
      IsComplete "author_did",
      ColumnValues "like_count" >= 0,
      ColumnValues "repost_count" >= 0
    ]
  EOF
}


resource "aws_glue_data_quality_ruleset" "dq_post_content_gold" {
  name        = "dq-rules-post-content-gold"
  description = "Regles de qualitat per a post_content_gold"
  target_table {
    database_name = aws_glue_catalog_database.schema_database.name
    table_name    = "post_content_gold"
  }
  ruleset = <<-EOF
    Rules = [
      RowCount > 0,
      IsComplete "id",
      IsComplete "cid",
      IsComplete "author_handle",
      ColumnValues "like_count" >= 0,
      ColumnValues "reply_count" >= 0,
      ColumnValues "repost_count" >= 0
    ]
  EOF
}

