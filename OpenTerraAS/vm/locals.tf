locals {
  common_tags = {
    company = var.company_shortname
    project = "${var.company_shortname}-${var.project_name}"
  }
}