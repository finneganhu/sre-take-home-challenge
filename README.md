# Mini AWS IAM Module

This Terraform module is built for **Scenario 1** of the SRE take-home challenge. 

## Project Overview

To achieve more modular structure and better control over the resources, this project is consisted with three nested modules, each focusing on a different type of IAM identity:

- **IAM User**: Creates IAM user, IAM access key and IAM user-group subscriptions.
- **IAM Group**: Creates IAM group with IAM group policies as module input (AWS managed and custom managed policies). Optionally, has the ability to subscribe aforementioned users to the created group.
- **IAM Role**: Creates IAM role with IAM role policies as module input (AWS managed and custom managed Policies).

One thing worth noting is that the module gives users a certain degree of freedom in terms of the resources they want to deploy. For example, the user can create a new IAM user or creae IAM access key for an existing user. For more details on each individaul nested module, please go to `/modules/` to check out the modules' folders.

## How to Use

### Prerequisites

To use this module, you need to have Terraform installed in your machine. If you don't have it installed yet, please go to [this page](https://releases.hashicorp.com/terraform/) to download the binary of appropriate version and OS. Versions >= v0.12.24 is recommended, since this project is developed and tested with Terraform v0.12.24.

You would also need an AWS IAM user with at least IAM privileges configured in order to use this module to create IAM identities in your AWS account. Please go to [this page](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-set-up.html) for more details and instructions. You can use `aws configure` to setup your access key, secret in your own environment.

### Deploy IAM Identities

After cloning this repo to your local environment, you can use `terraform init` to initialize the Terraform project. Example codes are in `main.tf` of the root directory to show some of the things you can create with this module. To run it, do `terraform validate`, `terraform plan`, `terraform apply` to deploy the resources. Upon successful completion, you can navigate to your IAM service to confirm the result.

In order to create the IAM identities you want, load the variables defined in `variables.tf` in module blocks. Then you can modify the value of the variables by either using `-var` command line option or creating `.tfvars` files to define the value.

## Areas for Improvements

Given limited time to work on, this project is far from perfect. Below are some potential improvements can be made to make the module more robust for wider use.

- Currently the module doesn't support creating more than one instance for each resource. More nested modules can be added to achieve that (e.g. **IAM Users**). The new modules would have the same set of resources as the singular instance modules, but a few places would need to be changed to iterate through the instances.