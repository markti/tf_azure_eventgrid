resource "azurerm_eventgrid_topic" "topic" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    app = var.app_name
    env = var.env_name
  }

}

module "secret_endpoint" {

  source                = "github.com/markti/tf_azure_keyvault/secret"

  location              = var.location
  resource_group_name   = var.resource_group_name
  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-Endpoint"
  value                 = azurerm_eventgrid_topic.eventgrid.endpoint

  app_name              = var.app_name
  env_name              = var.env_name

}
module "secret_accesskey" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  location              = var.location
  resource_group_name   = var.resource_group_name
  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-AccessKey"
  value                 = azurerm_eventgrid_topic.eventgrid.endpoint

  app_name              = var.app_name
  env_name              = var.env_name

}