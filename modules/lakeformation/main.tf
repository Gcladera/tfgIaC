resource "aws_lakeformation_data_lake_settings" "lakeformation-settings" {
  admins                                = ["arn:aws:iam::544820269502:root", "arn:aws:iam::544820269502:user/grau_cladera"]
  allow_external_data_filtering         = false
  allow_full_table_external_data_access = false
  authorized_session_tag_value_list     = []
  catalog_id                            = null
  external_data_filtering_allow_list    = []
  parameters = {
    CROSS_ACCOUNT_VERSION = "1"
    SET_CONTEXT           = "TRUE"
  }
  read_only_admins        = []
  region                  = "eu-north-1"
  trusted_resource_owners = []
}

