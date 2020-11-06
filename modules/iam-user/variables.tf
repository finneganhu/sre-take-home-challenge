variable "create_user" {
  description = "Whether to create an IAM user"
  type        = bool
  default     = true
}

variable "create_iam_access_key" {
  description = "Whether to create an IAM access key for the user"
  type        = bool
  default     = true
}

variable "subscribe_to_group" {
  description = "Whether to subscribe the IAM user to group(s)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name for the IAM user"
  type        = string
}

variable "path" {
  description = "Path in which to create the user"
  type        = string
  default     = "/"
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "If set to true, when destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Key-value map of tags for the IAM user"
  type        = map(string)
  default     = {}
}

variable "groups" {
  description = "A list of IAM groups to add the user to"
  type        = list(string)
  default     = []
}

variable "access_key_status" {
  description = "The access key status to apply"
  type        = string
  default     = "Active"
}