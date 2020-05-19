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
  description = "The desired path of the iam role"
}

variable "iam_role_description" {
  type        = string
  default     = null
  description = "The desired description of the iam role"
}


variable "iam_role_max_session_duration" {
  type        = string
  default     = "14400"
  description = "The max amount of time a sts token session is valid"
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