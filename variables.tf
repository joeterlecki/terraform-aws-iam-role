variable "environment" {
  type        = string
  default     = null
  description = "The defining environment of the Account: DEV, TST, STG, PRD, ROOT"
}

variable "iam_role_name" {
  type        = string
  default     = null
  description = "The desired name for the iam role"
}

variable "iam_role_path" {
  type        = string
  default     = null
  description = "The desired identifying path of the iam role"
}

variable "iam_role_description" {
  type        = string
  default     = null
  description = "The desired description of the iam role"
}


variable "iam_role_max_session_duration" {
  type        = string
  default     = "3600"
  description = "The max amount of time a sts token session is valid"
}

variable "trust_relationship_document_path" {
  type        = string
  default     = null
  description = "Path to the json policy file for the iam role trust relationship"
}

variable "trust_relationship_vars" {
  type        = map(string)
  default     = null
  description = "The desired vaible to pass into the template file if needed"
}

variable "role_policy_document_path" {
  type        = string
  default     = null
  description = "Path to the json policy file for the iam role policy"
}

variable "policy_vars" {
  type        = map(string)
  default     = null
  description = "The desired vaible to pass into the template file if needed"
}

variable "iam_role_policy_name" {
  type        = string
  default     = null
  description = "The desired name for the iam role policy"
}

variable "tags" {
  type    = map(string)
  default = {}
}

locals {
  tags = merge(
    var.tags,
    {
      Environment  = var.environment
      Provisioning = "terraform"
    },
  )
}