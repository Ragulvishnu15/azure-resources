output "front_door_id" {
  description = "ID of the Front Door"
  value       = azurerm_frontdoor.example.id
}

output "front_door_endpoint" {
  description = "Front Door endpoint URL"
  value       = azurerm_frontdoor.example.frontend_endpoint[0].host_name
}