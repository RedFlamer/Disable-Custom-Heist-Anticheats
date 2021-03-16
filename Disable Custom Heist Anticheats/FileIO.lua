local Exists_orig = FileIO.Exists
function FileIO:Exists(path)
	if path ~= "./mods/Disable Custom Heist Anticheats" then
		return Exists_orig(self, path)
	end
end