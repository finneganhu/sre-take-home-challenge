# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY IAM IDENTITIES IN AWS
# This module sources from three nested modules IAM User, IAM Group, and IAM Role defined in ./modules/ folder. No 
# variable input is required to run this module. However, it is needed if you want to run this module to create the IAM
# identities you want. The module is default to create  a new IAM user named "new-user" with access key, a new IAM
# group named "new-group", and an AWS Lambda assumed IAM role named "new-role".
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
# PERFORM ACTIONS ON IAM USER
# ---------------------------------------------------------------------------------------------------------------------
module "iam_user" {
  source = "./modules/iam-user"

  # option inputs to define the actions to perform
  create_user                         = var.create_user
  create_iam_access_key_new_user      = var.create_iam_access_key_new_user
  create_iam_access_key_existing_user = var.create_iam_access_key_existing_user
  subscribe_new_user_to_group         = var.subscribe_new_user_to_group
  subscribe_existing_user_to_group    = var.subscribe_existing_user_to_group

  # value inputs to create a new IAM user
  new_user_name        = var.new_user_name
  path                 = var.user_path
  permissions_boundary = var.user_permissions_boundary
  force_destroy        = var.user_force_destroy
  tags                 = var.user_tags

  # value inputs to perform actions in an existing IAM user
  existing_user_name = var.existing_user_name

  # value inputs to subscribe IAM user to group(s)
  groups = var.subscription_groups

  # value inputs to create access key for IAM user
  access_key_status = var.access_key_status
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE IAM GROUP, WITH OPTION TO ATTACH IAM POLICIES AND SUBSCRIBE USERS
# ---------------------------------------------------------------------------------------------------------------------
module "iam_group" {
  source = "./modules/iam-group"

  # option inputs to define the actions to perform
  create_group             = var.create_group
  attach_policies_to_group = var.attach_policies_to_group
  subscribe_users          = var.subscribe_users

  # value inputs to create a new IAM group
  group_name = var.group_name
  path       = var.group_path

  # value inputs to attach IAM policies to group
  policy_arn = var.group_policy_arn

  # value inputs to subscribe user(s) to group
  subscription_name = var.subscription_name
  users             = var.subscription_users
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE IAM ROLE, WITH OPTION TO ATTACH IAM POLICIES
# ---------------------------------------------------------------------------------------------------------------------
module "iam_role" {
  source = "./modules/iam-role"

  # option inputs to define the actions to perform
  create_role             = var.create_role
  attach_policies_to_role = var.attach_policies_to_role

  # value inputs to create a new IAM role
  name                  = var.role_name
  force_detach_policies = var.force_detach_policies
  path                  = var.role_path
  description           = var.role_description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary
  tags                  = var.role_tags

  # value inputs to attach IAM policies to role
  policy_arn = var.role_policy_arn
}