----------------------------------------------------------
--UNIQUE CRAFTS: RITUAL


--[[
--All ritual (baring materialistic ones) get a shrine to a random saint/divinity

Ritual mask (roles: priest, shaman, mystic)
Divination bones (Dragon, Monolith, and roles: seer, prophet, fortune teller, mystic, psychic)

- Dragon:
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

]]

----------------------------------------------------------
-- SHRINE
----------------------------------------------------------
--TODO: HEALTH: if/when a mood boost mechanic is added, this should feed into that.
--TODO: this is a currently a bit crude
--could add ability to gain/lose faith, multiple gods, choose/create a new god, and choose a different physical shrine type
--also need to be careful of straight up mocking all spirituality by accident.
--some real world religious people will have a problem with "worshipping idols", and fair enough. They shouldn't be forced to do so, they should be able to abandon this false god if they want.
--ideally the character should be able to go through some kind of journey of faith...
--though that's starting to get rather elaborate...

minetest.register_node("lore:shrine", {
	description = S("Shrine"),
	--inventory_image = "bones_inv.png",
	--wield_image = "bones_inv.png",
	tiles = {"tech_primitive_wood.png"},
	stack_max = minimal.stack_max_bulky,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.3125, -0.0625, 0.0625, 0.1875, 0.0625}, -- NodeBox1
			{-0.125, 0.1875, -0.0625, 0.125, 0.375, 0.0625}, -- NodeBox2
			{-0.1875, -0.5, -0.125, 0.1875, -0.3125, 0.125}, -- NodeBox3
			{-0.125, -0.25, 0, -0.0624999, 0.125, 0.0625}, -- NodeBox4
			{0.0625, -0.25, 0, 0.125, 0.125, 0.0625}, -- NodeBox5
			{-0.0625, 0.1875, -0.125, 0.0625, 0.375, -0.0625}, -- NodeBox6
			{-0.0625, 0.1875, 0.0625, 0.0625, 0.375, 0.125}, -- NodeBox7
			{-0.0625, 0.375, -0.0625, 0.0625, 0.4375, 0.0625}, -- NodeBox8
		}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate = 2, temp_pass = 1, falling_node = 1},
	sounds = nodes_nature.node_sound_stone_defaults(),

  on_rightclick = function (pos,node,clicker,itemstack,pointed_thing)
    local meta = clicker:get_meta()
    local divine_name = meta:get_string("shrine")

		if not divine_name or divine_name == "" then return end

		local adj = {
			"Blessed",
			"Merciful",
			"Holy",
			"Sacred",
			"Wonderous",
			"Wise",
			"Magnificent",
			"Loving",
			"Great",
			"Loyal",
			"Divine"
		}
		local adj = adj[math.random(#adj)]


    local devotions = ""
    local c =  math.random(1,12)
    if c <=1 then
      devotions = "O "..adj.." "..divine_name.."! Surely thou dost smile upon thy servant?"
    elseif c <=2 then
      devotions = "O "..adj.." "..divine_name.."! Thou art ever thy servant's true example!"
    elseif c <= 3 then
      devotions = "Look upon thy servant, O "..adj.." "..divine_name.."!"
    elseif c <= 4 then
      devotions = "Abandon not thy servant, O "..adj.." "..divine_name.."!"
    elseif c <= 5 then
      devotions = "Pour out thy blessing, O "..adj.." ".. divine_name.."!"
		elseif c <= 6 then
			devotions = "For thee alone, O "..adj.." ".. divine_name..", thy servant labors!"
		elseif c <= 7 then
			devotions = "Hast thou forgotten thy servant, O "..adj.." ".. divine_name.."?!"
		elseif c <= 8 then
			devotions = "O "..adj.." ".. divine_name.." will thou not show thy servant a sign?"
		elseif c <= 9 then
			devotions = "O "..adj.." ".. divine_name.." will thou not deliver thy servant from peril?"
		elseif c <= 10 then
			devotions = "Surely "..adj.." ".. divine_name.." is true!"
		elseif c <= 11 then
			devotions = "Surely ".. adj.." ".. divine_name.." is faithful!"
		elseif c <= 12 then
			devotions = "What must I do, O "..adj.." ".. divine_name.."? What?"
    end

    minetest.chat_send_player(clicker:get_player_name(), devotions)
  end

})

crafting.register_recipe({
	type = "chopping_block",
	output = "lore:shrine",
	items = {'group:log'},
	level = 1,
	always_known = false,
})
----------------------------------------------------------
-- BONES
----------------------------------------------------------

minetest.register_node("lore:divination_bones", {
	description = S("Divination Bones"),
	--inventory_image = "bones_inv.png",
	--wield_image = "bones_inv.png",
	tiles = {"lore_divination_bones.png"},
	stack_max = minimal.stack_max_bulky,
	drawtype = "nodebox",
  node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125}, -- NodeBox9
			{-0.375, -0.5, -0.1875, -0.3125, -0.4375, 0.1875}, -- NodeBox10
			{0.3125, -0.5, -0.1875, 0.375, -0.4375, 0.1875}, -- NodeBox11
			{-0.0625, -0.5, 0.125, 0.0625, -0.4375, 0.1875}, -- NodeBox12
			{-0.0625, -0.5, -0.1875, 0.0625, -0.4375, -0.125}, -- NodeBox13
			{-0.1875, -0.5, -0.0625, -0.125, -0.4375, 0.0625}, -- NodeBox14
			{0.125, -0.5, -0.0625, 0.1875, -0.4375, 0.0625}, -- NodeBox15
			{-0.25, -0.5, -0.375, 0.25, -0.4375, -0.3125}, -- NodeBox16
			{-0.25, -0.5, 0.3125, 0.25, -0.4375, 0.375}, -- NodeBox17
			{-0.25, -0.5, 0.1875, -0.1875, -0.4375, 0.25}, -- NodeBox18
			{0.25, -0.5, 0.1875, 0.375, -0.4375, 0.25}, -- NodeBox19
			{0.1875, -0.5, -0.25, 0.25, -0.4375, -0.1875}, -- NodeBox20
			{-0.375, -0.5, -0.25, -0.25, -0.4375, -0.1875}, -- NodeBox21
			{-0.0625, -0.4375, -0.0625, 0.0624999, -0.375, 0.0625}, -- NodeBox22
		}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	groups = {dig_immediate = 2, attached_node = 1, temp_pass = 1, falling_node = 1},
	sounds = nodes_nature.node_sound_gravel_defaults(),

  on_rightclick = function (pos,node,clicker,itemstack,pointed_thing)
    local meta = clicker:get_meta()
    local role = meta:get_string("role")

    if role == "ritual" then
      local omen = ""
      local c =  math.random(1,5)
      if c <=1 then
        omen = "favourable"
      elseif c <=2 then
        omen = "unfavourable"
      elseif c <= 3 then
        omen = "dark"
      elseif c <= 4 then
        omen = "curious"
      elseif c <= 5 then
        omen = "obscure"
      end
      minetest.chat_send_player(clicker:get_player_name(), "THE OMENS ARE... "..omen)
    end
  end

})

crafting.register_recipe({
	type = "crafting_spot",
	output = "lore:divination_bones",
	items = {'bones:bones'},
	level = 1,
	always_known = false,
})

--------------
-- MASK
--------------

player_api.register_cloth("lore:ritual_mask", {
	description = S("Ritual Mask"),
	inventory_image = "lore_inv_ritual_mask.png",
	texture = "tech_uv_ritual_mask.png",
	stack_max = minimal.stack_max_bulky,
	groups = {cloth = 1, clothing_mask = 1,},
	customfields= {temp_min = 1, temp_max = 1}
})

crafting.register_recipe({
	type = "chopping_block",
	output = "lore:ritual_mask",
	items = {'group:log', "nodes_nature:red_ochre", "group:fibrous_plant 4"},
	level = 1,
	always_known = false,
})
