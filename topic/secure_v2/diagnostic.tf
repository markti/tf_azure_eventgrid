

resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {

  name                        = "${var.name}-keyvault-logs"
  target_resource_id          = module.topic.id
  log_analytics_workspace_id  = var.loganalytics_workspace_id

  log {
    category = "DeliveryFailures"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "PublishFailures"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }
}
