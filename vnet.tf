# core-service-Vnet
resource "azurerm_virtual_network" "CoreServiceVnet" {
  name                = "CoreServiceVnet"
  address_space       = var.CoreServiceVnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#CoreServiceVnet Subnet (loop over map)
resource "azurerm_subnet" "CoreServiceVnet_subnets" {
  for_each             = var.CoreServiceVnet_subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.CoreServiceVnet.name
  address_prefixes     = [each.value]
}

resource "azurerm_virtual_network" "manufacturing_vnet" {
  name                = "manufacturingVnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.ManufacturingVnet_address_space
}

resource "azurerm_subnet" "manufacturing_subnets" {
  for_each             = var.ManufacturingVnet_subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes     = [each.value]
}


