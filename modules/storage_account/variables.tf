variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tier" {
  description = "Storage account tier: 'Standard' or 'Premium'"
  type        = string
  default     = "Standard"
}

variable "replication" {
  description = "Replication type: LRS, GRS, RAGRS, etc."
  type        = string
  default     = "LRS"
}

 