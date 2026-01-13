resource "azurerm_vmware_private_cloud" "example" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_name = "AV36"

  management_cluster {
    cluster_size = 3
  }

  network_block = "192.168.48.0/22"

  internet_connection_enabled = true
  nsxt_password               = "P@ssw0rd123!" # ⚠️ Use secret store or variable in real use
  vcenter_password            = "P@ssw0rd123!"

 tags = {
  ManagedBy    = "Terraform"
  Environment  = "Production"
  Organization = "cloudmasa"
}
}