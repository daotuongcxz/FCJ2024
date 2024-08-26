output "ip_public_bastion" {
  value = module.bastion-compute.ip_public_instance
}

output "ip_private_bastion" {
  value = module.bastion-compute.ip_private_instance
}

output "ip_private_instance" {
  value = module.private-compute.ip_private_instance
}