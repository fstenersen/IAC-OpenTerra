locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  lagring_rgname = "${var.lagring_rgname}-${local.workspaces_suffix}"
  lagring_sa_name = "${lower(var.lagring_base_name)}${random_string.tilfeldig_streng.result}${local.workspaces_suffix}"
  lagring_container_name = "${var.lagring_container_name}-${local.workspaces_suffix}"

  common_tags = {
    Workspace = terraform.workspace
  }
}