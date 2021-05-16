locals {
  groups = { for group in var.entry_groups : group["id"] => group }
}

resource "google_data_catalog_entry_group" "entry_group" {
  for_each       = local.groups
  entry_group_id = each.key
  display_name   = each.value.display_name
  description    = each.value.description

  project = var.project
  region  = var.region
}