resource "kubernetes_namespace" "cicd" {
  metadata {
    name = var.namespace1
  }
}

resource "kubernetes_namespace" "observation" {
  metadata {
    name = "observation"
  }
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "staging" {
  metadata {
    name = "staging"
  }
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}