region = "ap-southeast-1"
availability_zone_1 = "ap-southeast-1a"
vpcs = [
  {
    cidr_block       = "172.16.1.0/24"
    public_subnet_ip = "172.16.1.0/24"
    create_igw       = true
  },
  {
    cidr_block       = "172.16.2.0/24"
    public_subnet_ip = "172.16.2.0/24"
    create_igw       = false
  },
  {
    cidr_block       = "172.16.3.0/24"
    public_subnet_ip = "172.16.3.0/24"
    create_igw       = true
  },
  {
    cidr_block       = "172.16.4.0/24"
    public_subnet_ip = "172.16.4.0/24"
    create_igw       = false
  }
]

keypair_path = "./keypair/keyssh.pub"
instance_type = "t3.micro"
instance_name = ["Demo private instance" , "Demo public instance"]

