function MoistLoad()
local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
	local file = rootPath .. "\\scripts\\MoistScript.lua"

	local f = assert(loadfile(file)) return f()
	ui.notify_above_map("MoistScript has been\nExecuted!", "2Take1 MoistScript", 212)

end

MoistLoad()
