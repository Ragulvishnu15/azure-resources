output "vpn_gateway_id" {
  description = "ID of the VPN Gateway"
  value       = azurerm_virtual_network_gateway.example.id
}

output "vpn_gateway_public_ip" {
  description = "Public IP address of the VPN Gateway"
  value       = azurerm_public_ip.example.ip_address
}