# IAM User

This folder contains a Terraform module to create an IAM user, IAM access key, and IAM user-group subscriptions. The latter two resources (IAM access key, IAM user-group subscriptions) can be created independently of the first resource (IAM user).

## What's included in this module

This module consists of the following resources:

- IAM User

- IAM Access Key

- IAM User-Group Subscription

All of these resources in this module can be created optionally. You can create a new IAM user with this module, and then create access key and user-group subscriptions for that user. You can also directly create access key and user-group subscriptions for an existing user.

## How to use this module

This folder defines a Terraform module, which you can use in your code by adding a module configuration and setting its `source` parameter to the location of this folder after you clone the repo:

```hcl
# Example Usage
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
```

### Inputs

This module has the following option inputs:

- `create_user`: Whether to create an IAM user.
- `create_iam_access_key_new_user`: Whether to create an IAM access key for the new user.
- `create_iam_access_key_existing_user`: Whether to create an IAM access key for an existing user.
- `subscribe_new_user_to_group`: Whether to subscribe the new IAM user to group(s).
- `subscribe_existing_user_to_group`: Whether to subscribe an existing IAM user to group(s).

You need to set the option input to `true` in order to create the corresponding resource.

Because the module gives users freedom to create the resources they need, it doesn't have any required inputs. However, it's recommended that you provide:

- `new_user_name`, if you are creating a new IAM user.

- `existing_user_name`, if you are creating an IAM access key or user-group subscriptions for an existing user.

Also note that the `access_key_secret` output is set to be `sensitive`. Thus, it will not appear in the console output, but will be present in the remote backend state file.