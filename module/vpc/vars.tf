variable "cidr" {
  type        = string
  description = "cidr for the vpc"
  default     = ""
}
variable "vpc_name" {
  type        = string
  description = "this is the name of the vpc"
  default     = ""
}

variable "private_subnet_name" {
  type        = string
  description = "this is the name of the subnet"
  default     = ""
}

variable "public_subnet_name" {
  type        = string
  description = "this is the name of the subnet"
  default     = ""
}

variable "public_subnet_map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "private_subnet_cidr" {
  type        = list(any)
  description = "this the value of the public subnet"
}

variable "public_subnet_cidr" {
  type        = list(any)
  description = "this the value of the public subnet"
}

variable "private_rt_name" {
  type = string
}

variable "public_rt_name" {
  type = string
}

variable "nat_gateway" {
  type = string
}

variable "nat_eip" {
  type = string
}

variable "igw_name" {
  type = string
}