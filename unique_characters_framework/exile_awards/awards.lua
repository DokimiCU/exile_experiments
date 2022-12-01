
minetest.after(0.1, function()--may or may not be necessary (exists due to load order issues? See original Awards mod)


--[[
BASIC CRAFTS:
All characters get access to these (otherwise the game is unplayable - although you could have options for a "Complete Moron" character who knows nothing)
Having these split up as skill sets familiarizes the player with the idea of skills - that they shouldn't expect to just make everything without knowing the skill first.

ADVANCED CRAFTS:
Each major skill area has it's advanced crafts. These are things which would require experience/training to be able to do.

UNIQUE CRAFTS:
Obscure, unusual, flavour crafts. e.g. priestly items for priests.

UNIQUE SKILLS:
Obscure, unusual, flavour skills. Not crafting related. e.g. literacy

WHO GETS WHAT?
- Role: the character's training/experience
- Suit + chance: add flavour by unlocking some skills e.g. 'Frontier' characters might know more survival crafts, 'Clock' might know more advanced technical crafts.
- Age + chance: older characters have more experience


The below is very rough, just for demo purposes
]]
---------------------------------------------------------------------
--BASIC CARPENTRY (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_carp = {
	"tech:stick 2", "tech:stick 24", "tech:stick 12", "tech:digging_stick 1",--also add wattle, canoe etc

}
awards.register_award("awards_basic_carpentry", {
		title = "Basic Carpentry",
		description = "The most simple of woodworking skills.\n\nSKILL: can craft simple wooden items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_tool_digging_stick.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_carp)
		end
})

---------------------------------------------------------------------
--BASIC STONEWORKING (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_stone = {
	"tech:stone_chopper 1", --mortar and pestle, adze etc

}
awards.register_award("awards_basic_stoneworking", {
		title = "Basic Stoneworking",
		description = "The most simple of stoneworking skills.\n\nSKILL: can craft simple stone items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_tool_hammer_basalt.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_stone)
		end
})



---------------------------------------------------------------------
--BASIC FIRE MAKING (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_fire = {
	"tech:torch 1", "inferno:fire_sticks",
	"tech:small_wood_fire_unlit", "tech:large_wood_fire_unlit", "tech:large_wood_fire_unlit 2", "tech:small_wood_fire_unlit 2"

}
awards.register_award("awards_basic_fire", {
		title = "Basic Fire Making",
		description = "The three pillars of a good fire are air, fuel, and heat.\n\nSKILL: can craft fires and fire lighters.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_wood_fire_unlit.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_fire)
		end
})


---------------------------------------------------------------------
--BASIC POTTERY (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_clay = {
	"tech:clay_water_pot_unfired", --storage, lamp,

}
awards.register_award("awards_basic_pottery", {
		title = "Basic Pottery",
		description = "The most simple of pottery skills.\n\nSKILL: can craft simple pottery items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "nodes_nature_clay.png",--placeholder
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_clay)
		end
})

---------------------------------------------------------------------
--BASIC CONSTRUCTION (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_const = {
	"tech:drystack", -- mudbrick, rammed earth,

}
awards.register_award("awards_basic_construction", {
		title = "Basic Construction",
		description = "The most simple of earthen building skills.\n\nSKILL: can craft simple earthen building items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_mudbrick.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_const)
		end
})



---------------------------------------------------------------------
--BASIC WEAVING (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_weave = {
	"tech:woven_hat", --clothes, bags, thatch

}
awards.register_award("awards_basic_weaving", {
		title = "Basic Weaving",
		description = "The most simple of weaving skills.\n\nSKILL: can craft simple woven items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_inv_woven_poncho.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_clay)
		end
})

---------------------------------------------------------------------
--BASIC COOKERY (For rough demo purposes only - none of these are locked yet!)
---------------------------------------------------------------------
local basic_cook = {
	"tech:peeled_anperla", "tech:peeled_anperla 6", "tech:peeled_anperla 36", "tech:mashed_anperla", "tech:mashed_anperla 6",
	"tech:maraka_flour_bitter", "tech:maraka_flour_bitter 4", "tech:maraka_bread 6", "tech:maraka_bread 24",
	"tech:vegetable_oil", "tech:vegetable_oil 6",

}
awards.register_award("awards_basic_cookery", {
		title = "Basic Cookery",
		description = "The most simple of cooking skills.\n\nSKILL: can craft simple cooking items.",
		difficulty = 1,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_soup.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			crafting.unlock(name, basic_cook)
		end
})


---------------------------------------------------------------------
--END OF BASICS
--All characters get basics.
--The following are only available to certain characters
-- These skills must be learned
---------------------------------------------------------------------



---------------------------------------------------------------------
--WEAVER
---------------------------------------------------------------------

--ADVANCED WEAVING (For rough demo purposes only - none of these are locked yet!)
local advanced_weave = {
	"tech:coarse_fabric", ---and all the clothing etc

}

awards.register_award("awards_advanced_weaving", {
		title = "Advanced Weaving",
		description = "The skills of an experienced weaver.\n\nSKILL: can craft advanced woven items.",
		difficulty = 2,
		requires = {"awards_basic_weaving"},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_coarse_fibre.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},???
		on_unlock = function(name, def)
			crafting.unlock(name, advanced_weave)
		end
})


--EARLY ACCESS
awards.register_award("awards_weaver_early_coarse_fibre", {
		title = S("Rough-n-Ready Fibre Working"),
		description = "A skilled weaver might be able to make coarse fibre in a simpler way. \n\nSKILL: can do coarse fibre crafts from weaving spot",
		difficulty = 3,
		requires = {"awards_advanced_weaving"},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_coarse_fibre.png",
		hud_background = "awards_bg_default.png",
		trigger = { --example placeholder (doesn't work anyway)
			type   = "craft",
			item   = "tech:coarse_fibre",
			target = 720,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, {"tech:coarse_fibre 6", "tech:coarse_fabric", "ropes:wood1rope_block", "backpacks:backpack_fabric_bag"})
		end
})



---------------------------------------------------------------------
--CARPENTER
---------------------------------------------------------------------
--ADVANCED CARPENTER (For rough demo purposes only - none of these are locked yet!)
local advanced_carp = {
	"tech:wooden_floor_boards", ---and all the rest etc

}

awards.register_award("awards_advanced_carpentry", {
		title = "Advanced Carpentry",
		description = "The skills of an experienced carpenter.\n\nSKILL: can craft advanced wooden items.",
		difficulty = 2,
		requires = {"awards_basic_carpentry"},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_wooden_floor_boards_bottom.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},???
		on_unlock = function(name, def)
			crafting.unlock(name, advanced_carp)
		end
})



--EARLY ACCESS
awards.register_award("awards_carpenter_early_carpentry", {
		title = "Rough-n-Ready Carpentry",
		description = "A skilled carpenter might be able to make do with simpler tools. \n\nSKILL: some advanced carpentery can be done from the chopping block",
		difficulty = 3,
		requires = {},
		--prizes = {},
		secret = true,--false, --currently hiding this because it's bugged (craft)
		sound = false,
		icon = "tech_tool_axe_iron.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "craft",
			item   = "tech:wooden_floor_boards", --this should really be replaced by a new `group:carpentry` (currently doesn't matter because doesn't work anyway!)
			target = 720,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, {"tech:wooden_ladder 4", "tech:wooden_floor_boards 4", "tech:wooden_stairs 4"})
		end
})



---------------------------------------------------------------------
--MASON
---------------------------------------------------------------------

--This is kind of garbage... replace with Masonry/Advanced Masonry or something
for i, v in ipairs(lore.arches_recipes) do

	local desc = minetest.registered_nodes[v[1]].description

	awards.register_award("awards_mason_"..v[1], {
			title = "More Masonry",
			description = "Stone is such a versatile material, when you know how. \n\nSKILL: craft ".. desc,
			difficulty = 3,
			--requires = {},
			--prizes = {},
			secret = true,
			sound = false,
			icon = "tech_tool_hammer_basalt.png", --would be nice to use the generated inv images instead (however that works)
			hud_background = "awards_bg_default.png",
			trigger = {
				type   = "dig",
				node   = v[1],
				target = 1,
			},
			on_unlock = function(name, def)
				crafting.unlock(name, v[2]) -- really should unlock both mortared and unmortared at the same time, for whole shape groups (it's currently a bit ridiculous)
			end
	})
end




---------------------------------------------------------------------
--SMITH
---------------------------------------------------------------------
--IRON SMELTING (For rough demo purposes only - none of these are locked yet!)
local iron_smelting = {
	"tech:crushed_iron_ore", ---and all the rest etc

}

awards.register_award("awards_iron_smelting", {
		title = "Iron Smelting",
		description = "The secrets of releasing metal from earth and fire are difficult to master.\n\nSKILL: can craft iron smelting items.",
		difficulty = 3,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_crushed_iron_ore.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},???
		on_unlock = function(name, def)
			crafting.unlock(name, iron_smelting)
		end
})


--SMITHING (For rough demo purposes only - none of these are locked yet!)
local smithing = {
	"tech:iron_fittings 2", ---and all the rest etc

}

awards.register_award("awards_smithing", {
		title = "Smithing",
		description = "Working iron into usable items is a difficult skill.\n\nSKILL: can craft iron items.",
		difficulty = 2,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "tech_iron_fittings.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},???
		on_unlock = function(name, def)
			crafting.unlock(name, iron_smelting)
		end
})


--APTITIUDE
--BUG: for some reason this only works with awards if the recipes are here in awards
-- despite the fact that weaving is okay with doing this in Lore!

crafting.register_recipe({
	type = "hammering_block",
	output = "tech:pickaxe_iron",
	items = {'tech:iron_ingot 2', 'tech:stick'},
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


awards.register_award("awards_smith_early_smithing", {
		title = S("Rough-n-Ready Smithing"),
		description = S("A skilled smith might be able to make do with simpler tools. \n\nSKILL: some advanced smithing can be done without an anvil by simple hammering"),
		difficulty = 3,
		requires = {"awards_smithing"},
		--prizes = {},
		secret = true,--false, --currently hiding this because it's bugged (craft)
		sound = false,
		icon = "tech_tool_hammer_basalt.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "craft",
			item   = "tech:iron_ingot",
			target = 96,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, {"tech:pickaxe_iron", "tech:axe_iron", "tech:mace_iron"})
		end
})



---------------------------------------------------------------------
--UNIQUE CRAFTS
--bellow are items highly specific to certain character types
---------------------------------------------------------------------

---------------------------------------------------------------------
--BOOBY TRAPS
---------------------------------------------------------------------
awards.register_award("awards_boobytrap_sharpened_stakes", {
		title = "Sharpened Stakes",
		description = "People who've thought a lot about killing might have some ideas... \n\nSKILL: craft the Sharpened Stakes booby trap",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_sharpened_stakes.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:sharpened_stakes",
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:sharpened_stakes")
		end
})

--BUG: awards wont recognize it in lore
crafting.register_recipe({
	type = "anvil",
	output = "lore:caltrop 24",
	items = {'tech:iron_ingot 1',},
	level = 1,
	always_known = false,
})

awards.register_award("awards_boobytrap_caltrop", {
		title = "Caltrop",
		description = "People who've thought a lot about killing might have some ideas... \n\nSKILL: craft the Caltrop booby trap",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_caltrop.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:caltrop",
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:caltrop 24")
		end
})

---------------------------------------------------------------------
--RITUAL
---------------------------------------------------------------------

awards.register_award("awards_ritual_shrine", {
		title = "Shrine",
		description = "We all worship something, don't we? Some do. \n\nSKILL: craft a Shrine",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_exile_letter.png", --placeholder
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:shrine", --perhaps something more sophisticated should be done for unlocking shrines?
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:shrine")
		end
})

awards.register_award("awards_ritual_mask", {
		title = "Ritual Mask",
		description = "Behind the mask the unseen is made seen. \n\nSKILL: craft a Ritual Mask",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_inv_ritual_mask.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:ritual_mask", --digging doesn't work on a craft item. Need a place in inventory, or on_wear callback.
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:ritual_mask")
		end
})

awards.register_award("awards_ritual_divination_bones", {
		title = "Divination Bones",
		description = "Great power requires great sacrifice. The initiated may read the omens. \n\nSKILL: craft Divination Bones",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_exile_letter.png", --placeholder
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:divination_bones",
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:divination_bones")
		end
})


---------------------------------------------------------------------
--ARTIST
---------------------------------------------------------------------

awards.register_award("awards_artist_harp", {
		title = "Harp",
		description = "If you know how to play, the music is lovely. \n\nSKILL: craft Harp",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_exile_letter.png", --placeholder (the harp texture could be tidied up!)
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:harp", --feel like something this complicated should have extra steps beyond, "Yeah I saw a harp once. I can make that."
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:harp")
		end
})

awards.register_award("awards_artist_flute", {
		title = "Flute",
		description = "If you know how to play, the music is lovely. \n\nSKILL: craft Flute",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_flute.png",
		hud_background = "awards_bg_default.png",
		trigger = {
			type   = "dig",
			node   = "lore:flute",
			target = 1,
		},
		on_unlock = function(name, def)
			crafting.unlock(name, "lore:flute")
		end
})


---------------------------------------------------------------------
--UNIQUE SKILLS
--bellow are skills highly specific to certain character types
---------------------------------------------------------------------
--Garbage demonstration
awards.register_award("awards_literacy", {
		title = "Literacy",
		description = "The markings are like pictures for words. \n\nSKILL: can read and write",
		difficulty = 4,
		--requires = {},
		--prizes = {},
		secret = true,
		sound = false,
		icon = "lore_exile_letter.png",
		hud_background = "awards_bg_default.png",
		--trigger = {},
		on_unlock = function(name, def)
			--??? Allow them to read/write books?
		end
})

--Can play flute/harp etc would be better handled like this (vs "Is artist?" check)

----------
----------
----------
end)
