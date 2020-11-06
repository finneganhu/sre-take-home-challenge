# ---------------------------------------------------------------------------------------------------------------------
# CREATES AN IAM USER OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_user" "new_user" {
  count = var.create_user ? 1 : 0

  name                 = var.new_user_name
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  force_destroy        = var.force_destroy
  tags                 = var.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATES AN IAM ACCESS KEY FOR THE CREATED USER OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_access_key" "new_user" {
  count = var.create_user && var.create_iam_access_key_new_user ? 1 : 0

  user   = aws_iam_user.new_user[0].name
  status = var.access_key_status
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATES AN IAM ACCESS KEY FOR AN EXISTING USER OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_access_key" "existing_user" {
  count = var.create_iam_access_key_existing_user ? 1 : 0

  user   = var.existing_user_name
  status = var.access_key_status
}

# ---------------------------------------------------------------------------------------------------------------------
# SUBSCRIBE THE CREATED USER TO A LIST OF IAM GROUPS OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "new_user" {
  count = var.create_user && var.subscribe_new_user_to_group ? 1 : 0

  user   = aws_iam_user.new_user[0].name
  groups = var.groups
}

# ---------------------------------------------------------------------------------------------------------------------
# SUBSCRIBE THE EXISTING USER TO A LIST OF IAM GROUPS OPTIONALLY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "existing_user" {
  count = var.subscribe_existing_user_to_group ? 1 : 0

  user   = var.existing_user_name
  groups = var.groups
}