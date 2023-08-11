variable "s3_bucket_name" {
  type        = string
  default     = ""
  description = "this is the bucket name"
}

variable "s3_bucket_list" {
  type        = list(any)
  description = "this is the bucket name"
  default     = ["swb1-bucket", "swb2-bucket", "swb3-bucket", "swb4-bucket"]
}

variable "s3_env" {
  type        = string
  description = "this is the environment"
  default     = ""
}
