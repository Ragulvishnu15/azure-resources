output "function_app_url" {
  value = "https://${azurerm_function_app.app.default_hostname}"
}