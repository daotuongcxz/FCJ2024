output "ip_dns_onprem" {
  value = aws_directory_service_directory.demo_onprem_ad.dns_ip_addresses
}

output "security_group_for_directory" {
  value = aws_directory_service_directory.demo_onprem_ad.security_group_id
}
