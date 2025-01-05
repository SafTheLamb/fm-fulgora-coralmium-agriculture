require("prototypes.technology-updates")

for _,entity in pairs(data.raw["agricultural-tower"]) do
  for _,condition in pairs(entity.surface_conditions or {}) do
    if condition.property == "pressure" then
      condition.min = nil
    end
  end
end
