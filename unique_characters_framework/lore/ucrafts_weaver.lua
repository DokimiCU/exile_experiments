----------------------------------------------------------
--UNIQUE CRAFTS: WEAVER
--[[

All weavers can do coarse fibre weaving from first weaving

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
--early coarse fibre
----------------------------------------------------------
--unlock coarse weaving from untreated cana
--able to do from weaving spot

crafting.register_recipe({
	type = "weaving_frame",
	output = "tech:coarse_fibre 6",
	items = {'nodes_nature:cana 24'},
	level = 1,
	always_known = false,
})


crafting.register_recipe({
	type = "weaving_frame",
	output = "tech:coarse_fabric",
	items = {'tech:coarse_fibre 6'},
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "weaving_frame",
	output = "backpacks:backpack_fabric_bag",
	items = {"tech:coarse_fabric 6"},
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "weaving_frame",
	output = "ropes:wood1rope_block",
	items = {"group:log", "tech:coarse_fibre 96"},
	level = 1,
	always_known = false,
})
