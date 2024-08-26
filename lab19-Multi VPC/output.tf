output "ip_public_hg" {
  value = module.hg-compute.ip_public_instance
}

output "ip_private_hg" {
  value = module.hg-compute.ip_private_instance
}

output "ip_public_sg" {
  value = module.sg-compute.ip_public_instance
}

output "ip_private_sg" {
  value = module.sg-compute.ip_private_instance
}
