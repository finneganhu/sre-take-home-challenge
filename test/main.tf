# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY IAM IDENTITIES IN AWS
# These templates show an example of how to use the this module to deploy IAM identities in AWS. We create a new IAM
# user and create an IAM access key for the user. Then, we create a new IAM group with two AWS managed IAM policies 
# attached, and we subscribe the newly created IAM user to the group. Finally, we create a new IAM role assumed by AWS
# Lambda. This test module use AWS S3 as the backend.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.24"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  # configure terraform to use created s3 bucket as the backend
  backend "s3" {
    # CHANGE TO NAME OF YOUR OWN BUCKET
    bucket = "terraform-backend-00bcd6c1"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AWS S3 BUCKET TO USE AS BACKEND WITH VERSIONING AND ENCRYPTION ENABLED
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket" "backend" {
  # CHANGE TO NAME OF YOUR OWN BUCKET
  bucket = "terraform-backend-00bcd6c1"
  # enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }
  # enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE IAM USER WITH ACCESS KEY
# ---------------------------------------------------------------------------------------------------------------------
module "iam_user" {
  source = "../modules/iam-user"

  # option inputs to define the actions to perform
  create_user                         = true
  create_iam_access_key_new_user      = true
  create_iam_access_key_existing_user = false
  subscribe_new_user_to_group         = false
  subscribe_existing_user_to_group    = false

  # value inputs to create a new IAM user
  new_user_name        = "test-user"
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
# DEPLOY THE IAM GROUP WITH EXAMPLE GROUP POLICIES, CREATE USER-GROUP SUBSCRIPTION
# ---------------------------------------------------------------------------------------------------------------------
module "iam_group" {
  source = "../modules/iam-group"

  # option inputs to define the actions to perform
  create_group             = true
  attach_policies_to_group = true
  subscribe_users          = true

  # value inputs to create a new IAM group
  group_name = "test-group"
  path       = var.group_path

  # value inputs to attach IAM policies to group
  policy_arn = ["arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/AlexaForBusinessDeviceSetup"
  ]

  # value inputs to subscribe user(s) to group
  subscription_name = var.subscription_name
  users             = ["${module.iam_user.iam_user_name}"]
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
module "iam_role" {
  source = "../modules/iam-role"

  # option inputs to define the actions to perform
  create_role             = true
  attach_policies_to_role = false

  # value inputs to create a new IAM role
  name                  = "test-role"
  force_detach_policies = var.force_detach_policies
  path                  = var.role_path
  description           = var.role_description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary
  tags                  = var.role_tags

  # value inputs to attach IAM policies to role
  policy_arn = var.role_policy_arn
}