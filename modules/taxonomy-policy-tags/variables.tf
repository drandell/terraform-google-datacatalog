variable "taxonomy_policy_tags" {
  type = list(object({
    id                     = string
    display_name           = string
    description            = optional(string)
    activated_policy_types = optional(list(string))
    policy_tags = optional(list(object({
      display_name = string
      description  = optional(string)
      level_two = optional(object({
        display_name = string
        description  = optional(string)
      })),
      level_three = optional(object({
        display_name = string
        description  = optional(string)
      })),
      level_four = optional(object({
        display_name = string
        description  = optional(string)
      }))
    })))
  }))
  description = "(Required) A list of taxonomy and policy tags"

  validation {
    condition     = alltrue([for taxonomy in var.taxonomy_policy_tags : taxonomy["activated_policy_types"] == null ? true : contains(["POLICY_TYPE_UNSPECIFIED", "FINE_GRAINED_ACCESS_CONTROL"], taxonomy["activated_policy_types"])])
    error_message = "Supported policy types are 'FINE_GRAINED_ACCESS_CONTROL' and 'POLICY_TYPE_UNSPECIFIED'."
  }
}

variable "project" {
  type        = string
  description = "(Optional) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Optional) The region to host the resource in"
}
