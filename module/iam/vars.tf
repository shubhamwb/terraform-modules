variable "iam_user_name" {
  type        = list(any)
  description = "Name of the user"
}

variable "iam_env" {
  type        = string
  description = "the name of the environment"
  default     = ""
}

variable "iam_group_name" {
  type        = string
  description = "the name of the group"
  default     = ""

}

variable "iam_group_membership_name" {
  type        = string
  description = "the name of the group membership"
  default     = ""
}
