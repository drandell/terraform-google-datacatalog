variable "project" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Required) The region to host the resource in"
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
  default     = []
  description = "(Optional) A list of entry objects"
}


variable "entry_group_self_links" {
  type        = map(any)
  default     = {}
  description = "(Optional) A map of entry group self_links"
}