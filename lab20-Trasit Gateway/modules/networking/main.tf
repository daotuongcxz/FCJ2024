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

