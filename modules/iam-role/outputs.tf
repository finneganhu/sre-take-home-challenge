output "iam_role_arn" {
  description = "The ARN specifying the role"
  value       = var.create_role ? aws_iam_role.role[0].arn : null
}

output "iam_role_create_date" {
  description = "The creation date of the IAM role"
  value       = var.create_role ? aws_iam_role.role[0].create_date : null
}

output "iam_role_description" {
  description = "The description of the IAM role"
  value       = var.create_role ? aws_iam_role.role[0].description : null
}

output "iam_role_id" {
  description = "The ID of the IAM role"
  value       = var.create_role ? aws_iam_role.role[0].id : null
}

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = var.create_role ? aws_iam_role.role[0].name : null
}

output "iam_role_unique_id" {
  description = "The stable and unique string identifying the IAM role"
  value       = var.create_role ? aws_iam_role.role[0].unique_id : null
}