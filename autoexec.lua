function MoistLoad()
local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
	local file = rootPath .. "\\scripts\\MoistScript.lua"

	local f = assert(loadfile(file)) return f()

end

MoistLoad()
