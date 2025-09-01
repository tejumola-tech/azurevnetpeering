# Peering from CoreServiceVnet -> ManufacturingVnet
resource "azurerm_virtual_network_peering" "core_to_manufacturing" {
  name                      = "Core-to-Manufacturing"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.CoreServiceVnet.name
  remote_virtual_network_id = azurerm_virtual_network.manufacturing_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Peering from ManufacturingVnet -> CoreServiceVnet
resource "azurerm_virtual_network_peering" "manufacturing_to_core" {
  name                      = "Manufacturing-to-Core"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.manufacturing_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.CoreServiceVnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
