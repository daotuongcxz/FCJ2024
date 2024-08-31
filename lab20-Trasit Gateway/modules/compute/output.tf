output "ip_public_instance" {
  value = aws_instance.demo-instance.public_ip
}

output "ip_private_instance" {
  value = aws_instance.demo-instance.private_ip
}

# Định nghĩa dữ liệu để lấy route table cho subnet của instance
data "aws_route_table" "selected" {
  subnet_id = aws_instance.demo-instance.subnet_id
}

# Output để xuất route_table_id
output "route_table_id_for_instance" {
  value = data.aws_route_table.selected.id
}
