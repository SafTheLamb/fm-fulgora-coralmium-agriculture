local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

data:extend({
  {
    type = "recipe",
    name = "coralmium-seed-repolarization",
    localised_name = {"recipe-name.coralmium-seed-repolarization"},
    category = "electromagnetics",
    subgroup = "fulgora-processes",
    order = "c[coralmium]-b[repolarization]",
    enabled = false,
    auto_recycle = false,
    allow_productivity = false,
    energy_required = 10,
    ingredients = {
      {type="item", name="inert-coralmium-seed", amount=1},
      {type="fluid", name="electrolyte", amount=10},
    },
    results = {{type="item", name="charged-coralmium-seed", amount=1, ignored_by_productivity=1}}
  },
  {
    type = "recipe",
    name = "inert-coralmium-seed-recycling",
    icons = {
      {icon="__quality__/graphics/icons/recycling.png"},
      {icon="__wood-universe-assets__/graphics/icons/inert-coralmium-seed.png", scale=0.4},
      {icon="__quality__/graphics/icons/recycling-top.png"}
    },
    category = "recycling",
    subgroup = "fulgora-processes",
    order = "c[coralmium]-a[cracking]",
    enabled = false,
    auto_recycle = false,
    energy_required = 0.875,
    ingredients = {{type="item", name="inert-coralmium-seed", amount=1}},
    results = {{type="item", name="charged-coralmium-seed", amount=1, probability=0.25}},
    main_product = ""
  },
  {
    type = "recipe",
    name = "coralmium-recycling",
    icons = {
      {icon="__quality__/graphics/icons/recycling.png"},
      {icon="__wood-universe-assets__/graphics/icons/coralmium.png", scale=0.4},
      {icon="__quality__/graphics/icons/recycling-top.png"}
    },
    category = "recycling-or-hand-crafting",
    subgroup = "fulgora-processes",
    order = "c[coralmium]-c[recycling]",
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 0.2,
    ingredients = {{type="item", name="coralmium", amount=1}},
    results = {
      {type="item", name="inert-coralmium-seed",   amount=1, probability=0.03, show_details_in_recipe_tooltip=false},
      {type="item", name="charged-coralmium-seed", amount=1, probability=0.01, show_details_in_recipe_tooltip=false, amount_spoiled=0.5},
      {type="item", name="plastic-bar",            amount=1, probability=0.70, show_details_in_recipe_tooltip=false},
      {type="item", name="stone",                  amount=1, probability=0.10, show_details_in_recipe_tooltip=false},
      {type="item", name="concrete",               amount=1, probability=0.03, show_details_in_recipe_tooltip=false},
      {type="item", name="processing-unit",        amount=1, probability=0.01, show_details_in_recipe_tooltip=false},
      {type="item", name="low-density-structure",  amount=1, probability=0.01, show_details_in_recipe_tooltip=false},
      {type="item", name="carbon",                 amount=1, probability=0.09, show_details_in_recipe_tooltip=false},
      {type="item", name="holmium-ore",            amount=1, probability=0.02, show_details_in_recipe_tooltip=false}
    }
  },
  {
    type = "recipe",
    name = "synthetic-wood",
    localised_name = {lumber_item == "lumber" and "recipe-name.synthetic-lumber" or "recipe-name.synthetic-wood"},
    icons = {
      {icon=(lumber_item == "lumber") and "__wood-base-assets__/graphics/icons/lumber.png" or "__base__/graphics/icons/wood.png"},
      {icon="__space-age__/graphics/icons/fluid/holmium-solution.png", shift={-8,-8}, scale=0.3}
    },
    category = "organic-or-chemistry",
    subgroup = "fulgora-processes",
    order = "d[wood]-a[synthetic-wood]",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    ingredients = {
      {type="item", name="plastic-bar", amount=2},
      {type="fluid", name="holmium-solution", amount=10}
    },
    results = {{type="item", name=lumber_item, amount=3}}
  }
})
