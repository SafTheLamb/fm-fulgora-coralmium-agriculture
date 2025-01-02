for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  
  recipes["inert-coralmium-seed-recycling"].enabled = technologies["coralmium-recycling"].researched
  recipes["synthetic-wood"].enabled = technologies["holmium-processing"].researched
  recipes["coralmium-seed-repolarization"].enabled = technologies["electromagnetic-plant"].researched
  recipes["reactivated-charcoal"].enabled = technologies["electromagnetic-plant"].researched
end
