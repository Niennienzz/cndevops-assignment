output "cvm_public_ip" {
  description = "Public IP of the CVM."
  value       = module.cvm.public_ip
}

output "cvm_password" {
  description = "Password of the CVM."
  value       = var.password
}

output "kube_config" {
  description = "Kubernetes config file."
  value       = "${path.module}/config.yaml"
}
