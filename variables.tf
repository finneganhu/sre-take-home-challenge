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

variable "user_path" {
  description = "Path in which to create the user"
  type        = string
  default     = "/"
}

variable "user_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  type        = string
  default     = ""
}

variable "user_force_destroy" {
  description = "If set to true, when destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices"
  type        = bool
  default     = false
}

variable "user_tags" {
  description = "Key-value map of tags for the IAM user"
  type        = map(string)
  default     = {}
}

variable "subscription_groups" {
  description = "A list of IAM groups to add the user to"
  type        = list(string)
  default     = []
}

variable "access_key_status" {
  description = "The access key status to apply"
  type        = string
  default     = "Active"
}

variable "create_group" {
  description = "Whether to create an IAM group"
  type        = bool
  default     = true
}

variable "attach_policies_to_group" {
  description = "Whether to attach IAM policies to the group"
  type        = bool
  default     = false
}

variable "subscribe_users" {
  description = "Whether to subscribe IAM users to the group"
  type        = bool
  default     = false
}

variable "group_name" {
  description = "Name for the IAM group"
  type        = string
}

variable "group_path" {
  description = "Path in which to create the group"
  type        = string
  default     = "/"
}

variable "group_policy_arn" {
  description = "List of IAM policy ARNs to attach to the group"
  type        = list(string)
  default     = []
}

variable "subscription_name" {
  description = "The name to identify the Group Membership"
  type        = string
  default     = "new-subscription"
}

variable "subscription_users" {
  description = " A list of IAM User names to subscribe to the Group"
  type        = list(string)
  default     = []
}

variable "create_role" {
  description = "Whether to create an IAM role"
  type        = bool
  default     = true
}

variable "attach_policies_to_role" {
  description = "Whether to attach IAM policies to the role"
  type        = bool
  default     = true
}

variable "role_name" {
  description = "The name of the role"
  type        = string
}

variable "force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it"
  type        = bool
  default     = false
}

variable "role_path" {
  description = "The path to the role"
  type        = string
  default     = "/"
}

variable "role_description" {
  description = "The description of the role"
  type        = string
  default     = "The role allows Lambda functions to call AWS services on your behalf"
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role"
  type        = number
  default     = 3600
}

variable "role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = ""
}

variable "role_tags" {
  description = "Key-value map of tags for the IAM role"
  type        = map(string)
  default     = {}
}

variable "role_policy_arn" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}