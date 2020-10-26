variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Server. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "server_name" {
  description = "Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created."
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  default     = "B_Gen5_2"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 5120
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 30
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = false
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server. Changing this forces a new resource to be created."
  default     = "pgadm"
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
}

variable "server_version" {
  description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, and 10.0. Changing this forces a new resource to be created."
  default     = "10.0"
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "Minimum SSL Mode to be used."
  default     = "TLS1_2"
}

variable "databases" {
  description = "The list of names of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created."
  default     = []
}

variable "database_options" {
  description = "Options for each database like collate & charset"
  default     = {}
}

variable "firewall_rule_prefix" {
  description = "Specifies prefix for firewall rule names."
  default     = "fwr"
}

variable "firewall_rules" {
  description = "The list of maps, describing firewall rules. Valid map items: name, start_ip, end_ip."
  default     = {}
  type        = map
}

variable "vnet_rule_name_prefix" {
  description = "Specifies prefix for vnet rule names."
  default     = "vnr"
}

variable "vnet_rules" {
  description = "The list of maps, describing vnet rules. Valud map items: name, subnet_id."
  default     = {}
  type        = map
}

variable "tags" {
  description = "A map of tags to set on every taggable resources. Empty by default."
  type        = "map"
  default     = {}
}

variable "postgresql_configurations" {
  description = "A map with PostgreSQL configurations to enable."
  type        = "map"
  default     = {}
}
