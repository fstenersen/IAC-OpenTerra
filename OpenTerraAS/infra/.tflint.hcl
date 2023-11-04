# This is a configuration file for tflint. It is used to disable some rules that are not relevant for this project.
rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_typed_variables" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}
