output "tag_template_names" {
  value       = keys(module.data_catalog_tag_templates.self_links)
  description = "The ID of the tag templates with format {name}"
}

output "tag_template_self_links" {
  value       = [for tag_template in module.data_catalog_tag_templates.self_links : tag_template["id"]]
  description = "The URI of the tag templates created"
}

