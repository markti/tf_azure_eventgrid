

module "topic" {

  source                = "../base"

  location              = var.location
  resource_group_name   = var.resource_group_name

  name                  = var.name
  app_name              = var.app_name
  env_name              = var.env_name
  
}
