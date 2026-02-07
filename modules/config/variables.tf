variable "api_server" {
  description = "Grafana Synthetic Monitoring API server URL"
  type        = string
}

variable "api_token" {
  description = "Grafana Synthetic Monitoring API token"
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Namespace for deployment"
  type        = string
  default     = "synthetic-monitoring"
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "1.2.1"
}

variable "image_tag" {
  description = "Helm chart version"
  type        = string
  default     = "v0.51.2"
}

variable "workload_name" {
  default = "synthetic-monitoring-agent" # short, neat name
}