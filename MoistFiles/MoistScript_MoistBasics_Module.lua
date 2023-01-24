if not (package.path):find(utils.get_appdata_path("PopstarDevs", "2Take1Menu") .. "\\scripts\\MoistFiles\\?.lua", 1, true) then
	package.path =  utils.get_appdata_path("PopstarDevs", "2Take1Menu") .. "\\scripts\\MoistFiles\\?.lua;"  .. utils.get_appdata_path("PopstarDevs", "2Take1Menu") .. "\\scripts\\MoistFiles\\?.luac;".. package.path
end
local M_Func = {}
local GTA_Natives = require("MoistScript_GTA_Natives")
M_Func["Get_Date_Time"] = function()
	local datedm, datetm, dateDMY
	datedm = os.date()
	datetm = string.match(datedm, "%d%d:%d%d:%d%d")
	dateDMY = os.date("%d/%m/%y")
	return (string.format(dateDMY .. ", " .. datetm .. ", "))
end
M_Func["FetchFriends"] = function()
	for FriD = 0, network.get_friend_count()-1 do
		local FrName = network.get_friend_index_name(FriD)
		local FrSCID = network.get_friend_scid(FrName)
		FriendsList[FrSCID] = FrName
	end
end
local FeatTypes <const>  = {}
FeatTypes[(1 << 1) | (1 << 5) | (1 << 9)] = "action_value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 10] = "autoaction_value_str"
FeatTypes[1 << 0 | 1 << 1 | 1 << 5] = "value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 9 | 1 << 15] = "action_value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 10 | 1 << 15] = "autoaction_value_str"
FeatTypes[1 << 0 | 1 << 1 | 1 << 5 | 1 << 15] = "value_str"
M_Func["SessionSetup"] = function()
	LobbyPlayers = {}
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			LobbyPlayers[#LobbyPlayers + 1] = GTA_Natives.GET_PLAYER_NAME(pid)
			system.yield()
		end
		system.yield()
	end
	LobbyPlayers[32] = "Anonomous"
	for k, v in pairs(OnlineFeats) do
		system.yield()
		for fpid = 0, #OnlineFeats[k]["feats"] do
			if FeatTypes[(OnlineFeats[k]["feats"][fpid].type)] then
				local CurrentValue = OnlineFeats[k]["feats"][fpid]:get_str_data()[OnlineFeats[k]["feats"][fpid].value + 1]
				OnlineFeats[k]["feats"][fpid]:set_str_data(LobbyPlayers)
				local NewValue = OnlineFeats[k]["feats"][fpid]:get_str_data()
				for i = 1, #NewValue do
					if NewValue[i] == CurrentValue then
						OnlineFeats[k]["feats"][fpid].value = tonumber(i - 1)
						system.yield()
					end
				end
			end
		end
		system.yield()
	end
	for k, v in pairs(LocalFeats) do
		system.yield()
		if FeatTypes[LocalFeats[k].type] then
			local CurrentValue = LocalFeats[k]:get_str_data()[LocalFeats[k].value]
			LocalFeats[k]:set_str_data(LobbyPlayers)
			local NewValue = LocalFeats[k]:get_str_data()
			for i = 1, #NewValue do
				if NewValue[i] == CurrentValue then
					LocalFeats[k].value = tonumber(i)
					system.yield()
				end
			end
		end
		system.yield()
	end
end
--TODO: Script Functions
M_Func["Get_PID"] = function(name)
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			system.yield()
			if name == GTA_Natives.GET_PLAYER_NAME(pid) then
				return tonumber(pid)
				elseif name == "Anonomous" then
				return tonumber(32)
			end
		end
	end
end
M_Func["Get_Offset"] = function(pid, dist)
	local pped = player.get_player_ped(pid)
	local fwdvec = entity.get_entity_forward_vector(pped)
	local offset = player.get_player_coords(pid) + (fwdvec * dist)
	return offset
end
M_Func["Get_Entity_Offset"] = function(ent, dist)
	local fwdvec = entity.get_entity_forward_vector(ent)
	local offset = entity.get_entity_coords(ent) + (fwdvec * dist)
	return offset
end
M_Func["Translate"] = function(text, lang)
	lang = lang  or ScriptConfig["MyLang"]
	if lang == nil then
		lang = "auto"
	end
	local encoded = web.urlencode(text)
	local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=" .. "auto" .. "&tl=" .. lang ..  "&dt=t&q=" .. encoded)
	if statusCode ~= 200 then
		return false, body
	end
	translated = json.decode(body)
	local translatedText = body:match(".-\"(.-)\",\"")
	PlayersLang = translated[3]
	return true, PlayersLang, translatedText
end
M_Func["UpdateIPInfo"] = function(pid)
	local ip = player.get_player_ip(pid)
	local sip = string.format("%i.%i.%i.%i", (ip >> 24) & 0xff, ((ip >> 16) & 0xff), ((ip >> 8) & 0xff), ip & 0xff)
	lang = ScriptConfig["MyLang"]
	local success, result = web.get("http://ip-api.com/json/" .. tostring(sip) .. "?fields=continent,country,countryCode,regionName,city,isp,org,mobile,proxy,hosting,query&lang=" .. lang)
	system.yield()
	if success then
		local test, IpInfo =  pcall(json.decode, result)
		if test then
			for k, v in pairs(IpInfo) do
				system.yield()
				if _G.Moist_is_Translated then
					local status, tlan, TranText = M_Func["Translate"](k, lang)
					if status then
						OnlineFeatures[k]["feats"][pid].name = tostring(TranText) .. " = " .. tostring(v)
						elseif not status then
						OnlineFeatures[k]["feats"][pid].name = tostring(k) .. " = " .. tostring(v)
					end
					elseif not _G.Moist_is_Translated then
					OnlineFeatures[k]["feats"][pid].name = tostring(k) .. " = " .. tostring(v)
				end
			end
		end
	end
end
M_Func["IPInfo"] = function(pid)
	local ip = player.get_player_ip(pid)
	local sip = string.format("%i.%i.%i.%i", (ip >> 24) & 0xff, ((ip >> 16) & 0xff), ((ip >> 8) & 0xff), ip & 0xff)
	lang = ScriptConfig["MyLang"]
	local success, result = web.get("http://ip-api.com/json/" .. tostring(sip) .. "?fields=continent,country,countryCode,regionName,city,isp,org,mobile,proxy,hosting,query&lang=" .. lang)
	system.yield()
	if success then
		test, Session_Players[pid]["IPInfo"] = pcall(json.decode, result)
	end
	return
end
M_Func["VersionWebCheck"] = function()
	statusCode, body = web.request("https://raw.githubusercontent.com/IN2-Moist/2Take1-Moist-Script/main/version.json")
	if statusCode ~= 200 then
		print(body)
	end
	local versiondata = json.decode(body)
	print(versiondata)
	if versiondata[1][1] == MoistScript_NextGen then
		MoistNotify("You are using the Latest Version: " .. tostring(versiondata[1][1]) .." of MoistScript NG", "", 0xff0000ff, 15)
		elseif versiondata[1][1] ~= MoistScript_NextGen then
		MoistNotify("The Version of MoistScript NG you are using is not the Latest", "Version: " .. tostring(versiondata[1][1]) .." is Released", 0xff0000ff, 100)
		MoistNotify("Please paste the url into your web browser and download the latest release and install", "Update URL Copied to Clipboard", 0xff0000ff, 100)
		utils.to_clipboard("https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest")
		TextPrintToScreen("~b~~h~MoistScript NG ~r~~h~is Out of Date!", "~y~~h~Version: " .. tostring(versiondata[1][1]) .." is Released", 3000, 000)
		system.yield(3000)
		TextPrintToScreen("~g~~h~Update URL Copied to Clipboard", "", 3000, 000)
		system.yield(3000)
		TextPrintToScreen("Please paste the url into your web browser and download the latest release and install", "", 3000, 000)
		system.yield(3000)
	end
end
M_Func["Get_MP_Stat"] = function(stat)
	local part1, part2
	local text1 = stat
	local separator = text1:find("_", 1, true)
	if separator then
		part1 = text1:sub(1, separator - 1)
		part2 = text1:sub(separator + 1)
	end
	if part1 ~= "MPPLY" then
		local text = part2
		local hash = gameplay.get_hash_key("MPPLY_LAST_MP_CHAR")
		local MP = stats.stat_get_int(hash, 1)
		return (string.format("MP" ..MP .."_" ..text))
		elseif part1 == "MPPLY" then
		return stat
	end
end
M_Func["CreateMoistThread"] = function(func, data)
	local data = data or nil
	if func ~= nil then
		MoistThreads[#MoistThreads+1] = menu.create_thread(func, data)
		return MoistThreads[#MoistThreads]
	end
end
M_Func["LoadLUAFile"] = function(scriptname)
	local a = assert(require(scriptname)) return M_Func.CreateMoistThread(a)
end
M_Func["Chat_Event_Logger"] = function(e)
	local pid, sid, ChatMsg = e.player, e.sender, e.body
	if type(e) == "number" then
		return
	end
	local chattext = GTA_Natives.GET_PLAYER_NAME(pid) .. ", " .. tostring(e.body) .. ", "
	File_Writer(chattext, FolderPaths.ChatFile, true, true)
	return
end
M_Func["Create_Csv"] = function()
	local Date = os.date("%d-%m-%y")
	local file = (FolderPaths.Logs .. "\\PlayerJoins" .. Date .. ".csv")
	if not utils.file_exists(file) then
		io.open(file, "a")
		io.output(file)
		io.write("Date,Time,Player Name,SCID HEX,PID,SCID,Player Network Hash,Decimal Host Token,Hex Host Token,Host Priority,Decimal IP,Translated IP,NetworkHandle\n")
		io.close()
	end
end
M_Func["joined_csv"] = function(text)
	local d, dtime, dt, CurDateTime, file
	d = os.date()
	dtime = string.match(d, "%d%d:%d%d:%d%d")
	dt = os.date("%d/%m/%Y")
	local Date = os.date("%d-%m-%y")
	if not utils.file_exists(FolderPaths.Logs .. "\\PlayerJoins" .. Date .. ".csv") then
		M_Func["Create_Csv"]()
	end
	CurDateTime = (string.format(dt .. ',' .. dtime .. ','))
	file = io.open(FolderPaths.Logs .. "\\PlayerJoins" .. Date .. ".csv", "a")
	io.output(file)
	file:write(CurDateTime .. text .. "\n")
	file:close()
end
M_Func["GiveWeaponTo"] = function(PedTarget, hash, now, ammo_count)
	local now = now or false
	local ammo_count = ammo_count or 2000
	if PedTarget ~= nil then
		if entity.is_entity_a_ped(PedTarget) then
			if not weapon.has_ped_got_weapon(PedTarget, hash) then
				weapon.give_delayed_weapon_to_ped(PedTarget, hash, 0, now)
				weapon.set_ped_ammo(PedTarget, hash, ammo_count)
				elseif weapon.has_ped_got_weapon(PedTarget, hash) then
				weapon.set_ped_ammo(PedTarget, hash, ammo_count)
			end
		end
	end
end
M_Func["Game_Cleanup"] = function()
	--	while true do
	system.yield()
	local pos = v3(-5784.258301,-8289.385742,-136.411270)
	local allpickups = object.get_all_pickups()
	local allobj = object.get_all_objects()
	local allveh = vehicle.get_all_vehicles()
	local allpeds = ped.get_all_peds()
	if not (#allpeds) == nil or 0 then
		for i = 1, #allpeds do
			if not ped.is_ped_a_player(allpeds[i]) then
				GTA_Natives.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(network.get_entity_net_id(allpeds[i]))
				network.request_control_of_entity(allpeds[i])
				entity.set_entity_coords_no_offset(allpeds[i], pos)
				entity.set_entity_as_no_longer_needed(allpeds[i])
				entity.delete_entity(allpeds[i])
				system.yield()
			end
		end
	end
	if not (#allpickups) == nil or 0 then
		for i = 1, #allpickups do
			GTA_Natives.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(network.get_entity_net_id(allpickups[i]))
			network.request_control_of_entity(allpickups[i])
			entity.set_entity_coords_no_offset(allpickups[i], pos)
			entity.set_entity_as_no_longer_needed(allpickups[i])
			entity.delete_entity(allpickups[i])
			system.yield()
		end
	end
	if not (#allveh) == nil or 0 then
		for i = 1, #allveh do
			if entity.is_an_entity(allveh[i]) then
				if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
					GTA_Natives.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(network.get_entity_net_id(allveh[i]))
					network.request_control_of_entity(allveh[i])
					entity.set_entity_coords_no_offset(allveh[i], pos)
					entity.set_entity_as_no_longer_needed(allveh[i])
					entity.delete_entity(allveh[i])
					system.yield()
				end
			end
		end
	end
	if not (#allobj) == nil or 0 then
		for i = 1, #allobj do
			GTA_Natives.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(network.get_entity_net_id(allobj[i]))
			network.request_control_of_entity(allobj[i])
			entity.set_entity_coords_no_offset(allobj[i], pos)
			entity.set_entity_as_no_longer_needed(allobj[i])
			entity.delete_entity(allobj[i])
			system.yield()
		end
	end
	--end
end
M_Func["Blip_Flash"] = function(BlipID, delay)
	local PlayerBlip = BlipID
	local timer = delay * 10 or 7000
	local delay = delay or 1000
	GTA_Natives.SET_BLIP_FLASH_TIMER(PlayerBlip, timer)
	GTA_Natives.SET_BLIP_FLASH_INTERVAL(PlayerBlip, delay)
	system.yield(delay)
	GTA_Natives.PULSE_BLIP(PlayerBlip)
end
M_Func["TriggerEvent"] = function(pid, event, ...)
	M_Func["TriggerEvent2"](event, pid, ...)
	return
end
M_Func["TriggerEvent2"] = function(event, pid, ...)
	if type(event) ~= 'number' and type(tonumber(event)) ~= 'number' then
		return
	end
	if player.is_player_valid(pid) and not Session_Players[pid].Exclude then
		system.yield(25)
		if ScriptConfig["SafeMode"] == true and pid ~= player.player_id() then
			script.trigger_script_event_2(tonumber(1 << pid), event, 1,  ...)
			system.yield(10)
			script.trigger_script_event_2(tonumber(1 << pid), event, ...)
			elseif ScriptConfig["SafeMode"] ~= true and pid == player.player_id() then
			script.trigger_script_event_2(tonumber(1 << pid), event, 1,  ...)
			system.yield(10)
			script.trigger_script_event_2(tonumber(1 << pid), event, ...)
		end
	end
end
M_Func["TriggerScriptEvent2"] = function(pid, plybits, event, ...)
	if type(event) ~= 'number' and type(tonumber(event)) ~= 'number' then
		return
	end
	if pid == nil then
		script.trigger_script_event_2(plybits, event,  ...)
		return
	end
	if player.is_player_valid(pid) and not Session_Players[pid].Exclude then
		if ScriptConfig["SafeMode"] == true and pid ~= player.player_id() then
			script.trigger_script_event_2(plybits, event,  ...)
			return
			elseif ScriptConfig["SafeMode"] ~= true and pid == player.player_id() then
			script.trigger_script_event_2(plybits, event, ...)
			return
		end
	end
	return
end
M_Func["Set_In_Veh_Seat"] = function(pedDriver, Targveh, seatid)
	ped.set_ped_into_vehicle(pedDriver, Targveh, seatid)
end
M_Func["Get_Train"] = function()
	local train = nil
	local MyPos = player.get_player_coords(player.player_id())
	local AllVehicles = vehicle.get_all_vehicles()
	for i=1,#AllVehicles do
		local hash = entity.get_entity_model_hash(AllVehicles[i])
		if hash == 1030400667 or hash == 868868440 then
			local veh = AllVehicles[i]
			local VehPos = entity.get_entity_coords(veh)
			local distance = MyPos:magnitude(VehPos)
			if distance < 120 then
				train = veh
				goto EndFind
			end
		end
	end
	MoistNotify("Train Not Found", "")
	::EndFind::
	return train
end
M_Func["Get_Missile_Entity"] = function(pid)
	while Session_Players[pid]["MissileActive"] do
		system.yield()
		repeat
			MissileCount = MissileCount + 1
		until MissileCount == 25
		MissileCount = 0
		MissileEntity = object.get_all_objects()
		for i = 1, #MissileEntity do
			if MissileEntity[i] ~= nil then
				if not entity.is_entity_an_object(MissileEntity[i]) then
					return
				end
				local hash = entity.get_entity_model_hash(MissileEntity[i])
				if hash == 1262355818 then
					if ScriptConfig["CounterAttackMissiles"] then
						Active_Missile = MissileEntity[i]
						TextPrintToScreen("~h~~r~Missile Found!", "~h~~y~Launching Counter Attack!", 4000, 000)
					end
					if ui.get_blip_from_entity(MissileEntity[i]) ~= 0 then return end
					Missile_Blip[pid+1] = ui.add_blip_for_entity(MissileEntity[i])
					ScriptBlips[#ScriptBlips+1] = Missile_Blip[pid+1]
					ui.set_blip_sprite(Missile_Blip[pid+1], 368)
					ui.set_blip_colour(Missile_Blip[pid+1], 17)
					LocalFeatures.MissileCounter.on = true
					Missiles[#Missiles+1] = MissileEntity[i]
					system.yield(10)
				end
				system.yield(10)
			end
		end
	end
	return
end
M_Func["RandomArgBuilder"] = function(ArraySize, ReturnString)
	local return_string = ReturnString or false
	local Arg = {}
	local IntMaxAlt = {math.maxinteger, math.mininteger}
	local Args = ArraySize
	Arg[1] = math.random(-1000, 99999999)
	Arg[2] = math.random(-1, 9)
	Arg[3] = math.random(-1000, 99999999)
	Arg[4] = math.random(-100, -1)
	Arg[5] = math.random(999999999, 999999999999999)
	Arg[6] = math.random(-999999999999999, -9999999)
	Arg[7] = math.random(-1, 0)
	Arg[8] = IntMaxAlt[math.random(1, 2)]
	for i = 1, Args do
		Arg[#Arg+1] = Arg[math.random(1, 8)]
	end
	if ReturnString == true then
		return tostring(table.concat(Arg, ","))
		elseif ReturnString == false then
		return Arg
	end
end
M_Func["BitshiftArgBuilder"] = function(var1, var2)
	local array = {}
	local b = 0
	local a = var1 << var2
	repeat
		a = a + var1 << var2
		b = b + 1
		array[b] = a
	until b == 16
	b = 0
	return table.concat(array, ", ")
end
M_Func["Spectate_Check"] = function(pid)
	if player.is_player_valid(pid) then
		local text, text_N, textN, textA, textB = "", "", "", "", ""
		if player.is_player_spectating(pid) then
			local TargetEntity = network.get_entity_player_is_spectating(pid)
			if entity.is_entity_a_ped(TargetEntity) then
				if ped.is_ped_a_player(TargetEntity) then
					target = player.get_player_from_ped(TargetEntity)
				end
			end
			text, text_N, textN, textA, textB = "", "", "", "", ""
			intbool, int = Moist_InteriorLibs.Get_Interior(pid)
			while intbool == nil do
				system.yield()
			end
			Session_Players[pid].InInterior = intbool
			if not intbool then
				textA = textA  .. (tostring(GTA_Natives.GET_PLAYER_NAME(pid)) .. "Spectating with Mod | " .. tostring(GTA_Natives.GET_PLAYER_NAME(target)) .. "\nInterior Detected = ~r~~h~" .. tostring(Session_Players[pid].InInterior))
				text_N = text_N  .. (tostring(GTA_Natives.GET_PLAYER_NAME(pid)) .. "Spectating with Mod | " .. tostring(GTA_Natives.GET_PLAYER_NAME(target)) .. "\nInterior Detected = " .. tostring(Session_Players[pid].InInterior))
				textB = textB  ..(" | Target Spectatable = ~r~~h~" .. tostring(Session_Players[target].Spectatable))
				textN = textN  ..(" | Target Spectatable = " .. tostring(Session_Players[target].Spectatable))
				TextPrintToScreen(textA, textB, 2000, nil)
				MoistNotify(text_N .."\n" .. textN, "")
			end
		end
	end
end
M_Func["RoundNum"] = function(num, dot)
	local mult = 10^(dot or 0)
	return ((num * mult + 0.05) // 1) / mult
end
M_Func["ScriptInt"] = function()
	for pid = 0, 31 do
		Session_Players[pid] = {}
		Session_Players[pid].PlayerTags = ""
		Session_Players[pid].name = nil
		Session_Players[pid].scid = -1
		Session_Players[pid].AddedBlip = nil
		Session_Players[pid]["IPInfo"] = {}
		Session_Players[pid]["AddedBlip"] = nil
		Session_Players[pid]["Notified"] = false
		Session_Players[pid]["Exclude"] = false
		Session_Players[pid]["RCveh"] = false
		Session_Players[pid]["MissileActive"] = false
		Session_Players[pid]["Spectatable"] = false
		Session_Players[pid]["isFriend"] = false
		Session_Players[pid]["JoinTime"] = nil
		Session_Players[pid]["isWhiteListed"] = false
		Session_Players[pid].isGodmode = false
		Session_Players[pid].VehGodmode = false
		Session_Players[pid].isOTR = false
		Session_Players[pid].VehGodmodeTag = false
		Session_Players[pid].isGodmodeTag = false
		Session_Players[pid].isOTRTag = false
		Session_Players[pid].OTR_TimerM = -1
		Session_Players[pid].OTR_TimerS = -1
		Session_Players[pid].PlySpeed = 0.0
		Session_Players[pid].OTR_Time = 0
	end
	for pid = 0, 31 do
		if network.is_session_started() then
			if player.is_player_valid(pid) then
				Session_Players[pid].name = GTA_Natives.GET_PLAYER_NAME(pid)
				Session_Players[pid]["scid"] = player.get_player_scid(pid)
				Session_Players[pid]["IPInfo"] = {}
				Session_Players[pid]["AddedBlip"] = nil
				Session_Players[pid]["Notified"] = false
				Session_Players[pid]["Exclude"] = false
				Session_Players[pid]["RCveh"] = false
				Session_Players[pid]["MissileActive"] = false
				Session_Players[pid]["Spectatable"] = false
				Session_Players[pid]["isFriend"] = false
				Session_Players[pid]["JoinTime"] = nil
				Session_Players[pid]["isWhiteListed"] = false
				Session_Players[pid].isGodmode = false
				Session_Players[pid].VehGodmode = false
				Session_Players[pid].isOTR = false
				Session_Players[pid].VehGodmodeTag = false
				Session_Players[pid].isGodmodeTag = false
				Session_Players[pid].PlayerTags = ""
				Session_Players[pid].isOTRTag = false
				Session_Players[pid].OTR_TimerM = -1
				Session_Players[pid].OTR_TimerS = -1
				Session_Players[pid].PlySpeed = 0.0
				Session_Players[pid].OTR_Time = 0
				M_Func.IPInfo(pid)
			end
		end
	end
end
M_Func["Get2DDist"] = function(pid, v3pos)
	local pos = v3pos
	pos.z = 0.0
	local playerCoord = player.get_player_coords(pid)
	playerCoord.z = 0.0
	return (playerCoord:magnitude(v3pos))
end
M_Func["GetPlayer3D_Dist"] = function(pid)
	local playerCoord = player.get_player_coords(player.player_id())
	local coord = player.get_player_coords(pid)
	return (playerCoord:magnitude(coord))
end
M_Func["Get_Vec3_to_Vec3_Dist"] = function(vec3a, vec3b)
	if vec3a == nil or vec3b == nil then
		MoistNotify("At least One Vector Parameter is Missing", "MoistScript NG Function Error!")
		return
	end
	return (vec3a:magnitude(vec3b))
end
return M_Func