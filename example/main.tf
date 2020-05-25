module "test" {
  source = "../../terraform-aws-iam-role"
  iam_role_name = var.name
  iam_role_path = var.role_path
  iam_role_description = var.role_description
  trust_relationship_document_path = var.document
}