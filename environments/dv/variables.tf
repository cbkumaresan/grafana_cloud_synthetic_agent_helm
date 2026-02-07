variable "api_server" {
  type        = string
  description = "Grafana API server for DV"
}

variable "api_token" {
  type        = string
  description = "Grafana API token for DV"
  sensitive   = true
}

variable "namespace" {
  type    = string
  default = "synthetic-monitoring-dv"
}

variable "chart_version" {
  type    = string
  default = "1.2.1"
}


variable "image_tag" {
  description = "Helm chart version"
  type        = string
  default     = "v0.51.2"
}
variable "workload_name" {
  default = "synthetic-monitoring-agent" # short, neat name
}