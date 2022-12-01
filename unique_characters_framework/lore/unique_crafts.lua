----------------------------------------------------------
--UNIQUE CRAFTS
--[[
Mostly based on role, with flavour from suit (but could use anything from character backstory)

- weaver: fabrics
- carpenter: woodwork
- potter: pottery
- mason: stone
- smith: metal working
- hunter: snares, hunting tools
- farmer: plants and animal
- ritual: religio-magical
- scholar: writing & intellectual
- fighter: weapons
- healer: medicines
- artist: artworks

(these roles could be expanded)


Types of bonus:
- early access to their speciality (their skills are good enough to make do with simpler tools/materials)
- unique items (things only they would know how to or want to make)


Limitations:
- early access should only be a small bonus, not overpowered.
- Anything that the majority of players will want access to regularly should NOT be a unique craft, because they will be incentivised to suicide their characters
- unique items should not be needed for core gameplay (these items are only rarely available)
- unique items should be limited to:
	- roleplaying that can only be done by that character type (i.e. no suiciding to collect them all, because new character can't use it anyway)
	- AND/OR functionally equivalent to regular items (i.e. decorative with no gameplay advantage)
	- AND/OR extremely costly (i.e. pursuing the item involves commiting to the character)
	- AND/OR only useful for extreme play styles best for certain characters (i.e. mostly useless if you change character)
	- AND/OR type 1 learning that can be easily picked up with a new character (see skill_learning - missing feature)

Also see exile_awards:
	This implementation is seriously incomplete. This is a feature that needs working through the entire game.
	All crafts should be registered as unlockable skills. In that sense everything becomes a unique craft.
	However most crafts would be available to most characters. Only some crafts are hyper-specific to certain kinds of characters (e.g. a seer with divination bones)

	If skill_learning could be made to work well, then many of the more complicated crafts in tech could be locked.
	Instead characters would have to find old ruins etc to learn crafts. Character death would become very high stakes - you might lose considerable skills.
	Your character would start with good skills in their speciality (plus some from suit for flavour),
	but would be limited to crude stuff for everything else until they learn it.
	For example, how many people would really be able to figure out iron smelting or glass making on their own in the wilderness unless they had prior knowledge?
	This would give large incentive to explore and find old ruins, and not let good characters die.

TODO:

Levels:
- older characters should get access to more and/or more difficult crafts
i.e. a 65 yr old potter has 50yrs more experience than a 15yr old potter.
- this should balance against health limits/boosts based on age.


Non-craft Bonuses (need to be implemented elsewhere)
- ways to access extra specialist knowledge
- various boosts to effectiveness? (e.g. tools? recipe costs?)

Ability to handle more than one role (e.g. a 60yr old might have had 5 different careerers)

Some obscure recipes (e.g. divination bones) might be better displayed in a "Unique" tab, to avoid clutter

More unique crafts... don't have much here now (becomes less important if exile_awards really does get applied to everything)

-----------------------------------------
-- potter: pottery
----------------------
TODO: Non-craft Bonuses: Add something like artificats potters_probe behaviour into pottery itself.
Allow potters to click to read state of the firing. Regular characters must use the artifact.

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



-----------------------------------------
--hunter
----------------------
?? - has spikes (from fighter) but they are currently useless for hunting.

TODO: Could add various snares etc, but currently wont work for same reason spikes don't.

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

-----------------------------------------
--farmer
----------------------
TODO: Non-craft Bonuses: Add something like artificats animal_probe/baking/plant growth behaviour into items themselves.
Allow farmer to click to read info. Regular characters must use the artifact.

TODO: Some way to get more seeds from plants (without overriding recipe for everyone, nor having two sets of threshing recipes)

??
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

-----------------------------------------
--scholar
----------------------
TODO: something like Mineclone's lookup tool (relies on an encyclopedia)??
 To investigate materials/animals/etc in detail. Suggest properties, possible uses...


These characters should be best suited to handle artifacts... somehow
??
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


-----------------------------------------
--healer
----------------------
NEEDS HEALTH MOD REWORK before its sensible to touch this
??
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
----------------------------------------------------------
local ran = math.random

----------------------------------------------------------
-- RANDOM DIVINTY (for shrines)
----------------------------------------------------------
local function gen_divinity(player, suit)

	local name = lore.generate_name(3)

	local type = {
		"Patron Saint",
		"God",
		"Goddess",
		"True Hero",
		"King",
		"Queen",
		"Lord",
		"Prince",
		"Princess",
	}

	local domain = {}
	if suit == "dragon" then
		domain = {
			"Prophecy",
			"The Moon",
			"Wisdom",
			"Chaos",
			"Fire",
			"Metalworking",
			"The Sky",
			"Earthquakes",
			"Volcanoes",
			"Lightning",
			"Revenge",
			"Mountains",
			"Destruction",

		}
	elseif suit == "hydrogen" then
		domain = {
			"Music",
			"Art",
			"Knowledge",
			"Healing",
			"Intelligence",
			"Light",
			"The Heavens",
			"Stars",
			"The Sun"
		}
	elseif suit == "frontier" then
		domain = {
			"The Hunt",
			"Wilderness",
			"Wealth",
			"Strategy",
			"The Sea",
			"Rivers",
			"Travellers",
			"Messengers",
		}

	elseif suit == "clock" then
		domain = {
			"Reason",
			"Skill",
			"Peace",
			"Family",
			"Language",
			"Justice",
			"Eternity",
			"Time",
			"Memory",
			"The Seasons"
		}

	elseif suit == "cucumber" then
		domain = {
			"Animals",
			"Handicrafts",
			"Agriculture",
			"Plants",
			"Fertility",
			"The Hearth",
			"The Home",
			"Flood",
			"Drought",
			"Weather",
			"Earth",
			"Slumber",
			"Fish",
			"Freshwater",
		}

	elseif suit == "licorice" then
		domain = {
			"Love",
			"Beauty",
			"Desire",
			"Drunkeness",
			"Festivals",
			"Madness",
			"Theatre",
			"Ecstasy",
			"Youth",
		}

	elseif suit == "rat" then
		domain = {
			"Plague",
			"Death",
			"Speech",
			"Cunning",
			"Theives",
			"Luck",
			"Deception",
			"Poison",
			"Misery",
			"Shadow",
			"Darkness",
		}

	elseif suit == "monolith" then
		domain = {
			"The Underworld",
			"Empire",
			"Doom",
			"Day",
			"Night",
			"Inevitability",
			"Emptiness",
			"War",
			"Violence",
			"Courage",
		}

	end

	local type = type[ran(#type)]
	domain = domain[ran(#domain)]

	return name.." "..type.." of "..domain


end



----------------------------------------------------------
-- crafts
----------------------------------------------------------
local modpath = minetest.get_modpath('lore')
dofile(modpath..'/ucrafts_weaver.lua')
dofile(modpath..'/ucrafts_carpenter.lua')
dofile(modpath..'/ucrafts_mason.lua')
dofile(modpath..'/ucrafts_ritual.lua')
dofile(modpath..'/ucrafts_fighter.lua')
dofile(modpath..'/ucrafts_artist.lua')
----------------------------------------------------------
-- main
----------------------------------------------------------

lore.unlockCrafts = function(player)
  local meta = player:get_meta()
  local role = meta:get_string("role")
	local role_desc = meta:get_string("role_desc")
  local suit = meta:get_string("suit")
  local age = meta:get_int("age")
	local player_name = player:get_player_name()

	--basics for everyone (incomplete and nonfunctional - just for demo purposes)
	awards.unlock(player_name, "awards_basic_carpentry")
	awards.unlock(player_name, "awards_basic_stoneworking")
	awards.unlock(player_name, "awards_basic_fire")
	awards.unlock(player_name, "awards_basic_pottery")
	awards.unlock(player_name, "awards_basic_construction")
	awards.unlock(player_name, "awards_basic_weaving")
	awards.unlock(player_name, "awards_basic_cookery")

	--some random skills on the basis of age (placeholder examples)
	--things people might pick up across a lifetime
	for i = 16, age, 5 do

		if  ran() < 0.05 then
			awards.unlock(player_name, "awards_boobytrap_sharpened_stakes")
		end

		if  ran() < 0.05 then
			awards.unlock(player_name, "awards_artist_harp")
		end

		if  ran() < 0.05 then
			awards.unlock(player_name, "awards_artist_flute")
		end

		if  ran() < 0.25 and (suit == "dragon" or suit == "monolith") then
			meta:set_string("shrine", gen_divinity(player, suit))
			awards.unlock(player_name, "awards_ritual_shrine")
		elseif ran() < 0.05 then
			meta:set_string("shrine", gen_divinity(player, suit))
			awards.unlock(player_name, "awards_ritual_shrine")
		end

		if  ran() < 0.25 and (suit == "hydrogen" or suit == "clock") then
			awards.unlock(player_name, "awards_literacy")
		elseif ran() < 0.05 then
			awards.unlock(player_name, "awards_literacy")
		end

	end


	--Crafts by Role
  if role == "weaver" then
		awards.unlock(player_name, "awards_advanced_weaving")
		for i = 16, age, 10 do
			--greater skills with experience
			if  ran() < 0.05 then
				awards.unlock(player_name, "awards_weaver_early_coarse_fibre")
			end
		end


  elseif role == "carpenter" then
		awards.unlock(player_name, "awards_advanced_carpentry")
		for i = 16, age, 10 do
			--greater skills with experience
			if  ran() < 0.05 then
				awards.unlock(player_name, "awards_carpenter_early_carpentry")
			end
		end


  elseif role == "potter" then
		--???


  elseif role == "mason" then
		--this is garbage!
		for i, v in ipairs(lore.arches_recipes) do
			awards.unlock(player_name, "awards_mason_"..v[1])
			--crafting.unlock(player_name, {v})
		end

  elseif role == "smith" then
		awards.unlock(player_name, "awards_smithing")
		for i = 16, age, 10 do
			--greater skills with experience
			if  ran() < 0.75 then
				awards.unlock(player_name, "awards_iron_smelting")
			end
			if  ran() < 0.05 then
				awards.unlock(player_name, "awards_smith_early_smithing")
			end
		end


  elseif role == "hunter" then
		awards.unlock(player_name, "awards_boobytrap_sharpened_stakes")


  elseif role == "farmer" then
		--??

  elseif role == "ritual" then

		if role_desc ~= "psychotherapist" and role_desc ~= "life coach"
		and role_desc ~= "motivational speaker" then
			meta:set_string("shrine", gen_divinity(player, suit))
			awards.unlock(player_name, "awards_ritual_shrine")
		end

		if suit == "dragon" or suit == "monolith"
		or role_desc == "priest" or role_desc == "high-priest"
		or role_desc == "mystic" or role_desc == "shaman"
		then
			awards.unlock(player_name, "awards_ritual_mask")
		end

    if suit == "dragon" or suit == "monolith"
		or role_desc == "psychic" or role_desc == "fortune teller" or "mystic"
		or role_desc == "seer" or role_desc == "prophet" then
			awards.unlock(player_name, "awards_ritual_divination_bones")
		end

  elseif role == "scholar" then
		awards.unlock(player_name, "awards_literacy")

  elseif role == "fighter" then
		awards.unlock(player_name, "awards_boobytrap_sharpened_stakes")
		awards.unlock(player_name, "awards_boobytrap_caltrop")


  elseif role == "healer" then
		--??

  elseif role == "artist" then
		awards.unlock(player_name, "awards_artist_harp")
		awards.unlock(player_name, "awards_artist_flute")
  end

end


----------------------------------------------------------------------------
--CHAT COMMANDS
--Crude. For bug testing, wouldn't recommend letting players use this
----------------------------------------------------------------------------
minetest.register_privilege("set_role", {
	description = "Set character's role for unique crafts",
	give_to_singleplayer = false
})


minetest.register_chatcommand("set_role", {
 params = "<role>",
 description = "Set character's role for unique crafts",
 privs = {privs=true},
 func = function(name, param)
    if minetest.check_player_privs(name, {set_role = true}) then
			local player = minetest.get_player_by_name(name)
			local meta = player:get_meta()
			--TODO: add check for valid role
			--TODO: distinguish between role related awards and ones to keep
			crafting.lock_all(player:get_player_name())
			awards.clear_player(player:get_player_name())

			meta:set_string("role", param)
			lore.unlockCrafts(player)
			return true, "Character's role set to: "..param
		end
 end,
})
