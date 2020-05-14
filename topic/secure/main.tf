

module "topic" {

  source                = "../base"

  location              = var.location
  resource_group_name   = var.resource_group_name

  name                  = var.name
  app_name              = var.app_name
  env_name              = var.env_name
  
}


module "secret_endpoint" {

  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-Endpoint"
  value                 = azurerm_eventgrid_topic.topic.endpoint

  app_name              = var.app_name
  env_name              = var.env_name

}

module "secret_accesskey" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-AccessKey"
  value                 = azurerm_eventgrid_topic.topic.primary_access_key

  app_name              = var.app_name
  env_name              = var.env_name

}