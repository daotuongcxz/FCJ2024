# provider "aws" {
#   region = var.region
# }

# Tạo VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "demo VPC"
  }
}

# Tạo các subnet public
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_ip
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1"
  }
}

# Tạo Internet Gateway có điều kiện
resource "aws_internet_gateway" "my_igw" {
  count = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "demo IGW"
  }
}

# Tạo bảng route public
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Public RTB"
  }
}

# Tạo route đến Internet Gateway nếu nó tồn tại
resource "aws_route" "public_route" {
  count = var.create_igw ? 1 : 0
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = element(aws_internet_gateway.my_igw.*.id, 0)
}

# Gán các subnet public với bảng route public
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
