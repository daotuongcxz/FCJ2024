variable "region" {
  type = string
  default = "ap-southeast-1"
}
variable "vpc_id" {
  type = string
  description = "The VPC ID"
  nullable = false
}

variable "cidr_block" {
  type = string
  nullable = false
}