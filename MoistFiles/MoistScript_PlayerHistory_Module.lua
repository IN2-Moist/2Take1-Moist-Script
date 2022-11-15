
if MoistScript_PlayerHistory_Module == 'loaded' then
	return
end

MoistScript_PlayerHistory_Module = "loaded"
function PlayerHistoryMod()
local ScriptConfig = _G.ScriptConfig
local FolderPaths = _G.FolderPaths
local LocalFeatures = _G.LocalFeatures
local json = require("json")
local File = _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
local Players_History_Feat, Black_List_PID = {}, {}
local Players_History, Temp_Blacklist, PlayerHistory = {},{},{}
local HistoryFileLoaded, threadid, SaveComplete = false, 0, true
local GTA_Natives = require("MoistScript_GTA_Natives")


function PackTable(tablename)
	local Packed =  table.pack(tablename)
	return Packed
end

function PlayerHistoryTableRebuild(limit)
	local tablebuild = {}
	local limitnum = limit
	if #Players_History >= limitnum then
		for i = (#Players_History - limitnum), #Players_History, 1 do
			local y = #tablebuild + 1
			tablebuild[y] = Players_History[i]
		end
	end
	return tablebuild
end

   local function exportstring( s )
      return string.format("%q", s)
   end

   --// The Save Function
local function table_save(tbl, filename)
	filename = filename or _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
      local charS,charE = "   ","\n"
      local file,err = io.open(filename, "wb")
      if err then return err end

      -- initiate variables for save procedure
      local tables,lookup = { tbl },{ [tbl] = 1 }
      file:write( "return {"..charE )

      for idx,t in ipairs( tables ) do
         file:write( "-- Table: {"..idx.."}"..charE )
         file:write( "{"..charE )
         local thandled = {}

         for i,v in ipairs( t ) do
            thandled[i] = true
            local stype = type( v )
            -- only handle value
            if stype == "table" then
               if not lookup[v] then
                  table.insert( tables, v )
                  lookup[v] = #tables
               end
               file:write( charS.."{"..lookup[v].."},"..charE )
            elseif stype == "string" then
               file:write(  charS..exportstring( v )..","..charE )
            elseif stype == "number" then
               file:write(  charS..tostring( v )..","..charE )
            end
         end

         for i,v in pairs( t ) do
            -- escape handled values
            if (not thandled[i]) then
            
               local str = ""
               local stype = type( i )
               -- handle index
               if stype == "table" then
                  if not lookup[i] then
                     table.insert( tables,i )
                     lookup[i] = #tables
                  end
                  str = charS.."[{"..lookup[i].."}]="
               elseif stype == "string" then
                  str = charS.."["..exportstring( i ).."]="
               elseif stype == "number" then
                  str = charS.."["..tostring( i ).."]="
               end
            
               if str ~= "" then
                  stype = type( v )
                  -- handle value
                  if stype == "table" then
                     if not lookup[v] then
                        table.insert( tables,v )
                        lookup[v] = #tables
                     end
                     file:write( str.."{"..lookup[v].."},"..charE )
                  elseif stype == "string" then
                     file:write( str..exportstring( v )..","..charE )
                  elseif stype == "number" then
                     file:write( str..tostring( v )..","..charE )
                  end
               end
            end
         end
         file:write( "},"..charE )
      end
      file:write( "}" )
      file:close()
   end

   --// The Load Function
local function table_load(sfile)
	sfile = sfile or _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
      local ftables,err = loadfile(sfile)
      if err then return _,err end
	  if ftables ~= nil then
      local tables = ftables()
      for idx = 1,#tables do
         local tolinki = {}
         for i,v in pairs( tables[idx] ) do
            if type( v ) == "table" then
               tables[idx][i] = tables[v[1]]
            end
            if type( i ) == "table" and tables[i[1]] then
               table.insert( tolinki,{ i,tables[i[1]] } )
            end
         end
         -- link indices
         for _,v in ipairs( tolinki ) do
            tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
         end
      end
      return tables[1], tables[2]
	  end
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
local session_Check = {}
function History_Player(rpid)
	local scid, name, token = (Players_History[rpid].rid), (Players_History[rpid].PlyName), (Players_History[rpid].htoken)
	Players_History_Feat[rpid] = {}
	Players_History_Feat[rpid][1] =  menu.add_feature(tostring(rpid) ..": " .. tostring(Players_History[rpid].PlyName), "parent", _G.LocalFeatures["History"].id)
	Players_History_Feat[rpid][1].hidden = false
	local t = #Players_History_Feat[rpid] + 1
	
	HistoryID = Players_History_Feat[rpid][1]
	local scid, nid = Players_History[rpid].rid, Players_History[rpid].nid
	local DIP = tonumber(Players_History[rpid].DecIP) or 4294967295
	local TranIP = string.format("%i.%i.%i.%i", (DIP >> 24) & 0xff, ((DIP >> 16) & 0xff), ((DIP >> 8) & 0xff), DIP & 0xff)
	local i = #PlayerHistory + 1
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players SCID = " .. tostring(Players_History[rpid].rid), "action", HistoryID.id, function(feat)
		if type(feat) == "number" then
			return
		end
		local scid = Players_History[rpid].rid
		if utils.from_clipboard() ~= scid then
			utils.to_clipboard(scid)
			system.yield(10000)
		end
		return
	end)
	Players_History_Feat[rpid][t+1] = menu.add_feature("Auto Stalk Players SCID", "toggle", HistoryID.id, function(feat)
if type(feat) == "number" then
			return
		end
		local scid = Players_History[rpid].rid

		while feat.on do
		system.yield(10)
		local NetHandle = native.ByteBuffer128()
		GTA_Natives.NETWORK_HANDLE_FROM_USER_ID(tostring(scid), NetHandle, 13)

		local PlayerCheck = GTA_Natives.NETWORK_GET_PLAYER_FROM_GAMER_HANDLE(NetHandle)
		if PlayerCheck == -1 then
		_G.MoistNotify("Player Not in my Session","")
		elseif PlayerCheck ~= -1 then
		_G.MoistNotify("Player is in my Session","")
		system.yield(10000)
		end
		session_Check = {}
		for pid = 0, 31 do
		if player.is_player_valid(pid) then
		session_Check[player.get_player_scid(pid)] = pid
		end
		end
		if session_Check[scid] == nil then
		network.join_scid(scid)
		end
		system.yield(10000)
		
		
		end
		return
	end)
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players nethash = " .. tostring(Players_History[rpid].nid), "action", HistoryID.id, function(feat)
		if type(feat) == "number" then
			return
		end
		local nid = Players_History[rpid].nid
		if utils.from_clipboard() ~= nid then
			utils.to_clipboard(nid)
			system.yield(10000)
		end
		return
	end)
	Players_History_Feat[rpid][t+1] = menu.add_feature("Players IP Info", "action", HistoryID.id, function(feat)
		if type(feat) == "number" then
			return
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
		
		return
	end)
	
	Black_List_PID[#Black_List_PID + 1] = menu.add_feature("Blacklist Player", "action_value_str", HistoryID.id, function(feat)
		if type(feat) == "number" then
			return
		end
		-- local plyr = rpid
		-- local scid, name, token = (Players_History[plyr].rid), (Players_History[plyr].PlyName), (Players_History[plyr].htoken)
		-- if feat.value== 0 then
		-- AddScid(scid, name)
		-- LoadBlacklist()
		-- AddTokenID(token, name)
		-- Load_Blacklist()
		-- elseif feat.value== 1 then
		-- RemoveScid(scid)
		-- LoadBlacklist()
		-- RemoveTokenID(token)
		-- Load_Blacklist()
		-- end
		
		return
		end)
	Black_List_PID[#Black_List_PID]:set_str_data({"Add","Remove"})
	Black_List_PID[#Black_List_PID].hidden = true	
	
	PlayerHistory[rpid].Features = menu.add_feature("Temp BlacklistPlayer", "parent", HistoryID.id)
	PlayerHistory[rpid].Blacklist1 = menu.add_feature("Blacklist IP", "toggle", PlayerHistory[rpid].Features.id, function(feat)
		if type(feat) == "number" then
			return
		end
		if not PlayerHistory[rpid].Blacklist1.on then
			Temp_Blacklist[rpid].decipON = false
			return
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist1.on then
			Temp_Blacklist[rpid].decipON = true
			return
		end
	end)
	PlayerHistory[rpid].Blacklist1.on = false
	PlayerHistory[rpid].Blacklist12 = menu.add_feature("Partial Blacklist IP", "toggle", PlayerHistory[rpid].Features.id, function(feat)
		if type(feat) == "number" then
			return
		end
		local ip = TranIP
		if not PlayerHistory[rpid].Blacklist12.on then
			Temp_Blacklist[rpid].decip2ON = false
			return
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist12.on then
			Temp_Blacklist[rpid].decip2ON = true
			return
		end
	end)
	PlayerHistory[rpid].Blacklist12.on = false
	PlayerHistory[rpid].Blacklist2 = menu.add_feature("Blacklist SCID", "toggle", PlayerHistory[rpid].Features.id, function(feat)
		if type(feat) == "number" then
			return
		end
		if not PlayerHistory[rpid].Blacklist2.on then
			Temp_Blacklist[rpid].scidON = false
			return
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist2.on then
			Temp_Blacklist[rpid].scidON = true
			return
		end
	end)
	PlayerHistory[rpid].Blacklist2.on = false
	PlayerHistory[rpid].Blacklist3 = menu.add_feature("Blacklist Name", "toggle", PlayerHistory[rpid].Features.id, function(feat)
		if type(feat) == "number" then
			return
		end
		if not PlayerHistory[rpid].Blacklist3.on then
			Temp_Blacklist[rpid].PlyNameON = false
			return
		end
		CheckSession()
		if PlayerHistory[rpid].Blacklist3.on then
			Temp_Blacklist[rpid].PlyNameON = true
			return
		end
	end)
	PlayerHistory[rpid].Blacklist3.on = false
	
	return
end


function PlayerHistoryDB(pid)

	if not player.is_player_valid(pid) then
		return
		end
	
	local scid, PlayerName, token, tokeen, count, Player_IP, Part_IP
	Player_IP = player.get_player_ip(pid)
	local TranIP = string.format("%i.%i.%i.%i", (Player_IP >> 24) & 0xff, ((Player_IP >> 16) & 0xff), ((Player_IP >> 8) & 0xff), Player_IP & 0xff)
	Part_IP = GetPartial_IP(TranIP)
	scid = player.get_player_scid(pid)
	if scid ~= -1 then
		PlayerName = GTA_Natives.GET_PLAYER_NAME(pid) or "NaN"
		count = -1
		token = player.get_player_host_token(pid)
		tokhex = string.format("%x", token)
		tokeen = tostring(tokhex)
		for y = 1, #Players_History do
			if Players_History[y].rid == scid then
			if Players_History[y].DecIP ~= Player_IP then
			Players_History[y].DecIP = Player_IP
			count = Players_History[y].count + 1 
			Players_History[y].count = count
			_G.MoistNotify(tostring(PlayerName) .. "\nSCID: " .. scid .. "\nIP: " .. tostring(TranIP) .. "\nSeen: " .. count .. " times", "Histroic Player Joined\nNew IP Detected!")
			return
			end
				count = Players_History[y].count + 1
				Players_History[y].count = count
				if count > 1 then
					_G.MoistNotify("Histroic Player Join:\n" .. tostring(PlayerName) .. "\nSCID: " .. scid .. "\nSeen: " .. count .. " times", "Player Joined Found in History")
				end
			return
			end
			system.yield(0)
		end
		local i = #Players_History + 1
		if HistoryNotify and i < 700 then
			HistoryNotify = false
		end
		if i > 700 and not HistoryNotify then
			_G.MoistNotify("Player History is 700 or more" , "Consider Clearing Player History", 0xff0000ff, 30)
			_G.MoistNotify("Loading script Again or resetting State will take longer", "", 0xff0000ff, 30)
			_G.MoistNotify("Most Likely Cause your Game to Freeze for a moment", "", 0xff0000ff, 30)
			_G.TextPrintToScreen("Player History is 700 or more", "Consider Clearing Player History~n~For Optimal Performance", 20000, nil)
			HistoryNotify = true
		end
		
		
		Players_History[i] = {
			-- PlyName = {},
			-- count = {},
			-- DateLJ = {},
			-- rid = {},
			-- nid = {},
			-- htoken = {},
			-- DecIP = {},
			-- PartIP = {},
		}
		
		PlayerHistory[i] = {
			Features = {},
			Blacklist1 = {},
			Blacklist2 = {},
			Blacklist3 = {},
		}
		Temp_Blacklist[i] = {
			PlyName = {},
			scid = {},
			decip = {},
			decip2 = {},
			PlyNameON = {},
			scidON = {},
			decipON = {},
			decip2ON = {},
		}
		
		Players_History[i].PlyName = GTA_Natives.GET_PLAYER_NAME(pid)
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
		Temp_Blacklist[i].decip2ON = false
		Temp_Blacklist[i].PlyName = PlayerName
		Temp_Blacklist[i].scid = scid
		Temp_Blacklist[i].decip = Player_IP
		Temp_Blacklist[i].decip2 = Part_IP
		History_Player(i)
		
		count = 0
		
	end
	return
end

function Player_History_Load(array)

for y = 1, #Players_History do
	if (Players_History[y].rid) == (array.rid) then
		return
	end
end

local i = #Players_History + 1
-- Players_History[i] = {}
-- PlayerHistory[i] = {}
-- Temp_Blacklist[i] = {}
Players_History[i] = {
	-- PlyName = {},
	-- count = {},
	-- DateLJ = {},
	-- rid = {},
	-- nid = {},
	-- htoken = {},
	-- DecIP = {},
	-- PartIP = {},
	}

PlayerHistory[i] = {
	Features = {},
	Blacklist1 = {},
	Blacklist2 = {},
	Blacklist3 = {},
}

Temp_Blacklist[i] = {
	PlyName = {},
	scid = {},
	decip = {},
	decip2 = {},
	PlyNameON = {},
	scidON = {},
	decipON = {},
	decip2ON = {},

}

Players_History[i].PlyName = array.PlyName
Players_History[i].count = tonumber(array.count)
Players_History[i].DateLJ = array.DateLJ
Players_History[i].rid = tonumber(array.rid)
Players_History[i].nid = tonumber(array.nid)
Players_History[i].htoken = array.htoken
Players_History[i].DecIP = tonumber(array.DecIP)
Players_History[i].PartIP = array.PartIP
Temp_Blacklist[i].PlyName = array.PlyName
Temp_Blacklist[i].scid = tonumber(array.rid)
Temp_Blacklist[i].decip = tonumber(array.DecIP)
Temp_Blacklist[i].decip2 = array.PartIP
Temp_Blacklist[i].PlyNameON = false
Temp_Blacklist[i].scidON = false
Temp_Blacklist[i].decipON = false
Temp_Blacklist[i].decip2ON = false
History_Player(i)


end

local Current_Search = ""
function Search_History(HistoryName, strtype)
	local HistoryFeatureName
	if strtype == "ip" then
		for i =1, #Players_History do
			local DIP = Players_History[i].DecIP
			local TranIP = string.format("%i.%i.%i.%i", (DIP >> 24) & 0xff, ((DIP >> 16) & 0xff), ((DIP >> 8) & 0xff), DIP & 0xff)
			if TranIP:find(HistoryName, 1, true) then
				Players_History_Feat[i][1].hidden = false
				else
				Players_History_Feat[i][1].hidden = true
				--Players_History[i].Feature.hidden = true
			end
		end
		elseif strtype == "name" then
		if HistoryName ~= nil then
			for i=1,#Players_History_Feat do
				if HistoryName:len() == 0 then
					Players_History_Feat[i][1].hidden = false
					Current_Search = ""
				end
				HistoryID = Players_History_Feat[i][1].name	
				HistoryFeatureName = tostring(HistoryID)
				if HistoryFeatureName:find(HistoryName, 1, true) then
					Players_History_Feat[i][1].hidden = false
					else
					Players_History_Feat[i][1].hidden = true
				end
				if HistoryFeatureName:lower():find(HistoryName:lower(), 1, true) then
					Players_History_Feat[i][1].hidden = false
					else
					Players_History_Feat[i][1].hidden = true
				end
				
				
			end
			
		end
		
		
	end
	return
end

local Historyopt = menu.add_feature("History Player Options", "parent", LocalFeatures["History"].id)
local lastsavelabel = menu.add_feature("Never", "action", Historyopt.id)
lastsavelabel.name = ""
LocalFeatures.Search_Type = menu.add_feature("Search Player History", "action_value_str", LocalFeatures["History"].id, function(feat)
	if type(feat) == "number" then
		return
	end
	local r, HistoryName
	if feat.value == 0 then
	repeat
		r, HistoryName = input.get("Enter a Name To Search for", Current_Search, 64, 0)
		if r == 2 then
		Current_Search = ""
		for i=1,#Players_History_Feat do
		Players_History_Feat[i][1].hidden = false
		end
		goto continue
		end
		system.yield()
		until r == 0
		Current_Search = HistoryName
		Search_History(HistoryName, "name")
		elseif feat.value == 1 then
		if tonumber(Current_Search:sub(1, 2)) == nil then
			Current_Search = ""
		end
		repeat
		r, HistoryName = input.get("Enter Partial IP to Find", Current_Search, 64, 4)
		if r == 2 then
		Current_Search = ""
		for i=1,#Players_History_Feat do
		Players_History_Feat[i][1].hidden = false
		end
		goto continue
		end
		system.yield()
		until r == 0
		Current_Search = HistoryName
		Search_History(HistoryName, "ip")
		
	end
		::continue::
	return
end)
LocalFeatures.Search_Type:set_str_data({"By Name","By IP"})

function Load_History_File(feat)
	local file = _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
	if utils.file_exists(file) then
		
		PlayerHist, PlayersHist = table_load(file)
		system.yield(100)
		if type(PlayerHist) ~= 'table' then
		return
		end
		if PlayerHist ~= nil and PlayersHist ~= nil then
		if #PlayerHist < #PlayersHist then
				
		for i = 1, #PlayersHist do
		Player_History_Load(PlayersHist[i])
		end
		local count = #PlayersHist
		_G.MoistNotify(tostring(count) .. " Entries", "Saved Player History Loaded")
		return
		end

		
		for i = 1, #PlayerHist do
		Player_History_Load(PlayerHist[i])
		end
		local count = #PlayerHist

		_G.MoistNotify(tostring(count) .. " Entries", "Saved Player History Loaded")
	end
	end
	return
end

function savetable()
	local file = _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
	pcall(table_save, Players_History, file)
end	
	
local SaveThread = 0
function History_Save()
	local file = _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
	if SaveThread ~= 0 then
	return
	end
	if SaveComplete == false then
	return end
	if SaveThread == 0 then
	SaveThread = menu.create_thread(table_save, {Players_History, file})
	while not menu.has_thread_finished(SaveThread) do

	system.yield(100)
	end

	end
	menu.delete_thread(SaveThread)
	SaveThread = 0
	return
end

local lastsavetime = 0
LocalFeatures.SaveHistoryInt = menu.add_feature("AutoSave History mins: ", "value_f", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return
	end
		while feat.on do
		::SaveStart::
		system.yield(100)
		if not HistoryFileLoaded then
		goto SaveStart
		end
	ScriptConfig["AutoSaveHistoryFile"] = true
	ScriptConfig["AutoSaveHistoryTime"] = feat.value
	delay =  math.ceil(tonumber(feat.value) * (60))
	if HistoryFileLoaded then

	local testtime = os.time()
	
	if (testtime - lastsavetime) >= delay then
	
	History_Save()
	lastsavetime = os.time()
	lastsavelabel.name = tostring(os.date())
	
	end

	system.yield()
	end
	system.yield()
		end
		lastsavetime = 0
	ScriptConfig["AutoSaveHistoryFile"] = false
	ScriptConfig["AutoSaveHistoryTime"] = feat.value	
		
	
end)
LocalFeatures.SaveHistoryInt.on = ScriptConfig["AutoSaveHistoryFile"]
LocalFeatures.SaveHistoryInt.min = 3.0
LocalFeatures.SaveHistoryInt.max = 30.0
LocalFeatures.SaveHistoryInt.mod = 0.1
LocalFeatures.SaveHistoryInt.value = ScriptConfig["AutoSaveHistoryTime"]


LocalFeatures.Loadrec = menu.add_feature("AutoLoad Saved History Players", "toggle", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return
	end
	if not feat.on then
		ScriptConfig["LoadPlayerHistorysFile"] = false
		HistoryFileLoaded = false
		return
	end
	ScriptConfig["LoadPlayerHistorysFile"] = true
	if not HistoryFileLoaded then
		threadid = menu.create_thread(Load_History_File, feat)
		while not menu.has_thread_finished(threadid) do
			system.yield()
		end
		menu.delete_thread(threadid)
		threadid = 0
		HistoryFileLoaded = true
	end
	system.yield(100)
	return
end)
LocalFeatures.Loadrec.on = ScriptConfig["LoadPlayerHistorysFile"]

LocalFeatures.AutoHistoryLimit = menu.add_feature("(-100)Auto Limit value: ", "value_i", Historyopt.id,function(feat)
	if type(feat) == "number" then
		return 
	end
	local limit, Compact_Table = tonumber(feat.value), {}
	if not feat.on then
		ScriptConfig["AutoLimitHistory"] = false
		ScriptConfig["AutoLimitCount"] = tonumber(feat.value)
		return 
	end
	ScriptConfig["AutoLimitHistory"] = true
	ScriptConfig["AutoLimitCount"] = tonumber(feat.value)
		while feat.on do
	if #Players_History_Feat > tonumber(feat.value) then
		for i = 1, #Players_History_Feat do
			for y = Players_History_Feat[i].child_count, 1, -1 do
				local f = Players_History_Feat[i].children[y]
				if f.type == 1 << 11 then
					for t = f.child_count, 1, -1 do
						local e = f.children[t]
						menu.delete_feature(e.id)
					end
				end
				menu.delete_feature(f.id)
				
				system.yield(1)
			end
			if Players_History_Feat[i].child_count ~= 0 then
				_G.MoistNotify(Players_History_Feat[i].child_count)
				elseif Players_History_Feat[i].child_count == 0 then
				local f = Players_History_Feat[i]
				menu.delete_feature(f.id)
			end
			--system.yield(1)
		end
		
		Compact_Table = PlayerHistoryTableRebuild(tonumber(feat.value- 100))
		Players_History = {}
		
		for y = 1, #Compact_Table do
			player_Load(Compact_Table[y])
			
		end
		
		
		system.yield(10000)
	end
	
			system.yield()
				end
				return
	
end)
LocalFeatures.AutoHistoryLimit.max = 1600
LocalFeatures.AutoHistoryLimit.min = 100
LocalFeatures.AutoHistoryLimit.mod = 25
LocalFeatures.AutoHistoryLimit.value = ScriptConfig["AutoLimitCount"]
LocalFeatures.AutoHistoryLimit.on = ScriptConfig["AutoLimitHistory"]



LocalFeatures.DelHistory = menu.add_feature("Delete All History Players", "action", Historyopt.id, function(feat)
	if type(feat) == "number" then
		return
	end
	
	for i = 1, #Players_History_Feat do
		for y = Players_History_Feat[i][1].child_count, 1, -1 do
			local f = Players_History_Feat[i][1].children[y]
			if f.type == 1 << 11 then
				for t = f.child_count, 1, -1 do
					local e = f.children[t]
					menu.delete_feature(e.id)
				end
			end
			menu.delete_feature(f.id)
			system.yield()
		end
		if Players_History_Feat[i][1].child_count ~= 0 then
			moist_notify(Players_History_Feat[i][1].child_count)
			elseif Players_History_Feat[i][1].child_count == 0 then
			local f = Players_History_Feat[i][1]
			menu.delete_feature(f.id)
		end
		system.yield()
	end
	Players_History_Feat = {}
	Players_History, Temp_Blacklist, PlayerHistory = {},{},{}
	_G.MoistNotify("features Deleted")
	return
	
end)


function CheckSession()
	for pid = 0, 31 do
	system.yield(10)
		if player.is_player_valid(pid) then
			Temp_BlacklistCheck(pid)
	system.yield(10)
		end
	system.yield(10)
	end
	return
end

function Temp_BlacklistCheck(pid)
	if not player.is_player_valid(pid) then
		return
	end
	local scid, name, decip
	scid = player.get_player_scid(pid)
	name = GTA_Natives.GET_PLAYER_NAME(pid)
	decip = player.get_player_ip(pid)
	local TranIP = string.format("%i.%i.%i.%i", (decip >> 24) & 0xff, ((decip >> 16) & 0xff), ((decip >> 8) & 0xff), decip & 0xff)
	local PartIP = GetPartial_IP(TransIP)
	for i = 1, #Temp_Blacklist do
		if tostring(Temp_Blacklist[i].PlyName) == name and Temp_Blacklist[i].PlyNameON == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i].scid== scid and Temp_Blacklist[i].scidON == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i]["decip"]== decip and Temp_Blacklist[i].decipON == true then
			Temp_Blacklist_Kick(pid)
			elseif Temp_Blacklist[i]["decip2"]== PartIP and Temp_Blacklist[i].decip2ON == true then
			Temp_Blacklist_Kick(pid)
		end
	end
	return
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
	return
end


local Network_Join_Event = event.add_event_listener("player_join", function(e)
	if type(e) == "number" then
		return
	end
	
	if e.player ~= nil then
		local pid = e.player
		if player.is_player_valid(pid) then
			local status, err = pcall(PlayerHistoryDB, e.player)
			if not status then
				_G.MoistNotify(tostring(err), "Player History Module Error")
			end
			if #Temp_Blacklist ~= nil then
				local status, err = pcall(Temp_BlacklistCheck, e.player)
				if not status then
				print(err)
				--	_G.MoistNotify(tostring(err), "Player History Module Error")
				end
			end
			
		end
	end
	if HistoryFileLoaded then
	local testtime = os.time()
	if (testtime - lastsavetime) >= 60 then
	
	History_Save()
	lastsavetime = os.time()
	lastsavelabel.name = tostring(os.date())
	
	
	end

		end
	
	return
end)

_G.MoistNotify("Player History Module Loaded", "")


event.add_event_listener("exit", function()
		tbl = Players_History
		filename = _G.FolderPaths.Logs .. "\\PlayersHistory.txt"
		local charS,charE = "   ","\n"
		local file,err = io.open(filename, "wb")
		if err then return err end
		-- initiate variables for save procedure
		local tables,lookup = { tbl },{ [tbl] = 1 }
		io.output(file)
		io.write("return {"..charE)
		for idx,t in ipairs(tables) do
			io.write("-- Table: {"..idx.."}"..charE)
			io.write("{"..charE)
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
					io.write(charS.."{"..lookup[v].."},"..charE)
					elseif stype == "string" then
					io.write( charS..exportstring(v)..","..charE)
					elseif stype == "number" then
					io.write( charS..tostring(v)..","..charE)
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
							io.write(str.."{"..lookup[v].."},"..charE)
							elseif stype == "string" then
							io.write(str..exportstring(v)..","..charE)
							elseif stype == "number" then
							io.write(str..tostring(v)..","..charE)
						end
					end
				end
			end
			io.write("},"..charE)
		end
		io.write("}")
		io.close()
	
	
	
 
	event.remove_event_listener("player_join", Network_Join_Event)
	
	
	--FeatureCleanup()
end)

function ResetLoad()
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			PlayerHistoryDB(pid)
		end
	end
end

ResetLoad()

end

menu.create_thread(PlayerHistoryMod)