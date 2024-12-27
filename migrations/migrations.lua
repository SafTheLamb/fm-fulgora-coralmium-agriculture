for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["inert-coralmium-seed-recycling"].enabled = technologies["coralmium-recycling"].researched
end
