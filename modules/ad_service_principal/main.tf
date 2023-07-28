resource "azuread_application" "app" {
  display_name = var.application_name
}

resource "azuread_service_principal" "sp" {
  application_id               = azuread_application.app.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = azuread_service_principal.sp.object_id 
  end_date_relative    = "8760h"  # 1 year
}

output "sp_id" {
  value = azuread_application.app.application_id
}

output "client_secret" {
  value = azuread_service_principal_password.sp_password.value
  description = "output password"
  sensitive = true
}

# resource "azuread_group" "aks_admins" {
#   display_name     = var.aad_group_aks_admins
#   security_enabled = true
#   owners           = [data.azuread_client_config.current.object_id]

#   members = [
#     data.azuread_client_config.current.object_id,
#     azuread_service_principal.spn.object_id,
#   ]
# }