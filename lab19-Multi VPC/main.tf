provider "aws" {
  region = var.region
}

#Create a complete VPC using module networking
module "SGVPC" {
  source = "./modules/networking"
  cidr_block = var.cidr_block_sg
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  region = var.region
  public_subnet_ips = var.public_subnet_ips_sg
  subnet_dest = var.public_subnet_ips_hg[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
}

module "security_sg" {
  source = "./modules/Security"
  vpc_id = module.SGVPC.vpc_id
  region = var.region
  cidr_block = module.SGVPC.cidr_block
}

module "HGVPC" {
  source = "./modules/networking"
  cidr_block = var.cidr_block_hg
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  region = var.region
  public_subnet_ips = var.public_subnet_ips_hg
  subnet_dest = var.public_subnet_ips_sg[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
}

module "security_hg" {
  source = "./modules/Security"
  vpc_id = module.HGVPC.vpc_id
  region = var.region
  cidr_block = module.HGVPC.cidr_block
}

resource "aws_key_pair" "demo_keypair" {
  key_name = "demo_keypair"
  public_key = file(var.keypair_path)
}

module "hg-compute" {
  source = "./modules/compute"
  ec2_security_group_ids = [module.security_hg.public_security_group_id]
  key_name = aws_key_pair.demo_keypair.key_name
  region = var.region
  image_id = var.amis[var.region] 
  subnet_id = module.HGVPC.public_subnet_ids[0]
  associate_public_ip_address = true
  instance_name = var.instance_name[0]
}

module "sg-compute" {
  source = "./modules/compute"
  ec2_security_group_ids = [module.security_sg.public_security_group_id]
  key_name = aws_key_pair.demo_keypair.key_name
  region = var.region
  image_id = var.amis[var.region] 
  subnet_id = module.SGVPC.public_subnet_ids[0]
  associate_public_ip_address = true
  instance_name = var.instance_name[1]
}

resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = module.HGVPC.vpc_id
  vpc_id        = module.SGVPC.vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}