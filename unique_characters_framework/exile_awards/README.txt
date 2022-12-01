Exile mod: Exile Awards
=============================

Adds achievements system e.g. for unlocking crafts

PROOF OF CONCEPT DEVELOPMENT VERSION (see matching dev version of Lore)

This is a fork of "Awards" mod, which was intended for stuff like "Dig 1000000 stone -> Hooray you dug 1000000 stone!"
We are using it as a skill tracking system, so it might need some more tweaking (seems fairly good so far though, even with the few adjustments made).

BUG:
- crafting doesn't unlock awards (not picking up that crafting occurred from crafting mod?)
- some craft recipes need to be registered in awards for mystery reasons, despite belonging elsewhere and other items having no such issue (anvil/iron crafts?)
- need an equivalent of "dig" for getting items (e.g. ritual mask). Can't dig them, so can't discover by digging. (would be best to have "on_add_to_inventory" rather than dig anyway. It's examining the item, not digging, that matters)
- localisation might not be working right (got weird bugs in masonry from leaving the S() on it)
- it's unclear how unlocking crafts can distinguish between crafts with the same output (2 sticks from craft spot vs 2 sticks from chopping) - haven't tested.

TODO:
- still need ways of unlocking other non-craft aspects (e.g. able to do divination, choose a shrine god). Can probably be handled by custom triggers, or the items themselves.
- having the pop-up "New Craft!!!!" on spawn is annoying. Best limited to actual discoveries, not character generation.
- Would be nice to have a probabilistic trigger e.g. get bioluminescent = 1% chance of unlocking glow paint.

NOTE:
- seems good to keep most skills as secret, especially grindy trigger ones - removes the temptation to grind or count progress grinding.
- remember, we don't have a tech-tree as such. Truly applying this is going to explode anyone's lingering ideas about linear progression.
 			We could have characters who know how to make iron knives, but don't know how to smelt iron (so they'd need to find materials in a ruin).
			We could have characters who can craft a harp, but can't play the harp.
			We could have characters who can fly a spaceship but don't know how to cook dinner.
- Having a character that starts with little knowledge, but then has lots of chances to pick up tiny skills
 		is a great way to make characters grow increasingly unique and quirky - their skills reflect experience.
		Therefore crafts should perhaps be divided up as much as possible. And, plenty of opportunities need to exist for skill discovery.


Authors of original source code
-------------------------------
Adapted from Awards by [rubenwardy](https://rubenwardy.com), licensed under MIT with thanks to Wuzzy, kaeza, and MrIbby.





## Awards and Triggers
=============================

An award is a single unlockable unit, registered like so:

```lua
awards.register_award("mymod:award", {
	description = "My Example Award",
})
```

Awards are unlocked either using `awards.unlock()` or by a trigger being
fullfilled. A trigger is a condition which unlocks an award. Triggers are
registered at the same time as an award is registered:

```lua
awards.register_award("mymod:award", {
	description = "My Example Award",
	trigger = {
		type   = "dig",
		node   = "default:stone",
		target = 10,
	},
})
```

The above trigger type is an example of a counted_key trigger:
rather than a single counter there's a counter per key - in this
case the key is the value of the `node` field.

If you leave out the key in a `counted_key` trigger, then the total will be used
instead. For example, here is an award which unlocks after you've placed 10
nodes of any type:

```lua
awards.register_award("mymod:award", {
	description = "Place 10 nodes!",
	trigger = {
		type   = "place",
		target = 10,
	},
})
```

You can also register an *Unlock Function*, which can return the name of an
award to unlock it:

```lua
awards.register_award("mymod:award", {
	title = "Lava Miner",
	description = "Mine any block while being very close to lava.",
})

awards.register_on_dig(function(player, data)
	local pos = player:get_pos()
	if pos and (minetest.find_node_near(pos, 1, "default:lava_source") or
			minetest.find_node_near(pos, 1, "default:lava_flowing")) then
		return "mymod:award"
	end
	return nil
end)
```

The above is a bad example as you don't actually need the stats data given.
It would be better to register a `dignode` callback and call `awards.unlock()`
if the condition is met.

## Trigger Types

The trigger type is used to determine which event will cause the trigger will be
fulfilled. The awards mod comes with a number of predefined types, documented
in [Builtin Trigger Types](#builtin-trigger-types).

Trigger types are registered like so:

```lua
awards.register_trigger("chat", {
	type = "counted",
	progress = "@1/@2 chat messages",
	auto_description = { "Send a chat message", "Chat @1 times" },
})

minetest.register_on_chat_message(function(name, message)
	local player = minetest.get_player_by_name(name)
	if not player or string.find(message, "/")  then
		return
	end
	awards.notify_chat(player)
end)
```

A trigger type has a type as well, which determines how the data is stored and
also how the trigger is fulfilled.

**Trigger Type Types:**

* **custom** requires you handle the calling of awards.unlock() yourself. You also
  need to implement on_register() yourself. You'll also probably want to implement
  `on_register()` to catch awards registered with your trigger type.
* **counted** stores a single counter for each player which is incremented by calling
  `trigger:notify(player)`. Good for homogenous actions like number of chat messages,
  joins, and the like.
* **counted_key** stores a table of counters each indexed by a key. There is also
  a total field (`__total`) which stores the sum of all counters. A counter is
  incremented by calling `trigger:notify(player, key)`. This is good for things like
  placing nodes or crafting items, where the key will be the item or node name.
  If `key` is an item, then you should also add `key_is_item = true` to the
  trigger type definition.

As said, you could use a custom trigger if none of the other ones match your needs.
Here's an example.

```lua
awards.register_trigger("foo", {
	type             = "custom",
	progress         = "@1/@2 foos",
	auto_description = { "Do a foo", "Foo @1 times" },

	on_register = function(self, award)
		print(award.name .. " was registered with foo trigger type")
	end,
})

minetest.register_on_foo(function()
	for _, trigger in pairs(awards.on.foo) do
		-- trigger is either a trigger tables or
		--   or an unlock function.

		-- some complex logic
		if condition then
			awards.unlock(trigger)
		end
	end
end)

```

## Award Difficulty

Difficulty is used to determine how awards are sorted in awards lists.

If the award trigger is counted, ie: the trigger requires a `target` property,
then the difficulty multipler is timesd by `target` to get the overall difficulty.
If the award isn't a counted type then the difficulty multiplier is used as the
overal difficulty. Award difficulty affects how awards are sorted in a list -
more difficult awards are further down the list.

In real terms, `difficulty` is a relative difficulty to do one unit of the trigger
if its counted, otherwise it's the relative difficulty of completely doing the
award (if not-counted). For the `dig` trigger type, 1 unit would be 1 node dug.


Actual code used to calculate award difficulty:

```lua
local difficulty = def.difficulty or 1
if def.trigger and def.trigger.target then
	difficulty = difficulty * def.trigger.target
end
```


# API

## Awards

* `awards.register_award(name, def)`, the def table has the following fields:
	* `title` - title of the award (defaults to name)
	* `description` - longer description of the award, displayed in Awards tab
	* `difficulty` - see [Award Difficulty](#award-difficulty).
	* `requires` - list of awards that need to be unlocked before this one
		is visible.
	* `prizes` - list of items to give when you earn the award
	* `secret` - boolean if this award is secret (i.e. showed on awards list)
	* `sound` - `SimpleSoundSpec` table to play on unlock.
		`false` to disable unlock sound.
	* `icon` - the icon image. Defaults to `awards_unknown.png`.
	* `hud_background` - the background image used in the HUD to contain the text and icon.
	                 Defaults to `awards_bg_default.png`.
	* `trigger` - trigger definition, see [Builtin Trigger Types](#builtin-trigger-types).
	* `on_unlock(name, def)` - callback on unlock.
* `awards.registered_awards` - table of award name to definition.
* `awards.register_on_unlock(func(name, def))`
	* `name` is the player name
	* `def` is the award def.
	* return true to cancel HUD from appearing.
* `awards.unlock(player_name, award_name)`
	* gives an award to a player
* `awards.get_award_states(player_name)`
	* Returns list of tables, sorted by `score`, each having the fields:

		```lua
		{
			name     = "mymod:awardname",
			def      = {}, -- Award definition
			unlocked = true, -- Whether award has been unlocked
			started  = true, -- Whether any progress has been made
			score    = 0, -- Score used in sorting

			-- Either a table or nil
			-- Will be nil if progress is indeterminable or
			-- if the award is unlocked
			progress = {
				current = 5,
				target  = 10,
				label   = "label", -- Label to show over progress bar
			}
		}
		```

## Triggers

* `awards.register_trigger(name, def)`, the def table has the following fields:
	* `type` - see trigger type types in [Trigger Types](#trigger-types).
	* `progress` - used to format progress, defaults to "%1/%2".
	* `auto_description` - a table of two elements. Each element is a format string. Element 1 is singular, element 2 is plural. Used for the award description (not title) if none is given.
	* `on_register(self, award_def)` - called when an award registers with this type.
	* "counted_key" only:
		* `auto_description_total` - Used if the trigger is for the total.
		* `get_key(self, def)` - get key for particular award, return nil for a total.
		* `key_is_item` - true if the key is an item name. On notify(),
			any watched groups will also be notified as `group:groupname` keys.
* `awards.registered_triggers` - table of trigger name to definition.

## Builtin Trigger Types

Callbacks (register a function to be run)

* dig type: Dig a node.
	* node: the dug node type. If nil, all dug nodes are counted
* place type: Place a node.
	* node: the placed node type. If nil, all placed nodes are counted
* craft type: Craft something.
	* item: the crafted item type. If nil, all crafted items are counted
* death type: Die.
	* reason: the death reason, one of the types in PlayerHPChangeReason (see lua_api.txt)
				or nil for total deaths.
* chat type: Write a chat message.
* join type: Join the server.
* eat type: Eat an item.
	* item: the eaten item type. If nil, all eaten items are counted

(for all types) target - how many times to dig/place/craft/etc.

Each type has a register function like so:

* awards.register_on_TRIGGERTYPE(func(player, data))
	* data is the player stats data
	* return award name or null

### dig

```lua
trigger = {
	type   = "dig",
	node   = "default:dirt", -- item, alias, or group
	target = 50,
}
```

### place

```lua
trigger = {
	type   = "place",
	node   = "default:dirt", -- item, alias, or group
	target = 50,
}
```

### craft

```lua
trigger = {
	type   = "craft",
	item   = "default:dirt", -- item, alias, or group
	target = 50,
}
```

### death

```lua
trigger = {
	type   = "death",
	reason = "fall",
	target = 5,
}
```

### chat

```lua
trigger = {
	type   = "chat",
	target = 100,
}
```

### join

```lua
trigger = {
	type   = "join",
	target = 100,
}
```

### eat

```lua
trigger = {
	type   = "eat",
	item   = "default:apple",
	target = 100,
}
```
