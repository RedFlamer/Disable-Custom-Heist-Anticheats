local on_executed_orig = ElementAiGlobalEvent.on_executed
function ElementAiGlobalEvent:on_executed(instigator)
	if level ~= 'Xanax' then
		return on_executed_orig(self, instigator)
	end
end