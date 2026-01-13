# Global variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

# DNS Zone
variable "dns_zone_name" {
  description = "Name of the DNS zone"
  type        = string
}

# VPN Gateway
variable "vpn_gateway_name" {
  description = "Name of the VPN gateway"
  type        = string
}

variable "vpn_subnet_id" {
  description = "ID of the subnet for VPN gateway"
  type        = string
}

# Front Door
variable "front_door_name" {
  description = "Name of the Front Door profile"
  type        = string
}

# VMware Solution
variable "vmware_cluster_name" {
  description = "Name of the VMware cluster"
  type        = string
}

variable "vmware_resource_group" {
  description = "Resource group for VMware solution"
  type        = string
}

# Function App
variable "function_app_name" {
  description = "Name of the Function App"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name for Function App"
  type        = string
}

# Storage Account
variable "storage_account_name_global" {
  description = "Global storage account name"
  type        = string
}

variable "storage_tier" {
  description = "Storage account tier: Standard or Premium"
  type        = string
  default     = "Standard"
}

variable "storage_replication" {
  description = "Replication type: LRS, GRS, RAGRS, ZRS, etc."
  type        = string
  default     = "LRS"
}

# Cosmos DB
variable "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
  default     = "mycosmosdb"
}

variable "cosmosdb_database_name" {
  description = "Name of the Cosmos DB SQL database"
  type        = string
  default     = "mydb"
}

variable "cosmosdb_container_name" {
  description = "Name of the Cosmos DB container"
  type        = string
  default     = "items"
}

# Key Vault
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  default     = "mykeyvault"
}



 
variable "subscription_id" {
  description = "Azure Subscription ID (for Advisor alerts)"
  type        = string
}

variable "admin_email" {
  description = "Email to receive Advisor alerts"
  type        = string
}

variable "slack_webhook_url" {
  description = "Optional Slack webhook URL"
  type        = string
  default     = ""
}
variable "default_tags" {
  description = "Default tags applied to all taggable resources"
  type        = map(string)
  default = {
    ManagedBy    = "Terraform"
    Environment  = "Production"
    Organization = "cloudmasa"
  }
}
variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "app" # prevents leading hyphen
}
variable "log_analytics_workspace_id" {
  type    = string
  default = ""
}

variable "queue_storage_account_name" {
  description = "Name of the storage account for queues (must be globally unique)"
  type        = string
}

variable "queue_name" {
  description = "Name of the Azure Storage Queue"
  type        = string
  default     = "default-queue"
}

variable "event_grid_topic_name" {
  description = "Name of the Event Grid Topic (must be unique within resource group)"
  type        = string
}

variable "event_grid_webhook_endpoint" {
  description = "Webhook URL to receive Event Grid events (optional)"
  type        = string
  default     = ""
}