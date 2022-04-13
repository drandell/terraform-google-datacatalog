project_id = "billing-budgets"
region     = "us-central1"

taxonomy_policy_tags = [
  {
    id                     = "my_taxonomy_id"
    display_name           = "My taxonomy display name"
    activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
    policy_tags = [{
      id           = "my_first_tag"
      display_name = "My First Tag"
      level_one = [
        {
          id           = "my_level_one_tag"
          display_name = "Lvl One Tag"
          parent_tag   = "my_first_tag"
        },
      ]
      level_two = [
        {
          id           = "my_level_two_tag"
          display_name = "Lvl Two Tag"
          parent_tag   = "my_level_one_tag"
        }
      ]
      level_three = [
        {
          id           = "my_level_three_tag"
          display_name = "Lvl Three Tag"
          parent_tag   = "my_level_two_tag"
        }
      ]
      level_four = [
        {
          id           = "my_level_four_tag"
          display_name = "Lvl Four Tag"
          parent_tag   = "my_level_three_tag"
        }
      ]
    }]
  }
]
