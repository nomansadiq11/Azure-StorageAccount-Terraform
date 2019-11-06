

resource "azurerm_resource_group" "ForTerraformStates" {
  name     = "ForTerraformStates"
  location = "West Europe"
}

resource "azurerm_storage_account" "SATerraform" {
  name                     = "TerraformStates"
  resource_group_name      = "${var.resouce_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Stage"
  }
}