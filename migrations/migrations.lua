for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods
  
  recipes["inert-coralmium-seed-recycling"].enabled = technologies["coralmium-recycling"].researched
  recipes["synthetic-wood"].enabled = technologies["holmium-processing"].researched
  recipes["coralmium-seed-repolarization"].enabled = technologies["electromagnetic-plant"].researched
  if technologies["coralmium-recycling"].researched then
    recipes["burnt-spoilage"].enabled = true
    if not mods["early-agriculture"] then
      recipes["agricultural-tower"].enabled = true
    end
  end
end
