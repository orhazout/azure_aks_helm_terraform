output "namespace1_name" {
  value       = kubernetes_namespace.cicd.metadata[0].name
  description = "Namespace name"
}