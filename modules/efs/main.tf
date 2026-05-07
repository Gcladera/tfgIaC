resource "aws_efs_file_system" "grafana_efs" {
        availability_zone_id            = null
        availability_zone_name          = null
        creation_token                  = "console-23965ce2-f07c-4e1f-b53c-2784dde1de0c"
        encrypted                       = true
        kms_key_id                      = "arn:aws:kms:eu-north-1:544820269502:key/780b48f3-01e1-48fc-a6ce-e21f7dbaab37"
        performance_mode                = "generalPurpose"
        provisioned_throughput_in_mibps = 0
        region                          = "eu-north-1"
        tags                            = {
            "Name"    = "grafana-efs"
            "grafana" = "efs"
        }
        tags_all                        = {
            "Name"    = "grafana-efs"
            "grafana" = "efs"
        }
        throughput_mode                 = "elastic"

        protection {
            replication_overwrite = "ENABLED"
        }

}

resource "aws_efs_access_point" "grafana_efs_ap" {
  file_system_id = aws_efs_file_system.grafana_efs.id

  posix_user {
    gid = 472
    uid = 472
  }
  tags            = {
    Name    = "grafana-efs-ap"
    grafana = "efs"
  }
  tags_all        = {
    Name    = "grafana-efs-ap"
    grafana = "efs"
  }
  root_directory {
    path = "/grafana-data"
    creation_info {
      owner_gid   = 472
      owner_uid   = 472
      permissions = "0755"
    }
  }
}