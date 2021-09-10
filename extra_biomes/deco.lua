
------------------------------------------------------
local barren_grassland_on = {"nodes_nature:grassland_barren_soil", "nodes_nature:grassland_barren_soil_wet"}
local dry_woodland_on = {"nodes_nature:woodland_dry_soil", "nodes_nature:woodland_dry_soil_wet"}
local drylands_on = {"nodes_nature:grassland_barren_soil", "nodes_nature:woodland_dry_soil"}

local all_woodland_on = {"nodes_nature:woodland_soil", "nodes_nature:woodland_soil_wet", "nodes_nature:woodland_dry_soil", "nodes_nature:woodland_dry_soil_wet"}

local lowland_ymax = 600
local lowland_ymin = 1




------------------------------------------------------

local s4 = { name = "nodes_nature:chalin", param2 = 2 }
local chalin = {
  size = {y = 7, x = 1, z = 1},
  data = {
    s4, s4, s4, s4, s4, s4, s4
    },
  yslice_prob = {
    {ypos = 0, prob = 255},
		{ypos = 1, prob = 255},
		{ypos = 2, prob = 255},
    {ypos = 3, prob = 255},
    {ypos = 4, prob = 230},
    {ypos = 5, prob = 155},
    {ypos = 6, prob = 105},
  },
}



------------------------------------------------------
--sasaran in dry woodland
minetest.register_decoration({
	name = "nodes_nature:sasaran_tree1_lowland",
	deco_type = "schematic",
	place_on =dry_woodland_on,
  sidelen = 80,
	fill_ratio = 0.0075,
  y_max = 35,
  y_min = lowland_ymin,
	schematic = minetest.get_modpath("extra_biomes") .. "/schematics/sasaran1.mts",
  place_offset_y = -4,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	name = "nodes_nature:sasaran_tree1",
	deco_type = "schematic",
	place_on =dry_woodland_on,
  sidelen = 80,
	fill_ratio = 0.001,
  y_max = 75,
  y_min = 35,
	schematic = minetest.get_modpath("extra_biomes") .. "/schematics/sasaran1.mts",
  place_offset_y = -4,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


------------------------------------------------------
--kagum on salt silt
minetest.register_decoration({
	name = "nodes_nature:kagum_tree",
	deco_type = "schematic",
	place_on = {"nodes_nature:silt_wet_salty"},
  sidelen = 80,
  noise_params = {
		offset = 0,
		scale = 0.065,
		spread = {x = 128, y = 128, z = 128},
		seed = 51122,
		octaves = 3,
		persist = 0.5
	},
  y_max = 3,
  y_min = -1,
	schematic = minetest.get_modpath("extra_biomes") .. "/schematics/kagum1.mts",
  place_offset_y = 0,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


------------------------------------------------------

minetest.register_decoration({
	name = "nodes_nature:chalin_lowland",
	deco_type = "schematic",
	place_on = all_woodland_on,
	sidelen = 80,
	fill_ratio = 0.015,
	y_max = 35,
	y_min = lowland_ymin,
	schematic = chalin
})


minetest.register_decoration({
	name = "nodes_nature:chalin",
	deco_type = "schematic",
	place_on = dry_woodland_on,
	sidelen = 80,
	fill_ratio = 0.3,
	y_max = lowland_ymax,
	y_min = 35,
	schematic = chalin
})

minetest.register_decoration({
	name = "nodes_nature:momo",
	deco_type = "simple",
	place_on = dry_woodland_on,
  sidelen = 80,
	fill_ratio = 0.001,
  y_max = lowland_ymax,
  y_min = lowland_ymin,
	decoration = "nodes_nature:momo",
  param2 = 1,
})


minetest.register_decoration({
	name = "nodes_nature:tashvish",
	deco_type = "simple",
	place_on = drylands_on,
  sidelen = 80,
	fill_ratio = 0.3,
  y_max = lowland_ymax,
  y_min = lowland_ymin,
	decoration = "nodes_nature:tashvish",
  param2 = 4,
})



---------------------------------------------
--glow worms on cave roof
minetest.register_decoration({
	name = "nodes_nature:glow_worm",
	deco_type = "simple",
  place_on = {
  "nodes_nature:granite",
  "nodes_nature:gneiss",
  "nodes_nature:limestone",
  "nodes_nature:jade"},
  sidelen = 16,
	noise_params = {
		offset = -0.04,
		scale = 0.4,
		spread = {x = 64, y = 64, z = 64},
		seed = 11002,
		octaves = 3,
		persist = 0.9
	},
  y_max = -15,
  y_min = -1000,
	decoration = "nodes_nature:glow_worm",
  flags = "all_ceilings",
  param2 = 3,
})
