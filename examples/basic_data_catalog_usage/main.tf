
module "google_data_catalog" {
  source = "../../"

  project_id    = var.project_id
  region        = var.region
  tag_templates = var.tag_templates
  entry_groups  = var.entry_groups
  tags          = var.tags
}