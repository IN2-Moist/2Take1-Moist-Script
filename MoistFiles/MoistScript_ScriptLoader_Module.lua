
if MoistScript_LUA_Module then
	menu.notify("Moist_NG Script Loader Already Executed ! ! !", "", 30, 0xff0000ff)
	menu.notify("EXECUTION DENIED ! ! !", "", 30, 0xff0000ff)
	return HANDLER_POP
	--break
end

MoistScript_LUA_Module = "loaded"

local Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local LUAScripts, LoaderFeats = {}, {}
local MSNG_ScriptFeatParent, MSNG_ScriptFolders, MSNG_ScriptFeat, MSNG_loadedScripts = {},{},{},{}
local Features = _G.Features

local scriptload = Root .. "\\scripts\\MoistFiles\\scriptloader.ini"

MSNG_ScriptFeatParent[1] = _G.Features["ScriptLoader"]

function DumpShit(table2dump)
    for k, v in pairs(table2dump) do
        Print_Dump(tostring(k) .. " : " .. tostring(v))
        if type(v) == "table" then
            for key, value in pairs(v) do
                Print_Dump(tostring(key) .. " : " .. tostring(value))
                if type(value) == "function" then
                    Print_Dump(pcall(string.dump, value))
					elseif type(value) == "table" then
                    for k2, v2 in pairs(value) do
                        Print_Dump(tostring(k2) .. " : " .. tostring(v2))
                        if type(v2) == "function" then
                            Print_Dump(pcall(string.dump, v2))
						end
					end
				end
			end
			elseif type(v) == "function" then
            Print_Dump(pcall(string.dump, v))
		end
	end
end


function Print_Dump(text)
	local file = io.open(Root .."\\lualogs" .. "\\DebugPrint.txt", "a+")
	print(text)
	text = tostring(text) .. "\n"
	file:write(tostring(text))
	file:close()
end




if not utils.file_exists(scriptload) then
	io.open(scriptload, "w+")
	io.output(scriptload)
	io.write("")
	io.close()
end


function clone(t)
	local u = setmetatable({}, getmetatable(t))
	for i, v in pairs(t) do
		u[i] = v
	end
	return u
end

function merge(t, u)
	local r = clone(t)
	for i, v in pairs(u) do
		r[i] = v
	end
	return r
end


function LoadLUAFile(scriptname)
	local ScriptFile
	local sep = scriptname:find(".lua", 1, true)
	if sep then
		local ScriptFile = scriptname:sub(1, sep - 1)
		elseif not sep then
		ScriptFile = tostring(scriptname)
	end
	if ScriptFile ~= nil then
		require(scriptname)
	end
end


function ScriptDataSetup()
	
	local folders = utils.get_all_sub_directories_in_directory(Root .. "\\scripts\\")
	MSNG_ScriptFolders = folders
	local files1 = utils.get_all_files_in_directory(Root .. "\\scripts\\", "lua")
	local files2 = utils.get_all_files_in_directory(Root .. "\\scripts\\", "luac")
	local files = merge(files1, files2)	
	LUAScripts["scripts"] = files
	for i = 1, #MSNG_ScriptFolders do
		local files1 = utils.get_all_files_in_directory(Root .. "\\scripts\\" .. MSNG_ScriptFolders[i] .. "\\", "lua")
		local files2 = utils.get_all_files_in_directory(Root .. "\\scripts\\" .. MSNG_ScriptFolders[i] .. "\\", "luac")
		local files = merge(files1, files2)
		LUAScripts[MSNG_ScriptFolders[i]] = files
		if not (package.path):find(Root .. "\\scripts\\" .. tostring(MSNG_ScriptFolders[i]) .. "\\?.lua", 1, true) then
			package.path =  Root .. "\\scripts\\" .. tostring(MSNG_ScriptFolders[i]) .. "\\?.lua;" .. Root .. "\\scripts\\" .. tostring(MSNG_ScriptFolders[i]) .. "\\?.luac;" .. package.path
		end
	end
end

function MSNG_ScriptFeatBuilder()
	local t = 1
	for k, v in pairs(LUAScripts) do
		if k ~= "scripts" then
			t = t + 1
			
			MSNG_ScriptFeatParent[t] = menu.add_feature(k, "parent", MSNG_ScriptFeatParent[1]["id"])
		end
	end
	for k, v in pairs(LUAScripts) do
		if k ~= "scripts" then
			for e = 1, #MSNG_ScriptFeatParent do
				if MSNG_ScriptFeatParent[e]["name"] == k then
					local files = v
					for i = 1, #files do
						
						local feat_name, featname, funcname
						feat_name = tostring(files[i])
						featname = {feat_name:sub(1, 6), feat_name}
						local y = #MSNG_ScriptFeat + 1 
						MSNG_ScriptFeat[y] = menu.add_feature(files[i], "action", MSNG_ScriptFeatParent[e]["id"], function(feat)
							if type(feat) == "number" then
								return HANDLER_POP
							end
							local lua = files[i]
							local sep = lua:find(".lua", 1, true)
							if sep then
								local file = lua:sub(1, sep - 1)
								LoadLUAFile(file)
								MSNG_loadedScripts[#MSNG_loadedScripts + 1] = lua
								feat["hidden"] = true
							end
							
						end)
						MSNG_ScriptFeat[y]["hidden"] = false
						
					end
				end
			end
			elseif k == "scripts" then
			local files = v
			for i = 1, #files do
				
				local feat_name, featname, funcname
				feat_name = tostring(files[i])
				featname = {feat_name:sub(1, 6), feat_name}
				local y = #MSNG_ScriptFeat + 1 
				MSNG_ScriptFeat[y] = menu.add_feature(files[i], "action", MSNG_ScriptFeatParent[1]["id"], function(feat)
					if type(feat) == "number" then
						return HANDLER_POP
					end
					local lua = files[i]
					local sep = lua:find(".lua", 1, true)
					if sep then
						local file = lua:sub(1, sep - 1)
						LoadLUAFile(file)
						MSNG_loadedScripts[#MSNG_loadedScripts + 1] = lua
						feat["hidden"] = true
					end
				end)
				MSNG_ScriptFeat[y]["hidden"] = false
				
			end
		end
	end
	
end

LoaderFeats["saveloaded"] = menu.add_feature("Save Loaded Scripts", "action_value_str", MSNG_ScriptFeatParent[1]["id"], function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["value"] == 0 then
		io.open(scriptload, "w+")
		io.output(scriptload)
		for i = 1, #MSNG_loadedScripts do
			io.write(MSNG_loadedScripts[i] .. "\n")
		end
		io.close()
		elseif feat["value"] == 1 then
		io.open(scriptload, "w+")
		io.output(scriptload)
		io.write("")
		io.close()
	end
end)
LoaderFeats["saveloaded"]:set_str_data({"Save Loaded", "Clear Saved"})
LoaderFeats["saveloaded"]["value"] = 0


LoaderFeats["refreshfolders"] = menu.add_feature("Refresh", "action", MSNG_ScriptFeatParent[1]["id"], function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 2, #MSNG_ScriptFeatParent, 1  do
		if MSNG_ScriptFeatParent[i].child_count ~= 0 then
			for y = MSNG_ScriptFeatParent[i].child_count, 1, -1 do
				local f = MSNG_ScriptFeatParent[i].children[y]
				if f.type == 1 << 11 then
					for t = f.child_count, 1, -1 do
						local e = f.children[t]
						menu.delete_feature(e["id"])
						
					end
				end
			end
			elseif MSNG_ScriptFeatParent[i].child_count == 0 then
			local f = MSNG_ScriptFeatParent[i]
			menu.delete_feature(f["id"])
		end
		
	end
	
	MSNG_ScriptFeat = {}
	
	for i = 2, #MSNG_ScriptFeatParent, 1 do
		MSNG_ScriptFeatParent[i] = nil
		
	end
	LUAScripts = {}
	ScriptDataSetup()
	system.wait(10)
	MSNG_ScriptFeatBuilder()
	
	for i = 1, #MSNG_loadedScripts do
		for y = 1, #MSNG_ScriptFeat do
			if MSNG_ScriptFeat[y]["name"] == MSNG_loadedScripts[i] then
				MSNG_ScriptFeat[y]["hidden"] = true
				else
				MSNG_ScriptFeat[y]["hidden"] = false
			end
		end
	end
	
	
	
end)

ScriptDataSetup()
MSNG_ScriptFeatBuilder()


for line in io.lines(scriptload) do
	
	local file = Root .. "\\scripts\\" .. line
	if utils.file_exists(file) then
		local sep = line:find(".lua", 1, true)
		if sep then
			local LuaFile = line:sub(1, sep - 1)
			LoadLUAFile(LuaFile)
			
			MSNG_loadedScripts[#MSNG_loadedScripts + 1] = line
		end
		elseif not utils.file_exists(file) then
		for i = 1, #MSNG_ScriptFolders do
			local file = Root .. "\\scripts\\" .. MSNG_ScriptFolders[i] .."\\" .. line
			if utils.file_exists(file) then
				local sep = line:find(".lua", 1, true)
				if sep then
					local LuaFile = line:sub(1, sep - 1)
					LoadLUAFile(LuaFile)
					MSNG_loadedScripts[#MSNG_loadedScripts + 1] = line
				end
				
			end
		end
	end
	
	
end
_G.Features["ScriptLoader"]["hidden"] = false

-- function ExitCleanup()

-- local MSNG_ScriptFeats, MSNG_ScriptFeatParents = {}, {}

-- function FetchAllFeats(main)
-- for i=1,main.child_count do
-- if main.children[i].type == 2048 then
-- MSNG_ScriptFeatParents[#MSNG_ScriptFeatParents+1] = main.children[i]
-- end
-- MSNG_ScriptFeats[#MSNG_ScriptFeats+1] = main.children[i]
-- end
-- end

-- function RemoveFeats(Feat)
-- if Feat.type == 2048 then
-- for i=1,Feat.child_count do
-- RemoveFeats(Feat.children[1])
-- end
-- end
-- menu.delete_feature(Feat["id"])
-- end

-- FetchAllFeats(menu.get_feature_by_hierarchy_key("local.script_features"))

-- for i = 1, #MSNG_ScriptFeatParents do
-- RemoveFeats(MSNG_ScriptFeatParents[i])
-- end

-- for i = 1, #MSNG_ScriptFeats do
-- RemoveFeats(MSNG_ScriptFeats[i])
-- end
-- end

--event.add_event_listener("exit", ExitCleanup)
