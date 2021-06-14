output "server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.name
}

output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.fqdn
}

output "administrator_login" {
  value = var.administrator_login
}

output "server_id" {
  description = "The resource id of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.id
}

output "databases" {
  description = "The list of all database resource ids"
  value       = azurerm_postgresql_database.dbs
}

output "firewall_rules" {
  description = "The list of all firewall rule resource ids"
  value       = azurerm_postgresql_firewall_rule.firewall_rules
}

output "vnet_rules" {
  description = "The list of all vnet rule resource ids"
  value       = azurerm_postgresql_virtual_network_rule.vnet_rules
}
