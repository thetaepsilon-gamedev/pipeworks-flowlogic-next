-- Various settings

local prefix = "pipeworks_"

local settings = {
	enable_pipes = true,
	enable_autocrafter = true,
	enable_deployer = true,
	enable_dispenser = true,
	enable_node_breaker = true,
	enable_teleport_tube = true,
	enable_pipe_devices = true,
	enable_redefines = true,
	enable_mese_tube = true,
	enable_detector_tube = true,
	enable_digiline_detector_tube = true,
	enable_conductor_tube = true,
	enable_digiline_conductor_tube = true,
	enable_accelerator_tube = true,
	enable_crossing_tube = true,
	enable_sand_tube = true,
	enable_mese_sand_tube = true,
	enable_one_way_tube = true,
	enable_priority_tube = true,
	enable_lua_tube = true,
	enable_cyclic_mode = true,
	drop_on_routing_fail = false,

	delete_item_on_clearobject = true,
}

-- documentation for toggles controlling pressure logic features
-- do not edit this;
-- instead, copy the uncommented lines into pipeworks_settings.txt in your world directory.
--[[
-- enable pressure logic mode instead of "classic" mode.
-- WARNING: this changes a few things, most noticeably how pumps work.
-- you'll want to make sure they're fed by an infinite spring.
pipeworks.toggles.pressure_logic = true

-- force-enable finite water handling mode.
-- this changes the way that water node placement is handled;
-- volume will always be preserved, and water is assumed to move itself downwards.
-- nil (the default) means autodetect from installed finite liquid mods, true is force-on, false is force-off.
-- note that you should NOT normally explicitly set this to either true or false,
-- unless the mod you want this for is not covered by autodetect-finite-water.lua.
-- please file an issue if you need to use this for a finite water mod exists not covered there.
pipeworks.toggles.finite_water = nil
]]

for name, value in pairs(settings) do
	local setting_type = type(value)
	if setting_type == "boolean" then
		pipeworks[name] = minetest.settings:get_bool(prefix..name)
		if pipeworks[name] == nil then
			pipeworks[name] = value
		end
	else
		pipeworks[name] = value
	end
end
