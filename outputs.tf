output "iam_user_arn" {
  description = "The ARN assigned by AWS for the user"
  value       = module.iam_user.iam_user_arn
}

output "iam_user_name" {
  description = "The user's name"
  value       = module.iam_user.iam_user_name
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS for the user"
  value       = module.iam_user.iam_user_unique_id
}

output "iam_access_key_id" {
  description = "the access key ID"
  value       = module.iam_user.iam_access_key_id
}

output "iam_access_key_secret" {
  description = "The secret access key. Will be written to the backend state file"
  value       = module.iam_user.iam_access_key_secret
  sensitive   = true
}