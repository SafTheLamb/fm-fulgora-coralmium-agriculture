local function fulgora_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        filenames =
        {
          "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__wood-universe-assets__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    table.insert(variations, variation)
  end
  return variations
end

local function fulgora_seed_variations(name, variation_count)
  local scale_multiplier = 1
  local variations = {}
  for i = 1, variation_count do
    local variation = {
      trunk = {
        filename = "__wood-universe-assets__/graphics/icons/"..name.."-"..i..".png",
        width = 64,
        height = 64,
        repeat_count = 2,
        shift = {0,0},
        scale = 0.33 * scale_multiplier
      },
      leaves = util.empty_animation(),
      -- leaf_generation = {
      --   type = "create-particle",
      --   particle_name = "leaf-particle",
      --   initial_height = 2,
      --   repeat_count = 0
      -- },
      -- branch_generation = {
      --   type = "create-particle",
      --   particle_name = "branch-particle",
      --   initial_height = 2,
      --   repeat_count = 0
      -- }
    }
    table.insert(variations, variation)
  end
  return variations
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

data:extend({
  {
    type = "plant",
    name = "coralmium-cluster",
    icon = "__wood-universe-assets__/graphics/icons/coralmium-cluster.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable = {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "coralmium", amount = 50}},
      mining_trigger = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-iceberg", 7, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-iceberg", 4, 0.7),
    growth_ticks = 10 * minute,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    impact_category = "tree",
    -- factoriopedia_simulation = simulations.factoriopedia_sunnycomb,
    autoplace = {
      probability_expression = "0",
      tile_restriction = {"oil-ocean-shallow"}
    },
    variations = fulgora_tree_variations("coralmium", 10, 5, nil, 3200/5, 1120/2),
    colors = minor_tints(),
    agricultural_tower_tint = {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    ambient_sounds = {
      sound = {
        variations = sound_variations("__wood-universe-assets__/sound/world/plants/coralmium", 4, 0.7),
        advanced_volume_control = {
          fades = {
            fade_in = {
              curve_type = "cosine",
              from = {control=0.5, volume_percentage=0.0},
              to = {1.5, 100.0}
            }
          }
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "inert-coralmium-seed",
    localised_name = {"item-name.inert-coralmium-seed"},
    icon = "__wood-universe-assets__/graphics/icons/inert-coralmium-seed.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable = {
      mining_time = 0.5,
      results = {{type = "item", name = "inert-coralmium-seed", amount = 1}},
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-iceberg", 7, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-iceberg", 4, 0.7),
    growth_ticks = 1,
    max_health = 50,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    impact_category = "tree",
    -- factoriopedia_simulation = simulations.factoriopedia_sunnycomb,
    autoplace = {
      probability_expression = "0",
      tile_restriction = {"oil-ocean-shallow"}
    },
    variations = fulgora_seed_variations("inert-coralmium-seed", 4),
    colors = minor_tints(),
    agricultural_tower_tint = {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    ambient_sounds = {
      sound = {
        variations = sound_variations("__wood-universe-assets__/sound/world/plants/coralmium", 4, 0.7),
        advanced_volume_control = {
          fades = {
            fade_in = {
              curve_type = "cosine",
              from = {control=0.5, volume_percentage=0.0},
              to = {1.5, 100.0}
            }
          }
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = {128, 128, 128},
  }
})
