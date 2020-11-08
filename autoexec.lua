--Big Thanks to sai for his original Script Supervisor for making this possible

--Moists Script Loader
function startup()

ui.notify_above_map("~l~~h~Big Thanks to Sai\nThis Code is based on his\nScript Supervisor", "~w~Special Thanks:", 213)
end
startup()

local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
utils.make_dir(rootPath .. "\\lualogs")
utils.make_dir(rootPath .. "\\scripts\\MoistsLUA_cfg")
local debugfile = rootPath .. "\\lualogs\\Moists_debug.log"

local settings = require("settings").setup("MoistsScript")
settings.setvalue("luas", "")
Moist = menu.add_feature("Moists Scripts", "parent", 0)
Moist.hidden = true
local lua_dir = rootPath .. "\\scripts"
lua_feat = menu.add_feature("Moists Script Loader", "parent", 0)
lua_feat.hidden = true
local active_lua = ""
local lua_feats = {}
local luas = {}
local lua_names = {}
local scriptName = debug.getinfo(1, "S").source:sub(lua_dir:len() + 2)
local debug_lua_trace = debug.traceback


loader_hokey = menu.add_feature("Script Loader Hotkey", "toggle", lua_feat.id, function(feat)
    if feat.on then
        
        local key = MenuKey()
        key:push_str("LCONTROL")
        key:push_str("LSHIFT")
        key:push_str("h")
        if key:is_down() then
            lua_feat.hidden = not lua_feat.hidden
            ui.notify_above_map(string.format("~h~~l~Switching Script Loaders Visibility"), "~b~Moists Script Loader", 215)
            system.wait(1200)
        end
    end
    return HANDLER_CONTINUE
end)
loader_hokey.on = true 



local save_lua_on =
    menu.add_feature(
    "Save Loaded Scripts",
    "action",
    lua_feat.id,
    function()
        settings.luas = table.concat(lua_names, ":")
        settings.save()
    end
)

local function unload_luas(filename)
    if luas[filename] then
        for i = 1, #luas[filename].script_event_hooks do
            hook.remove_script_event_hook(luas[filename].script_event_hooks[i])
        end
        for id, data in pairs(luas[filename].events) do
            event.remove_event_listener(data.name, id)
            if data.callback then
                data.callback()
            end
        end
        for i = 1, #luas[filename].feats do
            if luas[filename].feats[i].feat_type == "parent" or luas[filename].feats[i].feat_type == "toggle" then
                luas[filename].feats[i].feat.on = false
            end
            luas[filename].feats[i].feat.hidden = true
        end
        ui.notify_above_map("~h~~l~Successfully unloaded " .. filename, "~r~Moists Lua Script Loader", 184)
    end
    local n = #lua_names
    for i = 1, n do
        if lua_names[i] == filename then
            lua_names[i] = nil
        end
    end
    local j = 0
    for i = 1, n do
        if lua_names[i] then
            j = j + 1
            lua_names[j] = lua_names[i]
        end
    end
    for i = j + 1, n do
        lua_names[i] = nil
    end
end

local function load_luas()
    local files = utils.get_all_files_in_directory(lua_dir, "lua")
    for i = 1, #files do
        if files[i] ~= "autoexec.lua" then
            
        if lua_feats[files[i]] then
            lua_feats[files[i]].hidden = false
            
        else
            --lua_feats[files[i]].threaded = false
            active_lua = ""
            lua_feats[files[i]] =
                menu.add_feature(
                files[i],
                "toggle",
                lua_feat.id,
                function(f)
                    if f.on then
                        active_lua = files[i]
                        luas[files[i]] = {["feats"] = {}, ["events"] = {}, ["script_event_hooks"] = {}}
                        local chunk, err = loadfile(lua_dir .. "\\" .. files[i])
                        local status
                        if chunk then
                            status, err = xpcall(chunk, debug_lua_trace)
                            if status then
                                ui.notify_above_map("~h~~l~Success LUA Loaded " .. files[i], "~r~Moists Lua Script Loader", 210)
                                -- chunk()
                                table.insert(lua_names, files[i])
                                return HANDLER_POP
                            end
                        end
                        ui.notify_above_map(err, "Moists Lua Script Loader", 215)
                        local t = os.date("*t")
                        io.output(io.open(debugfile, "a"))
                        io.write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] ", t.year, t.month, t.day, t.hour, t.min, t.sec) ..err .. "\n")
                        io.close()
                    else
                        unload_luas(files[i])
                    end
                    luas[files[i]] = nil
                end)
        end
    end
        end
    for filename, feat in pairs(lua_feats) do
        local found = false
        for i = 1, #files do
            if i ~= "autoexec.lua" then
                if files[i] == filename then
                    found = true
                    break
                end
            end
        end
        if not found then
            unload_luas(filename)
            feat.hidden = true
        end
    end
end

local menu_add_feature = menu.add_feature
menu.add_feature = function(name, feat_type, parent_id, callback)
    local feat
    local lua_callback = callback
    if active_lua ~= "" then
        if callback then
            local register_lua = active_lua
            lua_callback = function()
                if luas[register_lua] then
                    active_lua = register_lua
                    if callback(feat) == HANDLER_CONTINUE then
                        return HANDLER_CONTINUE
                    end
                end
            end
        end
    end
    feat = menu_add_feature(name, feat_type, parent_id, lua_callback)
    if active_lua ~= "" then
        table.insert(luas[active_lua].feats, {["feat_type"] = feat_type, ["feat"] = feat})
    end
    return feat
end

local hook_register_script_event_hook = hook.register_script_event_hook
hook.register_script_event_hook = function(callback)
    local register_lua = active_lua
    local id =
        hook_register_script_event_hook(
        function(source, target, params, count)
            active_lua = register_lua
            return callback(source, target, params, count)
        end
    )
    table.insert(luas[active_lua].script_event_hooks, id)
    return id
end

local event_add_event_listener = event.add_event_listener
event.add_event_listener = function(name, callback)
    name = name:lower()
    local register_lua = active_lua
    local id =
        event_add_event_listener(
        name,
        function(e)
            active_lua = register_lua
            callback(e)
        end
    )
    luas[active_lua].events[id] = {["name"] = name}
    if name == "exit" then
        luas[active_lua].events[id].callback = callback
    end
    return id
end
menu.add_feature("Scan for Scripts", "action", lua_feat.id, load_luas)
load_luas()

for filename in string.gmatch(settings.luas, "([^:]+)") do
    if lua_feats[filename] then
        lua_feats[filename].on = true
    end
end
