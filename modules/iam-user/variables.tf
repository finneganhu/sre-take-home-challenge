variable "create_user" {
  description = "Whether to create an IAM user"
  type        = bool
  default     = true
}

variable "create_iam_access_key_new_user" {
  description = "Whether to create an IAM access key for the new user"
  type        = bool
  default     = true
}

variable "create_iam_access_key_existing_user" {
  description = "Whether to create an IAM access key for an existing user"
  type        = bool
  default     = false
}

variable "subscribe_new_user_to_group" {
  description = "Whether to subscribe the new IAM user to group(s)"
  type        = bool
  default     = true
}

variable "subscribe_existing_user_to_group" {
  description = "Whether to subscribe an existing IAM user to group(s)"
  type        = bool
  default     = false
}

variable "new_user_name" {
  description = "Name for the new IAM user"
  type        = string
  default     = "new-user"
}

variable "existing_user_name" {
  description = "Name for an existing IAM user"
  type        = string
  default     = ""
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