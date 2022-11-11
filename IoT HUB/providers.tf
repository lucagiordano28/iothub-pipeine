
terraform {

  required_version = ">= 1.0.0"

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = ">=3.17.0"

    }


    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }

  }

}

provider "azurerm" {

  features {}
}
