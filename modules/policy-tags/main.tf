resource "google_data_catalog_taxonomy" "collection" {
  provider = google-beta

  project                = var.project
  region                 = var.region
  display_name           = var.taxonomy_policy_tags["display_name"]
  description            = var.taxonomy_policy_tags["description"]
  activated_policy_types = var.taxonomy_policy_tags["activated_policy_types"]
}

resource "google_data_catalog_policy_tag" "policies" {
  provider = google-beta

  for_each          = var.taxonomy_policy_tags["policy_tags"]
  taxonomy          = google_data_catalog_taxonomy.collection.id
  display_name      = each.value["display_name"]
  description       = each.value["description"]
  parent_policy_tag = each.value["parent"]
}
