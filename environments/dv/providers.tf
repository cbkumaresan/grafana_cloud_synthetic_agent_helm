provider "kubernetes" {
  config_path    = "C:/Users/Admin/.kube/config"
  config_context = "docker-desktop"
}

provider "helm" {
  kubernetes = {
    config_path    = "C:/Users/Admin/.kube/config"
    config_context = "docker-desktop"
  }
}
