locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    environment  = var.environment
    costcenter   = var.costcenter
    owner        = var.owner
    billing_code = var.billing_code
  }
}