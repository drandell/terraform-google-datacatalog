terraform {
  backend "gcs" {
    bucket = "billing-budgets-tf-state"
    prefix = "terraform/policy-tags/state"
  }

  experiments = [
    module_variable_optional_attrs
  ]
}