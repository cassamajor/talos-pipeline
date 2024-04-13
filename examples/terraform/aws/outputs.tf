output "talosconfig" {
  description = "The generated talosconfig."
  value       = data.talos_client_configuration.this.talos_config
  sensitive   = true
}

output "kubeconfig" {
  description = "The generated kubeconfig."
  value       = data.talos_cluster_kubeconfig.this.kubeconfig_raw
  sensitive   = true
}

output "vmimport_role_arn" {
  description = "The ARN of the VMimport role."
  value       = module.vmimport_role.vmimport_role_arn
}