resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags       = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "vpc") })
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags              = merge(var.tags, { "Name" = format("%s-%s-%s-%s", var.project, var.env, "private-subnet", count.index + 1) })
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { "Name" = format("%s-%s-%s-%s", var.project, var.env, "public-subnet", count.index + 1) })
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "private-rt") })
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "public-rt") })
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet[0].id # assign to only one subnet
  allocation_id = aws_eip.nat_eip.id
  tags          = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "nat-gateway") })
}

resource "aws_eip" "nat_eip" {
  domain = var.eip_domain
  tags = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "eip") })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { "Name" = format("%s-%s-%s", var.project, var.env, "igw") })

}