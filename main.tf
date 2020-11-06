# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY IAM IDENTITIES IN AWS
# These templates show an example of how to use the this module to deploy IAM identities in AWS. We create a new IAM
# user and create an IAM access key for the user. Then, we create a new IAM group with two AWS managed IAM policies 
# attached, and we subscribe the newly created IAM user to the group. Finally, we create a new IAM role assumed by AWS
# Lambda.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.24"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE IAM USER WITH ACCESS KEY
# ---------------------------------------------------------------------------------------------------------------------
module "iam_user" {
  source = "./modules/iam-user"

  create_user                         = true
  create_iam_access_key_new_user      = true
  create_iam_access_key_existing_user = false
  subscribe_new_user_to_group         = false
  subscribe_existing_user_to_group    = false

  new_user_name        = "test-user"
  existing_user_name   = var.existing_user_name
  path                 = var.user_path
  permissions_boundary = var.user_permissions_boundary
  force_destroy        = var.user_force_destroy
  tags                 = var.user_tags
  groups               = var.subscription_groups
  access_key_status    = var.access_key_status
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE IAM GROUP WITH EXAMPLE GROUP POLICIES, CREATE USER-GROUP SUBSCRIPTION
# ---------------------------------------------------------------------------------------------------------------------
module "iam_group" {
  source = "./modules/iam-group"

  create_group             = true
  attach_policies_to_group = true
  subscribe_users          = true

  group_name = "test-group"
  path       = var.group_path
  policy_arn = ["arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/AlexaForBusinessDeviceSetup"
  ]
  subscription_name = var.subscription_name
  users             = ["${module.iam_user.iam_user_name}"]
}


# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
module "iam_role" {
  source = "./modules/iam-role"

  create_role             = true
  attach_policies_to_role = false

  name                  = "test-role"
  force_detach_policies = var.force_detach_policies
  path                  = var.role_path
  description           = var.role_description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary
  tags                  = var.role_tags
  policy_arn            = var.role_policy_arn
}