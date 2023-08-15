output "module_vpc_name" {
  value = module.vpc.vpc_name
}

output "module_private_subnet_names" {
  value = module.vpc.private_subnet_names
}

output "module_public_subnet_names" {
  value = module.vpc.public_subnet_names
}

output "module_private_rt" {
  value = module.vpc.private_rt
}

output "module_public_rt" {
  value = module.vpc.public_rt
}

output "module_nat_gateway" {
  value = module.vpc.nat_gateway
}

output "module_eip" {
  value = module.vpc.eip
}

output "module_igw" {
  value = module.vpc.igw
}