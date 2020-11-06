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

module "iam_user" {
  source = "./modules/iam-user"

  create_user                         = true
  create_iam_access_key_new_user      = var.create_iam_access_key_new_user
  create_iam_access_key_existing_user = var.create_iam_access_key_existing_user
  subscribe_new_user_to_group         = var.subscribe_new_user_to_group
  subscribe_existing_user_to_group    = var.subscribe_existing_user_to_group

  new_user_name        = var.new_user_name
  existing_user_name   = var.existing_user_name
  path                 = var.user_path
  permissions_boundary = var.user_permissions_boundary
  force_destroy        = var.user_force_destroy
  tags                 = var.user_tags
  groups               = var.subscription_groups
  access_key_status    = var.access_key_status
}

module "iam_group" {
  source = "./modules/iam-group"

  create_group             = true
  attach_policies_to_group = var.attach_policies_to_group
  subscribe_users          = true

  group_name        = var.group_name
  path              = var.group_path
  policy_arn        = var.group_policy_arn
  subscription_name = var.subscription_name
  users             = ["${module.iam_user.iam_user_name}"]
}

module "iam_role" {
  source = "./modules/iam-role"

  create_role             = true
  attach_policies_to_role = var.attach_policies_to_role

  name                  = var.role_name
  force_detach_policies = var.force_detach_policies
  path                  = var.role_path
  description           = var.role_description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary
  tags                  = var.role_tags
  policy_arn            = var.role_policy_arn
}