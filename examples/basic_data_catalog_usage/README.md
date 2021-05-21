# Basic Data Catalog Usage

This example illustrates showcase some of the basic data catalog features.

It will:
- Create a tag template
- Create an entry group
- Create a tag using the tag template and assigning that to the entry group

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|-------------------|---------|:--------:|
| tag\_templates | A list of objects which include id, display_name and fields | <pre>list(object({ <br>    id           = string<br>    display_name = optional(string)<br>    force_delete = optional(bool)<br>    fields = list(object({      <br>      id           = string      <br>      type         = string      <br>      values       = optional(list(string))      <br>      display_name = optional(string)      <br>      is_required  = optional(bool)      <br>      order        = optional(number)    <br>   }))  <br>}))</pre> | n/a | yes |
| project\_id | The project ID to host the tag templates in | `string` | n/a | yes |
| region | The region to host the tag templates in | `string` | n/a | yes |
| entry\_groups | A list of objects which include id, description and display_name | <pre>list(object({ <br>    id           = string<br>    display_name = optional(string)<br>    description = optional(string)<br>}))</pre> | `[]` | no |
| tags | A list of objects which include id, tag_template_id and fields | <pre>list(object({ <br>    id           = string<br>    tag_template_id = string<br>    parent = string<br>    column = optional(string)<br>    fields = list(object({      <br>      id           = string      <br>      type         = string      <br>      value       = string      <br>      spec  = optional(bool)      <br>      display_name = optional(string)      <br>      order        = optional(number)    <br>   }))  <br>}))</pre> | `[]` | no |


## Outputs

| Name | Description |
|------|-------------|
| tag\_template\_names | The name of the tag templates resource(s) |
| tag\_template\_self\_links | The URI of the tag template resource(s) |


## Example Usage

```hcl
project_id = [YOUR PROJECT ID HERE]
region     = [YOUR REGION HERE]

tag_templates = [
  {
    id           = "my_template"
    display_name = "Demo Tag Template"
    force_delete = true
    fields = [
      {
        id   = "source"
        display_name = "Source of data asset"
        type = "STRING"
        is_required = true
      },
      {
        id   = "num_rows"
        display_name = "Number of rows in the data asset"
        type = "DOUBLE"
      },
      {
        id   = "pii_type"
        display_name = "PII type"
        type = "ENUM"
        values = [
          "EMAIL",
          "SOCIAL SECURITY NUMBER",
          "NONE"
        ]
      }
    ]
  }
]

entry_groups = [
  {
    id = "my_entry_group"
  }
]

tags = [
  {
    id              = "my_first_tag"
    tag_template_id = "my_template"
    parent          = "my_entry_group"
    fields = [
      {
        name  = "source",
        type  = "STRING",
        value = "oracle-db"
      },
      {
        name  = "num_rows"
        type  = "DOUBLE"
        value = "100"
      },
      {
        name  = "pii_type"
        type  = "ENUM",
        value = "NONE"
      }
    ]
  }
]
```

## Notes

### Tag Templates

* The Tag Template ID must contain only lowercase letters (a-z), numbers (0-9), or underscores (_), and must start with a letter or underscore. 
* Must contain at least one field and at most 500 fields.
* Field IDs can contain letters (both uppercase and lowercase), numbers (0-9), underscores (_) and dashes (-). Field IDs must be at least 1 character long and at most 64 characters long. Field IDs must also be unique within their template. Field IDs must start with a letter or underscore.
* The valid values for type in the tag_templates object are; `BOOL`, `DOUBLE`, `ENUM` and `STRING`, and `TIMESTAMP`. 
* If you provide the `ENUM` type you are expected to provide a set of `values`. This set must not be empty and can include up to 100 allowed values. The display names of the values in this set must not be empty and must be case-insensitively unique within this set.

### Entry Groups

### Tags
