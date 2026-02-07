
resource "helm_release" "grafana_synthetic_monitoring" {
  name       = "grafana-synthetic-monitoring"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "synthetic-monitoring-agent"
  namespace  = var.namespace
  version    = var.chart_version

  atomic          = false
  cleanup_on_fail = false
  force_update    = true
  recreate_pods   = true

  values = [templatefile("${path.module}/../../helmcharts/synthetic-monitoring-agent/values.yaml.tftpl", {
    agent_api_token         = var.api_token
    agent_api_server_address = var.api_server
    replica_count           = 1
    image_tag               = var.image_tag
    workload_name            = var.workload_name
  })]
}