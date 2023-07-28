resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = "observation"
  repository = "https://prometheus-community.github.io/helm-charts"

  # set {
  #   name  = "grafana.ingress.enabled"
  #   value = "true"
  # }
  # set {
  #   name  = "grafana.ingress.ingressClassName"
  #   value = "nginx"
  # }
  # # annotations:
  # #   nginx.ingress.kubernetes.io/ssl-redirect: "false"
  # #   nginx.ingress.kubernetes.io/use-regex: "true"
  # #   nginx.ingress.kubernetes.io/rewrite-target: /$1

  # set {
  #   name  = "grafana.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/use-regex"
  #   value = "true"
  #   type  = "string"
  # }
  # set {
  #   name  = "grafana.adminUser"
  #   value = "orhazout"
  # }
  # set {
  #   name  = "grafana.adminPassword"
  #   value = "orhazout"
  # }
}


