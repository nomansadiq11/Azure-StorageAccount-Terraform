

resource "azurerm_resource_group" "ForTerraformStates" {
  name     = "ForTerraformStates"
  location = "West Europe"
}

resource "azurerm_storage_account" "SATerraform" {
  name                     = "manageterraformstates"
  resource_group_name      = "${azurerm_resource_group.ForTerraformStates.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Stage"
  }
}


resource "azurerm_storage_container" "terraform_projects_states" {
  name                  = "terraformprojectsstates"
  storage_account_name  = "${azurerm_storage_account.SATerraform.name}"
  container_access_type = "blob"
}