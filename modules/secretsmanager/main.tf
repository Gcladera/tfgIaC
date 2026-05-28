resource "aws_secretsmanager_secret" "blue_sky_api" {
    description                    = null
    force_overwrite_replica_secret = false
    name                           = "BlueSkyAPICredentials"
    name_prefix                    = null
    policy                         = null
    recovery_window_in_days        = 30
    tags                           = {}
    tags_all                       = {}
}

resource "aws_secretsmanager_secret" "crypto_api" {
    description                    = null
    force_overwrite_replica_secret = false
    name                           = "CryptoAPICredentials"
    name_prefix                    = null
    policy                         = null
    recovery_window_in_days        = 30
    tags                           = {}
    tags_all                       = {}
}

resource "aws_secretsmanager_secret_version" "blue_sky_api" {
  lifecycle { ignore_changes = [secret_string] }
  secret_id = aws_secretsmanager_secret.blue_sky_api.id
  version_stages = ["AWSCURRENT"]
}

resource "aws_secretsmanager_secret_version" "crypto_api" {
  lifecycle { ignore_changes = [secret_string] }
  secret_id = aws_secretsmanager_secret.crypto_api.id
  version_stages = ["AWSCURRENT"]
}