locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"

  virtnet_rg_name = "${var.virtnet_rg_name}${local.workspaces_suffix}"

  common_tags = {
    Workspace = terraform.workspace
  }
}
