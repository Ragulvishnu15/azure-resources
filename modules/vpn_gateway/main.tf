resource "azurerm_virtual_network_gateway" "example" {
  name                = var.vpn_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.example.id
    subnet_id                     = var.vpn_subnet_id
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_public_ip" "example" {
  name                = "${var.vpn_gateway_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"    # ✅ Required for Standard SKU
  sku                 = "Standard"  # ✅ Use Standard
  
  tags = {
  ManagedBy    = "Terraform"
  Environment  = "Production"
  Organization = "cloudmasa"
}
}