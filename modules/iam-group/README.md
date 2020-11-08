# IAM Group

This folder contains a Terraform module to create an IAM group with IAM group policies as module input (AWS managed and custom managed policies), also optionally subscribe the user created with **IAM User** module to the created group.

## What's included in this module

This module consists of the following resources:

- IAM Group

- IAM Group Policy Attachment

- IAM User-Group Subscription

All of these resources in this module can be created optionally. However, since the policy attachment and user-group subscription depends on the created IAM group, you have to create a new IAM group to create the latter two resources.

## How to use this module

This folder defines a Terraform module, which you can use in your code by adding a module configuration and setting its `source` parameter to the location of this folder after you clone the repo:

```hcl
module "iam_group" {
  source = "./modules/iam-group"

  # option inputs to define the actions to perform
  create_group             = var.create_group
  attach_policies_to_group = var.attach_policies_to_group
  subscribe_users          = var.subscribe_users

  # value inputs to create a new IAM group
  group_name = var.group_name
  path       = var.path

  # value inputs to attach IAM policies to group
  policy_arn = var.policy_arn

  # value inputs to subscribe user(s) to group
  subscription_name = var.subscription_name
  users             = var.users
}
```

### Inputs

This module has the following option inputs:

- `create_group`: Whether to create an IAM group.
- `attach_policies_to_group`: Whether to attach IAM policies to the group.
- `subscribe_users`: Whether to subscribe IAM users to the group.

You need to set the option input to `true` in order to create the corresponding resource.

The module doesn't require any input parameters, but please provide the following values accordingly:

- `name`: If you are creating a new IAM group.
- `policy_arn`: If you are attaching IAM policies to the group.
- `users`: If you are subscribing IAM users to the group.