# Mini AWS IAM Module

This Terraform module is built for **Scenario 1** of the SRE take-home challenge.

## Project Overview

This module allows you to create and configure IAM identities in AWS. To achieve more modular structure and better control over the resources, this project is consisted of three nested modules, each focusing on a different type of IAM identity:

- **IAM User**: Creates IAM user, IAM access key and IAM user-group subscriptions.
- **IAM Group**: Creates IAM group with IAM group policies as module input (AWS managed and custom managed policies). Optionally, has the ability to subscribe aforementioned users to the created group.
- **IAM Role**: Creates IAM role with IAM role policies as module input (AWS managed and custom managed Policies).

The module also gives users a certain degree of freedom in terms of the resources they want to deploy. For example, the user can create a new IAM user or creae IAM access key for an existing user. For more details on each individaul nested module, please go to `modules/` to check out the documentations in modules' folders.

## How to Use

### Prerequisites

To use this module, you need to have Terraform installed in your machine. If you don't have it installed yet, please go to [this page](https://releases.hashicorp.com/terraform/) to download the binary of appropriate version and OS. Versions >= v0.12.24 is recommended, since this project is developed and tested with Terraform v0.12.24.

You would also need an AWS IAM user with at least IAM privileges configured in order to use this module to create IAM identities in your AWS account. Please go to [this page](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-set-up.html) for more details and instructions. You can use `aws configure` to setup your access key, secret in your own environment.

### Deploy IAM Identities

1. Inside the root directory, run terraform init` to initialize the Terraform project.

2. Setup the input variables to create the IAM identities you want by either using `-var` command line option or creating `.tfvars` files to define the value. Note that no input parameter is required to run this module, since all variables have a default value set.

3. If you wish to view the result prior to deployment, run `terraform plan`.

4. Deploy your resources by running `terraform apply`. Upon successful completion, you can navigate to your IAM service to confirm the result.

## Test Module

There is a test module set up in `test/` that includes example code with some variables configured. It would create a new IAM user with access key, a new IAM group with two AWS managed policies attached and subscribed by the previously created user, and a new role assumed by AWS Lambda.

The test module also uses S3 as remote backend with versioning and server side encryption enabled, so that `.terraform.tfstate` file is stored not locally, but in an S3 bucket. This setup has multiple benefits, such as having a single reference for team collaboration and better handling or secrets. Please follow these steps to run the test module:

1. Go to `test/new-s3-bucket/`. **Change the bucket name**.

2. Run `terraform init` and `terraform apply` to create the S3 bucket.

3. Go back to `test/`. **Change the bucket name in terraform block to the name of the bucket you just created**.

4. Run `terraform init` and `terraform apply` to deploy the IAM identities.

## Git Workflow

The git repository has 3 branches: `main`, `staging`, and `dev`, in which `dev` is used for all development work, and `staging` is used for testing. The workflow looks like this:

1. Write code of related work in `dev`
2. Commit the change. Go back to step 1 to write more code until ready for testing
3. Merge `dev` to `staging` to test
4. Fix bugs by iterating step 1 - 3
5. Merge `staging` to `main`

## Areas for Improvements

Given limited time to work on, this project is far from perfect. Below are some potential improvements can be made to make the module more robust for wider use.

- Currently the module doesn't support creating more than one instance for each resource. More nested modules can be added to achieve that (e.g. **IAM Users**). The new modules would have the same set of resources as the singular instance modules, but a few places would need to be changed to iterate through the instances.

- Although the access key secret created is configured to be `sensitive` so that it doesn't appear in console outputs, anyone with access to the terraform state file can still see it. Using S3 as the remote backend and enabling server side encryption makes the state file more secure. However, creating the access key pair with pgp key supplied can prevent the secret from being stored in plain text.