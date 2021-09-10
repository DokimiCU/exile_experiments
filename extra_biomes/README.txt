Exile mod: extra biomes
=============================
Some new biomes


Mod does not on it's own work, unless new plants and trees and soils registered in nodes_nature.

Core code needs:


into nodes_nature


Register the soils

  {"grassland_barren_soil", "Barren Grassland Soil", 3, "gravel", "gravel"},
  {"woodland_dry_soil", "Dry Woodland Soil", 3, "silt", "silt"},

Register trees

{"sasaran", "Sasaran Tree", "sasaran_cone", "Sasaran Cone", 1, {-0.1, -0.5, -0.1, 0.1, -0.1, 0.1},2},


 --sasaran cones have a low value seed, of dubious edibility
 minetest.override_item("nodes_nature:sasaran_cone",{
 	on_use = function(itemstack, user, pointed_thing)

 		--food poisoning
 		if random() < 0.08 then
 			HEALTH.add_new_effect(user, {"Food Poisoning", 1})
 		end

 		--hp_change, thirst_change, hunger_change, energy_change, temp_change, replace_with_item
 		return HEALTH.use_item(itemstack, user, 0, 0, 1, 0, 0)

 	end,
 })


{"kagum", "Kagum Tree", "kagum_pod", "Kagum Pod", 1, {-0.1, -0.5, -0.1, 0.1, -0.1, 0.1},2},

--kagum pods glow
minetest.override_item("nodes_nature:kagum_pod",{
 light_source = 2,
 groups = {dig_immediate=3, flammable=1, leafdecay = 3, leafdecay_drop = 1, bioluminescent= 1},
})




Register the plants

{"tashvish", "Tashvish", nil, 1, "fibrous_plant", nil, 4, nil, nil, base_growth*1.5},

{"momo", "Momo", nil, 1, "herbaceous_plant", nil, 2, 0,1,12,0,0, nil, nil, nil, base_growth *2, 0.001},



  minetest.register_node("nodes_nature:chalin", {
  	description = "Chalin",
  	drawtype = "plantlike",
  	tiles = {"nodes_nature_chalin.png"},
  	inventory_image = "nodes_nature_chalin.png",
  	wield_image = "nodes_nature_chalin.png",
  	stack_max = minimal.stack_max_medium,
  	paramtype = "light",
  	paramtype2 = "meshoptions",
  	place_param2 = 2,
  	sunlight_propagates = true,
  	walkable = false,
  	climbable = true,
  	--floodable = true,
  	selection_box = {
  		type = "fixed",
  		fixed = {-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
  	},
  	groups = {choppy = 3, woody_plant = 1, flammable = 1, flora = 1, cane_plant = 1, temp_pass = 1},
  	sounds = nodes_nature.node_sound_wood_defaults(),

  	after_dig_node = function(pos, node, metadata, digger)
  		dig_up(pos, node, digger)
  	end,
  })


--Put glow worm in node_nature somewhere
--glow_worm
--a bit experimental, doesn't reproduce
minetest.register_node("nodes_nature:glow_worm", {
      description = "Glow Worm",
      drawtype = "plantlike",
      waving = 1,
      visual_scale = 1,
      light_source = 2,
      tiles = {"nodes_nature_glow_worm.png"},
			stack_max = minimal.stack_max_medium,
      inventory_image = "nodes_nature_glow_worm.png",
      wield_image = "nodes_nature_glow_worm.png",
      paramtype = "light",
      paramtype2 = "meshoptions",
      place_param2 = 3,
      floodable = true,
      sunlight_propagates = true,
      walkable = false,
      buildable_to = true,
      groups = {snappy = 3, flammable = 1, temp_pass = 1, bioluminescent = 1},
      sounds = nodes_nature.node_sound_leaves_defaults(),
      selection_box = {
        type = "fixed",
        fixed = {-0.3, 0.5, -0.3, 0.3, 0.35, 0.3},
      },
    })


To integrate fully into core code will need to:
-copy paste schems into mapgen
-copy paste textures into nodes_nature
-copy paste biomes, decos into mapgen mod
-add new soils to all soils list (spawns eggs and other decos (moss) on new soils)



Authors of source code and media
----------------------
Dokimi
