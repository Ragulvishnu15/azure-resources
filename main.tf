# Create Resource Group (optional, if not created by modules)
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Module: DNS Zone
# module "dns_zone" {
#   source = "./dns_zone"

#   resource_group_name = azurerm_resource_group.main.name
#   location            = azurerm_resource_group.main.location
#   dns_zone_name       = var.dns_zone_name
# }

# # Module: VPN Gateway
# module "vpn_gateway" {
#   source = "./modules/vpn_gateway"

#   resource_group_name = azurerm_resource_group.main.name
#   location            = azurerm_resource_group.main.location
#   vpn_gateway_name    = var.vpn_gateway_name
#   vpn_subnet_id       = var.vpn_subnet_id
# }

# # Module: Front Door
# module "front_door" {
#   source = "./front_door"

#   resource_group_name = azurerm_resource_group.main.name
#   front_door_name     = var.front_door_name
# }

# # Module: VMware Solution
# module "vmware_solution" {
#   source = "./vmware_solution"

#   resource_group_name = var.vmware_resource_group
#   cluster_name        = var.vmware_cluster_name
#   location            = var.location
# }

# Module: Function App
module "function_app" {
  source               = "./modules/function_app"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  function_app_name    = var.function_app_name
  storage_account_name = var.storage_account_name
}

# Module: Storage Account
module "storage_account" {
  source = "./modules/storage_account"

  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = var.storage_account_name_global
  location             = azurerm_resource_group.main.location

  tier        = var.storage_tier        # ✅
  replication = var.storage_replication # ✅
}

# Module: Cosmos DB
module "cosmos_db" {
  source = "./modules/cosmos_db"

  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  cosmosdb_account_name   = var.cosmosdb_account_name
  cosmosdb_database_name  = var.cosmosdb_database_name
  cosmosdb_container_name = var.cosmosdb_container_name
}

# Module: Key Vault
module "key_vault" {
  source = "./modules/key_vault"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  key_vault_name      = var.key_vault_name
}

# Module: Azure AD Application
module "azure_ad" {
  source = "./modules/azure_ad"

  app_display_name = "${var.prefix}-app"
}

# Module: Azure Files
module "azure_files" {
  source              = "./modules/azure_files"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
}

module "log_analysis" {
  source              = "./modules/log_analysis"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
}


module "blob_storage" {
  source              = "./modules/blob_storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
}

module "applications_insights" {
  source              = "./modules/applications_insights"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  workspace_id        = module.log_analysis.workspace_id
}
module "microsoft_defender" {
  source = "./modules/microsoft_defender"
  # Note: Defender doesn't use RG, but we keep for consistency
}



# Azure Advisor Alerts
module "azure_advisor" {
  source = "./modules/azure_advisor"

  resource_group_name = azurerm_resource_group.main.name # ✅
  location            = azurerm_resource_group.main.location
  subscription_id     = var.subscription_id
  prefix              = var.prefix

  advisor_alert_name = "${var.prefix}-advisor-alert"
  admin_email        = var.admin_email
  slack_webhook_url  = var.slack_webhook_url
}

# Azure Logic App
module "azure_logicapps" {
  source = "./modules/azure_logicapps"

  resource_group_name        = azurerm_resource_group.main.name # ✅
  location                   = azurerm_resource_group.main.location
  logic_app_name             = "${var.prefix}-logicapp"
  log_analytics_workspace_id = module.log_analysis.workspace_id
}
#queue_storage
module "queue_storage" {
  source = "./modules/azure_queuestorage"

  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = var.queue_storage_account_name
  queue_name           = var.queue_name
  prefix               = var.prefix
}
# event_grid
module "event_grid" {
  source = "./modules/event_grid"

  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  event_grid_topic_name = var.event_grid_topic_name
  prefix                = var.prefix
  webhook_endpoint      = var.event_grid_webhook_endpoint
}