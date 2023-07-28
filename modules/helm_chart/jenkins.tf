resource "helm_release" "jenkins" {
  name             = "jenkins"
  repository       = "https://charts.jenkins.io"
  chart            = "jenkins"
  namespace        = var.namespace_cicd

  values = [file("./modules/helm_chart/jenkins.yaml")]

  set_sensitive {
    name  = "controller.adminUser"
    value = "orhazout"
  }

  set_sensitive {
    name  = "controller.adminPassword"
    value = "orhazout"
  }

  #  set {
  #   name  = "server.ingress.enabled"
  #   value = "true"
  # }

  #   set {
  #   name  = "server.ingress.ingressClassName"
  #   value = "nginx"
  # }

  # set {
  #   name  = "server.ingress.pathType"
  #   value = "Prefix"
  # }

  #   set {
  #   name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/use-regex"
  #   value = "true"
  #   type  = "string"
  # }

}


 