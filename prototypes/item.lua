local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local subgroup = mods["bioprocessing-tab"] and "fulgora-agriculture" or "fulgora-processes"

data:extend({
  {
    type = "item",
    name = "inert-coralmium-seed",
    icon = "__wood-universe-assets__/graphics/icons/inert-coralmium-seed.png",
    pictures = {
      {size=64, filename="__wood-universe-assets__/graphics/icons/inert-coralmium-seed-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-universe-assets__/graphics/icons/inert-coralmium-seed-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-universe-assets__/graphics/icons/inert-coralmium-seed-3.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-universe-assets__/graphics/icons/inert-coralmium-seed-4.png", scale=0.5, mipmap_count=4},
    },
    subgroup = subgroup,
    order = "c[coralmium]-a[inert-seed]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "fulgora",
    weight = 10 * kg
  },
  {
    type = "item",
    name = "charged-coralmium-seed",
    localised_name={"item-name.charged-coralmium-seed"},
    icon = "__wood-universe-assets__/graphics/icons/charged-coralmium-seed.png",
    pictures = {
      {size=64, filename="__wood-universe-assets__/graphics/icons/charged-coralmium-seed.png", scale=1/3, mipmap_count=4}
    },
    subgroup = subgroup,
    order = "c[coralmium]-b[charged-seed]",
    plant_result = "coralmium-cluster",
    place_result = "coralmium-cluster",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "fulgora",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "10MJ",
    spoil_ticks = 30 * minute,
    spoil_result = "inert-coralmium-seed"
  },
  {
    type = "item",
    name = "coralmium",
    icon = "__wood-universe-assets__/graphics/icons/coralmium.png",
    pictures = {
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium.png",   scale=0.5, mipmap_count=4},
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium-1.png", scale=0.5, mipmap_count=4},
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium-2.png", scale=0.5, mipmap_count=4},
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium-3.png", scale=0.5, mipmap_count=4},
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium-4.png", scale=0.5, mipmap_count=4},
      { size=64, filename="__wood-universe-assets__/graphics/icons/coralmium-5.png", scale=0.5, mipmap_count=4}
    },
    subgroup = subgroup,
    order = "c[coralmium]-c[coralmium]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "fulgora",
    weight = 2*kg
  },
})
