locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"

  backend_sa_basename = "${lower(var.backend_sa_basename)}${random_pet.sa_name.id}${local.workspaces_suffix}"
  backend_container_name = "${var.backend_container_name}${local.workspaces_suffix}"
}