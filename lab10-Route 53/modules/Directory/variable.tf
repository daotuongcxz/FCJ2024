variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "vpc_id" {
  type = string
  nullable = false
}

variable "private_subnet_ips" {
  type = list(string)
    nullable = false
}