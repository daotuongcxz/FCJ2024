variable "aws_ec2_transit_gateway_id" {
  type = string
  nullable = false
}

variable "create_igw" {
  type = bool
  default = false
  nullable = false
}

variable "vpc_id" {
  type = string
  nullable = false
}

variable "public_subnet_1_id" {
  type = string
  nullable = false
}

variable "gateway_id" {
  type    = string
  default = null
}
