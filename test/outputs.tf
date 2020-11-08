output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.backend.arn
}

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

output "iam_access_key_id_new_user" {
  description = "The access key ID for the new user"
  value       = module.iam_user.iam_access_key_id_new_user
}

output "iam_access_key_id_existing_user" {
  description = "The access key ID for an existing user"
  value       = module.iam_user.iam_access_key_id_existing_user
}

output "iam_access_key_secret_new_user" {
  description = "The secret access key for the new user. Will be written to the backend state file"
  value       = module.iam_user.iam_access_key_secret_new_user
  sensitive   = true
}

output "iam_access_key_secret_existing_user" {
  description = "The secret access key for an existing user. Will be written to the backend state file"
  value       = module.iam_user.iam_access_key_secret_existing_user
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

output "iam_role_arn" {
  description = "The ARN specifying the role"
  value       = module.iam_role.iam_role_arn
}

output "iam_role_create_date" {
  description = "The creation date of the IAM role"
  value       = module.iam_role.iam_role_create_date
}

output "iam_role_description" {
  description = "The description of the IAM role"
  value       = module.iam_role.iam_role_description
}

output "iam_role_id" {
  description = "The ID of the IAM role"
  value       = module.iam_role.iam_role_id
}

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = module.iam_role.iam_role_name
}

output "iam_role_unique_id" {
  description = "The stable and unique string identifying the IAM role"
  value       = module.iam_role.iam_role_unique_id
}