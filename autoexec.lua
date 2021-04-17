local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local Scripts = rootPath .. "\\scripts\\"
utils.make_dir(rootPath .. "\\lualogs")
local debugfile = rootPath .. "\\lualogs\\Moists_debug.log"

	
function autoload_lua(file)
		
		local luaload = rootPath .. "\\PopstarDevs\\2Take1Menu\\scripts\\"
		local load_autoload_lua = debug.getinfo(1, "S").source:sub(luaload:len() + 2)
		
		local lua = {}
		lua[#lua+1] = file
		
		local files = {}
		for i=1,#lua do
            files[#files + 1] = lua[i]
		

            local chunk, status = loadfile(Scripts .. "\\" .. lua[i])
            if chunk then
                chunk()
                ui.notify_above_map(files[i] .. " \nExecuted!", "2Take1 MoistScript", 212)
            else
                ui.notify_above_map("Error with " .. files[i] .. "\n" .. status, "AutoExec", 140)
				local t = os.date("*t")
				io.output(io.open(debugfile, "a"))
				io.write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] ", t.year, t.month, t.day, t.hour, t.min, t.sec .."\n") ..status .. "\n")
				io.close()
            end
        end
        autoexec.hidden = true
        autoexec1.hidden = true
		autoexec2.hidden = true
		
end
    

autoexec2 = menu.add_feature("Load Moists Build", "action", 0, function(feat)


autoload_lua("Moists2.01.lua")


end)
autoexec2.hidden = false
        
autoexec = menu.add_feature("Load Moist Script Public", "action", 0, function(feat)
    
autoload_lua("MoistScript.lua")
end)
autoexec.hidden = false   
     
autoexec1 = menu.add_feature("Load Moist Script Test Build", "action", 0, function(feat)


autoload_lua("Moist_Script_testbuild.lua")


end)
autoexec1.hidden = false

autoload_lua("MoistScript.lua")
