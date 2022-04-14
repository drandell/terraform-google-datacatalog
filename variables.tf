variable "project_id" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Required) The region to host the resource in"
}

variable "tag_templates" {
  type = list(object({
    id           = string
    display_name = optional(string)
    force_delete = optional(bool)
    fields = list(object({
      id           = string
      type         = string
      values       = optional(list(string))
      description  = optional(string)
      display_name = optional(string)
      is_required  = optional(bool)
      order        = optional(number)
    }))
  }))
  description = "(Optional) A list of tag template resource objects"
  default     = []
}

variable "entry_groups" {
  type = list(object({
    id           = string
    display_name = optional(string)
    description  = optional(string)
  }))
  description = "(Optional) A list of entry group objects"
  default     = []
}

variable "entries" {
  type = list(object({
    id                    = string
    entry_group_id        = string
    type                  = string
    file_patterns         = optional(list(string))
    user_specified_system = optional(string)
    linked_resource       = optional(string)
    schema                = optional(string)
    display_name          = optional(string)
    description           = optional(string)
  }))
  description = "(Optional) A list of entry objects"
  default     = []
}

variable "tags" {
  type = list(object({
    id              = string
    tag_template_id = string
    parent          = string
    column          = optional(string)
    fields = list(object({
      name         = string
      type         = string
      value        = string
      spec         = optional(string)
      display_name = optional(string)
      order        = optional(number)
    }))
  }))
  description = "(Optional) A list of tag resource objects"
  default     = []
}

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
  description = "(Optional) A list of taxonomy and policy tags"
  default     = []
}
