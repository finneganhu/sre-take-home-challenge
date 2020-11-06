# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "group_name" {
  description = "Name for the IAM group"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "create_group" {
  description = "Whether to create an IAM group"
  type        = bool
  default     = true
}

variable "attach_policies_to_group" {
  description = "Whether to attach IAM policies to the group"
  type        = bool
  default     = true
}

variable "subscribe_users" {
  description = "Whether to subscribe IAM users to the group"
  type        = bool
  default     = true
}

variable "path" {
  description = "Path in which to create the group"
  type        = string
  default     = "/"
}

variable "policy_arn" {
  description = "List of IAM policy ARNs to attach to the group"
  type        = list(string)
  default     = []
}

variable "subscription_name" {
  description = "The name to identify the Group Membership"
  type        = string
  default     = "new-subscription"
}

variable "users" {
  description = " A list of IAM User names to subscribe to the Group"
  type        = list(string)
  default     = []
}