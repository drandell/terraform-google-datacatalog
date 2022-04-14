locals {
  gcs_entries = { for entry in var.entries : entry["id"] => entry if upper(entry["type"]) == "FILESET" }
  entries     = { for entry in var.entries : entry["id"] => entry if upper(lookup(entry, "type", "NON_FILESET")) != "FILESET" }
}

resource "google_data_catalog_entry" "gcs_entries" {
  for_each     = local.gcs_entries
  entry_id     = each.key
  entry_group  = try(var.entry_group_self_links[each.value["entry_group_id"]], each.value["entry_group_id"])
  display_name = each.value["display_name"]
  description  = each.value["description"]
  type         = upper(each.value["type"])

  gcs_fileset_spec {
    file_patterns = [for pattern in each.value["file_patterns"] : pattern]
  }
}

resource "google_data_catalog_entry" "entries" {
  for_each              = local.entries
  entry_id              = each.key
  entry_group           = try(var.entry_group_self_links[each.value["entry_group_id"]].id, each.value["entry_group_id"])
  display_name          = each.value["display_name"]
  description           = each.value["description"]
  user_specified_system = each.value["user_specified_system"]
  user_specified_type   = each.value["type"]
  linked_resource       = each.value["linked_resource"]
  schema                = lookup(each.value, "schema", null) != null ? fileexists(each.value["schema"]) ? jsonencode(file(each.value["schema"])) : null : null
}
