
----------------------------------------------------------
--EXILE LETTER
--[[
sentence of exile.
Explains why you are there
]]


local random = math.random
lore = lore

----------------------------------------------------------
--judgement by pain

local judge_fear = {
  "manslaughter",
  "betrayal",
  "treachery",
  "rebellion",
  "sabotage",
}

local judge_anger = {
  "murder",
  "treason",
  "sedition",
  "betrayal",
  "treachery",
  "heresy",
  "conspiracy",
  "kidnapping",
  "rebellion",
  "espionage",
  "sabotage",
}

local judge_guilt = {
  "betrayal",
  "heresy",
  "conspiracy",
  "kidnapping",
  "corruption",
  "espionage",
  "sabotage",
}

local judge_shame = {
  "murder",
  "treason",
  "sedition",
  "betrayal",
  "treachery",
  "heresy",
  "conspiracy",
  "kidnapping",
  "corruption",
  "espionage",
  "sabotage",
}

local judge_grief = {
  "betrayal",
  "treachery",
  "heresy",
  "kidnapping",
  "sabotage",
}

local judge_confusion = {
  "betrayal",
  "treachery",
  "heresy",
  "corruption",
  "rebellion",
  "espionage",
  "sabotage",
}

local judge_isolation = {
  "heresy",
  "conspiracy",
  "kidnapping",
  "rebellion",
  "espionage",
  "sabotage",
}

local judge_worthlessness = {
  "treachery",
  "murder",
  "treason",
  "sedition",
  "conspiracy",
  "rebellion",
  "sabotage",
}

local judge_hopelessness = {
  "murder",
  "treason",
  "sedition",
  "heresy",
  "conspiracy",
  "corruption",
  "rebellion",
  "sabotage",
}

local judge_emptiness = {
  "murder",
  "betrayal",
  "treachery",
  "heresy",
  "kidnapping",
  "corruption",
  "sabotage",
}


--------------
-- Judgment by suit

local judge_dr = {
  "that of which we shall not speak",
  "refusing to partake in the sacred rituals",
  "black magic",
  "eating forbidden foods",
  "touching the forbidden",
  "arson",
  "trespassing upon the tall tower",
  "grave robbing",
  "speaking a forbidden tongue",
  "assassination of one who was high-born",
  "failing to venerate the gods",
  "breaking the faith",
  "placing curses upon the innocent",
  "ritual impurity",

}

local judge_hy = {
  "endangering the survival of our people",
  "subverting the course of justice",
  "bearing false witness",
  "rejecting common sense",
  "seeking banned knowledge",
  "cruelty to animals",
  "aspirations to tyranny",
  "improper ambition",
  "rioting",
  "sowing discord among the populace",
  "attempted murder",

}

local judge_fr = {
  "smuggling contraband",
  "piracy",
  "stealing livestock",
  "consorting with disreputables",
  "sharing secrets with foreign powers",
  "cheating at dice",
  "leading an unauthorised military campaign",
  "adopting barbarian customs",
  "preaching foreign gods",
  "stubborn foolishness",

}

local judge_cl = {
  "rabble rousing",
  "inciting violence",
  "tax evasion",
  "abusing their station for personal gain",
  "fraud",
  "fakery",
  "usury",
  "forgery",
  "bribery",
  "impersonation of an official",
  "failure to exercise one's duty",
  "failing to appear for military service",

}

local judge_cu = {
  "drunkenness",
  "dark sorcery blighting the crops",
  "hoarding food during famine",
  "claiming that the world is round",
  "claiming that the world is not round",
  "promoting belief in gravity",
  "abidingly uncouth comportment",
  "harassment",
  "living with unclean creatures",
  "adultery",
  "gardening without a permit",
  "persistent idiocy",
  "sullying the reputation of our people",
  "willful sloth",

}

local judge_li = {
  "leading the youth astray",
  "unspeakable acts",
  "pickpocketing pious pilgrims",
  "dealing in harmful potions",
  "stealing priceless art",
  "aiding an adulterous princess",
  "marrying outside their caste",
  "violating the chastity of the priesthood",
  "slander",
  "desecration of holy relics",
  "gross vanity",

}

local judge_ra = {
  "vagabondage",
  "banditry",
  "embezzlement",
  "racketeering",
  "vandalism",
  "robbery",
  "possession of stolen goods",
  "hiring assassins",
  "shameful conduct",
  "wickedness",
  "poaching on royal lands",

}

local judge_mo = {
  "sinful living",
  "shameless acts",
  "cowardice in the face of glory",
  "disregard of honor",
  "forsaking our ancestors",
  "mocking all that is good",
  "insulting our great leaders",
  "disobedience toward rightful authority",
  "questioning the gloriousness of our ways",
  "deception of those who must be obeyed",
  "causing the great tragedy that befell us",
  "blasphemy",

}






-- woe upon ye
local woe = {}
local genderSU = {male = "He"     , female = "She"    } -- subjective + uppercase
local genderSL = {male = "he"     , female = "she"    } -- subjective + lowercase
local genderOU = {male = "Him"    , female = "Her"    } -- objective  + uppercase
local genderOL = {male = "him"    , female = "her"    } -- objective  + lowercase
local genderPU = {male = "His"    , female = "Her"    } -- possessive + uppercase
local genderPL = {male = "his"    , female = "her"    } -- possessive + lowercase
local genderRU = {male = "Himself", female = "Herself"} -- reflexive  + uppercase
local genderRL = {male = "himself", female = "herself"} -- reflexive  + lowercase
local populate_woe = function(player)
	local gend = player_api.get_gender(player)
	return {
	  "May "..genderPL[gend].." name be forgotten.",
	  genderSU[gend].." is proscribed.",
	  "Never suffer "..genderOL[gend].." to return.",
	  "May the gods have mercy upon "..genderOL[gend]..".",
	  "Let none come to "..genderPL[gend].." aid.",
	  "May "..genderPL[gend].." weeping never cease.",
	  genderPU[gend].." life is forfeit.",
	  "It shall be as if "..genderSL[gend].." were never born.",
	  "May "..genderPL[gend].." end be swift.",
	  "May fortune forgive "..genderOL[gend]..".",
	  genderSU[gend].." shall live so long as "..genderSL[gend].." deserves.",
	  "Let the beasts do with "..genderOL[gend].." as they wish.",
	  "This is justice.",
	  "Let none dispute it.",
	  "May "..genderSL[gend].." wander fruitlessly.",
	  "May "..genderPL[gend].." bones bleach in the sun.",
	  "May the worms feast on "..genderPL[gend].." flesh.",
	  "May "..genderPL[gend].." suffering appease the gods.",
	  "Let "..genderPL[gend].." struggling be without end.",
	  "Let fate decide "..genderPL[gend].." destiny.",
	  "May the land have pity and bury "..genderPL[gend].." disgraceful remains.",
	  "Thus we declare.",
	  "For we are merciful.",
	  "Let this be our kindness to "..genderOL[gend]..".",
	  "Begone, evildoer.",
	  "Thus do we cleanse ourselves.",
	  "We wash our hands of "..genderOL[gend]..".", -- Perhaps a reference to Pontius Pilate
	  "Fortune shall be "..genderPL[gend].." final judge.",
	  genderSU[gend].." is disowned.",
	  "We never knew "..genderOL[gend]..".",
	  genderSU[gend].." is cut off.",
	  "Let "..genderOL[gend].." live with the beasts.",
	  "Let the barbarians and wild folk have "..genderOL[gend]..".",
	  genderSU[gend].." is not fit for civilised lands.",
	  "Thus we ensure our security.", -- Perhaps a reference to Sheev Palpatine
	  "Only the righteous belong among us.",
	  "May "..genderSL[gend].." toil in vain.",
	  "So it is written. So it is done.", -- Now a reference to Cecil B. DeMille
	  "Even the dogs despise "..genderOL[gend]..".",
	  "We break no bread with traitors.",
	  "Let this be "..genderPL[gend].." journey to cleanse "..genderRL[gend].."."
	}
end
-- Various corruptions of "Ozymandias"
local exile = {
  "Ochymadion",
  "Aseymedius",
  "Eshenadios",
  "Uzymandeos",
  "Isemendion",
  "Zymenios",
  "Hocheemundis",
  "Otemanediate",
  "Oisemondas",
  "Wazymdis",
  "Wazhmindas",
  "Okaemanadia",
  "Caemandior",
  "Oshaemediash",
  "Otzakantas",
  "Archanatus"
}
-- What happened here? Lost to memory.
local mythic_terror = {
  "Great Calamity",
  "Collapse",
  "Unending Curse",
  "Ancient Curse",
  "Manifested Curses",
  "Curse",
  "Catastrophe",
  "Great Dying",
  "Mythic Terror",
  "Cold Night",
  "Night",
  "Darkness",
  "Shadows",
  "Woeful Shades",
  "Scourge",
  "Plague",
  "Eternal Plague",
  "Sleeping Evil",
  "Fiery Breath",
  "Great Burning",
  "Great Bleeding",
  "Baneful Blights",
  "Blight",
  "Ceaseless Withering",
  "Ancient Exodus",
  "Fearful Horror",
  "Evil Spirits",
  "Ghosts",
  "Haunting",
  "Wrathful Spirits",
  "Grim Fate",
  "Rumbling Earth",
  "Scorched Wastes",
  "Burning Rock",
  "Smoldering Soil",
  "Great Folly",
  "Old Tales",
  "Evil Wind",
  "Bitter Waters",
  "Everlasting Tempest",
  "Howling Dust",
  "Hateful Sky",
  "Great Confusion",
  "Twisted Existence",
  "Twisted",
  "Warped",
  "Lost"
}

local function get_string(meta, stringname)
   --minetest's get_string returns non-nil for an empty string
   local get = meta:get_string(stringname)
   if get == "" then
      return nil
   else
      return get
   end
end

local generate_text = function(player, freshspawn)
  local letter_text

  local meta = player:get_meta()
  local your_name   = meta:get_string("char_name")
  local gend        = player_api.get_gender(player)
  woe               = populate_woe(player)
  local your_woe    = woe[random(#woe)]
  local origin_name = get_string(meta, "origin")


  local pain = get_string(meta, "pain")
  local ju_pain
  if pain  == "fear" then
    ju_pain = judge_fear[random(#judge_fear)]
  elseif pain == "anger" then
    ju_pain = judge_anger[random(#judge_anger)]
  elseif pain == "guilt" then
    ju_pain = judge_guilt[random(#judge_guilt)]
  elseif pain == "shame" then
    ju_pain = judge_shame[random(#judge_shame)]
  elseif pain == "grief" then
    ju_pain = judge_grief[random(#judge_grief)]
  elseif pain == "confusion" then
    ju_pain = judge_confusion[random(#judge_confusion)]
  elseif pain == "isolation" then
    ju_pain = judge_isolation[random(#judge_isolation)]
  elseif pain == "worthlessness" then
    ju_pain = judge_worthlessness[random(#judge_worthlessness)]
  elseif pain == "hopelessness" then
    ju_pain = judge_hopelessness[random(#judge_hopelessness)]
  elseif pain == "emptiness" then
    ju_pain = judge_emptiness[random(#judge_emptiness)]
  end

  local suit = get_string(meta, "suit")
  local ju_suit
  if suit == "dragon" then
    ju_suit = judge_dr[random(#judge_dr)]
  elseif suit == "hydrogen" then
    ju_suit = judge_hy[random(#judge_hy)]
  elseif suit == "frontier" then
    ju_suit = judge_fr[random(#judge_fr)]
  elseif suit == "clock" then
    ju_suit = judge_cl[random(#judge_cl)]
  elseif suit == "cucumber" then
    ju_suit = judge_cu[random(#judge_cu)]
  elseif suit == "licorice" then
    ju_suit = judge_li[random(#judge_li)]
  elseif suit == "rat" then
    ju_suit = judge_ra[random(#judge_ra)]
  elseif suit == "monolith" then
    ju_suit = judge_mo[random(#judge_mo)]
  end




  local exile_land  = exile[random(#exile)]
  local terror      = mythic_terror[random(#mythic_terror)]
  if freshspawn then
     meta:set_string("ex_crime1", cr1)
     meta:set_string("ex_crime2", cr2)
     meta:set_string("ex_woe", your_woe)
     meta:set_string("ex_land", exile_land)
     meta:set_string("ex_terror", terror)
  else
     cr1         = get_string(meta, "ex_crime1") or cr1
     cr2         = get_string(meta, "ex_crime2") or cr2
     your_woe    = get_string(meta, "ex_woe") or your_woe
     exile_land  = get_string(meta, "ex_land") or exile_land
     terror      = get_string(meta, "ex_terror") or terror
  end

  --
  letter_text =
    "JUDGEMENT:  "..origin_name..
    "\n\n\nCONDEMNS:  "..your_name..
    "\n\n\nTO EXILE:"..
    "\n\n in "..exile_land..", land of the "..terror..
    "\n\n\nTHE CAUSE IS JUST: "..
    "\n\n"..ju_pain.." and "..ju_suit..
    "\n\n\nWE DECLARE:"..
    "\n\n"..your_woe

  return letter_text
end

--------------------------------------------
local function get_formspec(meta, letter_text)

	local formspec = {
    "size[9,11]",
	"textarea[1.5,1.5;8.6,10.6;;" .. minetest.formspec_escape(letter_text) .. ";]",
    "button_exit[8.2,10.6;0.8,0.5;exit_form;X]",
	"background[0,0;18,11;lore_exile_letter_bg.png;true]"}

	return table.concat(formspec, "")
end

local function setup_letter(player, imeta)
   if not imeta then
      minetest.log("error", "Tried to set up a letter with invalid item metatable")
      return nil
   end
   local letter_text = imeta:get_string("lore:letter_text")
   if letter_text == "" then
      letter_text = generate_text(player)
      imeta:set_string("lore:letter_text", letter_text)
   end
   return letter_text
end

-----------------------------------------------
local after_place = function(pos, placer, itemstack, pointed_thing)
  local meta = minetest.get_meta(pos)
  local stack_meta = itemstack:get_meta()
  local letter_text = setup_letter(placer, stack_meta)
  local form = get_formspec(meta, letter_text )
  meta:set_string("formspec", form)
  meta:set_string("lore:letter_text", letter_text)
end

local on_secondary_use = function(itemstack, user, pointed_thing)
   local meta = itemstack:get_meta()
   local letter_text = setup_letter(user, meta)
   local form = get_formspec(meta, letter_text)
   local pname = user:get_player_name()
   minetest.show_formspec(pname, "lore:exile_letter", form)
end

---------------------------------------------
--Placeable Node
minetest.register_node("lore:exile_letter", {
	description = "Sentence of Exile",
	tiles = {"lore_exile_letter.png"},
  --inventory_image = {"lore_exile_letter_inv.png"},
	stack_max = 1,
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propagates = true,
  walkable = false,
  drawtype = "nodebox",
  node_box = {
     type = "fixed",
     fixed = {-0.35, -0.5, -0.4, 0.35, -0.45, 0.4},
  },
  groups = {dig_immediate = 3, temp_pass = 1, flammable = 1},
  sounds = nodes_nature.node_sound_leaves_defaults(),
  after_place_node = after_place,
  on_secondary_use = on_secondary_use,
  preserve_metadata = function(pos, oldnode, oldmeta, drops)
     local letter_text = oldmeta["lore:letter_text"]
     local stack_meta = drops[1]:get_meta()
     stack_meta:set_string("lore:letter_text", letter_text)
  end,
})


--------------------------------------
minetest.register_on_newplayer(function(player)
  local inv = player:get_inventory()
  local letter = ItemStack("lore:exile_letter")
  local stack_meta = letter:get_meta()
  stack_meta:set_string("creator", player:get_player_name())
  stack_meta:set_string("lore:letter_text", generate_text(player, "new"))
  inv:add_item("main", letter)
end)

minetest.register_on_respawnplayer(function(player)
  local inv = player:get_inventory()
  local letter = ItemStack("lore:exile_letter")
  local stack_meta = letter:get_meta()
  stack_meta:set_string("creator", player:get_player_name())
  stack_meta:set_string("lore:letter_text", generate_text(player, "new"))
  inv:add_item("main", letter)
end)
