# resource "helm_release" "grafana_synthetic_monitoring" {
#   name       = "grafana-synthetic-monitoring"
#   #repository = "https://grafana.github.io/helm-charts"
#   #chart      = "synthetic-monitoring-agent"
#   #chart      = "${path.module}/../helmcharts/synthetic-monitoring-agent"
#   chart = "D:/kumaresan/project/grafana-cloud/grafana-synthetic-monitoring-agent-helm/helmcharts/synthetic-monitoring-agent"
#   namespace  = var.namespace
#   version    = var.chart_version

#   atomic           = false
#   cleanup_on_fail  = false
#   force_update     = true
#   recreate_pods    = true

# #   set = [
# #     {
# #       name  = "apiServer"
# #       value = "synthetic-monitoring-grpc-ap-south-1.grafana.net:443"
# #     }
# #   ]

# #    values = [yamlencode({
# #     apiToken = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
# #   })]

# #   set_sensitive = [
# #     {
# #       name  = "apiToken"
# #       value = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
# #     }
# #   ]

# #  values = [yamlencode({
# #     apiToken = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
# #   })]

# # values = [yamlencode({
# #     agent = {
# #       apiToken        = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
# #       apiServerAddress = "synthetic-monitoring-grpc-ap-south-1.grafana.net:443"
# #     }
# #   })]


# values = [yamlencode({
#     agent = {
#       apiToken        = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
#       apiServerAddress = "synthetic-monitoring-grpc-ap-south-1.grafana.net:443"
#     }
#     replicaCount = 2
#     image = {
#       tag = "v0.51.2"
#     }
#   })]
# }



# resource "helm_release" "grafana_synthetic_monitoring" {
#   name       = "grafana-synthetic-monitoring"
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "synthetic-monitoring-agent"
#   namespace  = var.namespace
#   version    = var.chart_version
#   atomic           = false
#   cleanup_on_fail  = false
#   force_update     = true
#   recreate_pods    = true
#   values = [yamlencode({
#     agent = {
#       apiToken        = "/YwHR80VulFdnC5TXusaHl8vAX7kmrbDee7mMNYAPy2BsJnSyRz5GjbCyPA9U2PVX+vKjLwQjkvQmGvss8JWYSLYWo6quH4oJCQUZEEovxQpoeUWaw85tnOcpBPKKG7ylkkuuSh/VdYISNf17w0JzQjiK5Nb4cWcxcx3j6cxQS8="
#       apiServerAddress = "synthetic-monitoring-grpc-ap-south-1.grafana.net:443"
#     }
#     image = {
#       tag = "v0.51.2"
#     }
#   })]
# }




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