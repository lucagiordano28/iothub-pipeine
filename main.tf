terraform {

  required_version = ">=0.12"
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "resource-group" {
  name     = "giordano-example"
  location =  "eastus2"
}


module "iot-hub" {
  source                = "./IoT HUB"
  rg_name   = azurerm_resource_group.resource-group.name
  rg_location             = azurerm_resource_group.resource-group.location
  sku_name              = var.sku_name
  capacity              = var.sku_capacity
  name                  = "iothub-example"
  }