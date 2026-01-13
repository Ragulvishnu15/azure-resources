output "dns_zone_id" {
  description = "ID of the DNS zone"
  value       = azurerm_dns_zone.example.id
}

output "dns_zone_fqdn" {
  description = "FQDN of the DNS zone"
  value       = azurerm_dns_zone.example.name
}