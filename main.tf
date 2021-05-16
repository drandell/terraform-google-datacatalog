module "data_catalog_tag_templates" {
  source = "./modules/tag-template"

  project_id    = var.project_id
  region        = var.region
  tag_templates = var.tag_templates
}

module "data_catalog_entry_groups" {
  source  = "./modules/entry-group"
  
  project         = var.project_id
  region          = var.region
  entry_groups    = var.entry_groups
}

module "data_catalog_tags" {
  source  = "./modules/tag"
  
  tags          = var.tags
  entry_groups  = module.data_catalog_entry_groups.self_links
  tag_templates = module.data_catalog_tag_templates.self_links

  depends_on = [
    module.data_catalog_tag_templates,
    module.data_catalog_entry_groups
  ]
}