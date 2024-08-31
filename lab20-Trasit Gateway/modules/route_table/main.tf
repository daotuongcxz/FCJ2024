# Tạo bảng route public
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Public RTB"
  }
}

# Tạo route đến Internet Gateway nếu nó tồn tại
resource "aws_route" "public_route" {
  count = var.create_igw ? 1 : 0
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id != null ? var.gateway_id : null
}

resource "aws_route" "transit_route" {
  depends_on = [var.aws_ec2_transit_gateway_id]
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = var.create_igw ? "172.16.0.0/16" : "0.0.0.0/0"
  transit_gateway_id = var.aws_ec2_transit_gateway_id

}
# Gán các subnet public với bảng route public
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = var.public_subnet_1_id
  route_table_id = aws_route_table.public_route_table.id
}
