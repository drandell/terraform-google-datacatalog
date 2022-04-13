# Data Catalog Taxonomy Policy Tags

This example illustrates showcase some of the taxonomy and policy tag features in data catalog.

It will:
- Create a taxonomy
- Create a series of policy tags and sub tags 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|-------------------|---------|:--------:|
| project\_id | The project ID to host the tag templates in | `string` | n/a | yes |
| region | The region to host the tag templates in | `string` | n/a | yes |
| taxonomy_policy_tags | A list of taxonomy and policy tag definitions | <pre>list(object({<br>    id                     = string<br>    display_name           = string<br>    description            = optional(string)<br>    activated_policy_types = optional(list(string))<br>    policy_tags = optional(list(object({<br>      id = string<br>      display_name = string<br>      description  = optional(string)<br>      level_one = optional(list(object({<br>        id = string<br>        display_name = string<br>        parent_tag   = string<br>        description  = optional(string)<br>      }))),<br>      level_two = optional(list(object({<br>        id = string<br>        display_name = string<br>        parent_tag   = string<br>        description  = optional(string)<br>      }))),<br>      level_three = optional(list(object({<br>        id = string<br>        display_name = string<br>        parent_tag   = string<br>        description  = optional(string)<br>      }))),<br>      level_four = optional(list(object({<br>        id = string<br>        display_name = string<br>        parent_tag   = string<br>        description  = optional(string)<br>      })))<br>    })))<br>  }))</pre> | `[]` | no |

## Outputs

N/A

## Example Usage

See [Terraform Tfvars](./terraform.tfvars) for the example use

## Notes

### Taxonomy

### Policy Tags
