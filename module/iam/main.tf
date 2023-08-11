resource "aws_iam_user" "iam_user" {
  count = length(var.iam_user_name)
  name  = var.iam_user_name[count.index]
}

resource "aws_iam_group" "iam_group" {
  name = var.iam_group_name
}

resource "aws_iam_group_membership" "group_member" {
  name = var.iam_group_membership_name

  count = length(var.iam_user_name)
  users = [aws_iam_user.iam_user[count.index].name]
  group = aws_iam_group.iam_group.name
}