data "template_file" "iam_role_trust_relationship_document" {
  template = file(var.trust_relationship_document_path)
  vars     = var.trust_relationship_vars
}

data "template_file" "iam_role_policy_document" {
  template = file(var.role_policy_document_path)
  vars     = var.policy_vars
}

resource "aws_iam_role" "iam_role" {
  name                  = var.iam_role_name
  assume_role_policy    = data.template_file.iam_role_trust_relationship_document.rendered
  path                  = var.iam_role_path
  force_detach_policies = true
  description           = var.iam_role_description
  max_session_duration  = var.iam_role_max_session_duration
  tags                  = var.tags
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name   = var.iam_role_policy_name
  policy = data.template_file.iam_role_policy_document.rendered
  role   = aws_iam_role.iam_role.id
}