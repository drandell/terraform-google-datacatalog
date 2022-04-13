output "self_links" {
  value       = { for entry_group in google_data_catalog_entry_group.entry_group : element(split("/", entry_group["id"]), 5) => entry_group }
  description = "Map of the entry groups created"
}