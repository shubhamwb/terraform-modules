variable "ec2_instance_ami" {
  type        = string
  description = "this instance ami"
}

variable "ec2_instance_type" {
  type        = string
  description = "this instance type"
}

variable "ec2_instance_name" {
  type        = any
  description = "this instance name"
}

variable "ec2_instance_env" {
  type        = string
  description = "this instance environment"
}

variable "sg_name" {
  type        = string
  description = "this security group name"
}

variable "vpc_id_name" {
  type        = string
  description = "this default vpc id"
}
