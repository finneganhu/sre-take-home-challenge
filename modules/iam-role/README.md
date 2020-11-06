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
```

### Inputs

This module has the following option inputs:

- `create_role`: Whether to create an IAM role.
- `attach_policies_to_role`: Whether to attach IAM policies to the role.

You need to set the option input to `true` in order to create the corresponding resource.

The following input is required when using this module:

- `name`: The name of the role.