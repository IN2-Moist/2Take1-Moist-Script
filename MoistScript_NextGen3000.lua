if MoistScript_NextGen then
	menu.notify("Moist_NG Already Executed ! ! !", "", 30, 0xff0000ff)
	menu.notify("EXECUTION DENIED ! ! !", "", 30, 0xff0000ff)
	return
end
MoistScript_NextGen = "3.0.0.0"




--TODO: Script Features Modules and Config Storage Tables
local FolderPaths, ScriptConfig, Features, OnlineFeats, OnlineFeatures, LocalFeats, LocalFeatures, LoadedModules = {}, {}, {}, {}, {}, {}, {}, {}
--TODO: Storage Tables
local NpcList, NpcVehList, SpawnedShit =  {}, {}, {}
local FriendsList, Session_Players, LobbyPlayers = {}, {{name = {}, scid = {},}}, {}

--INFO: Folder & Default Files Setup
FolderPaths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
FolderPaths.LUAS = FolderPaths.Root .. "\\scripts"
utils.make_dir(FolderPaths.Root  .. "\\Blacklist")
utils.make_dir(FolderPaths.Root  .. "\\Moist-Logs")
utils.make_dir(FolderPaths.Root  .. "\\scripts\\MoistFiles")
FolderPaths.Config = FolderPaths.Root .. "\\scripts\\MoistFiles"
FolderPaths.Logs = FolderPaths.Root .. "\\Moist-Logs"
FolderPaths.SettingsFile = FolderPaths.Config .. "\\Moists_NG_settings.ini"
FolderPaths.debugfile = FolderPaths.Root .. FolderPaths.Logs .."\\Moists_NG_Debug.log"

--TODO: Script Settings
ScriptConfig["SaveDate"] = "Never"
ScriptConfig["Moist_NG"] = "3.0.0.0"
ScriptConfig["LoadPedList"] = false
ScriptConfig["LoadVehList"] = false
ScriptConfig["HotkeySave_ON"] = false
ScriptConfig["LoadPlayerBar"]  = false
ScriptConfig["PlayerBar_ON"] = false
ScriptConfig["NotifyColorDefault"] = 0xff0000ff

local MoistNotify = function(msg1, msg2, colour, timeout)
	timeout = timeout or 8
	msg1 = msg1 or "MoistScript Putting Fun and Moisture over GTA ONLINE"
	msg2 =  msg2 or "MoistScript 3.0.0.0"
	local color = ScriptConfig["NotifyColorDefault"] or colour
	menu.notify(msg1, msg2, timeout, color)
end

--TODO: Feature Tables Globalisation for external Modules
_G.OnlineFeats = OnlineFeats
_G.OnlineFeatures = OnlineFeatures
_G.LocalFeats = LocalFeats
_G.Features = Features
_G.LocalFeatures = LocalFeatures
_G.MoistNotify = MoistNotify
_G.ScriptConfig = ScriptConfig
_G.LobbyPlayers = LobbyPlayers

--TODO: Translation stuff

if not (package.path):find(FolderPaths.Root .. "\\scripts\\MoistFiles\\?.lua", 1, true) then
		package.path =  FolderPaths.Root .. "\\scripts\\MoistFiles\\?.lua;" .. package.path
end
local Moist_Translate = require("Moist_Translate")

--TODO: Script Feature Parents
-- Local
Features.LocalParent = menu.add_feature("Moist Script NG", "parent", 0)
Features["ParentLabel"] = menu.add_feature("Next Generation Moist Script 3.0.0.0", "action", Features.LocalParent.id)

LocalFeatures.Self_Parent = menu.add_feature("Self Features", "parent", Features.LocalParent.id)
LocalFeatures.Self_WeaponStuff = menu.add_feature("Weapon Related Functions", "parent", LocalFeatures.Self_Parent.id)
LocalFeatures.Self_Ped = menu.add_feature("Player Ped Features", "parent", LocalFeatures.Self_Parent.id)
Features.LocalSettings = menu.add_feature("MoistScript Settings", "parent", Features.LocalParent.id)
LocalFeatures["save_settings"] = menu.add_feature("Current Settings: ", "action_value_str", Features.LocalSettings.id, function(feat)
	if feat.value == 0 then
		SaveScriptConfig()
		MoistNotify("Current Settings Saved!", "MoistScript Settings")
		elseif feat.value == 1 then
		ResetScriptConfig()
		MoistNotify("Settings Reset Done !", "MoistScript Settings")
	end
end)
LocalFeatures["save_settings"]:set_str_data({"Save", "Reset"})
LocalFeatures["HotKeyParent"] = menu.add_feature("MoistScript HOTKEYS", "parent", Features.LocalSettings.id)
Features.LocalModules = menu.add_feature("Load MoistScript Modules", "parent", Features.LocalSettings.id)
LocalFeatures["Translate"] = menu.add_feature("Update Script with Translation", "action", Features.LocalSettings.id, function(feat)

	Moist_Translate.localmenu(feat)
	Moist_Translate.onlinemenu(feat)

end)
-- Online
Features.OnlineParent = menu.add_player_feature("Moist Script NG", "parent", 0)
Features.OnlineParent.feats.name = "Moist Script NG"
Features["OnlineParentLabel"] = menu.add_player_feature("Next Generation Moist Script 3.0.0.0", "action", Features.OnlineParent.id)
Features["OnlineParentLabel"].feats.name = "Next Generation Moist Script 3.0.0.0"

Features.RemovePlayer = menu.add_player_feature("Remove Player", "parent", Features.OnlineParent.id)
Features.RemovePlayer.feats.name = "Next Generation Moist Script 3.0.0.0"

Features.Troll = menu.add_player_feature("Troll & Annoy", "parent", Features.OnlineParent.id)
Features.Troll.feats.name = "Troll & Annoy"

Features.GriefThisCunt = menu.add_player_feature("Grief This Cunt ! !", "parent", Features.OnlineParent.id)
Features.GriefThisCunt.feats.name = "Grief This Cunt ! !"

Features.FramePlayer = menu.add_player_feature("Grief Others (Frame Player)", "parent", Features.OnlineParent.id)
Features.FramePlayer.feats.name = "Grief Others (Frame Player)"

Features.ScriptEvents = menu.add_player_feature("Script Events", "parent", Features.OnlineParent.id, function(feat, pid)
	if script.get_global_i(1893551 + (1 + (pid * 599)) + 10) == -1 then
	Features["CEO"].feats[pid].hidden = true
		OnlineFeatures["OTR"].feats[pid].name = "Off The Radar"
		OnlineFeatures["NOCOPS"].feats[pid].name = "Cops Turn a Blind Eye"
		elseif script.get_global_i(1893551 + (1 + (pid * 599)) + 10) ~= -1 then
		Features["CEO"].feats[pid].hidden = false
		OnlineFeatures["OTR"].feats[pid].name = "Ghost Organisation"
		OnlineFeatures["NOCOPS"].feats[pid].name = "Bribe the Cops"
	end
end)
Features["CEO"] = menu.add_player_feature("CEO Features", "parent", Features.ScriptEvents.id)
for pid = 0, #Features["CEO"].feats do
	Features["CEO"].feats[pid].hidden = true
	Features["CEO"].feats[pid].name = "CEO Features"
end


--TODO: Tables for Local Script Functions
local M_Func, M_Event = {}, {}
--INFO: Fetch Real Friends and Remember Them!
M_Func["FetchFriends"] = function()
	for FriD = 0, network.get_friend_count()-1 do
		local FrName = network.get_friend_index_name(FriD)
		local FrSCID = network.get_friend_scid(FrName)
		FriendsList[FrSCID] = FrName
	end
end
M_Func["FetchFriends"]()
local FeatTypes <const> = {}
FeatTypes[1 << 1 | 1 << 5 | 1 << 9] = "action_value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 10] = "autoaction_value_str"
FeatTypes[1 << 0 | 1 << 1 | 1 << 5] = "value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 9 | 1 << 15] = "action_value_str"
FeatTypes[1 << 1 | 1 << 5 | 1 << 10 | 1 << 15] = "autoaction_value_str"
FeatTypes[1 << 0 | 1 << 1 | 1 << 5 | 1 << 15] = "value_str"
--INFO: Setup Array of Players
M_Func["SessionSetup"] = function()
	LobbyPlayers = {}
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			LobbyPlayers[#LobbyPlayers + 1] = player.get_player_name(pid)
		end
	end
	LobbyPlayers[32] = "Anonomous"
	for k, v in pairs(OnlineFeats) do
		for fpid = 0, #OnlineFeats[k].feats do
			if FeatTypes[(OnlineFeats[k].feats[fpid].type)] then 
				local CurrentValue = OnlineFeats[k].feats[fpid]:get_str_data()[OnlineFeats[k].feats[fpid].value + 1]
				OnlineFeats[k].feats[fpid]:set_str_data(LobbyPlayers)
				local NewValue = OnlineFeats[k].feats[fpid]:get_str_data()
				for i = 1, #NewValue do
					if NewValue[i] == CurrentValue then
						OnlineFeats[k].feats[fpid].value = tonumber(i - 1)
					end
				end
			end
		end
	end
	for k, v in pairs(LocalFeats) do
		if FeatTypes[LocalFeats[k].type] then 
			local CurrentValue = LocalFeats[k]:get_str_data()[LocalFeats[k].value + 1]
			LocalFeats[k]:set_str_data(LobbyPlayers)
			local NewValue = LocalFeats[k]:get_str_data()
			for i = 1, #NewValue do
				if NewValue[i] == CurrentValue then
					LocalFeats[k].value = tonumber(i - 1)
				end
			end
		end
	end
end
M_Func["Get_PID"] = function(name)
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			if name == player.get_player_name(pid) then
				return tonumber(pid)
				elseif name == "Anonomous" then
				return tonumber(32)
			end
		end
	end
end
M_Func["LoadLUAFile"] = function(scriptname)
	local file = FolderPaths.LUAS .. "\\scripts\\" .. scriptname
	if not utils.file_exists(file) then return end
	local a = assert(loadfile(file))
	return a()
end
M_Event["Join_Event"] = event.add_event_listener("player_join", function(e)
	M_Func["SessionSetup"]()
	return
end)
M_Event["Leave_Event"] = event.add_event_listener("player_leave", function(e)
	M_Func["SessionSetup"]()
	return
end)
for pid = 0, 31 do
	Session_Players[pid] = {}
	Session_Players[pid].name = nil
	Session_Players[pid].scid = -1
end
--TODO: Functions for Script Settings
function SaveScriptConfig()
	ScriptConfig["SaveDate"] = os.date("%d-%m-%y")
	local file = io.open(FolderPaths.SettingsFile, "w")
	for k,v in pairs(ScriptConfig) do
		file:write(tostring(k) .. "=" .. tostring(v) .. "\n")
	end
	file:close()
end
function ResetScriptConfig()
	local file = io.open(FolderPaths.SettingsFile, "w")
	file:write("")
	file:close()
end
function LoadScriptConfig()
	if not utils.file_exists(FolderPaths.SettingsFile) then return end
	for line in io.lines(FolderPaths.SettingsFile) do
		local separator = line:find("=", 1, true)
		if separator then
			local key = line:sub(1, separator - 1)
			local value = line:sub(separator + 1)
			if value == string.format("true") then
				value = true
				elseif value == string.format("false") then
				value = false
				else value = value
			end
			if ScriptConfig[key] ~= nil then
				ScriptConfig[key] = value
			end
		end
	end
end
LoadScriptConfig()
--INFO: save settings
LocalFeatures["SaveOptions_Hotkey"] = menu.add_feature("Options Save HotKey", "toggle", LocalFeatures.HotKeyParent.id, function(feat)
	if not feat.on then
		ScriptConfig["HotkeySave_ON"] = false
		return HANDLER_POP
	end
	ScriptConfig["HotkeySave_ON"] = true
	local key = MenuKey()
	key:push_str("LCONTROL")
	key:push_str("LSHIFT")
	key:push_str("s")
	if key:is_down() then
		SaveScriptConfig()
		moist_notify("Current Settings Saved!", "MoistScript Settings")
		system.yield(1200)
	end
	system.yield(10)
	return HANDLER_CONTINUE
end)
LocalFeatures["SaveOptions_Hotkey"].on = ScriptConfig["HotkeySave_ON"]
--TODO: Script Event Listeners
M_Event["NetworkJoin"] = event.add_event_listener("player_join", function(e)
	local pid = tonumber(e.player)
	if player.is_player_valid(pid) then
		local scid = player.get_player_scid(pid)
		Session_Players[pid].name = tostring(player.get_player_name(pid))
		Session_Players[pid].scid = scid
		if FriendsList[scid] then
			FriendIsOnline = network.is_friend_online(FriendsList[scid])
			FriendIsPlaying = network.is_friend_in_multiplayer(FriendsList[scid])
			MoistNotify(FriendsList[scid]  .. "\nFriend is Online = " .. tostring(FriendIsOnline) .. "\nis in Multiplayer = " ..  tostring(FriendIsPlaying), "Friend SCID Joined", 0xff00ff00, 15)
		end
	end
	return
end)
--TODO: Script Functions
M_Func["TriggerEvent"] = function(event, pid, params)
	local Param = {}
	if type(params) ~= 'string' then
		if type(params) == 'table' then
			Param = params
			elseif type(params) == 'number' then
			Param[#Param+1] = tonumber(params)
		end
		if player.is_player_valid(pid) then
			script.trigger_script_event(event, pid, Param)
			return true
		end
	end
	return false
end
M_Func["Get_Date_Time"] = function()
	local datedm, datetm, dateDMY
	datedm = os.date()
	datetm = string.match(d, "%d%d:%d%d:%d%d")
	dateDMY = os.date("%d/%m/%y")
	return (string.format(dateDMY .. " | " .. datetm))
end
M_Func["RandomArgBuilder"] = function(ArraySize)
	local Arg = {}
	local Args = ArraySize
	Arg[1] = math.random(-1000, 99999999)
	Arg[2] = math.random(-1, 9)
	Arg[3] = math.random(-1000, 99999999)
	Arg[4] = math.random(-100, -1)
	Arg[5] = math.random(999999999, 999999999999999)
	Arg[6] = math.random(-999999999999999, -9999999)
	Arg[7] = math.random(-1, 0)
	for i = 1, Args do
		Arg[#Arg+1] = Arg[math.random(1, 7)]
	end
	return Arg
end
M_Func["File_Writer"] = function(OutputText, inc_date, Outputfile)
	local file, TextOutput
	if Outputfile == nil then
		file = io.open(FolderPaths.debugfile, "a")
		else
		file = io.open(FolderPaths.Logs .."\\" .. Outputfile, "a")
	end
	io.output(file)
	if adddate == true or adddate == nil then
		local curdate_time = tostring(M_Func["Get_Date_Time"]())
		TextOutput = string.format(curdate_time .. OutputText .. "\n")
		elseif adddate == false then
		TextOutput = OutputText .. "\n"
	end
	file:write(TextOutput)
	file:close()
end
--INFO: Player Features
--INFO: Framed Griefing
OnlineFeats["FramedSessionOrbital"] = menu.add_player_feature("Framed Session Orbital Strike", "toggle", Features.FramePlayer.id, function(feat, pid)
	local pos, Strike_pos = v3(), v3()
	if feat.on then
		local Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}
		for i = 1, #Audio_POS do
			audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
			pos.z = 2000.00			
			audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
			pos.z = -2000.00
			audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
		end
		for TargetPID = 0, 31 do
			local pos =	player.get_player_coords(TargetPID)
			audio.play_sound_from_coord(-1, "Air_Defences_Activated", pos, "DLC_sum20_Business_Battle_AC_Sounds", true, 500, true)
			system.yield(300)
		end
		system.yield(3000)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		for TargetPID = 0, 31 do
			system.yield(300)
			if player.is_player_valid(TargetPID) then
				local TarPed = player.get_player_ped(TargetPID)
				local BlaPed = player.get_player_ped(pid)
				local pos = entity.get_entity_coords(TarPed)
				offset = v3(0.0,0.0,-2000.00)
				fire.add_explosion(pos, 59, true, false, 1.5, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 60, true, false, 1.8, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
				system.yield(10)
				Strike_pos.x = math.random(-2700, 2700)
				Strike_pos.y = math.random(-3300, 7500)
				Strike_pos.z = math.random(30, 90)
				fire.add_explosion(Strike_pos, 74, true, false, 0, BlaPed)
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
				audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, "0", true, 1000, false)
				graphics.set_next_ptfx_asset("scr_xm_orbital")
				while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
					graphics.request_named_ptfx_asset("scr_xm_orbital")
					system.yield(0)
				end
				fire.add_explosion(pos, 59, false, true, 1.5, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 60, true, false, 1.8, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
				system.yield(10)
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
				graphics.set_next_ptfx_asset("scr_xm_orbital")
				while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
					graphics.request_named_ptfx_asset("scr_xm_orbital")
					system.yield(0)
				end
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
				fire.add_explosion(pos, 59, false, true, 1.5, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 60, true, false, 1.8, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
				system.yield(10)
				fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
				system.yield(10)
			end
			system.yield(1)
		end
		system.yield(5000)
		return HANDLER_CONTINUE
	end
end)
for pid = 0, #OnlineFeats["FramedSessionOrbital"].feats do
	OnlineFeats["FramedSessionOrbital"].feats[pid].on = false
end
OnlineFeats["FramedOrbital"] = menu.add_player_feature("Orbital Player: ", "action_value_str", Features.FramePlayer.id, function(feat, pid)
	local pos, Strike_pos = v3(), v3()
	local offset = v3(0.0,0.0,-2000.00)
	local SelectedPlayer = OnlineFeats["FramedOrbital"].feats[pid]:get_str_data()[OnlineFeats["FramedOrbital"].feats[pid].value+1]
	local TargetPID = M_Func["Get_PID"](SelectedPlayer)
	if not player.is_player_valid(TargetPID) then
		M_Func.SessionSetup()
		system.yield(250)
		MoistNotify("Selected Player No Longer Valid", "")
		return HANDLER_POP
	end
	local BlaPed = player.get_player_ped(pid)
	if TargetPID ~= nil then
		local TarPed = player.get_player_ped(TargetPID)
		local pos = entity.get_entity_coords(TarPed)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		fire.add_explosion(pos, 59, true, false, 1.5, BlaPed)
		fire.add_explosion(pos + v3(0.0,0.0,8.0), 60, true, false, 1.8, BlaPed)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
		fire.add_explosion(pos + v3(10.0,10.0,700.00), 50, true, false, 1.0, BlaPed)
		fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
		Strike_pos.x = math.random(-2700, 2700)
		Strike_pos.y = math.random(-3300, 7500)
		Strike_pos.z = math.random(30, 90)
		fire.add_explosion(Strike_pos, 74, true, false, 0, BlaPed)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		fire.add_explosion(pos, 59, false, true, 1.5, BlaPed)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, BlaPed)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, BlaPed)
		fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
		fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
		fire.add_explosion(pos, 59, false, true, 1.5, BlaPed)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, BlaPed)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, BlaPed)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, BlaPed)
		fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
		fire.add_explosion(pos, 50, true, false, 1.0, BlaPed)
		fire.start_entity_fire(TarPed)
	end
end)
for pid = 0, #OnlineFeats["FramedOrbital"].feats do
	OnlineFeats["FramedOrbital"].feats[pid]:set_str_data(LobbyPlayers)
	OnlineFeats["FramedOrbital"].feats[pid].value = 0
	OnlineFeats["FramedOrbital"].feats[pid].name = "Orbital Player: "
end
OnlineFeatures["CuntCannon"] = menu.add_player_feature("Cunt Cannon!", "action", Features.GriefThisCunt.id, function(feat, pid)
	local pos, Strike_pos = v3(), v3()
	local offset = v3(0.0,0.0,-2000.00)
	if player.is_player_valid(pid) then
		local myped = player.get_player_ped(player.player_id())
		local pped = player.get_player_ped(pid)
		local pos = entity.get_entity_coords(pped)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		fire.add_explosion(pos, 59, true, false, 1.5, myped)
		fire.add_explosion(pos + v3(0.0,0.0,8.0), 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + v3(10.0,10.0,700.00), 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		Strike_pos.x = math.random(-2700, 2700)
		Strike_pos.y = math.random(-3300, 7500)
		Strike_pos.z = math.random(30, 90)
		fire.add_explosion(Strike_pos, 74, true, false, 0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.yield(0)
		end
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.start_entity_fire(pped)
	end
	return HANDLER_POP
end)
for pid = 0, #OnlineFeatures["CuntCannon"].feats do
	OnlineFeatures["CuntCannon"].feats[pid].name = "Cunt Kill Cannon!"
end
--INFO: Script Events
OnlineFeats["NetworkBail"] = menu.add_player_feature("Network Bail Kick", "action", Features.RemovePlayer.id, function(feat, pid)
	local events = {0x493FC6BB,0x9C050EC}
	for i = 1, #events do
		M_Func["TriggerEvent"](events[i], pid, {pid, script.get_global_i(1893551 + (1 + (pid * 599)) + 510)})
		system.yield(100)
	end
	system.yield(5000)
	return HANDLER_POP
end)
for pid= 0, #OnlineFeats["NetworkBail"].feats do
	OnlineFeats["NetworkBail"].feats[pid].hidden = false
end
OnlineFeatures["CEOMoney"] = menu.add_player_feature("Loop Payment: ", "value_str", Features.CEO.id, function(feat, pid)
	if feat.on then	
		if feat.value == 0 then
			if script.get_global_i(1893551 + (1 + (pid * 599)) + 10) == script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {player.player_id(), 10000, -1292453789, 0, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(16000)
				elseif script.get_global_i(1893551 + (1 + (pid * 599)) + 10) ~= script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {pid, 10000, -1292453789, 0, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(16000)
			end
			return HANDLER_CONTINUE
		end
		if feat.value == 1 then
			if script.get_global_i(1893551 + (1 + (pid * 599)) + 10) == script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {player.player_id(), 15000, -1292453789, 0, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(16000)
				elseif script.get_global_i(1893551 + (1 + (pid * 599)) + 10) ~= script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {pid, 15000, -1292453789, 0, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(16000)
			end
			return HANDLER_CONTINUE
		end
		if feat.value == 2 then
			if script.get_global_i(1893551 + (1 + (pid * 599)) + 10) == script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {player.player_id(), 20000, 198210293, 1, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(121000)
				elseif script.get_global_i(1893551 + (1 + (pid * 599)) + 10) ~= script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {pid, 20000, 198210293, 1, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(121000)
			end
			return HANDLER_CONTINUE
		end
		if feat.value == 3 then
			if script.get_global_i(1893551 + (1 + (pid * 599)) + 10) == script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {player.player_id(), 30000, 198210293, 1, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(121000)
				elseif script.get_global_i(1893551 + (1 + (pid * 599)) + 10) ~= script.get_global_i(1893551 + (1 + (player.player_id() * 599)) + 10) then
				if not player.is_player_valid(pid) then return end
				M_Func["TriggerEvent"](0x70AB59D5, pid, {pid, 30000, 198210293, 1, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
				system.yield(121000)
			end
			return HANDLER_CONTINUE
		end
		if not player.is_player_valid(pid) then return end
		M_Func["TriggerEvent"](0x70AB59D5, pid, {player.player_id(), 15000, -1292453789, 0, script.get_global_i(1893551 + (1 + (pid * 599)) + 510), script.get_global_i(1921039 + 9), script.get_global_i(1921039 + 10)})
		system.yield(16000)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
for pid = 0, #OnlineFeatures["CEOMoney"].feats do
	OnlineFeatures["CEOMoney"]:set_str_data({"10k CEO Money","15k CEO Money","20k CEO Money","30k CEO Money"})
	OnlineFeatures["CEOMoney"].feats[pid].value = 0
	OnlineFeatures["CEOMoney"].feats[pid].on = false
	OnlineFeatures["CEOMoney"].feats[pid].hidden = false
end


OnlineFeatures["OTR"] = menu.add_player_feature("Off The Radar", "toggle", Features.ScriptEvents.id, function(feat, pid)
	while feat.on do
		if not player.is_player_valid(pid) then return end
		M_Func["TriggerEvent"](-391633760, pid, {pid, utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1893551 +(1 + (pid * 599)) + 510)})
		system.yield(25000)
	end
	return HANDLER_POP
end)
for pid = 0, #OnlineFeatures["OTR"].feats do
	OnlineFeatures["OTR"].feats[pid].on = false
	OnlineFeatures["OTR"].feats[pid].hidden = false
	OnlineFeatures["OTR"].feats[pid].name = "Off The Radar"
end

OnlineFeatures["NOCOPS"] = menu.add_player_feature("Cops Turn a Blind Eye", "action", Features.ScriptEvents.id, function(feat, pid)
	if not player.is_player_valid(pid) then return end
	M_Func["TriggerEvent"](0x66B0F59A, pid, {pid, utils.time() - 60, utils.time(), script.get_global_i(2810287 + 4628), 1, script.get_global_i(1893551 +(1 + (pid * 599)) + 510)})
	system.yield(0)
	return HANDLER_POP
end)
for pid = 0, #OnlineFeatures["NOCOPS"].feats do
	OnlineFeatures["NOCOPS"].feats[pid].hidden = false
	OnlineFeatures["NOCOPS"].feats[pid].name = "Cops Turn a Blind Eye"
end
OnlineFeatures["SE_Crash"] = menu.add_player_feature("Send Event: ", "action_value_str", Features.RemovePlayer.id, function(feat, pid)
	if pid == player.player_id() then
	MoistNotify("Just Prevented you From Crashing Yourself!", "")
	elseif pid ~= player.player_id() then
		local events = {69874647,924535804,1494472464,-1991317864,1902624891,127278285,-195247709,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520}
		if feat.value == 0 then
			local args = {}
			local mult, pos = 10^0, player.get_player_coords(pid)
			args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
			for i = 1, #events do
				for NPid = 0, 31 do
					if player.is_player_valid(NPid) then
						pos = player.get_player_coords(pid)
						args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
						args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
						args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
						system.yield(100)
						M_Func["TriggerEvent"](events[i], pid, args)
					end
				end
				system.yield(500)
			end
			elseif feat.value == 1 then
			local args = {}
			local stat = {4,24,25,26,27,53,56,57,58,59,90,171,189,272,287}
			for i = 1, #stat do
				args[#args+1]  = script.get_global_i(1853131 + (1 + (pid * 888)) + 205 + stat[i])
			end
			for y = 1, #events do
				M_Func["TriggerEvent"](events[y], pid, args)
				system.yield(5000)
			end
			elseif feat.value == 2 then
			local args = {}	
			local Arguments = M_Func["RandomArgBuilder"](39)
			for i = 1, #events do 
				M_Func["TriggerEvent"](events[i], pid, Arguments)
				system.yield(5000)
			end
			elseif feat.value == 3 then
			local args, moistevents = {{1, -4640169, 0, 0, 0, -36565476, -53105203},{23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423},{pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0}}, {0x7de8cac0,0x39624029,0xad63290e,0x285ddf33}
			local Arguments = M_Func["RandomArgBuilder"](39)
			for i = 1, #moistevents do
				for y = 1, #args do
					M_Func["TriggerEvent"](moistevents[i], pid, args[y])
				end
				system.yield(5000)
			end
		end
	end
	system.yield(5000)
	return HANDLER_POP
end)
for pid= 0, #OnlineFeatures["SE_Crash"].feats do
	OnlineFeatures["SE_Crash"].feats[pid]:set_str_data({"Vector Crash","Stat Crash","Rando Crash","Moist Crash"})
end
OnlineFeatures["VehSyncCrash"] = menu.add_player_feature("Lester Cummy WindSock Crash", "action", Features.RemovePlayer.id, function(feat, pid)
	local offset = v3(0.0,0.0,90.00)
	local veh, lester
	local model = gameplay.get_hash_key("ig_lestercrest_2")
	streaming.request_model(model)
	while (not streaming.has_model_loaded(model)) do
		system.yield(10)
	end
	local y = #SpawnedShit + 1
	SpawnedShit[y] = ped.create_ped(6, model, player.get_player_coords(pid) + offset, 0.0, true, false)
	lester = SpawnedShit[y]
	streaming.request_model(941494461)
	while not streaming.has_model_loaded(941494461) do
		system.yield(0)
	end
	local i = #SpawnedShit + 1
	SpawnedShit[i] = vehicle.create_vehicle(941494461, player.get_player_coords(pid) + offset, 1.0, true, false)
	veh = SpawnedShit[i]
	ped.set_ped_into_vehicle(SpawnedShit[y], SpawnedShit[i], -1)
	network.request_control_of_entity(SpawnedShit[i])
	system.yield(10)
	network.request_control_of_entity(SpawnedShit[i])
	streaming.request_model(-310772260)
	while (not streaming.has_model_loaded(-310772260)) do
		system.yield(0)
	end
	network.request_control_of_entity(SpawnedShit[i])
	system.yield(10)
	vehicle.set_vehicle_engine_on(SpawnedShit[i], true, true, false)
	system.yield(100)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_forward_speed(SpawnedShit[i], 30.00)
	system.yield(100)
	system.yield(10)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], true)
	system.yield(1000)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], false)
	system.yield(1000)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], true)
	system.yield(500)
	network.request_control_of_entity(SpawnedShit[i])	
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], false)
	system.yield(500)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], true)
	streaming.set_model_as_no_longer_needed(941494461)
	streaming.set_model_as_no_longer_needed(-310772260)
	streaming.set_model_as_no_longer_needed(model)
	entity.set_entity_as_no_longer_needed(SpawnedShit[i])
	return HANDLER_POP	
end)
for pid= 0, #OnlineFeatures["VehSyncCrash"].feats do
	OnlineFeatures["VehSyncCrash"].feats[pid].hidden = false
end
OnlineFeatures["VehSyncCrash2"] = menu.add_player_feature("Use Ruiner Crash & Bail to Space", "action", Features.RemovePlayer.id, function(feat, pid)
	local offset = v3(0.0,0.0,90.00)
	local veh, lester
	local myped = player.get_player_ped(player.player_id())
	streaming.request_model(941494461)
	while not streaming.has_model_loaded(941494461) do
		system.yield(0)
	end
	local i = #SpawnedShit + 1
	SpawnedShit[i] = vehicle.create_vehicle(941494461, player.get_player_coords(pid) + offset, 1.0, true, false)
	veh = SpawnedShit[i]
	ped.set_ped_into_vehicle(myped, SpawnedShit[i], -1)
	network.request_control_of_entity(SpawnedShit[i])
	system.yield(10)
	network.request_control_of_entity(SpawnedShit[i])
	streaming.request_model(-310772260)
	while (not streaming.has_model_loaded(-310772260)) do
		system.yield(0)
	end
	network.request_control_of_entity(SpawnedShit[i])
	system.yield(10)
	vehicle.set_vehicle_engine_on(SpawnedShit[i], true, true, false)
	system.yield(100)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_forward_speed(SpawnedShit[i], 30.00)
	system.yield(100)
	system.yield(10)
	network.request_control_of_entity(SpawnedShit[i])
	vehicle.set_vehicle_parachute_model(SpawnedShit[i], -310772260)
	vehicle.set_vehicle_parachute_active(SpawnedShit[i], true)
	system.yield(10000)
	ped.clear_ped_tasks_immediately(myped)
	system.yield(100)
	entity.set_entity_coords_no_offset(myped, v3(-7534.559082,-14700.062500,10959.003906))
	streaming.set_model_as_no_longer_needed(941494461)
	streaming.set_model_as_no_longer_needed(-310772260)
	entity.set_entity_as_no_longer_needed(SpawnedShit[i])
	system.yield(40000)
	entity.delete_entity(veh)
	SpawnedShit[i] = nil
	return HANDLER_POP	
end)
for pid= 0, #OnlineFeatures["VehSyncCrash2"].feats do
	OnlineFeatures["VehSyncCrash2"].feats[pid].hidden = false
end
OnlineFeatures["REM_CEO"] = menu.add_player_feature("Remove CEO: ", "action_value_str", Features.CEO.id, function(feat, pid)
	local events = {-764524031,248967238}
	local args = {{1, 1, 6},{0, 1, 6, 0},{0, 1, 5},{0, 1, 5, 0}}
	if feat.value == 0 then
		M_Func["TriggerEvent"](events[2], pid, args[1])
		system.yield(5000)
		M_Func["TriggerEvent"](events[2], pid, args[2])
		system.yield(5000)
		elseif feat.value == 1 then
		M_Func["TriggerEvent"](events[2], pid, args[3])
		system.yield(5000)
		elseif feat.value == 2 then
		M_Func["TriggerEvent"](events[1], pid, args[4])
		system.yield(5000)
	end
	return HANDLER_POP
end)
for pid= 0, #OnlineFeatures["REM_CEO"].feats do
	OnlineFeatures["REM_CEO"].feats[pid]:set_str_data({"Terminate","Dismiss","BAN"})
end
OnlineFeatures["SendCops"] = menu.add_player_feature("Dispatch Cops to Player Location", "action", Features.Troll.id, function(feat, pid)
	local pid, nPid
	local nPid = native.call(0x9EC6603812C24710, pid):__tointeger()
	system.yield(1000)
	native.call(0xDB172424876553F4, nPid, true)
	system.yield(1000)
end)
for pid= 0, #OnlineFeatures["SendCops"].feats do
	OnlineFeatures["SendCops"].feats[pid].name = "Dispatch Cops to Player Location"
end
--TODO: Local Script Features
LocalFeatures.wetnessframe= menu.add_feature("Make My Ped Wet! :P", "toggle", LocalFeatures.Self_Ped.id, function(feat)
	while feat.on do
		local pid = native.call(0x4F8644AF03D0E0D6):__tointeger()
		system.yield(1000)
		local playerPed = native.call(0x43A66C31C68491C0, pid):__tointeger()
		system.yield(1000)
		native.call(0x44CB6447D2571AA0, playerPed, 100.0)
		system.yield(1000)
		native.call(0xB5485E4907B53019, playerPed)
		system.yield(1000)
	end
	return HANDLER_POP
end)
LocalFeatures.wetnessframe.on = false
LocalFeatures.IAMACOP = menu.add_feature("Turn Me into a Cop (Cops Act like you are!)", "action", LocalFeatures.Self_Ped.id, function(feat)
	local pid = native.call(0x4F8644AF03D0E0D6):__tointeger()
	system.yield(1000)
	local playerPed = native.call(0x43A66C31C68491C0, pid):__tointeger()
	system.yield(1000)
	native.call(0xBB03C38DD3FB7FFD, playerPed, true)
	system.yield(1000)
end)
LocalFeatures.IAMACOP.name = "Turn Me into a Cop (Cops Act like you are!)"

LocalFeatures.UlWeClip = menu.add_feature("Weapon Clip: ", "action_value_str", LocalFeatures.Self_WeaponStuff.id, function(feat)
	if feat.value == 0 then
		local pid = native.call(0x4F8644AF03D0E0D6):__tointeger()
		system.yield(1000)
		local playerPed = native.call(0x43A66C31C68491C0, pid):__tointeger()
		system.yield(1000)
		native.call(0x183DADC6AA953186, playerPed, true)
		elseif feat.value == 1 then
		local pid = native.call(0x4F8644AF03D0E0D6):__tointeger()
		system.yield(1000)
		local playerPed = native.call(0x43A66C31C68491C0, pid):__tointeger()
		system.yield(1000)
		native.call(0x183DADC6AA953186, playerPed, false)
	end
	return HANDLER_POP
end)
LocalFeatures.UlWeClip:set_str_data({"Unlimited","Standard"})
Features.Modulelists = menu.add_feature("Custom Lists for Features", "parent", Features.LocalModules.id)
Features.Modules_PlayerBar = menu.add_feature("Load PlayerBar Module", "toggle", Features.LocalModules.id, function(feat)
	if not feat.on then
		ScriptConfig["LoadPlayerBar"] = false
		return HANDLER_POP
	end
	ScriptConfig["LoadPlayerBar"] = true
	local file = FolderPaths.Config .. "\\MoistScript_PlayerBar_Module.lua"
	if MoistScript_PlayerBar_Module == nil then
		if not utils.file_exists(file) then return end
		f = assert(loadfile(file)) return f()
	end
	return HANDLER_POP
end)
Features.Modules_PlayerBar.on = ScriptConfig["LoadPlayerBar"]
Features.Modules_Pedlist = menu.add_feature("Load Ped List", "toggle", Features.Modulelists.id, function(feat)
	if not feat.on then
		ScriptConfig["LoadPedList"] = false
		return HANDLER_POP
	end
	ScriptConfig["LoadPedList"] = true
	if not utils.file_exists(FolderPaths.Config .. "\\pedlist.ini") then return end
	for line in io.lines(FolderPaths.Config .. "\\pedlist.ini") do NpcList[#NpcList + 1] = line end
	return HANDLER_POP
end)
Features.Modules_Pedlist.on = ScriptConfig["LoadPedList"]
Features.Modules_Vehlist = menu.add_feature("Load Vehicle List", "toggle", Features.Modulelists.id, function(feat)
	if not feat.on then
		ScriptConfig["LoadVehList"] = false
		return HANDLER_POP
	end
	ScriptConfig["LoadVehList"] = true
	if not utils.file_exists(FolderPaths.Config .. "\\vehlist.ini") then return end
	for line in io.lines(FolderPaths.Config .. "\\vehlist.ini") do NpcVehList[#NpcVehList + 1] = line end
	return HANDLER_POP
end)
Features.Modules_Vehlist.on = ScriptConfig["LoadVehList"]
--TODO: Auto Execute Functions
M_Func.SessionSetup()
M_Func["SessionSetup"]()
--TODO: On Exit Shit
event.add_event_listener("exit", function()
	--clean up shit
	for i = 1, #SpawnedShit do
		if entity.is_an_entity(SpawnedShit[i]) then
			entity.delete_entity(SpawnedShit[i])
		end
	end
end)
