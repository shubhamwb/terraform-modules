terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "terraform-lenovo"
  region  = "us-east-1"
}

variable "tf_environment" { # use the environment variable multiple times to modules  
  type    = string
  default = "dev-env"
}

/*
 module "s3" {
  source = "../../module/s3/"
  # s3_bucket_name = "tf-swb-bucket"
  s3_bucket_list = ["swb1-bucket", "swb2-bucket"]
  s3_env         = var.tf_environment
}

module "iam" {
  source                    = "../../module/iam/"
  iam_env                   = var.tf_environment
  iam_user_name             = ["swb1-user", "swb2-user", "swb3-user", "shubham-user"]
  iam_group_name            = "cloudblitz"
  iam_group_membership_name = "cloudblitz-members"
}


module "ec2" {
  source            = "../../module/ec2"
  ec2_instance_env  = var.tf_environment
  ec2_instance_name = "nginx-server"
  ec2_instance_type = "t2.micro"
  ec2_instance_ami  = "ami-08a52ddb321b32a8c" # us-east-1 Amazon linux
  sg_name           = "terraform-sg"
  vpc_id_name       = "vpc-0886a9ad8b4a83f66" # us-east-1 defualt vpc id
} 
*/

module "vpc" {
  source   = "../../module/vpc"
  cidr     = "20.0.0.0/19"
  vpc_name = "tf-vpc"
  public_subnet_map_public_ip_on_launch = true
  public_subnet_cidr  = ["20.0.0.0/22"]
  private_subnet_cidr = ["20.0.4.0/22", "20.0.8.0/22", "20.0.12.0/22"]
  private_subnet_name = "private-subnet"
  public_subnet_name  = "Public-subnet"
  private_rt_name = "private-rt"
  public_rt_name = "Public-rt"

  nat_gateway = "nat-gateway"
  nat_eip = "nat-eip"
  igw_name = "tf-igw"
}