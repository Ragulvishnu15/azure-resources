# Global variables
resource_group_name = "my-rg"
location            = "centralus" # ✅ Changed from eastus

# DNS Zone
dns_zone_name = "example.com"

# VPN Gateway
vpn_gateway_name = "my-vpn-gw"
vpn_subnet_id    = "/subscriptions/.../resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/GatewaySubnet"

# Front Door
front_door_name = "my-front-door"

# VMware Solution
vmware_cluster_name   = "my-vmware-cluster"
vmware_resource_group = "vmware-rg"

# Function App → globally unique
function_app_name    = "myfuncapp09jan2026"
storage_account_name = "myfuncstorage09jan2026"

# Storage Account (global)
storage_account_name_global = "myappstorage789xyz"

# Cosmos DB
cosmosdb_account_name   = "myappcosmos09jan2026"
cosmosdb_database_name  = "appdb"
cosmosdb_container_name = "records"

# Key Vault
key_vault_name = "myappkv09jan2026"


# Advisor & Logic App settings
admin_email                = "ragul@example.com"
slack_webhook_url          = ""
log_analytics_workspace_id = "/subscriptions/6978d0f2-8d32-4e62-b8e3-9a3f696c707d/resourceGroups/ragul-rg/providers/Microsoft.OperationalInsights/workspaces/ragul-loganalytics"

# terraform.tfvars
prefix = "myapp"

 # Queue Storage
queue_storage_account_name = "myqueuestorage09jan2026"
queue_name                 = "app-processing-queue"

#  Event Grid
event_grid_topic_name      = "my-app-events-topic"
event_grid_webhook_endpoint = ""