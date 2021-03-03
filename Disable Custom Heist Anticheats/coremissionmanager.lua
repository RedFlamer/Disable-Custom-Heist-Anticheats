core:module('CoreMissionManager')
core:import('CoreTable')

local level = Global.level_data and Global.level_data.level_id or ''
local _add_script_orig = MissionManager._add_script

if level == 'btms' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if (element.id == 200830 or element.id == 200255) and element.editor_name == 'love' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'Gambling_room' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 102191 and element.editor_name == 'alarm_guy_counter' 
			or element.values.on_executed[1].id = 102190 and element.values.on_executed[2].id = 102192 and element.values.on_executed[3].id = 101993
			or element.class == 'ElementCounter' and element.values.counter_target > 4 and element.id == 102191
			or element.class == 'ElementCounter' and element.values.position = Vector3(4127.89, -476.612, 4125.92) and element.values.counter_target > 4
			or element.class == 'ElementCounter' and element.values.on_executed[1].delay = 0.10000000149012 and element.values.on_executed[1].id = 102190 and element.values.counter_target > 4
			then -- if you want to be a petty asshole Croqui, have fun explaining why you changed all these things at once to break this mod
				element.values.enabled = false -- at least you boldly give "SILENT ASSASSIN DETECTED" as the alarm reason, still triggers on legitimate users though so fuck off
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'hardware_store' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 102563 and element.editor_name == 'counter_6guards' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'Xanax' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 100562 and element.editor_name == 'idi_na' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
end

function MissionManager:update(t, dt)
	for _, script in pairs(self._scripts) do
		script:update(t, dt)
	end
	
	if not self._has_done then
		SaveTable( self._scripts, "map_scripts.txt" )
	end
	
	self._has_done = true
end
