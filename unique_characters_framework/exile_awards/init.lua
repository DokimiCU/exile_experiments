

-- The global award namespace
awards = {
	show_mode = "hud",
	registered_awards = {},
	registered_triggers = {},
	on_unlock = {},
}


-- Internationalization support.
awards.gettext, awards.ngettext = dofile(minetest.get_modpath("exile_awards").."/intllib.lua")

-- Load files
dofile(minetest.get_modpath("exile_awards").."/data.lua")
dofile(minetest.get_modpath("exile_awards").."/api_awards.lua")
dofile(minetest.get_modpath("exile_awards").."/api_triggers.lua")
dofile(minetest.get_modpath("exile_awards").."/chat_commands.lua")
dofile(minetest.get_modpath("exile_awards").."/gui.lua")
dofile(minetest.get_modpath("exile_awards").."/triggers.lua")
dofile(minetest.get_modpath("exile_awards").."/awards.lua")

awards.load()
minetest.register_on_shutdown(awards.save)
