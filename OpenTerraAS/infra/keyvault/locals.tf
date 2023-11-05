locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  keyvault_rgname = "${var.keyvault_rgname}-${local.workspaces_suffix}"
  keyvault_name = "${var.keyvault_name}${local.workspaces_suffix}"
  keyvault_access_key_name = "${var.keyvault_access_key_name}${local.workspaces_suffix}"

  common_tags = {
    Workspace = terraform.workspace
  }
}
