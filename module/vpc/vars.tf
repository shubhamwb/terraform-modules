variable "cidr" {
  type        = string
  description = "cidr for the vpc"
  default     = ""
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnet_cidr" {
  type        = list(any)
  description = "this the value of the public subnet"
}

variable "public_subnet_cidr" {
  type        = list(any)
  description = "this the value of the public subnet"
}

variable "eip_domain" {
  type = string  
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}