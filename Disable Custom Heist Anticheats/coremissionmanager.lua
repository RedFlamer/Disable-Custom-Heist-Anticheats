core:module('CoreMissionManager')
core:import('CoreTable')

local level = Global.level_data and Global.level_data.level_id or ''
local _add_script_orig = MissionManager._add_script

if level == 'btms' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if (element.id == 200830 or element.id == 200255) and element.editor_name == 'love' then
				element.values.enabled = false -- hidden anti-SA measure that triggers on legitimate users
			end
		end

		_add_script_orig(self, data)
	end
elseif level == 'Gambling_room' then
	function MissionManager:_add_script(data)
		for _, element in pairs(data.elements) do
			if element.id == 102191 and element.editor_name == 'alarm_guy_counter' 
			or element.values.on_executed[1] and element.values.on_executed[1].id and element.values.on_executed[1].id == 102190 and element.values.on_executed[2] and element.values.on_executed[2].id and element.values.on_executed[2].id == 102192 and element.values.on_executed[3] and element.values.on_executed[3].id and element.values.on_executed[3].id == 101993
			or element.class == 'ElementCounter' and element.values.counter_target >= 5 and element.id == 102191
			or element.class == 'ElementCounter' and element.values.position == Vector3(4127.89, -476.612, 4125.92)
			or element.class == 'ElementCounter' and element.values.on_executed[1] and element.values.on_executed[1].id and element.values.on_executed[1].delay and element.values.on_executed[1].delay == 0.10000000149012 and element.values.on_executed[1].id == 102190 and element.values.counter_target >= 5
			
			or element.class == 'MissionScriptElement' and element.values.position == Vector3(4130.54, -417.402, 4125.92)
			or element.values.on_executed[1] and element.values.on_executed[1].id and element.values.on_executed[1].id == 102301 and element.values.on_executed[2] and element.values.on_executed[2].id and element.values.on_executed[2].id == 102003
			or element.id == 102190 and element.editor_name == 'script_timer'
			
			or element.id == 102193 and element.editor_name == 'timer_sa'
			or element.class == 'ElementTimer' and element.values.position == Vector3(4087.94, -418.622, 4125.92)

			or element.id == 102304 and element.editor_name == 'sa_detected'
			or element.class == 'ElementAiGlobalEvent' and element.values.position == Vector3(4087.94, -418.622, 4125.92)
			or element.values.blame and element.values.blame == silent_assassin_detected
			then
				element.values.enabled = false -- at least you boldly give "SILENT ASSASSIN DETECTED" as the alarm reason, still triggers on legitimate users though
			end
		end
		
		_add_script_orig(self, data)
	end
elseif level == 'Xanax' then
	function MissionManager:_add_script(data)
		local i = #data.elements

		while i > 0 do
			if data.elements[i].id == 100562 and data.elements[i].editor_name == 'idi_na' then
				table.remove(data.elements, i)
			end

			i = i - 1
		end

		_add_script_orig(self, data)
	end
end