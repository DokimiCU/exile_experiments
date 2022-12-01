----------------------------------------------------------
--UNIQUE CRAFTS: SMITH
--[[


TODO: Non-craft Bonuses: Add something like artificats smelter_probe behaviour into smelting itself.
Allow smith to click to read info. Regular characters must use the artifact.

All smiths get early access to some ironworking

- Dragon:
?
- Hydrogen:
?
- Frontier:
?
- Clock:
?
- Cucumber:
?
- Licorice:
?
- Rat:
?
- Monolith:
?


]]


----------------------------------------------------------
-- early access
----------------------------------------------------------
--unlock some simpler smithing from hammering without an anvil

--BUG: for some reason this only works with awards if the recipes are in awards
-- despite the fact that weaving is okay with this!
--[[
crafting.register_recipe({
	type = "hammering_block",
	output = "tech:pickaxe_iron",
	items = {'tech:iron_ingot 2', 'tech:stick'},--
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "hammering_block",
	output = "tech:axe_iron",
	items = {'tech:iron_ingot', 'tech:stick'},
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "hammering_block",
	output = "tech:mace_iron",
	items = {'tech:iron_ingot 2'},
	level = 1,
	always_known = false,
})
]]
