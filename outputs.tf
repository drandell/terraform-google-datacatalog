output "tag_template_names" {
  value       = keys(module.data_catalog_tag_templates.self_links)
  description = "The ID of the tag templates with format {name}"
}

output "tag_template_self_links" {
  value       = [for tag_template in module.data_catalog_tag_templates.self_links : tag_template["id"]]
  description = "The URI of the tag templates created"
}

output "entry_self_links" {
  value       = [for entry in module.data_catalog_entries.self_links : entry["id"]]
  description = "The URI of the entries created"
}

output "entry_group_self_links" {
  value       = [for entry_group in module.data_catalog_entry_groups.self_links : entry_group["id"]]
  description = "The URI of the entry groups created"
}

output "taxonomy_self_links" {
  value       = [for taxonomy in module.data_catalog_taxonomy_policy_tags.taxonomy_self_links : taxonomy]
  description = "The URI of the taxonomies created"
}

output "policy_tag_self_links" {
  value       = [for policy_tag in module.data_catalog_taxonomy_policy_tags.policy_tag_self_links : policy_tag]
  description = "The URI of the policy tags created"
}
