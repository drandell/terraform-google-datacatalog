variable "taxonomy_policy_tags" {
  type = list(object({
    id                     = string
    display_name           = string
    description            = optional(string)
    activated_policy_types = optional(list(string))
    policy_tags = optional(list(object({
      id           = string
      display_name = string
      description  = optional(string)
      level_one = optional(list(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_two = optional(list(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_three = optional(list(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_four = optional(list(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      })))
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
