data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATES AN IAM ROLE OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "role" {
  count = var.create_role ? 1 : 0

  name                  = var.name
  assume_role_policy    = data.aws_iam_policy_document.lambda_assume_role_policy.json
  force_detach_policies = var.force_detach_policies
  path                  = var.path
  description           = var.description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags
}


# ---------------------------------------------------------------------------------------------------------------------
# ATTACHES PROVIDED MANAGED IAM POLICIES TO CREATED ROLE OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "role" {
  count = var.create_role && var.attach_policies_to_role ? "${length(var.policy_arn)}" : 0

  role       = aws_iam_role.role[0].name
  policy_arn = var.policy_arn[count.index]
}