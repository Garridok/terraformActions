

# Storage Account
resource "azurerm_storage_account" "staccount" {
    name = var.sta_name
    
    resource_group_name = var.rgroup
    location = var.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    depends_on = [ 
      var.rgroup
     ]
}