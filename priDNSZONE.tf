# Private DNS Zone
resource "azurerm_private_dns_zone" "core_private_dns" {
  name                = "tech-hill.com"   
  resource_group_name = azurerm_resource_group.rg.name
}

# Link CoreServiceVnet to DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "core_link" {
  name                  = "core-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.core_private_dns.name
  virtual_network_id    = azurerm_virtual_network.CoreServiceVnet.id
  registration_enabled  = true
}

# Link Manufacturing VNet to DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing_link" {
  name                  = "manufacturing-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.core_private_dns.name
  virtual_network_id    = azurerm_virtual_network.manufacturing_vnet.id
  registration_enabled  = true
}
