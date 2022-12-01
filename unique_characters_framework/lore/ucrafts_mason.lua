----------------------------------------------------------
--UNIQUE CRAFTS: MASON
--[[
All masons get some complex stone work
(this should definitely be moved in the rest of masonry registration)
(the way this is awarded in exile_awards is a horrible clunky placeholder)


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
--Adapted from stoneworks (1.2) by TumeniNodes
lore.arches_recipes = {}


--TODO: some of these should probably be in temp_pass group
--TODO: could add mudbrick, brick

-- Node will be called lore:arches_<subname>

function lore.register_arches(subname, groups, images, description, sounds, mortar)
	--groups.arches = 1
	--[[
	--A slightly higher slab, somewhat unnecessary

	minetest.register_node("lore:arches_low_wall_" .. subname, {
		description = description.." Low",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.125, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_wall_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = true--false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_wall_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = true--false,
		})
	end
	]]

	minetest.register_node("lore:arches_high_" .. subname, {
		description = description.." High",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.5, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, 0.5},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, 0.5},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_high_" .. subname, "lore:arches_high_" .. subname.." 2"})

	minetest.register_node("lore:arches_low_" .. subname, {
		description = description.." Low",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, 0.5},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, 0.5},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_high_" .. subname, "lore:arches_high_" .. subname.." 2" })

	minetest.register_node("lore:arches_high_quad_" .. subname, {
		description = description.." Quad",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.5, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, -0.3125},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, 0.0625, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, -0.375, -0.25, 0.5},
				{0.375, -0.4375, 0.375, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, -0.4375, -0.3125, 0.5},
				{0.3125, -0.3125, 0.3125, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, 0.4375, 0.5, -0.3125, 0.5},
				{-0.5, -0.1875, 0.1875, -0.1875, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, -0.0625, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_quad_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_quad_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_high_quad_" .. subname, "lore:arches_high_quad_" .. subname.." 2"})

	minetest.register_node("lore:arches_low_quad_" .. subname, {
		description = description.." Low Quad",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, -0.3125},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, 0.0625, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, -0.375, -0.25, 0.5},
				{0.375, -0.4375, 0.375, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, -0.4375, -0.3125, 0.5},
				{0.3125, -0.3125, 0.3125, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, 0.4375, 0.5, -0.3125, 0.5},
				{-0.5, -0.1875, 0.1875, -0.1875, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, -0.0625, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_quad_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_quad_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_low_quad_" .. subname, "lore:arches_low_quad_" .. subname.." 2"})

	minetest.register_node("lore:arches_high_T_" .. subname, {
		description = description.." High T",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.5, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, -0.3125},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, -0.375, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, -0.4375, -0.3125, 0.5},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, -0.1875, 0.1875, -0.1875, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, -0.0625, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_T_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_T_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_high_T_" .. subname, "lore:arches_high_T_" .. subname.." 2"})

	minetest.register_node("lore:arches_low_T_" .. subname, {
		description = description.." Low T",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, -0.3125},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, -0.3125, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, -0.375, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, -0.4375, -0.3125, 0.5},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, -0.1875, 0.1875, -0.1875, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, -0.0625, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_T_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_T_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_low_T_" .. subname, "lore:arches_low_T_" .. subname.." 2"})

	minetest.register_node("lore:arches_high_corner_" .. subname, {
		description = description.. " High Corner",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.5, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, 0.5, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, 0.5, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, 0.5, -0.3125, 0.5},
				{0.375, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, 0.5, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_corner_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_high_corner_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_high_corner_" .. subname, "lore:arches_high_corner_" .. subname.." 2"})

	minetest.register_node("lore:arches_low_corner_" .. subname, {
		description = description.." Low Corner",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, -0.0625},
				{-0.5, -0.125, -0.5, -0.0625, -0.0625, -0.0625},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{0.3125, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, -0.5, -0.3125, -0.1875, -0.3125},
				{-0.5, -0.4375, -0.5, -0.375, -0.25, -0.375},
				{0.375, -0.4375, -0.5, 0.5, -0.25, -0.375},
				{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.4375},
				{0.0625, -0.125, -0.5, 0.5, -0.0625, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{-0.5, -0.3125, 0.3125, 0.5, -0.1875, 0.5},
				{-0.5, -0.4375, 0.375, 0.5, -0.25, 0.5},
				{0.375, -0.4375, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.5, 0.4375, 0.5, -0.3125, 0.5},
				{0.375, -0.3125, -0.5, 0.5, -0.1875, 0.5},
				{0.4375, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.125, 0.0625, 0.5, -0.0625, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_corner_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:arches_low_corner_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:arches_low_corner_" .. subname, "lore:arches_low_corner_" .. subname.." 2"})

end


-- Node will be called lore:thin_wall_<subname>

function lore.register_thin_wall(subname, groups, images, description, sounds, mortar)
	--groups.thin_wall = 1
	minetest.register_node("lore:thin_wall_high_" .. subname, {
		description = description.." High",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_" .. subname, "lore:thin_wall_high_" .. subname.." 2" })

	minetest.register_node("lore:thin_wall_low_" .. subname, {
		description = description.." Low",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_low_" .. subname, "lore:thin_wall_low_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_high_corner_" .. subname, {
		description = description.." High Corner",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_corner_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_corner_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_corner_" .. subname, "lore:thin_wall_high_corner_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_low_corner_" .. subname, {
		description = description.." Low Corner",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.1875, 0.1875, 0.125, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_corner_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_corner_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_low_corner_" .. subname,"lore:thin_wall_low_corner_" .. subname.." 2" })

	minetest.register_node("lore:thin_wall_high_T_" .. subname, {
		description = description.." High T",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_T_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_T_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_T_" .. subname, "lore:thin_wall_high_T_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_high_low_T_" .. subname, {
		description = description.." High Low T",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_low_T_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_low_T_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_low_T_" .. subname, "lore:thin_wall_high_low_T_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_low_T_" .. subname, {
		description = description.." Low T",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_T_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_T_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_low_T_" .. subname, "lore:thin_wall_low_T_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_high_quad_" .. subname, {
		description = description.." High Quad",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_quad_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_quad_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_quad_" .. subname, "lore:thin_wall_high_quad_" .. subname.." 2" })

	minetest.register_node("lore:thin_wall_high_low_quad_" .. subname, {
		description = description.." High Low Quad",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_low_quad_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_low_quad_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_low_quad_" .. subname, "lore:thin_wall_high_low_quad_" .. subname.." 2" })

	minetest.register_node("lore:thin_wall_low_quad_" .. subname, {
		description = description.." Low Quad",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.5},
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_quad_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_quad_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_low_quad_" .. subname, "lore:thin_wall_low_quad_" .. subname.." 2" })

	minetest.register_node("lore:thin_wall_high_arch_" .. subname, {
		description = description.." High Arch",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.1875, 0.5, 0.5, 0.1875},
				{0.0625, -0.125, -0.1875, 0.5, -0.0625, 0.1875},
				{-0.5, -0.125, -0.1875, -0.0625, -0.0625, 0.1875},
				{-0.5, -0.1875, -0.1875, -0.1875, -0.125, 0.1875},
				{0.1875, -0.1875, -0.1875, 0.5, -0.125, 0.1875},
				{0.3125, -0.3125, -0.1875, 0.5, -0.1875, 0.1875},
				{-0.5, -0.3125, -0.1875, -0.3125, -0.1875, 0.1875},
				{-0.5, -0.4375, -0.1875, -0.375, -0.25, 0.1875},
				{0.375, -0.4375, -0.1875, 0.5, -0.25, 0.1875},
				{0.4375, -0.5, -0.1875, 0.5, -0.3125, 0.1875},
				{-0.5, -0.5, -0.1875, -0.4375, -0.3125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_arch_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_high_arch_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_high_arch_" .. subname, "lore:thin_wall_high_arch_" .. subname.." 2"})

	minetest.register_node("lore:thin_wall_low_arch_" .. subname, {
		description = description.." Low Arch",
		drawtype = "nodebox",
		tiles = images,
		minimal.stack_max_bulky * 6,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.1875, 0.5, 0.125, 0.1875},
				{0.0625, -0.125, -0.1875, 0.5, -0.0625, 0.1875},
				{-0.5, -0.125, -0.1875, -0.0625, -0.0625, 0.1875},
				{-0.5, -0.1875, -0.1875, -0.1875, -0.125, 0.1875},
				{0.1875, -0.1875, -0.1875, 0.5, -0.125, 0.1875},
				{0.3125, -0.3125, -0.1875, 0.5, -0.1875, 0.1875},
				{-0.5, -0.3125, -0.1875, -0.3125, -0.1875, 0.1875},
				{-0.5, -0.4375, -0.1875, -0.375, -0.25, 0.1875},
				{0.375, -0.4375, -0.1875, 0.5, -0.25, 0.1875},
				{0.4375, -0.5, -0.1875, 0.5, -0.3125, 0.1875},
				{-0.5, -0.5, -0.1875, -0.4375, -0.3125, 0.1875},
			}
		}
	})

	if mortar then
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_arch_" .. subname.." 2",
			items = {"tech:"..subname},
			level = 1,
			always_known = false,
		})
	else
		crafting.register_recipe({
			type = "masonry_bench",
			output = "lore:thin_wall_low_arch_" .. subname.." 2",
			items = {"nodes_nature:"..subname},
			level = 1,
			always_known = false,
		})
	end

	table.insert(lore.arches_recipes, {"lore:thin_wall_low_arch_" .. subname, "lore:thin_wall_low_arch_" .. subname.." 2"})

end

-- Arches/thin wall registration function.
-- Nodes will be called lore:{arches,thin_wall}_<subname>

function lore.register_arches_and_thin_wall(subname, groups, images, desc_arches, desc_thin_wall, sounds, mortar)
	lore.register_arches(subname, groups, images, desc_arches, sounds, mortar)
	lore.register_thin_wall(subname, groups, images, desc_thin_wall, sounds, mortar)
end


for i in ipairs(rock_list) do
	local name = rock_list[i][1]
	local desc = rock_list[i][2]
	local hardness = rock_list[i][3]

	--unmortared
	lore.register_arches_and_thin_wall(name.."_brick",
			{cracky = hardness, falling_node = 1,  oddly_breakable_by_hand = 1},
			{"nodes_nature_"..name.."_brick.png"},
			S("@1 Brick Arch", desc),
			S("@1 Brick Wall", desc),
			nodes_nature.node_sound_stone_defaults(),
			false)

	--mortared
	lore.register_arches_and_thin_wall(name.."_brick_mortar",
			{cracky = hardness},
			{"nodes_nature_"..name.."_brick.png^tech_mortar_brick.png"},
			S("@1 Brick with Mortar Arch", desc),
			S("@1 Brick with Mortar Wall", desc),
			nodes_nature.node_sound_stone_defaults(),
			true)

end
