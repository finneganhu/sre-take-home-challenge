provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source = "./modules/iam-user"

  create_user           = true
  create_iam_access_key = true
  subscribe_to_group    = true
  name                  = "sweet-frog-with-key"
  groups                = ["Administrators", "PowerUsers"]
}