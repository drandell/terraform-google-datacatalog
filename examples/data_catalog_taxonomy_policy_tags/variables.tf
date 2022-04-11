variable "taxonomy_policy_tags" {
  type = list(object({
    id                     = string
    display_name           = string
    description            = optional(string)
    activated_policy_types = optional(list(string))
    policy_tags = optional(list(object({
      display_name = string
      description  = optional(string)
      level_two    = optional(object({
        display_name = string
        description  = optional(string)
      })),
      level_three   = optional(object({
        display_name = string
        description  = optional(string)
      })),
      level_four   = optional(object({
        display_name = string
        description  = optional(string)
      }))
    })))
  }))
  description = "(Required) A list of taxonomy and policy tags"
}

variable "project_id" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Required) The region to host the resource in"
}
