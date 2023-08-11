resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_subnet" {
  count      = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  tags = {
    Name = "${var.private_subnet_name}-${count.index + 1}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch
  cidr_block              = var.public_subnet_cidr[count.index]

  tags = {
    Name = "${var.public_subnet_name}-${count.index + 1}"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
  tags = {
    Name = var.public_rt_name
  }
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
  count         = length(var.public_subnet_cidr)
  subnet_id     = aws_subnet.public_subnet[count.index].id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = var.nat_gateway
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = var.nat_eip
  }
}

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}