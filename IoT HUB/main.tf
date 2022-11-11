/*data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}*/

resource "azurerm_iothub" "iothub" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.rg_location

  sku {
    name     = var.sku_name
    capacity = var.capacity
  }

  event_hub_partition_count   = 4
  event_hub_retention_in_days = 1

  fallback_route {
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["events"]
    enabled        = "true"
  }

  public_network_access_enabled = "true"
  #min_tls_version               = 1.2


  cloud_to_device {
    max_delivery_count = 10
    default_ttl        = "PT1H"
    feedback {
      time_to_live       = "PT1H"
      max_delivery_count = 10
      lock_duration      = "PT1M"
    }
  }
}

/*
resource "azurerm_iothub_shared_access_policy" "iohubowner" {
  name                = "iohubowner"
  resource_group_name = var.rg_name
  iothub_name         = azurerm_iothub.iothub.name

  registry_read   = true
  registry_write  = true
  service_connect = true
  device_connect  = true
}
resource "azurerm_iothub_shared_access_policy" "service" {
  name                = "service"
  resource_group_name = var.rg_name
  iothub_name         = azurerm_iothub.iothub.name

  service_connect = true
}
resource "azurerm_iothub_shared_access_policy" "device" {
  name                = "device"
  resource_group_name = var.rg_name
  iothub_name         = azurerm_iothub.iothub.name
  device_connect      = true
}
resource "azurerm_iothub_shared_access_policy" "registryRead" {
  name                = "registryRead"
  resource_group_name = var.rg_name
  iothub_name         = azurerm_iothub.iothub.name

  registry_read = true
}
resource "azurerm_iothub_shared_access_policy" "registryReadWrite" {
  name                = "registryReadWrite"
  resource_group_name = var.rg_name
  iothub_name         = azurerm_iothub.iothub.name

  registry_read  = true
  registry_write = true
}*/