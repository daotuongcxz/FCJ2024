output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet_1.id
}

output "create_igw" {
  value = var.create_igw
}

output "gateway_id" {
  value = var.create_igw && length(aws_internet_gateway.my_igw) > 0 ? aws_internet_gateway.my_igw[0].id : null
}

