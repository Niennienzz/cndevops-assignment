output "public_ip" {
  description = "The public IP address of the CVM instance."
  value       = tencentcloud_instance.ubuntu[0].public_ip
}

output "private_ip" {
  description = "The private IP address of the CVM instance."
  value       = tencentcloud_instance.ubuntu[0].private_ip
}

output "ssh_password" {
  description = "The SSH password of the CVM instance."
  value       = var.password
}
