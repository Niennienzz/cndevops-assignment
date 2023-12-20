output "public_ip" {
  description = "vm public ip address"
  value       = module.cvm.public_ip
}

output "cvm_password" {
  description = "vm password"
  value       = var.password
}

output "kube_config" {
  description = "Kubernetes config file"
  value       = "${path.module}/config.yaml"
}
