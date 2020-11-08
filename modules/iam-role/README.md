# IAM Role

This folder contains a Terraform module to create an IAM role with IAM role policies as module input (AWS managed and custom managed policies). The role allows Lambda functions to call AWS services on user's behalf.

## What's included in this module

This module consists of the following resources:

- IAM Role (with AWS Lambda as trusted entity)

- IAM Role Policy Attachment

All of these resources in this module can be created optionally. However, since the policy attachment depends on the created IAM role, you have to create a new IAM role to create the policy attachments.

## How to use this module

This folder defines a Terraform module, which you can use in your code by adding a module configuration and setting its `source` parameter to the location of this folder after you clone the repo:

```hcl
# Example Usage
module "iam_role" {
  source = "./modules/iam-role"

  # option inputs to define the actions to perform
  create_role             = var.create_role
  attach_policies_to_role = var.attach_policies_to_role

  # value inputs to create a new IAM role
  name                  = var.name
  force_detach_policies = var.force_detach_policies
  path                  = var.path
  description           = var.description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags

  # value inputs to attach IAM policies to role
  policy_arn = var.policy_arn
}
```

### Inputs

This module has the following option inputs:

- `create_role`: Whether to create an IAM role.
- `attach_policies_to_role`: Whether to attach IAM policies to the role.

You need to set the option input to `true` in order to create the corresponding resource.

The module doesn't require any input parameters, but please provide the following values accordingly:

- `name`: If you are creating a new IAM role.
- `policy_arn`: If you are attaching IAM policies to the role.