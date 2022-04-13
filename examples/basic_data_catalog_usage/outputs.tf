output "tag_template_names" {
  value       = module.google_data_catalog.tag_template_names
  description = "The ID of the tag templates with format {name}"
}

output "tag_template_self_links" {
  value       = module.google_data_catalog.tag_template_self_links
  description = "The URI of the tag templates created"
}

