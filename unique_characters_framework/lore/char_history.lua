----------------------------------------------------------
--CHARACTER HISTORY
--[[
Life story of our character.

This decides:
1) Backstory:
Provides roleplaying flavour.


2) What unique physical traits they have:
 NEEDS HEALTH MOD REWORK BEFORE THIS CAN BE DONE
Traits need to be selected based on suit and/or pain

Might be possible to do a mood-level system as well.
e.g. high mood speeds recovery
This would be based around the character's pain/need (with flavour from roles/suit/etc).
e.g. a character dealing with fear might get mood boosts/hits for safety related behaviours (like being outside at night, or exploring new locations)
The character would need to be able to change and grow.
e.g. overcome the fear, or if injured develop fear problems
(Not sure how this would work though)


3) What unique skills they have
See unique _crafts.lua


4)
Various other bonuses and quirks might be possible throughout the entire game, using suit/pain etc to keep them on theme



]]
----------------------------------------------------------
local random = math.random




----------------------------------------------------------
-- Backstory
----------------------------------------------------------

---------------
--Polity Adjectives
--dragon
local pol_adject_dr = {
  "mysterious",
  "wonder-working",
  "dangerous",
  "dark",
  "tyrannical",
  "feared",
  "monstrous",
  "protective",
  "benevolent",
  "golden",
  "fiery",
  "barren",
  "holy",
  "sacred",
  "revered",
}

--hydrogen
local pol_adject_hy = {
  "scientific",
  "space-borne",
  "airborne",
  "technological",
  "advanced",
  "scattered",
  "ephemeral",
  "volatile",
  "cold",
  "energetic",

}

--frontier
local pol_adject_fr = {
  "warlike",
  "expansionist",
  "slave-raiding",
  "nomadic",
  "primitive",
  "little-known",
  "rouge",
  "enterprising",
  "sea-faring",
  "freedom-loving"
}

--clock
local pol_adject_cl = {
  "rational",
  "orderly",
  "well-managed",
  "civilized",
  "scholarly",
  "industrious",
  "mechanical",
  "old",
  "young",
  "dying",
  "newborn"
}

--cucumber
local pol_adject_cu = {
  "fertile",
  "healthy",
  "green",
  "pleasant",
  "quiet",
  "calm",
  "agrarian",
  "decaying",
  "insubstantial",
  "watery",
  "biotech",
}

--licorice
local pol_adject_li = {
  "scandalous",
  "strange",
  "delightful",
  "hedonistic",
  "pleasurable",
  "sweet",
  "attractive",
  "desirable",
  "forbidden",
  "distasteful",
  "overpowering",
  "poisonous",
  "healing"
}

--rat
local pol_adject_ra = {
  "diseased",
  "plague-ridden",
  "hated",
  "unappreciated",
  "resourceful",
  "clever",
  "hidden",
  "criminal",
  "vermin-infested",
  "forgotten",
}

--monolith
local pol_adject_mo = {
  "ancient",
  "eternal",
  "gigantic",
  "powerful",
  "unyielding",
  "collapsed",
  "ruined",
  "totalitarian",
  "stagnant",
  "dull",
  "righteous",
  "famous",
}

-----------
--Polities
--dragon
local polity_dr = {
  "realm",
  "empire",
  "kingdom",
  "fortress-city",
  "dictatorship",
  "theocracy",
  "temple",
  "treasure house",
  "mountain home"
}

-- hydrogen
local polity_hy = {
  "republic",
  "anarchists",
  "city state",
  "federation",
  "alliance",
  "technocracy",
  "collective"

}

--frontier
local polity_fr = {
  "colony",
  "outpost",
  "trading post",
  "company",
  "company town",
  "port",
  "port city",
  "fishing port",
  "border fort",
  "tribe",
  "clan",
  "chiefdom",
  "forests",
  "mountains",
  "coast",
  "riverlands",
  "desert"
}

--clock
local polity_cl = {
  "nation",
  "free city",
  "commonwealth",
  "confederation",
  "university",
  "union",
  "guild",
  "merchant republic",
}

--cucumber
local polity_cu = {
  "hamlet",
  "village",
  "town",
  "land",
  "farmlands",
  "fields",
  "orchards",
  "lake district",
  "plantations",
  "commune"
}

--licorice
local polity_li = {
  "city",
  "market town",
  "pleasure resort",
  "holy city",
  "emporium",
  "palace",
  "winter palace",
  "summer palace",
  "healing shrine",
  "garden city",
  "orphanage",

}

--rat
local polity_ra = {
  "slum",
  "people",
  "statelet",
  "duchy",
  "principality",
  "horde",
  "sea-peoples",
  "scavengers",
  "rag-pickers",
  "district",
  "castle",
  "refugees",

}

--monolith
local polity_mo = {
  "state",
  "empire",
  "monastic order",
  "temple",
  "protectorate",
  "vassal state",
  "civilisation",
  "imperial capital",
  "world-state",
  "mines",
}

-------------
--Social Role
--{role description, role type}, both feed into unique skills/crafts

--dragon
local role_dr = {
  {{"carpet maker", "maker of tapestries", "tailor"}, {"weaver"}},
  {{"carpenter", "furniture maker"}, {"carpenter"}},
  {{"potter", "pot maker", "brick maker"}, {"potter"}},
  {{"stone mason", "brick maker"}, {"mason"}},
  {{"gold smith", "blacksmith", "armourer"}, {"smith"}},
  {{"hunter", "gamekeeper"}, {"hunter"}},
  {{"farmer", "shepherd"}, {"farmer"}},
  {{"seer", "prophet", "fortune teller", "wandering sage", "mystic", "shaman"}, {"ritual"}},
  {{"scholar", "keeper of records", "scribe", "philosopher"}, {"scholar"}},
  {{"warrior", "knight", "gladiator", "martial arts master"}, {"fighter"}},
  {{"healer", "alchemist", "apothecary"}, {"healer"}},
  {{"artist", "painter", "sculptor", "bard", "musician"}, {"artist"}},
  {{"noble"},{"scholar", "fighter", "hunter", "artist"}},
  {{"vagabond", "theif"}, {"fighter", "hunter"}},
}

--hydrogen
local role_hy = {
  {{"textiles manufacturer", "tailor", "weaver", "fashion designer"}, {"weaver"}},
  {{"biofibre printer", "carpenter"}, {"carpenter"}},
  {{"ceramics specialist", "potter"}, {"potter"}},
  {{"construction technologist", "mason"}, {"mason"}},
  {{"metallurgist", "smith", "manufacturer", "steelworker"}, {"smith"}},
  {{"hunter", "pest exterminator", "ranger"}, {"hunter"}},
  {{"hydroponics technician", "farmer", "agronomist"}, {"farmer"}},
  {{"psychotherapist", "minister", "chaplain", "meditation expert"}, {"ritual"}},
  {{"academic", "inventor", "scientist", "philosopher", "intellectual"}, {"scholar"}},
  {{"security guard", "soldier", "weapons expert"}, {"fighter"}},
  {{"doctor", "medic", "nurse", "surgeon", "pharmacist"}, {"healer"}},
  {{"artist", "designer", "painter", "sculptor", "musician"}, {"artist"}},
  {{"rebel"}, {"fighter", "scholar", "healer"}},
}

--frontier
local role_fr = {
  {{"weaver", "tailor"}, {"weaver"}},
  {{"lumberjack", "woodworker", "carpenter"}, {"carpenter"}},
  {{"potter", "pot maker", "brick maker"}, {"potter"}},
  {{"quarry worker", "mason", "brick maker"}, {"mason"}},
  {{"builder"}, {"mason", "carpenter"}},
  {{"blacksmith", "tinkerer"}, {"smith"}},
  {{"hunter", "fur trapper"}, {"hunter"}},
  {{"farmer", "rancher"}, {"farmer"}},
  {{"shaman", "missionary"}, {"ritual"}},
  {{"explorer", "teacher"}, {"scholar"}},
  {{"warrior", "legionnaire", "mercenary"}, {"fighter"}},
  {{"healer", "doctor"}, {"healer"}},
  {{"artist", "bard"}, {"artist"}},
  {{"chieftian"}, {"fighter", "hunter", "scholar"}},
  {{"smuggler", "theif", "rebel", "pirate"}, {"fighter", "hunter"}}
}

--clock
local role_cl = {
  {{"weaver", "tailor", "hat maker"}, {"weaver"}},
  {{"carpenter", "furniture maker"}, {"carpenter"}},
  {{"potter", "pot maker", "brick maker"}, {"potter"}},
  {{"quarry worker", "mason", "brick maker", "bricklayer"}, {"mason"}},
  {{"blacksmith", "tinkerer", "watch-maker"}, {"smith"}},
  {{"hunter", "rat trapper"}, {"hunter"}},
  {{"farmer", "shepherd", "fruit picker"}, {"farmer"}},
  {{"priest", "member of the clergy", "missionary", "minister", "chaplain" }, {"ritual"}},
  {{"inventor", "philosopher", "teacher", "clerk", "librarian", "historian"}, {"scholar"}},
  {{"soldier", "police officer"}, {"fighter"}},
  {{"doctor", "nurse", "surgeon", "apothecary"}, {"healer"}},
  {{"artist", "painter", "sculptor", "musician"}, {"artist"}},
  {{"politician"}, {"scholar", "ritual"}},
  {{"vagabond", "theif", "smuggler"}, {"fighter", "hunter"}},
}

--cucumber
local role_cu = {
  {{"weaver", "tailor", "basket maker"}, {"weaver"}},
  {{"woodworker", "carpenter"}, {"carpenter"}},
  {{"potter"}, {"potter"}},
  {{"mason", "brick maker", "bricklayer"}, {"mason"}},
  {{"tinkerer", "smith"}, {"smith"}},
  {{"hunter", "gamekeeper"}, {"hunter"}},
  {{"peasant", "farmer", "shepherd", "gardener", "orchadist"}, {"farmer"}},
  {{"shaman", "priest"}, {"ritual"}},
  {{"school teacher", "clerk"}, {"scholar"}},
  {{"police officer"}, {"fighter"}},
  {{"healer", "apothecary"}, {"healer"}},
  {{"artist", "clown", "bard"}, {"artist"}},
}

--licorice
local role_li = {
  {{"tailor", "dress maker", "clothier", "fashion designer"}, {"weaver"}},
  {{"woodworker", "carpenter", "furniture maker"}, {"carpenter"}},
  {{"potter"}, {"potter"}},
  {{"stone mason", "mason"}, {"mason"}},
  {{"tinkerer", "smith"}, {"smith"}},
  {{"hunter", "gamekeeper", "poacher"}, {"hunter"}},
  {{"farmer", "shepherd", "gardener", "orchadist"}, {"farmer"}},
  {{"shaman", "guru", "life coach", "motivational speaker", "psychic", "fortune teller", "mystic"}, {"ritual"}},
  {{"academic", "scholar", "philosopher", "librarian", "public intellectual"}, {"scholar"}},
  {{"martial arts master", "knight", "boxer", "gladiator", "mercenary"}, {"fighter"}},
  {{"healer", "apothecary"}, {"healer"}},
  {{"artist", "painter", "sculptor", "musician"}, {"artist"}},
  {{"noble", "courtier", "politician"}, {"scholar", "fighter", "hunter", "artist"}},
  {{"vagabond", "theif", "smuggler", "con-artist"}, {"fighter", "hunter", "scholar"}},
}

--rat
local role_ra = {
  {{"weaver", "tailor", "sack maker"}, {"weaver"}},
  {{"lumberjack", "woodworker", "carpenter"}, {"carpenter"}},
  {{"potter", "pot maker", "brick maker"}, {"potter"}},
  {{"quarry worker", "rock crusher", "mason", "brick maker", "bricklayer"}, {"mason"}},
  {{"tinkerer"}, {"smith"}},
  {{"hunter", "poacher", "rat trapper"}, {"hunter"}},
  {{"peasant", "shepherd"}, {"farmer"}},
  {{"preacher", "missionary", "psychic"}, {"ritual"}},
  {{"writer", "lawyer", "accountant", "public intellectual"}, {"scholar"}},
  {{"boxer", "mercenary", "hired goon", "cage-fighter", "gladiator"}, {"fighter"}},
  {{"mortician", "drug-dealer"}, {"healer"}},
  {{"artist", "musician"}, {"artist"}},
  {{"politician"}, {"scholar", "fighter", "hunter", "artist"}},
  {{"vagabond", "theif", "smuggler", "con-artist"}, {"fighter", "hunter", "scholar"}},
}

--monolith
local role_mo = {
  {{"weaver", "tailor", "carpet maker"}, {"weaver"}},
  {{"woodworker", "carpenter", "furniture maker"}, {"carpenter"}},
  {{"potter", "pot maker", "brick maker"}, {"potter"}},
  {{"quarry worker", "stone mason", "mason", "brick maker"}, {"mason"}},
  {{"builder"}, {"mason", "carpenter"}},
  {{"blacksmith", "gold smith"}, {"smith"}},
  {{"hunter", "gamekeeper"}, {"hunter"}},
  {{"farmer", "shepherd", "orchadist"}, {"farmer"}},
  {{"seer", "prophet", "priest", "high-priest", "cleric", "inquisitor" }, {"ritual"}},
  {{"philosopher", "scholar", "scribe", "historian"}, {"scholar"}},
  {{"soldier", "legionnaire", "centurion"}, {"fighter"}},
  {{"surgeon", "apothecary", "alchemist"}, {"healer"}},
  {{"artist", "painter", "sculptor", "musician"}, {"artist"}},
  {{"noble"},{"scholar", "fighter", "hunter", "artist"}},
  {{"vagabond", "theif"}, {"fighter", "hunter"}},

}

--------------
-- personality
--dragon
local personality_dr = {
  --openness
  "an imaginative",
  "a stubborn",
  "an expansive",
  "a dogmatic",
  -- conscientiousness
  "an obsessive",
  "a wild",
  "a meticulous",
  "a nonchalant",
  -- extroversion
  "a bold",
  "a secretive",
  "a narcissitic",
  "a reclusive",
  -- agreeableness
  "an honorable",
  "a tempestous",
  "a charming",
  "a harsh",
  -- neuroticism
  "a firey-tempered",
  "an unshakeable",
  "a psychopathic",
  "a sanguine",
}

--hydrogen
local personality_hy = {
  --openness
  "a broad-minded",
  "an unexcitable",
  "a flexible",
  "an orthodox",
  -- conscientiousness
  "a precise",
  "a creative",
  "a studious",
  "a blasé",
  -- extroversion
  "an outgoing",
  "a quiet",
  "a companionable",
  "a self-absorbed",
  -- agreeableness
  "an easy-going",
  "an argumentative",
  "a congenial",
  "a repulsive",
  -- neuroticism
  "a hyper-reactive",
  "a stable",
  "a frenetic",
  "a sprightly",
}

--frontier
local personality_fr = {
  --openness
  "a rebellious",
  "a conventional",
  "a fair-minded",
  "a partisan",
  -- conscientiousness
  "a methodical",
  "a haphazard",
  "a indefatigable",
  "a lackadaisical",
  -- extroversion
  "a gregarious",
  "a reserved",
  "a chummy",
  "a taciturn",
  -- agreeableness
  "a welcoming",
  "a suspicious",
  "an accommodating",
  "an abrasive",
  -- neuroticism
  "a hair-trigger",
  "a steady",
  "a skittish",
  "a thick-skinned",
}

--clock
local personality_cl = {
  --openness
  "an investigative",
  "a practical",
  "a pliable",
  "a rigid",
  -- conscientiousness
  "an organized",
  "a disorganized",
  "a dependable",
  "a slipshod",
  -- extroversion
  "a loud",
  "a withdrawn",
  "a cavalier",
  "a ruminative",
  -- agreeableness
  "a gullible",
  "a critical",
  "a courteous",
  "a stern",
  -- neuroticism
  "a twitchy",
  "a complacent",
  "an uptight",
  "a serene",
}

--cucumber
local personality_cu = {
  --openness
  "an eccentric",
  "a traditional",
  "an even-handed",
  "a bigoted",
  -- conscientiousness
  "a tidy",
  "a splatter-brained",
  "a virtuous",
  "an unthinking",
  -- extroversion
  "a sociable",
  "a shy",
  "a generous",
  "a cold",
  -- agreeableness
  "a soft-hearted",
  "a judgemental",
  "a friendly",
  "an ill-natured",
  -- neuroticism
  "a shaky",
  "a calm",
  "a nutty",
  "a phlegmatic",
}

--licorice
local personality_li = {
  --openness
  "an unconventional",
  "a unoriginal",
  "an indulgent",
  "a myopic",
  -- conscientiousness
  "an elegant",
  "an impulsive",
  "a fastidious",
  "an immature",
  -- extroversion
  "an expressive",
  "a wary",
  "a loving",
  "a misanthropic",
  -- agreeableness
  "a generous",
  "a cynical",
  "a cordial",
  "a disgusting",
  -- neuroticism
  "a moody",
  "a reliable",
  "a hysterical",
  "a leisurely",
}

--rat
local personality_ra = {
  --openness
  "an inquisitive",
  "a small-minded",
  "a permissive",
  "an unimaginative",
  -- conscientiousness
  "a persistent",
  "a careless",
  "an earnest",
  "an unreliable",
  -- extroversion
  "a warm-hearted",
  "a cautious",
  "an impudent",
  "a timid",
  -- agreeableness
  "an entertaining",
  "a foul",
  "a jolly",
  "an insufferable",
  -- neuroticism
  "a paranoid",
  "an unconcerned",
  "a jumpy",
  "a stoic"
}

--monolith
local personality_mo = {
  --openness
  "a truth-seeking",
  "a fanatical",
  "a lenient",
  "an intolerant",
  -- conscientiousness
  "a disciplined",
  "a chaotic",
  "a zealous",
  "a negligent",
  -- extroversion
  "a magnanimous",
  "a mistrustful",
  "an egotistical",
  "a cheerless",
  -- agreeableness
  "a hospitable",
  "a hostile",
  "a respectable",
  "an imperfect",
  -- neuroticism
  "a deranged",
  "an oblivious",
  "a deviant",
  "a well-adjusted",
}


------------
local human_needs = {
  --subsistence
  "the basic necessities of life",
  "to find enough to eat",
  "a home",
  "a place to rest",
  "work",
  "money",
  "to take care of some health issues",
  "medical care",
  "to release certain urges",
  "to find greener pastures",
  "to find better people to be around",
  "to find someplace better",
  "support from others",
  "to clean up",
  --protection
  "protection",
  "to get insurance",
  "to find some solidarity",
  "join together with others",
  "to build up a warchest",
  "to save up for the bad times",
  "to stock up for the future",
  "secure some basic rights",
  "make some preventative plans",
  "learn how to fight",
  --affection
  "love",
  "a reason to feel confident",
  "friends",
  "a partner",
  "a companion",
  "a companion animal",
  "someone to hold",
  "someone to talk to",
  "someone to share life with",
  "to find someone who would care",
  "privacy",
  "to join the gang",
  "to find a place of tolerance and compassion",
  --understanding
  "to find a teacher",
  "to find a certain book",
  "to find a certain artwork",
  "to get a new education",
  "to learn some new skills",
  "to join a group of experts",
  "to analyse the facts",
  "to meditate on some things",
  "to listen to intuition",
  "more literature",
  "more art",
  "to study a new branch of knowledge",
  --participation
  "to participate more",
  "respect",
  "to have certain rights recognized",
  "to fulfill certain responsibilities",
  "to make a contribution",
  "to fulfill the demands of duty",
  "to gain certain priviliges",
  "to take part in the collective effort",
  "to put some skills to work",
  "to find a way to cooperate",
  "to propose a plan",
  "to share with others",
  "to express disagreement",
  "to obey the rules",
  "to join the party",
  "to get membership with the club",
  "to join the association",
  --idleness
  "to explore some interests",
  "to indulge a passion",
  "to indulge a fantasy",
  "to let fancy lead where it will",
  "to imagine a different world",
  "peace and tranquillity",
  "to indulge the pleasures of the body",
  "to have fun",
  "to play a game",
  "to enjoy watching some spectacle",
  "to go to a party",
  "to relax",
  "to simply day-dream for a while",
  "to brood",
  "to reminisce about the past",
  "some free-time",
  "to enjoy the pleasures of life",
  --creation
  "to make something",
  "to turn fantasy into reality",
  "to create something new",
  "access to a workshop",
  "some new tools",
  "some new materials",
  "an audience",
  "a space for self-expression",
  "to follow an idea to completion",
  "to satisfy a creative urge",
  "to get inventive",
  --identity
  "somewhere to belong",
  "to be different from the others",
  "to be more assertive",
  "to learn to use the language more correctly",
  "to adopt the habits of the group",
  "to make a commitment",
  "to clarify what really mattered",
  "to stand up for what really mattered",
  "to do some self-development",
  "to be recognized",
  "to share their values",
  "to find a new social role",
  --freedom
  "freedom",
  "liberty",
  "to throw off the chains of oppression",
  "more autonomy",
  "more self-determination",
  "to get rebellious",
  "to live differently than everyone else",
  "to be able to choose",
  "the right to do things differently",


}



------------
--life pain
-- something traumatic that happened to them
local pain_life_fear = {
  "was attacked and beaten",
  "was getting concerned about crime",
  "was sent to war",
  "gave an awful public speech",
  "was living on the edge",
  "was injured by wild beasts",
  "grew increasingly afraid of death",
  "was afraid of looking like a fool",
  "developped a phobia",
  "was terrified of what people were thinking",
  "couldn't shake off a deep anxiety",
  "became consumed by worry",
  "felt too unsafe",
  "learned of an horrific threat that would soon arrive",

}

local pain_life_anger = {
  "was discriminated against on a daily basis",
  "was denied access to the necessities of life",
  "was kept in an inferior position",
  "gave everything, and got nothing",
  "was insulted by so-called reputable people",
  "was slapped in the face",
  "was threatened",
  "was disrespected by a friend",
  "was forced to abandon well-laid plans",
  "didn't recieve the proper recognition",
  "was lied to",
  "became enraged by a bunch of hypocrits",
  "was treated unfairly",
  "had too wait longer than everyone else",
  "overheard other people saying horrid things",
  "didn't get paid what was agreed",
  "was falsely accused",
  "was given false information",

}

local pain_life_guilt = {
  "was the sole survivor of that tragedy",
  "could've done something to save them, if only",
  "never said goodbye before they were parted",
  "didn't see the signs until it was too late",
  "struggled with the compromises life required",
  "had done so much to hurt so many",
  "had made too many mistakes",
  "screwed it all up",
  "knew who was to blame",
  "should've done better",
  "broke the rules",

}

local pain_life_shame = {
  "had been taught to sit down and shut up",
  "was flawed, in the eyes of society",
  "couldn't do what was required",
  "was treated as inferior and undeserving",
  "wasn't special",
  "wasn't living life to the fullest",
  "was being inauthentic",
  "was not spiritual enough",
  "was not smart enough",
  "hadn't achieved enough in life",
  "just didn't measure up",
  "wasn't famous",
  "was ugly and hated it",
  "wasn't rich enough",
  "was considered too weak to get by in this world",
  "was just another one of 'them'",
  "had probably wanted it anyway",
  "had too many problems",
  "struggled with things no one else did",
  "was a freak",

}

local pain_life_grief = {
  "lost everything",
  "lost everyone",
  "saw a friend die",
  "couldn't forget holding him as he died",
  "couldn't forget holding her as she died",
  "no longer had a home",
  "had lost that one and only true love",
  "had lost the one good person in all the world",
  "had been ruined",
  "lived to see it all ruined",
  "had lost what could never be replaced",
  "got divorced",
  "was kicked out",
  "got into too much debt",
  "was betrayed",
  "was unable to move on from a dark past",
  "considered it mere bad luck"
}

local pain_life_confusion = {
  "didn't understand why",
  "needed to know the truth that none dared speak",
  "was told nothing about what was going on",
  "didn't know who to trust",
  "didn't know what to believe",
  "sent a message, and recieved an ambigious response",
  "sent a message, and never recieved a reply",
  "got told conflicting stories",
  "knew someone was lying, but didn't know who",
  "didn't know if it was them",
  "told a lie without realizing",
  "couldn't figure out the truth anymore",
  "no longer understood what had happened",
  "was full of self-doubt"

}

local pain_life_isolation = {
  "became a hermit",
  "lived as a recluse",
  "hid away form everyone",
  "had been rejected by all",
  "was without a friend in the world",
  "was a pauper",
  "lived as a stranger among strangers",
  "lived alone",
  "was unable to connect with the world",
  "found the company of others too harsh, too uncaring",
  "didn't want anyone to see what it was really like",
  "walked away from everyone",
  "was never invited to the family reunion",
  "lost the one friendship that mattered",

}

local pain_life_worthless = {
  "was treated as sub-human",
  "was nothing to no one",
  "had no value in this world",
  "was given the dirty jobs",
  "never got a chance",
  "was nothing compared to everyone else",
  "had no sense of identity anymore",
  "was critized for everything",
  "was mocked for everything",
  "couldn't see the light",
  "reckoned that maybe it was true, what they said"

}

local pain_life_hopeless = {
  "had no future",
  "lived to see the dream die",
  "was promised much, and given little",
  "had few prospects anymore",
  "tried again, and again, but nothing worked out",
  "was trapped in a living hell",
  "had nowhere to turn",
  "was powerless",
  "knew doom would overtake them all",
  "was a captive",
  "could feel the chains",
  "lived in a void - nothing, no one, never",
  "could hear their boots, marching down the streets",
  "felt there was nothing to be done",


}

local pain_life_emptiness = {
  "had achieved success and found it hollow",
  "had no direction in life",
  "couldn't decide what to bother doing in life",
  "was overwhelmed by life's meaninglessness",
  "was trapped in a pointless life",
  "had drifted into nihilism",
  "no longer cared",
  "didn't see any point",
  "believed nothing was of any consequence anymore",
  "was empty inside",

}


-----------------------
-- What went wrong:
local woe_fear = {
  "panicked",
  "ran away",
  "freaked out",
  "lost control of the fear",
  "was overwhelmed by anxiety",
  "had a panic attack",
}

local woe_anger = {
  "was provoked to anger",
  "snapped",
  "lashed out",
  "became overwhelmed with rage",
  "got violent",
  "became obsessed with revenge",
  "screamed and shouted too much",
  "was prone to throwing things at the wall",
}

local woe_guilt = {
  "sought to attone",
  "longed for forgiveness",
  "accepted the blame",
  "hid from the truth",
  "couldn't bear the guilt",
  "was drawn to a self-inflicted punishment"
}

local woe_shame = {
  "accepted the common view",
  "decided they were right",
  "never stood up to the others",
  "kept small",
  "let the authorities have their way",
  "so hid away",
  "concealed the truth of things",
  "began living a double life",
  "became self-destructive",
  "was overwhelmed with self-loathing"
}

local woe_grief = {
  "could not live anymore like this",
  "fell into despair",
  "refused to get out of bed",
  "made a shrine to all that was lost",
  "pretended they were all still alive",
  "refused to accept what had happened",

}

local woe_confusion = {
  "decided to join a new religion",
  "got very confused",
  "did not understand what was going on",
  "discovered the ultimate truth",
  "lost faith",
  "became paranoid",
  "developped wild conspiracy theories",
  "couldn't figure out who to blame",
  "lost all sense of identity",
}

local woe_isolation = {
  "didn't want to be alone anymore",
  "hated the world",
  "felt forgotten",
  "couldn't deal with the rejection",
  "reached out",
  "decided love was dead",
  "felt like the world didn't care",
}

local woe_worthless = {
  "couldn't take it anymore",
  "didn't care what happened",
  "threw it all away",
  "had nothing to lose",
  "wanted to be important",
  "thought it would be better this way"
}

local woe_hopeless = {
  "succumbed to despair",
  "lost all hope",
  "gave up",
  "wanted it all to end",
  "had nothing to lose",
  "decided to make one last stand",
  "became desperate"
}

local woe_emptiness = {
  "mocked all existence",
  "stopped caring",
  "decided it didn't matter",
  "became deeply cynical",
  "was disgusted by life",
  "decided nothing meant anything",
  "admitted everything was a lie"
}


------------
--Woe by Suit

--dragon
local woe_dr = {
  "picked the losing side",
  "took a chance to grab power",
  "ended up on the wrong side of history",
  "offended a powerful man",
  "offended a powerful woman",
  "provoked the jealousy a rival",
  "got involved with a travelling magician",
  "met a man with two heads",
  "found a bird that could predict the future",
  "discovered a secret chamber",
  "saw a ghost",
  "received a vision from the other side",
  "had a dream that explained everything",
  "felt a burning pain, like fire"

}

--hydrogen
local woe_hy = {
  "raged against the machine",
  "made a few minor life changes",
  "had an accident",
  "had a new idea",
  "learned a new kind of music",
  "had an epiphany",
  "started something too big",
  "learned the meaning of life",
  "saw things others did not see",
  "discovered a dark passion",
  "got inventive",

}

--frontier
local woe_fr = {
  "was made an offer too good to be true",
  "took a gamble",
  "found a new way to make a living",
  "picked a fight with the wrong people",
  "chose the wrong path",
  "got caught up in someone else's mess",
  "followed bad advice",
  "had too much to drink",
  "was given a secret map",
  "went on the warpath",

}

--clock
local woe_cl = {
  "refused to conform",
  "took up a new hobby",
  "was just passing by, when",
  "was mistaken for someone else",
  "had a momentary lapse of judgement",
  "learned the truth too late",
  "built a machine that would fix everything",
  "broke down",
  "fell to pieces"
}

--cucumber
local woe_cu = {
  "decided to shake things up",
  "did what it took to feed the family",
  "said one wrong thing",
  "committed a simple indiscretion",
  "misjudged the situation entirely",
  "had a son",
  "had a daughter",
  "discovered a long-lost relative",
  "bungled a sure thing",
  "got squashed",

}

--licorice
local woe_li = {
  "saw a fantastic opportunity",
  "developped an obsession",
  "chose to live differently",
  "thought no one would notice",
  "made one bad decision",
  "gave in to temptation",
  "fell in love",
  "had an affair",
  "gave up everything for love",
  "got mixed up in a love triangle",
  "ate some odd beans",
  "found a source of great joy",
}

--rat
local woe_ra = {
  "sold out and got swindled",
  "made a bad bargain",
  "made a deal with the wrong people",
  "rose up against the oppressor",
  "refused to hide anymore",
  "got caught",
  "got snitched on",
  "fell on hard times",
  "did what needed to be done",
  "witnessed what was supposed to be secret",
  "took the bait in a trap"

}

--monolith
local woe_mo = {
  "was persecuted by the intolerant",
  "was imprisoned on false charges",
  "stood up for the truth",
  "spoke truth to power",
  "took a stand",
  "fought for a new justice",
  "put everything toward the cause",
  "decided not live that way anymore",
  "got in too deep",
  "done what they asked"
}


--------------
local gen_suit = function(suit)
  local pol_adj
  local pol
  local rol
  local persona
  local woe_suit
  if suit == "dragon" then
    pol_adj = pol_adject_dr[random(#pol_adject_dr)]
    pol = polity_dr[random(#polity_dr)]
    rol = role_dr[random(#role_dr)]
    persona   = personality_dr[random(#personality_dr)]
    woe_suit   = woe_dr[random(#woe_dr)]
  elseif suit == "hydrogen" then
    pol_adj = pol_adject_hy[random(#pol_adject_hy)]
    pol = polity_hy[random(#polity_hy)]
    rol = role_hy[random(#role_hy)]
    persona   = personality_hy[random(#personality_hy)]
    woe_suit   = woe_hy[random(#woe_hy)]
  elseif suit == "frontier" then
    pol_adj = pol_adject_fr[random(#pol_adject_fr)]
    pol = polity_fr[random(#polity_fr)]
    rol = role_fr[random(#role_fr)]
    persona   = personality_fr[random(#personality_fr)]
    woe_suit   = woe_fr[random(#woe_fr)]
  elseif suit == "clock" then
    pol_adj = pol_adject_cl[random(#pol_adject_cl)]
    pol = polity_cl[random(#polity_cl)]
    rol = role_cl[random(#role_cl)]
    persona   = personality_cl[random(#personality_cl)]
    woe_suit   = woe_cl[random(#woe_cl)]
  elseif suit == "cucumber" then
    pol_adj = pol_adject_cu[random(#pol_adject_cu)]
    pol = polity_cu[random(#polity_cu)]
    rol = role_cu[random(#role_cu)]
    persona   = personality_cu[random(#personality_cu)]
    woe_suit   = woe_cu[random(#woe_cu)]
  elseif suit == "licorice" then
    pol_adj = pol_adject_li[random(#pol_adject_li)]
    pol = polity_li[random(#polity_li)]
    rol = role_li[random(#role_li)]
    persona   = personality_li[random(#personality_li)]
    woe_suit   = woe_li[random(#woe_li)]
  elseif suit == "rat" then
    pol_adj = pol_adject_ra[random(#pol_adject_ra)]
    pol = polity_ra[random(#polity_ra)]
    rol = role_ra[random(#role_ra)]
    persona   = personality_ra[random(#personality_ra)]
    woe_suit   = woe_ra[random(#woe_ra)]
  elseif suit == "monolith" then
    pol_adj = pol_adject_mo[random(#pol_adject_mo)]
    pol = polity_mo[random(#polity_mo)]
    rol = role_mo[random(#role_mo)]
    persona   = personality_mo[random(#personality_mo)]
    woe_suit   = woe_mo[random(#woe_mo)]
  end

 return pol_adj, pol, rol, persona, woe_suit
end


local gen_pain = function(pain)
  local plif
  local psuc
  local woe_pain
  if pain  == "fear" then
    plife = pain_life_fear[random(#pain_life_fear)]
    psuc = "safe"
    woe_pain = woe_fear[random(#woe_fear)]
  elseif pain == "anger" then
    plife = pain_life_anger[random(#pain_life_anger)]
    psuc = "satisfied"
    woe_pain = woe_anger[random(#woe_anger)]
  elseif pain == "guilt" then
    plife = pain_life_guilt[random(#pain_life_guilt)]
    psuc = "reassured"
    woe_pain = woe_guilt[random(#woe_guilt)]
  elseif pain == "shame" then
    plife = pain_life_shame[random(#pain_life_shame)]
    psuc = "acceptable"
    woe_pain = woe_shame[random(#woe_shame)]
  elseif pain == "grief" then
    plife = pain_life_grief[random(#pain_life_grief)]
    psuc = "consoled"
    woe_pain = woe_grief[random(#woe_grief)]
  elseif pain == "confusion" then
    plife = pain_life_confusion[random(#pain_life_confusion)]
    psuc = "clear-minded"
    woe_pain = woe_confusion[random(#woe_confusion)]
  elseif pain == "isolation" then
    plife = pain_life_isolation[random(#pain_life_isolation)]
    psuc = "connected"
    woe_pain = woe_isolation[random(#woe_isolation)]
  elseif pain == "worthlessness" then
    plife = pain_life_worthless[random(#pain_life_worthless)]
    psuc = "confident"
    woe_pain = woe_worthless[random(#woe_worthless)]
  elseif pain == "hopelessness" then
    plife = pain_life_hopeless[random(#pain_life_hopeless)]
    psuc = "going"
    woe_pain = woe_hopeless[random(#woe_hopeless)]
  elseif pain == "emptiness" then
    plife = pain_life_emptiness[random(#pain_life_emptiness)]
    psuc = "engaged"
    woe_pain = woe_emptiness[random(#woe_emptiness)]
  end

  return plif, psuc, woe_pain

end

-------------------
local gender1 = {
	male   = "He",
	female = "She"
}

local gender2 = {
	male   = "he",
	female = "she"
}

local gender3 = {
	male   = "himself",
	female = "herself"
}

-------------


local gen_backstory = function(player)

  local meta = player:get_meta()
  local suit = meta:get_string("suit")
  local pain = meta:get_string("pain")
	local gend = player_api.get_gender(player)
  local your_name = meta:get_string("char_name")
  local pol_name = lore.generate_name(3)
  local need = human_needs[random(#human_needs)]

  local pol_adj
  local pol
  local rol
  local persona
  local woe_suit
  pol_adj, pol, rol, persona, woe_suit = gen_suit(suit)
  local rol1 = rol[1][random(#rol[1])]
  local rol2 = rol[2][random(#rol[2])]

  local plif
  local psuc
  local woe_pain
  plif, psuc, woe_pain = gen_pain(pain)



  -- save those needed later
	meta:set_string("role", rol2)
  meta:set_string("role_desc", rol1)
  meta:set_string("origin", pol_name )

  --return text for biography
  --[[
  {Bob. Dragon. Fear.}
  Bob was a suspicious soldier
  from the mysterious Kingdom of Shukulk.

  He needed freedom,
  but he was attacked and beaten.
  He could no longer keep himself safe.
  He had a panic attack.

  Then one day he saw a ghost....

  (`story` vs `bio` could be split into two variables? Just added in `STORY:` label for clarity)

  ]]
  local text =
      "\n "..your_name.." was "..persona.." "..rol1.." from"..
      "\n the "..pol_adj.." "..pol.." of "..pol_name.."."..
      "\n\n STORY:"..
      "\n "..gender1[gend].." needed "..need..","..
      "\n but "..gender2[gend].." "..plife.."."..
      "\n "..gender1[gend].." could no longer keep "..gender3[gend].." "..psuc.."."..
      "\n "..gender1[gend].." "..woe_pain.."."..
      "\n\n Then one day "..gender2[gend].." "..woe_suit.."...."

	meta:set_string("bio", text)
end


----------------------------------------------------------
-- Physical traits
----------------------------------------------------------
--TODO: will require additions to Health to have any affect
--This is all placeholders
-- Currently no idea how this will actually feed into Health mod!

local phys_tr = {
  "",--placeholder to keep missing feature blank
}

--[[
local phys_tr = {
  "frail",
  "robust",
  "heat tolerant",
  "cold tolerant",
  "gills",
  "toxin resistant",
  "photosynthetic",
  "robotic legs",
  "robotic arms",
}
]]

--Total garbage placeholder!!!
local function gen_physical(player)
  local meta = player:get_meta()
  local phys_list = phys_tr[random(#phys_tr)]
  meta:set_string("physical_traits", phys_list)

end



----------------------------------------------------------
-- Main
----------------------------------------------------------

lore.gen_char_history = function(player)
  gen_backstory(player)
  gen_physical(player) -- placeholder!
  lore.unlockCrafts(player)

end
