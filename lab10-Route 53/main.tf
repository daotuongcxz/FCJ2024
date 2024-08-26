provider "aws" {
  region = var.region
}


#Create a complete VPC using module networking
module "networking" {
  source = "./modules/networking"
  cidr_block = var.cidr_block
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  region = var.region
  public_subnet_ips = var.public_subnet_ips
  private_subnet_ips = var.private_subnet_ips
}

module "security" {
  source = "./modules/Security"
  vpc_id = module.networking.vpc_id
  region = var.region
}

resource "aws_key_pair" "demo_keypair" {
  key_name = "demo_keypair"
  public_key = file(var.keypair_path)
}

module "bastion-compute" {
  source = "./modules/compute"
  ec2_security_group_ids = [module.security.public_security_group_id]
  key_name = aws_key_pair.demo_keypair.key_name
  region = var.region
  image_id = var.amis[var.region] 
  subnet_id = module.networking.public_subnet_ids[0]
  associate_public_ip_address = true
  instance_name = var.instance_name[1]
}

module "diretory_onprem" {
  source = "./modules/Directory"
  vpc_id = module.networking.vpc_id
  private_subnet_ips = [module.networking.private_subnet_ids[0] , module.networking.private_subnet_ids[1]]
}

module "route53" {
  source = "./modules/route53"
  vpc_id = module.networking.vpc_id
  private_subnet_ips = [module.networking.private_subnet_ids[0] , module.networking.private_subnet_ids[1]]
  ip_dns_onprem = module.diretory_onprem.ip_dns_onprem
  security_group_for_directory = module.diretory_onprem.security_group_for_directory
}