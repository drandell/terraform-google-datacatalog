locals {

  lvl_one_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : {
        taxonomy_id  = taxonomy["id"]
        id           = tag != {} ? lower(trimspace(tag["display_name"])) : null
        display_name = tag != {} ? tag["display_name"] : null
        description  = tag != {} ? tag["description"] : null
      }
    ]
  ])

  lvl_two_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : {
        taxonomy_id  = taxonomy["id"]
        lvl_one_id   = tag != {} ? lower(trimspace(tag["display_name"])) : null
        id           = tag["level_two"] != null ? lower(trimspace(tag["level_two"]["display_name"])) : null
        display_name = tag["level_two"] != null ? tag["level_two"]["display_name"] : null
        description  = tag["level_two"] != null ? tag["level_two"]["description"] : null
      }
    ]
  ])

  lvl_three_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : {
        taxonomy_id  = taxonomy["id"]
        lvl_two_id   = tag != {} && tag["level_two"] != null ? lower(trimspace(tag["level_two"]["display_name"])) : null
        id           = tag["level_three"] != null ? lower(trimspace(tag["level_three"]["display_name"])) : null
        display_name = tag["level_three"] != null ? tag["level_three"]["display_name"] : null
        description  = tag["level_three"] != null ? tag["level_three"]["description"] : null
      }
    ]
  ])

  lvl_four_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : {
        taxonomy_id  = taxonomy["id"]
        lvl_three_id = tag != {} && tag["level_two"] != null && tag["level_three"] != null ? lower(trimspace(tag["level_three"]["display_name"])) : null
        id           = tag["level_four"] != null ? lower(trimspace(tag["level_four"]["display_name"])) : null
        display_name = tag["level_four"] != null ? tag["level_four"]["display_name"] : null
        description  = tag["level_four"] != null ? tag["level_four"]["description"] : null
      }
    ]
  ])
}

resource "google_data_catalog_taxonomy" "collection" {
  provider = google-beta

  for_each               = { for taxonomy in var.taxonomy_policy_tags : taxonomy["id"] => taxonomy }
  project                = var.project
  region                 = var.region
  display_name           = each.value["display_name"]
  description            = each.value["description"]
  activated_policy_types = lookup(each.value, "activated_policy_types", "POLICY_TYPE_UNSPECIFIED")
}

// Bit of a hack, but currently policy tags can only be 4 layers deep
// So lets just hard-code that into our configuration
resource "google_data_catalog_policy_tag" "lvl_one" {
  provider = google-beta

  for_each     = { for tag in local.lvl_one_policy_tags : tag["id"] => tag if tag["id"] != null }
  taxonomy     = google_data_catalog_taxonomy.collection[each.value["taxonomy_id"]].id
  display_name = each.value["display_name"]
  description  = each.value["description"]
}

resource "google_data_catalog_policy_tag" "lvl_two" {
  provider = google-beta

  for_each          = { for tag in local.lvl_two_policy_tags : tag["id"] => tag if tag["id"] != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value["taxonomy_id"]].id
  display_name      = each.value["display_name"]
  description       = each.value["tag_description"]
  parent_policy_tag = google_data_catalog_policy_tag.lvl_one[each.value["lvl_one_id"]].id

  depends_on = [
    google_data_catalog_policy_tag.lvl_one
  ]
}

resource "google_data_catalog_policy_tag" "lvl_three" {
  provider = google-beta

  for_each          = { for tag in local.lvl_three_policy_tags : tag["id"] => tag if tag["id"] != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value["taxonomy_id"]].id
  display_name      = each.value["display_name"]
  description       = each.value["description"]
  parent_policy_tag = google_data_catalog_policy_tag.lvl_two[each.value["lvl_two_id"]].id

  depends_on = [
    google_data_catalog_policy_tag.lvl_one,
    google_data_catalog_policy_tag.lvl_two
  ]
}

resource "google_data_catalog_policy_tag" "lvl_four" {
  provider = google-beta

  for_each          = { for tag in local.lvl_four_policy_tags : tag["id"] => tag if tag["id"] != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value["taxonomy_id"]].id
  display_name      = each.value["display_name"]
  description       = each.value["description"]
  parent_policy_tag = google_data_catalog_policy_tag.lvl_three[each.value["lvl_three_id"]].id

  depends_on = [
    google_data_catalog_policy_tag.lvl_one,
    google_data_catalog_policy_tag.lvl_two,
    google_data_catalog_policy_tag.lvl_three
  ]
}
