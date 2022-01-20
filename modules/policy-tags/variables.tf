variable "taxonomy_policy_tags" {
  type = object({
    id           = string
    display_name = string
    description  = optional(string)
    activated_policy_types = optional(list(string))
    policy_tags  = list(object({
      display_name  = string
      description   = optional(string)
      parent        = optional(string)
    }))
  })
  description = "(Required) A list of taxonomy and policy tags"

  validation {
    condition     = contains(["POLICY_TYPE_UNSPECIFIED", "FINE_GRAINED_ACCESS_CONTROL"], activated_policy_types)
    error_message = "Supported policy types are 'FINE_GRAINED_ACCESS_CONTROL' and 'POLICY_TYPE_UNSPECIFIED'"
  }
}

variable "project_id" {
  type        = string
  description = "(Optional) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Optional) The region to host the resource in"
}
