
local function start()
local scriptthread = {}
local threadID = 0

--autoecxec_thread = function(feat)
local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local Scripts = rootPath .. "\\scripts"
utils.make_dir(rootPath .. "\\lualogs")
local debugfile = rootPath .. "\\lualogs\\Moists_debug.log"
	
function autoload_lua(file)
		
		local luaload = rootPath .. "\\PopstarDevs\\2Take1Menu\\scripts"
		local load_autoload_lua = debug.getinfo(2, "S").source:sub(luaload:len() + 2)
		
		local lua = {}
		lua[#lua+1] = file
		
		local files = {}
		for i=1,#lua do
            files[#files + 1] = lua[i]
		

            local chunk, status = loadfile(Scripts .. "\\" .. lua[i])
            if chunk then
                chunk()
             --   menu.notify(files[i] .. " \nExecuted!", "MoistScript Autoexec", 18, 0xffff00ff)
            else
			local errtext = debug.traceback(chunk, 1)
			
              --  menu.notify("Error with " .. files[i] .. "\n" .. status .."\n" .. errtext, "MoistScript Autoexec", 18, 0xffff00ff)
				local t = os.date("*t")
				io.output(io.open(debugfile, "a"))
				io.write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] ", t.year, t.month, t.day, t.hour, t.min, t.sec .."\n") ..status .. "\n" ..errtext)
				io.close()
            end
        end
		
end
end


autoexecstart = menu.add_feature("Execute Autoexec.lua", "toggle", 0, function(feat)
	if not feat.on then
		return HANDLER_POP
	end
	
	
local status, err = pcall(start)
if not status then
print(tostring(status) .. " Function Error " .. tostring(err))
--menu.notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Execution fucntion Error", 5, 0xffffff00)

end

local files = {"MoistScript2064.lua"}
for i = 1, #files do
local status, err = pcall(autoload_lua, files[i])
if not status then
print(tostring(status) .. " Function Error " .. tostring(err))
--menu.notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Execution fucntion Error", 5, 0xffffff00)

end
end
	autoexecstart.hidden = true
end)
autoexecstart.on = true
autoexecstart.hidden = true
