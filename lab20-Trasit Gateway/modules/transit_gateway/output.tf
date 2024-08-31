output "transit_gateway_attachment_ids" {
  value = [
    aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment0.id,
    aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment1.id,
    aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment2.id,
    aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment3.id
  ]
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.transit_gateway.id
}