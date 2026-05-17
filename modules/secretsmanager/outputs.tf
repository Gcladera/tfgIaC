output "blue_sky_api_arn" {
  value = aws_secretsmanager_secret.blue_sky_api.arn
}

output "crypto_api_arn" {
  value = aws_secretsmanager_secret.crypto_api.arn
}
