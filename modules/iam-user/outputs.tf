output "iam_user_arn" {
  description = "The ARN assigned by AWS for the user"
  value       = var.create_user ? aws_iam_user.user[0].arn : null
}

output "iam_user_name" {
  description = "The user's name"
  value       = var.create_user ? aws_iam_user.user[0].name : null
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS for the user"
  value       = var.create_user ? aws_iam_user.user[0].unique_id : null
}

output "iam_access_key_id" {
  description = "the access key ID"
  value       = var.create_iam_access_key ? aws_iam_access_key.user[0].id : null
}

output "iam_access_key_secret" {
  description = "The secret access key. Will be written to the backend state file"
  value       = var.create_iam_access_key ? aws_iam_access_key.user[0].secret : null
  sensitive   = true
}