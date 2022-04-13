
module "google_data_catalog" {
  source = "../../"

  project_id           = var.project_id
  region               = var.region
  taxonomy_policy_tags = var.taxonomy_policy_tags
}