
if MoistScript_PlayerHistory_Module == 'loaded' then
	return HANDLER_POP
end

MoistScript_PlayerHistory_Module = "loaded"

local PlayerHistoryMod = function()
local ScriptConfig = _G.ScriptConfig
local FolderPaths = _G.FolderPaths
local LocalFeatures = _G.LocalFeatures
local json = require("json")

function exportstring(s)
	return string.format("%q", s)
end


function table_save(tbl, filename)
	local charS,charE = "   ","\n"
	local file,err = io.open(filename, "wb")
	if err then return err end
	
	-- initiate variables for save procedure
	local tables,lookup = { tbl },{ [tbl] = 1 }
	file:write("return {"..charE)
	
	for idx,t in ipairs(tables) do
		file:write("-- Table: {"..idx.."}"..charE)
		file:write("{"..charE)
		local thandled = {}
		
		for i,v in ipairs(t) do
			thandled[i] = true
			local stype = type(v)
			-- only handle value
			if stype == "table" then
				if not lookup[v] then
					table.insert(tables, v)
					lookup[v] = #tables
				end
				file:write(charS.."{"..lookup[v].."},"..charE)
				elseif stype == "string" then
				file:write( charS..exportstring(v)..","..charE)
				elseif stype == "number" then
				file:write( charS..tostring(v)..","..charE)
			end
		end
		
		for i,v in pairs(t) do
			-- escape handled values
			if (not thandled[i]) then
				
				local str = ""
				local stype = type(i)
				-- handle index
				if stype == "table" then
					if not lookup[i] then
						table.insert(tables,i)
						lookup[i] = #tables
					end
					str = charS.."[{"..lookup[i].."}]="
					elseif stype == "string" then
					str = charS.."["..exportstring(i).."]="
					elseif stype == "number" then
					str = charS.."["..tostring(i).."]="
				end
				
				if str ~= "" then
					stype = type(v)
					-- handle value
					if stype == "table" then
						if not lookup[v] then
							table.insert(tables,v)
							lookup[v] = #tables
						end
						file:write(str.."{"..lookup[v].."},"..charE)
						elseif stype == "string" then
						file:write(str..exportstring(v)..","..charE)
						elseif stype == "number" then
						file:write(str..tostring(v)..","..charE)
					end
				end
			end
		end
		file:write("},"..charE)
	end
	file:write("}")
	file:close()
end

--// The Load Function
function table_load(sfile)
	local ftables,err = loadfile(sfile)
	if err then return _,err end
	local tables = ftables()
	for idx = 1,#tables do
		local tolinki = {}
		for i,v in pairs(tables[idx]) do
			if type(v) == "table" then
				tables[idx][i] = tables[v[1]]
			end
			if type(i) == "table" and tables[i[1]] then
				table.insert(tolinki,{ i,tables[i[1]] })
			end
		end
		-- link indices
		for _,v in ipairs(tolinki) do
			tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
		end
	end
	return tables[1]
end

function GetPartial_IP(ip)
    local text, check = tostring(ip), ""
    local sep = text:find(".", 1, true)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part .. "."
        local value = text:sub(sep + 1)
        text = value
	end
    local sep = text:find(".", 1, true)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part .. "."
        local value = text:sub(sep + 1)
        text = value
	end
    local sep = text:find(".", 1, true)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part
        local value = text:sub(sep + 1)
        text = value
	end
    return check
end

--INFO: Player History

local Players_History_Feat, Black_List_PID = {}, {}
local Players_History, Temp_Blacklist, PlayerHistory = {},{},{}

function History_Player(rpid)
	local scid, name, token = (Players_History[rpid].rid), (Players_History[rpid].PlyName), (Players_History[rpid].htoken)
	Players_History_Feat[rpid] = {}
	Players_History_Feat[rpid][1] =  menu.add_feature(tostring(rpid) ..": " .. tostring(Players_History[rpid].PlyName), "parent", _G.LocalFeatures["History"].id)
	Players_History_Feat[rpid][1]["hidden"] = false
	local t = #Players_History_Feat[rpid] + 1
	
	HistoryID = Players_History_Feat[rpid][1]
	local scid, nid = Players_History[rpid].rid, Players_History[rpid].nid
	local DIP = tonumber(Players_History[rpid].DecIP)
	local TranIP = string.format("%i.%i.%i.%i", (DIP >> 24) & 0xff, ((DIP >> 16) & 0xff), ((DIP >> 8) & 0xff), DIP & 0xff)
	local i = #PlayerHistory + 1
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players SCID = " .. tostring(Players_History[rpid].rid), "action", HistoryID.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		local scid = Players_History[rpid].rid
		if utils.from_clipboard() ~= scid then
			utils.to_clipboard(scid)
			system.yield(10000)
		end
		return HANDLER_POP
	end)
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players nethash = " .. tostring(Players_History[rpid].nid), "action", HistoryID.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		local nid = Players_History[rpid].nid
		if utils.from_clipboard() ~= nid then
			utils.to_clipboard(nid)
			system.yield(10000)
		end
		return HANDLER_POP
	end)
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players IP Info", "action", HistoryID.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		local ip = TranIP
		local success, result = web.get("http://ip-api.com/json/" .. ip .. "?fields=continent,country,countryCode,regionName,city,isp,org,mobile,proxy,hosting,query&lang=en")
		system.yield(10)
		local IpInfo = json.decode(result)
		for k, v in pairs(IpInfo) do
			feat.name = tostring(k) .. " = " .. tostring(v)
			system.yield(1000)
		end
		system.yield(1000)
		feat.name = "Players IP Info"
		
		return HANDLER_POP
	end)
	
	Black_List_PID[#Black_List_PID + 1] = menu.add_feature("Blacklist Player", "action_value_str", HistoryID.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		-- local plyr = rpid
		-- local scid, name, token = (Players_History[plyr].rid), (Players_History[plyr].PlyName), (Players_History[plyr].htoken)
		-- if feat["value"]== 0 then
			-- AddScid(scid, name)
			-- LoadBlacklist()
			-- AddTokenID(token, name)
			-- Load_Blacklist()
			-- elseif feat["value"]== 1 then
			-- RemoveScid(scid)
			-- LoadBlacklist()
			-- RemoveTokenID(token)
			-- Load_Blacklist()
		-- end
		
		return HANDLER_POP
	end)
Black_List_PID[#Black_List_PID]:set_str_data({"Add","Remove"})
Black_List_PID[#Black_List_PID].hidden = true	

	PlayerHistory[rpid].Features = menu.add_feature("Temp BlacklistPlayer", "parent", HistoryID.id)
	PlayerHistory[rpid].Blacklist1 = menu.add_feature("Blacklist IP", "toggle", PlayerHistory[rpid].Features.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		if not PlayerHistory[rpid].Blacklist1.on then
			Temp_Blacklist[rpid].decipON = false
			return HANDLER_POP
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist1.on then
			Temp_Blacklist[rpid].decipON = true
			return HANDLER_CONTINUE
		end
	end)
	PlayerHistory[rpid].Blacklist1["on"] = false
	PlayerHistory[rpid].Blacklist12 = menu.add_feature("Partial Blacklist IP", "toggle", PlayerHistory[rpid].Features.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		local ip = TranIP
		if not PlayerHistory[rpid].Blacklist12.on then
			Temp_Blacklist[rpid].decip2ON = false
			return HANDLER_POP
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist12.on then
			Temp_Blacklist[rpid].decip2ON = true
			return HANDLER_CONTINUE
		end
	end)
	PlayerHistory[rpid].Blacklist12["on"] = false
	PlayerHistory[rpid].Blacklist2 = menu.add_feature("Blacklist SCID", "toggle", PlayerHistory[rpid].Features.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		if not PlayerHistory[rpid].Blacklist2.on then
			Temp_Blacklist[rpid].scidON = false
			return HANDLER_POP
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist2.on then
			Temp_Blacklist[rpid].scidON = true
			return HANDLER_CONTINUE
		end
	end)
	PlayerHistory[rpid].Blacklist2["on"] = false
	PlayerHistory[rpid].Blacklist3 = menu.add_feature("Blacklist Name", "toggle", PlayerHistory[rpid].Features.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		if not PlayerHistory[rpid].Blacklist3.on then
			Temp_Blacklist[rpid].PlyNameON = false
			return HANDLER_POP
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist3.on then
			Temp_Blacklist[rpid].PlyNameON = true
			return HANDLER_CONTINUE
		end
	end)
	PlayerHistory[rpid].Blacklist3["on"] = false
	
	
end


function PlayerHistoryDB(pid)
	if not player.is_player_valid(pid) then
		return HANDLER_POP
	end
	local scid, PlayerName, token, tokeen, count, Player_IP, Part_IP
	Player_IP = player.get_player_ip(pid)
	local TranIP = string.format("%i.%i.%i.%i", (Player_IP >> 24) & 0xff, ((Player_IP >> 16) & 0xff), ((Player_IP >> 8) & 0xff), Player_IP & 0xff)
	Part_IP = GetPartial_IP(TranIP)
	scid = player.get_player_scid(pid)
	if scid ~= -1 then
		PlayerName = player.get_player_name(pid) or "NaN"
		count = -1
		token = player.get_player_host_token(pid)
		tokhex = string.format("%x", token)
		tokeen = tostring(tokhex)
		for y = 1, #Players_History do
			if Players_History[y].rid == scid then
				count = Players_History[y].count + 1
				Players_History[y].count = count
				if count > 1 then
					_G.MoistNotify("Histroic Player Join:\n" .. tostring(PlayerName) .. "\nSCID: " .. scid .. "\nSeen: " .. count .. " times", "Player Joined Found in History")
				end
				return
			end
		end
		local i = #Players_History + 1
		if HistoryNotify and i < 700 then
			HistoryNotify = false
		end
		if i > 700 and not HistoryNotify then
			_G.MoistNotify("Player History is 700 or more" , "Consider Clearing Player History", 0xff0000ff, 30)
			_G.MoistNotify("Loading script Again or resetting State will take longer", "", 0xff0000ff, 30)
			_G.MoistNotify("Most Likely Cause your Game to Freeze for a moment", "", 0xff0000ff, 30)
			HistoryNotify = true
		end
		
		Players_History[i] = {
			Feature = nil,
			name = {},
			count = {},
			DateLJ = {},
			rid = {},
			nid = {},
			htoken = {},
			DecIP = {},
			PartIP = {},
		}
		
		PlayerHistory[i] = {
			Features = {},
			Blacklist1 = {},
			Blacklist2 = {},
			Blacklist3 = {},
		}
		Temp_Blacklist[i] = {
			name = {},
			scid = {},
			decip = {},
			decip2 = {},
			nameON = {},
			scidON = {},
			decipON = {},
			decip2ON = {},
		}
		
		Players_History[i].PlyName = player.get_player_name(pid)
		Players_History[i].count = count + 1
		Players_History[i].rid = scid
		Players_History[i].DateLJ = os.date("%d-%m-%y")
		Players_History[i].DecIP = Player_IP
		Players_History[i].PartIP = Part_IP
		Players_History[i].nid = network.network_hash_from_player(pid)
		Players_History[i].htoken = tokeen
		Temp_Blacklist[i].PlyNameON = false
		Temp_Blacklist[i].scidON = false
		Temp_Blacklist[i].decipON = false
		Temp_Blacklist[i].PlyName = PlayerName
		Temp_Blacklist[i].scid = scid
		Temp_Blacklist[i].decip = Player_IP
		Temp_Blacklist[i].decip2 = Part_IP
		History_Player(i)
		count = 0
	end
end

local Current_Search = ""
function Search_History(HistoryName, strtype)
	local HistoryFeatureName
	if strtype == "ip" then
		for i =1, #Players_History do
			local DIP = Players_History[i].DecIP
			local TranIP = string.format("%i.%i.%i.%i", (DIP >> 24) & 0xff, ((DIP >> 16) & 0xff), ((DIP >> 8) & 0xff), DIP & 0xff)
			if TranIP:find(HistoryName, 1, true) then
				Players_History_Feat[i][1]["hidden"] = false
				else
				Players_History_Feat[i][1]["hidden"] = true
				--Players_History[i].Feature["hidden"] = true
			end
		end
		elseif strtype == "name" then
		if HistoryName ~= nil then
			for i=1,#Players_History_Feat do
				if HistoryName:len() == 0 then
					Players_History_Feat[i][1]["hidden"] = false
					Current_Search = ""
				end
				HistoryID = Players_History_Feat[i][1]["name"]	
				HistoryFeatureName = tostring(HistoryID)
				if HistoryFeatureName:find(HistoryName, 1, true) then
					Players_History_Feat[i][1]["hidden"] = false
					else
					Players_History_Feat[i][1]["hidden"] = true
				end
				if HistoryFeatureName:lower():find(HistoryName:lower(), 1, true) then
					Players_History_Feat[i][1]["hidden"] = false
					else
					Players_History_Feat[i][1]["hidden"] = true
				end
				
				
			end
			
		end
		
		
	end
end

local Historyopt = menu.add_feature("History Player Options", "parent", LocalFeatures["History"].id)

LocalFeatures.Search_Type = menu.add_feature("Search Player History", "action_value_str", LocalFeatures["History"].id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local r, HistoryName
	if feat["value"]== 0 then
		r, HistoryName = input.get("Enter a Name To Search for", Current_Search, 64, 0)
		if r == 1 then
			return HANDLER_CONTINUE
			elseif r == 2 then
			Current_Search = ""
			for i=1,#Players_History_Feat do
				Players_History_Feat[i][1]["hidden"] = false
			end
			return HANDLER_POP
		end
		Current_Search = HistoryName
		Search_History(HistoryName, "name")
		elseif feat["value"]== 1 then
		if tonumber(Current_Search:sub(1, 2)) == nil then
			Current_Search = ""
		end
		r, HistoryName = input.get("Enter Partial IP to Find", Current_Search, 64, 4)
		if r == 1 then
			return HANDLER_CONTINUE
			elseif r == 2 then
			Current_Search = ""
			for i=1,#Players_History_Feat do
				Players_History_Feat[i][1]["hidden"] = false
			end
			return HANDLER_POP
		end
		Current_Search = HistoryName
		Search_History(HistoryName, "ip")
		
	end
	
	return HANDLER_POP
end)
LocalFeatures.Search_Type:set_str_data({"By Name","By IP"})

function player_Load(array)
	
	for y = 1, #Players_History do
		if (Players_History[y].rid) == (array.rid) then
			return
		end
	end
	
	
	local i = #Players_History + 1
	Players_History[i] = {
		Feature = nil,
		name = {},
		count = {},
		DateLJ = {},
		rid = {},
		nid = {},
		htoken = {},
		DecIP = {},
		PartIP = {},
		
	}
	PlayerHistory[i] = {
		Features = {},
		Blacklist1 = {},
		Blacklist2 = {},
		Blacklist3 = {},
	}
	Temp_Blacklist[i] = {
		name = {},
		scid = {},
		decip = {},
		decip2 = {},
		nameON = {},
		scidON = {},
		decipON = {},
		decip2ON = {},
	}
	
	Players_History[i].PlyName = array.PlyName
	Players_History[i].count = tonumber(array.count)
	Players_History[i].rid = tonumber(array.rid)
	Players_History[i].DateLJ = array.DateLJ
	Players_History[i].DecIP = tonumber(array.DecIP)
	Players_History[i].PartIP = array.PartIP
	Players_History[i].nid = tonumber(array.nid)
	Players_History[i].htoken = array.htoken
	PlayerHistory[i].Features = {}	
	Temp_Blacklist[i].PlyNameON = false
	Temp_Blacklist[i].sciON = false
	Temp_Blacklist[i].PlyNameON = false
	Temp_Blacklist[i].decipON = false
	Temp_Blacklist[i].PlyName = array.PlyName
	Temp_Blacklist[i].scid = tonumber(array.rid)
	Temp_Blacklist[i].decip = tonumber(array.DECIP)
	Temp_Blacklist[i].decip2 = array.PartIP
	History_Player(i)
	
	
end


function Load_History_File()
	
	if utils.file_exists(FolderPaths.Logs .. "\\Players_History.txt") then
		
		Players_History = table_load(FolderPaths.Logs .. "\\Players_History.txt")
		for y = 1, #Players_History do
			player_Load(Players_History[y])
			
		end
	end
end

function tablesave()
	table_save(Players_History, FolderPaths.Logs .. "\\Players_History.txt")
end

LocalFeatures.SaveHistoryInt = menu.add_feature("AutoSave History mins: ", "value_f", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		ScriptConfig["AutoSaveHistoryFile"] = false
		ScriptConfig["AutoSaveHistoryTime"] = feat["value"]
		return HANDLER_POP
	end
	ScriptConfig["AutoSaveHistoryFile"] = true
	ScriptConfig["AutoSaveHistoryTime"] = feat["value"]
	local delay =  tonumber((feat["value"]) * (60000))
	
	system.yield(delay)
	tablesave()
	system.yield(1000)
	return HANDLER_CONTINUE
end)
LocalFeatures.SaveHistoryInt["on"] = ScriptConfig["AutoSaveHistoryFile"]
LocalFeatures.SaveHistoryInt["min"] = 00.01
LocalFeatures.SaveHistoryInt["max"] = 30.00
LocalFeatures.SaveHistoryInt["mod"] = 00.01
LocalFeatures.SaveHistoryInt["value"] = ScriptConfig["AutoSaveHistoryTime"]

local HistoryFileLoaded = false
LocalFeatures.Loadrec = menu.add_feature("AutoLoad Saved History Players", "toggle", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		ScriptConfig["LoadPlayerHistorysFile"] = false
		HistoryFileLoaded = false
		return HANDLER_POP
	end
	ScriptConfig["LoadPlayerHistorysFile"] = true
	if not HistoryFileLoaded then
		Load_History_File()
		HistoryFileLoaded = true
	end
	system.yield(100)
	return HANDLER_CONTINUE
end)
LocalFeatures.Loadrec["on"] = ScriptConfig["LoadPlayerHistorysFile"]

LocalFeatures.AutoHistoryLimit = menu.add_feature("(-100)Auto Limit value: ", "value_i", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local limit, Compact_Table = tonumber(feat["value"]), {}
	if not feat["on"] then
		ScriptConfig["AutoLimitHistory"] = false
		ScriptConfig["AutoLimitCount"] = tonumber(feat["value"])
		return HANDLER_POP
	end
	ScriptConfig["AutoLimitHistory"] = true
	ScriptConfig["AutoLimitCount"] = tonumber(feat["value"])
	if #Players_History > tonumber(feat["value"]) then
		for i = 1, #Players_History do
			for y = Players_History[i].Feature.child_count, 1, -1 do
				local f = Players_History[i].Feature.children[y]
				if f.type == 1 << 11 then
					for t = f.child_count, 1, -1 do
						local e = f.children[t]
						menu.delete_feature(e.id)
					end
				end
				menu.delete_feature(f.id)
				
				system.yield(1)
			end
			if Players_History[i].Feature.child_count ~= 0 then
				_G.MoistNotify(Players_History[i].Feature.child_count)
				elseif Players_History[i].Feature.child_count == 0 then
				local f = Players_History[i].Feature
				menu.delete_feature(f.id)
			end
			--system.yield(1)
		end
		
		Compact_Table = PlayerHistoryTableRebuild(tonumber(feat["value"]- 100))
		Players_History = {}
		
		for y = 1, #Compact_Table do
			player_Load(Compact_Table[y])
			
		end
		
		
		system.yield(10000)
	end
	
	system.yield(10000)
	return HANDLER_CONTINUE
end)
LocalFeatures.AutoHistoryLimit["max"] = 1600
LocalFeatures.AutoHistoryLimit["min"] = 100
LocalFeatures.AutoHistoryLimit["mod"] = 25
LocalFeatures.AutoHistoryLimit["value"] = ScriptConfig["AutoLimitCount"]
LocalFeatures.AutoHistoryLimit["on"] = ScriptConfig["AutoLimitHistory"]


LocalFeatures.DelHistory = menu.add_feature("Delete All History Players", "action", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 1, #Players_History_Feat do
	for h = 1, #Players_History_Feat[i] do
		for y = Players_History_Feat[i][h].child_count, 1, -1 do
			local f = Players_History_Feat[i][h].children[y]
			if f.type == 1 << 11 then
				for t = f.child_count, 1, -1 do
					local e = f.children[t]
					menu.delete_feature(e.id)
				end
			end
			menu.delete_feature(f.id)
			
			system.yield(5)
		end
		if Players_History_Feat[i][h].child_count ~= 0 then
			_G.MoistNotify(Players_History_Feat[i][h].child_count)
			elseif Players_History_Feat[i][h].child_count == 0 then
			local f = Players_History_Feat[i][h]
			menu.delete_feature(f.id)
		end
		system.yield(5)
	end
	end
	Players_History_Feat = {}
	Players_History, Temp_Blacklist, PlayerHistory = {},{},{}
	_G.MoistNotify("features Deleted")
	
end)


function CheckSession()
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			Temp_BlacklistCheck(pid)
		end
	end
end

function ResetLoad()
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			PlayerHistoryDB(pid)
		end
	end
end
ResetLoad()

function Temp_BlacklistCheck(pid)
	if not player.is_player_valid(pid) then
		return HANDLER_POP
	end
	local scid, name, decip
	scid = player.get_player_scid(pid)
	name = tostring(player.get_player_name(pid))
	decip = player.get_player_ip(pid)
	local TranIP = string.format("%i.%i.%i.%i", (decip >> 24) & 0xff, ((decip >> 16) & 0xff), ((decip >> 8) & 0xff), decip & 0xff)
	local PartIP = GetPartial_IP(TransIP)
	for i = 1, #Temp_Blacklist do
		if tostring(Temp_Blacklist[i]["PlyName"]) == name and Temp_Blacklist[i]["PlyNameON"] == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i]["scid"]== scid and Temp_Blacklist[i]["scidON"] == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i]["decip"]== decip and Temp_Blacklist[i]["decipON"] == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i]["decip2"]== PartIP and Temp_Blacklist[i]["decip2ON"] == true then
			Temp_Blacklist_Kick(pid)
		end
	end
end

function Temp_Blacklist_Kick(pid)
	if pid == player.player_id() then
		return
	end
	
	if network.network_is_host() then
		
		if player.is_player_valid(pid) then
		script.trigger_script_event_2(1 << pid, 1674887089, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))

			network.network_session_kick_player(pid)
		end
		elseif not network.network_is_host() then
			script.trigger_script_event_2(1 << pid, 1674887089, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
			system.yield(1000)
			if player.is_player_valid(pid) then
			network.force_remove_player(pid)
			end
		end
	end


local Network_Join_Event = event.add_event_listener("player_join", function(e)
	if e["player"] ~= nil then
		
		local status, err = pcall(PlayerHistoryDB, e["player"])
		if not status then
		_G.MoistNotify(tostring(err), "Player History Module Error")
		end
		
		
		local status, err = pcall(Temp_BlacklistCheck, e["player"])
		if not status then
		_G.MoistNotify(tostring(err), "Player History Module Error")
		end
		
	end
	return
end)

_G.MoistNotify("Player History Module Loaded", "")


event.add_event_listener("exit", function()
	table_save(Players_History, FolderPaths.Logs .. "\\Players_History.txt")
	Players_History_Feat, Black_List_PID = {}, {}
	Players_History, Temp_Blacklist, PlayerHistory = {},{},{}
	event.remove_event_listener("player_join", Network_Join_Event)
	--FeatureCleanup()
end)
end
PlayerHistoryMod()