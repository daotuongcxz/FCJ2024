variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "security_group_for_directory" {
  type = string
  nullable = false
}

variable "private_subnet_ips" {
  type = list(string)
  nullable = false
}

variable "ip_dns_onprem" {
  type = list(string)
  nullable = false
}

variable "vpc_id" {
  type = string
  nullable = false
}