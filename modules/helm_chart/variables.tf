variable "kube_host" {
  description = "Name of the helm host"
}

variable "kube_client_certificate" {
  description = "Name of the helm client certificate"
}

variable "kube_client_key" {
  description = "Name of the helm client key"
}

variable "kube_cluster_ca_certificate" {
  description = "Name of the helm cluster ca certificate"
}

variable "namespace_cicd" {
  description = "cicd namespace"
}