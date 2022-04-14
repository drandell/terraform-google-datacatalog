output "self_links" {
  value       = { for entry in merge(google_data_catalog_entry.gcs_entries, google_data_catalog_entry.entries) : element(split("/", entry["id"]), 5) => entry }
  description = "Map of the entries created"
}
