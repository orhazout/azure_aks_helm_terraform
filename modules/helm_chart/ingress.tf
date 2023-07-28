resource "helm_release" "ingress_nginx" {
  name             = "ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "cicd"

  values = [file("./modules/helm_chart/ingress_nginx.yaml")]

    set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
  depends_on = [helm_release.jenkins]
}
