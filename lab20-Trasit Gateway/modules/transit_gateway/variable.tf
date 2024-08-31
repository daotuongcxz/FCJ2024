variable "vpc_ids" {
  type = list(string)
  nullable = false
}

variable "subnet_ids" {
  type = list(string)
  nullable = false
}

variable "vpcs" {
  description = "Danh sách các VPC với thông tin CIDR block, public subnet và create_igw"
  type = list(object({
    cidr_block       = string
    public_subnet_ip = string
    create_igw       = bool
  }))
}


