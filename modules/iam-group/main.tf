resource "aws_iam_group" "group" {
  count = var.create_group ? 1 : 0

  name = var.group_name
  path = var.path
}

resource "aws_iam_group_policy_attachment" "group" {
  count = var.attach_policies_to_group ? "${length(var.policy_arn)}" : 0

  group      = aws_iam_group.group[0].name
  policy_arn = var.policy_arn[count.index]
}

resource "aws_iam_group_membership" "user_subscription" {
  count = var.subscribe_users ? 1 : 0

  name  = var.subscription_name
  users = var.users
  group = aws_iam_group.group[0].name
}