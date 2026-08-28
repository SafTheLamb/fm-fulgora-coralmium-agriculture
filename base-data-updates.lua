local frep = require("__fdsl__.lib.recipe")

if settings.startup["coralmium-modify-vanilla"].value then
	frep.replace_result("scrap-recycling", "stone", "firearm-magazine")
	if mods["wood-logistics"] then
		local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
		frep.add_ingredient("recycler", {type="item", name=lumber_item, amount=20})
		frep.add_ingredient("electromagnetic-plant", {type="item", name=lumber_item, amount=100})
	end
	if not mods["wood-industry"] then
		frep.add_category("burnt-spoilage", "chemistry")
		data.raw.recipe["burnt-spoilage"].allow_decomposition = false
	end
end

table.insert(data.raw["simple-entity"]["fulgoran-ruin-huge"].minable.results, {type="item", name="charged-coralmium-seed", amount_min=1, amount_max=3})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-colossal"].minable.results, {type="item", name="inert-coralmium-seed", amount_min=1, amount_max=3})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="inert-coralmium-seed", amount_min=7, amount_max=9})

if mods["aai-industry"] or (mods["crushing-industry"] and settings.startup["crushing-industry-glass"].value) then
	frep.add_result_probability("coralmium-recycling", "stone", -0.02)
	frep.add_shared_probability_result("coralmium-recycling", {type="item", name="glass", amount=1, show_details_in_recipe_tooltip=false}, 0.02)
end
