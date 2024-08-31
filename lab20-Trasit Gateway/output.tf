output "instances_ips" {
  value = {
    for k, instance in module.instances : k => {
      public_ip  = instance.ip_public_instance
      private_ip = instance.ip_private_instance
    }
  }
  description = "Public and Private IP addresses of all instances"
}



