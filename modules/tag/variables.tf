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
  description = "(Required) A list of tag resource objects"
}

variable "tag_templates" {
  type = map(object({
    name = string
  }))
  default     = {}
  description = "(Required) A map of tag template objects"
}

variable "entry_groups" {
  type = map(object({
    name = string
  }))
  default     = {}
  description = "(Optional) A map of entry group objects"
}
