variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "dns_zone_name" {
  description = "Name of the DNS zone (e.g., example.com)"
  type        = string
}