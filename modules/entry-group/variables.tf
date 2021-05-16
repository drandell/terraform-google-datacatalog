variable "entry_groups" {
  type = list(object({
    id           = string
    display_name = optional(string)
    description  = optional(string)
  }))
  description = "(Required) A list of entry group objects"
}

variable "project" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Required) The region to host the resource in"
}
