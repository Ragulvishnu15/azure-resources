resource "azurerm_frontdoor" "example" {
  name                = var.front_door_name
  resource_group_name = var.resource_group_name
  location            = var.location

  backend_pool_load_balancing {
    name                               = "load-balancing-settings"
    additional_latency_milliseconds    = 0
    sample_size                        = 4
    successful_samples_required        = 2
  }

  backend_pool_health_probe {
    name                   = "health-probe"
    path                   = "/health"
    protocol               = "Http"
    interval_in_seconds    = 30
    request_method         = "GET"
  }

  backend_pool {
    name = "backend-pool"

    load_balancing_name = azurerm_frontdoor.example.backend_pool_load_balancing[0].name
    health_probe_name   = azurerm_frontdoor.example.backend_pool_health_probe[0].name

    backend {
      host_header = "example-backend.azurewebsites.net"
      address     = "example-backend.azurewebsites.net"
      http_port   = 80
      https_port  = 443
      priority    = 1
      weight      = 50
    }
  }

  frontend_endpoint {
    name = "frontend-endpoint"

    host_name = "${var.front_door_name}.azurefd.net"
  }

  routing_rule {
    name               = "routing-rule"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [azurerm_frontdoor.example.frontend_endpoint[0].id]
    route_configuration {
      odata_type = "#Microsoft.Azure.FrontDoor.Models.FrontdoorForwardingConfiguration"
      forwarding_protocol = "MatchRequestProtocol"
      backend_pool_name   = azurerm_frontdoor.example.backend_pool[0].name
    }
  }

   
  tags = {
  ManagedBy    = "Terraform"
  Environment  = "Production"
  Organization = "cloudmasa"
}

}