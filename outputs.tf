# output "dns_zone_id" {
#   value = module.dns_zone.dns_zone_id
# }

# output "vpn_gateway_id" {
#   value = module.vpn_gateway.vpn_gateway_id
# }

# output "front_door_endpoint" {
#   value = module.front_door.front_door_endpoint
# }

# output "function_app_url" {
#   value = module.function_app.function_app_url
# }

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}


output "cosmosdb_endpoint" {
  value = module.cosmos_db.cosmosdb_endpoint
}

output "key_vault_uri" {
  value = module.key_vault.key_vault_uri
}
# === Advisor Outputs ===
output "advisor_alert_id" {
  value = module.azure_advisor.advisor_alert_id
}

output "advisor_action_group_id" {
  value = module.azure_advisor.action_group_id
}

# === Logic App Outputs ===
output "logic_app_id" {
  value = module.azure_logicapps.logic_app_id
}

output "logic_app_endpoint" {
  value = module.azure_logicapps.logic_app_endpoint
}

output "azure_ad_app_id" {
  value = module.azure_ad.app_id
}

output "azure_files_storage_account_name" {
  value = module.azure_files.storage_account_name
}

output "azure_files_share_name" {
  value = module.azure_files.file_share_name
}

output "log_analytics_workspace_id" {
  value = module.log_analysis.workspace_id
}
# 🆕 NEW OUTPUTS

output "blob_storage_account_name" {
  value = module.blob_storage.storage_account_name
}

output "blob_container_name" {
  value = module.blob_storage.container_name
}

output "defender_status" {
  value = module.microsoft_defender.defender_enabled
}

output "appinsights_id" {
  value = module.applications_insights.appinsights_id
}

output "appinsights_instrumentation_key" {
  value     = module.applications_insights.appinsights_instrumentation_key
  sensitive = true
}

