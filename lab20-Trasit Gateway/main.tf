provider "aws" {
  region = var.region
}

module "transit_gateway" {
  source    = "./modules/transit_gateway"
  vpcs      = var.vpcs
  vpc_ids  = [for k, v in module.vpcs : v.vpc_id]
  subnet_ids = [for k, v in module.vpcs : v.public_subnet_id]
}
# Create a complete VPC and security group using modules
module "vpcs" {
  for_each = { for idx, vpc in var.vpcs : idx => vpc }
  source = "./modules/networking"

  cidr_block          = each.value.cidr_block
  availability_zone_1 = var.availability_zone_1
  region              = var.region
  public_subnet_ip    = each.value.public_subnet_ip
  create_igw = each.value.create_igw
}

module "route_table" {
  for_each = { for idx, vpc in var.vpcs : idx => vpc }
  source   = "./modules/route_table"

  aws_ec2_transit_gateway_id = module.transit_gateway.transit_gateway_id
  create_igw                            = module.vpcs[each.key].create_igw
  vpc_id                                = module.vpcs[each.key].vpc_id
  public_subnet_1_id                    = module.vpcs[each.key].public_subnet_id
  gateway_id                            = module.vpcs[each.key].create_igw ? module.vpcs[each.key].gateway_id : null
}



module "security" {
  for_each = { for idx, vpc in var.vpcs : idx => module.vpcs[idx] }
  source = "./modules/Security"
  vpc_id = each.value.vpc_id
  region = var.region
}


resource "aws_key_pair" "demo_keypair" {
  key_name = "demo_keypair"
  public_key = file(var.keypair_path)
}


module "instances" {
  for_each = module.vpcs
  source   = "./modules/compute"

  key_name           = aws_key_pair.demo_keypair.key_name
  image_id           = var.amis[var.region]
  subnet_id          = each.value.public_subnet_id
  instance_name      = "Instance-${each.key}"
  ec2_security_group_ids = [module.security[each.key].security_group_id]
  associate_public_ip_address = try(each.value.create_igw, false)
}