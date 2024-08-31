resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "demo transit gateway"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment0" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_ids[0]
  subnet_ids = [var.subnet_ids[0]]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment1" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_ids[1]
  subnet_ids = [var.subnet_ids[1]]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment2" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_ids[2]
  subnet_ids = [var.subnet_ids[2]]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment3" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_ids[3]
  subnet_ids = [var.subnet_ids[3]]
}

resource "aws_ec2_transit_gateway_route_table" "transit_gateway_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "transit_gateway_route_table_propagation0" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment0.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "transit_gateway_route_table_propagation1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "transit_gateway_route_table_propagation2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "transit_gateway_route_table_propagation3" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}


resource "aws_ec2_transit_gateway_route_table_association" "transit_gateway_route_table_association0" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment0.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_association" "transit_gateway_route_table_association1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}
resource "aws_ec2_transit_gateway_route_table_association" "transit_gateway_route_table_association2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}
resource "aws_ec2_transit_gateway_route_table_association" "transit_gateway_route_table_association3" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}