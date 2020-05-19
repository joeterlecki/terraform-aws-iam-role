resource "aws_iam_role" "iam_role" {
  name                  = var.iam_role_name
  assume_role_policy    = var.iam_assume_role_policy
  path                  = var.iam_role_path
  force_detach_policies = true
  description           = var.iam_role_description
  max_session_duration  = var.iam_role_max_session_duration
  tags                  = merge({ Name = var.iam_role_name }, local.tags)
}

