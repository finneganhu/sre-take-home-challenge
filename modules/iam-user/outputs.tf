output "iam_user_arn" {
  description = "The ARN assigned by AWS for the user"
  value       = var.create_user ? aws_iam_user.new_user[0].arn : null
}

output "iam_user_name" {
  description = "The user's name"
  value       = var.create_user ? aws_iam_user.new_user[0].name : null
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS for the user"
  value       = var.create_user ? aws_iam_user.new_user[0].unique_id : null
}

output "iam_access_key_id_new_user" {
  description = "The access key ID for the new user"
  value       = var.create_iam_access_key_new_user ? aws_iam_access_key.new_user[0].id : null
}

output "iam_access_key_id_existing_user" {
  description = "The access key ID for an existing user"
  value       = var.create_iam_access_key_existing_user ? aws_iam_access_key.existing_user[0].id : null
}

output "iam_access_key_secret_new_user" {
  description = "The secret access key for the new user. Will be written to the backend state file"
  value       = var.create_iam_access_key_new_user ? aws_iam_access_key.new_user[0].secret : null
  sensitive   = true
}

output "iam_access_key_secret_existing_user" {
  description = "The secret access key for an existing user. Will be written to the backend state file"
  value       = var.create_iam_access_key_existing_user ? aws_iam_access_key.existing_user[0].secret : null
  sensitive   = true
}