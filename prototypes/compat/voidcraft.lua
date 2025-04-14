if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")

  data:extend({
    VOIDCRAFT.voidcraft_recipe(
    {prefix="__fulgora-coralmium-agriculture__", subgroup="voidcraft-fulgora", img="coralmium-cluster", localised_name="entity-name.coralmium-cluster"},
      {"coralmium", "plastic-bar", "charged-coralmium-seed"}, "vpb-xab", vcc.advanced_resource, "s6x-void-fulgora", {0.3, 0.7, 0.8}),
  })
end
