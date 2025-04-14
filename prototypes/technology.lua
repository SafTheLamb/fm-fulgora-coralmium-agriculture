data:extend({
  {
    type = "technology",
    name = "coralmium-recycling",
    icon = "__fulgora-coralmium-agriculture__/graphics/technology/coralmium-recycling.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="coralmium-recycling"},
      {type="unlock-recipe", recipe="inert-coralmium-seed-recycling"}
    },
    prerequisites = {"planet-discovery-fulgora"},
    research_trigger = {
      type = "mine-entity",
      entity = "coralmium-cluster"
    }
  }
})
