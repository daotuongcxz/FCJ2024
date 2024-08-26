output "ip_public" {
  value = module.bastion-compute.ip_public_instance
}

output "ip_private" {
  value = module.bastion-compute.ip_private_instance
}

output "ip_dns_onprem" {
  value = module.diretory_onprem.ip_dns_onprem
}