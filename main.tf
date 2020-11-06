provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source = "./modules/iam-user"

  create_user           = false
  create_iam_access_key = false
  subscribe_to_group    = false

  name          = "sweet-frog-with-key"
  force_destroy = true
  groups        = ["Administrators", "PowerUsers"]
}

module "iam_group" {
  source = "./modules/iam-group"

  create_group             = false
  attach_policies_to_group = false
  subscribe_users          = false

  group_name = "smelly-group"
  policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/AlexaForBusinessDeviceSetup"
  ]

  /*
  Error: Provider produced inconsistent result after apply

  When applying changes to
  module.iam_group.aws_iam_group_membership.user_subscription[0], provider
  "registry.terraform.io/-/aws" produced an unexpected new value for was
  present, but now absent.

  This is a bug in the provider, which should be reported in the provider's own
  issue tracker.

  users = ["${module.iam_user.iam_user_name}"]
  */
}

module "iam_role" {
  source = "./modules/iam-role"

  create_role             = true
  attach_policies_to_role = true

  name = "awesome-role"
  policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/AlexaForBusinessDeviceSetup"
  ]
}