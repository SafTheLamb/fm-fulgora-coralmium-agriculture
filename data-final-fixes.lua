if mods["fulgora-extended"] then
  local ruins_to_modify = {
    {
      result = {type="item", name="charged-coralmium-seed", amount_min=1, amount_max=3},
      names = {
        "fulgoran-ruin-huge",
        "fulgoran-ruin-huge-breakdown-1"
      }
    },
    {
      result = {type="item", name="inert-coralmium-seed", amount_min=1, amount_max=3},
      names = {
        "fulgoran-ruin-colossal",
        "fulgoran-ruin-colossal-breakdown-1",
        "fulgoran-ruin-colossal-breakdown-2"
      }
    },
    {
      result = {type="item", name="inert-coralmium-seed", amount_min=7, amount_max=9},
      names = {
        "fulgoran-ruin-vault",
        "fulgoran-ruin-vault-breakdown-1",
        "fulgoran-ruin-vault-breakdown-2",
        "fulgoran-ruin-vault-breakdown-3",
        "fulgoran-ruin-vault-breakdown-4",
        "fulgoran-ruin-vault-breakdown-5",
        "fulgoran-ruin-vault-breakdown-6",
        "fulgoran-ruin-vault-breakdown-7"
      }
    },
  }

  for _,ruins_set in pairs(ruins_to_modify) do
    for _,name in pairs(ruins_set.names) do
      table.insert(data.raw["simple-entity"][name].minable.results, ruins_set.result)
    end
  end
end
