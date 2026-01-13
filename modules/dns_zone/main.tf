resource "azurerm_dns_zone" "example" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
  ManagedBy    = "Terraform"
  Environment  = "Production"
  Organization = "cloudmasa"
}
}

# Optional: Add a sample A record
resource "azurerm_dns_a_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = ["192.168.0.1"]

  
}