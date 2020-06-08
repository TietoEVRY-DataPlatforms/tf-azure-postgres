locals {
  default_charset   = "UTF8"
  default_collation = "English_United States.1252"
}

resource "azurerm_postgresql_server" "server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
  }

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  version                      = var.server_version
  ssl_enforcement              = var.ssl_enforcement

  tags = var.tags
}

resource "azurerm_postgresql_database" "dbs" {
  for_each            = var.databases
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = lookup(each.value, "charset", local.default_charset)
  collation           = lookup(each.value, "collation", local.default_collation)
}

resource "azurerm_postgresql_firewall_rule" "firewall_rules" {
  for_each            = var.firewall_rules
  name                = "${var.firewall_rule_prefix}-${each.key}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  start_ip_address    = each.value[0]
  end_ip_address      = each.value[1]
}

resource "azurerm_postgresql_virtual_network_rule" "vnet_rules" {
  for_each            = var.vnet_rules
  name                = "${var.vnet_rule_name_prefix}-${each.key}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  subnet_id           = each.value.subnet_id
}

resource "azurerm_postgresql_configuration" "db_configs" {
  for_each            = var.postgresql_configurations
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name

  name  = each.key
  value = each.value
}
