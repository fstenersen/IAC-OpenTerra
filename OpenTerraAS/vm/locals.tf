locals {
  common_tags = {
    company = var.company_shortname
    project = "${var.company_shortname}-${var.project_name}"
  }


  workspaces_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"

  vm_rg_name = "${var.vm_rg_name}${local.workspaces_suffix}"
  
}