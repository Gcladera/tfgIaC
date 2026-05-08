output "lambda_gecko_function_arn" {
  value = aws_lambda_function.crypto-api-call.arn
}

output "lambda_posts_function_arn" {
  value = aws_lambda_function.posts-api-call.arn
}

output "lambda_gecko_silver_function_arn" {
  value = aws_lambda_function.lambda-gecko-silver.arn
}

output "lambda_posts_silver_function_arn" {
  value = aws_lambda_function.lambda-posts-silver.arn
}
