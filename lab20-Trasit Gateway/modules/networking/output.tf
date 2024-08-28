output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet_1.id
}

output "create_igw" {
  value = var.create_igw
}
