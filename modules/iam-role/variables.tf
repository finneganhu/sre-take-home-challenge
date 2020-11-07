# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "create_role" {
  description = "Whether to create an IAM role"
  type        = bool
  default     = true
}

variable "attach_policies_to_role" {
  description = "Whether to attach IAM policies to the role"
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the role"
  type        = string
  default     = "new-role"
}

variable "force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it"
  type        = bool
  default     = false
}

variable "path" {
  description = "The path to the role"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the role"
  type        = string
  default     = "The role allows Lambda functions to call AWS services on your behalf"
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role"
  type        = number
  default     = 3600
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Key-value map of tags for the IAM role"
  type        = map(string)
  default     = {}
}

variable "policy_arn" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}