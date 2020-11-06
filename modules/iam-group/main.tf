# ---------------------------------------------------------------------------------------------------------------------
# CREATES AN IAM GROUP OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_group" "group" {
  count = var.create_group ? 1 : 0

  name = var.group_name
  path = var.path
}


# ---------------------------------------------------------------------------------------------------------------------
# ATTACHES PROVIDED MANAGED IAM POLICIES TO CREATED GROUP OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_group_policy_attachment" "group" {
  count = var.create_group && var.attach_policies_to_group ? "${length(var.policy_arn)}" : 0

  group      = aws_iam_group.group[0].name
  policy_arn = var.policy_arn[count.index]
}

# ---------------------------------------------------------------------------------------------------------------------
# SUBSRCIBES PROVIDED LIST OF IAM USERS TO CREATED GROUP OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_group_membership" "user_subscription" {
  count = var.create_group && var.subscribe_users ? 1 : 0

  name  = var.subscription_name
  users = var.users
  group = aws_iam_group.group[0].name
}