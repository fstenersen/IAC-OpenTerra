locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"

  keyvault_rgname = "${var.keyvault_rgname}${local.workspaces_suffix}"
}
