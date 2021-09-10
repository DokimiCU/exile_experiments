--
-- Register biomes
--
local upper_limit = 31000
local lower_limit = -31000

local mountain_min = 170
local alpine_min = 140
local highland_min = 100
local upland_min = 90
local lowland_max = 9

local beach_max = 5
local beach_min = -10
local shallow_ocean_min = -30
local deep_ocean_min = -120

---
local extreme_high = 95
local high = 75
local middle = 50
local low = 25
local extreme_low = 5



----------------------
-- Grassland_dry
--clay, open, yellow

--drier version of standard grassland
minetest.register_biome({
	name = "grassland_dry",
	node_top = "nodes_nature:grassland_soil",
	depth_top = 1,
	node_filler = "nodes_nature:sand",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:grassland_soil",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 5,
	y_max = upland_min,
	y_min = beach_max,
	heat_point = extreme_high,
	humidity_point = low,
})

--wet version of standard grassland
minetest.register_biome({
	name = "grassland_wet",
	node_top = "nodes_nature:grassland_soil",
	depth_top = 1,
	node_filler = "nodes_nature:clay_wet",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:marshland_soil_wet",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 5,
	y_max = upland_min/2,
	y_min = beach_max,
	heat_point = high,
	humidity_point = extreme_high,
})



--barren grassland
-- pale colours
minetest.register_biome({
	name = "grassland_barren",
	node_top = "nodes_nature:grassland_barren_soil",
	depth_top = 1,
	node_filler = "nodes_nature:gravel",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:woodland_dry_soil",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 5,
	y_max = upland_min,
	y_min = beach_max,
	heat_point = low - 10,
	humidity_point = low,
})


--upland dry grassland
minetest.register_biome({
	name = "upland_grassland_dry",
	node_top = "nodes_nature:grassland_barren_soil",
	depth_top = 1,
	node_filler = "nodes_nature:gravel",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:grassland_soil",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 10,
	y_max = highland_min,
	y_min = upland_min,
	heat_point = extreme_high,
	humidity_point = low,
})
--[[
--upland barren grassland
minetest.register_biome({
	name = "upland_grassland_barren",
	node_dust = "nodes_nature:snow",
	node_top = "nodes_nature:grassland_barren_soil",
	depth_top = 1,
	node_filler = "nodes_nature:gravel",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "nodes_nature:snow_block",
	node_riverbed = "nodes_nature:gravel_wet",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 5,
	y_max = highland_min,
	y_min = upland_min,
	heat_point = low - 10,
	humidity_point = low,
})

]]

----------------------
-- Barrenland
--gravel, lifeless

minetest.register_biome({
	name = "barrenland",
	node_top = "nodes_nature:sand",
	depth_top = 1,
	node_filler = "nodes_nature:gravel",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:silt",
	depth_riverbed = 3,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 10,
	y_max = upland_min/2,
	y_min = beach_max,
	heat_point = extreme_low,
	humidity_point = extreme_low,
})


-- lavaland
--cooled basalt and lava flows, totally lifeless
minetest.register_biome({
	name = "lavaland",
	node_top = "nodes_nature:basalt",
	depth_top = 1,
	node_filler = "nodes_nature:basalt",
	depth_filler = 1,
	node_stone = "nodes_nature:basalt",
	node_river_water = "nodes_nature:basalt",
	node_riverbed = "nodes_nature:lava_source",
	depth_riverbed = 3,
	node_cave_liquid = {"nodes_nature:lava_source"},
	vertical_blend = 10,
	y_max = upland_min/2,
	y_min = 0,
	heat_point = extreme_high + 10,
	humidity_point = extreme_low - 20,
})




----------------------
-- hardpan_marshland
--thin silt, dense reeds, red
--clay layer underneath

minetest.register_biome({
	name = "hardpan_marshland",
	node_top = "nodes_nature:marshland_soil_wet",
	depth_top = 1,
	node_filler = "nodes_nature:clay_wet",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:marshland_soil_wet",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 2,
	y_max = lowland_max,
	y_min = beach_max,
	heat_point = low,
	humidity_point = extreme_high,
})


----------------------
-- woodland wet
--loam, trees, green
--layer of wet clay

minetest.register_biome({
	name = "woodland_wet",
	node_top = "nodes_nature:woodland_soil",
	depth_top = 1,
	node_filler = "nodes_nature:clay_wet",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:marshland_soil_wet",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 2,
	y_max = lowland_max + 20,
	y_min = beach_max,
	heat_point = low,
	humidity_point = extreme_high,
})


-- woodland dry
--arid forest

minetest.register_biome({
	name = "woodland_dry",
	node_top = "nodes_nature:woodland_dry_soil",
	depth_top = 1,
	node_filler = "nodes_nature:silt",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:grassland_soil_wet",
	depth_riverbed = 1,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 2,
	y_max = upland_min,
	y_min = beach_max,
	heat_point = low -10,
	humidity_point = middle -10,
})


minetest.register_biome({
	name = "upland_woodland_dry",
	node_dust = "nodes_nature:snow",
	node_top = "nodes_nature:woodland_dry_soil",
	depth_top = 1,
	node_filler = "nodes_nature:silt",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "nodes_nature:snow_block",
	node_riverbed = "nodes_nature:gravel_wet",
	depth_riverbed = 2,
	vertical_blend = 6,
	y_max = highland_min,
	y_min = upland_min,
	heat_point = low -10,
	humidity_point = middle -10,
})

----------------------
-- highland_scree
--gravel
--unstable loose gravel fields

minetest.register_biome({
	name = "dry_highland_scree",
	--node_dust = "nodes_nature:snow",
	node_top = "nodes_nature:gravel",
	depth_top = 1,
	node_filler = "nodes_nature:silt",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:silt",
	depth_riverbed = 2,
	vertical_blend = 15,
	y_max = mountain_min,
	y_min = upland_min,
	heat_point = extreme_low,
	humidity_point = low,
})

minetest.register_biome({
	name = "wet_highland_scree",
	--node_dust = "nodes_nature:snow",
	node_top = "nodes_nature:gravel",
	depth_top = 1,
	node_filler = "nodes_nature:silt",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "nodes_nature:snow_block",
	node_riverbed = "nodes_nature:silt_wet",
	depth_riverbed = 2,
	vertical_blend = 15,
	y_max = mountain_min,
	y_min = upland_min,
	heat_point = extreme_high,
	humidity_point = high,
})

--------------------------------------
-- dry highland
-- no snow version

minetest.register_biome({
	name = "dry_highland",
	node_top = "nodes_nature:highland_soil",
	depth_top = 1,
	node_filler = "nodes_nature:gravel",
	depth_filler = 1,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:gravel_wet",
	depth_riverbed = 3,
	vertical_blend = 5,
	y_max = mountain_min,
	y_min = highland_min,
	heat_point = extreme_high,
	humidity_point = extreme_low,
})


----------------------------
--dry mountain
--bare rock, no snow
minetest.register_biome({
	name = "dry_mountain",
	node_filler = "nodes_nature:gravel",
	depth_filler = 2,
	node_stone = "nodes_nature:limestone",
	node_river_water = "air",
	node_riverbed = "nodes_nature:gravel",
	depth_riverbed = 2,
	node_cave_liquid = {"nodes_nature:freshwater_source"},
	vertical_blend = 10,
	y_max = upper_limit,
	y_min = mountain_min,
	heat_point = low -10,
	humidity_point = extreme_low,
})
