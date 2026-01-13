output "vmware_cloud_id" {
  description = "ID of the VMware private cloud"
  value       = azurerm_vmware_private_cloud.example.id
}

output "vmware_vcenter_fqdn" {
  description = "FQDN of the vCenter server"
  value       = azurerm_vmware_private_cloud.example.vcenter_server_internal_fqdn
}