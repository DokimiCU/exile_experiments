----------------------------------------------------------
--UNIQUE CRAFTS: FIGHTER
--[[

All fighters can make:
- some booby trap items (some overlap with hunters)

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
--Booby Traps
----------------------------------------------------------
--TODO: fall damage is not working either way (supposed to be a group)?
-- disable_jump doesn't work on mobs. Nor does damage_per_second. Both need adding to animals for these to have any use in singleplayer

minetest.register_node("lore:caltrop", {
	description = "caltrop",
	drawtype ="plantlike",
	visual_scale = 1,
	tiles = {"lore_caltrop.png"},
	stack_max = minimal.stack_max_medium *2,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 0,
	floodable = true,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {dig_immediate=3, attached_node = 1, temp_pass = 1, disable_jump = 1, fall_damage_add_percent = 100},
	sounds = nodes_nature.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, -0.2, 0.1},
	},
	damage_per_second = 1,
	--fall_damage_add_percent = 100,
})

--BUG: awards wont recognize it here
--[[
crafting.register_recipe({
	type = "anvil",
	output = "lore:caltrop 24",
	items = {'tech:iron_ingot 1',},
	level = 1,
	always_known = false,
})
]]

minetest.register_node("lore:sharpened_stakes", {
	description = "Sharpened Stakes",
	drawtype ="plantlike",
	visual_scale = 1,
	tiles = {"lore_sharpened_stakes.png"},
	stack_max = minimal.stack_max_medium *2,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	floodable = true,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {choppy=3, attached_node = 1, temp_pass = 1, disable_jump = 1},--, fall_damage_add_percent = 10000000000},
	sounds = nodes_nature.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, -0.2, 0.4},
	},
	fall_damage_add_percent = 10000000,
})

crafting.register_recipe({
	type = "crafting_spot",
	output = "lore:sharpened_stakes",
	items = {'tech:stick',},
	level = 1,
	always_known = false,
})
