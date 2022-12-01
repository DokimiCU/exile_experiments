----------------------------------------------------------
--CHARACTER CORE
--[[
Here we set the defining guides for what this character is about.

1. "SUIT"
This is a non-logical way of creating an intuitive pattern so that the entire
character has a sense of unity without the origin of that unity being obvious.

Think of it like the Houses in Harry Potter (e.g. a Grinfindor vs a Slitherin),
or the domains of polytheistic gods (e.g. Dionysius god of wine, theatre, and madness).

This might seem strange, but that's deliberate. It forces a creative associational logic on things.
It breaks up obvious trait groupings (e.g. hey look it's the space Arabs in a space desert ruled by a space Caliph)

The Suits:
- Dragon
- Hydrogen
- Frontier
- Clock
- Cucumber
- Licorice
- Rat
- Monolith

e.g. if our character is a "Rat" their traits will be "Rat" traits.
"Rat" traits are anything that is conjured up by the word "Rat".
e.g. "dirty" is a good rat word, whereas clean might work with "hydrogen". (There's no right or wrong answers!)

Suit can be reused anywhere we are doing some procedural generation, and want to keep the character on theme.
Just get the character's suit, then give them an option that fits the suit.


2. "PAIN" & "NEED"
What is this character's problem?  What's driving them? What will you the player be confronted
with by playing as this character?

The idea is for the player to find something of themselves in the character by touching on some deeply universal human problems.

Any story or character development should be based around overcoming the pain to meet the need.
Both Need and Pain could be used to select traits, or influence story/events/etc. Much like suit, it keeps the character on theme.


3. Other Core traits
- Gender
- Name
- Appearance
- Age

4.
This all can then feed into character history & traits



TODO:
Need to be careful of making certain characters overpowered (so players don't repeatedly suicide to get the good ones)

Need a mechanisms for character development. Become more committed over time,
rather than throwing them off a cliff so can access locked content in another character.
- Whatever is locked to start with might get unlocked some other way.
- Character can gain powers over time (i.e. a "weak" character might become much better)
- Characters change more generally (e.g. appearance, other roleplaying)
(See skill_learning, and exile_awards system)

Some kind of pre-spawn character selection would be good (a chance to roll the dice a few times. This is a different need than respawn, which is for when getting stuck).
There's too much motivation to kill off characters to get a preferred one.

Needs & Pain are not currently used outside of character bios, but eventually should be set up so they can be used elsewhere (e.g. by any story telling system).
Needs are currently under history and might need to be grouped for workability (as is done for craft roles).
At some point this could need tidying up.

]]
----------------------------------------------------------
local ran = math.random
----------------------------------------------------------

local suit = {
  "dragon",
	"hydrogen",
	"frontier",
	"clock",
	"cucumber",
	"licorice",
	"rat",
	"monolith"
}

local pain = {
	"fear",
	"anger",
	"guilt",
	"shame",
	"grief",
	"confusion",
	"isolation",
	"worthlessness",
	"hopelessness",
	"emptiness"
}


------------------------------------------------------------------------------
-- appearance
------------------------------------------------------------------------------
-- Hair
local HC = {"black", "gray", "brown", "red", "blonde"}

--eyes
local EC = {"blue","brown","gray","green","hazel","violet"}

--Skin (natural, unnatural)
local SC = {"tan", "pale", "red", "yellow", "brown", "black"}
local USC= {"greenmen","bluemen","graymen","redmen"}


local function NewBody(player, suit, age)

   player_api.set_base_textures(player)
   local base_texture = player_api.load_base_texture_table(player)

	 --skin
	 local c_usc = 0.05
	 --boost unnatural tones in certain suits
	 if suit == "dragon"
	 or suit == "hydrogen"
	 or suit == "licorice" then
		 c_usc = 0.15
	 end

   local SColor
   if ran() > c_usc then
      SColor = SC[ran(1,#SC)]
   else
      SColor = USC[ran(1,#USC)]
   end

	 --hair
   local HColor

	 if age > 70 then
		 HColor = "gray"

	 elseif ran()<0.25 then
		 -- chance to tie the choice to the suit
		 if suit == "dragon" or suit == "licorice" then
			 local c = ran(1,3)
			 if c <= 1 then
				 HColor = "red"
			 elseif c <= 2 then
				 HColor = "blonde"
			 elseif c <= 3 then
				 HColor = "black"
			 end

		 elseif suit == "hydrogen" or suit == "monolith" or suit == "clock"  then
			 local c = ran(1,3)
			 if c <= 1 then
				 HColor = "gray"
			 elseif c <= 2 then
				 HColor = "blonde"
			 elseif c <= 3 then
				 HColor = "black"
			 end

		 elseif suit == "frontier" then
			 local c = ran(1,2)
			 if c <= 1 then
				 HColor = "brown"
			 elseif c <= 2 then
				 HColor = "black"
			 end

		 elseif suit == "rat" or suit == "cucumber" then
			 local c = ran(1,3)
			 if c <= 1 then
				 HColor = "red"
			 elseif c <= 2 then
				 HColor = "brown"
			 elseif c <= 3 then
				 HColor = "black"
			 end
		 end

	 else
		 HColor = HC[ran(1,#HC)]
	 end


	 --Eye
		local EColor
	 if ran()<0.1 then
		 -- chance to tie the choice to the suit
		 if suit == "dragon" or suit == "licorice" then
			 local c = ran(1,3)
			 if c <= 1 then
				 EColor = "green"
			 elseif c <= 2 then
				 EColor = "violet"
			 elseif c <= 3 then
				 EColor = "blue"
			 end

		 elseif suit == "monolith" or "clock" then
			 local c = ran(1,3)
			 if c <= 1 then
				 EColor = "brown"
			 elseif c <=2 then
				 EColor = "gray"
			 elseif c <=3 then
				 EColor = "blue"
			 end

		 elseif suit == "hydrogen" then
			 local c = ran(1,3)
			 if c <= 1 then
				 EColor = "blue"
			 elseif c <= 2 then
				 EColor = "violet"
			 elseif c <= 3 then
				 EColor = "grey"
			 end

		 elseif suit == "frontier" or suit == "rat" then
			 local c = ran(1,2)
			 if c <= 1 then
				 EColor = "brown"
			 elseif c <= 2 then
				 EColor = "hazel"
			 end

		 elseif suit == "cucumber" then
			 local c = ran(1,2)
			 if c <= 1 then
				 EColor = "brown"
			 elseif c <= 2 then
				 EColor = "hazel"
			 elseif c <= 3 then
				 EColor = "green"
			 end
		 end

	 else
		 EColor = EC[ran(1,#EC)]
	 end

   base_texture["skin"].color = SColor
   base_texture["hair"].color = HColor
   base_texture["eye"] = "player_"..EColor.."_eye.png"
   player_api.save_base_texture(player, base_texture)
end


------------------------------------------------------------------------------
-- Gateway effects
------------------------------------------------------------------------------
--effects at source
local function doGatewayFX(player)
  minetest.after(0.75, function()
    local pos = player:get_pos()
    minetest.sound_play( {name="lore_gateway", gain=1}, {pos=pos, max_hear_distance=100})
    minetest.add_particlespawner({
      amount = 10,
      time = 1,
      minpos = {x=pos.x-1, y=pos.y-0.5, z=pos.z-1},
      maxpos = {x=pos.x+1, y=pos.y+0.5, z=pos.z+1},
      minvel = {x = -2,  y = 0,  z = -2},
      maxvel = {x = 2, y = 0, z = 2},
      minacc = {x = -4, y = 0, z = -4},
      maxacc = {x = 4, y = 0.5, z = 4},
      minexptime = 0.5,
      maxexptime = 2,
      minsize = 1,
      maxsize = 10,
      texture = "gateway_sparks.png",
      glow = 15,
    })
  end)
end



------------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------------

lore.gen_char_core = function(player, meta)

	player_api.set_gender(player, "random")

	meta:set_string("char_name", lore.generate_name(3))
	local age = ran(16, 75)
	meta:set_int("age", age)

	local s = suit[ran(#suit)]
	meta:set_string("suit", s)
	local p = pain[ran(#pain)]
	meta:set_string("pain", p)

	NewBody(player, s, age)

	lore.gen_char_history(player)

	meta:set_int("char_start_date", minetest.get_day_count())

end




------------------------------------
--set character name and record start date
minetest.register_on_newplayer(function(player)
  local meta = player:get_meta()
	lore.gen_char_core(player, meta)
  meta:set_int("lives", 1)

  doGatewayFX(player)
end)

minetest.register_on_joinplayer(function(player)
  local meta = player:get_meta()
  local lives = ( meta:get_int("lives") or 1 )
  if lives == 0 then lives = 1 end
  meta:set_int("lives", lives)
end)

minetest.register_on_respawnplayer(function(player)
  local meta = player:get_meta()
  local name = player:get_player_name()

	crafting.lock_all(name)
  meta:set_string("shrine", "")
  awards.clear_player(name)

	lore.gen_char_core(player, meta)
	player_api.set_texture(player)
  local lives = meta:get_int("lives") or 1
  meta:set_int("lives", lives + 1)

  doGatewayFX(player)
end)
