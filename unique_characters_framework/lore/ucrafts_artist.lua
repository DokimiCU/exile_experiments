----------------------------------------------------------
--UNIQUE CRAFTS: ARTIST
--[[
All artists get musical instruments (For demo purposes: really this should limited to musicians, but we have nothing else here yet)


TODO: They better be able to make everything pretty... somehow

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
-- MUSIC
----------------------------------------------------------
--Adapted from Lord of the Test lottblocks music

minetest.register_node("lore:harp", {
	description = "Harp",
	tiles = {
		"lore_harp1.png",
		"lore_harp2.png",
		"lore_harp3.png",
		"lore_harp4.png",
		"lore_harp5.png",
		"lore_harp6.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	on_rightclick = function (pos,node,clicker,itemstack,pointed_thing)
		local meta = clicker:get_meta()
    local role = meta:get_string("role")
		local sound = ""

    if role ~= "artist" then
			sound = "lore_harp_twang"
		else
			sound = "lore_harp"
		end

		minetest.sound_play(sound, {
			pos=pos,
			max_hear_distance = 20,
			gain = math.random(0.75,1.25),
		})

	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.0625, 0.125, -0.375, 0.125}, -- NodeBox1
			{-0.1875, -0.375, -0.0625, 0.1875, -0.25, 0.125}, -- NodeBox2
			{-0.0625, -0.25, -0.0625, 0.25, -0.125, 0.125}, -- NodeBox3
			{0.0625, -0.125, -0.0625, 0.3125, 0, 0.125}, -- NodeBox4
			{0.1875, -0.0625, -0.0625, 0.375, 0.125, 0.125}, -- NodeBox5
			{0.3125, 0.0625, -0.0625, 0.4375, 0.25, 0.125}, -- NodeBox6
			{0.4375, 0.25, -0.0625, 0.5, 0.375, 0.125}, -- NodeBox7
			{0.375, 0.375, -0.0625, 0.4375, 0.4375, 0.125}, -- NodeBox8
			{-0.1875, 0.4375, -0.0625, 0.375, 0.5, 0.125}, -- NodeBox9
			{-0.375, -0.375, -0.0625, -0.3125, -0.3125, 0.125}, -- NodeBox10
			{-0.4375, -0.3125, -0.0625, -0.375, 0.25, 0.125}, -- NodeBox11
			{-0.375, 0.25, -0.0625, -0.3125, 0.3125, 0.125}, -- NodeBox12
			{-0.3125, 0.3125, -0.0625, -0.25, 0.375, 0.125}, -- NodeBox13
			{-0.25, 0.375, -0.0625, -0.1875, 0.4375, 0.125}, -- NodeBox14
			{-0.3125, -0.375, 0, -0.25, 0.3125, 0.0625}, -- NodeBox15
			{-0.1875, -0.25, 0, -0.125, 0.4375, 0.0625}, -- NodeBox16
			{-0.0625, -0.125, 0, 0, 0.4375, 0.0625}, -- NodeBox17
			{0.0625, 0, 0, 0.125, 0.4375, 0.0625}, -- NodeBox18
			{0.1875, 0.09375, 0, 0.25, 0.4375, 0.0625}, -- NodeBox19
			{0.3125, 0.25, 0, 0.375, 0.4375, 0.0625}, -- NodeBox20
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.125}, -- NodeBox1
		}
	},
	groups = {dig_immediate = 2, temp_pass = 1, falling_node = 1}
})


crafting.register_recipe({
	type = "carpentry_bench",
	output = "lore:harp",
	items = {'group:hard_wood 2', 'tech:fine_fibre 12', 'tech:vegetable_oil'},
	level = 1,
	always_known = false,
})



minetest.register_craftitem("lore:flute", {
	description = "Flute",
	inventory_image = "lore_flute.png",
	on_use = function(itemstack, user)
		local meta = user:get_meta()
		local role = meta:get_string("role")
		local sound = ""

		if role ~= "artist" then
			sound = "lore_flute_squeal"
		else
			sound = "lore_flute"
		end
		minetest.sound_play(sound, {
			pos = user:get_pos(),
			max_hear_distance = 20,
			gain = math.random(0.75,1.25),
		})
	end,
	groups = {}
})


crafting.register_recipe({
	type = "chopping_block",
	output = "lore:flute",
	items = {'tech:stick'},
	level = 1,
	always_known = false,
})
