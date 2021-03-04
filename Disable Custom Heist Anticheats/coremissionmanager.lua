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
				element.values.enabled = false -- at least you boldly give "SILENT ASSASSIN DETECTED" as the alarm reason, still triggers on legitimate users though so fuck off
			end
		end

		local first_links = {}			
		local second_links = {}
		local third_links = {}
		local fourth_links = {}

		for _, element in pairs(data.elements) do			
			if element.class == 'ElementTimerOperator' and element.values.elements then
				table.insert(first_links, element.values.elements[1])
			elseif element.class == 'ElementTimerTrigger' and element.values.elements then
				table.insert(second_links, element.values.elements[1])
			end
			if element.class == 'ElementTimerTrigger' and element.values.on_executed or element.class == 'ElementTimer' and element.values.on_executed then
				if element.values.on_executed[1] and element.values.on_executed[1].id then
					table.insert(third_links, element.values.on_executed[1].id)
				elseif element.values.on_executed[2] and element.values.on_executed[2].id then
					table.insert(third_links, element.values.on_executed[2].id)
				elseif element.values.on_executed[3] and element.values.on_executed[3].id then
					table.insert(third_links, element.values.on_executed[3].id) -- fucking hell this is so shit
				elseif element.values.on_executed[4] and element.values.on_executed[4].id then
					table.insert(third_links, element.values.on_executed[4].id)
				end
			end
		end
		
		for _, element in pairs(data.elements) do
			--[[if table.contains(first_links, element.id) and table.contains(second_links, element.id) then
				if element.class == 'ElementTimer' and element.values.timer >= 30 then
					element.values.enabled = false 
				end
			end--]] -- false positives
			
			if table.contains(third_links, element.id) then
				if element.class == 'MissionScriptElement' and element.values.on_executed then
					if element.values.on_executed[1] and element.values.on_executed[1].id then
						table.insert(fourth_links, element.values.on_executed[1].id)
					elseif element.values.on_executed[2] and element.values.on_executed[2].id then
						table.insert(fourth_links, element.values.on_executed[2].id)
					elseif element.values.on_executed[3] and element.values.on_executed[3].id then
						table.insert(fourth_links, element.values.on_executed[3].id) -- fucking hell this is so shit
					elseif element.values.on_executed[4] and element.values.on_executed[4].id then
						table.insert(fourth_links, element.values.on_executed[4].id)
					end	
				elseif element.class == 'ElementAiGlobalEvent' and element.values.blame == silent_assassin_detected then
					element.values.enabled = false
				end
			end
		end
		
		for _, element in pairs(data.elements) do
			if table.contains(fourth_links, element.id) or table.contains(third_links, element.id) then
				if element.class == 'ElementAiGlobalEvent' and element.values.blame == silent_assassin_detected then
					element.values.enabled = false
				end
			end
		end
		
		-- good luck understanding how this even works Croqui, i can't even understand myself
			
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