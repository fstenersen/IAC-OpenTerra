locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"

  lagring_rgname = "${var.lagring_rgname}${local.workspaces_suffix}"
}