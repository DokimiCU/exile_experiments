-------------------------------------
--Character Tab
--[[
Various Role playing information,
Player stats etc


]]


------------------------------------

--Forms for sfinv


--get data and create form
local function sfinv_get(self, player, context)
	local meta = player:get_meta()

	local name = meta:get_string("char_name")
  local days = minetest.get_day_count() - meta:get_int("char_start_date")
	local age = meta:get_int("age")
  local lives = meta:get_int("lives")
	local bio = meta:get_string("bio")
	local physical_traits = meta:get_string("physical_traits") --placeholder!
	local role = meta:get_string("role") --probably doesn't need to be here, superseded by awards (useful for bug testing at the moment)




  local effects_list = meta:get_string("effects_list")
  local effects_list = minetest.deserialize(effects_list) or {}

  local y = 6.7
  local eff_form = ""

  for _, effect in ipairs(effects_list) do
    --convert into readable
    -- (this would be better handled more flexibly, these might not suit all)
    local severity = effect[2] or 0
    if severity == 0 then
      severity = ""
    elseif severity == 1 then
      severity = "(mild)"
    elseif severity == 2 then
      severity = "(moderate)"
    elseif severity == 3 then
      severity = "(severe)"
    elseif severity >= 4 then
      severity = "(extreme)"
    end

    y = y + 0.4
    eff_form = eff_form.."label[0.1,"..y.."; "..effect[1].." "..severity.."]"
  end

	local formspec = "label[0.0,0.1; NAME: " .. name .. "]"..
	"label[4,0.1; DAYS SURVIVED: " .. days .. "]"..
	"label[0.0,0.6; AGE: " .. age .. "]"..
	"label[4,0.6; LIVES: " .. lives .. "]".. --? Ultimately stuff about past characters belongs in some kind of "History" thing... somewhere
	"label[0.0,1.1; BIOGRAPHY: " .. bio .. "]"..
  "label[0.0,5.7; UNIQUE TRAITS: " .. physical_traits .. "]"..--placeholder!
	"label[0.0,6.3; UNIQUE SKILLS: " .. role .. "]"..--placeholder?
  "label[0.0,6.9; HEALTH:]".. --health will need to go in a new tab, this is getting cluttered. HEALTH MOD REWORK!
  eff_form

	return formspec
end



local function register_tab()
	sfinv.register_page("lore:char_tab", {
		title = "Character",
		--on_enter = function(self, player, context)
			--sfinv.set_player_inventory_formspec(player)
		--end,
		get = function(self, player, context)
			local formspec = sfinv_get(self, player, context)
			return sfinv.make_formspec(player, context, formspec, false)
		end
	})
end

register_tab()
