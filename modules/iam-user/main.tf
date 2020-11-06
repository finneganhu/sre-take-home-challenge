resource "aws_iam_user" "user" {
  count = var.create_user ? 1 : 0

  name                 = var.name
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  force_destroy        = var.force_destroy
  tags                 = var.tags
}

resource "aws_iam_access_key" "user" {
  # pgp key?
  count = var.create_user && var.create_iam_access_key ? 1 : 0

  user   = aws_iam_user.user[0].name
  status = var.access_key_status
}

resource "aws_iam_user_group_membership" "group_subscription" {
  count = var.create_user && var.subscribe_to_group ? 1 : 0

  user   = aws_iam_user.user[0].name
  groups = var.groups
}