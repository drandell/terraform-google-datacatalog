project_id = "billing-budgets"
region     = "us-central1"
tag_templates = [
  {
    id           = "my_template"
    display_name = "Demo Tag Template"
    force_delete = true
    fields = [
      {
        id           = "source"
        display_name = "Source of data asset"
        type         = "STRING"
        is_required  = true
      },
      {
        id           = "num_rows"
        display_name = "Number of rows in the data asset"
        type         = "DOUBLE"
      },
      {
        id           = "pii_type"
        display_name = "PII type"
        type         = "ENUM"
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

entries = [
  {
    id                    = "my_entry"
    entry_group_id        = "my_entry_group"
    type                  = "custom_type"
    user_specified_system = "my_custom_system"
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