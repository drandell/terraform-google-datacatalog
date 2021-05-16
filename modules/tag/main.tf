locals {
  tags = { for tag in var.tags : tag["id"] => tag }
}

resource "google_data_catalog_tag" "tag" {
    for_each = local.tags
    template = coalesce(var.tag_templates[each.value.tag_template_id]["name"])
    parent   = coalesce(var.entry_groups[each.value.parent]["name"])
    column   = each.value.column

    dynamic "fields" {
        for_each = { for field in each.value.fields : field["name"] => field if field["type"] == "BOOL" }
        content {
            field_name    = fields.key
            display_name  = fields.value["display_name"]
            order         = fields.value["order"]
            bool_value    = tobool(fields.value["value"]) 
        }
    }

    dynamic "fields" {
        for_each = { for field in each.value.fields : field["name"] => field if field["type"] == "DOUBLE" }
        content {
            field_name    = fields.key
            display_name  = fields.value["display_name"]
            order         = fields.value["order"]
            double_value  = tonumber(fields.value["value"]) 
        }
    }

    dynamic "fields" {
        for_each = { for field in each.value.fields : field["name"] => field if field["type"] == "ENUM" }
        content {
            field_name    = fields.key
            display_name  = fields.value["display_name"]
            order         = fields.value["order"]
            enum_value  = fields.value["value"]
        }
    }

    dynamic "fields" {
        for_each = { for field in each.value.fields : field["name"] => field if field["type"] == "STRING" }
        content {
            field_name    = fields.key
            display_name  = fields.value["display_name"]
            order         = fields.value["order"]
            string_value  = fields.value["value"]
        }
    }

    dynamic "fields" {
        for_each = { for field in each.value.fields : field["name"] => field if field["type"] == "TIMESTAMP" }
        content {
            field_name      = fields.key
            display_name    = fields.value["display_name"]
            order           = fields.value["order"]
            timestamp_value = formatdate(fields.value["spec"], fields.value["value"])
        }
    }
}