core:module('CoreMissionManager')
core:import('CoreTable')

local level = Global.level_data and Global.level_data.level_id or ''

if level == 'btms' then
	local _add_script_orig = MissionManager._add_script
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if (element.id == 200830 or element.id == 200255) and element.editor_name == 'love' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'Gambling_room' then
	local _add_script_orig = MissionManager._add_script
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 102191 and element.editor_name == 'alarm_guy_counter' then
				element.values.enabled = false -- at least you boldly give "SILENT ASSASSIN DETECTED" as the alarm reason, still triggers on legitimate users though so fuck off
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'hardware_store' then
	local _add_script_orig = MissionManager._add_script
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 102563 and element.editor_name == 'counter_6guards' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'Xanax' then
	local _add_script_orig = MissionManager._add_script
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 100562 and element.editor_name == 'idi_na' then
				element.values.enabled = false -- fuck off hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
end