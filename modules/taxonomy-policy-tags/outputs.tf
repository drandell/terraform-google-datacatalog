# output "taxonomy_self_link" {
#   value       = google_data_catalog_taxonomy.collection["name"]
#   description = "Taxonomy self link"
# }

# output "policy_tag_self_links" {
#   value       = [for policy_tag in google_data_catalog_policy_tag.policies : policy_tag["name"]]
#   description = "List of policy tags self links"
# }
