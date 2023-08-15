output "vpc_name" {
  value = aws_vpc.main.tags["Name"]
}

output "private_subnet_names" {
  value = [for subnet in aws_subnet.private_subnet : subnet.tags["Name"]]
}

output "public_subnet_names" {
  value = [for subnet in aws_subnet.public_subnet : subnet.tags["Name"]]
}

output "private_rt" {
  value = aws_route_table.private_rt.tags["Name"]
}

output "public_rt" {
  value = aws_route_table.public_rt.tags["Name"]
}

output "nat_gateway" {
  value = aws_nat_gateway.nat_gateway.tags["Name"]
}

output "eip" {
  value = aws_eip.nat_eip.tags["Name"]
}

output "igw" {
  value = aws_internet_gateway.igw.tags["Name"]
}