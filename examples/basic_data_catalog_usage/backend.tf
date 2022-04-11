terraform {
  backend "gcs" {
    bucket = "billing-budgets-tf-state"
    prefix = "terraform/tag-template/state"
  }

  experiments = [
    module_variable_optional_attrs
  ]
}