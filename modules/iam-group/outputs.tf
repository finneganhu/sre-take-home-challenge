output "iam_group_id" {
  description = "The group's ID"
  value       = var.create_group ? aws_iam_group.group[0].id : null
}

output "iam_group_arn" {
  description = "The ARN assigned by AWS for this group"
  value       = var.create_group ? aws_iam_group.group[0].arn : null
}

output "iam_group_name" {
  description = "The group's name"
  value       = var.create_group ? aws_iam_group.group[0].name : null
}

output "iam_group_path" {
  description = "The path of the group in IAM"
  value       = var.create_group ? aws_iam_group.group[0].path : null
}

output "iam_group_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = var.create_group ? aws_iam_group.group[0].unique_id : null
}

output "iam_subscription_name" {
  description = "The name to identify the Group Membership"
  value       = var.subscribe_users ? aws_iam_group_membership.user_subscription[0].name : null
}

output "iam_users" {
  description = "List of names of IAM users attached to the group"
  value       = var.subscribe_users ? aws_iam_group_membership.user_subscription[0].users : null
}