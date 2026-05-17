resource "aws_athena_workgroup" "primary" {
  description   = null
  force_destroy = false
  name          = "primary"
  region        = "eu-north-1"
  state         = "ENABLED"
  tags          = {}
  tags_all      = {}
  configuration {
    bytes_scanned_cutoff_per_query          = 0
    enable_minimum_encryption_configuration = false
    enforce_workgroup_configuration         = true
    execution_role                          = null
    publish_cloudwatch_metrics_enabled      = true
    requester_pays_enabled                  = false
    engine_version {
      selected_engine_version = "AUTO"
    }
    managed_query_results_configuration {
      enabled = false
    }
    result_configuration {
      expected_bucket_owner = null
      output_location       = "s3://s3-athena-query-results-tfgdl/"
    }
  }
}