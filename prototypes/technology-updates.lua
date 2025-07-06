local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("holmium-processing", "synthetic-wood")

ftech.add_prereq("electromagnetic-plant", "coralmium-recycling")
ftech.add_unlock("electromagnetic-plant", "coralmium-seed-repolarization")

if not mods["early-agriculture"] then
  ftech.add_unlock("coralmium-recycling", "agricultural-tower")
end

ftech.add_unlock("coralmium-recycling", "burnt-spoilage")

local scrap_prod_tech = data.raw.technology["scrap-recycling-productivity"]
if scrap_prod_tech and scrap_prod_tech.effects then
	table.insert(scrap_prod_tech.effects, {type="change-recipe-productivity", recipe="coralmium-recycling", change=0.1})
end
