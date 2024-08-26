region = "ap-southeast-1"
availability_zone_1 = "ap-southeast-1a"
availability_zone_2 = "ap-southeast-1b"
cidr_block_hg = "10.10.0.0/16"
cidr_block_sg = "172.31.0.0/16"
public_subnet_ips_hg = [ "10.10.1.0/24", "10.10.2.0/24" ]
public_subnet_ips_sg = [ "172.31.1.0/24", "172.31.2.0/24" ]
keypair_path = "./keypair/keyssh.pub"
instance_type = "t3.micro"
instance_name = ["Demo HG instance" , "Demo SG instance"]

