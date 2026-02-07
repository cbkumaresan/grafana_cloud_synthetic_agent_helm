module "synthetic_monitoring" {
  source        = "../../modules/config"
  api_server    = var.api_server
  api_token     = var.api_token
  namespace     = var.namespace
  chart_version = var.chart_version
}
