output "server_id" {
  value = azurerm_mssql_server.sql_server.id
}

output "database_id" {
  value = azurerm_mssql_database.sql_db.id
}