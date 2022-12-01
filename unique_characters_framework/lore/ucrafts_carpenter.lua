----------------------------------------------------------
--UNIQUE CRAFTS: CARPENTER
--[[

All carpenters get early access to some complex carpentry from chopping

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
-- early woodwork
----------------------------------------------------------
--unlock some simpler carpentry from chopping

crafting.register_recipe({
	type = "chopping_block",
	output = "tech:wooden_ladder 4",
	items = {'group:log'},
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "chopping_block",
	output = "tech:wooden_floor_boards 4",
	items = {'group:log', 'tech:vegetable_oil'},
	level = 1,
	always_known = false,
})

crafting.register_recipe({
	type = "chopping_block",
	output = "tech:wooden_stairs 4",
	items = {'group:log', 'tech:vegetable_oil'},
	level = 1,
	always_known = false,
})
