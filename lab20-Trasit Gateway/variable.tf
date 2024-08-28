variable "region" {
  type = string
  default = "ap-southeast-1"
}
#parameters for networking module
variable "availability_zone_1" {
  type = string
  nullable = false
}


variable "vpcs" {
  description = "List of VPC configurations"
  type = list(object({
    cidr_block        = string
    public_subnet_ip  = string
    create_igw        = bool
  }))
}


variable "instance_name" {
  type =  list(string)
  nullable = false
}

#parameter for compute module
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t3.micro"
  default = "t3.micro"
}
variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-01811d4912b4ccb26"
  }
}
variable "keypair_path" {
  type = string
  default = "./keypair/keyssh.pub"
}

