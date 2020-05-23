

module "secret_endpoint" {

  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-Endpoint"
  value                 = module.topic.endpoint

  app_name              = var.app_name
  env_name              = var.env_name

}

module "secret_accesskey" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-AccessKey"
  value                 = module.topic.primary_access_key

  app_name              = var.app_name
  env_name              = var.env_name

}