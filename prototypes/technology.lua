data:extend({
  {
    type = "technology",
    name = "coralmium-recycling",
    icon = "__wood-universe-assets__/graphics/technology/coralmium-recycling.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="coralmium-recycling"}
    },
    prerequisites = {"planet-discovery-fulgora"},
    research_trigger = {
      type = "mine-entity",
      entity = "coralmium-cluster"
    }
  }
})