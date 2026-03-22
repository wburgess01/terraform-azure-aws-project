terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.37"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.65"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccountwmb"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}

provider "azurerm" {
  # Configuration options
  storage_use_azuread = true
  features {}
}
