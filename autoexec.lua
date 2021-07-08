local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local Scripts = rootPath .. "\\scripts"
utils.make_dir(rootPath .. "\\lualogs")
local debugfile = rootPath .. "\\lualogs\\Moists_debug.log"

local function autoload_lua(file)

    local luaload = rootPath .. "\\PopstarDevs\\2Take1Menu\\scripts"
    local load_autoload_lua = debug.getinfo(1, "S").source:sub(luaload:len() + 2)

    local lua = {}
    lua[#lua + 1] = file

    local files = {}
    for i = 1, #lua do
        files[#files + 1] = lua[i]

        local chunk, status = loadfile(Scripts .. "\\" .. lua[i])
        if chunk then
            chunk()
            menu.notify(files[i] .. " \nExecuted!", "MoistScript Autoexec", 18, 0xffff00ff)
        else
            menu.notify("Error with " .. files[i] .. "\n" .. status, "MoistScript Autoexec", 18, 0xffff00ff)
            local t = os.date("*t")
            io.output(io.open(debugfile, "a"))
            io.write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] ", t.year, t.month, t.day, t.hour, t.min,
                t.sec .. "\n") .. status .. "\n")
            io.close()
        end
    end
    autoexec.hidden = true
    autoexec1.hidden = true
    autoexec2.hidden = true
    autoexec3.hidden = true

end

local autoexec2 = menu.add_feature("Load Moists Build", "action", 0, function(feat)

    autoload_lua("Moists2.01.lua")

end)
autoexec2.hidden = false

local autoexec = menu.add_feature("Load Moist Script Public", "action", 0, function(feat)

    autoload_lua("MoistScript.lua")
end)
autoexec.hidden = false

local autoexec1 = menu.add_feature("Load Moist Script Test Build", "action", 0, function(feat)

    autoload_lua("Moist_Script_testbuild.lua")

end)
autoexec1.hidden = false

local autoexec3 = menu.add_feature("Load Moist plyfeat Test Build", "action", 0, function(feat)

    autoload_lua("Moists2.01(plyfeattest).lua")

end)
autoexec3.hidden = false

autoload_lua("MoistScript.lua")

