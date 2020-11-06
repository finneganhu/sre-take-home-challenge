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

output "iam_group_id" {
  description = "The group's ID"
  value       = module.iam_group.iam_group_id
}

output "iam_group_arn" {
  description = "The ARN assigned by AWS for this group"
  value       = module.iam_group.iam_group_arn
}

output "iam_group_name" {
  description = "The group's name"
  value       = module.iam_group.iam_group_name
}

output "iam_group_path" {
  description = "The path of the group in IAM"
  value       = module.iam_group.iam_group_path
}

output "iam_group_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = module.iam_group.iam_group_unique_id
}

output "iam_subscription_name" {
  description = "The name to identify the Group Membership"
  value       = module.iam_group.iam_subscription_name
}

output "iam_attached_users" {
  description = "List of names of IAM users attached to the group"
  value       = module.iam_group.iam_users
}