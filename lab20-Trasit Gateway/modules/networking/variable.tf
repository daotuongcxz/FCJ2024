variable "region" {
  type = string
}

variable "cidr_block" {
  type = string
  nullable = false
}

variable "public_subnet_ip" {
  type = string
  nullable = false
}

variable "availability_zone_1" {
  description = "Availability Zone for the first subnet"
  type        = string
}

variable "create_igw" {
  type = bool
  default = false
  nullable = false
}