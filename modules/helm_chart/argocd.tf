resource "helm_release" "argocd" {
  name  = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = var.namespace_cicd
  # version          = "4.9.7"

  values = [
    file("./modules/helm_chart/argocd.yaml")
  ]

  # set {
  #   name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/use-regex"
  #   value = "true"
  #   type  = "string"
  # }

  # set {
  #   name  = "server.ingress.enabled"
  #   value = "true"
  # }
  # set {
  #   name  = "server.ingress.https"
  #   value = "true"
  # }
  # set {
  #   name  = "server.ingress.ingressClassName"
  #   value = "nginx"
  # }
  # set {
  #   name  = "server.ingress.pathType"
  #   value = "Prefix"
  # }

}