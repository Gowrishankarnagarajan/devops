provider "azurerm" {
  features {}
}

# Resource Group (uncomment if you need to create one)
# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = "West Europe"
  resource_group_name = "example-resources" # Change to your resource group name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app1" {
  name                = "example-app1"
  location            = azurerm_app_service_plan.example.location
  resource_group_name = azurerm_app_service_plan.example.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_app_service" "app2" {
  name                = "example-app2"
  location            = azurerm_app_service_plan.example.location
  resource_group_name = azurerm_app_service_plan.example.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id
}