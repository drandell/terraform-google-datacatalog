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
  description = "(Required) A list of tag template resource objects"
}

variable "entry_groups" {
  type = list(object({
    id           = string
    display_name = optional(string)
    description  = optional(string)
  }))
  description = "(Required) A list of entry group objects"
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

variable "project_id" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Required) The region to host the resource in"
}
