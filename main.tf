provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source = "./modules/iam-user"

  create_user           = true
  create_iam_access_key = true
  subscribe_to_group    = false

  name   = "sweet-frog-with-key"
  groups = ["Administrators", "PowerUsers"]
}

module "iam_group" {
  source = "./modules/iam-group"

  create_group             = true
  attach_policies_to_group = true
  subscribe_users          = true

  group_name = "smelly-group"
  policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
    "arn:aws:iam::aws:policy/AlexaForBusinessDeviceSetup"
  ]
  users      = ["${module.iam_user.iam_user_name}"]
}