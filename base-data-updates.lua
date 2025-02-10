local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

frep.add_result("scrap-recycling", {type="item", name="firearm-magazine", amount=1, probability=0.03, show_details_in_recipe_tooltip = false})
frep.remove_result("scrap-recycling", "stone")

table.insert(data.raw["simple-entity"]["fulgoran-ruin-huge"].minable.results, {type="item", name="charged-coralmium-seed", amount_min=1, amount_max=3})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-colossal"].minable.results, {type="item", name="inert-coralmium-seed", amount_min=1, amount_max=3})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="inert-coralmium-seed", amount_min=7, amount_max=9})

if mods["aai-industry"] then
  frep.add_result("coralmium-recycling", {type="item", name="glass", amount=1, probability=0.04, show_details_in_recipe_tooltip=false})
end

ftech.add_unlock("holmium-processing", "synthetic-wood")

ftech.add_prereq("electromagnetic-plant", "coralmium-recycling")
ftech.add_unlock("electromagnetic-plant", "coralmium-seed-repolarization")

if not mods["early-agriculture"] then
  ftech.add_unlock("coralmium-recycling", "agricultural-tower")
end

ftech.add_unlock("coralmium-recycling", "burnt-spoilage")
if not mods["wood-industry"] then
  data.raw.recipe["burnt-spoilage"].category = "organic-or-chemistry"
end
