terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=3.43.0"
    }
  }
  cloud {

    organization = "kavintest1"

    workspaces {
      name = "terraform-exam"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-863ae5da-hands-on-with-terraform-on-azure"
  location = "South Central US "
}

module "exam" {
  source               = "app.terraform.io/kavintest1/exam/azurerm"
  version              = "1.0.0"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = "kavslktest456"
}