variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vpn_gateway_name" {
  description = "Name of the VPN gateway"
  type        = string
}

variable "vpn_subnet_id" {
  description = "ID of the GatewaySubnet in existing VNet"
  type        = string
}