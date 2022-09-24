--[[
	Credits & Thanks to Kektram for all his support, help and coding Advice
	Thanks to haekkzer for his help and advice over time i was a tester for the menu
	Big thanks goes Proddy for all his coding help advice and work to get shit done which without him alot of this
	script would  not exist!
	
	
	
	::karen detections info::
	
	
	Manager is desync protex
	
	Ceo for kicking the host
	
	operations vp for kicking another player
	
	regional director (probably)
	for kicking the script host
	::--------------------------::
	
--]]
if MoistScript then
	menu.notify("MoistScript Has Been Loaded Already!", "", 25, 0xff0000ff)
	menu.notify("Aborting This Load Attempt!", "", 25, 0xff0000ff)
	return
end
MoistScript = "2.0.6.8"
math.randomseed(utils.time_ms())
Paths, Settings, threads, kick_param, Teleport_Features, tele_presets = {}, {}, {}, {}, {}, {}
local Passive_trackerOUT, Passive_trackerIN, ChatEventID, joining_players_logger, Join_Event_Check
Modders_DB = {{flag = {}, flags = {}, ismod = {}}}
DebugText = ""
Kicked_Players, Kicked_Player, MyFriends = {}, {}, {}
SessionPlayers = {{pid = {}, Name = {}, sessionname = {}, Tags = {}, tags = {}, Scid = {}}}
Session_Combat = {{name = {}, kills = {}, killed = {}}}
AttachedCunt={}AttachedCunt2={}
escort, escortveh, spawned_cunts, groupIDs, allpeds, allveh, allobj, allpickups, alkonost, kosatka, scids, spawned_cunt1, spawned_cunt2, spawned_cunt3, spawned_cunt,  EntityHash, EntityHash2, Thread2Id, Thread1Id, Esp_pid, markID, boobs, boobveh = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
SpawnedNPC, SpawnedNPCV = {}, {}
lesveh, lester, lester_group = {}, {}, {}
lester, huntv = {}, {}
local BlipIDs <const>, zones <const> = {}, {"BANNING", "LAGO", "BRADT", "PBLUFF", "NCHU", "BHAMCA", "HARMO", "LACT", "PROL", "OCEANA", "GOLF", "STRAW", "MIRR", "EAST_V", "NOOSE", "RANCHO", "MTCHIL", "GRAPES", "HORS", "TATAMO", "TONGVAH", "TEXTI", "BEACH", "TERMINA", "RGLEN", "ISHEISTZONE", "PALMPOW", "OBSERV", "GALLI", "BANHAMCA", "LOSPUER", "CCREAK", "DELPE", "MORN", "ZQ_UAR", "MOVIE", "EBURO", "ZP_ORT", "SLAB", "RTRAK", "ZANCUDO", "TONGVAV", "WVINE", "WINDF", "SANCHIA", "PALCOV", "BRADP", "HUMLAB", "VINE", "TONGVAH", "VESP", "MTJOSE", "DOWNT", "DTVINE", "PROCOB", "LMESA", "STAD", "LAGO", "SKID", "SANDY", "LDAM", "DELSOL", "ROCKF", "CALAFB", "GREATC", "RICHM", "VCANA", "ALTA", "JAIL", "PALHIGH", "DELBE", "DELBE", "OCEANA", "PALFOR", "PALETO", "DESRT", "GALFISH", "ELGORL", "ARMYB", "AIRP", "CHAMH", "LEGSQU", "PBOX", "DAVIS", "HAWICK", "CHIL", "CHU", "ELYSIAN", "BAYTRE", "ALAMO", "BURTON", "KOREAT", "CMSW", "CYPRE", "MTGORDO", "CANNY", "MURRI"}
scidN = 0
RecentPlyr = {}
Players = {
    {
        name = {}, 
        isFriend = {}, 
        orbnotify = {}, 
        orbnotify2 = {}, 
        isHost = {}, 
        isScHost = {}, 
        isTyping = {}, 
        isPaused = {}, 
        JoinTime = {}, 
        ActiveMissile = {}, 
        isRC = {}, 
        isOTR = {},
		Spectatable = {},
		isNotifSpec = {},
		OTRTNotify = {},
		OTR_Start = {},
        OTRBlipID = {}, 
        BlipPID = {}, 
        pulse = {}, 
        PedSpawned = {}, 
        bounty = {}, 
        bountyvalue = {}, 
        isUnDead = {}, 
        isPassive = {}, 
        isTalking = {}, 
        flag = {}, 
        flags = {}, 
        ismod = {}, 
        isgod = {}, 
        isKicked = {}, 
        KickedCount = {}, 
        isvgod = {}, 
        PlayerGodMode = {}, 
        PlayerVehGodMode = {}, 
        isint = {}, 
        Interiorname = {}, 
        isDead = {}, 
        isDamagedbY = {}, 
        isvis = {}, 
        speedK = {}, 
        speedM = {}, 
        InteriorThread = {}, 
        IsGodThread = {}, 
        IsGodThread1 = {},
        IsFlagRemNotif = {},
		Zone = {},
		intID = {},
		onlinecheck = {},
		online_interior = {},
		onlineintID = {},
	}
}
--local function MoistScript_Main()
Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
function Cur_Date_Time()
	local d, dtime, dt
	d = os.date()
	dtime = string.match(d, "%d%d:%d%d:%d%d")
	dt = os.date("%d/%m/%y")
	return (string.format("[" .. dt .. "]" .. "[" .. dtime .. "]"))
end
function Debug_Out(text, adddate, file_name)
	local file, Text_Out
	if file_name == nil then
		file = io.open(Root .. "\\lualogs\\Moists_debug.log", "a")
		else
		file = io.open(Root .. "\\lualogs\\" .. file_name, "a")
	end
	if adddate == true or adddate == nil then
		local curdate_time = tostring(Cur_Date_Time())
		Text_Out = string.format(curdate_time .. text .. "\n")
		elseif adddate == false then
		Text_Out = text .. "\n"
	end
	io.output(file)
	io.write(Text_Out)
	io.close()
end
--local Menu Features
globalFeatures = {}
--local Menu Features
globalFeatures.parent = menu.add_feature("MoistScript 2.0.6.8", "parent", 0).id
globalFeatures.Online_Session = menu.add_feature("Online Features", "parent", globalFeatures.parent).id
globalFeatures.Tools = menu.add_feature("Testing Tools", "parent", globalFeatures.parent).id
logownevents = menu.add_feature("Log Own SE", "toggle", globalFeatures.Tools)
logownevents["on"] = false
Trigger_Event = function(event, pid, ...)
	Trigger_Event_2(event, pid, ...)
end
Trigger_Event_2 = function(event, pid, ...)
	if player.is_player_valid(pid) then
		system.yield(100)
		if player.is_player_valid(pid) then
			Print(tostring(1 << pid ) .. ", " .. tostring(event) .. ", " .. tostring(...))
			system.yield(25)
			if player.is_player_valid(pid) then
				system.yield(25)
				script.trigger_script_event_2(1 << pid, event, ...)
			end
		end
	end
end
function MoistScript_SelfCheck()
	local Error = false
	local Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
	local FilesCheck = {"\\scripts\\MoistsLUA_cfg\\interiors.lua", "\\scripts\\MoistsLUA_cfg\\zones.lua", "\\scripts\\MoistsLUA_cfg\\Moist_KickParam.ini", "\\scripts\\MoistsLUA_cfg\\Moist_Kicks.ini", "\\scripts\\MoistsLUA_cfg\\online_interiors.lua"}
	for i = 1, #FilesCheck do
		local file = Root .. FilesCheck[i]
		if not utils.file_exists(file) then
			if Error == false then
				menu.notify("Missing Script Files!!!\nScript Execution ABORTED!!!", "MoistScript\nSelf Check FAILURE ! ! !", 15, 0xffffff00)
				Error = true
			end
			menu.notify(FilesCheck[i], "SELF CHECK FAILURE ! ! !\nMissing File:", 25, 0xffffff00)
		end
	end
	if Error == true then
		return ("Fail")
		else
		return ("Pass")
	end
end
function SettingsReset()
	local Root = (utils.get_appdata_path("PopstarDevs", "2Take1Menu") ..  "\\scripts\\MoistsLUA_cfg" .. "\\MoistsScript_settings.ini")
	local file = io.open(Root, "w+")
	file:write(tostring("MoistScript=2.0.6.8") .. "\n")
	todaysdate = os.date("%d-%m-%y")
	file:write(tostring("DateSettingsSaved=" .. todaysdate) .. "\n")
	file:write(tostring("PlayerRCHook=false") .. "\n")
	file:write(tostring("Blacklist_Mark=false") .. "\n")
	file:write(tostring("osd_My_speed2=false") .. "\n")
	file:write(tostring("blipGodcheckvalue=1") .. "\n")
	file:write(tostring("osd_My_speed1=false") .. "\n")
	file:write(tostring("chat_debug=false") .. "\n")
	file:write(tostring("PlayerGodCheckVersion=1") .. "\n")
	file:write(tostring("NotifyColorADefault=255") .. "\n")
	file:write(tostring("global_func.thermal_stat_switch_hotkey=false") .. "\n")
	file:write(tostring("Notify_Me=false") .. "\n")
	file:write(tostring("spam_wait=1000") .. "\n")
	file:write(tostring("playerlist_loop=0") .. "\n")
	file:write(tostring("global_func.mk1boostrefill=false") .. "\n")
	file:write(tostring("OSD.Player_bar=false") .. "\n")
	file:write(tostring("GodCheckNotif=false") .. "\n")
	file:write(tostring("RPG_HOTFIRE=false") .. "\n")
	file:write(tostring("NotifyColorDefault=0xffffffff") .. "\n")
	file:write(tostring("lag_out=false") .. "\n")
	file:write(tostring("ScriptEvent_delay=0") .. "\n")
	file:write(tostring("Add_Blips=false") .. "\n")
	file:write(tostring("RecentPlayer_Notify=false") .. "\n")
	file:write(tostring("Combat_Tracker_ON=false") .. "\n")
	file:write(tostring("Combat_Tracker_Notify=false") .. "\n")
	file:write(tostring("OTR_Blips=false") .. "\n")
	file:write(tostring("force_wPara=false") .. "\n")
	file:write(tostring("Combat_Tracker_DebugLog=false") .. "\n")
	file:write(tostring("Blacklist_kick=false") .. "\n")
	file:write(tostring("GodCheck=false") .. "\n")
	file:write(tostring("force_pPara=false") .. "\n")
	file:write(tostring("force_wBPH=false") .. "\n")
	file:write(tostring("New_Notifys=false") .. "\n")
	file:write(tostring("no_traffic=false") .. "\n")
	file:write(tostring("MoistScript=2.0.6.8") .. "\n")
	file:write(tostring("NotifyColorGDefault=255") .. "\n")
	file:write(tostring("Chat_Command=false") .. "\n")
	file:write(tostring("loop_feat_delay=0") .. "\n")
	file:write(tostring("OSDDebug2=false") .. "\n")
	file:write(tostring("global_func.mk2boostrefill=false") .. "\n")
	file:write(tostring("PlayerTagginghook=false") .. "\n")
	file:write(tostring("NotifyColorBDefault=255") .. "\n")
	file:write(tostring("Weapon_TargetDot=false") .. "\n")
	file:write(tostring("Combat_Tracker_Value=2") .. "\n")
	file:write(tostring("orbitalProxyBlip=false") .. "\n")
	file:write(tostring("global_func.veh_rapid_fire=false") .. "\n")
	file:write(tostring("ESP_Enhancments=false") .. "\n")
	file:write(tostring("missilehook=false") .. "\n")
	file:write(tostring("OSD.modvehspeed_osd=false") .. "\n")
	file:write(tostring("chat_log=false") .. "\n")
	file:write(tostring("spec_osd=false") .. "\n")
	file:write(tostring("osd_date_time=false") .. "\n")
	file:write(tostring("no_peds=false") .. "\n")
	file:write(tostring("playerscriptinfo=false") .. "\n")
	file:write(tostring("Weapon_Recticle=false") .. "\n")
	file:write(tostring("global_func.rapidfire_hotkey1=false") .. "\n")
	file:write(tostring("EWO_TRYHARD=false") .. "\n")
	file:write(tostring("force_pBPH=false") .. "\n")
	file:write(tostring("Auto_Off_RAC=false") .. "\n")
	file:write(tostring("PlayerCheckVersion=2") .. "\n")
	file:write(tostring("RagDollHotKey=false") .. "\n")
	file:write(tostring("NotifyColorRDefault=255") .. "\n")
	file:write(tostring("Blacklist_ON=false") .. "\n")
	file:write(tostring("WeaponFastSwitch=false") .. "\n")
	file:write(tostring("aimDetonate_control=false") .. "\n")
	file:write(tostring("blipGodcheck=false") .. "\n")
	file:write(tostring("counter_Hotkey=false") .. "\n")
	file:close()
	menu.notify("Default Settings Created!!\nAny Previous Settings Reset to OFF", "MoistScript Settings", 8, 0xffffffff)
	menu.notify("Please Reset Script State in Scripts To Apply", "MoistScript Settings", 8, 0xffffffff)
end
function Load_Moist()
	local Root = (utils.get_appdata_path("PopstarDevs", "2Take1Menu") ..  "\\scripts\\MoistsLUA_cfg" .. "\\MoistsScript_settings.ini")
	if not utils.file_exists(Root) then
		menu.notify("No Saved Settings Found!!", "MoistScript Settings", 8, 0xffffff00)
		SettingsReset()
	end
end
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
utils.make_dir(Paths.Root  .. "\\Blacklist")
utils.make_dir(Paths.Root  .. "\\lualogs")
utils.make_dir(Paths.Root  .. "\\scripts\\MoistsLUA_cfg")
Paths.scidFile = Paths.Root .. "\\Blacklist\\scid.ini"
Paths.Cfg = Paths.Root .. "\\scripts\\MoistsLUA_cfg"
Paths.Settings = Paths.Cfg .. "\\MoistsScript_settings.ini"
Paths.Logs = Paths.Root .. "\\lualogs"
Paths.debugfile = Paths.Logs .. "\\Moists_debug.log"
Paths.Player_DB = Paths.Logs .. "\\PlayerDB.txt"
Paths.kickdata = Paths.Root  .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks.ini"
Paths.kickparam = Paths.Root .. "\\scripts\\MoistsLUA_cfg\\Moist_KickParam.ini"
Paths.interiorpos = Paths.Cfg .. "\\interiors.lua"
Paths.onlineinterior = Paths.Cfg .. "\\online_interiors.lua"
Paths.Spamtxt_Data = Paths.Cfg .. "\\Moists_Spamset.ini"
Paths.Teleport_Data = Paths.Cfg .. "\\Moists_Teleset.ini"
Paths.tempchat = Paths.Cfg .. "\\TempChatSpam.ini"

GetMyFriends = function()
	for FriD = 0, network.get_friend_count()-1 do
		local FrName = network.get_friend_index_name(FriD)
		local FrSCID = network.get_friend_scid(FrName)
		MyFriends[FrSCID] = {FriD, FrName}
	end
end
GetMyFriends()
function Get_ModderFlag_Text(pid)
	local flagtext = ""
	local texts <const> = {}
	local flags = player.get_player_modder_flags(pid)
	Modders_DB[pid].flags = flags
	for i = 0, 63 do
		texts[#texts + 1] = flags & 1 << i == 1 << i  and player.get_modder_flag_text(1 << i) or nil
	end
	for i = 1, #texts do
		flagtext = flagtext .. " | " .. tostring(texts[i])
	end
	return flagtext
end
local Modder_EventLog = event.add_event_listener("modder", function(e)
    if e["player"] ~= nil then
        local pid = e["player"]
		local name = player.get_player_name(pid)
		local flagtext = Get_ModderFlag_Text(pid)
        if not Players[pid].IsFlagRemNotif then
            moist_notify("[Modder Detected] " .. tostring(pid) .. " : " .. tostring(name).. " | " .. flagtext, "", 0xff0000ff)
            Debug_Out(string.format("[Modder]: " .. tostring(name).. " [Modder Flags]: " .. flagtext))
            Players[pid].IsFlagRemNotif = true
		end
	end
    return
end)
function Get_PID(name)
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			if name == player.get_player_name(pid) then
				return tonumber(pid)
			end
		end
	end
end
function joined_data(text)
    local d, dtime, dt, CurDateTime, file
    d = os.date()
    dtime = string.match(d, "%d%d:%d%d:%d%d")
    dt = os.date("%d/%m/%y")
    CurDateTime = (string.format(dt .. "|" .. dtime .. "|"))
    file = io.open(Paths.Logs .. "\\PlayerJoins.txt", "a")
    io.output(file)
	file:write("\n" .. CurDateTime .. text)
    io.close()
end
function joined_csv(text)
    local d, dtime, dt, CurDateTime, file
    d = os.date()
    dtime = string.match(d, "%d%d:%d%d:%d%d")
    dt = os.date("%d/%m/%Y")
    local Date = os.date("%d-%m-%y")
    if not utils.file_exists(Paths.Logs .. "\\PlayerJoins" .. Date .. ".csv") then
        Create_Csv()
        -- system.wait(10)
	end
    CurDateTime = (string.format(dt .. ',' .. dtime .. ','))
    file = io.open(Paths.Logs .. "\\PlayerJoins" .. Date .. ".csv", "a")
    io.output(file)
    file:write(CurDateTime .. text .. "\n")
	file:close()
end
function Create_Csv()
    local Date = os.date("%d-%m-%y")
    local file = (Paths.Logs .. "\\PlayerJoins" .. Date .. ".csv")
    if not utils.file_exists(file) then
        io.open(file, "a")
        io.output(file)
        io.write("Date,Time,Player Name,SCID HEX,PID,SCID,Player Network Hash,Decimal Host Token,Hex Host Token,Host Priority,Decimal IP,Translated IP\n")
        io.close()
	end
end
function left_csv(text)
    local d, dtime, dt, CurDateTime, file
    d = os.date()
    dtime = string.match(d, "%d%d:%d%d:%d%d")
    dt = os.date("%d/%m/%Y")
    local Date = os.date("%d-%m-%y")
    if not utils.file_exists(Paths.Logs .. "\\PlayerLeft" .. Date .. ".csv") then
        Create_Leave_Csv()
        -- system.wait(10)
	end
    CurDateTime = (string.format(dt .. ',' .. dtime .. ','))
    file = io.open(Paths.Logs .. "\\PlayerLeft" .. Date .. ".csv", "a")
    io.output(file)
    file:write(CurDateTime .. text .. "\n")
	file:close()
end
function Create_Leave_Csv()
    local Date = os.date("%d-%m-%y")
    local file = (Paths.Logs .. "\\PlayerLeft" .. Date .. ".csv")
    if not utils.file_exists(file) then
        io.open(file, "a")
        io.output(file)
        io.write("Date,Time,Player Name\n")
        io.close()
	end
end
function playerDB(pid, ip)
    if player.is_player_valid(pid) then
        local scid, name, token, file1, file2, tokeen
        scid = player.get_player_scid(pid)
        name = player.get_player_name(pid)
        token = string.format("%x", player.get_player_host_token(pid))
        file1 = io.open(Paths.Logs .. "\\PlayerDB.txt", "a")
        io.output(file1)
        tokeen = tostring(token)
        file1:write("\n" .. tokeen .. "|" .. name .. ", " .. scid .. "|" .. name .. ", " .. ip)
        file1:close()
		--TODO: Remove Maybe? 
        file2 = io.open(Paths.Logs .. "\\IP_LIST.txt", "a")
        io.output(file2)
        file2:write(ip .. "\n")
        file2:close()
	end
end
local Mypid, kickedpid, kickedgone
kickedgone = false
Kick_Kicked = false
LastTenLeaves = {}
Session_Slots =  {}
testpos = {}
for pid = 0, 31 do
	Session_Slots[pid+1] = false
end
for pid = 0, 31 do
	testpos[pid+1] = 0
end
SessionTracker = event.add_event_listener("player_leave", function(e)
	local player_left = {}
	local pid = e["player"]
	Session_Slots[pid+1] = false
	testpos[pid+1] = 0
	DebugText = ""
	left_csv(tostring(pid) .. ": " ..tostring(SessionPlayers[pid].sessionname))
	if #LastTenLeaves > 5 then
		for i = 2, #LastTenLeaves, 1 do
			player_left[#player_left+1] = LastTenLeaves[i]
		end
		LastTenLeaves = player_left
	end
	LastTenLeaves[#LastTenLeaves+1] = {pid,tostring(SessionPlayers[pid].sessionname)}
	if pid == Mypid then
		joined_csv("Session Switch")
	end
	if pid == kickedpid then
		kickedgone = true
	end
	return
end)
--TODO: Kick Join
PrevKick_Join = event.add_event_listener("player_join", function(e)
	if type(e) == 'number' then
		return
	end
	local pid = e["player"]
	Session_Slots[pid+1] = true
	local scid = player.get_player_scid(pid)
	if MyFriends[scid] then
		FriendIsOnline = network.is_friend_online(MyFriends[scid][2])
		FriendIdxIsOnline = network.is_friend_index_online(MyFriends[scid][1])
		FriendIsPlaying = network.is_friend_in_multiplayer(MyFriends[scid][2])
		menu.notify(MyFriends[scid][2] .. "\nFriend Index is online = " .. tostring(FriendIdxIsOnline) .. "\nFriend is Online = " .. tostring(FriendIsOnline) .. "\nis in Multiplayer = " ..  tostring(FriendIsPlaying), "Friend SCID Joined", 15, 0xff00ff00)
	end
	if scid == player.get_player_scid(player.player_id()) then
		Mypid = player.player_id()
	end
	local token = tostring(player.get_player_host_token(pid))
	if Kicked_Players[scid] and Kicked_Players[scid] ~= nil --[[or Kicked_Player[token:sub(1, 8)] == token:sub(1, 8)]] then
		kickedpid = pid
		kickedgone = false
		local name = tostring(player.get_player_name(pid))
		local name2 = tostring(Kicked_Players[scid]) --[[or tostring(Kicked_Player[token:sub(1, 8)])]]
		menu.notify("(" .. tostring(name) .." : " ..  name2 .. ")\nSCID = " .. tostring(scid) --[[.. "\nToken = " .. tostring(token)]], "Kicked Player Rejoining:", 15, 0xff0000ff)
		Debug_Out("Kicked Player Rejoining: " .. "(" .. tostring(name) .." : " .. tostring(Kicked_Players[scid]) .. ") " .. tostring(scid) .."\n")
		if Kick_Kicked == true then
			if network.network_is_host() then
				Debug_Out("Host Kicked Rejoining Kicked Player: " .. "(" .. tostring(name) .." : " .. tostring(Kicked_Players[scid]) .. ") " .. tostring(scid) .."\n")
				network.network_session_kick_player(pid)
				elseif not network.network_is_host() then
				Debug_Out("Non Host Kicked Rejoining Kicked Player: " .. "(" .. tostring(name) .." : " .. tostring(Kicked_Players[scid]) .. ") " .. tostring(scid) .."\n")
				Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
				Trigger_Event(0x9C050EC, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x39624029, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0xAD63290E, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x7DE8CAC0, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x285DDF33, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x39624029, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0xAD63290E, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x7DE8CAC0, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(0x285DDF33, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
				system.yield(Settings["ScriptEvent_delay"])
				network.force_remove_player(pid)
			end
		end
	end
	return
end)
--TODO: Change from function to value before any new dlc
CurrentMenuVersion = menu.get_version()
MenuVersion = nil
function NewDLC()
	MenuVersion = menu.get_version()
	if MenuVersion ~= CurrentMenuVersion then
		return true
		elseif MenuVersion == CurrentMenuVersion then
		return false
	end
end
function moist_notify(msg1, msg2, colour, timeout)
    if Settings["Notify_Me"] == true then
        timeout = timeout or 8
        if Settings["New_Notifys"] then
            colour = colour or Settings["NotifyColorDefault"]
            moist_notify2(msg1, msg2, colour, timeout)
			elseif not Settings["New_Notifys"] then
			msg2 = msg2 or "MoistScript 2.0.6.8"
			msg1 = msg1 or "MoistScript Putting Fun and Moisture over GTA ONLINE\nLike a Pussy Dripping ona Hard Cock!\nPenetrating Like a Missile from Lester on Opressor!!"
			text = "~h~~b~" .. tostring(msg2) .. "~n~~h~~w~" .. tostring(msg1)
            ui.notify_above_map(text, "", 120)
		end
	end
end
function moist_notify2(msg1, msg2, colour, timeout)
	timeout = timeout or 8
	msg1 = msg1 or "MoistScript Putting Fun and Moisture over GTA ONLINE\nLike a Pussy Dripping ona Hard Cock!\nPenetrating Like a Missile from Lester on Opressor!!"
	msg2 =  msg2 or "MoistScript 2.0.6.8"
	local color = Settings["NotifyColorDefault"] or colour
	menu.notify(msg1, msg2, timeout, color)
end
function Moist_Script_Main()
Settings["MoistScript"] = "2.0.6.8"
Settings["DateSettingsSaved"] = ""
Settings["OSD.modvehspeed_osd"] = false
Settings["OSD.Player_bar"] = false
Settings["aimDetonate_control"] = false
Settings["osd_date_time"] = false
Settings["force_wPara"] = false
Settings["force_wBPH"] = false
Settings["lag_out"] = false
Settings["global_func.mk1boostrefill"] = false
Settings["global_func.mk2boostrefill"] = false
Settings["global_func.veh_rapid_fire"] = false
Settings["global_func.rapidfire_hotkey1"] = false
Settings["NotifyColorDefault"] = 0xffffff00
Settings["NotifyColorRDefault"] = 0
Settings["NotifyColorGDefault"] = 255
Settings["NotifyColorBDefault"] = 0
Settings["NotifyColorADefault"] = 255
Settings["Weapon_Recticle"] = false
Settings["no_peds"] = false
Settings["no_traffic"] = false
Settings["chat_log"] = false
Settings["Chat_Command"] = false
Settings["chat_debug"] = false
Settings["Blacklist_ON"] = false
Settings["Blacklist_Mark"] = false
Settings["Blacklist_kick"] = false
Settings["global_func.thermal_stat_switch_hotkey"] = false
Settings["osd_My_speed1"] = false
Settings["osd_My_speed2"] = false
Settings["RPG_HOTFIRE"] = false
Settings["counter_Hotkey"] = false
Settings["spam_wait"] = 0
Settings["GodCheck"] = false
Settings["GodCheckNotif"] = false
Settings["force_pPara"] = false
Settings["force_pBPH"] = false
Settings["Notify_Me"] = false
Settings["New_Notifys"] = false
Settings["playerscriptinfo"] = false
Settings["OSDDebug2"] = false
Settings["playerlist_loop"] = 1
Settings["loop_feat_delay"] = 1
Settings["ScriptEvent_delay"] = 3
Settings["PlayerCheckVersion"] = 1
Settings["PlayerGodCheckVersion"] = 1
Settings["RagDollHotKey"] = false
Settings["OTR_Blips"] = false
Settings["EWO_TRYHARD"] = false
Settings["RecentPlayer_Notify"] = false
Settings["FriendBypass"] = false
Settings["orbitalProxyBlip"] = false
Settings["WeaponFastSwitch"] = false
Settings["blipGodcheck"] = false
Settings["Add_Blips"] = false
Settings["blipGodcheckvalue"] = 1
Settings["Weapon_TargetDot"] = false
Settings["Combat_Tracker_Notify"] = false
Settings["Combat_Tracker_DebugLog"] = false
Settings["Combat_Tracker_ON"] = false
Settings["Combat_Tracker_Value"] = 0
Settings["spec_osd"] = false
Settings["missilehook"] = false
Settings["PlayerTagginghook"] = false
Settings["PlayerRCHook"] = false
Settings["ESP_Enhancments"] = false
Settings["ClearVisNotifDelay"] = 5
Settings["ClearVisNotif"] = false
Settings["spam_wait_Modifier"] = 25
Settings["KickModFlag"] = 0
Settings["RemoveModFlag"] = 0
Settings["GodAudVfxNotif_on"] = false
Settings["GodAudVfxNotif"] = 0
Settings["KickJoiningKickedPlayers"] = true
Settings["EntityPools"] = true
Settings["AutoRemoveEntityPools"] = 2
Settings["RTT_Host"] = true
Settings["LoadRecentPlayersFile"] = false
Settings["AutoSaveRecentTime"] = 0.70
Settings["AutoSaveRecentFile"] = false
Settings["AutoLimitCount"] = 300
Settings["AutoLimitRecent"] = false
function SaveSettings()
	Settings["DateSettingsSaved"] = os.date("%d-%m-%y")
	local file = io.open(Paths.Settings, "w")
	for k,v in pairs(Settings) do
		file:write(tostring(k) .. "=" .. tostring(v) .. "\n")
	end
	file:close()
end
function LoadSettings()
	if not utils.file_exists(Paths.Settings) then
		return
	end
	for line in io.lines(Paths.Settings) do
		local separator = line:find("=", 1, true)
		if separator then
			local key = line:sub(1, separator - 1)
			local value = line:sub(separator + 1)
			Settings[key] = value
		end
	end
end
function Load_Settings()
	if not utils.file_exists(Paths.Settings) then
		return
	end
	for line in io.lines(Paths.Settings) do
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
			if Settings[key] ~= nil then
				Settings[key] = value
			end
		end
	end
end
function VersionCheck()
	Load_Settings()
	if Settings["MoistScript"] ~= "2.0.6.8" then
		local saved_version = Settings["MoistScript"]
		Settings["MoistScript"] = "2.0.6.8"
		moist_notify2("Saved Version = " ..  saved_version .."\nThis Version = ".. Settings["MoistScript"], "Script Version Out of Date", 0xffffff)
		moist_notify2("Loading Current Saved Settings\nAdding New Settings\nSaving all", "Script Version Updated", 0xffffff)
		SaveSettings()
	end
end
VersionCheck()
Load_Settings()
--TODO: Version Check only to enable when major settings are changed
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
	local file = io.open(Paths.Logs .."\\DebugPrint.txt", "a+")
	print(text)
	text = tostring(text) .. "\n"
	file:write(tostring(text))
	file:close()
end
function Print(text)
	local file = io.open(Paths.Logs .."\\DebugPrint.txt", "a+")
	print(text)
	local txt = Cur_Date_Time()
	file:write(txt .. "\t")
	text = tostring(text) .. "\n"
	file:write(tostring(text))
	file:close()
end
function StringToArray(TextInput, Seperator)
    ResultArray = {}
    for match in (TextInput..Seperator):gmatch("(.-)"..Seperator) do
        table.insert(ResultArray, match)
	end
    return ResultArray
end
function Table_Tools()
	Table_Tools = true
	function Dump(b)if type(b)=='table'then local c='{ 'for d,e in pairs(b)do if type(d)~='number'then d='"'..d..'"'end;c=c..'\n['..d..'] = '..Dump(e)..','end;return c..'} 'else return tostring(b)end end
	function dump(o)
		if type(o) == 'table' then
			local s = '{ '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..k..'"' end
				s = s .. '['..k..'] = ' .. dump(v) .. ','
			end
			return s .. '} '
			else
			return tostring(o)
		end
	end
	function Table_Dump(source, ignore)
		ignore = ignore or { source = true }
		local sourceType = type(source)
		if sourceType == 'table' then
			local result = '{ '
			for key, value in pairs(source) do
				if not ignore[value] then
					if type(value) == 'table' then
						ignore[value] = true
					end
					local dumpValue = dump(value, ignore)
					if dumpValue ~= '' then
						result = result .. '["' .. tostring(key) .. '"] = ' .. tostring(dumpValue) .. ', '
					end
				end
			end
			if result ~= '{ ' then
				return string.sub(result, 1, -3) .. ' }'
				else
				return '{}'
			end
			elseif sourceType == 'string' then
			return string.format('%q', source)
			elseif sourceType ~= 'userdata' and sourceType ~= 'function' then
			return tostring(source)
			else
			return ''
		end
	end
	function PackTable(tablename)
		local Packed =  table.pack(tablename)
		return Packed
	end
	function RecentPlayerTableRebuild(limit)
		local tablebuild = {}
		local limitnum = limit
		if #Recent_Players >= limitnum then
			for i = (#Recent_Players - limitnum), #Recent_Players, 1 do
				local y = #tablebuild + 1
				tablebuild[y] = Recent_Players[i]
			end
		end
		return tablebuild
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
	local function exportstring(s)
		return string.format("%q", s)
	end
	--// The Save Function
	function table.save(tbl, filename)
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
	function table.load(sfile)
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
end
Table_Tools()
local ScriptLocals, data, data2, data3, kick_param_data = {}, {}, {}, {}, {}
ScriptLocals["RUSPAM"] = {}
ScriptLocals.SMS_spam = {}
Active_menu = nil
function interiors_load()
	if not utils.file_exists(Paths.interiorpos) then return end
	f = assert(loadfile(Paths.interiorpos)) return f()
end
interiors_load()
function online_interiors_load()
	if not utils.file_exists(Paths.onlineinterior) then return end
	f = assert(loadfile(Paths.onlineinterior)) return f()
end
online_interiors_load()
--output Features
function dataload()
	if not utils.file_exists(Paths.kickdata) then	return end
	for line in io.lines(Paths.kickdata) do data[#data + 1] = line end
end
dataload()
function paramload()
	if not utils.file_exists(Paths.kickparam) then	return end
	for line in io.lines(Paths.kickparam) do
		kick_param_data[#kick_param_data + 1] = line
	end
end
paramload()
function dupe_param()
	for i =1, #kick_param_data do
		for y = 1, #kick_param_data do
			kick_param[y] = kick_param_data[i]
		end
	end
end
dupe_param()
--INFO: Arrays for function variables
OSD, OptionsVar, PlyTracker, tracking, ply_veh, ply_ped = {}, {}, {}, {}, {}, {}
tracking.playerped_posi, tracking.playerped_speed1, tracking.playerped_speed2, tracking.playerped_speed3 = {}, {}, {}, {}
local MyvehControl = {}
function setup_vehcontrol()
	MyvehControl["MyGearNow"] = 0
	MyvehControl["MyMaxGear"] = 0
	MyvehControl["MyNextGear"] = 0
	MyvehControl["MyGearRatio"] = 0
end
setup_vehcontrol()
Playerz = {}
function PlayerArray()
	for pid = 0, 31 do
		Playerz[pid+1] = string.format("Player " .. tonumber(pid))
	end
	Playerz[34] = "Anonymous"
end
PlayerArray()
--INFO: Function Data & Entity Arrays
local size_marker, marker_type, offsetz_marker = 1.0, 0, 1.5
--INFO: Function Localisation
local Online = network.is_session_started()
--INFO: Function Variables
local SessionHost, ScriptHost, pped, pos_bool, myplygrp, plygrp, RemoveBlacklistFeature, MainEntityHash, orbit_pid, Degree, mk_id, mod_flag_1, mod_flag_2, mod_flag_3, mod_flag_4, mod_flag_5, dist, wave_int_cur
EntityHash.pid, EntityHash2.pid = {}, {}
Liverys = {}
markID.z = {}
markID.s = {}
markID.BOB = {}
markID.ROT = {}
highlight_set = {}
BobUPnDown = true
ROTMRK = true
AddBlips = Settings["Add_Blips"]
local loop_logsent, spam_wait, preset_color, notifytype, isInterior
loop_logsent = false
note = false
spam_wait = Settings["spam_wait"]
preset_color = Settings["NotifyColorDefault"]
notifytype = Settings["NotifyVarDefault"]
AnonymousBounty, trigger_time, cleanup_done, world_dumped, kicklogsent, logsent, spawnoptions_loaded  = true, nil, true, true, false, false, false
ScreenText, ScreenText2, ScreenTextdebug = " ", " ", ""
--INFO: Function return values
function TableDmp(t)
	--	io.open(file, "a")
	for i,v in pairs( t ) do
		-- escape functions and userdata
		if (not handled[i]) and type( v ) ~= "userdata" then
			-- handle index
			if type( i ) == "table" then
				if not lookup[i] then
					table.insert( tables,i )
					lookup[i] = #tables
				end
				file:write( charS.."[{"..lookup[i].."}]=" )
				else
				local index = ( type( i ) == "string" and "["..exportstring( i ).."]" ) or string.format( "[%d]",i )
				file:write( charS..index.."=" )
			end
			-- handle value
			if type( v ) == "table" then
				if not lookup[v] then
					table.insert( tables,v )
					lookup[v] = #tables
				end
				file:write( "{"..lookup[v].."},"..charE )
				elseif type( v ) == "function" then
				file:write( "loadstring("..exportstring(string.dump( v )).."),"..charE )
				else
				local value =  ( type( v ) == "string" and exportstring( v ) ) or tostring( v )
				file:write( value..", "..charE )
			end
		end
	end
	return
end
function ModNum(a, b)
	return a - ((a/b) // 1) *b
end
function RoundNum(num, dot)
	local mult = 10^(dot or 0)
	return ((num * mult + 0.05) // 1) / mult 
end
function build_params(argcnt)
	local ParaMs = {}
	for i = 1, argcnt do
		local y = math.random(1, #kick_param_data)
		ParaMs[i] = kick_param_data[y]
	end
	return ParaMs
end
function Get_Last_MP(stat)
	local text = stat
	local hash = gameplay.get_hash_key("MPPLY_LAST_MP_CHAR")
	local MP = stats.stat_get_int(hash, 1)
	return (string.format("MP" ..MP .."_" ..text))
end
--Get Offset to self POS
SelfoffsetPos, offsetPos = v3(), v3()
function get_offset2me(dist)
	local MyPed = player.get_player_ped(player.player_id())
	local pos = entity.get_entity_coords(MyPed)
	local fwdvec = entity.get_entity_forward_vector(MyPed)
	return(pos + (fwdvec * dist))
end
--INFO: offset to player calculation
function get_offset(pid, dist)
	local pos = player.get_player_coords(pid)
	local pped = player.get_player_ped(pid)
	local fwdvec = entity.get_entity_forward_vector(pped)
	pos = pos + (fwdvec * dist)
	return pos
end
function GetDistMag(PosA, PosB)
	return (PosA:magnitude(PosB))
end
function Get_Distance(pid)
	local playerCoord = player.get_player_coords(player.player_id())
	local coord = player.get_player_coords(pid)
	return (playerCoord:magnitude(coord))
end
function Get_Dist2D_POS2POS(v3pos1, v3pos2)
	local pos1, pos2 = v3(), v3()
	pos1 = v3pos1
	pos1.z = 0.0
	pos2 = v3pos2
	pos2.z = 0.0
	return (pos1:magnitude(pos2))
end
--TODO: Session Combat Dump
function CombatData_Setup()
	for pid = 0, 31 do
		Session_Combat[pid] = {}
		Session_Combat[pid].kills = {}
		Session_Combat[pid].killed = {}
		Session_Combat[pid].name = tostring(player.get_player_name(pid))
		for i = 0, 31 do
			Session_Combat[pid].kills[i] = 0
			Session_Combat[pid].killed[i] = 0
		end
	end
end
CombatData_Setup()
function CombatStat_Dump(pid, clear)
	clear = clear or false
	local text = ""
	Debug_Out("\n", true, "CombatStats.log")
	text = text .. "Combat Stats for Player: " .. tostring(Session_Combat[pid].name)
	text = text .."\n\t|\tKilled\t|\tCount\t| vs |\tCount\t|\tKilled By |"
	Debug_Out(text, false, "CombatStats.log")
	for i = 0, 31 do
		if Session_Combat[i].name ~= nil then
			if Session_Combat[pid].kills[i] ~= 0 or Session_Combat[pid].killed[i] ~= 0 then
				local text2 = ""
				text2 = text2 ..  tostring(Session_Combat[i].name) .. "\t|\t " .. tostring(Session_Combat[pid].kills[i]) .. "\t|| vs ||\t" .. tostring(Session_Combat[pid].killed[i]) .. "\t|\t"  .. tostring(Session_Combat[i].name)
				Debug_Out(text2, false, "CombatStats.log")
			end
		end
		if clear == true then
			Session_Combat[pid].name = nil
			for i = 0, 31 do
				Session_Combat[pid].kills[i] = 0
				Session_Combat[pid].killed[i] = 0
				if Session_Combat[i].kills[pid] ~= 0 then
					Session_Combat[i].kills[pid] = 0
					Session_Combat[i].killed[pid] = 0
				end
			end
		end
	end
end
function CombatStat_notify(pid)
	moist_notify("Combat Stats for Player: " .. tostring(Session_Combat[pid].name), "")
	for i = 0, 31 do
		if Session_Combat[i].name ~= nil and player.is_player_valid(pid) then
			if Session_Combat[pid].kills[i] ~= 0 or Session_Combat[pid].killed[i] ~= 0 then
				names = Session_Combat[pid].name .. "\t|  || vs ||  |\t " .. Session_Combat[i].name
				score = tostring(Session_Combat[pid].kills[i]) .. " || vs || " .. tostring(Session_Combat[pid].killed[i])
				moist_notify(score, names)
			end
		end
	end
	return HANDLER_POP
end
function CombatStat_Chat(pid)
	--[[local text = "\nCombat Stats for Player: " .. tostring(Session_Combat[pid].name) .."\n"]]
	for i = 0, 31 do
		if Session_Combat[i].name ~= nil and player.is_player_valid(pid) then
			if Session_Combat[pid].kills[i] ~= 0 or Session_Combat[pid].killed[i] ~= 0 then
				names = "\n" .. Session_Combat[pid].name .. "  ||  ".. tostring(Session_Combat[pid].kills[i]) .. "  |  vs  |  " .. tostring(Session_Combat[pid].killed[i]) .. "  ||  " .. Session_Combat[i].name
				network.send_chat_message(names, Public_Chat)
			end
		end
	end
end
--[[
	function OffsetCoords(pos, heading, distance)
	heading = math.rad((heading - 180) * -1)
	return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
	end
	function get_off_set(pos, head, dist)
	head = head or player.get_player_heading(player.player_id())
	offsetPos = OffsetCoords(pos, head, dist)
	return offsetPos
	end
]]
function Get_Spawn_POS(pos, fwdvec, dist)
	fwdvec = fwdvec or entity.get_entity_rotation(player.get_player_ped(player.player_id()))
	local spawnbool, spawn_pos = gameplay.find_spawn_point_in_direction(pos, fwdvec, dist)
	return spawn_pos
end
function Get_Distance2D(pid, v3pos)
	local pos = v3pos
	pos.z = 0.0
	local playerCoord = player.get_player_coords(pid)
	playerCoord.z = 0.0
	return (playerCoord:magnitude(v3pos))
end
function Get_Distance3D(pid)
	local playerCoord = player.get_player_coords(player.player_id())
	local coord = player.get_player_coords(pid)
	return (playerCoord:magnitude(coord))
end
interior_thread = {}
function Get_Dist3D(pid, v3pos)
	local playerCoord = v3pos
	local coord = player.get_player_coords(pid)
	return (playerCoord:magnitude(coord))
end
function interiorcheck_old_pid(pid)
	player_id = pid
	pid = player_id
	interior_thread[pid+1] = menu.create_thread(interiorcheck_thread, { pid = player_id } )
	local i = #feat + 1
	feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
	feat[i].data = {thread = interior_thread[pid+1]}
end
interiorcheck_thread = function(context)
	local apartmen, orbprox
	local interiorr 
	pped = player.get_player_ped(context.pid)
	while true do
		if player.is_player_valid(context.pid) ~= false then
			if interior.get_interior_at_coords_with_type(player.get_player_coords(context.pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(context.pid)) == 0 then
				if player.is_player_god(context.pid) or player.is_player_vehicle_god(context.pid) then
					for y = 1, #zones do
						if entity.is_entity_in_zone(pped, zones[y]) then
							for i = 1, #interiors[zones[y]] do
								system.yield(5)
								apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
								if apartmen < 90 then
									Players[context.pid].isint = true
									goto interiorcheckEnd
									system.yield(5)
								end
								system.yield(5)
							end
							Players[context.pid].isint = false
						end
					end
				end
			end
			::interiorcheckEnd::
			elseif player.is_player_god(context.pid) and interior.get_interior_at_coords_with_type(player.get_player_coords(context.pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(context.pid)) ~= 0 then
			Players[context.pid].isint = true
		end
		system.yield(600)
	end
end
--INFO: Interior Check
interior_poscheck = function(pid)
	local apartmen, interiorr, found
	local pped = player.get_player_ped(pid)
	if player.is_player_valid(pid)then
		if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
			for y = 1, #zones do
				if entity.is_entity_in_zone(pped, zones[y]) then
                    for i = 1, #interiors[zones[y]] do
						system.yield(5)
						apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
						--apartmen = Get_Dist3D(pid, interiors[i][2])
						if apartmen < 90 then
							found = true
							elseif not found then
							system.yield(10)
						end
						system.yield(10)
					end
				end
			end
			if found == true then
				return true
				else
				return false
			end
			elseif  interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0 then
			return false
		end
	end
end
interior_pos_check = function(pid)
	local apartmen, interiorr, found
	local pped = player.get_player_ped(pid)
	if player.is_player_valid(pid)then
		if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
			for y = 1, #zones do
				if entity.is_entity_in_zone(pped, zones[y]) then
                    for i = 1, #interiors[zones[y]] do
						system.yield(5)
						apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
						system.yield(10)
						if apartmen < 90 then
							found = true
							elseif apartmen > 90 then
							system.yield(10)
						end
						system.yield(10)
					end
				end
			end
			if found == true then
				return true
				elseif not found then
				return false
			end
			-- local zbool, gz = gameplay.get_ground_z(player.get_player_coords(pid))
			-- pos = player.get_player_coords(pid)
			-- if not Players[pid].isint and pos.z < gz then
			-- Players[pid].isint = true
			-- elseif not Players[pid].isint and pos.z >= gz then
			-- Players[pid].isint = false
			elseif  interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0 then
			return false
		end
	end
end
function Getinterior(pid)
	local interioor, pos = "", v3()
	pos = player.get_player_coords(pid)
	interioor = interior.get_interior_at_coords_with_type(pos, "")
	if interioor ~= 0 then
		moist_notify(tostring(interioor) .. "\n" .. tostring(pos), "Interior by type at POS")
	end
end
function Get_Dist_3D(pid, v3pos)
	local pped = player.get_player_ped(pid)
	local playerCoord = v3pos
	local coord = entity.get_entity_coords(pped)
	local xDis = playerCoord.x - coord.x
	local yDis = playerCoord.y - coord.y
	local zDis = playerCoord.z - coord.z
	local distance = math.sqrt(xDis * xDis + yDis * yDis + zDis * zDis)
	return distance
end
interior_thread, OrbitalProxyThread = {}, {}
God_thread, God_thread1 = {pid = {}}, {pid = {}}
feat = {}
function interiorcheckpid(pid, ver)
    version = Settings["PlayerCheckVersion"]
    if version == 1 then
        player_id = pid
        pid = player_id
        local i = pid + 32
		interior_thread[i] = menu.create_thread(interiorcheck1_thread, pid)
        local i = #feat + 1
        feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
        feat[i].data = {thread = interior_thread[pid+1]}
		elseif version == 2 then
        player_id = pid
        pid = player_id
		local i = pid + 32
        interior_thread[pid+1] = menu.create_thread(interiorcheck2_thread, pid)
        local i = #feat + 1
        feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
        feat[i].data = {thread = interior_thread[pid+1]}
	end
end
--INFO: Orbital Room Proximity Detection
function OrbitalProxy(pid)
	player_id = pid
	pid = player_id
	OrbitalProxyThread[pid+1] = menu.create_thread(Orbital_Proxy_Thread, pid)
end
Orbital_Proxy_Thread = function(pid)
	local orbprox, orbroom
	while true do
		if player.is_player_valid(pid) then
			system.yield(10)
			orbprox = Get_Distance2D(pid, v3(339.379,4836.629,-58.999))
			if orbprox < 18 and not Players[pid].orbnotify then
				moist_notify("Player Close To Orbital Room!\n" .. (Players[pid].name or "PID:" ..pid) .. " is: " .. orbprox .. " Away from entrance", "Possible Orbital User")
				Players[pid].orbnotify = true
				elseif orbprox > 18 and Players[pid].orbnotify then
				Players[pid].orbnotify = false
			end
			system.yield(10)
			orbroom = Get_Distance2D(pid, v3(328.72317504883,4829.0971679688,-58.552871704102))
			if orbroom < 10 and not Players[pid].orbnotify2 then
				moist_notify("Player Inside Orbital Room!\n" .. (Players[pid].name or "PID:" ..pid), "Orbital User")
				Players[pid].orbnotify2 = true
				elseif orbroom > 10 and Players[pid].orbnotify2 then
				Players[pid].orbnotify2 = false
			end
			system.yield(10)
		end
		system.yield(100)
	end
	system.yield(100)
end
interiorcheck1_thread = function(pid)
    local apartmen, interiorr, found
    while true do
        if player.is_player_valid(pid) then
			local pped = player.get_player_ped(pid)
            if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0  then
				-- system.yield(8000)
                Players[pid].isint = true
                Players[pid].PedSpawned = false
				elseif interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 and interior.get_interior_from_entity(player.get_player_ped(pid)) == 0  then
				for y = 1, #zones do
					if entity.is_entity_in_zone(pped, zones[y]) then
						for i = 1, #interiors[zones[y]] do
							system.yield(5)
							apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
							system.yield(6)
							if apartmen < 60 then
								found = true
								Players[pid].isint = true
								Players[pid].PedSpawned = false
								if found then
									system.yield(8000)
								end
							end
							system.yield(6)
						end
					end
				end
                if found ~= true then
                    Players[pid].isint = false
				end
                system.yield(6)
			end
            system.yield(6)
		end
        system.yield(6000)
	end
    system.yield(6)
end
--INFO: V1 Check
interiorcheck_1_thread = function(pid)
	local apartmen, orbprox, pped
	while true do
		pped = player.get_player_ped(pid)
		local pos = player.get_player_coords(pid)
		if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0  then
			Players[pid].isint = true
			elseif interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0  then
			if pos.z < -120 then
				Players[pid].isint = true
				elseif pos.z > -90 then
				Players[pid].isint = false
			end
			elseif interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0  and player.is_player_playing(pid) then
			for y = 1, #zones do
				if entity.is_entity_in_zone(pped, zones[y]) then
                    for i = 1, #interiors[zones[y]] do
						system.yield(5)
						apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
						if apartmen < 60 then
							Players[pid].isint = true
							--Players[pid].PedSpawned = false
							goto interiorcheckEnd
						end
						system.yield(10)
					end
				end
			end
			system.yield(10)
			::interiorcheckEnd::
			system.yield(600)
		end
		system.yield(600)
	end
end
--INFO: New Player Interior Check
function GetPlayerinterior(pid)
	local apartmen, interiorr, found
	pped = player.get_player_ped(pid)
	for y = 1, #zones do
		if entity.is_entity_in_zone(pped, zones[y]) then
            for i = 1, #interiors[zones[y]] do
				system.yield(5)
				apartmen = GetDistMag(player.get_player_coords(pid), interiors[zones[y]][i][2])
				system.wait(0)
				if apartmen < 60 then
					found = true
					return true, tostring(interiors[zones[y]][i][1]), tostring(interiors[zones[y]][i][2]), (i)
				end
				system.wait(0)
			end
		end
	end
	if found ~= true then
		--	Players[pid].isint = false
		return false
	end
end
function GetPlayer_onlineinterior(pid)
	local apartmen, interiorr, found
	for i = 1, #onlineinteriors do
		apartmen = GetDistMag(player.get_player_coords(pid), onlineinteriors[i][2])
		system.wait(0)
		if apartmen < 60 then
			found = true
			return true, tostring(onlineinteriors[i][1]), (i)
		end
	end
	if found ~= true then
		return false
	end
end
--INFO: v2 Check
interiorcheck2_thread = function(pid)
	while true do
		if player.is_player_valid(pid) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
			if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0 then
				Players[pid].isint = true
				Players[pid].PedSpawned = false
				elseif interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
				intstate = interior_pos_check(pid)
				if intstate == true then
					Players[pid].isint = true
					Players[pid].PedSpawned = false
					elseif intstate == false then
					Players[pid].isint = false
					--Players[pid].PedSpawned = true
				end
			end
			system.yield(60)
		end
		system.yield(60)
	end
	system.yield(60)
end
--INFO: Player IP
function GetIP(pid)
    ip = player.get_player_ip(pid)
    return ip
end
-- Player Ped ID / Entity ID
function spawn_object_onp(hash, pid)
    local pos, rot, rot2 = v3(), v3(180.00,0.0,0.0), v3(180.00,0.0,90.00)
    local offset, arot = v3(0.0,0.0,1.0), v3(180.0,0.0,90.00)
    pos = player.get_player_coords(pid)
    pos.z = pos.z + 7.0
    local Spawn, Spawn2
    Spawn = object.create_object(hash, pos, true, true)
    Spawn2 = object.create_object(hash, pos, true, true)
    entity.set_entity_as_mission_entity(Spawn2, true, false)
    entity.set_entity_collision(Spawn2, false, false, false)
    entity.set_entity_as_mission_entity(Spawn, true, false)
    entity.set_entity_collision(Spawn, false, false, false)
    entity.set_entity_rotation(Spawn, rot)
    --entity.set_entity_rotation(Spawn2, rot2)
    entity.attach_entity_to_entity(Spawn2, Spawn, 0, offset,  arot, true, false, false, 0, true)
    return Spawn, Spawn2
end
--INFO: **** Player Info Check ****
function Player_Check(pid)
    local pped, health, heldwep, heldammotype, vped, playern, plygrp, plyteam, PlayerBlip, veh_atta, Attached, attachedhash
    pped = player.get_player_ped(pid)
    PlayerBlip = ui.get_blip_from_entity(pped)
    if pid == player.player_id() then
        PlayerBlip = "No SelfBlip"
	end
    plyteam = player.get_player_team(pid)
    plygrp = player.get_player_group(pid)
    playern = network.network_hash_from_player(pid)
    attached = entity.is_entity_attached(pped)
    relhash = ped.get_ped_relationship_group_hash(pped)
    health = player.get_player_health(pid)
    health = RoundNum(health, 2)
    maxhp = player.get_player_max_health(pid)
    armo = player.get_player_armour(pid)
    local dist = Get_Distance3D(pid)
    local pos = player.get_player_coords(pid)
    if player.is_player_in_any_vehicle(pid) then
        veh_atta = true
		elseif entity.is_entity_attached(pped) then
        veh_atta = true
		else
        veh_atta = false
	end
    if veh_atta  then
        Attached = entity.get_entity_attached_to(pped)
        attachedhash = "HASH = (~p~" .. tostring(entity.get_entity_model_hash(Attached))
		elseif not veh_atta then
        attachedhash = "("
	end
    return ("~h~~r~H.~o~P~w~ | ~y~A:~r~  " .. health .. "~w~ / ~o~" .. maxhp .. "~h~~w~ | ~y~" .. armo ..  "    ~q~~h~BlipID: " .. PlayerBlip),("\n~h~~w~Vehicle/Attached =~y~ " .. tostring(player.is_player_in_any_vehicle(pid)) .. "~w~ /~y~ " ..  tostring(entity.is_entity_attached(pped)) .. "\t" .. attachedhash .. ")"), ("\n~b~Team~w~ | ~y~Group | ~q~Relhash: ~b~\t~h~" .. plyteam  .."~w~ | ~y~" .. plygrp .. "~w~ | ~q~" .. relhash .."\t"), ("~w~\nNetHash: " .. playern)
end
local ammois = "Normal"
function Get_AmmoType(ammohash)
	local ammo
	for i = 1, #AmmoType do
		if AmmoType[i][2] == ammohash then
			ammo = AmmoType[i][1]
			return ammo
		end
	end
end
--Features
-- local function dec2ip(decip)
-- local div, quote, ip;
-- for i = 3, 0, -1 do
-- div = 2 ^ (i * 8)
-- quote, decip = math.floor(decip / div), math.fmod(decip, div)
-- if nil == ip then
-- ip = quote
-- else ip = ip .. "." .. quote
-- end
-- end
-- return ip
-- end
local function dec2ip(decip)
	dip = tonumber(decip)
	if dip ~= nil then
		IPv4 = string.format("%i.%i.%i.%i", (dip >> 24) & 0xff, ((dip >> 16) & 0xff), ((dip >> 8) & 0xff), dip & 0xff)
		return IPv4 
		else return string.format("%i.%i.%i.%i", 0,0,0,0)
	end
end
--INFO: Partial IP
local function Get_Partial_IP(ip)
    local text, check = ip, ""
    local sep = text:find(".", 1, true)
    --print(sep)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part .. "."
        --	--print(Part)
        local value = text:sub(sep + 1)
        text = value
        --	--print(value)
	end
    local sep = text:find(".", 1, true)
    --print(sep)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part .. "."
        ---	--print(Part)
        local value = text:sub(sep + 1)
        text = value
        --	--print(value)
	end
    local sep = text:find(".", 1, true)
    --print(sep)
    if sep then
        local Part = text:sub(1, sep - 1)
        check = check .. Part
        --	--print(Part)
        local value = text:sub(sep + 1)
        text = value
        --	--print(value)
	end
    --	--print(check)
    return check
end
ped_group_setup = function()
	local i = #groupIDs + 1
	groupIDs[i] = ped.create_group()
	local i = #groupIDs + 1	
	groupIDs[i] = ped.create_group()
	ped.set_relationship_between_groups(0, groupIDs[1], groupIDs[2])
end
--INFO: Preset Data Arrays
local presets, escort_ped, veh_list, ped_wep, missions, BountyPresets, ssb_wep, StrikeGive, eject, heiststat_setup, decorators, int_flags, ObitalBlip
spam_presets, spamm, spamPre, spammRU = {}, {}, {}, {}
spamm.var, spamPre.var, spammRU.var = {}, {}, {}
local mod, modvalue, pedspawns, Group_Hate, Support_Group
local Ped_Haters, playergroups, playerpeds = {}, {}, {}
local MoistEntRelHash <const> = {}
MoistEntRelHash[#MoistEntRelHash + 1] = ped.add_relationship_group("MoistScript_Entities")
MoistEntitiesRelHash = MoistEntRelHash[1]
eject = {0, 1, 16, 64, 256, 4160, 262144, 320, 512, 131072}
spam_preset={
	{"Locksign Spam", "ΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ"},
	{"R* Verified Spam", "¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦"},
	{"R* Logo Spam", "∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑"},
	{"R* Created Spam", "‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹"},
	{"Fuck You! Spam", "Fuck You! Fuck  You! Fuck  You! Fuck  You! Fuck  You!"},
	{"! Spam",string.format("!			!			!			!			!			!			!			!			!			\n!			!			!			!			!			!			!			!			!			!			!			!			")},
	{"Suck Cum Drip Cunt Spam", "SUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K !\n"},
	{"You Suck MassSpam", "YOU SUCK \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n"},
	{"Ascii Tabbed Text", "������ ���������� ������ ��������� �� ���� ���������� ��������������� ������������͹\t������ ���������� ������ ���������\t �� ���� ����������"},
	{"Weird Ascii line", "��������������������������������������������������������������������������͹"},
	{"DEATH TO KOREA(in Korean)", "데스 투 코리아"},{"Fake Chinese Looking Boxes", "�� ��� � ���� �� � �� ���� ��� �� � �� �� �"},{"Fake Chinese Sell Bot", "� ��� ��\nGTA5:� �� ��� ����� Discord:���#��� ����"},
	{"Eat Dick", "EAT D I C K  !"},{"FAGGOT", "F A G G O T"},{"Cry", "CRY"},{"Suck", "SUCK"},{"Love Me", "Love Me"},{"Insert Space", " "},
	{"(^Â°.Â°^)", "(^Â°.Â°^)"},{"(o|o)", "(o|o)"},{"(>'-'<)", "(>'-'<)"},{"(^Â°.Â°^)", "(^Â°.Â°^)"},{"o_o", "o_o"},{"[{-_-}] Zzz", "[{-_-}] Zzz"},{"(-(-_(-_-)_-)-)", "(-(-_(-_-)_-)-)"},{"(╯︵╰,)", "(╯︵╰,)"},{"@( * O * )@", "@( * O * )@"},{"[̲̅$̲̅(̲̅ιοο̲̅)̲̅$̲̅]", "[̲̅$̲̅(̲̅ιοο̲̅)̲̅$̲̅]"},{"♫♪.ılılıll|̲̅̅●̲̅̅|", "♫♪.ılılıll|̲̅̅●̲̅̅|̲̅̅=̲̅̅|̲̅̅●̲̅̅|llılılı.♫♪"},
	{"Dance", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. [[
		o 
		<|>
		/ \
	]]
	.."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		o 
		/|>
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		_o 
		|>
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o 
		|>
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o 
		|>
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o_
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o>
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o>
		)
		/|
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o>
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o>
		(  
		|\ 
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		<o>
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		(  
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		)
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		_o_
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		_o_
		< >
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		\o/
		_|_
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		_o_
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		_o_
		| 
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
	[[
		o 
		/|\
		/ \
	]].."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
}
russian_spam={{"Die Infidel", "СМЕРТЬ ИНФИДЕЛ УМРИ НЕВЕРНЫЙ"},{"yes", "да"},{"no", "нет"},{"Talk English Russian scum", "Говорите по-английски, русские подонки!"},{"Want crashing", "хотите аварийного сбоя"},{"Russia sucks", "Россия отстой"},{"iwill pleasure your mom", "Я собираюсь, порадовать твою маму! Потом твою сестру! Потм обоих одновременно на твоей кровати."},{"Death to Russia", "Смерть России!"},{"Kill all Russians", "Убить всех русских"},{"Suck Russia", "Соси, Россия"},{"Pussy", "киска"},{"Cunt", "пизда"},{"Learn English russian Sucks", "Учите английский! Русский отстой! !"},{"I'm going to kill all russians!\nPlease Identify Yourself and prepare to die!", "Я собираюсь убить всех русских! Пожалуйста идентифицируйте себя, и приготовьтесь умереть!"}}presets={{"beyond_limits",-173663.281250,915722.000000,362299.750000},{"God Mode Death (Kill Barrier)",-1387.175,-618.242,30.362},{"Ocean God Mode Death\n(Outside Limits Deep Ocean)",-5784.258301,-8289.385742,-136.411270},{"Chiliad",491.176,5529.808,777.503},{"Lesters House",1275.544,-1721.774,53.967},{"arena",-264.297,-1877.562,27.756},{"ElysianIslandBridge",-260.923,-2414.139,124.008},{"LSIAFlightTower",-983.292,-2636.995,89.524},{"TerminalCargoShip",983.303,-2881.645,21.619},{"ElBurroHeights",1583.022,-2243.034,93.265},{"CypressFlats",552.672,-2218.876,68.981},{"LaMesa",1116.815,-1539.787,52.146},{"SupplyStreet",777.631,-695.813,28.763},{"Noose",2438.874,-384.409,92.993},{"TatavianMountains",2576.999,445.654,108.456},{"PowerStation",2737.046,1526.873,57.494},{"WindFarm",2099.765,1766.219,102.698},{"Prison",1693.473,2652.971,61.335},{"SandyShoresRadioTower",1847.034,3772.019,33.151},{"AlamoSea",719.878,4100.993,39.154},{"RebelRadioTower",744.500,2644.334,44.400},{"GreatChaparral",-291.035,2835.124,55.530},{"ZancudoControlTower",-2361.625,3244.962,97.876},{"NorthChumash(Hookies)",-2205.838,4298.805,48.270},{"AltruistCampRadioTower",-1036.141,4832.858,251.595},{"CassidyCreek",-509.942,4425.454,89.828},{"MountChiliad",462.795,5602.036,781.400},{"PaletoBayFactory",-125.284,6204.561,40.164},{"GreatOceanHwyCafe",1576.385,6440.662,24.654},{"MountGordoRadioTower",2784.536,5994.213,354.275},{"MountGordoLighthouse",3285.519,5153.820,18.527},{"GrapeSeedWaterTower",1747.518,4814.711,41.666},{"TatavianMountainsDam",1625.209,-76.936,166.651},{"VinewoodHillsTheater",671.748,512.226,133.446},{"VinewoodSignRadioTowerTop",751.179,1245.13,353.832},{"Hawik",472.588,-96.376,123.705},{"PacificSrandardBank",195.464,224.341,143.946},{"WestVinewoodCrane",-690.273,219.728,137.518},{"ArcadiasRadioTower",-170.232,-586.307,200.138},{"HookahPalaceSign",-1.414,-1008.324,89.189},{"MarinaAirportRadioTower",-697.010,-1419.530,5.001},{"DelperoFerrisWheel",-1644.193,-1114.271,13.029},{"VespucciCanalsClockTower",-1238.729,-853.861,77.758},{"DelPeroNrMazebankwest",-1310.777,-428.985,103.465},{"pacifficBluffs",-2254.199,326.088,192.606},{"GWC&GolfingSociety",-1292.052,286.209,69.407},{"Burton",-545.979,-196.251,84.733},{"LosSantosMedicalCenter",431.907,-1348.709,44.673},{"BanhamCanyon",-3085.451,774.426,20.237},{"TongvaHills",-1874.280,2064.565,150.852},{"SanChianskiMountainRange",2900.166,4325.987,102.101},{"HumaineLabs",3537.104,3689.238,45.228},{"YouToolStoreSanChianski",2761.944,3466.951,55.679},{"GalileoObservatory",-422.917,1133.272,325.855},{"GrndSeroraDesertCementwks",1236.649,1869.214,84.824}}
escort_ped={{"juggalo_01",0xDB134533},{"topless_01",0x9CF26183},{"juggalo_02",0x91CA3E2C},{"lester crest",0xB594F5C3},{"cop",0x9AB35F63},{"mp_agent14",0x6DBBFC8B},{"ramp_marine",0x616C97B9},{"trafficwarden",0xDE2937F3},{"lestercrest_2",0x6E42FD26},{"lestercrest",0x4DA6E849},{"agent14",0xFBF98469},{"m_pros_01",0x6C9DD7C9},{"waremech_01",0xF7A74139},{"weapexp_01",0x36EA5B09},{"weapwork_01",0x4186506E},{"securoguard_01",0xDA2C984E},{"armoured_01",0xCDEF5408},{"armoured_01",0x95C76ECD},{"armoured_02",0x63858A4A},{"marine_01",0xF2DAA2ED},{"marine_02",0xF0259D83},{"security_01",0xD768B228},{"snowcop_01",0x1AE8BB58},{"prisguard_01",0x56C96FC6},{"pilot_01",0xE75B4B1C},{"pilot_02",0xF63DE8E1},{"blackops_01",0xB3F3EE34},{"blackops_02",0x7A05FA59},{"blackops_03",0x5076A73B},{"hwaycop_01",0x739B1EF5},{"marine_01",0x65793043},{"marine_02",0x58D696FE},{"marine_03",0x72C0CAD2},{"ranger_01",0xEF7135AE},{"robber_01",0xC05E1399},{"sheriff_01",0xB144F9B9},{"pilot_01",0xAB300C07},{"swat_01",0x8D8F1B10},{"fibmugger_01",0x85B9C668},{"juggernaut_01",0x90EF5134},{"rsranger_01",0x3C438CD2},{"mp_m_niko_01",4007317449}}
missions={"Force to Severe Weather", "Force to Half Track", "Force to Night Shark AAT", "Force to APC Mission", "Force to MOC Mission", "Force to Tampa Mission", "Force to Opressor Mission1", "Force to Opressor Mission2"}
--ped_wep={{"unarmed",0xA2719263},{"parachute",0xfbab5776},{"weapon_handcuffs",0xD04C944D},{"Garbage Bag",0xE232C28C},{"WEAPON_FIREWORK",0x7F7497E5},{"stone_hatchet",0x3813FC08},{"knife",0x99B507EA},{"bat",0x958A4A8F},{"weapon_machinepistol",0xDB1AA450},{"raypistol",0xAF3696A1},{"stungun",0x3656C8C1},{"weapon_gadgetpistol",0x57A4368C},{"raycarbine",0x476BF15},{"combatmg_mk2",0xDBBD7280},{"Special RPG",1752584910},{"Standard RPG",2982836145},{"railgun",0x6D544C99},{"minigun",0x42BF8A85},{"Smoke GrenadeLauncher",0x4DD2DC56},{"WEAPON_REMOTESNIPER",0x33058E22},{"rayminigun",0xB62D1F6}}
ped_wep={"weapon_unarmed", "weapon_parachute", "weapon_handcuffs", "weapon_Garbage Bag", "weapon_FIREWORK", "weapon_stone_hatchet", "weapon_knife", "weapon_bat", "weapon_machinepistol", "weapon_raypistol", "weapon_stungun", "weapon_gadgetpistol", "weapon_raycarbine", "weapon_combatmg_mk2", "weapon_Special RPG", "weapon_Standard RPG", "weapon_railgun", "weapon_minigun", "weapon_Smoke GrenadeLauncher", "weapon_REMOTESNIPER", "weapon_rayminigun"}
veh_list={{"buzzard",0x2F03547B,nil,nil},{"savage",0xFB133A17,nil,nil},{"seasparrow",0xD4AE63D9,10,1},{"valkyrie2",0x5BFA5C4B,nil,nil},{"valkyrie",0xA09E15FD,nil,nil},{"boxville5",0x28AD20E1,nil,nil},{"apc",0x2189D250,10,0},{"oppressor2",0x7B54A9D3,10,1},{"oppressor",0x34B82784,10,0},{"ruiner2",0x381E10BD,nil,nil},{"scramjet",0xD9F0503D,10,0},{"stromberg",0x34DBA661},{"tampa3",0xB7D9F7F1},{"khanjali",0xAA6F980A,nil,nil},{"insurgent3",0x8D4B7A8A,nil,nil},{"insurgent",0x9114EADA,nil,nil},{"limo2",0xF92AEC4D,nil,nil},{"mower",0x6A4BD8F6,nil,nil},{"police2",0x9F05F101,nil,nil},{"police3",0x71FA16EA,nil,nil},{"police4",0x8A63C7B9,nil,nil},{"police",0x79FBB0C5,nil,nil},{"policeb",0xFDEFAEC3,nil,nil},{"policeold1",0xA46462F7,nil,nil},{"policeold2",0x95F4C618,nil,nil},{"policet",0x1B38E955,nil,nil},{"polmav",0x1517D4D9,nil,nil},{"sheriff2",0x72935408,nil,nil},{"sheriff",0x9BAA707C,nil,nil},{"phantom2",0x9DAE1398,nil,nil},{"ruiner3",0x2E5AFD37,nil,nil},{"scorcher",0xF4E1AA15,nil,nil},{"bmx",0x43779C54,nil,nil}}
BountyPresets={0,1,10,50,70,100,250,500,600,750,800,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000}
ssb_wep_label={"SNIPERRIFLE", "HEAVYSNIPER", "REMOTESNIPER", "GRENADELAUNCHER", "TRAILER_DUALAA", "PLAYER_BULLET", "PLAYER_LAZER", "AIRSTRIKE_ROCKET", "SPACE_ROCKET", "PLANE_ROCKET", "AVENGER_CANNON", "AIR_DEFENCE_GUN", "EMPLAUNCHER"}
StrikeGive_label={"AIRSTRIKE_ROCKET", "AVENGER_CANNON", "KHANJALI_CANNON_HEAVY", "GRENADELAUNCHER", "PLAYER_LAZER", "AKULA_BARRAGE", "SPACE_ROCKET", "PLANE_ROCKET", "AIR_DEFENCE_GUN", "GRENADELAUNCHER_SMOKE", "FIREWORK", "RUINER_ROCKET", "DELUXO_MISSILE", "HOMINGLAUNCHER", "STINGER", "STICKYBOMB", "PROXMINE", "EMPLAUNCHER"}
ssb_wep={"WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_REMOTESNIPER", "WEAPON_GRENADELAUNCHER", "VEHICLE_WEAPON_TRAILER_DUALAA", "VEHICLE_WEAPON_PLAYER_BULLET", "VEHICLE_WEAPON_PLAYER_LAZER", "WEAPON_AIRSTRIKE_ROCKET", "VEHICLE_WEAPON_SPACE_ROCKET", "VEHICLE_WEAPON_PLANE_ROCKET", "VEHICLE_WEAPON_AVENGER_CANNON", "WEAPON_AIR_DEFENCE_GUN", "WEAPON_EMPLAUNCHER"}
StrikeGive={"WEAPON_AIRSTRIKE_ROCKET", "VEHICLE_WEAPON_AVENGER_CANNON", "VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY", "WEAPON_GRENADELAUNCHER", "VEHICLE_WEAPON_PLAYER_LAZER", "VEHICLE_WEAPON_AKULA_BARRAGE", "VEHICLE_WEAPON_SPACE_ROCKET", "VEHICLE_WEAPON_PLANE_ROCKET", "WEAPON_AIR_DEFENCE_GUN", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_FIREWORK", "VEHICLE_WEAPON_RUINER_ROCKET", "VEHICLE_WEAPON_DELUXO_MISSILE", "WEAPON_HOMINGLAUNCHER", "WEAPON_STINGER", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_EMPLAUNCHER"}
heiststat_setup={{"H3_COMPLETEDPOSIX",-1},{"H3OPT_APPROACH",1},{"H3_HARD_APPROACH",3},{"H3OPT_TARGET",3},{"H3OPT_POI",1023},{"H3OPT_ACCESSPOINTS",2047},{"H3OPT_BITSET1",-1},{"H3OPT_CREWWEAP",1},{"H3OPT_CREWDRIVER",1},{"H3OPT_CREWHACKER",5},{"H3OPT_WEAPS",1},{"H3OPT_VEHS",3},{"H3OPT_DISRUPTSHIP",3},{"H3OPT_BODYARMORLVL",3},{"H3OPT_KEYLEVELS",2},{"H3OPT_MASKS",math.ceil(math.random(0,12))},{"H3OPT_BITSET0",-1}}AmmoType={{"FullMetalJacket",1586900444},{"FullMetalJacket",4126262806},{"FullMetalJacket",234717365},{"FullMetalJacket",758230489},{"FullMetalJacket",3162174467},{"Tracer",3101486635},{"Tracer",1226421483},{"Tracer",1569785553},{"Tracer",1184011213},{"HollowPoint",670318226},{"HollowPoint",3458447638},{"HollowPoint",2089185906},{"Explosive",2916183225},{"Explosive",3985664341},{"Incendiary",2878251257},{"Incendiary",1461941360},{"Incendiary",2465278413},{"Incendiary",3685537684},{"Incendiary",3962074599},{"Incendiary",796697766},{"ArmourPiercing",784861712},{"ArmourPiercing",2797387177},{"ArmourPiercing",423744068},{"ArmourPiercing",423744068},{"ArmourPiercing",1923327840}}
ptfx_dictasset = {{"scr_recrash_rescue", "scr_recrash_rescue_fire"},{"scr_bike_adversary", "scr_adversary_ped_light_good"},{"scr_bike_adversary", "scr_adversary_ped_light_bad"},{"scr_bike_adversary", "scr_adversary_ped_glow"},{"scr_ojdg4_water_exp", "scr_oddjobtraffickingair"},{"veh_xs_vehicle_mods", "veh_nitrous"},{"scr_xs_celebration", "scr_xs_confetti_burst"},{"scr_xs_celebration", "scr_xs_money_rain"},{"scr_xs_celebration", "scr_xs_money_rain_celeb"},{"proj_indep_firework_v2", "scr_firework_indep_spiral_burst_rwb"},{"proj_indep_firework_v2", "scr_firework_indep_burst_rwb"},{"proj_indep_firework_v2", "scr_firework_indep_ring_burst_rwb"},{"weap_xs_weapons", "muz_xs_sr_raygun"},{"wpn_flare", "proj_heist_flare_trail"},{"wpn_indep_firework", "muz_indep_firework  "},{"proj_indep_firework_v2", "scr_firework_indep_repeat_burst_rwb"},{"proj_indep_firework_v", "scr_xmas_firework_burst_fizzle"},{"scr_indep_fireworks", "scr_indep_firework_fountain"},{"scr_indep_fireworks", "scr_indep_firework_starburst"},{"scr_indep_fireworks", "scr_indep_firework_shotburst"},{"proj_indep_firework", "scr_indep_firework_air_burst"},{"scr_weap_bombs", "scr_bomb_gas"},{"scr_dlc_independence", "proj_indep_flare_trail"},{"scr_bike_adversary", "scr_adversary_foot_flames"},{"scr_bike_adversary", "scr_adversary_slipstream"},{"scr_indep_fireworks", "scr_indep_firework_trailburst"},{"scr_indep_fireworks", "scr_indep_firework_trail_spawn"},}
ptfx_Label = {"crash_rescue_fire", "adversary_ped_light_good", "adversary_ped_light_bad", "adversary_ped_glow", "oddjobtraffickingair", "veh_nitrous", "xs_confetti_burst", "xs_money_rain", "xs_money_rain_celeb", "firework_indep_spiral_burst_rwb", "firework_indep_burst_rwb", "firework_indep_ring_burst_rwb", "muz_xs_sr_raygun", "proj_heist_flare_trail", "muz_indep_firework  ", "firework_indep_repeat_burst_rwb", "xmas_firework_burst_fizzle", "indep_firework_fountain", "indep_firework_starburst", "indep_firework_shotburst", "indep_firework_air_burst", "bomb_gas", "proj_indep_flare_trail", "adversary_foot_flames", "adversary_slipstream", "indep_firework_trailburst", "indep_firework_trail_spawn"}
Cus_Obj = {"xm_prop_base_crew_emblem"}
SH_Events = {0x0F478794,0x0F478794,0x0F478794,0x0F478794,0xd56d1ec2}
events_array = {0x0F478794,0xd56d1ec2,0xab0ff9b0,0x49e9f18f,0xAD1762A7,1361475530,1214823473,-283041276,0x566afce8,-2095232746,0x8a5cd410,-1388926377,1111927333,65268844,2131601101,1670832796,1368055548,1915499503,0xaae41734,547083265,-1529596656,2130458390,1280542040}
ScriptEvents = {0x0F478794,0xd56d1ec2,0xab0ff9b0,0x49e9f18f,0xAD1762A7,1361475530,1214823473,-283041276,0x566afce8,-2095232746,0x8a5cd410,-1388926377,1111927333,65268844,2131601101,1670832796,1368055548,1915499503,0xaae41734,547083265,-1529596656,2130458390,1280542040}
SECrash = {-1529596656,998429206,1344238021,-1403511311,136284527,-1388926377,-1257646007,1605622787,-150706708,-1501830047,-1118275782,-66669983,1781594056,1170648687,-966968411,-12829019,-953772271,1984378280,1438167811,1563920620,1301759283,1712468236,989446059,463008662,269343035,20037995,-1864818330,-490124271,-627735605,-253717113,1111927333,33538663,-624451532,1670832796,931221602,2108559203,553322100,-637352381,495813132,1448750576,1802636121,-898440447,-1663428414,-714268990,502129530,-1417625509,1848312823,1264893833,2135857273,1704319171,986542239,-945048174,145637109,-1544474774,1915499503,-1413252009,-1838276770,1449852136,-539605978,-1943111510,523052032,80875492,-1112898503,-1973627888,2144233578,-1342945581,392520928,614900610,-786817413,1016286404,-1264175533,758867073,1615479955,237679622,-768108950,-1539131577,-2130063589,1912010516,494750086,1336398417,-179950075,-1889123320,-26135537,-1937891685,2009132666,2081868904,1306496972,19864882,-744225137,1037001637,-1908874529,423750914,2043658609,21543190,-2126830022,698670235,-994422059,-1592284822,1307741933,-965690359,390850539,-396323643,-1532069709,575515772,1096338276,219130657,1993874732,-1425371040,-1707341117,-1754858829,157347321,-623825288,-2093023277,1556318106,-305805900,696547586,-1331097982,1873334195,1995606767,1077174234,1920422321,-442434037,-1783216053,-904797852,-1668919219,1297161374,954293313,-597435859,474454796,72408517,658452367,3140921,-1920468748,2113140006,965649721,-298492751,1049383920,-1788119910,-883303125,1697891815,1908618910,-374624960,1349489811,-455842518,-1185237959,151198282,-1425392978,1431268358,-1423341094,1761324089,1988340600,-1149473612,-709054397,-770307481,-1748706315,209861916,1537339183,545060564,322823364,1996811535,1789200508,841020275,1635119122,875565740,-883062334,211864106,-272305337,364416023,669856805,893081016,886128956,482008779,-1877978155,-1973318658,-1031340014,-1256086189,380285861,641632818,-631337584,-1057152535,-1031484781,1208254870,-738273183,288497104,1480548969,-2075405904,810367268,493777560,-243085165,-536776992,-669498250,1279400152,1141916680,-922427983,-803535423,-28253330,765043249,-1962078946,-1600651275,-2056857136,230874362,290989781,-791892894,1338868986,1307058941,175794192,-1960492640,936426042,386271652,-1390976345,15576267,601969691,1115266513,526822748,-555356783,-1553386096,-1002336598,597430116,1007883955,-1534026559,-959229116,-1373106115,1434390292,1865881582,-869583434,360408846,-1538544890,-1425016400,1922361302,-1759853392,-1129846248,-2008929105,601184540,2019541335,547083265,1146470621,-2095232746,65268844,1591607624,518824343,-1427892428,-1817320693,-864830496,-1802925712,1501665970,2048227577,-1540864320,1731582181,1736629597,1028831660,-361171523,-1987280249,-320008018,-35026843,-1566383297,1417969358,-922462511,-1247985006,1980827733,-941766459,-1448653591,-685231767,2019427206,1648747828,644915550,-91267732,-1235560027,-1733737974,1992522613,-51486976,668886109,-1134348836,-1919386801,1983907072,867047895,608596116,2130458390,-1338917610,-1367510866,994142343,1280542040,-1925643489,1240068495,-1549662639,385584794,1488038476,851461763,-2085190907,365854470,656530441,-404761101,550764271,421832664,-1770641691,1789363239,111242367,-654484870,-1959124989,-1013989798,-148426250,-943159965,-668341698,-634789188,233011187,-1484595272,1361475530,1583112830,-676470830,1408207199,-2070060686,1368055548,-1348529502,1470816746,749096550,-1234960864,414479011,-2116647047,-1066279757,1693785977,-1681767521,1096517124,-1629692602,-1409079442,-1287840401,-148011082,-1347370111,1968697931,-441166609,-1846254084,997339103,-1247260598,-1015939328,1243703338,-1748216553,-1986544603,-2077605454,1394668142,2065947370,-2121890857,-1481980666,-283041276,-532404525,-306558546,563501261,-1991423686,2071375245,1672674814,564609617,-1858744609,1674887089,-592368332,1144241229,-280224876,196055696,-1136672596,-397256754,1086643333,-105579290,-350081451,2131601101,-1178972880,-585528181,-671989851,-270957098,1719468655,-1928371445,944898672,-1251171789,500306788,1214823473,1348481963,574385837,-1255118495}
ObjectModel = {
	0xe1047885,
	0xac4365dd,
	0x7405d961,
	0xd9f07d2b,
	0x17c1feb4,
	0x9ae513fc,
	0x5ca4a9a0,
	0x8a27cc6b,
	0x0281a599,
	0x7ad6375c,
	0x3e0f343b,
	0x2c949146,
	0xa44fe833,
	0xbb2415db,
	0xc8c9b126,
	0xdf86dea0,
	0xa97d1b39,
	0x048e514e,
	0xf2c32db8,
	0x895092cd,
	0x4347051f,
	0x0fdcd44c,
	0x15fdf42d,
	0x7ef36f3c,
	0x21736223,
	0x66173d84,
	0x9a923550,
	0xb1d454fd,
	0xbff7ca23,
	0xd2aaef29,
	0x1d550845,
	0x7227ae80,
	0x56909e77,
	0x0758609d,
	0x8c9a0a89,
	0x9723f878,
	0x9ef48b82,
	0xae11860f,
	0xd04cf4c3,
	0xb7cc841e,
	0x3683ee4b,
	0x656e950e,
}
World_Map = {}
World_Map["FIB Detailed"] = 3775166597
World_Map["FIB Damaged"] = 2890098141
World_Map["Stargate"] = 3656416555
World_Map["Vinewood"] = 398589620
World_Map["Davis_city"] = 2920384015
World_Map["City Lowlod"] = 2598704124
World_Map["Chiliad Landscape"] = 1554295200
World_Map["Broken Bridge"] = 42050969
World_Map["ContainerShip Base"] = 2060859228
World_Map["invisible Map Base"] = 266130508
World_Map["Revolver Gun object"] = 914615883
World_Map["Revolver Bullets"] = 1128727839
Map_Array = {}
for k, v in pairs(World_Map) do
	Map_Array[#Map_Array+1] = k
end
--tele_presets["Out Of Limits"] = v3(-11352.029297, 7317.774902, 9290.947266)
Weapon_Lists = {}
Weapon_Lists_type = {"Melee", "Handguns", "Submachine_Guns", "Shotguns", "Assault_Rifles", "Machine_Guns", "Sniper_Rifles", "Heavy_Weapons", "Throwables", "Miscellaneous"}
Weapon_Lists.Melee = {"unarmed", "Cougar", "Animal", "Antique Cavalry Dagger", "Baseball Bat", "Broken Bottle", "Crowbar", "Flashlight", "Golf Club", "Hammer", "Hatchet", "Brass Knuckles", "Knife", "Machete", "Switchblade", "Nightstick", "Pipe Wrench", "Battle Axe", "Pool Cue", "Stone Hatchet"}
Weapon_Lists.Handguns = {"Pistol", "PistolMkII", "CombatPistol", "APPistol", "StunGun", "Pistol.50", "SNSPistol", "SNSPistolMkII", "HeavyPistol", "VintagePistol", "FlareGun", "MarksmanPistol", "HeavyRevolver", "HeavyRevolverMkII", "DoubleActionRevolver", "Up-n-Atomizer", "CeramicPistol", "NavyRevolver", "PericoPistol",}
Weapon_Lists.Submachine_Guns = {"Micro SMG", "SMG", "SMG Mk II", "Assault SMG", "Combat PDW", "Machine Pistol", "Mini SMG", "Unholy Hellbringer"}
Weapon_Lists.Shotguns = {"Pump Shotgun", "Pump Shotgun Mk II", "Sawed-Off Shotgun", "Assault Shotgun", "Bullpup Shotgun", "Musket", "Heavy Shotgun", "Double Barrel Shotgun", "Sweeper Shotgun", "Combat Shotgun"}
Weapon_Lists.Assault_Rifles = {"Assault Rifle", "Assault Rifle Mk II", "Carbine Rifle", "Carbine Rifle Mk II", "Advanced Rifle", "Special Carbine", "Special Carbine Mk II", "Bullpup Rifle", "Bullpup Rifle Mk II", "Compact Rifle", "Military Rifle"}
Weapon_Lists.Machine_Guns = {"MG", "Combat MG", "Combat MG Mk II", "Gusenberg Sweeper"}
Weapon_Lists.Sniper_Rifles = {"Sniper Rifle", "Heavy Sniper", "Heavy Sniper Mk II", "Marksman Rifle", "Marksman Rifle Mk II"}
Weapon_Lists.Heavy_Weapons = {"RPG", "Grenade Launcher", "Grenade Launcher Smoke", "Minigun", "Firework Launcher", "Railgun", "Homing Launcher", "Compact Grenade Launcher", "Widowmaker"}
Weapon_Lists.Throwables = {"Grenade", "BZ Gas", "Molotov Cocktail", "Sticky Bomb", "Proximity Mines", "Snowballs", "Pipe Bombs", "Baseball", "Tear Gas", "Flare"}
Weapon_Lists.Miscellaneous = {"Jerry Can", "Parachute", "Fire Extinguisher", "Hazardous Jerry Can"}
Melee={"weapon_unarmed", "weapon_cougar", "weapon_animal", "weapon_dagger", "weapon_bat", "weapon_bottle", "weapon_crowbar", "weapon_flashlight", "weapon_golfclub", "weapon_hammer", "weapon_hatchet", "weapon_knuckle", "weapon_knife", "weapon_machete", "weapon_switchblade", "weapon_nightstick", "weapon_wrench", "weapon_battleaxe", "weapon_poolcue", "weapon_stone_hatchet"}
Handguns={"weapon_pistol", "weapon_pistol_mk2", "weapon_combatpistol", "weapon_appistol", "weapon_stungun", "weapon_pistol50", "weapon_snspistol", "weapon_snspistol_mk2", "weapon_heavypistol", "weapon_vintagepistol", "weapon_flaregun", "weapon_marksmanpistol", "weapon_revolver", "weapon_revolver_mk2", "weapon_doubleaction", "weapon_raypistol", "weapon_ceramicpistol", "weapon_navyrevolver", "weapon_gadgetpistol"}
Submachine_Guns={"weapon_microsmg", "weapon_smg", "weapon_smg_mk2", "weapon_assaultsmg", "weapon_combatpdw", "weapon_machinepistol", "weapon_minismg", "weapon_raycarbine"}
Shotguns={"weapon_pumpshotgun", "weapon_pumpshotgun_mk2", "weapon_sawnoffshotgun", "weapon_assaultshotgun", "weapon_bullpupshotgun", "weapon_musket", "weapon_heavyshotgun", "weapon_dbshotgun", "weapon_autoshotgun", "weapon_combatshotgun"}
Assault_Rifles={"weapon_assaultrifle", "weapon_assaultrifle_mk2", "weapon_carbinerifle", "weapon_carbinerifle_mk2", "weapon_advancedrifle", "weapon_specialcarbine", "weapon_specialcarbine_mk2", "weapon_bullpuprifle", "weapon_bullpuprifle_mk2", "weapon_compactrifle", "weapon_militaryrifle"}
Machine_Guns={"weapon_mg", "weapon_combatmg", "weapon_combatmg_mk2", "weapon_gusenberg"}
Sniper_Rifles={"weapon_sniperrifle", "weapon_heavysniper", "weapon_heavysniper_mk2", "weapon_marksmanrifle", "weapon_marksmanrifle_mk2"}
Heavy_Weapons={"weapon_rpg", "weapon_grenadelauncher", "weapon_grenadelauncher_smoke", "weapon_minigun", "weapon_firework", "weapon_railgun", "weapon_hominglauncher", "weapon_compactlauncher", "weapon_rayminigun"}
Throwables={"weapon_grenade", "weapon_bzgas", "weapon_molotov", "weapon_stickybomb", "weapon_proxmine", "weapon_snowball", "weapon_pipebomb", "weapon_ball", "weapon_smokegrenade", "weapon_flare"}
Miscellaneous={"weapon_petrolcan", "gadget_parachute", "weapon_fireextinguisher", "weapon_hazardcan"}
local weap, weaponz
weap = {}
weaponz = {}
decorators = {
	{"RespawnVeh", 3},
	{"GBMissionFire", 3},
	{"MPBitset", 3},
	{"RandomID", 3},
	{"noPlateScan", 2},
	{"CreatedByPegasus", 2},
	{"IgnoredByQuickSave", 3},
	{"IgnoredByQuickSave", 2},
	{"Player_Vehicle", 3},
	{"PV_Slot", 3},
	{"Veh_Modded_By_Player", 3},
	{"PYV_Yacht", 3},
	{"Player_Truck", 3},
	{"Player_Avenger", 3},
	{"Player_Hacker_Truck", 3},
	{"Previous_Owner", 3},
	{"Not_Allow_As_Saved_Veh", 3},
	{"cashondeadbody", 3},
	{"BBCarrier", 3},
	{"FMDeliverableID", 3},
	{"GBCVehicle", 3},
	{"GangBackup", 3},
	{"BlockFriendGrab", 3},
	{"Bought_Drugs", 2},
	{"AttributeDamage", 3},
	{"CokeInPossession", 1},
	{"ContrabandDeliveryType", 3},
	{"ContrabandOwner", 3},
	{"Creator_Trailer", 3},
	{"CrowdControlSetUp", 3},
	{"Darts_name", 3},
	{"EnableVehLuxeActs", 3},
	{"ExportVehicle", 3},
	{"GetawayVehicleValid", 3},
	{"Getaway_Winched", 3},
	{"Heist_Veh_ID", 3},
	{"HeliTaxi", 3},
	{"HeroinInPossession", 1},
	{"LUXE_VEH_INSTANCE_ID", 3},
	{"MC_ChasePedID", 3},
	{"MC_EntityID", 3},
	{"MC_Team0_VehDeliveredRules", 3},
	{"MC_Team1_VehDeliveredRules", 3},
	{"MC_Team2_VehDeliveredRules", 3},
	{"MC_Team3_VehDeliveredRules", 3},
	{"MapGauntlet", 3},
	{"MatchId", 3},
	{"MethInPossession", 1},
	{"MissionType", 3},
	{"PYV_Owner", 3},
	{"PYV_Vehicle", 3},
	{"PYV_WarpFrom", 3},
	{"Player_Boss", 3},
	{"Player_Goon", 3},
	{"Previous_Boss", 3},
	{"RampageCarExploded", 3},
	{"Skill_Blocker", 2},
	{"Sprayed_Vehicle_Decorator", 2},
	{"Sprayed_Vehicle_Timer_Dec", 5},
	{"Carwash_Vehicle_Decorator", 3},
	{"TargetPlayerForTeam", 3},
	{"TeamId", 3},
	{"TeamId", 1},
	{"UsingForTimeTrial", 3},
	{"Vehicle_Reward", 3},
	{"Vehicle_Reward_Teams", 3},
	{"WeedInPossession", 1},
	{"XP_Blocker", 2},
	{"bombdec1", 3},
	{"bombdec", 3},
	{"bombowner", 3},
	{"doe_elk", 3},
	{"hunt_chal_weapon", 3},
	{"hunt_kill_time", 3},
	{"hunt_nocall", 3},
	{"hunt_score", 3},
	{"hunt_undetected", 3},
	{"hunt_weapon", 3},
	{"prisonBreakBoss", 2},
	{"BeforeCorona_0", 2},
	{"BeforeCorona_0", 3},
	{"BeforeCorona", 3},
	{"Player_Moon_Pool", 3},
	{"Company_SUV", 3},
	{"Player_Submarine", 3},
	{"VehicleList", 2},
}
decoratorType = {"DECOR_TYPE_FLOAT", "DECOR_TYPE_BOOL", "DECOR_TYPE_INT", "DECOR_TYPE_UNK", "DECOR_TYPE_TIME"}
Decorators = {
	"cashondeadbody",
	"GBMissionFire",
	"AttributeDamage",
	"BBCarrier",
	"BlockFriendGrab",
	"Player_Avenger",
	"Player_Submarine",
	"Player_Moon_Pool",
	"bombdec",
	"bombdec1",
	"bombowner",
	"Carwash_Vehicle_Decorator",
	"ContrabandDeliveryType",
	"ContrabandOwner",
	"CreatedByPegasus",
	"Creator_Trailer",
	"Darts_name",
	"doe_elk",
	"EnableVehLuxeActs",
	"ExportVehicle",
	"FMDeliverableID",
	"GBCVehicle",
	"Getaway_Winched",
	"GetawayVehicleValid",
	"Heist_Veh_ID",
	"HeliTaxi",
	"hunt_chal_weapon",
	"hunt_kill_time",
	"hunt_nocall",
	"hunt_score",
	"hunt_undetected",
	"hunt_weapon",
	"IgnoredByQuickSave",
	"LUXE_VEH_INSTANCE_ID",
	"MapGauntlet",
	"MatchId",
	"MC_ChasePedID",
	"MC_EntityID",
	"MissionType",
	"MPBitset",
	"Not_Allow_As_Saved_Veh",
	"Player_Boss",
	"Player_Goon",
	"Player_Hacker_Truck",
	"Player_Truck",
	"Player_Vehicle",
	"Previous_Boss",
	"Previous_Owner",
	"PV_Slot",
	"PYV_Owner",
	"PYV_Vehicle",
	"PYV_WarpFrom",
	"PYV_Yacht",
	"RampageCarExploded",
	"RandomID",
	"RespawnVeh",
	"Skill_Blocker",
	"Sprayed_Vehicle_Decorator",
	"Sprayed_Vehicle_Timer_Dec",
	"TeamId",
	"UsingForTimeTrial",
	"Veh_Modded_By_Player",
	"XP_Blocker",
	"Player_Vehicle",
	"PV_Slot",
	"Previous_Owner",
	"Sprayed_Vehicle_Decorator",
	"Sprayed_Vehicle_Timer_Dec",
	"Vehicle_Reward",
	"Vehicle_Reward_Teams",
	"Skill_Blocker",
	"TargetPlayerForTeam",
	"XP_Blocker",
	"CrowdControlSetUp",
	"Bought_Drugs",
	"HeroinInPossession",
	"CokeInPossession",
	"WeedInPossession",
	"MethInPossession",
	"bombdec",
	"bombdec1",
	"bombowner",
	"noPlateScan",
	"prisonBreakBoss",
	"cashondeadbody",
	"MissionType",
	"MatchId",
	"TeamId",
	"Not_Allow_As_Saved_Veh",
	"Veh_Modded_By_Player",
	"MPBitset",
	"MC_EntityID",
	"MC_ChasePedID",
	"MC_Team0_VehDeliveredRules",
	"MC_Team1_VehDeliveredRules",
	"MC_Team2_VehDeliveredRules",
	"MC_Team3_VehDeliveredRules",
	"AttributeDamage",
	"GangBackup",
	"CreatedByPegasus",
	"BeforeCorona_0",
}
combatTask = {}
combatTask[0] = "None"
combatTask[1] = "Unk"
combatTask[2] = "CTaskVehicleRam"
combatTask[3] = "CTaskVehicleBlock"
combatTask[4] = "CTaskVehicleGoToPlane"
combatTask[5] = "CTaskVehicleStop"
combatTask[6] = "CTaskVehicleAttack"
combatTask[7] = "CTaskVehicleFollow"
combatTask[8] = "CTaskVehicleFleeAirborne"
combatTask[9] = "CTaskVehicleCircle"
combatTask[10] = "CTaskVehicleEscort"
combatTask[15] = "CTaskVehicleFollowRecording"
combatTask[16] = "CTaskVehiclePoliceBehaviour"
combatTask[17] = "CTaskVehicleCrash"
local int_flags <const> = {}
local boneid = {6286,57597,24818,24817,24816,23553,11816,40269,51826,57005,28252,52301,10706,36864,11816,39317,45509,58271,18905,61163,14201,64729,63931,65068,31086,12844}
Ped_modals_a = {
    "a_c_boar",
    "a_c_cat_01",
    "a_c_chickenhawk",
    "a_c_chimp",
    "a_c_chop",
    "a_c_chop_02",
    "a_c_cormorant",
    "a_c_cow",
    "a_c_coyote",
    "a_c_crow",
    "a_c_deer",
    "a_c_dolphin",
    "a_c_fish",
    "a_c_hen",
    "a_c_humpback",
    "a_c_husky",
    "a_c_killerwhale",
    "a_c_mtlion",
    "a_c_panther",
    "a_c_pig",
    "a_c_pigeon",
    "a_c_poodle",
    "a_c_pug",
    "a_c_rabbit_01",
    "a_c_rat",
    "a_c_retriever",
    "a_c_rhesus",
    "a_c_rottweiler",
    "a_c_seagull",
    "a_c_sharkhammer",
    "a_c_sharktiger",
    "a_c_shepherd",
    "a_c_stingray",
    "a_c_westy",
    "a_c_whalegrey",
    "a_f_m_beach_01",
    "a_f_m_bevhills_01",
    "a_f_m_bevhills_02",
    "a_f_m_bodybuild_01",
    "a_f_m_business_02",
    "a_f_m_downtown_01",
    "a_f_m_eastsa_01",
    "a_f_m_eastsa_02",
    "a_f_m_fatbla_01",
    "a_f_m_fatcult_01",
    "a_f_m_fatwhite_01",
    "a_f_m_ktown_01",
    "a_f_m_ktown_02",
    "a_f_m_prolhost_01",
    "a_f_m_salton_01",
    "a_f_m_skidrow_01",
    "a_f_m_soucent_01",
    "a_f_m_soucent_02",
    "a_f_m_soucentmc_01",
    "a_f_m_tourist_01",
    "a_f_m_tramp_01",
    "a_f_m_trampbeac_01",
    "a_f_o_genstreet_01",
    "a_f_o_indian_01",
    "a_f_o_ktown_01",
    "a_f_o_salton_01",
    "a_f_o_soucent_01",
    "a_f_o_soucent_02",
    "a_f_y_beach_01",
    "a_f_y_beach_02",
    "a_f_y_bevhills_01",
    "a_f_y_bevhills_02",
    "a_f_y_bevhills_03",
    "a_f_y_bevhills_04",
    "a_f_y_bevhills_05",
    "a_f_y_business_01",
    "a_f_y_business_02",
    "a_f_y_business_03",
    "a_f_y_business_04",
    "a_f_y_carclub_01",
    "a_f_y_clubcust_01",
    "a_f_y_clubcust_02",
    "a_f_y_clubcust_03",
    "a_f_y_clubcust_04",
    "a_f_y_eastsa_01",
    "a_f_y_eastsa_02",
    "a_f_y_eastsa_03",
    "a_f_y_epsilon_01",
    "a_f_y_femaleagent",
    "a_f_y_fitness_01",
    "a_f_y_fitness_02",
    "a_f_y_gencaspat_01",
    "a_f_y_genhot_01",
    "a_f_y_golfer_01",
    "a_f_y_hiker_01",
    "a_f_y_hippie_01",
    "a_f_y_hipster_01",
    "a_f_y_hipster_02",
    "a_f_y_hipster_03",
    "a_f_y_hipster_04",
    "a_f_y_indian_01",
    "a_f_y_runner_01",
    "a_f_y_rurmeth_01",
    "a_f_y_scdressy_01",
    "a_f_y_skater_01",
    "a_f_y_smartcaspat_01",
    "a_f_y_soucent_01",
    "a_f_y_soucent_02",
    "a_f_y_soucent_03",
    "a_f_y_studioparty_01",
    "a_f_y_studioparty_02",
    "a_f_y_tennis_01",
    "a_f_y_topless_01",
    "a_f_y_tourist_01",
    "a_f_y_tourist_02",
    "a_f_y_vinewood_01",
    "a_f_y_vinewood_02",
    "a_f_y_vinewood_03",
    "a_f_y_vinewood_04",
    "a_f_y_yoga_01",
    "a_m_m_acult_01",
    "a_m_m_afriamer_01",
    "a_m_m_beach_01",
    "a_m_m_beach_02",
    "a_m_m_bevhills_01",
    "a_m_m_bevhills_02",
    "a_m_m_business_01",
    "a_m_m_eastsa_01",
    "a_m_m_eastsa_02",
    "a_m_m_farmer_01",
    "a_m_m_fatlatin_01",
    "a_m_m_genfat_01",
    "a_m_m_genfat_02",
    "a_m_m_golfer_01",
    "a_m_m_hasjew_01",
    "a_m_m_hillbilly_01",
    "a_m_m_hillbilly_02",
    "a_m_m_indian_01",
    "a_m_m_ktown_01",
    "a_m_m_malibu_01",
    "a_m_m_mexcntry_01",
    "a_m_m_mexlabor_01",
    "a_m_m_mlcrisis_01",
    "a_m_m_og_boss_01",
    "a_m_m_paparazzi_01",
    "a_m_m_polynesian_01",
    "a_m_m_prolhost_01",
    "a_m_m_rurmeth_01",
    "a_m_m_salton_01",
    "a_m_m_salton_02",
    "a_m_m_salton_03",
    "a_m_m_salton_04",
    "a_m_m_skater_01",
    "a_m_m_skidrow_01",
    "a_m_m_socenlat_01",
    "a_m_m_soucent_01",
    "a_m_m_soucent_02",
    "a_m_m_soucent_03",
    "a_m_m_soucent_04",
    "a_m_m_stlat_02",
    "a_m_m_studioparty_01",
    "a_m_m_tennis_01",
    "a_m_m_tourist_01",
    "a_m_m_tramp_01",
    "a_m_m_trampbeac_01",
    "a_m_m_tranvest_01",
    "a_m_m_tranvest_02",
    "a_m_o_acult_01",
    "a_m_o_acult_02",
    "a_m_o_beach_01",
    "a_m_o_beach_02",
    "a_m_o_genstreet_01",
    "a_m_o_ktown_01",
    "a_m_o_salton_01",
    "a_m_o_soucent_01",
    "a_m_o_soucent_02",
    "a_m_o_soucent_03",
    "a_m_o_tramp_01",
    "a_m_y_acult_01",
    "a_m_y_acult_02",
    "a_m_y_beach_01",
    "a_m_y_beach_02",
    "a_m_y_beach_03",
    "a_m_y_beach_04",
    "a_m_y_beachvesp_01",
    "a_m_y_beachvesp_02",
    "a_m_y_bevhills_01",
    "a_m_y_bevhills_02",
    "a_m_y_breakdance_01",
    "a_m_y_busicas_01",
    "a_m_y_business_01",
    "a_m_y_business_02",
    "a_m_y_business_03",
    "a_m_y_carclub_01",
    "a_m_y_clubcust_01",
    "a_m_y_clubcust_02",
    "a_m_y_clubcust_03",
    "a_m_y_clubcust_04",
    "a_m_y_cyclist_01",
    "a_m_y_dhill_01",
    "a_m_y_downtown_01",
    "a_m_y_eastsa_01",
    "a_m_y_eastsa_02",
    "a_m_y_epsilon_01",
    "a_m_y_epsilon_02",
    "a_m_y_gay_01",
    "a_m_y_gay_02",
    "a_m_y_gencaspat_01",
    "a_m_y_genstreet_01",
    "a_m_y_genstreet_02",
    "a_m_y_golfer_01",
    "a_m_y_hasjew_01",
    "a_m_y_hiker_01",
    "a_m_y_hippy_01",
    "a_m_y_hipster_01",
    "a_m_y_hipster_02",
    "a_m_y_hipster_03",
    "a_m_y_indian_01",
    "a_m_y_jetski_01",
    "a_m_y_juggalo_01",
    "a_m_y_ktown_01",
    "a_m_y_ktown_02",
    "a_m_y_latino_01",
    "a_m_y_methhead_01",
    "a_m_y_mexthug_01",
    "a_m_y_motox_01",
    "a_m_y_motox_02",
    "a_m_y_musclbeac_01",
    "a_m_y_musclbeac_02",
    "a_m_y_polynesian_01",
    "a_m_y_roadcyc_01",
    "a_m_y_runner_01",
    "a_m_y_runner_02",
    "a_m_y_salton_01",
    "a_m_y_skater_01",
    "a_m_y_skater_02",
    "a_m_y_smartcaspat_01",
    "a_m_y_soucent_01",
    "a_m_y_soucent_02",
    "a_m_y_soucent_03",
    "a_m_y_soucent_04",
    "a_m_y_stbla_01",
    "a_m_y_stbla_02",
    "a_m_y_stlat_01",
    "a_m_y_studioparty_01",
    "a_m_y_stwhi_01",
    "a_m_y_stwhi_02",
    "a_m_y_sunbathe_01",
    "a_m_y_surfer_01",
    "a_m_y_tattoocust_01",
    "a_m_y_vindouche_01",
    "a_m_y_vinewood_01",
    "a_m_y_vinewood_02",
    "a_m_y_vinewood_03",
    "a_m_y_vinewood_04",
    "a_m_y_yoga_01",
    "a_f_y_juggalo_01"
}
Ped_modals_c = {
    "cs_lestercrest",
    "cs_lestercrest_2",
    "cs_lestercrest_3",
    "cs_amandatownley",
    "cs_karen_daniels",
    "cs_andreas",
    "cs_ashley",
    "cs_bankman",
    "cs_barry",
    "cs_beverly",
    "cs_brad",
    "cs_bradcadaver",
    "cs_carbuyer",
    "cs_casey",
    "cs_chengsr",
    "cs_chrisformage",
    "cs_clay",
    "cs_dale",
    "cs_davenorton",
    "cs_debra",
    "cs_denise",
    "cs_devin",
    "cs_dom",
    "cs_dreyfuss",
    "cs_drfriedlander",
    "cs_fabien",
    "cs_fbisuit_01",
    "cs_floyd",
    "cs_guadalope",
    "cs_gurk",
    "cs_hunter",
    "cs_janet",
    "cs_jewelass",
    "cs_jimmyboston",
    "cs_jimmydisanto",
    "cs_jimmydisanto2",
    "cs_joeminuteman",
    "cs_johnnyklebitz",
    "cs_josef",
    "cs_josh",
    "cs_lamardavis",
    "cs_lamardavis_02",
    "cs_lazlow",
    "cs_lazlow_2",
    "cs_lifeinvad_01",
    "cs_magenta",
    "cs_manuel",
    "cs_marnie",
    "cs_martinmadrazo",
    "cs_maryann",
    "cs_michelle",
    "cs_milton",
    "cs_molly",
    "cs_movpremf_01",
    "cs_movpremmale",
    "cs_mrk",
    "cs_mrs_thornhill",
    "cs_mrsphillips",
    "cs_natalia",
    "cs_nervousron",
    "cs_nigel",
    "cs_old_man1a",
    "cs_old_man2",
    "cs_omega",
    "cs_orleans",
    "cs_paper",
    "cs_patricia",
    "cs_patricia_02",
    "cs_priest",
    "cs_prolsec_02",
    "cs_russiandrunk",
    "cs_siemonyetarian",
    "cs_solomon",
    "cs_stevehains",
    "cs_stretch",
    "cs_tanisha",
    "cs_taocheng",
    "cs_taocheng2",
    "cs_taostranslator",
    "cs_taostranslator2",
    "cs_tenniscoach",
    "cs_terry",
    "cs_tom",
    "cs_tomepsilon",
    "cs_tracydisanto",
    "cs_wade",
    "cs_zimbor",
    "csb_abigail",
    "csb_agatha",
    "csb_agent",
    "csb_alan",
    "csb_anita",
    "csb_anton",
    "csb_ary",
    "csb_ary_02",
    "csb_avery",
    "csb_avischwartzman_02",
    "csb_avon",
    "csb_ballas_leader",
    "csb_ballasog",
    "csb_billionaire",
    "csb_bogdan",
    "csb_bride",
    "csb_brucie2",
    "csb_bryony",
    "csb_burgerdrug",
    "csb_car3guy1",
    "csb_car3guy2",
    "csb_celeb_01",
    "csb_chef",
    "csb_chef2",
    "csb_chin_goon",
    "csb_cletus",
    "csb_cop",
    "csb_customer",
    "csb_denise_friend",
    "csb_dix",
    "csb_djblamadon",
    "csb_drugdealer",
    "csb_englishdave",
    "csb_englishdave_02",
    "csb_fos_rep",
    "csb_g",
    "csb_georginacheng",
    "csb_golfer_a",
    "csb_golfer_b",
    "csb_groom",
    "csb_grove_str_dlr",
    "csb_gustavo",
    "csb_hao",
    "csb_hao_02",
    "csb_helmsmanpavel",
    "csb_huang",
    "csb_hugh",
    "csb_imani",
    "csb_imran",
    "csb_isldj_00",
    "csb_isldj_01",
    "csb_isldj_02",
    "csb_isldj_03",
    "csb_isldj_04",
    "csb_jackhowitzer",
    "csb_janitor",
    "csb_jio",
    "csb_jio_02",
    "csb_johnny_guns",
    "csb_juanstrickler",
    "csb_maude",
    "csb_miguelmadrazo",
    "csb_mimi",
    "csb_mjo",
    "csb_mjo_02",
    "csb_money",
    "csb_moodyman_02",
    "csb_mp_agent14",
    "csb_mrs_r",
    "csb_musician_00",
    "csb_mweather",
    "csb_ortega",
    "csb_oscar",
    "csb_paige",
    "csb_party_promo",
    "csb_popov",
    "csb_porndudes",
    "csb_prologuedriver",
    "csb_prolsec",
    "csb_ramp_gang",
    "csb_ramp_hic",
    "csb_ramp_hipster",
    "csb_ramp_marine",
    "csb_ramp_mex",
    "csb_rashcosvki",
    "csb_reporter",
    "csb_req_officer",
    "csb_roccopelosi",
    "csb_screen_writer",
    "csb_security_a",
    "csb_sessanta",
    "csb_sol",
    "csb_soundeng_00",
    "csb_sss",
    "csb_stripper_01",
    "csb_stripper_02",
    "csb_talcc",
    "csb_talmm",
    "csb_thornton",
    "csb_tomcasino",
    "csb_tonya",
    "csb_tonyprince",
    "csb_trafficwarden",
    "csb_undercover",
    "csb_vagos_leader",
    "csb_vagspeak",
    "csb_vernon",
    "csb_vincent",
    "csb_vincent_2",
    "csb_wendy"
}
Ped_modals_g = {
    "g_f_importexport_01",
    "g_f_y_ballas_01",
    "g_f_y_families_01",
    "g_f_y_lost_01",
    "g_f_y_vagos_01",
    "g_m_importexport_01",
    "g_m_m_armboss_01",
    "g_m_m_armgoon_01",
    "g_m_m_armlieut_01",
    "g_m_m_cartelguards_01",
    "g_m_m_cartelguards_02",
    "g_m_m_casrn_01",
    "g_m_m_chemwork_01",
    "g_m_m_chiboss_01",
    "g_m_m_chicold_01",
    "g_m_m_chigoon_01",
    "g_m_m_chigoon_02",
    "g_m_m_goons_01",
    "g_m_m_korboss_01",
    "g_m_m_mexboss_01",
    "g_m_m_mexboss_02",
    "g_m_m_prisoners_01",
    "g_m_m_slasher_01",
    "g_m_y_armgoon_02",
    "g_m_y_azteca_01",
    "g_m_y_ballaeast_01",
    "g_m_y_ballaorig_01",
    "g_m_y_ballasout_01",
    "g_m_y_famca_01",
    "g_m_y_famdnf_01",
    "g_m_y_famfor_01",
    "g_m_y_korean_01",
    "g_m_y_korean_02",
    "g_m_y_korlieut_01",
    "g_m_y_lost_01",
    "g_m_y_lost_02",
    "g_m_y_lost_03",
    "g_m_y_mexgang_01",
    "g_m_y_mexgoon_01",
    "g_m_y_mexgoon_02",
    "g_m_y_mexgoon_03",
    "g_m_y_pologoon_01",
    "g_m_y_pologoon_02",
    "g_m_y_salvaboss_01",
    "g_m_y_salvagoon_01",
    "g_m_y_salvagoon_02",
    "g_m_y_salvagoon_03",
    "g_m_y_strpunk_01",
    "g_m_y_strpunk_02"
}
Ped_modals_h = {
    "hc_driver",
    "hc_gunman",
    "hc_hacker"
}
Ped_modals_i = {
    "ig_lestercrest",
    "ig_lestercrest_2",
    "ig_lestercrest_3",
    "ig_karen_daniels",
    "ig_kaylee",
    "ig_kerrymcintosh",
    "ig_kerrymcintosh_02",
    "ig_abigail",
    "ig_agatha",
    "ig_agent",
    "ig_amandatownley",
    "ig_andreas",
    "ig_ary",
    "ig_ary_02",
    "ig_ashley",
    "ig_avery",
    "ig_avischwartzman_02",
    "ig_avon",
    "ig_ballas_leader",
    "ig_ballasog",
    "ig_bankman",
    "ig_barry",
    "ig_benny",
    "ig_benny_02",
    "ig_bestmen",
    "ig_beverly",
    "ig_billionaire",
    "ig_brad",
    "ig_bride",
    "ig_brucie2",
    "ig_car3guy1",
    "ig_car3guy2",
    "ig_casey",
    "ig_celeb_01",
    "ig_chef",
    "ig_chef2",
    "ig_chengsr",
    "ig_chrisformage",
    "ig_clay",
    "ig_claypain",
    "ig_cletus",
    "ig_dale",
    "ig_davenorton",
    "ig_denise",
    "ig_devin",
    "ig_dix",
    "ig_djblamadon",
    "ig_djblamrupert",
    "ig_djblamryanh",
    "ig_djblamryans",
    "ig_djdixmanager",
    "ig_djgeneric_01",
    "ig_djsolfotios",
    "ig_djsoljakob",
    "ig_djsolmanager",
    "ig_djsolmike",
    "ig_djsolrobt",
    "ig_djtalaurelia",
    "ig_djtalignazio",
    "ig_dom",
    "ig_dreyfuss",
    "ig_drfriedlander",
    "ig_drugdealer",
    "ig_englishdave",
    "ig_englishdave_02",
    "ig_entourage_a",
    "ig_entourage_b",
    "ig_fabien",
    "ig_fbisuit_01",
    "ig_floyd",
    "ig_g",
    "ig_georginacheng",
    "ig_golfer_a",
    "ig_golfer_b",
    "ig_groom",
    "ig_gustavo",
    "ig_hao",
    "ig_hao_02",
    "ig_helmsmanpavel",
    "ig_huang",
    "ig_hunter",
    "ig_imani",
    "ig_isldj_00",
    "ig_isldj_01",
    "ig_isldj_02",
    "ig_isldj_03",
    "ig_isldj_04",
    "ig_isldj_04_d_01",
    "ig_isldj_04_d_02",
    "ig_isldj_04_e_01",
    "ig_jackie",
    "ig_janet",
    "ig_jay_norris",
    "ig_jewelass",
    "ig_jimmyboston",
    "ig_jimmyboston_02",
    "ig_jimmydisanto",
    "ig_jimmydisanto2",
    "ig_jio",
    "ig_jio_02",
    "ig_joeminuteman",
    "ig_johnny_guns",
    "ig_johnnyklebitz",
    "ig_josef",
    "ig_josh",
    "ig_juanstrickler",
    "ig_lacey_jones_02",
    "ig_lamardavis",
    "ig_lamardavis_02",
    "ig_lazlow",
    "ig_lazlow_2",
    "ig_lifeinvad_01",
    "ig_lifeinvad_02",
    "ig_lildee",
    "ig_magenta",
    "ig_malc",
    "ig_manuel",
    "ig_marnie",
    "ig_maryann",
    "ig_maude",
    "ig_michelle",
    "ig_miguelmadrazo",
    "ig_milton",
    "ig_mimi",
    "ig_mjo",
    "ig_mjo_02",
    "ig_molly",
    "ig_money",
    "ig_moodyman_02",
    "ig_mp_agent14",
    "ig_mrk",
    "ig_mrs_thornhill",
    "ig_mrsphillips",
    "ig_musician_00",
    "ig_natalia",
    "ig_nervousron",
    "ig_nigel",
    "ig_old_man1a",
    "ig_old_man2",
    "ig_oldrichguy",
    "ig_omega",
    "ig_oneil",
    "ig_orleans",
    "ig_ortega",
    "ig_paige",
    "ig_paper",
    "ig_party_promo",
    "ig_patricia",
    "ig_patricia_02",
    "ig_pilot",
    "ig_popov",
    "ig_priest",
    "ig_prolsec_02",
    "ig_ramp_gang",
    "ig_ramp_hic",
    "ig_ramp_hipster",
    "ig_ramp_mex",
    "ig_rashcosvki",
    "ig_req_officer",
    "ig_roccopelosi",
    "ig_russiandrunk",
    "ig_sacha",
    "ig_screen_writer",
    "ig_security_a",
    "ig_sessanta",
    "ig_siemonyetarian",
    "ig_sol",
    "ig_solomon",
    "ig_soundeng_00",
    "ig_sss",
    "ig_stevehains",
    "ig_stretch",
    "ig_talcc",
    "ig_talina",
    "ig_talmm",
    "ig_tanisha",
    "ig_taocheng",
    "ig_taocheng2",
    "ig_taostranslator",
    "ig_taostranslator2",
    "ig_tenniscoach",
    "ig_terry",
    "ig_thornton",
    "ig_tomcasino",
    "ig_tomepsilon",
    "ig_tonya",
    "ig_tonyprince",
    "ig_tracydisanto",
    "ig_trafficwarden",
    "ig_tylerdix",
    "ig_tylerdix_02",
    "ig_vagos_leader",
    "ig_vagspeak",
    "ig_vernon",
    "ig_vincent",
    "ig_vincent_2",
    "ig_vincent_3",
    "ig_wade",
    "ig_wendy",
    "ig_zimbor"
}
Ped_modals_m = {
    "mp_f_bennymech_01",
    "mp_f_boatstaff_01",
    "mp_f_cardesign_01",
    "mp_f_chbar_01",
    "mp_f_cocaine_01",
    "mp_f_counterfeit_01",
    "mp_f_deadhooker",
    "mp_f_execpa_01",
    "mp_f_execpa_02",
    "mp_f_forgery_01",
    "mp_f_freemode_01",
    "mp_f_helistaff_01",
    "mp_f_meth_01",
    "mp_f_misty_01",
    "mp_f_stripperlite",
    "mp_f_weed_01",
    "mp_g_m_pros_01",
    "mp_headtargets",
    "mp_m_avongoon",
    "mp_m_boatstaff_01",
    "mp_m_bogdangoon",
    "mp_m_cocaine_01",
    "mp_m_counterfeit_01",
    "mp_m_exarmy_01",
    "mp_m_execpa_01",
    "mp_m_famdd_01",
    "mp_m_fibsec_01",
    "mp_m_forgery_01",
    "mp_m_freemode_01",
    "mp_m_g_vagfun_01",
    "mp_m_meth_01",
    "mp_m_securoguard_01",
    "mp_m_shopkeep_01",
    "mp_m_waremech_01",
    "mp_m_weapexp_01",
    "mp_m_weapwork_01",
    "mp_m_weed_01",
    "mp_m_claude_01",
    "mp_s_m_armoured_01",
    "mp_m_marston_01",
    "mp_m_niko_01"
}
Ped_modals_p = {
    "p_franklin_02",
    "player_one",
    "player_two",
    "player_zero"
}
Ped_modals_s = {
    "s_f_m_autoshop_01",
    "s_f_m_fembarber",
    "s_f_m_maid_01",
    "s_f_m_retailstaff_01",
    "s_f_m_shop_high",
    "s_f_m_studioassist_01",
    "s_f_m_sweatshop_01",
    "s_f_y_airhostess_01",
    "s_f_y_bartender_01",
    "s_f_y_baywatch_01",
    "s_f_y_beachbarstaff_01",
    "s_f_y_casino_01",
    "s_f_y_clubbar_01",
    "s_f_y_clubbar_02",
    "s_f_y_cop_01",
    "s_f_y_factory_01",
    "s_f_y_hooker_01",
    "s_f_y_hooker_02",
    "s_f_y_hooker_03",
    "s_f_y_migrant_01",
    "s_f_y_movprem_01",
    "s_f_y_ranger_01",
    "s_f_y_scrubs_01",
    "s_f_y_sheriff_01",
    "s_f_y_shop_low",
    "s_f_y_shop_mid",
    "s_f_y_stripper_01",
    "s_f_y_stripper_02",
    "s_f_y_stripperlite",
    "s_f_y_sweatshop_01",
    "s_m_m_ammucountry",
    "s_m_m_armoured_01",
    "s_m_m_armoured_02",
    "s_m_m_autoshop_01",
    "s_m_m_autoshop_02",
    "s_m_m_autoshop_03",
    "s_m_m_bouncer_01",
    "s_m_m_bouncer_02",
    "s_m_m_ccrew_01",
    "s_m_m_chemsec_01",
    "s_m_m_ciasec_01",
    "s_m_m_cntrybar_01",
    "s_m_m_dockwork_01",
    "s_m_m_doctor_01",
    "s_m_m_drugprocess_01",
    "s_m_m_fiboffice_01",
    "s_m_m_fiboffice_02",
    "s_m_m_fibsec_01",
    "s_m_m_fieldworker_01",
    "s_m_m_gaffer_01",
    "s_m_m_gardener_01",
    "s_m_m_gentransport",
    "s_m_m_hairdress_01",
    "s_m_m_highsec_01",
    "s_m_m_highsec_02",
    "s_m_m_highsec_03",
    "s_m_m_highsec_04",
    "s_m_m_highsec_05",
    "s_m_m_janitor",
    "s_m_m_lathandy_01",
    "s_m_m_lifeinvad_01",
    "s_m_m_linecook",
    "s_m_m_lsmetro_01",
    "s_m_m_mariachi_01",
    "s_m_m_marine_01",
    "s_m_m_marine_02",
    "s_m_m_migrant_01",
    "s_m_m_movalien_01",
    "s_m_m_movprem_01",
    "s_m_m_movspace_01",
    "s_m_m_paramedic_01",
    "s_m_m_pilot_01",
    "s_m_m_pilot_02",
    "s_m_m_postal_01",
    "s_m_m_postal_02",
    "s_m_m_prisguard_01",
    "s_m_m_raceorg_01",
    "s_m_m_scientist_01",
    "s_m_m_security_01",
    "s_m_m_snowcop_01",
    "s_m_m_strperf_01",
    "s_m_m_strpreach_01",
    "s_m_m_strvend_01",
    "s_m_m_studioassist_02",
    "s_m_m_studioprod_01",
    "s_m_m_studiosoueng_02",
    "s_m_m_tattoo_01",
    "s_m_m_trucker_01",
    "s_m_m_ups_01",
    "s_m_m_ups_02",
    "s_m_o_busker_01",
    "s_m_y_airworker",
    "s_m_y_ammucity_01",
    "s_m_y_armymech_01",
    "s_m_y_autopsy_01",
    "s_m_y_barman_01",
    "s_m_y_baywatch_01",
    "s_m_y_blackops_01",
    "s_m_y_blackops_02",
    "s_m_y_blackops_03",
    "s_m_y_busboy_01",
    "s_m_y_casino_01",
    "s_m_y_chef_01",
    "s_m_y_clown_01",
    "s_m_y_clubbar_01",
    "s_m_y_construct_01",
    "s_m_y_construct_02",
    "s_m_y_cop_01",
    "s_m_y_dealer_01",
    "s_m_y_devinsec_01",
    "s_m_y_dockwork_01",
    "s_m_y_doorman_01",
    "s_m_y_dwservice_01",
    "s_m_y_dwservice_02",
    "s_m_y_factory_01",
    "s_m_y_fireman_01",
    "s_m_y_garbage",
    "s_m_y_grip_01",
    "s_m_y_hwaycop_01",
    "s_m_y_marine_01",
    "s_m_y_marine_02",
    "s_m_y_marine_03",
    "s_m_y_mime",
    "s_m_y_pestcont_01",
    "s_m_y_pilot_01",
    "s_m_y_prismuscl_01",
    "s_m_y_prisoner_01",
    "s_m_y_ranger_01",
    "s_m_y_robber_01",
    "s_m_y_sheriff_01",
    "s_m_y_shop_mask",
    "s_m_y_strvend_01",
    "s_m_y_swat_01",
    "s_m_y_uscg_01",
    "s_m_y_valet_01",
    "s_m_y_waiter_01",
    "s_m_y_waretech_01",
    "s_m_y_westsec_01",
    "s_m_y_westsec_02",
    "s_m_y_winclean_01",
    "s_m_y_xmech_01",
    "s_m_y_xmech_02",
    "s_m_y_xmech_02_mp"
}
Ped_modals_u = {
    "u_f_m_casinocash_01",
    "u_f_m_casinoshop_01",
    "u_f_m_corpse_01",
    "u_f_m_debbie_01",
    "u_f_m_drowned_01",
    "u_f_m_miranda",
    "u_f_m_miranda_02",
    "u_f_m_promourn_01",
    "u_f_o_carol",
    "u_f_o_eileen",
    "u_f_o_moviestar",
    "u_f_o_prolhost_01",
    "u_f_y_beth",
    "u_f_y_bikerchic",
    "u_f_y_comjane",
    "u_f_y_corpse_01",
    "u_f_y_corpse_02",
    "u_f_y_danceburl_01",
    "u_f_y_dancelthr_01",
    "u_f_y_dancerave_01",
    "u_f_y_hotposh_01",
    "u_f_y_jewelass_01",
    "u_f_y_lauren",
    "u_f_y_mistress",
    "u_f_y_poppymich",
    "u_f_y_poppymich_02",
    "u_f_y_princess",
    "u_f_y_spyactress",
    "u_f_y_taylor",
    "u_m_m_aldinapoli",
    "u_m_m_bankman",
    "u_m_m_bikehire_01",
    "u_m_m_blane",
    "u_m_m_curtis",
    "u_m_m_doa_01",
    "u_m_m_edtoh",
    "u_m_m_fibarchitect",
    "u_m_m_filmdirector",
    "u_m_m_glenstank_01",
    "u_m_m_griff_01",
    "u_m_m_jesus_01",
    "u_m_m_jewelsec_01",
    "u_m_m_jewelthief",
    "u_m_m_markfost",
    "u_m_m_partytarget",
    "u_m_m_prolsec_01",
    "u_m_m_promourn_01",
    "u_m_m_rivalpap",
    "u_m_m_spyactor",
    "u_m_m_streetart_01",
    "u_m_m_vince",
    "u_m_m_willyfist",
    "u_m_o_dean",
    "u_m_o_filmnoir",
    "u_m_o_finguru_01",
    "u_m_o_taphillbilly",
    "u_m_o_tramp_01",
    "u_m_y_abner",
    "u_m_y_antonb",
    "u_m_y_babyd",
    "u_m_y_baygor",
    "u_m_y_burgerdrug_01",
    "u_m_y_caleb",
    "u_m_y_chip",
    "u_m_y_corpse_01",
    "u_m_y_croupthief_01",
    "u_m_y_cyclist_01",
    "u_m_y_danceburl_01",
    "u_m_y_dancelthr_01",
    "u_m_y_dancerave_01",
    "u_m_y_fibmugger_01",
    "u_m_y_gabriel",
    "u_m_y_guido_01",
    "u_m_y_gunvend_01",
    "u_m_y_militarybum",
    "u_m_y_paparazzi",
    "u_m_y_party_01",
    "u_m_y_pogo_01",
    "u_m_y_prisoner_01",
    "u_m_y_proldriver_01",
    "u_m_y_rsranger_01",
    "u_m_y_sbike",
    "u_m_y_smugmech_01",
    "u_m_y_staggrm_01",
    "u_m_y_tattoo_01",
    "u_m_y_ushi",
    "u_m_y_zombie_01",
    "u_m_y_hippie_01",
    "u_m_y_imporage",
    "u_m_y_juggernaut_01",
    "u_m_y_justin",
    "u_m_y_mani"
}
SoundAnnoy = {
	{"CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Phone_Text_Arrive", "DLC_H4_MM_Sounds"},
	{"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
	{"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
	{"Alarm_Oneshot", "DLC_H4_Island_Alarms_Sounds"},
	{"TIMER_RADIAL_Pulse", "DLC_BTL_SM_Remix_Soundset"},
	{"Drop_Zone_Alarm", "0"},
	{"Altitude_Warning_Loop", "DLC_SM_Under_The_Radar_Sounds"},
	{"alarm_loop", "DLC_SM_Escort_Sounds"},
	{"Fly_Loop", "dlc_xm_avngr_sounds"},
	{"alarm_loop", "dlc_xm_farm_sounds"},
	{"security_scanner_beep_os", "dlc_xm_heists_fm_uc_sounds"},
	{"scanner_alarm_os", "dlc_xm_iaa_player_facility_sounds"},
	{"silo_alarm_loop", "dlc_xm_silo_finale_sounds"},
	{"alarm_loop", "dlc_xm_submarine_sounds"},
	{"Altitude_Warning", "EXILE_1"},
	{"Missile_Warning_Sound", "EXILE_2_SOUNDS"},
	{"WIND", "EXTREME_01_SOUNDSET"},
	{"Destroy_Cop_Car", "JEWEL_HEIST_SOUNDS"},
	{"Shipwreck_Attract", "Tuner_Collectables_General_Sounds"},
	{"SCRIPT_TRIGGERED_FROM_PROP", "ABIGAIL_SONAR_SOUNDSET"},
	{"SINGLE_BLIP_FROM_BOAT", "ABIGAIL_SONAR_SOUNDSET"},
	{"Prison_Finale_Buzzard_Rocket", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"Prison_Finale_Buzzard_Rocket_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"police_notification", "DLC_AS_VNT_Sounds"},
	{"Metal_Detector_Offline", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Online", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Big_Guns", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Small_Guns", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"DOOR_BUZZ", "MP_PLAYER_APARTMENT"},
	{"OPENED", "DOOR_GARAGE"},
	{"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset"},
	{"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
	{"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
	{"05", "DLC_GR_CS2_Sounds"},
	{"07", "DLC_GR_CS2_Sounds"},
	{"sub_scanner_loop", "dlc_xm_stromberg_sounds"},
	{"WIND", "EXTREME_01_SOUNDSET"},
	{"HOUSE_FIRE", "JOSH_03_SOUNDSET"},
	{"Hot_Tub_Loop", "GTAO_Yacht_SoundSet"},
	{"Crashed_Plane_Ambience", "DLC_Apartments_Extraction_SoundSet"},
	{"Arming_Countdown", "GTAO_Speed_Convoy_Soundset"},
	{"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset"},
	{"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
	{"BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS"},
	{"Jet_Explosions", "exile_1"},
	{"FLASH", "CAMERA_FLASH_SOUNDSET"},
	{"SHUTTER", "CAMERA_FLASH_SOUNDSET"},
	{"SHUTTER_FLASH", "CAMERA_FLASH_SOUNDSET"},
	{"Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET"},
	{"Start_Squelch", "CB_RADIO_SFX"},
	{"End_Squelch", "CB_RADIO_SFX"},
	{"Enemy_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
	{"Leave_Horn", "DLC_Apartment_Yacht_Streams_Soundset"},
	{"Bed", "WastedSounds"},
	{"CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET"},
	{"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset"},
	{"Checkpoint_Hit", "GTAO_FM_Events_Soundset"},
	{"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET"},
	{"Checkpoint_Teammate", "GTAO_Shepherd_Sounds"},
	{"CHECKPOINT_UNDER_THE_BRIDGE", "HUD_MINI_GAME_SOUNDSET"},
	{"DiggerRevOneShot", "BulldozerDefault"},
	{"Door_Open", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Enter_Capture_Zone", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Event_Start_Text", "GTAO_FM_Events_Soundset"},
	{"FestiveGift", "Feed_Message_Sounds"},
	{"BBQ_EXPLODE", "JOSH_03_SOUNDSET"},
	{"Kill_List_Counter", "GTAO_FM_Events_Soundset"},
	{"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_Flash", "WastedSounds"},
	{"MP_IDLE_KICK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_IDLE_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_Impact", "WastedSounds"},
	{"Put_Away", "Phone_SoundSet_Michael"},
	{"STUN_COLLECT", "MINUTE_MAN_01_SOUNDSET"},
	{"Tattooing_Oneshot", "TATTOOIST_SOUNDS"},
	{"Tattooing_Oneshot_Remove", "TATTOOIST_SOUNDS"},
	{"Team_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
	{"TextHit", "WastedSounds"},
	{"clown_die_wrapper", "BARRY_02_SOUNDSET"},
	{"DESPAWN", "BARRY_01_SOUNDSET"},
	{"Destroyed", "DLC_PILOT_Shooting_Range_Sounds"},
	{"HORN", "DLC_Apt_Yacht_Ambient_Soundset"},
	{"Train_Horn", "Prologue_Sounds"},
	{"FBI_01_DMW_LIFT_ARRIVE", "FBI_01_SOUNDS"},
	{"DOORS_BLOWN", "RE_SECURITY_VAN_SOUNDSET"},
	{"sonar_pulse", "docks_heist_finale_2a_sounds"},
	{"Garbage_Truck_Explosion", "FBI_04_HEAT_SOUNDS"},
	{"CEILING_COLLAPSE", "FBI_HEIST_RAID"},
	{"Crash_Through_Fence", "FRANKLIN_0_SOUNDS"},
	{"CREAK_01", "DOCKS_HEIST_SETUP_SOUNDS"},
	{"Door_Blast_A", "FBI_HEIST_RAID"},
	{"Door_Blast_B", "FBI_HEIST_RAID"},
	{"DOOR_CRASH", "NIGEL_02_SOUNDSET"},
	{"Flush", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Garage_Open_01", "ARM_2_REPO_SOUNDS"},
	{"Garage_Open_02", "ARM_2_REPO_SOUNDS"},
	{"Gas_Explosion", "ARM_2_REPO_SOUNDS"},
	{"Gas_Station_Explosion", "RURAL_BANK_HEIST_FINALE_SOUNDS"},
	{"debris", "FBI_HEIST_RAID"},
	{"detonation", "FBI_HEIST_RAID"},
	{"Detonation_2", "FBI_HEIST_RAID"},
	{"Train_Bell", "Prologue_Sounds"},
	{"RING", "CHURCH_BELL_SOUNDSET"},
	{"Cops_Arrive_2", "Prologue_Sounds"},
	{"Helicopter_Loop", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Garage_Door", "DLC_HEISTS_GENERIC_SOUNDS"},
}
Sound_Annoy = {
	{"CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Phone_Text_Arrive", "DLC_H4_MM_Sounds"},
	{"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
	{"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
	{"Active", "DLC_H4_Island_Defences_Soundset"},
	{"Disabled", "DLC_H4_Island_Defences_Soundset"},
	{"Alarm_Oneshot", "DLC_H4_Island_Alarms_Sounds"},
	{"Alarm_Interior_Gate_Loop", "DLC_H4_Island_Alarms_Sounds"},
	{"TIMER_RADIAL_Pulse", "DLC_BTL_SM_Remix_Soundset"},
	{"TIMER_RADIAL_Reset", "DLC_BTL_SM_Remix_Soundset"},
	{"Round_Start", "DLC_BTL_SM_Remix_Soundset"},
	{"PED_INSIDE_WATER", "0"},
	{"spin_wheel", "0"},
	{"spin_wheel_win", "0"},
	{"VEHICLE_WATER_SPLASH_HEAVY_SCRIPT", "0"},
	{"Generic_Alarm_Fire_Electronic", "0"},
	{"SIRENS_DISTANT_01_MASTER", "0"},
	{"Distant_Sirens", "0"},
	{"dlc_ch_heist_finale_poison_gas_coughs_sounds", "0"},
	{"EMP", "0"},
	{"Cargobob_Door_Open", "0"},
	{"Drop_Zone_Alarm", "0"},
	{"UNDER_WATER_COME_UP", "0"},
	{"SUBWAY_TRAIN_HORNS_AIR_HORN", "0"},
	{"ALARMS_KLAXON_03_FAR", "0"},
	{"ALARMS_KLAXON_03_CLOSE", "0"},
	{"Bell_02", "ALARMS_SOUNDSET"},
	{"Klaxon_03", "ALARMS_SOUNDSET"},
	{"Klaxon_01", "ALARMS_SOUNDSET"},
	{"Bell_01", "ALARMS_SOUNDSET"},
	{"Klaxon_06", "ALARMS_SOUNDSET"},
	{"emp_activate", "dlc_ch_heist_finale_sounds"},
	{"vault_door_explosion", "dlc_ch_heist_finale_sounds"},
	{"Altitude_Warning_Loop", "DLC_SM_Under_The_Radar_Sounds"},
	{"alarm_loop", "DLC_SM_Escort_Sounds"},
	{"Fly_Loop", "dlc_xm_avngr_sounds"},
	{"alarm_loop", "dlc_xm_farm_sounds"},
	{"security_scanner_beep_os", "dlc_xm_heists_fm_uc_sounds"},
	{"scanner_alarm_os", "dlc_xm_iaa_player_facility_sounds"},
	{"silo_alarm_loop", "dlc_xm_silo_finale_sounds"},
	{"alarm_loop", "dlc_xm_submarine_sounds"},
	{"Altitude_Warning", "EXILE_1"},
	{"Missile_Warning_Sound", "EXILE_2_SOUNDS"},
	{"WIND", "EXTREME_01_SOUNDSET"},
	{"Destroy_Cop_Car", "JEWEL_HEIST_SOUNDS"},
	{"Shipwreck_Attract", "Tuner_Collectables_General_Sounds"},
	{"SCRIPT_TRIGGERED_FROM_PROP", "ABIGAIL_SONAR_SOUNDSET"},
	{"SINGLE_BLIP_FROM_BOAT", "ABIGAIL_SONAR_SOUNDSET"},
	{"Flag_Delivered", "DLC_SM_STPI_Enemy_Sounds"},
	{"Missile_Incoming_Miss", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Missile_Incoming_Hit", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Prison_Finale_Buzzard_Rocket", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"Prison_Finale_Buzzard_Rocket_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"police_notification", "DLC_AS_VNT_Sounds"},
	{"Metal_Detector_Offline", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Online", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Big_Guns", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Metal_Detector_Small_Guns", "dlc_ch_heist_finale_security_alarms_sounds"},
	{"Countdown_3", "DLC_SR_TR_General_Sounds"},
	{"Countdown_2", "DLC_SR_TR_General_Sounds"},
	{"Countdown_1", "DLC_SR_TR_General_Sounds"},
	{"Countdown_GO", "DLC_SR_TR_General_Sounds"},
	{"321", "Car_Club_Races_Pursuit_Series_Sounds"},
	{"Go", "Car_Club_Races_Pursuit_Series_Sounds"},
	{"DOOR_BUZZER_LOOP", "FINALE_INTRO_SOUNDSET"},
	{"DOOR_BUZZ", "MP_PLAYER_APARTMENT"},
	{"OPENED", "DOOR_GARAGE"},
	{"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset"},
	{"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
	{"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
	{"5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET"},
	{"05", "DLC_GR_CS2_Sounds"},
	{"07", "DLC_GR_CS2_Sounds"},
	{"Fly_Loop", "dlc_xm_avngr_sounds"},
	{"Scanner_Loop", "DLC_BTL_Target_Pursuit_Sounds"},
	{"sub_scanner_loop", "dlc_xm_stromberg_sounds"},
	{"WIND", "EXTREME_01_SOUNDSET"},
	{"HOUSE_FIRE", "JOSH_03_SOUNDSET"},
	{"Hot_Tub_Loop", "GTAO_Yacht_SoundSet"},
	{"Crashed_Plane_Ambience", "DLC_Apartments_Extraction_SoundSet"},
	{"Arming_Countdown", "GTAO_Speed_Convoy_Soundset"},
	{"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset"},
	{"Boss_Blipped", "GTAO_Magnate_Hunt_Boss_SoundSet"},
	{"Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset"},
	{"Turret_Camera_Hum_Loop", "DLC_BTL_Terrobyte_Turret_Sounds"},
	{"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
	{"BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS"},
	{"Jet_Explosions", "exile_1"},
	{"Case_Beep", "GTAO_Magnate_Finders_Keepers_Soundset"},
	{"Camera_Destroy", "DLC_HEIST_FLEECA_SOUNDSET"},
	{"FLASH", "CAMERA_FLASH_SOUNDSET"},
	{"SHUTTER", "CAMERA_FLASH_SOUNDSET"},
	{"SHUTTER_FLASH", "CAMERA_FLASH_SOUNDSET"},
	{"Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET"},
	{"Start_Squelch", "CB_RADIO_SFX"},
	{"End_Squelch", "CB_RADIO_SFX"},
	{"Enemy_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
	{"TIME_LAPSE_MASTER", "0"},
	{"Leave_Horn", "DLC_Apartment_Yacht_Streams_Soundset"},
	{"Arrive_Horn", "DLC_Apartment_Yacht_Streams_Soundset"},
	{"Moor_SEASHARK3_Engine", "DLC_Apartment_Yacht_Streams_Soundset"},
	{"Moor_Boat_Engine", "DLC_Apartment_Yacht_Streams_Soundset"},
	{"TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Timer_10s", "DLC_HALLOWEEN_FVJ_Sounds"},
	{"TIMER_STOP", "HUD_MINI_GAME_SOUNDSET"},
	{"3_2_1_NON_RACE", "HUD_MINI_GAME_SOUNDSET"},
	{"3_2_1", "HUD_MINI_GAME_SOUNDSET"},
	{"1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
	{"Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet"},
	{"ARM_WRESTLING_WHOOSH_MASTER", "0"},
	{"ASSASSINATIONS_HOTEL_TIMER_COUNTDOWN", "ASSASSINATION_MULTI"},
	{"ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"BASE_JUMP_PASSED", "HUD_AWARDS"},
	{"Bed", "WastedSounds"},
	{"Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Blade_Appear", "APT_BvS_Soundset"},
	{"Breaker_01", "DLC_HALLOWEEN_FVJ_Sounds"},
	{"Breaker_02", "DLC_HALLOWEEN_FVJ_Sounds"},
	{"Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS"},
	{"CABLE_SNAPS", "CONSTRUCTION_ACCIDENT_1_SOUNDS"},
	{"CAM_PAN_DARTS", "HUD_MINI_GAME_SOUNDSET"},
	{"Camera_Shoot", "Phone_Soundset_Franklin"},
	{"CANCEL", "HUD_FREEMODE_SOUNDSET"},
	{"CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS"},
	{"CHALLENGE_UNLOCKED", "HUD_AWARDS"},
	{"CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET"},
	{"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset"},
	{"Checkpoint_Hit", "GTAO_FM_Events_Soundset"},
	{"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET"},
	{"CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET"},
	{"Checkpoint_Teammate", "GTAO_Shepherd_Sounds"},
	{"CHECKPOINT_UNDER_THE_BRIDGE", "HUD_MINI_GAME_SOUNDSET"},
	{"Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE"},
	{"Click_Fail", "WEB_NAVIGATION_SOUNDS_PHONE"},
	{"Click_Special", "WEB_NAVIGATION_SOUNDS_PHONE"},
	{"CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS"},
	{"CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET"},
	{"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Continue_Accepted", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Continue_Appears", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Crash", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Criminal_Damage_High_Value", "GTAO_FM_Events_Soundset"},
	{"Criminal_Damage_Kill_Player", "GTAO_FM_Events_Soundset"},
	{"Criminal_Damage_Low_Value", "GTAO_FM_Events_Soundset"},
	{"Cycle_Item", "DLC_Dmod_Prop_Editor_Sounds"},
	{"DELETE", "HUD_DEATHMATCH_SOUNDSET"},
	{"Delete_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds"},
	{"Deliver_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"DiggerRevOneShot", "BulldozerDefault"},
	{"Door_Open", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Dropped", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"EDIT", "HUD_DEATHMATCH_SOUNDSET"},
	{"Enemy_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"Enemy_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"Enter_1st", "GTAO_FM_Events_Soundset"},
	{"Enter_Area", "DLC_Lowrider_Relay_Race_Sounds"},
	{"Enter_Capture_Zone", "DLC_Apartments_Drop_Zone_Sounds"},
	{"ERROR", "HUD_AMMO_SHOP_SOUNDSET"},
	{"Event_Message_Purple", "GTAO_FM_Events_Soundset"},
	{"Event_Start_Text", "GTAO_FM_Events_Soundset"},
	{"EXIT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Exit_Capture_Zone", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Failure", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Falling_Crates", "EXILE_1"},
	{"Faster_Bar_Full", "RESPAWN_ONLINE_SOUNDSET"},
	{"Faster_Click", "RESPAWN_ONLINE_SOUNDSET"},
	{"FestiveGift", "Feed_Message_Sounds"},
	{"FIRST_PLACE", "HUD_MINI_GAME_SOUNDSET"},
	{"FLIGHT_SCHOOL_LESSON_PASSED", "HUD_AWARDS"},
	{"FLYING_STREAM_END_INSTANT", "FAMILY_5_SOUNDS"},
	{"FocusIn", "HintCamSounds"},
	{"FocusOut", "HintCamSounds"},
	{"Friend_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"Friend_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
	{"GO", "HUD_MINI_GAME_SOUNDSET"},
	{"Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"GOLF_BIRDIE", "HUD_AWARDS"},
	{"GOLF_EAGLE", "HUD_AWARDS"},
	{"GOLF_HUD_HOLE_IN_ONE_MASTER", "0"},
	{"GOLF_HUD_SCORECARD_MASTER", "0"},
	{"GOLF_NEW_RECORD", "HUD_AWARDS"},
	{"Goon_Paid_Small", "GTAO_Boss_Goons_FM_Soundset"},
	{"Grab_Parachute", "BASEJUMPS_SOUNDS"},
	{"Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
	{"Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
	{"BBQ_EXPLODE", "JOSH_03_SOUNDSET"},
	{"HACKING_CLICK", "0"},
	{"HACKING_CLICK_BAD", "0"},
	{"HACKING_CLICK_GOOD", "0"},
	{"HACKING_MOVE_CURSOR", "0"},
	{"Hang_Up", "Phone_SoundSet_Michael"},
	{"HIGHLIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Highlight_Accept", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Highlight_Cancel", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Highlight_Error", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Highlight_Move", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"HIGHLIGHT_NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Hit", "RESPAWN_ONLINE_SOUNDSET"},
	{"Hit_1", "LONG_PLAYER_SWITCH_SOUNDS"},
	{"Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
	{"Hit_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
	{"HORDE_COOL_DOWN_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"HUD_FREEMODE_CANCEL_MASTER", "0"},
	{"Kill_List_Counter", "GTAO_FM_Events_Soundset"},
	{"LEADERBOARD", "HUD_MINI_GAME_SOUNDSET"},
	{"Lights_On", "GTAO_MUGSHOT_ROOM_SOUNDS"},
	{"LIMIT", "DLC_APT_YACHT_DOOR_SOUNDS"},
	{"Load_Scene", "DLC_Dmod_Prop_Editor_Sounds"},
	{"LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"LOCAL_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"LOOSE_MATCH", "HUD_MINI_GAME_SOUNDSET"},
	{"Lose_1st", "GTAO_FM_Events_Soundset"},
	{"LOSER", "HUD_AWARDS"},
	{"Map_Roll_Down", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Map_Roll_Up", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"MARKER_ERASE", "HEIST_BULLETIN_BOARD_SOUNDSET"},
	{"MARTIN1_DISTANT_TRAIN_HORNS_MASTER", "0"},
	{"MEDAL_BRONZE", "HUD_AWARDS"},
	{"MEDAL_GOLD", "HUD_AWARDS"},
	{"MEDAL_SILVER", "HUD_AWARDS"},
	{"MEDAL_UP", "HUD_MINI_GAME_SOUNDSET"},
	{"Menu_Accept", "Phone_SoundSet_Default"},
	{"Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_Flash", "WastedSounds"},
	{"MP_IDLE_KICK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_IDLE_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_Impact", "WastedSounds"},
	{"MP_RANK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"MP_WAVE_COMPLETE", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"NAV", "HUD_AMMO_SHOP_SOUNDSET"},
	{"Nav_Arrow_Ahead", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Nav_Arrow_Behind", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Nav_Arrow_Left", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Nav_Arrow_Right", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"NAV_LEFT_RIGHT", "HUD_FREEMODE_SOUNDSET"},
	{"NAV_UP_DOWN", "HUD_FREEMODE_SOUNDSET"},
	{"Near_Miss_Counter_Reset", "GTAO_FM_Events_Soundset"},
	{"NO", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Object_Collect_Player", "GTAO_FM_Events_Soundset"},
	{"Object_Dropped_Remote", "GTAO_FM_Events_Soundset"},
	{"Off_High", "MP_RADIO_SFX"},
	{"OK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"ON", "NOIR_FILTER_SOUNDS"},
	{"On_Call_Player_Join", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET"},
	{"OOB_Cancel", "GTAO_FM_Events_Soundset"},
	{"OOB_Start", "GTAO_FM_Events_Soundset"},
	{"OPEN_WINDOW", "LESTER1A_SOUNDS"},
	{"OPENED", "MP_PROPERTIES_ELEVATOR_DOORS"},
	{"OTHER_TEXT", "HUD_AWARDS"},
	{"Out_Of_Area", "DLC_Lowrider_Relay_Race_Sounds"},
	{"Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Paper_Shuffle", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Parcel_Vehicle_Lost", "GTAO_FM_Events_Soundset"},
	{"Payment_Non_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"Payment_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"Pen_Tick", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"PERSON_SCROLL", "HEIST_BULLETIN_BOARD_SOUNDSET"},
	{"PERSON_SELECT", "HEIST_BULLETIN_BOARD_SOUNDSET"},
	{"Phone_Generic_Key_02", "HUD_MINIGAME_SOUNDSET"},
	{"PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
	{"PIN_BUTTON", "ATM_SOUNDS"},
	{"Pin_Centred", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
	{"Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
	{"PIPES_LAND", "CONSTRUCTION_ACCIDENT_1_SOUNDS"},
	{"Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds"},
	{"Place_Prop_Success", "DLC_Dmod_Prop_Editor_Sounds"},
	{"Player_Collect", "DLC_PILOT_MP_HUD_SOUNDS"},
	{"Player_Enter_Line", "GTAO_FM_Cross_The_Line_Soundset"},
	{"Player_Exit_Line", "GTAO_FM_Cross_The_Line_Soundset"},
	{"Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Pre_Screen_Stinger", "DLC_HEISTS_FAILED_SCREEN_SOUNDS"},
	{"PS2A_MONEY_LOST", "PALETO_SCORE_2A_BANK_SS"},
	{"PURCHASE", "HUD_LIQUOR_STORE_SOUNDSET"},
	{"Put_Away", "Phone_SoundSet_Michael"},
	{"QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"QUIT_WHOOSH", "HUD_MINI_GAME_SOUNDSET"},
	{"RACE_PLACED", "HUD_AWARDS"},
	{"RAMP_DOWN", "TRUCK_RAMP_DOWN"},
	{"RAMP_UP", "TRUCK_RAMP_DOWN"},
	{"RANK_UP", "HUD_AWARDS"},
	{"REMOTE_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"REMOTE_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
	{"Reset_Prop_Position", "DLC_Dmod_Prop_Editor_Sounds"},
	{"RESTART", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"RETRY", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET"},
	{"ROPE_CUT", "ROPE_CUT_SOUNDSET"},
	{"ROUND_ENDING_STINGER_CUSTOM", "CELEBRATION_SOUNDSET"},
	{"Save_Scene", "DLC_Dmod_Prop_Editor_Sounds"},
	{"SCOPE_UI_MASTER", "0"},
	{"ScreenFlash", "WastedSounds"},
	{"SCREEN_SWIPE", "CELEBRATION_SWIPE"},
	{"SELECT", "HUD_FREEMODE_SOUNDSET"},
	{"Select_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds"},
	{"Shard_Disappear", "GTAO_FM_Events_Soundset"},
	{"SHOOTING_RANGE_ROUND_OVER", "HUD_AWARDS"},
	{"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
	{"Short_Transition_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
	{"SKIP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"STUN_COLLECT", "MINUTE_MAN_01_SOUNDSET"},
	{"Success", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"Swap_Sides", "DLC_HALLOWEEN_FVJ_Sounds"},
	{"SWING_SHUT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS"},
	{"Tattooing_Oneshot", "TATTOOIST_SOUNDS"},
	{"Tattooing_Oneshot_Remove", "TATTOOIST_SOUNDS"},
	{"Team_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
	{"TENNIS_MATCH_POINT", "HUD_AWARDS"},
	{"TENNIS_POINT_WON", "HUD_AWARDS"},
	{"TextHit", "WastedSounds"},
	{"TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"Turn", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
	{"UNDER_THE_BRIDGE", "HUD_AWARDS"},
	{"WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	{"WEAPON_ATTACHMENT_EQUIP", "HUD_AMMO_SHOP_SOUNDSET"},
	{"WEAPON_ATTACHMENT_UNEQUIP", "HUD_AMMO_SHOP_SOUNDSET"},
	{"WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET"},
	{"WEAPON_SELECT_ARMOR", "HUD_AMMO_SHOP_SOUNDSET"},
	{"Whistle", "DLC_TG_Running_Back_Sounds"},
	{"Whoosh_1s_L_to_R", "MP_LOBBY_SOUNDS"},
	{"Whoosh_1s_R_to_L", "MP_LOBBY_SOUNDS"},
	{"WIN", "HUD_AWARDS"},
	{"Zone_Enemy_Capture", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Zone_Neutral", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Zone_Team_Capture", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Zoom_In", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Zoom_Left", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Zoom_Right", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
	{"Biker_Ring_Tone", "TREVOR_2_SOUNDS"},
	{"CLOSED", "DOOR_GARAGE"},
	{"clown_die_wrapper", "BARRY_02_SOUNDSET"},
	{"DESPAWN", "BARRY_01_SOUNDSET"},
	{"Destroyed", "DLC_PILOT_Shooting_Range_Sounds"},
	{"Grenade_Throw_Miss", "JEWEL_HEIST_SOUNDS"},
	{"Horn", "DLC_Apt_Yacht_Ambient_Soundset"},
	{"SNIPER_SHOT_SPLAT", "DOCKS_HEIST_FINALE_2A_SOUNDS"},
	{"Spawn", "DLC_PILOT_Shooting_Range_Sounds"},
	{"TOOTH_PING", "NIGEL_1A_SOUNDSET"},
	{"vault_unlock", "dlc_heist_fleeca_bank_door_sounds"},
	{"HORN", "DLC_Apt_Yacht_Ambient_Soundset"},
	{"Engine", "DLC_Apt_Yacht_Ambient_Soundset"},
	{"Deck", "DLC_Apt_Yacht_Ambient_Soundset"},
	{"Train_Horn", "Prologue_Sounds"},
	{"FBI_01_DMW_LIFT_ARRIVE", "FBI_01_SOUNDS"},
	{"CLOSING", "DOOR_GARAGE"},
	{"OPENING", "DOOR_GARAGE"},
	{"Cargobob_Door_Open", "DLC_Apartments_Drop_Zone_Sounds"},
	{"FarmhouseFire_Ignite", "CHINESE2_SOUNDS"},
	{"SMASH_CABINET_PLAYER", "JEWEL_HEIST_SOUNDS"},
	{"SMASH_CABINET_NPC", "JEWEL_HEIST_SOUNDS"},
	{"Torch_Cut", "FBI_05_SOUNDS"},
	{"Gate_Lock_Break", "DLC_HEISTS_ORNATE_BANK_FINALE_SOUNDS"},
	{"Jump", "DLC_Pilot_Chase_Parachute_Sounds"},
	{"Securicar_Horn", "FBI_04_HEAT_SOUNDS"},
	{"SNIPER_SHOT_SPRAY", "DOCKS_HEIST_FINALE_2A_SOUNDS"},
	{"SNIPER_SHOT_ZIP", "DOCKS_HEIST_FINALE_2A_SOUNDS"},
	{"Trevor_2_chopper_explode", "TREVOR_2_SOUNDS"},
	{"DOORS_BLOWN", "RE_SECURITY_VAN_SOUNDSET"},
	{"Hum", "SECURITY_CAMERA"},
	{"Zoom_In", "SECURITY_CAMERA"},
	{"sonar_pulse", "docks_heist_finale_2a_sounds"},
	{"Monkey_Yell", "FBI_05_SOUNDS"},
	{"Garbage_Truck_Explosion", "FBI_04_HEAT_SOUNDS"},
	{"Biker_Ride_Off", "ARM_2_REPO_SOUNDS"},
	{"CEILING_COLLAPSE", "FBI_HEIST_RAID"},
	{"Crash_Through_Fence", "FRANKLIN_0_SOUNDS"},
	{"CREAK_01", "DOCKS_HEIST_SETUP_SOUNDS"},
	{"Door_Blast_A", "FBI_HEIST_RAID"},
	{"Door_Blast_B", "FBI_HEIST_RAID"},
	{"DOOR_CRASH", "NIGEL_02_SOUNDSET"},
	{"Flush", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
	{"Garage_Open_01", "ARM_2_REPO_SOUNDS"},
	{"Garage_Open_02", "ARM_2_REPO_SOUNDS"},
	{"Gas_Explosion", "ARM_2_REPO_SOUNDS"},
	{"Gas_Station_Explosion", "RURAL_BANK_HEIST_FINALE_SOUNDS"},
	{"Glass_Smash", "FBI_HEIST_RAID"},
	{"Grenade_Throw_Success", "JEWEL_HEIST_SOUNDS"},
	{"IDLE_BEEP_NPC", "EPSILONISM_04_SOUNDSET"},
	{"MINCER_FALL", "MICHAEL_2_SOUNDS"},
	{"MINCER_LOOP", "MICHAEL_2_SOUNDS"},
	{"PANIC_WALLA", "NIGEL_02_SOUNDSET"},
	{"Party_panic", "FBI_03_Torture_Sounds"},
	{"Pre_Glass_Explosion", "FBI_HEIST_RAID"},
	{"SCREAMS", "NIGEL_02_SOUNDSET"},
	{"Shoot_Door", "FBI_05_SOUNDS"},
	{"SMALL_CRASH", "PAPARAZZO_02_SOUNDSETS"},
	{"SUB_RELEASE", "DOCKS_HEIST_PREP_1_SOUNDSET"},
	{"UNLOCK_DOOR", "LESTER1A_SOUNDS"},
	{"WALL_CRASH", "NIGEL_02_SOUNDSET"},
	{"WINDOW_CRASH", "NIGEL_02_SOUNDSET"},
	{"debris", "FBI_HEIST_RAID"},
	{"detonation", "FBI_HEIST_RAID"},
	{"Detonation_2", "FBI_HEIST_RAID"},
	{"Floyd_Beating", "DOCKS_HEIST_SETUP_SOUNDS"},
	{"Train_Bell", "Prologue_Sounds"},
	{"RING", "CHURCH_BELL_SOUNDSET"},
	{"Transition_Sound", "EXILE_1"},
	{"Barge_Door", "Prologue_Sounds"},
	{"Guard_Headshot", "Prologue_Sounds"},
	{"Cops_Arrive_2", "Prologue_Sounds"},
	{"IDLE_BEEP", "EPSILONISM_04_SOUNDSET"},
	{"Helicopter_Loop", "DLC_Apartments_Drop_Zone_Sounds"},
	{"Garage_Door", "DLC_HEISTS_GENERIC_SOUNDS"},
	{"CAMERA", "0"},
	{"VAULT_DOOR_CLOSE", "0"},
}
--INFO: Modder Flagging
function modflag_set()
	int_flags[#int_flags+1] = player.add_modder_flag("Moist Protex you")
	int_flags[#int_flags+1] = player.add_modder_flag("You Kicked")
	int_flags[#int_flags+1] = player.add_modder_flag("Spectating(with Mod)")
	int_flags[#int_flags+1] = player.add_modder_flag("Blacklist")
    for i = 1, #int_flags do
        if player.get_modder_flag_text(int_flags[i]) == "Moist Protex you" then
            mod_flag_1 = int_flags[i]
		end
        if player.get_modder_flag_text(int_flags[i]) == "You Kicked" then
            mod_flag_2 = int_flags[i]
		end
        if player.get_modder_flag_text(int_flags[i]) == "Spectating(with Mod)" then
            mod_flag_3 = int_flags[i]
		end
        if player.get_modder_flag_text(int_flags[i]) == "Blacklist" then
            mod_flag_4 = int_flags[i]
		end
	end
end
modflag_set()
--INFO: OSD DEBUG2 Normal
text_scale = 0.0
OSD_Debug2 = menu.add_feature("Debug OSD2", "toggle", 0,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["OSDDebug2"] = true
	if not Settings["playerscriptinfo"] then return end
	local Scr_x, Scr_y = graphics.get_screen_width(), graphics.get_screen_height()
	if feat["on"] then
		text_scale = 0.18
		if Scr_x < 2000 and Scr_y  > 1020 then
			text_scale = 0.18
		end
		ui.draw_rect(0.001, 0.990, 0.325, 0.200, 0, 0, 0, 255)
		local pos = v2()
		pos.x = 0.001
		pos.y = .890
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		if text1 ~= nil then
			ui.draw_text(text1, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.001
		pos.y = .895
		if text2 ~= nil then
			ui.draw_text(text2, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.001
		pos.y = .980
		if text5 ~= nil then
			ui.draw_text(text5, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.001
		pos.y = .925
		if text3 ~= nil then
			ui.draw_text(text3, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.0999
		pos.y = .925
		if text4 ~= nil then
			ui.draw_text(text4, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.0999
		pos.y = .925
		if text7 ~= nil then
			ui.draw_text("\n\n" .. text7, pos)
		end
		ui.set_text_scale(text_scale)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		pos.x = 0.001
		pos.y = .910
		if text6 ~= nil then
			ui.draw_text(text6, pos)
		end
		return HANDLER_CONTINUE
	end
	ScreenText = ""
	text1 = ""
	text2 = ""
	text3 = ""
	text4 = ""
	Settings["OSDDebug2"] = false
	return HANDLER_POP
end)
OSD_Debug2["on"] = Settings["OSDDebug2"]
OSD_Debug2["hidden"] = true
--INFO: --------------Setup Player ARRAY------------
function modstart()
	for pid = 0, 31 do
		Modders_DB[pid] = {}
		Modders_DB[pid].flag = nil
		Modders_DB[pid].flags = nil
		Modders_DB[pid].ismod = false
		SessionPlayers[pid] = {}
		SessionPlayers[pid].Name = "nil"
		SessionPlayers[pid].sessionname = "nil"
		SessionPlayers[pid].Tags = {}
		SessionPlayers[pid].Scid = -1
		Players[pid] = {}
		Players[pid].isHost = false
		Players[pid].isFriend = false
		Players[pid].orbnotify = false
		Players[pid].orbnotify2 = false
		Players[pid].JoinTime = nil
		Players[pid].isScHost = false
		Players[pid].pulse = false
		Players[pid].isOTR = false
		Players[pid].Spectatable = false
		Players[pid].isNotifSpec = false
		Players[pid].OTRTNotify = false
		Players[pid].OTR_Start = 0
		Players[pid].isDamagedbY = nil
		Players[pid].isDamagedbY = nil
		Players[pid].isRC = false
		Players[pid].OTRBlipID = nil
		Players[pid].BlipPID = 0
		Players[pid].PedSpawned = false
		Players[pid].bounty = false
		Players[pid].bountyvalue = nil
		Players[pid].isUnDead = false
		Players[pid].isDead = false
		Players[pid].isPassive = false
		Players[pid].isTalking = false
		Players[pid].isTyping = false
		Players[pid].ActiveMissile = false
		Players[pid].flag = nil
		Players[pid].flags = nil
		Players[pid].ismod = false
		Players[pid].isgod = false
		Players[pid].IsFlagRemNotif = false
		Players[pid].isKicked = false
		Players[pid].KickedCount = 0
		Players[pid].isvgod = false
		Players[pid].PlayerGodMode = false
		Players[pid].PlayerVehGodMode = false
		Players[pid].isint = false
		Players[pid].Interiorname = ""
		Players[pid].intID = nil
		Players[pid].Zone = nil
		Players[pid].onlinecheck = false
		Players[pid].online_interior = ""
		Players[pid].onlineintID = nil
		Players[pid].isvis = false
		Players[pid].speed = 0.00
	end
end
modstart()
--INFO: Feature & Variable Arrays
global_func, playerFeatures, playerfeatVars  = {}, {}, {}
playerFeat, playerFeat1, playerFeat2, playerFeat3, playerFeat4 = {}, {}, {}, {}, {}
playerFeatParent, playerFeatParent2 = {}, {}
local NamedFeatures, Named_Features = {on = {}}, {on = {}}
Active_menu = nil
local health, infoA, infoAB, infoB
--INFO: Online Feature Parents
playersFeature = menu.add_feature("Online Players", "parent", globalFeatures.Online_Session,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	health, infoA, infoAB, infoB = "#", "#", "#", "#"
	Active_menu = nil
	OSD_Debug2["on"] = false
end).id
Recent = menu.add_feature("Recent Players", "parent", globalFeatures.Online_Session).id
God_Threads_Created = menu.add_feature("PlayerCheck threads", "parent", globalFeatures.Online_Session)
God_Threads_Created["hidden"] = true
--session
globalFeatures.lobby = menu.add_feature("Online Session", "parent", globalFeatures.Online_Session,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    RefreshPlayerInterior:set_str_data(Playerz)
    interiorcheckbytype:set_str_data(Playerz)
end).id
globalFeatures.lobbyGrief = menu.add_feature("Session Griefing", "parent", globalFeatures.lobby).id
globalFeatures.troll = menu.add_feature("Troll Features", "parent", globalFeatures.lobby).id
SoundAnnoyances = menu.add_feature("Sound Annoyances", "parent", globalFeatures.troll).id
--Protection stuff
globalFeatures.protex = menu.add_feature("Online Protection", "parent", globalFeatures.Online_Session).id
globalFeatures.parentID = menu.add_feature("Blacklist", "parent", globalFeatures.protex).id
globalFeatures.orbital = menu.add_feature("Orbital Room Block", "parent", globalFeatures.protex).id
globalFeatures.glitch = menu.add_feature("Block Glitch Spots", "parent", globalFeatures.protex).id
globalFeatures.kick = menu.add_feature("Session Kicks", "parent", globalFeatures.Online_Session).id
--Local Player Features (Ped/Vehicle)
globalFeatures.self = menu.add_feature("Player Features", "parent", globalFeatures.parent).id
globalFeatures.self_Tele = menu.add_feature("Custom Teleport Presets", "parent", globalFeatures.self).id
globalFeatures.self_ped = menu.add_feature("Ped Features", "parent", globalFeatures.self).id
globalFeatures.self_veh = menu.add_feature("Vehicle Features", "parent", globalFeatures.self).id
globalFeatures.self_quickstat = menu.add_feature("Player Stats", "parent", globalFeatures.self).id
globalFeatures.self_statLabel2 = menu.add_feature("Stat Modifications", "action", globalFeatures.self_quickstat)
globalFeatures.self_statLabel = menu.add_feature("Require Trusted Mode!", "action", globalFeatures.self_quickstat)
globalFeatures.self_statcheck = menu.add_feature("Player Stat Checks", "parent", globalFeatures.self_quickstat).id
globalFeatures.self_statsetup = menu.add_feature("Player Stat Setup", "parent", globalFeatures.self_quickstat, function()
	local stat_hash, curval, valu, value_set, stat
	stat = Get_Last_MP("PLAYER_MENTAL_STATE")
	stat_hash = gameplay.get_hash_key(stat)
	curval = stats.stat_get_float(stat_hash, 0)
	valu = math.ceil(curval)
	value_set = tonumber(valu)
	mental_statset["value"] = value_set
end)
globalFeatures.quick_stats = menu.add_feature("Quick Stat Setups", "parent", globalFeatures.self_quickstat,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	moist_notify("ensure to pay for heist setup first", "Casino Heist Quick Stat Setup")
	moist_notify("cooldown can be removed running the setup first\nEnsure to reapply after paying for it", "Casino Heist Quick Stat Setup")
end).id
--TODO: Remove ------------------------------------------ REMOVE --------------------------------------------- Remove
menu.add_feature("Dooms Day ACT2 2.5 Million", "toggle", globalFeatures.quick_stats,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    while feat["on"] do
		script.set_global_i(1962546 + 812 + 50 + 1, 142)
		script.set_global_i(1962546 + 812 + 50 + 2, 142)
		script.set_global_i(1962546 + 812 + 50 + 3, 142)
		script.set_global_i(1962546 + 812 + 50 + 4, 142)
		if not feat["on"] then return end
		system.wait(0)
	end
	return HANDLER_POP
end)
menu.add_feature("No Sub Missile Cooldown", "toggle", globalFeatures.quick_stats,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    while feat.on do
		--  script.set_global_i(262145 + 29837, 0)
		--  script.set_global_i(262145 + 29838, 99999)
        -- script.set_global_i(262145 + 292320, 0)
        -- script.set_global_i(262145 + 292321, 99999)
		-- script.set_global_i(292320, 0)
        -- script.set_global_i(292321, 99999)
		script.set_global_i(292320, 0)
		script.set_global_i(292321, 99999)
		if not feat.on then return end
		system.wait(0)
	end
	return HANDLER_POP
end)
menu.add_feature("Remove MK2 Cooldown", "toggle", globalFeatures.quick_stats,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    while feat["on"] do
		script.set_global_i(262145 + 28072, 0)
		if not feat["on"] then return end
		system.wait(0)
	end
	return HANDLER_POP
end)
globalFeatures.self_options = menu.add_feature("Player Options", "parent", globalFeatures.self).id
globalFeatures.self_wep = menu.add_feature("Player Weapons", "parent", globalFeatures.self_ped).id
globalFeatures.self_ped_combat = menu.add_feature("Combat Features", "parent", globalFeatures.parent).id
globalFeatures.cleanup = menu.add_feature("Clean Shit Up!", "parent",  globalFeatures.Online_Session).id
globalFeatures.entity_removal = menu.add_feature("World Clean-up", "parent", globalFeatures.cleanup).id
globalFeatures.World = menu.add_feature("World Options", "parent", globalFeatures.parent).id
globalFeatures.Weather = menu.add_feature("Weather Overide", "parent", globalFeatures.World).id
menu.add_feature("Reset Override Weather", "action", globalFeatures.Weather,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	gameplay.clear_cloud_hat()
	gameplay.clear_override_weather()
end)
menu.add_feature("Clear Cloud Hat", "action", globalFeatures.Weather,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	gameplay.clear_cloud_hat()
end)
weather = {"FUCK", "Extra Sunny", "Clear", "Clouds", "Smog", "Fog", "Clouds", "Rain", "Thunder", "Clearing", "Neutral", "Snow", "Blizzard", "Snow Light", "Xmas", "Halloween", "Psychedelic Screen Fuck"}
for i = 1, #weather do
	menu.add_feature(weather[i], "action", globalFeatures.Weather,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local i = i - 2
		gameplay.set_override_weather(i)
	end)
end
--INFO: Spam Shit
Public_Chat = true
globalFeatures.Moist_Spam = menu.add_feature("Chat & SMS Features", "parent", globalFeatures.Online_Session).id
globalFeatures.Spam_Options = menu.add_feature("Chat & SMS Options", "parent", globalFeatures.Moist_Spam).id
Send_Public_Chat = menu.add_feature("Chat : Public[ON]:Team[OFF]", "toggle", globalFeatures.Spam_Options,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Public_Chat = true
		return HANDLER_POP
	end
	Public_Chat = false
	system.yield(1000)
	return HANDLER_CONTINUE
end)
Send_Public_Chat["on"] = true
globalFeatures.custom_Chat = menu.add_feature("Custom Presets", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Preset_Chat = menu.add_feature("Preset Spam", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Preset_RUS = menu.add_feature("Russian Spam", "parent", globalFeatures.Moist_Spam).id
--TODO: Experimental Shit
globalFeatures.moist_test = menu.add_feature("Experimental Features", "parent", globalFeatures.parent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			Playerz[pid+1] = player.get_player_name(pid)
		end
	end
	RefreshPlayerInterior:set_str_data(Playerz)
	interiorcheckbytype:set_str_data(Playerz)
	entcollision:set_str_data(Playerz)
end)
globalFeatures.moist_test["hidden"] = false
--TODO: Parachute Crash
paracrash = menu.add_feature("parachute model crash", "value_str",  globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		streaming.set_model_as_no_longer_needed(1483509531)
		return HANDLER_POP
	end
	local pid, valuestate = nil, paracrash:get_str_data()[paracrash.value + 1]
	pid = Get_PID(valuestate)
	system.yield(5)
	if not player.is_player_valid(pid) then return end
	local TargetCoords = player.get_player_coords(pid)
	local pped = player.get_player_ped(player.player_id())
	local coord = player.get_player_coords(player.player_id())
	local offset = v3(5.0,6.0,120.00)
	entity.set_entity_coords_no_offset(pped, TargetCoords + offset)
	while not streaming.has_model_loaded(1483509531) do
		streaming.request_model(1483509531)
		system.yield(100)
	end
	GiveWeaponTo(player.player_id(), 4222310262, true, 1)
	system.yield(10)
	player.set_player_parachute_model(player.player_id(), 1483509531)
	system.yield(100)
	ai.set_parachute_task_target(pped, coord)
	system.yield(math.random(1000, 2000))
	ped.clear_ped_tasks_immediately(pped)
	system.yield(1000)
	return HANDLER_CONTINUE
end)
paracrash:set_str_data(Playerz)
paracrash["value"] = 0
paracrash["on"] = false
function CrashObjectFunc()
	paracrash2 = menu.add_feature("paracrash: ", "value_str",  globalFeatures.moist_test.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local selectedHash
		if not feat["on"] then
			streaming.set_model_as_no_longer_needed(selectedHash)
			return HANDLER_POP
		end
		selectedHash = CrashObjects[feat.value + 1][1]
		local pped = player.get_player_ped(player.player_id())
		local coord = player.get_player_coords(player.player_id())
		local TargetCoords = v3(195.464,224.341,943.946)
		local offset = v3(5.0,6.0,120.00)
		entity.set_entity_coords_no_offset(pped, TargetCoords)
		while not streaming.has_model_loaded(selectedHash) do
			streaming.request_model(selectedHash)
			system.yield(100)
		end
		GiveWeaponTo(player.player_id(), 4222310262, true, 1)
		system.yield(10)
		player.set_player_parachute_model(player.player_id(), selectedHash)
		system.yield(100)
		ai.set_parachute_task_target(pped, coord)
		system.yield(math.random(1300, 2200))
		ped.clear_ped_tasks_immediately(pped)
		system.yield(1000)
		return HANDLER_CONTINUE
	end)
	paracrash2:set_str_data(CrashObjects[2])
	paracrash2["value"] = 0
	paracrash2["on"] = false
end
Map_Extension = menu.add_feature("extend the world", "action", globalFeatures.World,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos, rot = v3(-1918.4224853516,-2459.6767578125,-13.626953125),v3(-1.4999982118607,-0.10000106692314,-120.20010375977)
	local i = #spawned_cunts + 1
	spawned_cunts[i] = object.create_world_object(2920384015, pos, true, true)
	entity.set_entity_rotation(spawned_cunts[i], rot)
	entity.set_entity_as_mission_entity(spawned_cunts[i], true, true)
	entity.set_entity_collision(spawned_cunts[i], true, true, true)
	entity.freeze_entity(spawned_cunts[i], true)
	system.wait(25)
end)
local get_entities = function()
	local enta = ped.get_all_peds()
	local entb = object.get_all_objects()
	local entc = vehicle.get_all_vehicles()
	return enta, entb, entc
end
entcollision = menu.add_feature("No Collision", "value_str",  globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    local CollisionEntitys = {}
	while feat["on"] do
		local plyveh, pped
		local pid = feat.value
		if player.is_player_valid(pid) then
			if player.is_player_in_any_vehicle(pid) then
				plyveh = player.get_player_vehicle(pid)
				CollisionEntitys = vehicle.get_all_vehicles()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], plyveh, true)
					entity.set_entity_no_collsion_entity(plyveh, CollisionEntitys[i], true)
				end
				CollisionEntitys = ped.get_all_peds()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], plyveh, true)
					entity.set_entity_no_collsion_entity(plyveh, CollisionEntitys[i], true)
				end
				CollisionEntitys = object.get_all_objects()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], plyveh, true)
					entity.set_entity_no_collsion_entity(plyveh, CollisionEntitys[i], true)
				end
				elseif not player.is_player_in_any_vehicle(pid) then
				pped = player.get_player_ped(pid)
				CollisionEntitys = vehicle.get_all_vehicles()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], pped, true)
					entity.set_entity_no_collsion_entity(pped, CollisionEntitys[i], true)
				end
				CollisionEntitys = ped.get_all_peds()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], pped, true)
					entity.set_entity_no_collsion_entity(pped, CollisionEntitys[i], true)
				end
				CollisionEntitys = object.get_all_objects()
				for i = 1, #CollisionEntitys do 
					entity.set_entity_no_collsion_entity(CollisionEntitys[i], pped, true)
					entity.set_entity_no_collsion_entity(pped, CollisionEntitys[i], true)
				end
			end
		end
		system.yield(0)
	end
end)
entcollision:set_str_data(Playerz)
entcollision["on"] = false
NearbyVehHorns = menu.add_feature("Nearby Veh Held Horn", "value_str", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local NearbyVeh = {}
	NearbyVeh = vehicle.get_all_vehicles()
	if feat["on"] then
		for i = 1, #NearbyVeh do
			if feat.value == 1 then
				vehicle.start_vehicle_horn(NearbyVeh[i], 1000, gameplay.get_hash_key("HELDDOWN"), true)
				if not feat["on"] then break end
				elseif feat["on"] and feat.value == 0 then
				vehicle.start_vehicle_horn(NearbyVeh[i], 1000, gameplay.get_hash_key("NORMAL"), true)
				if not feat["on"] then break end
				elseif feat["on"] and feat.value == 2 then
				vehicle.start_vehicle_horn(NearbyVeh[i], 1, gameplay.get_hash_key("NORMAL"), false)
			end
		end
		system.yield(5000)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
NearbyVehHorns:set_str_data({"Normal","Held Down","Oneshot & Off"})
local driving_style = {0,1,4,16,131,139,1076,7785,7791,262144,262208,262275,525116,524348,786468,786469,786475,786484,786485,786491,786597,786599,786603,786613,786619,786859,786981,790699,794660,2883621,2883755,17039360,17563684,34340900,537657381,537657515,1074272427,1074528293,1076369579,1076631588,1090781748,8388614}
setalleximp = menu.add_feature("AllVehiclesExplode OnImpact ", "action_value_i", globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local WorldVeh = vehicle.get_all_vehicles()
	for i = 1, #WorldVeh do
		local vehdriver = vehicle.get_ped_in_vehicle_seat(WorldVeh[i], -1)
		if not ped.is_ped_a_player(vehdriver) and not decorator.decor_exists_on(WorldVeh[i], "Player_Vehicle") then
			network.request_control_of_entity(vehdriver)
			ped.set_ped_config_flag(vehdriver, 183, 1)
			network.request_control_of_entity(vehdriver)
			ai.task_vehicle_drive_wander(vehdriver, WorldVeh[i], driving_style[feat.value], 0)
			ped.set_ped_config_flag(vehdriver, 117, 1)
			system.yield(0)
			network.request_control_of_entity(WorldVeh[i])
			system.yield(0)
			network.request_control_of_entity(WorldVeh[i])
			vehicle.set_vehicle_out_of_control(WorldVeh[i], false, true)
		end
	end
end)
setalleximp["max"] = #driving_style
setalleximp["min"] = 1
setalleximp2 = menu.add_feature("NpcVehiclesExplode OnImpact ", "action_value_i", globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local WorldVeh = vehicle.get_all_vehicles()
	for i = 1, #WorldVeh do
		local vehdriver = vehicle.get_ped_in_vehicle_seat(WorldVeh[i], -1)
		if not ped.is_ped_a_player(vehdriver) and not decorator.decor_exists_on(WorldVeh[i], "Player_Vehicle") then
			network.request_control_of_entity(vehdriver)
			ped.set_ped_config_flag(vehdriver, 183, 1)
			network.request_control_of_entity(vehdriver)
			ai.task_vehicle_drive_wander(vehdriver, WorldVeh[i], 250, 0)
			ped.set_ped_config_flag(vehdriver, 117, 1)
			system.yield(0)
			network.request_control_of_entity(WorldVeh[i])
			system.yield(0)
			network.request_control_of_entity(WorldVeh[i])
			vehicle.set_vehicle_out_of_control(WorldVeh[i], false, true)
		end
	end
end)
setalleximp2["max"] = #driving_style
setalleximp2["min"] = 1
PlayerRelations = menu.add_feature("Player & NPC Relationships", "parent", globalFeatures.moist_test.id)
setallfriendly1 = menu.add_feature("set all players friendly v1", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local myrelhash = ped.get_ped_relationship_group_hash(player.get_player_ped(player.player_id()))
	for pid = 0, 31 do
		if player.is_player_valid(pid) and not pid == player.player_id() then
			local pped = player.get_player_ped(pid)
			local relhash = ped.get_ped_relationship_group_hash(pped)
			ped.set_relationship_between_groups(0, myrelhash, relhash)
			ped.set_relationship_between_groups(0, relhash, myrelhash)
			ped.set_can_attack_friendly(pped, false, false)
		end
	end
end)
setallfriendly2 = menu.add_feature("set all players friendly v2", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local self = ped.add_relationship_group("Myself")
	local other = ped.add_relationship_group("Others")
	ped.set_ped_relationship_group_hash(player.get_player_ped(player.player_id()), self)
	for pid = 0, 31 do
		if player.is_player_valid(pid) and not pid == player.player_id() then
			local pped = player.get_player_ped(pid)
			ped.set_ped_relationship_group_hash(pped, other)
			ped.set_can_attack_friendly(pped, true, false)
		end
	end
	ped.set_relationship_between_groups(0, self, other)
	ped.set_relationship_between_groups(0, other, self)
end)
setallfriendly3 = menu.add_feature("set all players Mygroup v3", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local self = ped.get_ped_group(player.get_player_ped(player.player_id()))
	for pid = 0, 31 do
		if player.is_player_valid(pid) and not pid == player.player_id() then
			local pped = player.get_player_ped(pid)
			ped.set_ped_as_group_member(pped, self)
			ped.set_ped_never_leaves_group(pped, true)
			ped.set_can_attack_friendly(pped, true, false)
		end
	end
end)
setallNPCfriendly1 = menu.add_feature("set all NPC's friendly v1", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local myrelhash = ped.get_ped_relationship_group_hash(player.get_player_ped(player.player_id()))
	local ALL_PEDS = ped.get_all_peds()
	for i = 1, #ALL_PEDS do
		if ped.is_ped_a_player(ALL_PEDS[i]) ~= true then
			local relhash = ped.get_ped_relationship_group_hash(ALL_PEDS[i])
			ped.set_relationship_between_groups(0, myrelhash, relhash)
			ped.set_relationship_between_groups(0, relhash, myrelhash)
			ped.set_can_attack_friendly(ALL_PEDS[i], false, false)
		end
	end
end)
setallNPCfriendly2 = menu.add_feature("set all NPC's friendly v2", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local self = ped.add_relationship_group("Myself")
	local NPCs = ped.add_relationship_group("NPCs")
	ped.set_ped_relationship_group_hash(player.get_player_ped(player.player_id()), self)
	local ALL_PEDS = ped.get_all_peds()
	for i = 1, #ALL_PEDS do
		if ped.is_ped_a_player(ALL_PEDS[i]) ~= true then
			ped.set_ped_relationship_group_hash(ALL_PEDS[i], NPCs)
			ped.set_can_attack_friendly(ALL_PEDS[i], true, false)
		end
	end
	ped.set_relationship_between_groups(0, self, NPCs)
	ped.set_relationship_between_groups(0, NPCs, self)
end)
setallNPCfriendly3 = menu.add_feature("set all NPC's Mygroup v3", "action", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local self = ped.get_ped_group(player.get_player_ped(player.player_id()))
	local ALL_PEDS = ped.get_all_peds()
	for i = 1, #ALL_PEDS do
		if ped.is_ped_a_player(ALL_PEDS[i]) ~= true then
			ped.set_ped_as_group_member(ALL_PEDS[i], self)
			ped.set_ped_never_leaves_group(ALL_PEDS[i], true)
			ped.set_can_attack_friendly(ALL_PEDS[i], false, false)
		end
	end
end)
GiveallNPCweapon = menu.add_feature("Give all NPC's a weapon", "action_value_str", PlayerRelations.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local self = ped.get_ped_group(player.get_player_ped(player.player_id()))
	local ALL_PEDS = ped.get_all_peds()
	local y = tonumber(feat.value + 1)
	local weaphash = {0x7F7497E5,0x3813FC08,0x99B507EA,0x958A4A8F,0xDB1AA450,0xAF3696A1,0x3656C8C1,0x57A4368C,0x476BF15,0xDBBD7280,1752584910,2982836145,0x6D544C99}
	for i = 1, #ALL_PEDS do
		if ped.is_ped_a_player(ALL_PEDS[i]) ~= true then
			ped.set_ped_as_group_member(ALL_PEDS[i], self)
			ped.set_ped_never_leaves_group(ALL_PEDS[i], true)
			ped.set_can_attack_friendly(ALL_PEDS[i], false, false)
			entity.set_entity_god_mode(ALL_PEDS[i], true)
			weapon.give_delayed_weapon_to_ped(ALL_PEDS[i], weaphash[y], 1, true)
			weapon.set_ped_ammo(ALL_PEDS[i], weaphash[y], 1000000)
			ped.set_ped_can_switch_weapons(ALL_PEDS[i], true)
			ped.set_ped_combat_attributes(ALL_PEDS[i], 52, true)
			ped.set_ped_combat_attributes(ALL_PEDS[i], 1, true)
			ped.set_ped_combat_attributes(ALL_PEDS[i], 46, true)
			ped.set_ped_combat_attributes(ALL_PEDS[i], 2, true)
			ped.set_ped_combat_range(ALL_PEDS[i], 2)
			ped.set_ped_combat_ability(ALL_PEDS[i], 2)
			ped.set_ped_combat_movement(ALL_PEDS[i], 2)
		end
	end
end)
GiveallNPCweapon:set_str_data(
	{"WEAPON_FIREWORK",
		"stone_hatchet",
		"knife",
		"bat",
		"weapon_machinepistol",
		"raypistol",
		"stungun",
		"weapon_gadgetpistol",
		"raycarbine",
		"combatmg_mk2",
		"Special RPG",
		"Standard RPG",
	"railgun"}
)
globalFeatures.Script_loader = menu.add_feature("Moists Script Loader", "parent", globalFeatures.parent).id
--options
globalFeatures.moistopt = menu.add_feature("MoistScript Options", "parent", globalFeatures.parent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	OSD_Debug2["on"] = false
end).id
--INFO: save settings
save_settings = menu.add_feature("Current Settings: ", "action_value_str", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat.value == 0 then
		SaveSettings()
		moist_notify("Current Settings Saved!", "MoistScript Settings")
		elseif feat.value == 1 then
		SettingsReset()
		system.yield(10)
		moist_notify("Settings Reset Done !", "MoistScript Settings")
	end
end)
save_settings:set_str_data({"Save", "Reset"})
globalFeatures.moist_hotkeys = menu.add_feature("Hotkeys", "parent", globalFeatures.moistopt).id
globalFeatures.moist_perf = menu.add_feature("Performance Options", "parent",globalFeatures.moistopt).id
globalFeatures.moist_UI_OSD = menu.add_feature("UI & OnScreen Options", "parent",globalFeatures.moistopt).id
ModderShit = menu.add_feature("Modder Shit", "parent", globalFeatures.moistopt).id
ModderFlagShit = menu.add_feature("ModderFlag Shit", "parent", ModderShit).id
logging = menu.add_feature("Logging Shit", "parent", globalFeatures.moistopt).id
ESP_VehGod = menu.add_feature("ESP Player Vehicle God", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["ESP_Enhancments"] = false
		return HANDLER_POP
	end
	Settings["ESP_Enhancments"] = true
	local AllVehicles = vehicle.get_all_vehicles()
	for i=1,#AllVehicles do
		local veh_driver = vehicle.get_ped_in_vehicle_seat(AllVehicles[i], -1)
		if ped.is_ped_a_player(veh_driver) then
			local veh_player = player.get_player_from_ped(veh_driver)
			if veh_player ~= player.player_id() then
				local veh = AllVehicles[i]
				local success, pos = graphics.project_3d_coord(entity.get_entity_coords(veh))
				if success then
					pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x)
					pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y)
					scriptdraw.draw_text("\n\nVehGod = " .. tostring(entity.get_entity_god_mode(AllVehicles[i])), pos, v2(), 0.5, 0xFFFFFFFF, 1 << 1, nil)
				end
			end
		end
	end
	return HANDLER_CONTINUE
end)
ESP_VehGod["on"] = Settings["ESP_Enhancments"]
globalFeatures.moist_hiMkropt = menu.add_feature("Markers & Blips Options", "parent", globalFeatures.moistopt).id
globalFeatures.moistMkropt = menu.add_feature("Player Highlight options", "parent", globalFeatures.moist_hiMkropt).id
--INFO: Save Settings Hotkey
SaveOptions_Hotkey = menu.add_feature("Options Save HotKey", "toggle", globalFeatures.moist_hotkeys,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	local key = MenuKey()
	key:push_str("LCONTROL")
	key:push_str("LSHIFT")
	key:push_str("s")
	if key:is_down() then
		SaveSettings()
		moist_notify("Current Settings Saved!", "MoistScript Settings")
		system.wait(1200)
	end
	system.yield(10)
	return HANDLER_CONTINUE
end)
SaveOptions_Hotkey["on"] = true
playerlistloop = menu.add_feature("Player List Loop Delay ms:", "autoaction_value_i", globalFeatures.moist_perf,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["playerlist_loop"] = feat.value
	--print(feat.value)
end)
playerlistloop["max"] = 25
playerlistloop["min"] = 0
playerlistloop["mod"] = 1
playerlistloop["value"] = Settings["playerlist_loop"]
loopfeatdelay = menu.add_feature("Other FeatureLoops Delay ms:", "autoaction_value_i", globalFeatures.moist_perf,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["loop_feat_delay"] = feat.value
end)
loopfeatdelay["max"] = 100
loopfeatdelay["min"] = 0
loopfeatdelay["mod"] = 1
loopfeatdelay["value"] = Settings["loop_feat_delay"]
ScriptEvent_delay = menu.add_feature("Scriptevent Delay ms:", "autoaction_value_i", globalFeatures.moist_perf,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["ScriptEvent_delay"] = feat.value
end)
ScriptEvent_delay["max"] = 100
ScriptEvent_delay["min"] = 0
ScriptEvent_delay["mod"] = 1
ScriptEvent_delay["value"] = Settings["ScriptEvent_delay"]
globalFeatures.notifyParent = menu.add_feature("Notify Customisation", "parent", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	OSD_Debug2["on"] = true
	update_osd_text2("~h~~b~ 1: ~h~~w~Disables Almost all Notifys\n", "\n~h~~b~ 2: ~w~Also use new Notify System\n", "\nPress+Hold: LCTRL + LSHIFT\nPress: S To save When Done")
end).id
AddOTRBlips =  menu.add_feature("Add Blips for OTR Players", "toggle", globalFeatures.moist_hiMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["OTR_Blips"] = false
		return HANDLER_POP
	end
	Settings["OTR_Blips"] = true
end)
AddOTRBlips["on"] = Settings["OTR_Blips"]
AddFunctionBlips =  menu.add_feature("Add Blips for Script Functions", "toggle", globalFeatures.moist_hiMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["Add_Blips"] = false
		return HANDLER_POP
	end
	Settings["Add_Blips"] = true
end)
AddFunctionBlips["on"] = Settings["Add_Blips"]
AddOrbitalProx =  menu.add_feature("Add Orbital Room Proximity Blip", "toggle", globalFeatures.moist_hiMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["orbitalProxyBlip"] = false
		return HANDLER_POP
	end
	Settings["orbitalProxyBlip"] = true
end)
AddOrbitalProx["on"] = Settings["orbitalProxyBlip"]
ToBeNotify =  menu.add_feature("1:Script Notify Me", "toggle", globalFeatures.notifyParent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["Notify_Me"] = false
		return HANDLER_POP
	end
	Settings["Notify_Me"] = true
end)
ToBeNotify["on"] = Settings["Notify_Me"]
New_Notify =  menu.add_feature("2:Use New Notify Type?", "toggle", globalFeatures.notifyParent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["New_Notifys"] = false
		return HANDLER_POP
	end
	Settings["New_Notifys"] = true
end)
New_Notify["on"] = Settings["New_Notifys"]
New_Notify["hidden"] = true
--INFO: ---------------------Moist Test Shit-----------------
globalFeatures.moist_tools = menu.add_feature("Moist Test Shit", "parent", globalFeatures.moistopt)
globalFeatures.moist_tools["hidden"] = true
Test_ScriptMode = false
TDump, TDeepDump = 0, 0
--INFO: -----------------UPDATE FEATURE VISIBILITY-------------------------
Moist_TestMode = menu.add_feature("Enable TestMode Functions", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local seen={}
	local debug_mode
	Test_ScriptMode = true
	debug_mode = Test_ScriptMode
	if not feat["on"] then
		Test_ScriptMode = false
		debug_mode = Test_ScriptMode
		return HANDLER_POP
	end
	moist_notify("Table Dump Functions Enabled")
	moist_notify("Dump(table)\nserialize(table)\ndeepcopy(table)\nPrt(table) prints output to console and DebugModeOutput.log", "New Console Functions Enabled!")
	TablesFound = {}
	
	function a(input)
		for k, v in pairs(input) do
			if type(k) == "table" then
				TablesFound[#TablesFound+1] = k
				for key, value in pairs(k) do
					Debug_Out(tostring(key), false, "DebugModeOutput.log")
					if type(key) == "table" then
						for x, y in pairs(key) do
							local TableString = tostring(x) .. " : " .. tostring(y)
							Debug_Out(TableString, false, "DebugModeOutput.log")
						end
						else
						Debug_Out(tostring(key) .. " : " .. tostring(value), false, "DebugModeOutput.log")
					end
				end
				else
				Debug_Out(tostring(k) .. " : " .. tostring(v), false, "DebugModeOutput.log")
			end
		end
	end
	Dump = function(o)
		if type(o) == 'table' then
			local s = 'Table Dump: ' .. tostring(o) .. '{}\n{'
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..tostring(k)..'"' end
				s = s .. '\n{['..tostring(k)..'] = ' .. Dump(v) .. '},'
			end
			return s
			else
			return tostring(o)
		end
	end
	local next=next
	local type=type
	local tostring=tostring
	local format=string.format
	local sort=table.sort
	local concat=table.concat
	function serialize(t)
		--system.yield(0)
		local TYPE=type(t)
		if TYPE=="boolean" or TYPE=="number" then
			return tostring(t)
			elseif TYPE=="string" then
			return format("%q",t)
			elseif TYPE=="table" then
			local ret={}
			local r_v={}
			local n=0
			for i,v in next,t do
				local sv=serialize(v)
				ret[#ret+1]="["..serialize(i).."]="..sv
				r_v[i]=sv
				n=n+1
				system.yield(1)
			end
			if n==#t then
				return "{"..concat(r_v,", ").."}"
				else
				sort(ret)
				return "{"..concat(ret,", ").."}"
			end
			else
			return "&"..TYPE.."="..format("%q",tostring(t))
		end
	end
	deepcopy = function(orig)
		local orig_type = type(orig)
		local copy
		if orig_type == 'table' or orig_type == 'userdata' then
			copy = {}
			for orig_key, orig_value in next, orig, nil do
				copy[deepcopy(orig_key)] = deepcopy(orig_value)
				system.yield(1)
			end
			setmetatable(copy, deepcopy(getmetatable(orig)))
			else -- number, string, boolean, etc
			copy = tostring(orig)
		end
		return copy
	end
	function Debug(text)
		if debug_mode then
			Print('[DEBUG] ' .. tostring(text))
		end
	end
	function dump(o)
		if type(o) == 'table' then
			local s = ' = { '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..tostring(k)..'"' end
				s = '{\n['..tostring(k)..'] = ' .. dump(v) .. ','
			end
			--Debug_Out(s .. '} ', false, "DebugModeOutput.log")
			return s .. '} '
			else
			--	Debug_Out(tostring(o), false, "DebugModeOutput.log")
			return tostring(o)
		end
	end
	function DumpTable(o)
		if type(o) == 'table' then
			local s = ' = { '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..tostring(k)..'"' end
				s = '{\n['..tostring(k)..'] = ' .. DumpTable(v) .. ','
				system.yield(1)
			end
			Debug_Out(s .. '} ', false, "DebugModeOutput.log")
			-- return s .. '} '
			else
			Debug_Out(tostring(o), false, "DebugModeOutput.log")
			--return tostring(o)
		end
	end
	function dump1(o)
		if type(o) == 'table' then
			local s = '{ '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..tostring(k)..'"' end
				s = s .. '['..tostring(k)..'] = ' .. dump1(v) .. ','
			end
			return s .. '} '
			else
			return tostring(o)
		end
	end
	local PrintThread  = 0
	function Prt(o)
		--print(dump(o))
		Debug_Out(tostring(o), false, "DebugModeOutput.log")
		PrintThread = menu.create_thread(a, o)
		while not menu.has_thread_finished(PrintThread) do
			return HANDLER_CONTINUE
		end
		menu.delete_thread(PrintThread)
	end
	function dump(t,i)
		seen[t]=true
		local s={}
		local n=0
		for k in pairs(t) do
			n=n+1 s[n]=k
		end
		table.sort(s)
		for k,v in ipairs(s) do
			local file = io.open("funcs.txt", "a")
			print(i,v)
			v=t[v]
			if type(v)=="table" and not seen[v] then
				dump(v,i.."\t")
			end
		end
	end
end)
Moist_TestMode["on"] = false
ModderAudio_notify_thread = menu.add_feature("Audio Notify God Modders", "value_i", globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local Soundz = {{"CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_WAVE_COMPLETE", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_RANK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_IDLE_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_IDLE_KICK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},{"Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"}}
	local pos = v3()
	if Settings["GodAudVfxNotif_on"] then
		if Settings["GodAudVfxNotif"] == 0 or Settings["GodAudVfxNotif"] == 1 then
			pos = player.get_player_coords(player.player_id())
			audio.play_sound_from_coord(-1, Soundz[feat.value][1], pos, Soundz[feat.value][2], true, 1, true)
			audio.stop_sound(-1)
		end
		system.yield(500)
		if Settings["GodAudVfxNotif"] == 0 or Settings["GodAudVfxNotif"] == 2 then
			ScreenFX = {"RaceTurbo", "LostTimeDay", "LostTimeNight"}
			for i = 1, #ScreenFX do
				local postfxhash = gameplay.get_hash_key(ScreenFX[i])
				graphics.animpostfx_play(postfxhash, 20, true)
				system.wait(1000)
				graphics.animpostfx_stop_all()
				system.yield(Settings["loop_feat_delay"])
			end
		end
		system.yield(1000)
	end
	ModderAudio_notify_thread["on"] = false
	return HANDLER_POP
end)
ModderAudio_notify_thread["on"] = false
ModderAudio_notify_thread["max"] = 8
ModderAudio_notify_thread["min"] = 1
OS_DEBUG_DRAW = menu.add_feature("Debug Draw OS", "toggle", globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		if DebugText == nil then
			DebugText = ""
		end
		scriptdraw.draw_text(DebugText, v2(0.5,0.5), v2(), 0.95, 0xFFFFFFFF, 1 << 0 | 1 << 2, nil)
		system.wait(0)
	end
	return HANDLER_POP
end)
OS_DEBUG_DRAW["on"] = false
set_targetting_mode = menu.add_feature("Targetting Mode: ", "value_i", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	player.set_player_targeting_mode(feat.value)
	return HANDLER_CONTINUE
end)
set_targetting_mode["on"] = false
set_targetting_mode["max"] = 10
set_targetting_mode["min"] = -2
ScreenAnimPostFX={"CamPushInNeutral", "FocusIn", "FocusOut", "BulletTime", "BulletTimeOut", "DrivingFocus", "DrivingFocusOut", "REDMIST", "REDMISTOut", "SwitchShortMichaelIn", "SwitchShortFranklinMid", "CamPushInFranklin", "CamPushInMichael", "CamPushInTrevor", "SwitchHUDOut", "MP_job_load", "MenuMGTrevorIn", "MenuMGMichaelIn", "MenuMGFranklinIn", "MenuMGTrevorOut", "MenuMGMichaelOut", "MenuMGFranklinOut", "MenuMGIn", "MenuMGSelectionIn", "MenuMGSelectionTint", "MenuMGTournamentIn", "MenuMGHeistIn", "MenuMGHeistTint", "MenuMGHeistIntro", "MenuMGTournamentTint", "MenuMGRemixIn", "MenuSurvivalAlienIn", "MP_race_crash", "DeathFailMPDark", "DeathFailMPIn", "CrossLine", "SuccessFranklin", "SuccessTrevor", "SuccessMichael", "MinigameTransitionIn", "MP_Celeb_Preload_Fade", "MP_Celeb_Win", "MP_Celeb_Lose", "MinigameTransitionOut", "MinigameEndNeutral", "RaceTurbo", "MP_corona_switch_supermod", "WeaponUpgrade", "MinigameEndMichael", "MinigameEndFranklin", "MinigameEndTrevor", "Rampage", "RampageOut", "MP_TransformRaceFlash", "DeathFailOut", "HeistCelebPass", "HeistCelebPassBW", "HeistCelebFail", "HeistCelebFailBW", "SuccessNeutral", "HeistCelebEnd", "SwitchSceneMichael", "SwitchSceneFranklin", "SwitchSceneTrevor", "SwitchOpenNeutralOutHeist", "ArenaWheelPurple", "CarDamageHit", "MenuMGHeistOut", "CrossLineOut", "MP_SmugglerCheckpoint", "MP_Celeb_Win_Out", "MP_Celeb_Lose_Out", "MP_WarpCheckpoint", "MP_intro_logo", "InchPickup", "PPOrange", "PPPurple", "PPGreen", "PPPink", "DeadlineNeon", "MP_Celeb_Preload", "HeistTripSkipFade", "InchPickupOut", "PPOrangeOut", "PPPurpleOut", "PPGreenOut", "PPPinkOut", "HeistLocate", "BeastIntroScene", "BeastTransition", "BeastLaunch", "MP_OrbitalCannon", "RemixDrone", "pennedIn", "PennedInOut", "PeyoteEndIn", "PeyoteEndOut", "PeyoteIn", "PeyoteOut", "DefaultBlinkOutro", "SwitchShortFranklinIn", "SwitchShortMichaelMid", "SwitchShortTrevorIn", "SwitchShortTrevorMid", "ChopVision", "DMT_flight", "DrugsDrivingOut", "DMT_flight_intro", "DrugsDrivingIn", "SwitchOpenNeutralFIB5", "SwitchOpenMichaelMid", "SwitchOpenMichaelIn", "MP_corona_switch", "InchPurple", "DeathFailNeutralIn", "SwitchShortNeutralIn", "CarPitstopHealth", "InchOrange", "LostTimeDay", "LostTimeNight", "MP_Bull_tost", "PPFilter", "PPFilterOut", "TinyRacerPink", "TinyRacerGreen", "TinyRacerGreenOut", "TinyRacerPinkOut", "InchOrangeOut", "InchPurpleOut", "TinyRacerIntroCam", "SurvivalAlien", "BikerFormation", "BikerFormationOut", "ArenaEMP", "ArenaEMPOut", "SwitchOpenFranklin", "ExplosionJosh3", "SwitchSceneNeutral", "SniperOverlay", "SwitchSceneNetural", "Dont_tazeme_bro", "SwitchHUDMichaelIn", "SwitchHUDFranklinIn", "SwitchHUDTrevorIn", "SwitchHUDIn", "SwitchHUDMichaelOut", "SwitchHUDFranklinOut", "SwitchHUDTrevorOut", "PokerCamTransition"}
ScreenFX = menu.add_feature("ScreenFX: ", "value_str", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    if not feat["on"] then
        graphics.animpostfx_stop_all()
        return HANDLER_POP
	end
    local postfxhash = gameplay.get_hash_key(ScreenAnimPostFX[feat.value + 1])
    graphics.animpostfx_play(postfxhash, 20, true)
end)
ScreenFX:set_str_data(ScreenAnimPostFX)
fxremoveall = menu.add_feature("Stop all Anim Post FX", "action", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	graphics.animpostfx_stop_all()
	return HANDLER_POP
end)
--INFO: Blip Interior Checks
function BlipGodChecks()
	local Blip_God = {"Normal Radar", "Expanded Radar"}
	blipcheck = menu.add_feature("Blip Interior Check", "value_str", ModderShit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped
		if feat["on"] then
			for pid = 0, 31 do
				if player.is_player_valid(pid) then
					pped = player.get_player_ped(pid)
					Players[pid].BlipPID = ui.get_blip_from_entity(pped)
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) then return end
					if Settings["blipGodcheckvalue"] == 0 then
						if (interior.get_interior_from_entity(player.get_player_ped(player.player_id())) == 0) then
							system.wait(2000)
							if ui.get_blip_from_entity(pped) ~= 0 and (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  0) then
								Players[pid].isint = false
							end
						end
						system.wait(1)
						elseif Settings["blipGodcheckvalue"] == 1 then
						if not player.is_player_god(player.player_id()) or player.is_player_vehicle_god(player.player_id()) then
							system.wait(2000)
							if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) then return end
							if ui.get_blip_from_entity(pped) ~= 0 and (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  0) then
								Players[pid].isint = false
							end
						end
					end
				end
				system.wait(1)
			end
			system.wait(1)
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end)
	blipcheck:set_str_data(Blip_God)
	blipcheck["value"] = Settings["blipGodcheckvalue"]
	blipcheck["on"] = false
	blipGodcheck = menu.add_feature("God Blip Check", "value_str", ModderShit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped
		if not feat["on"] then
			blipcheck["on"] = false
			Settings["blipGodcheck"] = false
			Settings["blipGodcheckvalue"] = feat.value
			--Print(feat.value)
			return HANDLER_POP
		end
		Settings["blipGodcheck"] = true
		Settings["blipGodcheckvalue"] = feat.value
		if feat["on"] then
			blipcheck["on"] = true
			for pid = 0, 31 do
				if player.is_player_valid(pid) --[[and Players[pid].PedSpawned]] then
					name = player.get_player_name(pid)
					pped = player.get_player_ped(pid)
					Players[pid].BlipPID = ui.get_blip_from_entity(pped)
					local pos = player.get_player_coords(pid)
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) then return end
					if feat.value == 0 then
						if (interior.get_interior_from_entity(player.get_player_ped(player.player_id())) == 0) and (interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0) and not player.is_player_god(player.player_id()) or player.is_player_vehicle_god(player.player_id()) then
							system.wait(2000)
							if not ui.get_blip_from_entity(pped) == 0 and pos.z >= -90 then
								--  Players[pid].isint = false
								if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
									system.wait(15000)
									Players[pid].BlipPID = ui.get_blip_from_entity(pped)
									if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 and not Players[pid].isint then
										if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not ui.get_blip_from_entity(pped) == 0 then
											moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Blip Check")
											audio.play_sound_from_entity(-1,  "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
											Players[pid].PlayerGodMode = player.is_player_god(pid)
											Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
										end
									end
								end
							end
						end
						elseif feat.value == 1 then
						if not ui.get_blip_from_entity(pped) == 0 and pos.z >= -90 then
							--  Players[pid].isint = false
							if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
								system.wait(15000)
								Players[pid].BlipPID = ui.get_blip_from_entity(pped)
								if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 and not Players[pid].isint then
									if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not ui.get_blip_from_entity(pped) == 0 then
										moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Blip Check")
										audio.play_sound_from_entity(-1,  "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
										Players[pid].PlayerGodMode = player.is_player_god(pid)
										Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
									end
								end
							end
						end
					end
					system.wait(1)
				end
				system.wait(1)
			end
			return HANDLER_CONTINUE
		end
	end)
	blipGodcheck:set_str_data(Blip_God)
	blipGodcheck["on"] = Settings["blipGodcheck"]
	blipGodcheck["value"] = Settings["blipGodcheckvalue"]
	--INFO: Blip God Checks
	blipGodcheck = menu.add_feature("God Blip Check 2", "toggle", ModderShit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped
		if not feat["on"] then
			blipcheck["on"] = false
			Settings["blipGodcheck"] = false
			--Print(feat.value)
			return HANDLER_POP
		end
		Settings["blipGodcheck"] = true
		if feat["on"] then
			blipcheck["on"] = true
			for pid = 0, 31 do
				if Players[pid].PlayerGodMode or Players[pid].PlayerVehGodMode then
					if Settings["GodCheckNotif"] and not Players[pid].isgod then
						Players[pid].isgod = player.is_player_god(pid)
						moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Blip Check 2")
						ModderAudio_notify_thread["on"] = true
					end
				end
				if  ui.get_blip_from_entity(player.get_player_ped(pid)) == 0 then return end
				if player.is_player_valid(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
					name = player.get_player_name(pid)
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
						system.wait(5000)
						if player.is_player_valid(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
							system.wait(5000)
							if not Players[pid].isint and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
								system.wait(5000)
								if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
									if Settings["GodCheckNotif"] and not Players[pid].isgod then
										Players[pid].isgod = player.is_player_god(pid)
										--Players[pid].isvgod = player.is_player_vehicle_god(pid)
										moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Blip Check 2")
										ModderAudio_notify_thread["on"] = true
									end
									Players[pid].PlayerGodMode = player.is_player_god(pid)
									Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
								end
							end
						end
					end
				end
				system.wait(1)
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end)
	blipGodcheck["on"] = Settings["blipGodcheck"]
end
BlipGodChecks()
RecentNotify = menu.add_feature("Recent Players Seen Notify", "toggle", globalFeatures.notifyParent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["RecentPlayer_Notify"] = false
		return HANDLER_POP
	end
	Settings["RecentPlayer_Notify"] = true
end)
RecentNotify["on"] = Settings["RecentPlayer_Notify"]
ply_seat = menu.add_feature("Set your seat (default front)", "action_value_i", globalFeatures.self_veh,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pid = player.player_id()
	local pped = player.get_player_ped(pid)
	local veh = ped.get_vehicle_ped_is_using(pped)
	if veh == nil or 0 then
		veh = player.get_player_vehicle(player.player_id())
		ped.set_ped_into_vehicle(pped, veh, feat.value)
	end
end)
ply_seat["max"] = 14
ply_seat["min"] = -1
ply_seat["value"] = -1
local health, infoA, infoAB, infoB = "#", "#", "#", "#"
text1, text2, text3, text4, text5 , text6, text7 = "", "", "", "", "", "", "", "", "", ""
--INFO: *********** Active Script Item Player Info ****************
local GetDistanceMag = function(Entity)
	local MyPos = player.get_player_coords(player.player_id())
	local EntPos = entity.get_entity_coords(Entity)
	return (MyPos:magnitude(EntPos))
end
function GetZone(pid)
	local found = nil
	local pped = player.get_player_ped(pid)
	for i = 1, #Zone_LongNames do
		--#ZonesTable[Zone_LongNames[i][1]]
		--for y = 1, #ZonesTable[Zone_LongNames[i][1]] do
		if entity.is_entity_in_zone(pped, Zone_LongNames[i][1]) then
			found = Zone_LongNames[i][1]
			return tostring(Zone_LongNames[i][1]), tostring(Zone_LongNames[i][2])
		end
	end
	if found then
		return found
		elseif not found then
		for k, v in pairs(ZonesTable) do
			for i = 1, #ZonesTable[k] do
				if player.get_player_coords(pid) >= ZonesTable[k][i][1] and  player.get_player_coords(pid) <= ZonesTable[k][i][2] then
					return tostring(k)
				end
			end
		end
	end
	found = nil
end
function GetZoneText(pid)
	local pos = v3()
	local pped = player.get_player_ped(pid)
	if pid ~= nil then
		pos = player.get_player_coords(pid)
		if pos.z < -50 then
			pos.z = 0.0
		end
		for y = 1, #Zone_LongNames do
			if entity.is_entity_in_zone(pped, Zone_LongNames[y][1]) then
				return Zone_LongNames[y][1]
			end
			for i = 1, #ZonesTable[Zone_LongNames[y][1]] do
				pos = player.get_player_coords(pid)
				if pos >= ZonesTable[Zone_LongNames[y][1]][i][1] and pos <= ZonesTable[Zone_LongNames[y][1]][i][2] then
					print(Zone_LongNames[y][1])
					return(Zone_LongNames[y][1])
				end
			end
		end
	end
end
function Get_Zone(pid)
	local pos = player.get_player_coords(pid)
	print(pos)
	local pos1, pos2
	for k, v in pairs(ZonesTable) do
		for i = 1, #ZonesTable[k] do
			pos1 = ZonesTable[k][i][1]
			pos2 = ZonesTable[k][i][2]
			if pos.x >= pos1.x and pos.y >= pos1.y and pos.x <= pos2.x and pos.y <= pos2.y then
				print(true)
				return tostring(k)
				else
				print(false)
				return tostring(false)
			end
		end
	end
end
function ZoneInfo(pid)
	local ZoneFound = false
	local zpos1, zpos2, pos = v3(), v3(), v3()
	pos = player.get_player_coords(pid)
	for y = 1, #Zone_LongNames do
		for i = 1, #ZonesTable[Zone_LongNames[y][1]] do
			if ZoneFound == false then
				zpos1 = ZonesTable[Zone_LongNames[y][1]][i][1]
				zpos2 = ZonesTable[Zone_LongNames[y][1]][i][2]
				if v2(pos.x,pos.y) >= v2(zpos1.x,zpos1.y) and v2(pos.x,pos.y) <= v2(zpos2.x,zpos2.y) then
					print("Zone = " .. Zone_LongNames[y][1] .. "\n" .. Zone_LongNames[y][2])
					ZoneFound = true
					return(Zone_LongNames[y][1]), (Zone_LongNames[y][2])
				end
				if ZoneFound == true then
					break
				end
				-- elseif ZoneFound == true then
				-- break end
			end
		end
	end
	if not ZoneFound then
		return "interior"
	end
	ZoneFound = false
end
function Entity_Zone_Info(EntityID)
	local ZoneFound = false
	local zpos1, zpos2, pos = v3(), v3(), v3()
	for y = 1, #Zone_LongNames do
		if entity.is_entity_in_zone(EntityID, Zone_LongNames[y][1]) then
			ZoneFound = true
			--print("f")
			return (Zone_LongNames[y][1]), (Zone_LongNames[y][2])
		end
		if ZoneFound == true then
			break
		end
	end
	pos = entity.get_entity_coords(EntityID)
	-- if pos.z < -25.00 then
	-- z = tostring(pos.z)
	-- pos.z = pos.z + tonumber(z:sub(2, string.len(z)))
	-- --print(pos.z)
	-- end
	for y = 1, #Zone_LongNames do
		for i = 1, #ZonesTable[Zone_LongNames[y][1]] do
			if ZoneFound == false then
				zpos1 = ZonesTable[Zone_LongNames[y][1]][i][1]
				zpos2 = ZonesTable[Zone_LongNames[y][1]][i][2]
				if pos >= zpos1 and pos <= zpos2 then
					--	print("Zone = " .. Zone_LongNames[y][1] .. "\n" .. Zone_LongNames[y][2])
					ZoneFound = true
					--print("v3")
					return(Zone_LongNames[y][1]), (Zone_LongNames[y][2])
					elseif pos.x >= zpos1.x and pos.y >= zpos1.y and pos.x <= zpos2.x and pos.y <= zpos2.y  then
					--print("Zone = " .. Zone_LongNames[y][1] .. "\n" .. Zone_LongNames[y][2])
					ZoneFound = true
					--print("v2")
					return(Zone_LongNames[y][1]), (Zone_LongNames[y][2])
				end
				if ZoneFound == true then
					break
				end
				-- elseif ZoneFound == true then
				-- break end
			end
		end
	end
	ZoneFound = false
end
Active_scriptmenu = menu.add_feature("Active Script item Player info", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    Settings["playerscriptinfo"] = true
    while feat["on"] do
        local pid, intchk, intname, pos, dist2D = Active_menu, "", "", v3(0.0,0.0,0.0), ""
        local precheck, ZonePOS, Zone_POS, ZoneLong
        if Active_menu ~= nil and player.is_player_valid(Active_menu) then
			--Zone_POS = Get_Zone(pid)
			ZonePOS, ZoneLong = Entity_Zone_Info(player.get_player_ped(pid))
			--ZonePOS = GetZoneText(pid) or "interior"
			--ZonePOS = ZoneInfo(pid) or "interior"
            dis = GetDistanceMag(player.get_player_ped(pid))
            dist = RoundNum(dis, 2)
            if dist < 1000.00 then
                dist = "~r~~h~" .. dist
				elseif dist >= 1000.00 then
				dist = "~g~~h~" .. dist
			end
            local info = tostring(infoB .. "\n~g~Dist: " .. dist ..  "\n~h~~r~Dmg by: ~o~" .. tostring(Players[pid].isDamagedbY))
            if Players[pid].isint == false then
                intchk = "~h~~g~FALSE"
                precheck = false
			end
            if Players[pid].isint == true then
                intchk = "~h~~r~TRUE"
                precheck = true
			end
            if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
                realcheck = false
				Players[pid].Interiorname = nil
				elseif interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0 then
                realcheck = true
				Players[pid].isint = true
			end
            if realcheck == true and Players[pid].intID ~= nil then
				if Players[pid].intID ~= nil then
					dist2D = RoundNum(Get_Distance2D(pid, interiors[ZonePOS][Players[pid].intID][2]), 2) or "NaN"
					dist3D = RoundNum(Get_Dist_3D(pid, interiors[ZonePOS][Players[pid].intID][2]), 2) or "NaN"
					text5 = "~h~~o~Interior:~w~ " .. tostring(Players[pid].Interiorname) ..  " | ~o~~h~Dist:~w~  2D = " .. tostring(dist2D) .." | ~o~~h~Zone:~w~ " .. tostring(ZoneLong)
				end
				elseif realcheck ~= true then
				if Players[pid].onlineintID ~= nil then
					if Players[pid].onlinecheck == true and Players[pid].onlineintID ~= nil then
						dist2D = RoundNum(Get_Distance2D(pid, onlineinteriors[Players[pid].onlineintID][2]), 2) or "NaN"
						dist3D = RoundNum(Get_Dist_3D(pid, onlineinteriors[Players[pid].onlineintID][2]), 2) or "NaN"
						text5 = "~h~~o~Interior:~w~ " .. tostring(Players[pid].online_interior)  .. " | ~o~~h~Zone:~w~ " .. tostring(ZoneLong)
					end
					elseif Players[pid].onlinecheck ~= true then
                    text5 = "~h~~o~Interior =~r~ NoneDetected~w~ | ~o~~h~Zone:~w~ " .. tostring(ZoneLong)
				end
				else
				text5 = "~h~~o~Interior:~r~ None | ~o~~h~Zone:~w~ " .. tostring(ZoneLong)
			end
			local real = true and "~r~" .. string.upper(tostring(realcheck)) or false and "~g~" .. string.upper(tostring(realcheck))
			text4 = "\n~h~~b~Interior\t|\tCheck~w~\n" .. intchk .. "\t|\t~o~" .. real .. "\n~y~Zone:~h~\t" .. tostring(ZonePOS)
            update_osd_text2(health, infoA, info, infoAB)
		end
        system.yield(Settings["loop_feat_delay"])
        --return HANDLER_CONTINUE
	end
    health, infoA, infoAB, infoB, text1, text2, text3, text4, text5, text6, text7 = "", "", "", "", "", "", "", "", "", "", ""
    Settings["playerscriptinfo"] = false
    return HANDLER_POP
end)
Active_scriptmenu["on"] = Settings["playerscriptinfo"]
event_test1 = menu.add_feature("Frames", "toggle", globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local ft, fc, th, tm, ts, rt, rs
	if feat["on"] then
		th = time.get_clock_hours()
		tm = time.get_clock_minutes()
		ts = time.get_clock_seconds()
		if tm < 10 then
			tm = 0 ..tm
		end
		rt = utils.time()
		rs = utils.time_ms()
		local GameTime = string.format("\nGametime " ..th ..":"..tm ..":" ..ts .. "\n" .. rt .." : " ..rs)
		ui.draw_rect(0.001, 0.990, 0.8, 0.120, 0, 0, 0, 180)
		local pos = v2()
		pos.x = 0.001
		pos.y = .920
		ui.set_text_scale(0.30)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text(GameTime, pos)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
local hash
spawnobject = menu.add_feature("clipboard Object Spawn", "action", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local clip, typetest
	clip = utils.from_clipboard()
	if tonumber(clip) ~= nil or clip:sub(1, 3) == "0x" then
		hash = tonumber(clip)
		moist_notify("Clipboard Contains Posible Hash Data\n", "Using That Data")
		else
		hash = gameplay.get_hash_key(clip)
		moist_notify("Hash Fetched: " .. hash .. "\nLets See If This Is Spawnable")
	end
	local pos = v3()
	pos = get_offset(player.player_id(), 10)
	spawned_cunts[#spawned_cunts + 1] = object.create_object(hash, pos, true, true)
	if AddBlips == true then
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
	end
end)
moist_tools_hotkey = menu.add_feature("Moist Test Shit Hotkey", "toggle", globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local key = MenuKey()
		key:push_str("LCONTROL")
		key:push_str("LSHIFT")
		key:push_str("h")
		if key:is_down() then
			globalFeatures.moist_tools["hidden"] = not globalFeatures.moist_tools.hidden
			New_Notify["hidden"] = not New_Notify.hidden
			system.wait(1200)
		end
		system.yield(10)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
moist_tools_hotkey["on"] = true
--TODO: Modder Flag logs etc
local Modder_Event = event.add_event_listener("modder", function(e)
    if e["player"] ~= nil then
        local pid = e["player"]
	    local name = tostring(player.get_player_name(pid))
		local flagtext = Get_ModderFlag_Text(pid)
        if Players[pid].isFriend then
            if Settings["FriendBypass"] and player.is_player_modder(pid, Settings["KickModFlag"]) then
				playerFeatures[pid].features["RemoveModflagging"].feat["value"] = 1
				playerFeatures[pid].features["RemoveModflagging"].feat["on"] = true
                if not Players[pid].IsFlagRemNotif then
                    moist_notify("Removed Flag from: " .. name .. " | " .. flagtext, "")
                    Players[pid].IsFlagRemNotif = true
				end
				elseif not Settings["FriendBypass"] then
                if player.is_player_modder(pid, Settings["KickModFlag"]) then
                    CombiKick(pid)
				end
			end
			elseif not Players[pid].isFriend and player.is_player_modder(pid, Settings["KickModFlag"]) then
            CombiKick(pid)
		end
	end
    return
end)
local Modder_EventRem = event.add_event_listener("modder", function(e)
	if type(e) == 'number' then
		return HANDLER_POP
	end
    if e["player"] ~= nil then
        local pid = e["player"]
		local name = tostring(player.get_player_name(pid))
		local flagtext = Get_ModderFlag_Text(pid)
		if player.is_player_modder(pid, Settings["RemoveModFlag"]) then
			playerFeatures[pid].features["RemoveModflagging"].feat["value"] = 0
			playerFeatures[pid].features["RemoveModflagging"].feat["on"] = true
			if not Players[pid].IsFlagRemNotif then
				moist_notify("Removed Flag from: " .. name .. " | " .. flagtext, "")
				Players[pid].IsFlagRemNotif = true
			end
		end
	end
    return
end)
Kick_Flag_Parent = menu.add_feature("Flags to AutoKick", "parent", ModderFlagShit).id
Remove_Flag_Parent = menu.add_feature("Flags to AutoRemove", "parent", ModderFlagShit).id
ExcluFriends = menu.add_feature("Bypass Kick & Remove Flag From Friends", "toggle", Kick_Flag_Parent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["FriendBypass"] = false
		return HANDLER_POP
	end
	Settings["FriendBypass"] = true
	return HANDLER_POP
end)
ExcluFriends["on"] = Settings["FriendBypass"]
menu.add_feature("Selected Flags Will Be Removed", "action", Remove_Flag_Parent)
function KickFlagSetup()
	local kickflags = 0
	kickflags = Settings["KickModFlag"]
	local i = 0
	repeat
		local flag <const> = 1 << i    
		i = i + 1
		if flag ~= player.get_modder_flag_ends() then
			NamedFeatures[tostring(player.get_modder_flag_text(flag))] = menu.add_feature(player.get_modder_flag_text(flag), "toggle", Kick_Flag_Parent,function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				if feat["on"] then
					Settings["KickModFlag"] = tonumber(Settings["KickModFlag"]) | flag
					else
					Settings["KickModFlag"] = tonumber(Settings["KickModFlag"]) & (tonumber(Settings["KickModFlag"]) ~ flag)
				end
			end)
			NamedFeatures[tostring(player.get_modder_flag_text(flag))]["on"] = false
		end
	until player.get_modder_flag_ends() == flag
	for i = 0, 63 do
		NamedFeat =	tonumber(kickflags) & 1 << i == 1 << i  and player.get_modder_flag_text(1 << i) or nil
		for k, v in pairs(NamedFeatures) do
			if tostring(k) == tostring(NamedFeat) then
				NamedFeatures[k]["on"] = true
			end
		end
	end
end
function RemoveFlagSetup()
	local removeflags = 0
	removeflags = Settings["RemoveModFlag"]
	local i = 0
	repeat
		local flag <const> = 1 << i    
		i = i + 1
		if flag ~= player.get_modder_flag_ends() then
			Named_Features[tostring(player.get_modder_flag_text(flag))] = menu.add_feature(tostring(player.get_modder_flag_text(flag)), "toggle", Remove_Flag_Parent,function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				if feat["on"] then
					Settings["RemoveModFlag"] = tonumber(Settings["RemoveModFlag"]) | flag
					else
					Settings["RemoveModFlag"] = tonumber(Settings["RemoveModFlag"]) & (tonumber(Settings["RemoveModFlag"]) ~ flag)
				end
			end)
			Named_Features[tostring(player.get_modder_flag_text(flag))]["on"] = false
		end
	until player.get_modder_flag_ends() == flag
	for i = 0, 63 do
		NamedFeat = tonumber(removeflags) & 1 << i == 1 << i  and player.get_modder_flag_text(1 << i) or nil
		for k, v in pairs(NamedFeatures) do
			if tostring(k) == tostring(NamedFeat) then
				Named_Features[k]["on"] = true
			end
		end
	end
end
AudioNotifyGod = menu.add_feature("Notify God: ", "value_str", ModderShit,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["GodAudVfxNotif_on"] = false
		Settings["GodAudVfxNotif"] = feat.value
		return HANDLER_POP
	end
	Settings["GodAudVfxNotif_on"] = true
	Settings["GodAudVfxNotif"] = feat.value
end)
AudioNotifyGod["on"] = Settings["GodAudVfxNotif_on"]
AudioNotifyGod:set_str_data({"Audio+Visual", "Audio Only", "Visual Only"})
NotifyGod = menu.add_feature("Notify God Player/Vehicle", "toggle", ModderShit,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["GodCheckNotif"] = false
		for pid = 0, 31 do
			Players[pid].isgod = true
			Players[pid].isvgod = true
		end
		return HANDLER_POP
	end
	Settings["GodCheckNotif"] = true
	notifyclear["on"] = true
	for pid = 0, 31 do
		Players[pid].isgod = false
		Players[pid].isvgod = false
		Players[pid].isKicked = false
	end
end)
NotifyGod["on"] = Settings["GodCheckNotif"]
GodVersion = Settings["PlayerGodCheckVersion"]
InteriorVersion = Settings["PlayerCheckVersion"]
GodCheckVer = menu.add_feature("God Check Version", "value_i", ModderShit,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["GodCheck"] = false
		return HANDLER_POP
	end
	Settings["GodCheck"] = true
	if feat["on"] and feat.value == 1 then
		Settings["PlayerGodCheckVersion"] = 1
		elseif feat["on"] and feat.value == 2 then
		Settings["PlayerGodCheckVersion"] = 2
	end
	return HANDLER_POP
end)
GodCheckVer["min"] = 1
GodCheckVer["max"] = 2
GodCheckVer["value"] = Settings["PlayerGodCheckVersion"]
GodCheckVer["on"] = Settings["GodCheck"]
InteriorCheckVer = menu.add_feature("Interior Check Version", "value_i", ModderShit,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat.value == 1 then
		Settings["PlayerCheckVersion"] = 1
		elseif feat.value == 2 then
		Settings["PlayerCheckVersion"] = 2
	end
end)
InteriorCheckVer["min"] = 1
InteriorCheckVer["max"] = 2
InteriorCheckVer["value"] = Settings["PlayerCheckVersion"]
InteriorCheckVer["on"] = Settings["GodCheckNotif"]
function clearnotif(pid)
	Players[pid].isvgod = false
	Players[pid].isgod = false
	Players[pid].isKicked = false
	Players[pid].orbnotify = false
	Players[pid].orbnotify2 = false
	--Players[pid].isint = false
	Players[pid].PlayerGodMode = false
	Players[pid].PlayerVehGodMode = false
	Players[pid].isNotifSpec = false
end
notifyclear = menu.add_feature("clear Detection notify's", "toggle", ModderShit,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["GodCheckNotif"] = true
	if feat["on"] then
		for pid = 0, 31 do
			if Players[pid].orbnotify2 or Players[pid].orbnotify or Players[pid].isgod or Players[pid].isvgod or Players[pid].isKicked then
				system.wait(70000)
				clearnotif(pid)
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["GodCheckNotif"] = false
	return HANDLER_POP
end)
notifyclear["on"] = Settings["GodCheckNotif"]
notifyclear["hidden"] = false
--TODO: GOD Check Threads
inter_godcheck_thread =function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while true do
		for pid = 0, 31 do
			if not player.is_player_valid(pid) then return end
			if  Players[pid].PedSpawned then
				if  player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
					system.yield(5000)
					if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") == 0 and interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 and not Players[pid].isint then
						system.wait(8000)
						if not Players[pid].isint and player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
							if not Players[pid].isgod and Settings["GodCheckNotif"] then
								moist_notify(pid .. " : " .. tostring(player.get_player_name(pid)) .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nNew God Thread")
								Players[pid].isgod = true
								ModderAudio_notify_thread["on"] = true
							end
						end
						system.yield(6)
					end
					elseif not player.is_player_god(pid) or not player.is_player_vehicle_god(pid) then
				return end
				system.yield(6)
			end
			system.yield(6)
		end
		system.yield(6)
	end
	system.yield(6)
end
--INFO: God Check v1
God_Check1_pid_thread = function(pid)
	local pped, name
	local pos = v3()
	while true do
		if player.is_player_valid(pid) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not Players[pid].isRC then
			name = player.get_player_name(pid)
			pped = player.get_player_ped(pid)
			system.yield(3000)
			if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
				system.yield(3000)
				if ai.is_task_active(pped, 4) or  ai.is_task_active(pped, 290) or  ai.is_task_active(pped, 298) or  ai.is_task_active(pped, 422) or ai.is_task_active(pped, 200) or  ai.is_task_active(pped, 295) and not Players[pid].isint then
					system.yield(3000)
					pos = player.get_player_coords(pid)
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not entity.is_entity_dead(pped) and not Players[pid].isint then
						if  pos.z < -90.00 then
							if Settings["GodCheckNotif"] and not Players[pid].isgod then
								moist_notify("God Mode with Active Task Detected: " .. name,  "Modder Detection!")
								ModderAudio_notify_thread["on"] = true
								Players[pid].isgod = true					
							end
						end
					end
				end
				elseif ped.is_ped_shooting(pped) and not Players[pid].isRC then
				Players[pid].PlayerGodMode = true
				if Settings["GodCheckNotif"] and not Players[pid].isgod then
					moist_notify("Shooting While God Mode: " .. name,  "Modder Detection!")
					ModderAudio_notify_thread["on"] = true
					Players[pid].isgod = true					
				end
			end
		end
		system.yield(10)
	end
	system.yield(10)
end
GodCheck_pid_thread = function(pid)
	while true do
		if player.is_player_valid(pid) ~= false and pid ~= player.player_id()then
			local pped, plyveh
			if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
				system.wait(200)
				local Entity = ""
				pped = player.get_player_ped(pid)
				if pped ~= nil or pped ~= 0 then
					local pos = v3()
					plyveh = player.get_player_vehicle(pid)
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
						system.wait(2000)
						if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) and not Players[pid].isRC then
							if tracking.playerped_speed1[pid + 1] >= 21 then
								if Settings["GodCheckNotif"] and not Players[pid].isgod then
									Entity = "Player God mode"
									Players[pid].isgod = true
									moist_notify(Entity .. "\n" .. pid .. " : " .. (Playerz[pid+1]), "God Mode Player Detected")
									ModderAudio_notify_thread["on"] = true
								end
							end
						end
						plyveh = player.get_player_vehicle(pid)
						if plyveh == nil or plyveh == 0 then return end
						if Players[pid].isint then return end
						elseif player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
						if tracking.playerped_speed1[pid + 1] >= 21 then
							system.wait(2000)
							if player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and tracking.playerped_speed1[pid + 1] >= 21 then
								if Settings["GodCheckNotif"] and not Players[pid].isvgod then
									Entity = "Player Vehicle God mode"
									Players[pid].isvgod = true
									moist_notify(Entity .. "\n" .. pid .. " : " .. (Playerz[pid+1]), "Player Vehicle God Mode Detected")
									ModderAudio_notify_thread["on"] = true
								end
							end
						end
					end
				end
			end
		end
		system.wait(2)
	end
	system.wait(2)
end
--INFO: God Check v2
God_Check2_pid_thread = function(pid)
	local pped, plyveh, name
	while true do
		if player.is_player_valid(pid) --[[and player.player_id() ~= pid]]  then
			if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not Players[pid].isRC then
				name = player.get_player_name(pid)
				system.wait(200)
				local Entity = ""
				pped = player.get_player_ped(pid)
				local pos = v3()
				plyveh = player.get_player_vehicle(pid)
				if not Players[pid].isint then
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
						system.wait(8000)
						if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) and not Players[pid].isRC then
							system.wait(8000)
							if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) and not Players[pid].isRC then
								Players[pid].PlayerGodMode = true
								if Settings["GodCheckNotif"] and not Players[pid].isgod then
									Entity = "Player God mode"
									Players[pid].isgod = true
									moist_notify(Entity .. "\n" .. pid .. " : " .. name, "GodMode! Player Detected")
									ModderAudio_notify_thread["on"] = true
								end
							end
						end
						plyveh = player.get_player_vehicle(pid)
						if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
							system.wait(8000)
							if not Players[pid].isint and player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
								system.wait(2000)
								if not Players[pid].isint and player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and not Players[pid].isRC then
									Players[pid].PlayerVehGodMode = true
									if Settings["GodCheckNotif"] and not Players[pid].isvgod then
										Entity = "Player Vehicle God mode"
										Players[pid].isvgod = true
										moist_notify(Entity .. "\n" .. pid .. " : " .. name, "GodMode! Vehicle Detected")
										ModderAudio_notify_thread["on"] = true
									end
								end
							end
						end
						elseif not player.is_player_god(pid) or not player.is_player_vehicle_god(pid) then
						Players[pid].PlayerGodMode = false
						Players[pid].PlayerVehGodMode = false
					end
				end
				system.wait(2)
			end
			system.wait(2)
		end
		system.wait(2)
	end
end
--INFO: God Check v1
God_Check_pid_thread = function(pid)
    while true do
		local pped, plyveh, name
		pped = player.get_player_ped(pid)
		name = player.get_player_name(pid)
		plyveh = player.get_player_vehicle(pid)
		if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not entity.is_entity_dead(pped) then
			system.wait(8000)
			if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) then
				if ai.is_task_active(pped, 4) or  ai.is_task_active(pped, 290) or  ai.is_task_active(pped, 298) or  ai.is_task_active(pped, 422) then
					Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
					Players[pid].PlayerGodMode = player.is_player_god(pid)
					if Settings["GodCheckNotif"] and not Players[pid].isgod then
						Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
						Players[pid].PlayerGodMode = player.is_player_god(pid)
						Players[pid].isgod = true
						moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "God Mode Player Detected\nModder Task Checks")
						ModderAudio_notify_thread["on"] = true
					end
				end
				elseif not player.is_player_god(pid) and player.is_player_vehicle_god(pid) then
				if ai.is_task_active(pped, 200) or  ai.is_task_active(pped, 295) then
					if Settings["GodCheckNotif"] and not Players[pid].isvgod then
						Players[pid].PlayerVehGodMode = player.is_player_vehicle_god(pid)
						Players[pid].PlayerGodMode = player.is_player_god(pid)
						Players[pid].isvgod = true
						moist_notify(Entity .. "\n" .. pid .. " : " .. tostring(name), "Player Vehicle God Mode Detected\nModder Task Checks")
						ModderAudio_notify_thread["on"] = true
					end
				end
				elseif player.is_player_god(pid) and player.is_player_vehicle_god(pid) then
				if ai.is_task_active(pped, 4) or  ai.is_task_active(pped, 290) or  ai.is_task_active(pped, 298) or  ai.is_task_active(pped, 422) or ai.is_task_active(pped, 200) or  ai.is_task_active(pped, 295) then
					if Settings["GodCheckNotif"] and not Players[pid].isgod or not Players[pid].isvgod then
						moist_notify(pid .. " : " .. tostring(name) .. "\nPlayer God = " .. tostring(player.is_player_god(pid)) .. "\nVehicle God = " .. tostring(player.is_player_vehicle_god(pid)), "God Mod Detected\nModder Task Checks")
					end
				end
			end
			elseif player.is_player_god(pid) or player.is_player_vehicle_god(pid) and  entity.is_entity_dead(pped) then
			Players[pid].PlayerGodMode = false
			Players[pid].PlayerVehGodMode = false
		end
        system.wait(200)
	end
    system.wait(20)
end
function God_Check_pid(pid)
	if not Settings["GodCheck"] then return end
	God_thread[pid] = {}
	local player_id = pid
	if Settings["GodCheckVer"] == 1 then
		God_thread[pid] = menu.create_thread(GodCheck_pid_thread, pid)
		God_thread[pid+32] = menu.create_thread(God_Check_pid_thread, pid)
		elseif Settings["GodCheckVer"] == 2 then
		God_thread[pid] = menu.create_thread(God_Check2_pid_thread, pid)
	end
end
function God_Check1_pid(pid)
	if not Settings["GodCheck"] then return end
	God_thread1[pid] = {}
	local player_id = pid
	God_thread1[pid] = menu.create_thread(God_Check1_pid_thread, pid)
end
--TODO: Combi kick
function CombiKick(pid)
	local Kick_Flags = Get_ModderFlag_Text(pid)
	for y = 1, #Recent_Players do
		if Recent_Players[y].rid == player.get_player_scid(pid) then
			if not Players[pid].isFriend then
				Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
				local token = tostring(player.get_player_host_token(pid))
				Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
				Recent_Players[y].WasKicked = true
			end
		end
	end
	if network.network_is_host() then
		network.network_session_kick_player(pid)
		elseif not network.network_is_host() then
		Debug_Out("[Modder Removed]: " .. tostring(player.get_player_name(pid)).. " | " .. Kick_Flags .. " | Flags Match Kick Flags |  ")
		Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
		Trigger_Event(0x9C050EC, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x39624029, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0xAD63290E, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x7DE8CAC0, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x285DDF33, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x39624029, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0xAD63290E, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x7DE8CAC0, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x285DDF33, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		moist_notify("[Modder Removed]: " .. tostring(player.get_player_name(pid)).. "\n" .. Kick_Flags .. "\n| Flags Match Kick Flags |  ")
		network.force_remove_player(pid)
	end
end
function FlagRemove(pid)
	player.unset_player_as_modder(pid, Settings["RemoveModFlag"])
	if not Players[pid].IsFlagRemNotif then
		moist_notify("Removed Flag from: " .. tostring(player.get_player_name(pid)), "Moist Automated\nModder Flag Removal")
		Players[pid].IsFlagRemNotif = true
	end
end
--INFO: Player Feature Parents
PlayerFeatParent = menu.add_player_feature("Moists Script 2.0.6.8", "parent", 0).id
spawn_parent = menu.add_player_feature("Spawn Options", "parent", PlayerFeatParent).id
Player_Tools = menu.add_player_feature("Player Tools", "parent", PlayerFeatParent).id
BountyId = menu.add_player_feature("Bounty Options", "parent", PlayerFeatParent,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	return HANDLER_POP
end)
for i=0,#BountyId.feats do
	BountyId.feats[i]["hidden"] = NewDLC()
end
playerfeatVars.fm = menu.add_player_feature("Force Player to Mission", "parent", PlayerFeatParent)
for i=0,#playerfeatVars.fm.feats do
	playerfeatVars.fm.feats[i]["hidden"] = NewDLC()
end
playerfeatVars.Annoy = menu.add_player_feature("Annoy The Cunt!", "parent", PlayerFeatParent).id
--INFO: Chat Spam
playerfeatVars.spam_sms = menu.add_player_feature("SMS Spam", "parent", PlayerFeatParent).id
playerfeatVars.Preset_sms = menu.add_player_feature("SMS Spam Presets", "parent", playerfeatVars.spam_sms).id
playerfeatVars.Preset_RUS = menu.add_player_feature("Russian Spam Presets", "parent", playerfeatVars.Preset_sms).id
local function SpamByFile()
	local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
	local loaded_text, Feats, Spam_Modifier = {}, {}, 1
	utils.make_dir(rootPath  .. "\\Chat_Textfiles")
	local parent1 = menu.add_feature("ChatSpam From File", "parent", globalFeatures.Moist_Spam)
	local text_file = menu.add_feature("Load Text file: ", "parent", parent1.id)
	menu.add_feature("Reload File List", "action", text_file.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if #Feats ~= nil then
			for i = 1, #Feats do
				menu.delete_feature(Feats[i].id)
			end
		end
		Feats = {}
		list_File_load_Text()
	end)
	local spam_modifier = menu.add_feature("Modifier Value", "autoaction_value_i", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		update_mod_value(feat.value)
		menu.notify("Spam by Line Slider will now:\nIncrement by: " .. feat.value .."\nEach step", "Moists ChatSpam By File", 5, 0xffffff00)
	end)
	spam_modifier["max"] = 200
	spam_modifier["min"] = 1
	spam_modifier["value"] = 1
	Spam_type_set = " "
	typeset = "Spam File "
	spam_type = menu.add_feature("Spam Type: ", "autoaction_value_str", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local notifyvalue = {}
		notifyvalue = spam_type:get_str_data()
		menu.notify("Spam Type Set:\n" .. notifyvalue[feat.value+1], "Moists ChatSpam By File", 5, 0xffffff00)
		if feat.value == 0 then Spam_type_set = "SpamFile on " elseif feat.value == 1 then Spam_type_set = "Spam2End " end
		spambyline.name = tostring(Spam_type_set .. notifyvalue[feat.value+1])
	end)
	spam_type:set_str_data({"Loop", "Once"})
	spam_type["value"] = 0
	menu.add_feature("Copy2 Clipboard Line Spam below: ", "action", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if #loaded_text == nil then return end
		utils.to_clipboard(loaded_text[spam_byline.value])
		ui.notify_above_map(loaded_text[spam_byline.value], "", 15) 
	end)
	spam_byline = menu.add_feature("1 Shot Spam Line: " .. typeset, "action_value_i", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if #loaded_text == nil then return end
		network.send_chat_message(loaded_text[feat.value], Public_Chat)
	end)
	spam_byline["max"] = 1
	spam_byline["min"] = 1
	spam_byline["value"] = 1
	line_multiplier = menu.add_feature("Multi Line Count:  " .. typeset, "action_value_i", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		moist_notify("Spam: ".. tostring(feat.value) .. "Lines in one", "")
	end)
	line_multiplier["max"] = 50
	line_multiplier["min"] = 1
	line_multiplier["value"] = 1
	spam_Multiline = menu.add_feature("Spam Multi Lines: " .. typeset, "action_value_i", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local texttosend = "\n"
		local amount = line_multiplier.value
		local y = feat.value
		if #loaded_text == nil then return end
		for i = 1, amount do
			y = y + 1
			if y ~= (#loaded_text) then
				if loaded_text[y] == nil then return end
				texttosend = texttosend .. "\n" .. loaded_text[y]
			end
		end
		network.send_chat_message(texttosend, Public_Chat)
	end)
	spam_Multiline["max"] = 1
	spam_Multiline["min"] = 1
	spam_Multiline["value"] = 1
	spambyline = menu.add_feature(typeset, "slider", parent1.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if #loaded_text == nil then return end
			for i = 1, #loaded_text do
				network.send_chat_message(loaded_text[i], Public_Chat)
				system.yield(math.ceil(feat.value))
				if not feat["on"] then break end
				if spam_type.value == 1 and i == #loaded_text  then 
					feat["on"] = false
				break end
			end
			return HANDLER_CONTINUE
		end
	end)
	spambyline["on"] = false
	spambyline["max"] = 2000.00
	spambyline["min"] = 0.0
	spambyline["mod"] = 50.0
	function list_File_load_Text()
		local text_dir = rootPath .. "\\Chat_Textfiles\\"
		local files = utils.get_all_files_in_directory(text_dir, "txt")
		for i = 1, #files do
			local feat = "filesID" .. i
			Feats[#Feats+1] = menu.add_feature(files[i], "action_value_str", text_file.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				local spamon
				if spambyline["on"] then
					spamon = true
					spambyline["on"] = false
					system.wait(0)
				end
				if feat.value == 0 then
					loaded_text = {}
					menu.notify("Clearing Loaded Text and Loading: " .. files[i] .. "\nFresh Text Loaded",  "Moists ChatSpam By File", 5, 0xffffff00)
					elseif feat.value == 1 then
					menu.notify("Appending: " .. files[i] .. "\nText to currently loaded",  "Moists ChatSpam By File", 5, 0xffffff00)
				end
				if utils.file_exists(text_dir .. files[i]) then
					for line in io.lines(text_dir .. files[i]) do
						loaded_text[#loaded_text + 1] = line
						system.wait(0)
					end
					spam_byline["max"] = #loaded_text
					spam_Multiline["max"] = #loaded_text
				end
				if spamon == true then
					spambyline["on"] = true
					spamon = nil
				end
			end)
			Feats[#Feats]:set_str_data({"Load Fresh", "Append to Current"})
		end
	end
	list_File_load_Text()
	update_mod_value = function(value)
		spambyline["mod"] = value
	end
end
SpamByFile()
function load_SpamData()
	if utils.file_exists(Paths.Spamtxt_Data) then
		for line in io.lines(Paths.Spamtxt_Data) do
			spam_presets[#spam_presets + 1] = {line:sub(1,12),line}
		end
		else
		local file = io.open(Paths.Cfg  .. "\\Moists_Spamset.ini", "w+")
		system.wait(1)
		io.output(file)
		io.write("")
		io.close()
	end
end
load_SpamData()
function Chat_N_SMS_Spam()
for i = 1, #russian_spam do
ScriptLocals["RUSPAM"][i] = menu.add_player_feature("sms: " .. russian_spam[i][1], "toggle", playerfeatVars.Preset_RUS, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(russian_spam[i][2])
		player.send_player_sms(pid, text)
		return HANDLER_CONTINUE
	end
end)
end
for y =1, #ScriptLocals["RUSPAM"] do
for i=0,#ScriptLocals["RUSPAM"][y].feats do
	ScriptLocals["RUSPAM"][y].feats[i]["on"] = false
end
end
for i = 1, #russian_spam do
spammRU.var[i] =  menu.add_feature(i..": " .. russian_spam[i][1], "value_i", globalFeatures.Preset_RUS,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(russian_spam[i][2])
		network.send_chat_message(text, Public_Chat)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
spammRU.var[i]["max"] = 1000
spammRU.var[i]["min"] = 0
spammRU.var[i]["mod"] = Settings["spam_wait_Modifier"]
spammRU.var[i]["value"] = Settings["spam_wait"]
end
for i = 1, #spam_preset do
ScriptLocals["SMS_spam"][i] = menu.add_player_feature("sms: " .. spam_preset[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(spam_preset[i][2])
		player.send_player_sms(pid, text)
		return HANDLER_CONTINUE
	end
end)
end
for i = 1, #spam_preset do
spamPre.var[i] =  menu.add_feature(i..": " .. spam_preset[i][1], "value_i", globalFeatures.Preset_Chat,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(spam_preset[i][2])
		network.send_chat_message(text, Public_Chat)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
spamPre.var[i]["max"] = 1000
spamPre.var[i]["min"] = 0
spamPre.var[i]["mod"] = Settings["spam_wait_Modifier"]
spamPre.var[i]["value"] = Settings["spam_wait"]
end
for i = 1, #spam_presets do
ScriptLocals["SMS_spam"][i] = menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(spam_presets[i][2])
		player.send_player_sms(pid, text)
		return HANDLER_CONTINUE
	end
end)
end
for i = 1, #spam_presets do
local pfeat = string.format("preset" .. i)
pfeat = menu.add_feature(i..": ".. spam_presets[i][1], "parent", globalFeatures.custom_Chat)
pfeat["hidden"] = false
spamm.var[i] = menu.add_feature("Send Chat Spam", "value_i", pfeat.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text = tostring(spam_presets[i][2])
		network.send_chat_message(text, Public_Chat)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
spamm.var[i]["max"] = 1000
spamm.var[i]["min"] = 0
spamm.var[i]["mod"] = Settings["spam_wait_Modifier"]
spamm.var[i]["value"] = Settings["spam_wait"]
menu.add_feature("Delete Chat Spam", "action", pfeat.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	spam_presets[i][1] = nil
	spam_presets[i][2] = nil
	moist_notify("Remember to rewrite presets to Finalise Save & Delete\nThis can be Found in Spam Options", "Moists ChatSpam:\nPreset Deleted")
	pfeat["hidden"] = true
end)
end
for y =1, #ScriptLocals["RUSPAM"] do
for i=0,#ScriptLocals["RUSPAM"][y].feats do
	ScriptLocals["RUSPAM"][y].feats[i]["on"] = false
end
end
for y =1, #ScriptLocals["SMS_spam"] do
for i=0,#ScriptLocals["SMS_spam"][y].feats do
	ScriptLocals["SMS_spam"][y].feats[i]["on"] = false
end
end
end
Chat_N_SMS_Spam()
notxtspam = menu.add_feature("no text spam", "toggle", globalFeatures.Moist_Spam,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if feat["on"] then
network.send_chat_message(" ", false)
return HANDLER_CONTINUE
end
return HANDLER_POP
end)
notxtspam["on"] = false
menu.add_feature("3-2-1-GO", "action", globalFeatures.Moist_Spam,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local count = 4
for i = 0, 3 do
count = count - 1
if count == 0 then count = "GO" end
network.send_chat_message(count, false)
system.yield(1000)
end
return HANDLER_POP
end)
chatclipboard = menu.add_feature("Send Clipboard Contents", "action_value_str", globalFeatures.Moist_Spam,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if feat.value == 0 then
local text = tostring(utils.from_clipboard())
network.send_chat_message(text, false)
elseif feat.value == 1 then
local text = tostring(utils.from_clipboard())
network.send_chat_message(text, true)
end
return HANDLER_POP
end)
chatclipboard:set_str_data({"Public Chat", "Team Chat"})
menu.add_feature("String Char randomised spam", "toggle", globalFeatures.Moist_Spam,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if feat["on"] then
local a, b, c
a = math.random(1, 254)
local a1 = math.random(1, 254)
local text = string.char(a, 255, 255) .." " .. string.char(a, a1, 255) .." " ..  string.char(a, a1, a1)
network.send_chat_message(text, false)
return HANDLER_CONTINUE
end
return HANDLER_POP
end)
menu.add_feature("String Char randomised delayspam", "toggle", globalFeatures.Moist_Spam,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if feat["on"] then
local a, b, c
a = math.random(1, 254)
local a1 = math.random(1, 254)
local text = string.char(a, 255, 255) .." " .. string.char(a, a1, 255) .." " ..  string.char(a, a1, a1)
network.send_chat_message(text, false)
system.wait(100)
return HANDLER_CONTINUE
end
return HANDLER_POP
end)
spam_delay_modifier = menu.add_feature("Set Step Modifier: ", "action_value_i", globalFeatures.Spam_Options,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
Settings["spam_wait_Modifier"] = feat.value
spam_delay["mod"] = feat.value
for i = 1, #spammRU.var do
spammRU.var[i]["mod"] = feat.value
end
for i = 1, #spamm.var do
spamm.var[i]["mod"] = feat.value
end
for i = 1, #spamPre.var do
spamPre.var[i]["mod"] = feat.value
end
end)
spam_delay_modifier["max"] = 100
spam_delay_modifier["min"] = 1
spam_delay_modifier["value"] = Settings["spam_wait_Modifier"]
spam_delay_modifier["mod"] = 1
spam_delay = menu.add_feature("Update all Delay's|ms:", "action_value_i", globalFeatures.Spam_Options,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
Settings["spam_wait"] = feat.value
for i = 1, #spammRU.var do
spammRU.var[i]["value"] = feat.value
end
for i = 1, #spamm.var do
spamm.var[i]["value"] = feat.value
end
for i = 1, #spamPre.var do
spamPre.var[i]["value"] = feat.value
end
end)
spam_delay["max"] = 1000
spam_delay["min"] = 0
spam_delay["mod"] = Settings["spam_wait_Modifier"]
spam_delay["value"] = Settings["spam_wait"]
menu.add_feature("Add Custom Preset", "action", globalFeatures.Spam_Options,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local r,s = input.get("Input Spam Preset Text 96 characters max", "", 96, 0)
if r == 1 then
return HANDLER_CONTINUE
end
if r == 2 then
return HANDLER_POP
end
text = tostring(s .."\n")
system.wait(1)
local file = io.open(Paths.Cfg  .. "\\Moists_Spamset.ini", "a")
system.wait(1)
io.output(file)
io.write(text)
io.close()
spam_presets[#spam_presets + 1] = {text:sub(1,12),text}
local y = #spam_presets
for i = y, #spam_presets do
local pfeat = string.format("preset" .. i)
pfeat = menu.add_feature(i..": ".. spam_presets[i][1], "parent", globalFeatures.custom_Chat)
pfeat["hidden"] = false
spamm.var[i] = menu.add_feature("Send Chat Spam", "value_i", pfeat.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text= tostring(spam_presets[i][2])
		network.send_chat_message(text, false)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
spamm.var[i]["max"] = 1000
spamm.var[i]["min"] = 0
spamm.var[i]["mod"] = Settings["spam_wait_Modifier"]
spamm.var[i]["value"] = Settings["spam_wait"]
menu.add_feature("Delete Chat Spam", "action", pfeat.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	spam_presets[i][1] = nil
	spam_presets[i][2] = nil
	moist_notify("Remember to rewrite presets to Finalise Save & Delete\nThis can be Found in Spam Options", "Moists ChatSpam:\nPreset Deleted")
	pfeat["hidden"] = true
end)
local plyfeat = string.format("preset" .. i)
plyfeat = menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		text= tostring(spam_presets[i][2])
		player.send_player_sms(pid, text)
		return HANDLER_CONTINUE
	end
end)
for i=0,#plyfeat.feats do
	plyfeat.feats[i]["on"] = false
end
end
end)
spam_cus_long = menu.add_feature("Rewrite Preset file", "action", globalFeatures.Spam_Options,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local file = io.open(Paths.Cfg  .. "\\Moists_Spamset.ini", "w+")
system.wait(1)
io.output(file)
file:write("")
io.close()
local File = io.open(Paths.Cfg  .. "\\Moists_Spamset.ini", "a")
io.output(File)
for i = 1, #spam_presets do
if spam_presets[i][1] or spam_presets[i][2] ~= "nil" then
	File:write(tostring(spam_presets[i][2]) .. "\n")
end
io.flush()
end
File:close()
moist_notify("Custom Spam Presets Re-Written To File", "MoistScript Chatspam\nFile Updated")
end)
load_SpamData()
--INFO: Custom Teleport System
function Self_Teleport()
tele_presets = {}
function SaveTeleports()
local pos = v3()
local val, value
local file = io.open(Paths.Teleport_Data, "w+")
for k,v in pairs(tele_presets) do
	file:write(tostring(k) .."=" .. tostring(v.x) ..", " .. tostring(v.y) ..", " .. tostring(v.z) .."\n")
end
file:close()
end
function Remove_Teleport(key)
local file = io.open(Paths.Teleport_Data, "w+")
for k,v in pairs(tele_presets) do
	if key ~= k then
		file:write(tostring(k) .."=" .. tostring(v.x) ..", " .. tostring(v.y) ..", " .. tostring(v.z) .."\n")
	end
end
file:close()
end
SaveTeleport_Hotkey = menu.add_feature("Save Location HotKey", "toggle", globalFeatures.moist_hotkeys,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if not feat["on"] then
	return HANDLER_POP
end
local key = MenuKey()
local r,s
key:push_str("LCONTROL")
key:push_str("LSHIFT")
key:push_str("t")
if key:is_down() then
	r,s = input.get("Input Teleport Preset Name", "", 96, 0)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		return HANDLER_POP
		elseif r == 0 then
		Save_Preset(s)
	end
end
return HANDLER_CONTINUE
end)
SaveTeleport_Hotkey["on"] = true
function Save_Preset(name)
plypos = player.get_player_coords(player.player_id())
tele_presets[tostring(name)] = plypos
SaveTeleports()
Teleport_Features[tostring(name)] = menu.add_feature(tostring(name), "action_value_str", globalFeatures.self_Tele,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	pos = v3()
	presetid = tostring(name)
	pos = tele_presets[presetid]
	if feat.value == 0 then
		if player.is_player_in_any_vehicle(player.player_id()) then
			plyveh = player.get_player_vehicle(player.player_id())
			network.request_control_of_entity(plyveh)
			pos.x = pos.x + 2.50
			entity.set_entity_coords_no_offset(plyveh, pos)
			vehicle.set_vehicle_on_ground_properly(plyveh)
			elseif not player.is_player_in_any_vehicle(player.player_id()) then
			pped = player.get_player_ped(player.player_id())
			pos.x = pos.x + 1.00
			entity.set_entity_coords_no_offset(pped, pos)
		end
		elseif feat.value == 1 then
		Remove_Teleport(name)
		Teleport_Features[tostring(name)]["hidden"] = true
	end
end)
Teleport_Features[tostring(name)]:set_str_data({"Teleport", "Delete"})
SaveTeleports()
moist_notify("Current Teleport Saved!")
end
function Translate_V3(text)
for x, y, z in string.gmatch(text, "([%d.-]+), ([%d.-]+), ([%d.-]+)") do
	local x,y,z = tonumber(x), tonumber(y), tonumber(z)
	return x, y, z
end
end
function load_TelePresets()
if utils.file_exists(Paths.Teleport_Data) then
	for line in io.lines(Paths.Teleport_Data) do
		local separator = line:find("=", 1, true)
		if separator then
			local key = line:sub(1, separator - 1)
			local value = line:sub(separator + 1)
			pos = v3()
			pos.x, pos.y, pos.z = Translate_V3(value)
			--pos.x, pos.y, pos.z = Translate_V3(value)
			tele_presets[key] = pos
		end
	end
	else
	local file = io.open(Paths.Teleport_Data, "w+")
	system.wait(1)
	io.output(file)
	io.write("")
	io.close()
end
end
load_TelePresets()
function Build_Teleports()
for k,v in pairs(tele_presets) do
	Teleport_Features[tostring(k)] = menu.add_feature(tostring(k), "action_value_str", globalFeatures.self_Tele,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pos = v3()
		presetid = tostring(k)
		pos = tele_presets[presetid]
		if feat.value == 0 then
			if player.is_player_in_any_vehicle(player.player_id()) then
				plyveh = player.get_player_vehicle(player.player_id())
				network.request_control_of_entity(plyveh)
				pos.x = pos.x + 2.50
				entity.set_entity_coords_no_offset(plyveh, pos)
				vehicle.set_vehicle_on_ground_properly(plyveh)
				elseif not player.is_player_in_any_vehicle(player.player_id()) then
				pped = player.get_player_ped(player.player_id())
				pos.x = pos.x + 1.00
				entity.set_entity_coords_no_offset(pped, pos)
			end
			elseif feat.value == 1 then
			Remove_Teleport(tostring(k))
			Teleport_Features[tostring(k)]["hidden"] = true
		end
	end)
	Teleport_Features[tostring(k)]:set_str_data({"Teleport", "Delete"})
end
end
Build_Teleports()
end
Self_Teleport()
--INFO: Script Loader
function scriptloader()
ScriptFiles = {}
ScriptFolders = {}
ScriptFeat = {}
loadedScripts = {}
local scriptload = Paths.Cfg .. "\\scriptloader.ini"
if not utils.file_exists(scriptload) then
io.open(scriptload, "w+")
io.output(scriptload)
io.write("")
io.close()
end
saveloaded = menu.add_feature("Save Loaded Scripts", "action_value_str", globalFeatures.Script_loader,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat.value == 0 then
	io.open(scriptload, "w+")
	io.output(scriptload)
	for i = 1, #loadedScripts do
		io.write(loadedScripts[i] .. "\n")
	end
	io.close()
	elseif feat.value == 1 then
	io.open(scriptload, "w+")
	io.output(scriptload)
	io.write("")
	io.close()
end
end)
saveloaded:set_str_data({"Save Loaded", "Clear Saved"})
saveloaded["value"] = 1
refreshfolders = menu.add_feature("Refresh: ", "action_value_str", globalFeatures.Script_loader,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
for i =1,#ScriptFeat do
	menu.delete_feature(ScriptFeat[i].id)
end
ScriptFeat = {}
GetScripts(refreshfolders:get_str_data()[refreshfolders.value + 1])
system.wait(10)
scriptFeatBuilder()
end)
refreshfolders:set_str_data({"scripts"})
function GetScripts(folder)
local scriptfolder = folder
local files = {}
ScriptFiles = {}
files1 = utils.get_all_files_in_directory(Paths.Root .. "\\" .. scriptfolder .. "\\", "lua")
files2 = utils.get_all_files_in_directory(Paths.Root .. "\\" .. scriptfolder .. "\\", "luac")
files = merge(files1, files2)
for i = 1, #files do
	local y = #ScriptFiles + 1
	test = string.lower(files[i])
	if test:find("autoexec.lua") or test:find("moists_modder_module.lua") then
		i = i - 1
	end
	ScriptFiles[y] = files[i]
end
end	
GetScripts("scripts")
function GetScriptFolders()
local foldersbuilt = {} 
foldersbuilt[#foldersbuilt + 1] = "scripts"
ScriptFolders[#ScriptFolders + 1] = "scripts"
local folders = utils.get_all_sub_directories_in_directory(Paths.Root .. "\\scripts\\")
for i =1, #folders do
	foldersbuilt[#foldersbuilt+1] = "scripts\\" .. folders[i]
	ScriptFolders[#ScriptFolders + 1] =  "scripts\\" .. folders[i]
end
refreshfolders:set_str_data(foldersbuilt)
end
GetScriptFolders()
function scriptFeatBuilder()
for i = 1, #ScriptFiles do
	local feat_name, featname, funcname
	feat_name = tostring(ScriptFiles[i])
	featname = {feat_name:sub(1, 6), feat_name}
	ScriptFeat[i] = menu.add_feature(ScriptFiles[i], "action", globalFeatures.Script_loader,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		funcname = featname
		local status, err = pcall(LoadScript, refreshfolders:get_str_data()[refreshfolders.value + 1], ScriptFiles[i], ScriptFeat[i])
		Print(tostring(status) .. "Error Loading Script" .. tostring(ScriptFiles[i]) .. "\\" .. tostring(ScriptFiles[i]) .. tostring(ScriptFeat[i]) .. "\n" .. tostring(err))
	end)
	if string.lower(ScriptFiles[i]) ~= "autoexec.lua" or string.lower(ScriptFiles[i]) ~= "moists_modder_module.lua" then
		ScriptFeat[i]["hidden"] = false
		else
		ScriptFeat[i]["hidden"] = true
	end
end
end
scriptFeatBuilder()
function LoadScript(scriptfolder, scriptname, feature)
local folder = scriptfolder or "\\scripts"
local file = Paths.Root .. "\\" .. folder .. "\\" .. scriptname
loadedScripts[#loadedScripts + 1] = scriptname
local a = assert(loadfile(file))
feature["hidden"] = true
return a()
end
for line in io.lines(scriptload) do
loadedScripts[#loadedScripts + 1] = line
for i = 1, #ScriptFolders do
	local file = Paths.Root .. "\\" .. ScriptFolders[i] .."\\" .. line
	if utils.file_exists(file) then
		local chunk, status = assert(loadfile(file))
		if chunk then
			chunk()
			else
			local errtext1 = debug.traceback(chunk, 1)
			local errtext2 = debug.traceback(chunk, 2)
			Debug_Out(errtext1 .. "\n" .. errtext2)
			chunk()
		end
	end
end
end
KickFlagSetup()
RemoveFlagSetup()
end



--INFO: Recent Player Features

function recentplayerslist()
RecentPlayers_Feat, blacklistpid, Kickedstate = {}, {}, {}
Recent_Players = {}
RecentPlayers = {}
TempBlacklist = {}
RecentPlayer = {}

Join_Event_Check = event.add_event_listener("player_join", function(e)
if type(e) == number then
	return HANDLER_POP
end
	playerRDB(e.player)
	TempBlacklistCheck(e.player)

return
end)
function TempBlacklistCheck(pid)
local scid, name, decip
scid = player.get_player_scid(pid)
name = player.get_player_name(pid)
decip = player.get_player_ip(pid)
local TransIP = dec2ip(decip)
local PartIP = Get_Partial_IP(TransIP)
for i = 1, #TempBlacklist do
	if TempBlacklist[i].name == name and TempBlacklist[i].nameON == true then
		TempBlacklist_Kick(pid)
		elseif TempBlacklist[i].scid == scid and TempBlacklist[i].scidON == true then
		TempBlacklist_Kick(pid)
		elseif TempBlacklist[i].decip == decip and TempBlacklist[i].decipON == true then
		TempBlacklist_Kick(pid)
		elseif TempBlacklist[i].decip2 == PartIP and TempBlacklist[i].decip2ON == true then
		TempBlacklist_Kick(pid)
	end
end
end
function TempBlacklist_Kick(pid)
if pid == player.player_id() then
	return
end
for y = 1, #Recent_Players do
	if Recent_Players[y].rid == player.get_player_scid(pid) then
		if not Players[pid].isFriend then
			Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
			local token = tostring(player.get_player_host_token(pid))
			Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
			Recent_Players[y].WasKicked = true
			
			
		end
		
	end
end
if network.network_is_host() then
	Trigger_Event(0x493FC6BB, pid, {pid, script.get_global_i(1893551 + (1 + (pid * 599)) + 510)})
	Trigger_Event(0x9C050EC, pid, {pid, script.get_global_i(1893551 + (1 + (pid * 599)) + 510)})
	network.network_session_kick_player(pid)
	
	elseif not network.network_is_host() then
	Trigger_Event(0x493FC6BB, pid, {pid, script.get_global_i(1893551 + (1 + (pid * 599)) + 510)})
	Trigger_Event(0x9C050EC, pid, {pid, script.get_global_i(1893551 + (1 + (pid * 599)) + 510)})
	network.force_remove_player(pid)
end
end

function playerRDB(pid)
local scid, playername, token, tokeen, count, PlyIP, Part_IP
PlyIP = player.get_player_ip(pid)
local TranIP = dec2ip(PlyIP)
Part_IP = Get_Partial_IP(TranIP)
scid = player.get_player_scid(pid)
if scid ~= -1 then
	playername = player.get_player_name(pid) or "NaN"
	count = -1
	token = player.get_player_host_token(pid)
	tokhex = string.format("%x", token)
	tokeen = tostring(tokhex)
	for y = 1, #Recent_Players do
		if Recent_Players[y].rid == scid then
			count = Recent_Players[y].count + 1
			Recent_Players[y].count = count
			if count > 1 and Settings["RecentPlayer_Notify"] then
				moist_notify("Recently Seen Player:\n" .. tostring(playername) .. "\nSCID: " .. scid .. "\nSeen: " .. count .. " times\nPreviously Kicked: " .. tostring(Recent_Players[y].WasKicked), "Recently Seen Player Joined")
			end
			if Recent_Players[y].WasKicked and Settings["KickJoiningKickedPlayers"] then
				TempBlacklist_Kick(pid)
			end
			return
		end
	end
	local i = #Recent_Players + 1
	Recent_Players[i] = {
		Feature = {},
		name = {},
		count = {},
		DateLJ = {},
		rid = {},
		nid = {},
		htoken = {},
		DecIP = {},
		PartIP = {},
		WasKicked = {},
	}
	
	RecentPlayer[i] = {
		Features = {},
		Blacklist1 = {},
		Blacklist2 = {},
		Blacklist3 = {},
	}
	TempBlacklist[i] = {
		name = {},
		scid = {},
		decip = {},
		decip2 = {},
		nameON = {},
		scidON = {},
		decipON = {},
		decip2ON = {},
	}
	
	Kickedstate[i] = {}
	Recent_Players[i].name = player.get_player_name(pid)
	Recent_Players[i].count = count + 1
	Recent_Players[i].rid = scid
	Recent_Players[i].DateLJ = os.date("%d-%m-%y")
	Recent_Players[i].DecIP = PlyIP
	Recent_Players[i].PartIP = Part_IP
	Recent_Players[i].nid = network.network_hash_from_player(pid)
	Recent_Players[i].htoken = tokeen
	TempBlacklist[i].nameON = false
	TempBlacklist[i].scidON = false
	TempBlacklist[i].nameON = false
	TempBlacklist[i].decipON = false
	Recent_Players[i].WasKicked = false
	TempBlacklist[i].name = playername
	TempBlacklist[i].scid = scid
	TempBlacklist[i].decip = PlyIP
	TempBlacklist[i].decip2 = Part_IP
	Recent_Player(i)
	count = 0
end
end
PNum = 0

local currentsearch = ""
function Search_Recent(RecentName, stype)
local FeatureName
if stype == "ip" then
	for i =1, #Recent_Players do
		local TranIP = dec2ip(Recent_Players[i].DecIP)
		if TranIP:find(RecentName, 1, true) then
			Recent_Players[i].Feature.hidden = false
			else
			Recent_Players[i].Feature.hidden = true
		end
	end
	elseif stype == "name" then
	if RecentName ~= nil then
		for i=1,#Recent_Players do
			if RecentName:len() == 0 then
				Recent_Players[i].Feature.hidden = false
				currentsearch = ""
			end
			RecentID = Recent_Players[i].name	
			FeatureName = tostring(RecentID)
			if FeatureName:find(RecentName, 1, true) then
				Recent_Players[i].Feature.hidden = false
				else
				Recent_Players[i].Feature.hidden = true
			end
			if FeatureName:lower():find(RecentName:lower(), 1, true) then
				Recent_Players[i].Feature.hidden = false
				else
				Recent_Players[i].Feature.hidden = true
			end
			
			
		end
		
	end
	
	elseif stype == "waskicked" then
	if RecentName == "true" then
		RecentName = true
		
		for i =1, #Recent_Players do
			if Recent_Players[i].WasKicked then
				Recent_Players[i].Feature.hidden = false
				else
				Recent_Players[i].Feature.hidden = true
			end
		end
	end
end
end



recentopt = menu.add_feature("Recent Player Options", "parent", Recent)



searchtype = menu.add_feature("Search for Recent Player", "action_value_str", Recent, function(feat)
local r, RecentName
if feat.value == 0 then
	r, RecentName = input.get("Enter a Name To Search for", currentsearch, 64, 0)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		currentsearch = ""
		for i=1,#Recent_Players do
			Recent_Players[i].Feature.hidden = false
		end
		return HANDLER_POP
	end
	currentsearch = RecentName
	Search_Recent(RecentName, "name")
	elseif feat.value == 1 then
	r, RecentName = input.get("Enter Partial IP to Find", "", 64, 4)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		currentsearch = ""
		for i=1,#Recent_Players do
			Recent_Players[i].Feature.hidden = false
		end
		return HANDLER_POP
	end
	currentsearch = RecentName
	Search_Recent(RecentName, "ip")
	elseif feat.value == 2 then
	r, RecentName = input.get("True to show kicked", "true", 5, 0)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		currentsearch = ""
		for i=1,#Recent_Players do
			Recent_Players[i].Feature.hidden = false
		end
		return HANDLER_POP
	end
	currentsearch = RecentName
	Search_Recent(RecentName, "waskicked")
end

return HANDLER_POP
end)
searchtype:set_str_data({"By Name","By IP","Kicked State"})

function player_Load(array)

for y = 1, #Recent_Players do
	if (Recent_Players[y].rid) == (array.rid) then
		return
	end
end


local i = #Recent_Players + 1
Recent_Players[i] = {
	Feature = {},
	name = {},
	count = {},
	DateLJ = {},
	rid = {},
	nid = {},
	htoken = {},
	DecIP = {},
	PartIP = {},
	WasKicked = {},
}
RecentPlayer[i] = {
	Features = {},
	Blacklist1 = {},
	Blacklist2 = {},
	Blacklist3 = {},
}
TempBlacklist[i] = {
	name = {},
	scid = {},
	decip = {},
	decip2 = {},
	nameON = {},
	scidON = {},
	decipON = {},
	decip2ON = {},
}
Kickedstate[i] = {}

Recent_Players[i].name = array.name
Recent_Players[i].count = tonumber(array.count)
Recent_Players[i].rid = tonumber(array.rid)
Recent_Players[i].DateLJ = array.DateLJ
Recent_Players[i].DecIP = tonumber(array.DecIP)
Recent_Players[i].PartIP = array.PartIP
Recent_Players[i].nid = tonumber(array.nid)
Recent_Players[i].htoken = array.htoken
Recent_Players[i].WasKicked = false
RecentPlayer[i].Features = {}	
TempBlacklist[i].nameON = false
TempBlacklist[i].sciON = false
TempBlacklist[i].nameON = false
TempBlacklist[i].decipON = false
TempBlacklist[i].name = array.name
TempBlacklist[i].scid = tonumber(array.rid)
TempBlacklist[i].decip = tonumber(array.DECIP)
TempBlacklist[i].decip2 = array.PartIP
Recent_Player(i)


end


function Load_Recent_File()

local filedate = os.date("%d-%m-%y")
if utils.file_exists(Paths.Logs .. "\\Recent_Players(".. filedate .. ").txt") then
	
	RecentPlyrs = table.load(Paths.Logs .. "\\Recent_Players(".. filedate .. ").txt")
	for y = 1, #RecentPlyrs do
		player_Load(RecentPlyrs[y])
		
	end
end
end

function tablesave()
datdy = os.date("%d-%m-%y")
table.save(Recent_Players, Paths.Logs .. "\\Recent_Players(" .. datdy .. ").txt")
end

SaverecInt = menu.add_feature("AutoSave Recent delay mins: ", "value_f", recentopt.id, function(feat)
if not feat.on then
	Settings["AutoSaveRecentFile"] = false
	Settings["AutoSaveRecentTime"] = feat.value
	return HANDLER_POP
end
Settings["AutoSaveRecentFile"] = true
Settings["AutoSaveRecentTime"] = feat.value
local delay =  tonumber((feat.value) * (60000))

system.yield(delay)
tablesave()
system.yield(1000)
return HANDLER_CONTINUE
end)
SaverecInt.on = Settings["AutoSaveRecentFile"]
SaverecInt.min = 00.01
SaverecInt.max = 30.00
SaverecInt.mod = 00.01
SaverecInt.value = Settings["AutoSaveRecentTime"]

RecentFileLoaded = false
Loadrec = menu.add_feature("AutoLoad Saved Recent Players", "toggle", recentopt.id, function(feat)
if not feat.on then
	Settings["LoadRecentPlayersFile"] = false
	RecentFileLoaded = false
	return HANDLER_POP
end
Settings["LoadRecentPlayersFile"] = true
if not RecentFileLoaded then
	Load_Recent_File()
	RecentFileLoaded = true
end
system.yield(100)
return HANDLER_CONTINUE
end)
Loadrec.on = Settings["LoadRecentPlayersFile"]

AutoRecentLimit = menu.add_feature("(-100)Auto Limit value: ", "value_i", recentopt.id, function(feat)
local limit, Compact_Table = tonumber(feat.value), {}
if not feat.on then
	Settings["AutoLimitRecent"] = false
	Settings["AutoLimitCount"] = tonumber(feat.value)
	return HANDLER_POP
end
Settings["AutoLimitRecent"] = true
Settings["AutoLimitCount"] = tonumber(feat.value)
if #Recent_Players > tonumber(feat.value) then
	for i = 1, #Recent_Players do
		for y = Recent_Players[i].Feature.child_count, 1, -1 do
			local f = Recent_Players[i].Feature.children[y]
			if f.type == 1 << 11 then
				for t = f.child_count, 1, -1 do
					local e = f.children[t]
					menu.delete_feature(e.id)
				end
			end
			menu.delete_feature(f.id)
			
			system.yield(1)
		end
		if Recent_Players[i].Feature.child_count ~= 0 then
			moist_notify(Recent_Players[i].Feature.child_count)
			elseif Recent_Players[i].Feature.child_count == 0 then
			local f = Recent_Players[i].Feature
			menu.delete_feature(f.id)
		end
		--system.yield(1)
	end
	
	Compact_Table = RecentPlayerTableRebuild(tonumber(feat.value - 100))
	Recent_Players = {}
	
	for y = 1, #Compact_Table do
		player_Load(Compact_Table[y])
		
	end
	
	
	system.yield(10000)
end

system.yield(10000)
return HANDLER_CONTINUE
end)
AutoRecentLimit.max = 600
AutoRecentLimit.min = 100
AutoRecentLimit.mod = 25
AutoRecentLimit.value = Settings["AutoLimitCount"]
AutoRecentLimit.on = Settings["AutoLimitRecent"]

ResetAllKicked = menu.add_feature("Reset All Kicked States", "action", recentopt.id, function(feat)

for i = 1, #Recent_Players do
	if Recent_Players[i].WasKicked then
		Recent_Players[i].WasKicked = false
		if Kicked_Players[Recent_Players[i].rid] then
			Kicked_Players[Recent_Players[i].rid] = nil
		end
	end
	system.yield(10)
end
end)


DelRecent = menu.add_feature("Delete All Recent Players", "action", recentopt.id, function(feat)

for i = 1, #Recent_Players do
	for y = Recent_Players[i].Feature.child_count, 1, -1 do
		local f = Recent_Players[i].Feature.children[y]
		if f.type == 1 << 11 then
			for t = f.child_count, 1, -1 do
				local e = f.children[t]
				menu.delete_feature(e.id)
			end
		end
		menu.delete_feature(f.id)
		
		system.yield(5)
	end
	if Recent_Players[i].Feature.child_count ~= 0 then
		moist_notify(Recent_Players[i].Feature.child_count)
		elseif Recent_Players[i].Feature.child_count == 0 then
		local f = Recent_Players[i].Feature
		menu.delete_feature(f.id)
	end
	system.yield(5)
end
Recent_Players = {}
moist_notify("features Deleted")

end)



function Recent_Player(rpid)
	if rpid == nil then
	return HANDLER_POP
	end
local scid, name, token = (Recent_Players[rpid].rid), (Recent_Players[rpid].name), (Recent_Players[rpid].htoken)

name = tostring(rpid) ..": " .. (Recent_Players[rpid].name)
Recent_Players[rpid].Feature = menu.add_feature(name, "parent", Recent, function(feat)
	local plyr = rpid
	if Recent_Players[plyr].WasKicked then
		Kickedstate[plyr].value = 1
		elseif not Recent_Players[plyr].WasKicked then
		Kickedstate[plyr].value = 0
	end
	
	return HANDLER_POP
end)
RecentID = Recent_Players[rpid].Feature
Recent_Players[rpid].Feature.hidden = false
local scid, nid = Recent_Players[rpid].rid, Recent_Players[rpid].nid
local DIP = Recent_Players[rpid].DecIP
local TranIP = dec2ip(DIP)
local i = #RecentPlayer + 1
RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players SCID = " .. tostring(Recent_Players[rpid].rid), "action", RecentID.id, function(feat)
	if type(feat) == 'number' then
	return HANDLER_POP
	end
	local scid = Recent_Players[rpid].rid
	utils.to_clipboard(scid)
	return HANDLER_POP
end)
RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players nethash = " .. tostring(Recent_Players[rpid].nid), "action", RecentID.id, function(feat)
	if type(feat) == 'number' then
	return HANDLER_POP
	end
	local nid = Recent_Players[rpid].nid
	utils.to_clipboard(nid)
	return HANDLER_POP
end)
RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players IP = " .. TranIP, "action", RecentID.id, function(feat)
	if type(feat) == 'number' then
	return HANDLER_POP
	end
	local ip = TranIP
	utils.to_clipboard(ip)
	return HANDLER_POP
end)
--TODO: Kickstate Update
Kickedstate[rpid] = menu.add_feature("Change Kick State = ", "action_value_str", RecentID.id, function(feat)
	local plyr = rpid
	local scid = tonumber(Recent_Players[plyr].rid)
	local name = Recent_Players[plyr].name
	if feat.value == 1 then
		Kicked_Players[scid] = name
		Recent_Players[plyr].WasKicked = true
		
		elseif feat.value == 0 then
		Kicked_Players[scid] = nil
		
		Recent_Players[plyr].WasKicked = false
		
	end
	return HANDLER_POP
end)
Kickedstate[rpid]:set_str_data({"False", "True"})
blacklistpid[#blacklistpid + 1] = menu.add_feature("Blacklist Player", "action_value_str", RecentID.id, function(feat)
	if feat.value == 0 then
		AddScid(scid, name)
		LoadBlacklist()
		elseif feat.value == 1 then
		RemoveScid(scid)
		LoadBlacklist()
	end
	
	return HANDLER_POP
end)
blacklistpid[#blacklistpid]:set_str_data({"Add","Remove"})

RecentPlayer[rpid].Features = menu.add_feature("Temp BlacklistPlayer", "parent", RecentID.id)
RecentPlayer[rpid].Blacklist1 = menu.add_feature("Blacklist IP", "toggle", RecentPlayer[rpid].Features.id, function(feat)
	if not RecentPlayer[rpid].Blacklist1.on then
		TempBlacklist[rpid].decipON = false
		return HANDLER_POP
	end
	CheckIF_INSession()
	if RecentPlayer[rpid].Blacklist1.on then
		TempBlacklist[rpid].decipON = true
		return HANDLER_CONTINUE
	end
end)
RecentPlayer[rpid].Blacklist1.on = false
RecentPlayer[rpid].Blacklist12 = menu.add_feature("Partial Blacklist IP", "toggle", RecentPlayer[rpid].Features.id, function(feat)
	local ip = TranIP
	if not RecentPlayer[rpid].Blacklist12.on then
		TempBlacklist[rpid].decip2ON = false
		return HANDLER_POP
	end
	CheckIF_INSession()
	if RecentPlayer[rpid].Blacklist12.on then
		TempBlacklist[rpid].decip2ON = true
		return HANDLER_CONTINUE
	end
end)
RecentPlayer[rpid].Blacklist12.on = false
RecentPlayer[rpid].Blacklist2 = menu.add_feature("Blacklist SCID", "toggle", RecentPlayer[rpid].Features.id, function(feat)
	if not RecentPlayer[rpid].Blacklist2.on then
		TempBlacklist[rpid].scidON = false
		return HANDLER_POP
	end
	CheckIF_INSession()
	if RecentPlayer[rpid].Blacklist2.on then
		TempBlacklist[rpid].scidON = true
		return HANDLER_CONTINUE
	end
end)
RecentPlayer[rpid].Blacklist2.on = false
RecentPlayer[rpid].Blacklist3 = menu.add_feature("Blacklist Name", "toggle", RecentPlayer[rpid].Features.id, function(feat)
	if not RecentPlayer[rpid].Blacklist3.on then
		TempBlacklist[rpid].nameON = false
		return HANDLER_POP
	end
	CheckIF_INSession()
	if RecentPlayer[rpid].Blacklist3.on then
		TempBlacklist[rpid].nameON = true
		return HANDLER_CONTINUE
	end
end)
RecentPlayer[rpid].Blacklist3.on = false


end

function CheckIF_INSession()
for pid = 0, 31 do
	if player.is_player_valid(pid) then
		TempBlacklistCheck(pid)
	end
end
end

end




menu.add_player_feature("Save Players Current POS to file", "action", Player_Tools, function(feat, pid)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, name, r, s
pos = v3()
pos = player.get_player_coords(pid)
name = player.get_player_name(pid)
r,s = input.get("Enter a Name to Label POS", "Pos from : ".. tostring(name), 64, 0)
if r == 1 then
return HANDLER_CONTINUE
end
if r == 2 then
return HANDLER_POP
end
moist_notify(string.format("%f,%f,%f", pos.x, pos.y, pos.z), "Saved Players V3 Coordinates")
savepos(string.format("\nV3 Coordinates from Player: "..tostring(name).."\n"..s..",	"..'v3('..pos.x ..", "..pos.y ..", "..pos.z..')'))
return HANDLER_POP
end)
savepos = function(text)
local file = io.open(Paths.Logs .. "\\saveposoutput.txt", "a")
io.output(file)
io.write(text)
io.close()
end
--INFO: Notify settings
local Notify_Var_Value
local NotifyVar_Value = {}
local NotifyR, NotifyG, NotifyB, NotifyA = Settings["NotifyColorRDefault"], Settings["NotifyColorGDefault"], Settings["NotifyColorBDefault"], Settings["NotifyColorADefault"]
function notify_colour_setting()
local Notify_A = string.format("%x", NotifyA)
if #Notify_A == 1 then
Notify_A = string.format("%x", NotifyA) .. string.format("%x", NotifyA)
else
Notify_A = string.format("%x", NotifyA)
end
local Notify_B = string.format("%x", NotifyB)
if #Notify_B == 1 then
Notify_B = string.format("%x", NotifyB) .. string.format("%x", NotifyB)
else
Notify_B = string.format("%x", NotifyB)
end
local Notify_G = string.format("%x", NotifyG)
if #Notify_G == 1 then
Notify_G = string.format("%x", NotifyG) .. string.format("%x", NotifyG)
else
Notify_G = string.format("%x", NotifyG)
end
local Notify_R = string.format("%x", NotifyR)
if #Notify_R == 1 then
Notify_R = string.format("%x", NotifyR) .. string.format("%x", NotifyR)
end
Settings["NotifyColorDefault"] = "0x" .. Notify_A .. Notify_B .. Notify_G .. Notify_R
Notify_Var_Value = "0x" .. Notify_A .. Notify_B .. Notify_G .. Notify_R
color = Notify_Var_Value
NotifyVar_Value[0] = Settings["NotifyColorDefault"]
notifyvalue:set_str_data(NotifyVar_Value)
--print(color)
end
notifyvalue = menu.add_feature("Current Value", "action_value_str", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
utils.to_clipboard(NotifyVar_Value[feat.value])
end)
notifyvalue:set_str_data(NotifyVar_Value)
notify_R = menu.add_feature("Notify Red:", "action_value_i", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
NotifyR = feat.value
notify_colour_setting()
Settings["NotifyColorRDefault"] = feat.value
moist_notify(Notify_Var_Value, "Test Color:")
return HANDLER_POP
end)
notify_R["max"] = 255
notify_R["min"] = 0
notify_R["value"] = Settings["NotifyColorRDefault"]
notify_G = menu.add_feature("Notify Green:", "action_value_i", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
NotifyG = feat.value
notify_colour_setting()
Settings["NotifyColorGDefault"] = feat.value
moist_notify(Notify_Var_Value, "Test Color:")
return HANDLER_POP
end)
notify_G["max"] = 255
notify_G["min"] = 0
notify_G["value"] = Settings["NotifyColorGDefault"]
notify_B = menu.add_feature("Notify Blue:", "action_value_i", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
NotifyB = feat.value
notify_colour_setting()
Settings["NotifyColorBDefault"] = feat.value
moist_notify(Notify_Var_Value, "Test Color:")
return HANDLER_POP
end)
notify_B["max"] = 255
notify_B["min"] = 0
notify_B["value"] = Settings["NotifyColorBDefault"]
notify_A = menu.add_feature("Notify Alpha Transparency:", "action_value_i", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
NotifyA = feat.value
notify_colour_setting()
Settings["NotifyColorADefault"] = feat.value
return HANDLER_POP
end)
notify_A["max"] = 255
notify_A["min"] = 0
notify_A["value"] = Settings["NotifyColorADefault"]
notify_A["hidden"] = true
notify_ClearVisible = menu.add_feature("Clear Visible Notify Loop delay: ", "value_i", globalFeatures.notifyParent,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if not feat["on"] then
Settings["ClearVisNotif"] = false
Settings["ClearVisNotifDelay"] = feat.value
return HANDLER_POP
end
Settings["ClearVisNotif"] = true
Settings["ClearVisNotifDelay"] = feat.value
menu.clear_visible_notifications()
system.yield(feat.value * 1000)
return HANDLER_CONTINUE
end)
notify_ClearVisible["max"] = 15
notify_ClearVisible["min"] = 0
notify_ClearVisible["value"] = Settings["ClearVisNotifDelay"]
notify_ClearVisible["on"] = Settings["ClearVisNotif"]
--INFO: Online Features
Send2Island = menu.add_player_feature("Force Player to Island", "action", PlayerFeatParent, function(feat, pid)
if type(feat) == "number" then
return HANDLER_POP
end
Trigger_Event(0xDAF8082C, pid, 1300962917)
Trigger_Event(0xDAF8082C, pid, 0, 0, 9)
Trigger_Event(0xDAF8082C, pid, pid, 0, 0, 9)
return HANDLER_POP
end)
for i=0,#Send2Island.feats do
Send2Island.feats[i]["hidden"] = NewDLC()
end
menu.add_player_feature("Force Player to Island", "action", playerfeatVars.Annoy, function(feat, pid)
if type(feat) == "number" then
return HANDLER_POP
end
Moist_Spam.send_notifyspam(pid)
return HANDLER_POP
end)
ip_clip = menu.add_player_feature("Copy IP to Clipboard", "action", PlayerFeatParent, function(feat, pid)
if type(feat) == "number" then
return HANDLER_POP
end
ip = GetIP(pid)
utils.to_clipboard(dec2ip(ip))
end)
--INFO: Orbital Room Protection
OrbitalThreads = {}
orbitalProxy = menu.add_feature("Add Orbital Proximity Blip", "value_f", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if not feat["on"] then
Settings["orbitalProxyBlip"] = false
orbitalProxy_colour["hidden"] = true
if ObitalBlip ~= nil then
	ui.remove_blip(ObitalBlip)
	ObitalBlip = nil
end
return HANDLER_POP
end
system.yield(600)
system.yield(600)
local pos = v3(339.379,4836.629,-58.999)
if ObitalBlip == nil then
Settings["orbitalProxyBlip"] = true
if AddBlips then
	ObitalBlip = ui.add_blip_for_radius(pos, feat.value)
	ui.set_blip_colour(ObitalBlip, 79)
	BlipIDs[#BlipIDs+1] = ObitalBlip
	orbitalProxy_colour["hidden"] = false
end
end
system.yield(600)
return HANDLER_CONTINUE
end)
orbitalProxy["max"] = 120.00
orbitalProxy["min"] = 0.01
orbitalProxy["value"] = 18.05
orbitalProxy["mod"] = 0.10
orbitalProxy["on"] = Settings["orbitalProxyBlip"]
orbitalProxy_colour = menu.add_feature("Update Orbital Proximity Blip Colour", "action_value_i",  globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if ObitalBlip ~= nil then
ui.set_blip_colour(ObitalBlip, feat.value)
end
end)
orbitalProxy_colour["max"] = 120
orbitalProxy_colour["min"] = 1
orbitalProxy_colour["value"] = 1
orbitalProxy_colour["hidden"] = true
menu.add_feature("Teleport to block location?", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos = v3()
pos.x = 339.379
pos.y = 4836.629
pos.z = -58.999
heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
return HANDLER_POP
end)
--block orbital doorway with wall
local OrbitalBlocks = {}
orbital_TableProx = menu.add_feature("Block Orbital Table Proximity", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, telpos, rot, mypos = v3(), v3(), v3(), v3()
local hash = gameplay.get_hash_key("stt_prop_stunt_bowling_ball")
streaming.request_model(hash)
while not streaming.has_model_loaded(hash) do
system.yield(10)
end
BlockObjPos = {v3(328.92288208008,4827.4096679688,-59.413398742676),
v3(327.43118286133,4829.2182617188,-59.713409423828),
v3(328.78518676758,4830.94140625,-59.513404846191),
v3(329.91387939453,4829.1040039062,-59.713409423828)}
BlockObjRot = {v3(0.0,-0.0,0.0),v3(0.0,0.0,2.0),
v3(6.6701981715767e-09,0.30000019073486,-68.899894714355),
v3(0.80000001192093,-0.20000004768372,10.299998283386)}
BlockObjHead = {10.301008224487, -68.899627685547, 0.0, 2.0}
FireObjPOS = v3(335.70220947266,4833.52734375,-58.578460693359)
FireObjROT = v3(0.0,0.20000000298023,27.799978256226)
FireObjHead = 27.799835205078
mypos = player.get_player_coords(player.player_id())
local mycurhead = player.get_player_heading(player.player_id())
--system.wait(0)
telpos.x = 339.379
telpos.y = 4836.629
telpos.z = -58.999
local heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), telpos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
for i = 1, #BlockObjPos do
pos = BlockObjPos[i]
rot = BlockObjRot[i]
head = BlockObjHead[i]
--system.wait(0)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
OrbitalBlocks[#OrbitalBlocks+1] = spawned_cunts[#spawned_cunts]
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_coords_no_offset(spawned_cunts[#spawned_cunts], pos)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_heading(spawned_cunts[#spawned_cunts], head)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_collision(spawned_cunts[#spawned_cunts], true, true, true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
if AddBlips == true then
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
end
streaming.set_model_as_no_longer_needed(hash)
local hash = gameplay.get_hash_key("vfx_it3_38")
streaming.request_model(hash)
while not streaming.has_model_loaded(hash) do
system.yield(10)
end
pos = FireObjPOS
rot = FireObjROT
head = FireObjHead
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
OrbitalBlocks[#OrbitalBlocks+1] = spawned_cunts[#spawned_cunts]
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_coords_no_offset(spawned_cunts[#spawned_cunts], pos)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_heading(spawned_cunts[#spawned_cunts], head)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_collision(spawned_cunts[#spawned_cunts], true, true, true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), mycurhead)
streaming.set_model_as_no_longer_needed(hash)
end)
orbital_blastdoor = menu.add_feature("New Orbital Block Blast Door", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, telpos, rot, mypos = v3(), v3(), v3(), v3()
mypos = player.get_player_coords(player.player_id())
local mycurhead = player.get_player_heading(player.player_id())
--system.wait(0)
telpos.x = 339.379
telpos.y = 4836.629
telpos.z = -58.999
local heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), telpos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
local hash = gameplay.get_hash_key("xm_prop_base_blast_door_02_l")
pos.x = 337.73406982422
pos.y = 4833.0112304688
pos.z = -60.003131866455
rot.x = 5.0000038146973
rot.y = -5.0000038146973
rot.z = 164.99998474121
--system.wait(0)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
OrbitalBlocks[#OrbitalBlocks+1] = spawned_cunts[#spawned_cunts]
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), mycurhead)
Force_block_orbital["on"] = true
--system.wait(0)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
end)
orbital_blastdoor1 = menu.add_feature("New Orbital Block Blast Door 1", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, telpos, rot, mypos = v3(), v3(), v3(), v3()
mypos = player.get_player_coords(player.player_id())
local mycurhead = player.get_player_heading(player.player_id())
--system.wait(0)
telpos.x = 339.379
telpos.y = 4836.629
telpos.z = -58.999
local heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), telpos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
local hash = gameplay.get_hash_key("tl_v_iaa_facility_wall1_s")
pos.x = 337.73406982422
pos.y = 4833.0112304688
pos.z = -60.003131866455
rot.x = 5.0000038146973
rot.y = -5.0000038146973
rot.z = 164.99998474121
--system.wait(0)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
OrbitalBlocks[#OrbitalBlocks+1] = spawned_cunts[#spawned_cunts]
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), mycurhead)
Force_block_orbital["on"] = true
--system.wait(0)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
end)
orbital_blastdoor2 = menu.add_feature("New Orbital Block Blast Door 1", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, telpos, rot, mypos = v3(), v3(), v3(), v3()
mypos = player.get_player_coords(player.player_id())
local mycurhead = player.get_player_heading(player.player_id())
--system.wait(0)
telpos.x = 339.379
telpos.y = 4836.629
telpos.z = -58.999
local heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), telpos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
local hash = gameplay.get_hash_key("vfx_it3_01")
pos.x = 337.73406982422
pos.y = 4833.0112304688
pos.z = -60.003131866455
rot.x = 5.0000038146973
rot.y = -5.0000038146973
rot.z = 164.99998474121
--system.wait(0)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
OrbitalBlocks[#OrbitalBlocks+1] = spawned_cunts[#spawned_cunts]
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
spawned_cunts[#spawned_cunts+1] = object.create_world_object(hash, pos, true, true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
decorator.decor_register("MissionType", 3)
decorator.decor_set_int(spawned_cunts[#spawned_cunts], "MissionType", math.random(0, 65535))
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), mycurhead)
Force_block_orbital["on"] = true
--system.wait(0)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
end)
Force_block_orbital = menu.add_feature("Force Orbital Block", "toggle", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, rot = v3(), v3()
pos.x = 337.73406982422
pos.y = 4833.0112304688
pos.z = -56.326847076416
rot.x = 5.0000038146973
rot.y = -5.0000038146973
rot.z = 164.99998474121
if feat["on"] then
for i = 1, #OrbitalBlocks do
	network.request_control_of_entity(OrbitalBlocks[i])
	system.wait(5)
	entity.set_entity_coords_no_offset(OrbitalBlocks[i], pos)
	entity.set_entity_rotation(OrbitalBlocks[i], rot)
	entity.set_entity_god_mode(OrbitalBlocks[i], true)
	entity.freeze_entity(OrbitalBlocks[i], true)
end
return HANDLER_CONTINUE
end
end)
Force_block_orbital["on"] = false
block_orbital = menu.add_feature("Moving Wall Orbital Block", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, telpos, rot, mypos = v3(), v3(), v3(), v3()
mypos = player.get_player_coords(player.player_id())
local mycurhead = player.get_player_heading(player.player_id())
telpos.x = 339.379
telpos.y = 4836.629
telpos.z = -58.999
local heading = 136.27784729004
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), telpos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
pos.x = 342.69586181641
pos.y = 4832.3774414062
pos.z = -61.000000
rot.x = 0.0
rot.y = 0.0
rot.z = 60.000003814697
spawned_cunts[#spawned_cunts+1] = object.create_world_object(472547144, pos, true, false)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
pos.x = 343.01234960938
pos.y = 4833.3774414062
pos.z = -58.619457244873
pos.x = 350.26750854492
pos.y = 4828.8745117188
pos.z = -58.487403869629
rot.x = -25.000011444092
rot.y = -0.0
rot.z = 150.0
spawned_cunts[#spawned_cunts + 1] = object.create_world_object(2895140982 , pos, true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
pos.x = 347.04141235352
pos.y = 4830.7163085938
pos.z = -58.487403869629
rot.x = -25.000011444092
rot.y = -0.0
rot.z = 150.0
spawned_cunts[#spawned_cunts + 1] = object.create_world_object(2895140982 , pos, true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
pos.x = 343.0749206543
pos.y = 4832.9965820312
pos.z = -58.487403869629
rot.x = -25.000011444092
rot.y = -0.0
rot.z = 150.0
spawned_cunts[#spawned_cunts + 1] = object.create_world_object(2895140982 , pos, true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
pos.x = 339.48446655273
pos.y = 4835.1568554686
pos.z = -58.487403869629
rot.x = -25.000011444092
rot.y = -0.0
rot.z = 150.0
spawned_cunts[#spawned_cunts + 1] = object.create_world_object(2895140982 , pos, true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
pos.x = 335.99624633789
pos.y = 4837.0795898438
pos.z = -58.487403869629
rot.x = -25.000011444092
rot.y =-0.0
rot.z = 150.000
spawned_cunts[#spawned_cunts + 1] = object.create_world_object(2895140982 , pos, true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
entity.set_entity_god_mode(spawned_cunts[#spawned_cunts], true)
entity.freeze_entity(spawned_cunts[#spawned_cunts], true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), mycurhead)
return HANDLER_POP
end)
blockplaces03 = menu.add_feature("Block Orbital Entrance with Wall", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, rot, pos1, rot1 = v3(), v3(), v3(), v3()
pos.x = 335.719
pos.y = 4834.571
pos.z = -60.206
rot.x = 0.000
rot.y = -0.000
rot.z = 125.000
pos1.x = 335.71899414062
pos1.y = 4834.5708007812
pos1.z = -60.206390380859
rot1.x = 0.0
rot1.y = -0.0
rot1.z = 125.0
spawned_cunts[#spawned_cunts + 1] = object.create_object(561365155, pos1, true, false)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot1)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
return HANDLER_POP
end)
--Inactive Orbital Screens over blocked doorway
orbscreens = menu.add_feature("Orbital Inactive Screens over Block", "action", globalFeatures.orbital,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos1, pos2, pos3, pos4, pos5, rot1, rot2, rot3, rot4, rot5 = v3(), v3(), v3(), v3(), v3(), v3(), v3(), v3(), v3(), v3()
pos1.x = 336.016083
pos1.y = 4834.12988
pos1.z = -58.0754662
rot1.x = -25.160162
rot1.y = 2.82980454e-06
rot1.z = 122.541527
pos2.x = 336.016083
pos2.y = 4834.12988
pos2.z = -58.9853134
rot2.x = -25.160162
rot2.y = 2.82980454e-06
rot2.z = 122.541527
pos4.x = 336.016083
pos4.y = 4834.12988
pos4.z = -57.5355568
rot4.x = -25.160162
rot4.y = 2.82980454e-06
rot4.z = 122.541527
spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos1, true, false)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot1)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos2, true, false)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot2)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos4, true, false)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot4)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
return HANDLER_POP
end)
menu.add_feature("Teleport to Casino God Mode Glitch location?", "action", globalFeatures.glitch,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos = v3()
pos.x = 980.99298095703
pos.y = 67.855430603027
pos.z = 117.94748687744
heading = -1.1678575901897e-006
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
return HANDLER_POP
end)
casinoglitch = menu.add_feature("Block Casino God Mode Glitch area", "action", globalFeatures.glitch,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local pos, rot = v3(), v3()
pos.x = 980.99298095703
pos.y = 67.855430603027
pos.z = 117.94748687744
rot.x = 25.000011444092
rot.y = 90.0
rot.z = 0.0
spawned_cunts[#spawned_cunts + 1] = object.create_object(2765198545, pos, true, false)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
network.request_control_of_entity(spawned_cunts[#spawned_cunts])
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
--entity.set_entity_heading(spawned_cunts[#spawned_cunts], -1.1678575901897e-006)
return HANDLER_POP
end)
delete_cunt = menu.add_feature("Delete Spawned Cunts", "action", globalFeatures.cleanup,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
for i = 1, #spawned_cunts do
network.request_control_of_entity(spawned_cunts[i])
entity.delete_entity(spawned_cunts[i])
end
for i = 1, #spawned_cunt do
network.request_control_of_entity(spawned_cunt[i])
entity.delete_entity(spawned_cunt[i])
end
for i = 1, #spawned_cunt1 do
network.request_control_of_entity(spawned_cunt1[i])
entity.delete_entity(spawned_cunt1[i])
end
for i = 1, #spawned_cunt2 do
network.request_control_of_entity(spawned_cunt2[i])
entity.delete_entity(spawned_cunt2[i])
end
for i = 1, #spawned_cunt3 do
network.request_control_of_entity(spawned_cunt3[i])
entity.delete_entity(spawned_cunt3[i])
end
end)
--INFO: Player Joins

local join_queue, MylastPID, last_join_time = {}, 0, 0
JoinQue = menu.add_feature("Join Log Que", "toggle", globalFeatures.moistopt,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if feat["on"] then
system.yield(1000)
if #join_queue ~= nil then
	system.yield(2000)
	local que = {}
	que = join_queue
	join_queue = {}
	for i = 1, #que do
		joined_csv(que[i])
	end
	--last_join_time = 0
	-- elseif #join_queue == nil then
	-- return HANDLER_POP
end
JoinQue["on"] = false
return HANDLER_POP
end
end)
JoinQue["on"] = false
JoinQue["hidden"] = true
joining_players_logger = event.add_event_listener("player_join", function(e)
local pid = e["player"]
--if MylastPID ~= player.player_id() or player.get_player_name(pid) ~= SessionPlayers[pid].sessionname then
--joined_data("New Session")
if pid == player.player_id()  then
joined_csv("Joined New Session")
MylastPID = player.player_id()
end
if last_join_time ~= os.time then
last_join_time = os.time()
JoinQue["on"] = true
end
Players[pid].JoinTime = os.time()
local scid = player.get_player_scid(pid)
local schx = string.format("%x", scid)
local name = tostring(player.get_player_name(pid))
local netplyhash = network.network_hash_from_player(e["player"])
local ip, sip, token, tohex, prior
local token = tostring(player.get_player_host_token(pid))
local tokhex = string.format("%x", token)
local prior = player.get_player_host_priority(pid)
local DecIP = player.get_player_ip(pid)
if string.len(scid) <= 4 then
moist_notify("Joining Player: " .. name .. "\nUsing Very Short scid\n Most likely this is Spoofed!!", "Moists Joining Modder Detection")
end
if DecIP == 1162167621 or DecIP == -1 or DecIP == 16843009 or DecIP == 2130706433 then
moist_notify("Joining Player: " .. name .. "\nUsing a known Modder Spoofed IP !", "Moists Joining Modder Detection")
--  Kick_Pid(pid)
end
ip = GetIP(pid)
sip = dec2ip(ip)
joined_data(name .. ":" .. schx .. "|" .. pid .. "|" .. scid .. "|" .. token .. "|" .. tokhex .. "|" .. prior .. "|" .. ip .. "|" .. sip .. "\n")
join_queue[#join_queue+1] = tostring(name .. ',' .. schx .. ',' .. pid .. ',' .. scid .. ',' .. netplyhash .. ',' .. token .. ',' .. tokhex .. ',' .. prior .. ',' .. ip .. ',' .. sip)
--	joined_csv(name .. ',' .. schx .. ',' .. pid .. ',' .. scid .. ',' .. netplyhash .. ',' .. token .. ',' .. tokhex .. ',' .. prior .. ',' .. ip .. ',' .. sip)
playerDB(pid, player.get_player_ip(pid))
blacklist_check(pid)
return
end)
-- FIX: LAST CODE CLEANUP FINISH POINT	
--INFO: Blacklist
function ValidScid(scid)
return scid ~= -1 and scid ~= -1
end
function RemoveScid(scid)
local playerID = GetPID(scid)
name = scids[scid]
if scids[scid] then
scids[scid] = nil
local file = io.open(Paths.scidFile, "w+")
io.output(file)
for k, v in pairs(scids) do
	if v then
		io.write(k .. "|" .. v .. "\n")
	end
end
io.close()
for i = RemoveBlacklistFeature.child_count, 1, -1 do
	local f = RemoveBlacklistFeature.children[i]
	if f.data == scid then
		menu.delete_feature(f.id)
		break
	end
end
scidN = scidN - 1
Debug_Out(string.format("Removed " .. scid .. " : " .. name .. " from blacklist."))
--print("Removed " .. scid .. " from blacklist.")
end
if playerID ~= nil then
player.unset_player_as_modder(playerID, mod_flag_4)
Debug_Out(string.format("Player in Session Removed Modder Marking" .. scid .. " : " .. name))
end
end
function GetPID(scid)
for pid = 0, 31 do
if scid == player.get_player_scid(pid) then
	return pid
end
end
end
function RemoveScidByPid(pid)
if pid == player.player_id() then
return
end
scid = player.get_player_scid(pid)
if ValidScid(scid) then
RemoveScid(scid)
end
end
function RemoveScidByFeature(f)
menu.create_thread(RemoveScid, f.data)
end
function AddScid(scid, name)
if scids[scid] then
return
end
name = name or "Unknown"
scids[scid] = name
local file = io.open(Paths.scidFile, "a")
io.output(file)
io.write(scid .. "|" .. name .. "\n")
io.close()
scidN = scidN + 1
menu.add_feature(scidN .. ": " .. scid .. " (" .. name .. ")", "action", RemoveBlacklistFeature.id, RemoveScidByFeature).data = scid
Debug_Out(string.format("Added " .. scid .. " (" .. name .. ")" .. "to blacklist"))
LoadBlacklist()
end
function AddScidByPid(pid)
if pid == player.player_id() then
return
end
local scid = player.get_player_scid(pid)
if ValidScid(scid) then
AddScid(scid, player.get_player_name(pid))
end
end
function LoadBlacklist()
scids = {}
scidN = 0
for i = RemoveBlacklistFeature.child_count, 1, -1 do
menu.delete_feature(RemoveBlacklistFeature.children[i].id)
end
if not utils.file_exists(Paths.scidFile) then
return
end
for line in io.lines(Paths.scidFile) do
local scid, name = line:match("(%x+)|?(.-)$")
name = name or "Unknown"
if scid then
	local scid = tonumber(scid) or tonumber(scid, 16)
	if scid then
		scids[scid] = name
		menu.add_feature(scidN .. ": " .. scid .. " (" .. name .. ")", "action", RemoveBlacklistFeature.id,
		RemoveScidByFeature).data = scid
		scidN = scidN + 1
	end
end
end
end
BL_Notify = {}
BL_M_Notify = {}
for pid = 0, 31 do
BL_Notify[pid] = false
BL_M_Notify[pid] = false
end
function Kick_Pid(pid)
if pid == player.player_id() then
return
end
scid = player.get_player_scid(pid)
name = (player.get_player_name(pid)) or (SessionPlayers.Name)
for y = 1, #Recent_Players do
if Recent_Players[y].rid == player.get_player_scid(pid) then
	if not Players[pid].isFriend then
		Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
		local token = tostring(player.get_player_host_token(pid))
		Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
		Recent_Players[y].WasKicked = true
	end
end
end
if network.network_is_host() then
if not BL_Notify[pid + 1] then
	Debug_Out(string.format("Black List: Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ")"))
	moist_notify("Host Kicked: " .. name .. " : " .. scids[scid], "Blacklist Player Kicked", 0xff0000ff)
	BL_Notify[pid + 1] = true
end
network.force_remove_player(pid)
else
if not BL_Notify[pid + 1] then
	name = (player.get_player_name(pid)) or (string.format(SessionPlayers.Name) .. scids[scid])
	Debug_Out(string.format("Black List: Non-Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ")"))
	moist_notify("Script-Event Kicked: " .. name .. " : " .. scids[scid], "Blacklist Player Kicked", 0xff0000ff)
	BL_Notify[pid + 1] = true
end
network.force_remove_player(pid)
Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
end
network.force_remove_player(pid)
end
function MarkPidAsModder(pid)
if pid == player.player_id() then
return
end
local scid = player.get_player_scid(pid)
name = (player.get_player_name(pid)) or (SessionPlayers.Name .. scids[scid])
if not BL_M_Notify[pid + 1] then
Debug_Out(string.format("[Black List]: " .. pid .. " : (" .. name .. " : " .. scids[scid] .. ")\nBlack List: Marked As Modder"))
BL_M_Notify[pid + 1] = true
end
player.set_player_as_modder(pid, mod_flag_4)
end
menu.add_feature("Reload blacklist", "action", globalFeatures.parentID, function()
LoadBlacklist()
moist_notify(scidN .. " entries", "Blacklist Loaded ",  0xffffffff)
end)
EnabledBlacklistFeature = menu.add_feature("Enable blacklist", "toggle", globalFeatures.parentID,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if not feat["on"] then
Settings["Blacklist_ON"] = false
return HANDLER_POP
end
Settings["Blacklist_ON"] = true
local lp = player.player_id()
for pid = 0, 31 do
if pid ~= lp then
	local scid = player.get_player_scid(pid)
	if ValidScid(scid) and scids[scid] then
		if MarkAsModderFeature["on"] then
			MarkPidAsModder(pid)
		end
		if KickFeature["on"] then
			Kick_Pid(pid)
		end
	end
end
end
return HANDLER_CONTINUE
end)
EnabledBlacklistFeature["on"] = Settings["Blacklist_ON"]
MarkAsModderFeature = menu.add_feature("Mark As Modder", "toggle", globalFeatures.parentID,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if not feat["on"] then
Settings["Blacklist_Mark"] = false
return HANDLER_POP
end
Settings["Blacklist_Mark"] = true
return HANDLER_POP
end)
MarkAsModderFeature["on"] = Settings["Blacklist_Mark"]
KickFeature = menu.add_feature("Kick Player", "toggle", globalFeatures.parentID,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
if not feat["on"] then
Settings["Blacklist_kick"] = false
return HANDLER_POP
end
Settings["Blacklist_kick"] = true
return HANDLER_POP
end)
KickFeature["on"] = Settings["Blacklist_kick"]
menu.add_feature("Manually add scid", "action", globalFeatures.parentID,function(feat)
if type(feat) == "number" then
return HANDLER_POP
end
local r, s = input.get("Enter SCID to add", "", 64, 3)
if r == 1 then
return HANDLER_CONTINUE
end
if r == 2 then
return HANDLER_POP
end
AddScid(tonumber(s), "Manual add")
moist_notify("Added " .. s .. " to blacklist", "Blacklist", 0xff0000ff)
end)
RemoveBlacklistFeature = menu.add_feature("Remove blacklist", "parent", globalFeatures.parentID)
globalFeatures.addtoblacklist = menu.add_player_feature("Add Player to blacklist", "action", PlayerFeatParent,
function(feat, pid)
if type(feat) == "number" then
	return HANDLER_POP
end
AddScidByPid(pid)
if EnabledBlacklistFeature["on"] then
	if MarkAsModderFeature["on"] then
		MarkPidAsModder(pid)
	end
	if KickFeature["on"] then
		Kick_Pid(pid)
	end
end
end)
for i =0, #globalFeatures.addtoblacklist.feats do
globalFeatures.addtoblacklist.feats[i]["hidden"] = false
end
globalFeatures.removefromblacklist = menu.add_player_feature("Remove from Blacklist", "action", PlayerFeatParent, function(feat, pid)
if type(feat) == "number" then
	return HANDLER_POP
end
RemoveScidByPid(pid)
player.unset_player_as_modder(pid, mod_flag_4)
end)
for i =0, #globalFeatures.removefromblacklist.feats do
globalFeatures.removefromblacklist.feats[i]["hidden"] = false
end
function blacklist_check(pid)
if not EnabledBlacklistFeature["on"] then
	return
end
local scid = player.get_player_scid(pid)
if ValidScid(scid) and scids[scid] then
	local name = player.get_player_name(pid) or SessionPlayers.Name and scids[scid]
	moist_notify("(" .. name .. " : " .. scids[scid] .. ") " .. scid, "BlackList Player Joining:", 0xff0000ff)
	if MarkAsModderFeature["on"] then
		MarkPidAsModder(pid)
	end
	if KickFeature["on"] then
		Kick_Pid(pid)
	end
end
end
LoadBlacklist()
--INFO: Chat Logger
function chat(name, text)
if not chat_log["on"] then
	return
end
local d = os.date()
local t = string.match(d, "%d%d:%d%d:%d%d")
local dt = os.date("%d/%m/%Y")
local file = io.open(Paths.Logs .. "\\chat.txt", "a")
io.output(file)
io.write("\n[" .. dt .. " | " .. t .. " |] [ " .. (tostring(name)) .. ":] | " .. text)
io.close()
end
function Console_chat(name, text)
if not Settings["chat_debug"] then
	return
end
local d = os.date()
local t = string.match(d, "%d%d:%d%d:%d%d")
end
ChatEventID = event.add_event_listener("chat", function(e)
local playerID, senderID, ChatMsg = e["player"], e.sender, e.body
if senderID ~= playerID then
	moist_notify("Modded Chat by: " .. tostring(player.get_player_name(playerID)), "Modder Detection")
	Chatby = player.get_player_name(playerID)
	ChatSender = player.get_player_name(senderID)
	chat(tostring(Chatby).. " : Spoof >> " .. tostring(ChatSender), e.body)
end
Chatby = player.get_player_name(playerID)
ChatSender = player.get_player_name(senderID)
chat(tostring(ChatSender), e.body)
Console_chat(PlayerID, e.body)
Chat_Command(PlayerID, e.body)
return
end)
local comm, playername
function Chat_Command(playerid, text)
local chat_clear = 0
if not ChatCommand["on"] then
	return
end
if not player.is_player_friend(playerid) then
	return
end
comm = text:sub(1, 5)
Name = text:sub(7, 25)
playername = string.lower(Name)
if comm == "@kick" then
	repeat
		chat_clear = (chat_clear + 1)
		network.send_chat_message(string.format(chat_clear), false)
	until (chat_clear == 30)
	for i = 0, 31 do
		if i ~= player.player_id() then
			Name = tostring(player.get_player_name(i))
			name = string.lower(string.format(Name))
			if name == playername then
				if not player.is_player_host(player.player_id()) then
					player.send_player_sms(playerid, "I'm Not Currently Host Let Me see if i can remove him")
					send_SE_Kick(i)
					network.force_remove_player(i)
				end
				if player.is_player_host(player.player_id()) then
					player.send_player_sms(playerid, "Sending Kick Now!")
					network.force_remove_player(i)
				end
			end
		end
	end
	return HANDLER_POP
end
end
function SE_KickCrash(pid)
for y = 1, #Recent_Players do
	if Recent_Players[y].rid == player.get_player_scid(pid) then
		if not Players[pid].isFriend then
			Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
			local token = tostring(player.get_player_host_token(pid))
			Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
			Recent_Players[y].WasKicked = true
		end
	end
end
for i = 1, #data do
	system.yield(Settings["ScriptEvent_delay"])
	Trigger_Event(data[i], pid, (math.random(1002039228, 9999993922)), 3, (math.random(827870001, 927870001)), (math.random(1002039228, 2022580431)), (math.random(-938762645, -908761645)), (math.random(175165, 1754244778)), (math.random(827470001, 827870001)), 1754244778, 23135423, 827870001, 23135423)
	system.yield(10)
	Trigger_Event(data[i], pid, pid, (math.random(-1, 1)), 30583, 0, (math.random(-1, 1)), 0, -328966, 1132039228, (math.random(-1, 1)))
	system.yield(10)
end
system.yield(25)
end
function SE_KickCrash2(pid)
for y = 1, #Recent_Players do
	if Recent_Players[y].rid == player.get_player_scid(pid) then
		if not Players[pid].isFriend then
			Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
			local token = tostring(player.get_player_host_token(pid))
			Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
			Recent_Players[y].WasKicked = true
		end
	end
end
local eventdata = {-2084766469,-68354216}
for i = 1, #eventdata do
	system.yield(Settings["ScriptEvent_delay"])
	Trigger_Event(eventdata[i], pid, (math.random(-1, 1)), (math.random(1002039228, 9999993922)), (math.random(-1, 1)), 3, (math.random(827870001, 927870001)), (math.random(1002039228, 2022580431)), (math.random(-1, 1)), (math.random(-938762645, -908761645)), (math.random(175165, 1754244778)), (math.random(827870001, 927870001)), (math.random(1002039228, 2022580431)), (math.random(-1, 1)), (math.random(-938762645, -908761645)), (math.random(175165, 1754244778)))
	system.yield(10)
	Trigger_Event(eventdata[i], pid, pid, (math.random(827870001, 927870001)), (math.random(1002039228, 2022580431)), (math.random(-1, 1)), (math.random(-938762645, -908761645)), (math.random(175165, 1754244778)), (math.random(-1, 1)), 30583, 0, (math.random(-1, 1)), 0, -328966, 1132039228, (math.random(-1, 1)))
	system.yield(10)
end
system.yield(25)
end
function send_SE_Kick(pid)
for y = 1, #Recent_Players do
	if Recent_Players[y].rid == player.get_player_scid(pid) then
		if not Players[pid].isFriend then
			Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
			local token = tostring(player.get_player_host_token(pid))
			Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
			Recent_Players[y].WasKicked = true
		end
	end
end
Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
end
chat_log = menu.add_feature("Log in Game Chat", "toggle", logging,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if not feat["on"] then
	Settings["chat_log"] = false
	return HANDLER_POP
end
Settings["chat_log"] = true
return HANDLER_POP
end)
chat_log["on"] = Settings["chat_log"]
--INFO: Chat Command Thread Feature
ChatCommand = menu.add_feature("Chat Command", "toggle", logging,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if not feat["on"] then
	Settings["Chat_Command"] = false
	return HANDLER_POP
end
Settings["Chat_Command"] = true
return HANDLER_POP
end)
ChatCommand["on"] = Settings["Chat_Command"]
chat_console = menu.add_feature("Ouput Game Chat to Debug Console", "toggle", logging,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if not feat["on"] then
	Settings["chat_debug"] = false
	return HANDLER_POP
end
Settings["chat_debug"] = true
return HANDLER_POP
end)
chat_console["on"] = Settings["chat_debug"]
--INFO: player Features --Griefing
function griefing()
plyfeatkick2 = menu.add_player_feature("Script Host Crash Kick", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local SE_ARGS = build_params(20)
	system.wait(800)
	for y = 1, #Recent_Players do
		if Recent_Players[y].rid == player.get_player_scid(pid) then
			if not Players[pid].isFriend then
				Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
				local token = tostring(player.get_player_host_token(pid))
				Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
				Recent_Players[y].WasKicked = true
			end
		end
	end
	for i = 1, #SH_Events do
		Trigger_Event(SH_Events[i], pid, SE_ARGS)
		system.yield(0)
	end
end)
for i=0,#plyfeatkick2.feats do
	plyfeatkick2.feats[i]["hidden"] = NewDLC()
end
--INFO: REMOVE THESE KICKS FROM PUBLC
NewKick = menu.add_player_feature("New Player Crash", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	player.unset_player_as_modder(pid, -1)
	for y = 1, #Recent_Players do
		if Recent_Players[y].rid == player.get_player_scid(pid) then
			if not Players[pid].isFriend then
				Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
				local token = tostring(player.get_player_host_token(pid))
				Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
				Recent_Players[y].WasKicked = true
			end
		end
	end
	Trigger_Event(0x39624029, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
	Trigger_Event(0xAD63290E, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
	Trigger_Event(0x7DE8CAC0, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
	Trigger_Event(0x285DDF33, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
	Trigger_Event(0x39624029, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
	Trigger_Event(0xAD63290E, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
	Trigger_Event(0x7DE8CAC0, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
	Trigger_Event(0x285DDF33, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
	Trigger_Event(-1386010354, pid, -1, -1, -1, -788905164)
	Trigger_Event(962740265, pid, -1, -1, -1, -788905164)
	Trigger_Event(962740265, pid, -1, -72614, 63007, 59027, -12012, -26996, 33398)
	Trigger_Event(-1386010354, pid, -1, -72614, 63007, 59027, -12012, -26996, 33398)
	Trigger_Event(-1386010354, pid, -1, -1, 23243, 5332, 3324)
	Trigger_Event(962740265, pid, -1, -1, 23243, 5332, 3324)
end)
for i=0,#NewKick.feats do
	NewKick.feats[i]["hidden"] = NewDLC()
end
Player_Vectorv1 = menu.add_player_feature("Vector v1: ", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local args, events = {}, {}
	local mult = 10^0
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	local pos = player.get_player_coords(pid)
	
	args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
	for i = 1, #events do
		pos = player.get_player_coords(pid)
		args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
		system.yield(100)
		if player.is_player_valid(pid) then
			system.yield(100)
			Trigger_Event(events[i], pid, args)
			else
			break
		end
	end
end)
for i=0,#Player_Vectorv1.feats do
	Player_Vectorv1.feats[i]:set_str_data({"Crash Events","All Events"})
end
Player_Vectorv2 = menu.add_player_feature("Vector v2: ", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local args, events = {}, {}
	local mult = 10^0
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	for y = 1, #Recent_Players do
		if Recent_Players[y].rid == player.get_player_scid(pid) then
			if not Players[pid].isFriend then
				Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
				local token = tostring(player.get_player_host_token(pid))
				Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
				Recent_Players[y].WasKicked = true
			end				 
		end
	end
	local pos = player.get_player_coords(player.player_id())
	args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
	pos = player.get_player_coords(player.player_id())
	args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
	args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
	system.yield(100)
	for i = 1, #events do
		system.yield(100)
		args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
		pos = player.get_player_coords(player.player_id())
		args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
		args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
		system.yield(100)
		if player.is_player_valid(pid) then
			system.yield(100)
			Trigger_Event(events[i], pid, args)
			else
			break 
		end
	end
end)
for i=0,#Player_Vectorv2.feats do
	Player_Vectorv2.feats[i]:set_str_data({"Crash Events","All Events"})
end
Player_Vectorv3 = menu.add_player_feature("Vector v3: ", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local args, events = {}, {}
	local mult = 10^0
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	
	for i = 1, #events do
		for id = 0, 31 do
			if player.is_player_valid(id) then
				local pos = player.get_player_coords(id) 
				args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
				local pos = player.get_player_coords(id) 
				args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
				--system.yield(100)
				if player.is_player_valid(pid) then
					system.yield(100)
					Trigger_Event(events[i], pid, args)
					else
					break 
				end
			end
		end
	end
end)
for i=0,#Player_Vectorv3.feats do
	Player_Vectorv3.feats[i]:set_str_data({"Crash Events","All Events"})
end
StatKick = menu.add_player_feature("Player Stats Crash", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local args, stat = {}, {4,24,25,26,27,53,56,57,58,59,90,171,189,272,287}
	local mult = 10^0
	local events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
	local pos = player.get_player_coords(pid)
	
	for t =1, #stat do
		args[#args+1] =  script.get_global_i(1853348 + (1 + (pid * 834)) + 205 + stat[t])
	end
	for i = 1, #events do
		for t =1, #stat do
			args[#args+1] =  script.get_global_i(1853348 + (1 + (pid * 834)) + 205 + stat[t])
		end
		Trigger_Event(events[i], pid, args)
	end
end)
for i=0,#StatKick.feats do
	StatKick.feats[i]["hidden"] = NewDLC()
end
Kick_01 = menu.add_player_feature("SuperKick Crash", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
	
	for i = 1, #events do
		par1 = math.random(-1000, 99999999)
		par2 = math.random(-1, 9)
		par3 = math.random(-1000, 99999999)
		par4 = math.random(-100, -1)
		par5 = math.random(999999999, 999999999999999)
		par6 = math.random(-999999999999999, -9999999)
		Trigger_Event(events[i], pid, par1, -1, -1, -1, par1, par2, par1, par2, par1, par3, par4, par5 -1, -1, -1, -1, -1, -1, par6, -1, par6, par2, par3, par4)
	end
end)
Kick_02 = menu.add_player_feature("SuperKick Crash v2", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
	
	for i = 1, #events do
		par1 = math.random(-1000, 99999999)
		par2 = math.random(-1, 9)
		par3 = math.random(-1000, 99999999)
		par4 = math.random(-100, -1)
		par5 = math.random(999999999, 999999999999999)
		par6 = math.random(math.mininteger, math.maxinteger)
		Trigger_Event(events[i], pid, par1, -1, par6, -1, par1, par2, par6, par2, par5, par3, par4, par5, par6, -1, -1, -1, -1, -1, par6, par1, par6, par2, par3, par4, par6)
	end
end)
for i=0,#Kick_02.feats do
	Kick_02.feats[i]["hidden"] = NewDLC()
end
Kick_03 = menu.add_player_feature("SuperKick Crash v3", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	
	for i = 1, #events do
		par1 = math.mininteger
		par2 = math.random(math.mininteger, -1)
		par3 = math.random(-1, math.maxinteger)
		par4 = math.random(-100, -1)
		par5 = math.maxinteger
		par6 = math.random(math.mininteger, math.maxinteger)
		system.yield(100)
		Trigger_Event(events[i], pid, par4, par1, par6, par2, par1, par2, par6, par2, par5, par3, par4, par5, par6, par3, par5, par3, par4, par5, par6, par1, par6, par2, par3, par4, par6)
	end
end)
for i=0,#Kick_03.feats do
	Kick_03.feats[i]:set_str_data({"Crash Events","All Events"})
end
Kick_04 = menu.add_player_feature("Crash v4 test", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	trignext = true
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	
	for i = 1, #events do
		par1 = math.mininteger
		par2 = math.random(math.mininteger, -1)
		par3 = math.random(-1, math.maxinteger)
		par4 = math.random(-100, -1)
		par5 = math.maxinteger
		par6 = math.random(math.mininteger, math.maxinteger)
		system.yield(100)
		Trigger_Event(events[i], pid, par4, par1, par6, par2, par1, par2, par6, par2, par5, par3, par4, par5, par6, par3, par5, par3, par4, par5, par6, par1, par6, par2, par3, par4, par6)
	end
end)
for i=0,#Kick_04.feats do
	Kick_04.feats[i]:set_str_data({"Crash Events","All Events"})
end
trignext = false
Kick_05 = menu.add_player_feature("Crash v5 test", "action_value_str", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	trignext = true
	if feat.value == 0 then
		events = {-195247709,-68354216,-990958325,959741220,1836137561,-737858645,801199324,-1991317864,1902624891,127278285,-1322571352,704979198,-1970125962,2112408256,677240627,-2113023004,-1704141512,962740265,-1386010354,603406648,-1715193475,1258808115,998716537,163598572,-1056683619,-393294520,2035029994,-2065406127,-2084766469,1171686015,-242781845,69874647,924535804,1494472464}
		elseif feat.value == 1 then
		events = data
	end
	
	local y = testpos[pid + 1] + 1
	for i = y, #events, 1 do
		testpos[pid + 1] = i
		par1 = math.mininteger
		par2 = math.random(math.mininteger, -1)
		par3 = math.random(-1, math.maxinteger)
		par4 = math.random(-100, -1)
		par5 = math.maxinteger
		par6 = math.random(math.mininteger, math.maxinteger)
		system.yield(100)
		args = {par4, par3, par1, par6, par5, par2}
		local text = "Event Triggered " .. tostring(events[i]) .. "\n" 
		--Debug_Out(text)
		trignext = false
		Trigger_Event(events[i], pid, args)
		DebugText = (tostring(events[i]) .. ", pid, {" .. table.concat(args, ", ") .. "}")
		DebugText = DebugText .. "\n"
		while Session_Slots[pid+1] == true do
			system.yield(1)
			if Session_Slots[pid+1] == false and trignext == false then
				--Debug_Out("Slot Empty")
				--Debug_Out("Sucess Hash: " .. tostring(events[i]) .. "\nArgs: " .. Dump(args))
				--Debug_Out(tostring(events[i]) .. ", pid, {" .. table.concat(args, ", ") .. "0}", false, "Working_SE.ini")
				return HANDLER_POP
				elseif Session_Slots[pid+1] == true and trignext == true then
				return HANDLER_POP
			end
			system.yield(1)
		end
		if  Session_Slots[pid+1] == false then
			--Debug_Out("Slot Empty")
			--Debug_Out("Sucess Hash: " .. tostring(events[i]) .. "\nArgs: " .. Dump(args))
			--Debug_Out(tostring(events[i]) .. ", pid, {" .. table.concat(args, ", ") .. "0}", false, "Working_SE.ini")
		end
		return HANDLER_POP
	end
	system.yield(1)
end)
for i=0,#Kick_05.feats do
	Kick_05.feats[i]:set_str_data({"Crash Events","All Events"})
end
BailAllOther = menu.add_player_feature("Bail Kick all other Players", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 0, 31 do
		if player.is_player_valid(i) and pid ~= i then
			for y = 1, #Recent_Players do
				if Recent_Players[y].rid == player.get_player_scid(pid) then
					if not Players[pid].isFriend then
						Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
						local token = tostring(player.get_player_host_token(pid))
						Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
						Recent_Players[y].WasKicked = true
					end
				end
			end
			player.unset_player_as_modder(i, -1)
			Trigger_Event(0x493FC6BB, i, i, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
		end
	end
end)
for i=0,#BailAllOther.feats do
	BailAllOther.feats[i]["hidden"] = NewDLC()
end
plyfeatForceRemove = menu.add_player_feature("Force Remove Player", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	player.unset_player_as_modder(pid, -1)
	
	network.force_remove_player(pid)
end)
for i=0,#plyfeatForceRemove.feats do
	plyfeatForceRemove.feats[i]["hidden"] = NewDLC()
end
plyfeatBailkick = menu.add_player_feature("Network Bail Kick", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	player.unset_player_as_modder(pid, -1)
	
	Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
end)
for i=0,#plyfeatBailkick.feats do
	plyfeatBailkick.feats[i]["hidden"] = NewDLC()
end
plyerCrashkicka = menu.add_player_feature("Player Crash Modder Kick v1", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	
	Trigger_Event(1902624891, pid, -1, -1, -1)
	Trigger_Event(1308840134, pid, -1, -1, -1)
	return HANDLER_POP
end)
for i=0,#plyerCrashkicka.feats do
	plyerCrashkicka.feats[i]["hidden"] = NewDLC()
end
plyerCrashkick = menu.add_player_feature("Player Crash Modder Kick v2", "action", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local events = {-1529596656,998429206,1344238021,-1403511311,136284527,-1388926377,-1257646007,1605622787,-150706708,-1501830047,-1118275782,-66669983,1781594056,1170648687,-966968411,-12829019,-953772271,1984378280,1438167811,1563920620,1301759283,1712468236,989446059,463008662,269343035,20037995,-1864818330,-490124271,-627735605,-253717113,1111927333,33538663,-624451532,1670832796,931221602,2108559203,553322100,-637352381,495813132,1448750576,1802636121,-898440447,-1663428414,-714268990,502129530,-1417625509,1848312823,1264893833,2135857273,1704319171,986542239,-945048174,145637109,-1544474774,1915499503,-1413252009,-1838276770,1449852136,-539605978,-1943111510,523052032,80875492,-1112898503,-1973627888,2144233578,-1342945581,392520928,614900610,-786817413,1016286404,-1264175533,758867073,1615479955,237679622,-768108950,-1539131577,-2130063589,1912010516,494750086,1336398417,-179950075,-1889123320,-26135537,-1937891685,2009132666,2081868904,1306496972,19864882,-744225137,1037001637,-1908874529,423750914,2043658609,21543190,-2126830022,698670235,-994422059,-1592284822,1307741933,-965690359,390850539,-396323643,-1532069709,575515772,1096338276,219130657,1993874732,-1425371040,-1707341117,-1754858829,157347321,-623825288,-2093023277,1556318106,-305805900,696547586,-1331097982,1873334195,1995606767,1077174234,1920422321,-442434037,-1783216053,-904797852,-1668919219,1297161374,954293313,-597435859,474454796,72408517,658452367,3140921,-1920468748,2113140006,965649721,-298492751,1049383920,-1788119910,-883303125,1697891815,1908618910,-374624960,1349489811,-455842518,-1185237959,151198282,-1425392978,1431268358,-1423341094,1761324089,1988340600,-1149473612,-709054397,-770307481,-1748706315,209861916,1537339183,545060564,322823364,1996811535,1789200508,841020275,1635119122,875565740,-883062334,211864106,-272305337,364416023,669856805,893081016,886128956,482008779,-1877978155,-1973318658,-1031340014,-1256086189,380285861,641632818,-631337584,-1057152535,-1031484781,1208254870,-738273183,288497104,1480548969,-2075405904,810367268,493777560,-243085165,-536776992,-669498250,1279400152,1141916680,-922427983,-803535423,-28253330,765043249,-1962078946,-1600651275,-2056857136,230874362,290989781,-791892894,1338868986,1307058941,175794192,-1960492640,936426042,386271652,-1390976345,15576267,601969691,1115266513,526822748,-555356783,-1553386096,-1002336598,597430116,1007883955,-1534026559,-959229116,-1373106115,1434390292,1865881582,-869583434,360408846,-1538544890,-1425016400,1922361302,-1759853392,-1129846248,-2008929105,601184540,2019541335,547083265,1146470621,-2095232746,65268844,1591607624,518824343,-1427892428,-1817320693,-864830496,-1802925712,1501665970,2048227577,-1540864320,1731582181,1736629597,1028831660,-361171523,-1987280249,-320008018,-35026843,-1566383297,1417969358,-922462511,-1247985006,1980827733,-941766459,-1448653591,-685231767,2019427206,1648747828,644915550,-91267732,-1235560027,-1733737974,1992522613,-51486976,668886109,-1134348836,-1919386801,1983907072,867047895,608596116,2130458390,-1338917610,-1367510866,994142343,1280542040,-1925643489,1240068495,-1549662639,385584794,1488038476,851461763,-2085190907,365854470,656530441,-404761101,550764271,421832664,-1770641691,1789363239,111242367,-654484870,-1959124989,-1013989798,-148426250,-943159965,-668341698,-634789188,233011187,-1484595272,1361475530,1583112830,-676470830,1408207199,-2070060686,1368055548,-1348529502,1470816746,749096550,-1234960864,414479011,-2116647047,-1066279757,1693785977,-1681767521,1096517124,-1629692602,-1409079442,-1287840401,-148011082,-1347370111,1968697931,-441166609,-1846254084,997339103,-1247260598,-1015939328,1243703338,-1748216553,-1986544603,-2077605454,1394668142,2065947370,-2121890857,-1481980666,-283041276,-532404525,-306558546,563501261,-1991423686,2071375245,1672674814,564609617,-1858744609,1674887089,-592368332,1144241229,-280224876,196055696,-1136672596,-397256754,1086643333,-105579290,-350081451,2131601101,-1178972880,-585528181,-671989851,-270957098,1719468655,-1928371445,944898672,-1251171789,500306788,1214823473,1348481963,574385837,-1255118495}
	for i = 1, #events do
		Trigger_Event(events[i], pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		Trigger_Event(events[i], pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		Trigger_Event(events[i], pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		Trigger_Event(events[i], pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423)
		Trigger_Event(events[i], pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		Trigger_Event(events[i], pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		Trigger_Event(events[i], pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		Trigger_Event(events[i], pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
	end
	return HANDLER_POP
end)
for i=0,#plyerCrashkick.feats do
	plyerCrashkick.feats[i]["hidden"] = NewDLC()
end
CamManip = menu.add_player_feature("Disable God Mode", "toggle", PlayerFeatParent, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	if player.is_player_god(pid) and player.is_player_valid(pid) then
		
		Trigger_Event_2(0xAD36AA57, pid, pid, 0x96EDB12F, math.random(0, 0x270F))
		
		system.yield(10)
	end
	system.yield(500)
	if not player.is_player_valid(pid) then
		feat["on"] = false
	end
	return HANDLER_CONTINUE
end)
for i=0,#CamManip.feats do
	CamManip.feats[i]["on"] = false
end

for i = 1, #missions do
	local y = #missions - 1
	menu.add_player_feature("Force to Mission" .. missions[i], "action", playerfeatVars.fm.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Trigger_Event(-283041276, pid, y)
	end)
end
function Send_Bounty(pid, value, isNpc)
	if value == nil then value = 10000 end
	if player.is_player_valid(pid) then
		for i = 0, 31 do
			-- local scid = player.get_player_scid(i)
			-- if (scid ~= -1 or scid ~= -1) then
			if player.is_player_valid(i) then
				Trigger_Event(1915499503, i, i, pid, 0, value, 0, isNpc, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1920255 + 9), script.get_global_i(1920255 + 10))
			end
		end
	end
end
function AddBounty(pid, value, anonymous)
	-- if not network.is_session_started() then return end
	local npc_bit = anonymous and 1 or 0
	for i = 0, 31 do
		if player.is_player_valid(i) then
			Trigger_Event(1915499503, i, i, pid, 1, value, 0, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1920255 + 9), script.get_global_i(1920255 + 10))
		end
		system.yield(10)	
	end
end
menu.add_player_feature("Anonymous Bounty", "toggle", BountyId.id, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] ~= AnonymousBounty then
		AnonymousBounty = feat.on
		local pf = menu.get_player_feature(feat.id)
		for i = 1, #pf.feats do
			if pf.feats[i]["on"] ~= AnonymousBounty then
				pf.feats[i]["on"] = AnonymousBounty
			end
		end
	end
	return HANDLER_POP
end)
menu.add_player_feature("Custom Value", "action", BountyId.id, function(feat, pid)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local r, s = input.get("Custom Bounty Value", "", 64, 3)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	local value = tonumber(s)
	value = math.max(0, value)
	value = math.min(10000, value)
	AddBounty(pid, value, AnonymousBounty)
end)
for i = 1, #BountyPresets do
	menu.add_player_feature("$" .. BountyPresets[i], "action", BountyId.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		AddBounty(pid, BountyPresets[i], AnonymousBounty)
	end)
end
end
griefing()
--INFO: Features
function playervehspd(pid, speed)
local plyveh = player.get_player_vehicle(pid)
entity.set_entity_max_speed(plyveh, speed)
network.request_control_of_entity(plyveh)
vehicle.modify_vehicle_top_speed(plyveh, speed)
entity.set_entity_max_speed(plyveh, speed)
end
function playvehspdboost(pid, reftime)
local plyveh
plyveh = player.get_player_vehicle(pid)
network.request_control_of_entity(plyveh)
vehicle.set_vehicle_rocket_boost_refill_time(plyveh, reftime)
end
--Options Toggles etc
global_func.lag_out = menu.add_feature("Find & Detonate Sub Missiles", "toggle", globalFeatures.moistopt,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
Settings["lag_out"] = true
if feat["on"] then
	local key = MenuKey()
	key:push_str("LCONTROL")
	key:push_str("LSHIFT")
	key:push_str("l")
	if key:is_down() then
		Missile_Destroy()
		system.yield(10)
		MK2_Missile_Destroy()
		Missile_Destroy()
		system.yield(10)
		MK2_Missile_Destroy()
		Missile_Destroy()
		system.yield(1200)
	end
	return HANDLER_CONTINUE
end
Settings["lag_out"] = false
return HANDLER_POP
end)
global_func.lag_out["on"] = Settings["lag_out"]
--INFO: World Features
global_func.no_traffic = menu.add_feature("No World Traffic", "value_i", globalFeatures.moistopt,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
Settings["no_traffic"] = true
if feat["on"] then
	vehicle.set_vehicle_density_multipliers_this_frame(tonumber(feat.value))
	return HANDLER_CONTINUE
end
Settings["no_traffic"] = false
return HANDLER_POP
end)
global_func.no_traffic["on"] = Settings["no_traffic"]
global_func.no_traffic["max"] = 600
global_func.no_traffic["min"] = 0
global_func.no_traffic["value"] = 0
global_func.no_peds = menu.add_feature("World Ped Density", "value_i", globalFeatures.moistopt,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
Settings["no_peds"] = true
if feat["on"] then
	ped.set_ped_density_multiplier_this_frame(tonumber(feat.value))
	return HANDLER_CONTINUE
end
Settings["no_peds"] = false
return HANDLER_POP
end)
global_func.no_peds["on"] = Settings["no_peds"]
global_func.no_peds["max"] = 600
global_func.no_peds["min"] = 0
global_func.no_peds["value"] = 0
--INFO: Self Features
HP_modifiers = {
{"Set max Health 0 (UnDead OTR)", 0},
{"Set Health to 500", 500},
{"Set Health to 10000", 1000},
{"Set Health Freemode Beast 2500", 2500},
{"Set Health BallisticArmour 2600", 2600},
{"Set Health to 10000", 10000},
{"Set Health to 90000", 90000},
{"Set Health to 328 (lvl 120)", 328},
}
globalFeatures.self_ped_modify = menu.add_feature("Health Modifiers", "parent", globalFeatures.self_ped).id
globalFeatures.self_ped_modalify = menu.add_feature("Ped Model Modifiers", "parent", globalFeatures.self_ped).id
for i = 1, #HP_modifiers do
menu.add_feature("set: " .. HP_modifiers[i][1], "action", globalFeatures.self_ped_modify,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	chp0 = ped.get_ped_max_health(player.get_player_ped(player.player_id()))
	ped.set_ped_max_health(player.get_player_ped(player.player_id()), HP_modifiers[i][2])
	chp1 = ped.get_ped_max_health(player.get_player_ped(player.player_id()))
	if chp1 ~= 0 then
		ped.set_ped_health(player.get_player_ped(player.player_id()), HP_modifiers[i][2])
		else
	end
	moist_notify(string.format("Max Health Now: " .. chp1 .. "From: " .. chp0, "Max Health Modified"))
	return HANDLER_POP
end)
end
Modals = {}
Modals[1] = Ped_modals_a
Modals[2] = Ped_modals_c
Modals[3] = Ped_modals_g
Modals[4] = Ped_modals_h
Modals[5] = Ped_modals_i
Modals[6] = Ped_modals_m
Modals[7] = Ped_modals_p
Modals[8] = Ped_modals_s
Modals[9] = Ped_modals_u
model_set = Modals[1]
PedModifyList = menu.add_feature("Modals:", "autoaction_value_str", globalFeatures.self_ped_modalify,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
model_set = Modals[feat.value + 1]
PedModify:set_str_data(Modals[feat.value + 1])
end)
PedModifyList:set_str_data({"a_c_ a_f_ a_m_", "csb_ cs_", "g_f_ g_m_", "hc_", "ig_", "mp_", "player_", "s_f_ s_m_", "u_f_u_m"})
PedModify = menu.add_feature("set: ", "action_value_str", globalFeatures.self_ped_modalify,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local model = gameplay.get_hash_key(model_set[feat.value + 1])
streaming.request_model(model)
while (not streaming.has_model_loaded(model)) do
	system.wait(0)
end
player.set_player_model(model)
streaming.set_model_as_no_longer_needed(model)
moist_notify(string.format("Your Ped Model is now Set: " .. model_set[feat.value + 1]), "Moists Ped Modifier")
return HANDLER_POP
end)
PedModify:set_str_data(model_set)
--INFO: Combat Features
local Veh_Wep = {"vehicle_weapon_player_bullet", "vehicle_weapon_player_lazer", "weapon_airstrike_rocket", "vehicle_weapon_space_rocket", "vehicle_weapon_plane_rocket", "vehicle_weapon_trailer_missile", "vehicle_weapon_tampa_mortar", "vehicle_weapon_akula_missile", "vehicle_weapon_akula_barrage", "vehicle_weapon_avenger_cannon",}
Veh_WepL = {}
function VehWeapLabel()
for i = 1, #Veh_Wep do
	local text = Veh_Wep[i]
	local separator = text:find("_", 1, true)
	if separator then
		local label = text:sub(1, separator - 1)
		local value = text:sub(separator + 1)
		local separator = value:find("_", 1, true)
		if separator then
			local label = value:sub(1, separator - 1)
			local value = value:sub(separator + 1)
			Veh_WepL[#Veh_WepL+1] = value
		end
	end
end
end
VehWeapLabel()
globalFeatures.self_combat_Ped = menu.add_feature("Player Combat", "parent", globalFeatures.self_ped_combat).id
selfveh = menu.add_feature("Vehicle Combat", "parent", globalFeatures.self_ped_combat)
globalFeatures.self_ped_combat_POI = menu.add_feature("WayPoint Strike", "parent", globalFeatures.self_combat_Ped).id
bullet_speed = 0 
local vehposxx = 0.0
local vehposyy = 0.0
local vehposxxx = 0.0
local vehposyyy = 0.0
reset_values = menu.add_feature("Reset Speed & Pos Values", "action", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
bullet_speed = 0
vehwep_speed["value"] = 1000
end)
vehwep_speed = menu.add_feature("Speed of fire", "autoaction_value_i", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
bullet_speed = tonumber(feat.value)
end)
vehwep_speed["max"] = 100000
vehwep_speed["min"] = 100
vehwep_speed["mod"] = 10
vehwep_speed["value"] = 1000
vehposx = menu.add_feature("2.vehpos x", "autoaction_value_i", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local x = tonumber(feat.value)
vehposxx =	x / 5
end)
vehposx["max"] = 100000
vehposx["min"] =  -100000
vehposx["mod"] = 1
vehposx["value"] = 0
vehposy = menu.add_feature("2.vehpos y", "autoaction_value_i", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local y = tonumber(feat.value)
vehposyy =	y / 5
end)
vehposy["max"] = 100000
vehposy["min"] =  -100000
vehposy["mod"] = 1
vehposy["value"] = 0
vehposx = menu.add_feature("3.vehpos x", "autoaction_value_i", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local x = tonumber(feat.value)
vehposxxx =	x / 5
end)
vehposx["max"] = 100000
vehposx["min"] =  -100000
vehposx["mod"] = 1
vehposx["value"] = 0
vehposy = menu.add_feature("3.vehpos y", "autoaction_value_i", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local y = tonumber(feat.value)
vehposyyy =	y / 5
end)
vehposy["max"] = 100000
vehposy["min"] =  -100000
vehposy["mod"] = 1
vehposy["value"] = 0
menu.add_feature("Add Weapon Fire:", "action", selfveh.id, nil)
jett_weapon = menu.add_feature("1:[CAM_POS]: ", "value_str", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])	
local pid = player.player_id()
local pped = player.get_player_ped(pid)
local veh = ped.get_vehicle_ped_is_using(pped)
if feat["on"] then
	controls.disable_control_action(1, 114, true)
	if not controls.is_disabled_control_pressed(1, 114) then
		return HANDLER_CONTINUE
	end
	entity.get_entity_coords(ped.get_vehicle_ped_is_using(pped))
	local head = entity.get_entity_heading(ped.get_vehicle_ped_is_using(pped))		
	local dir = player.get_player_heading(pid)		
	local rot = entity.get_entity_rotation(veh)
	local camrot = cam.get_gameplay_cam_rot()
	local campos = cam.get_gameplay_cam_pos()
	local campitch = cam.get_gameplay_cam_relative_pitch()		
	-- local cam yaw = cam.get_gameplay_cam_relative_yaw()
	local vehpos = v3()
	vehpos = entity.get_entity_coords(veh)
	vehpos.z = vehpos.z - 5
	local veh_pos = v3()
	veh_pos = vehpos * 2
	local player_id = player.player_id()	
	local player_ped = player.get_player_ped(player_id)
	local pos = player.get_player_coords(player_id)
	local pos2 = pos
	pos2.z = pos.z -10
	local rot = entity.get_entity_rotation(player_ped)
	local dir = rot
	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	local dir = rot
	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	local camdir = camrot
	camdir:transformRotToDir()
	camdir = camdir * 4
	campos = campos + camdir
	gameplay.shoot_single_bullet_between_coords(campos, pos, 1000000, hash, pped, true, false, bullet_speed)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end) 
jett_weapon["on"] = false 
jett_weapon:set_str_data(Veh_WepL)
jet_weaponn = menu.add_feature("2: ", "value_str", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local pid = player.player_id()
local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])
local pped = player.get_player_ped(pid)
local veh = ped.get_vehicle_ped_is_using(pped)
if feat["on"] then
	controls.disable_control_action(1, 114, true)
	if not controls.is_disabled_control_pressed(1, 114) then
		return HANDLER_CONTINUE
	end
	-- if controls.is_control_pressed(1, 114) then
	entity.get_entity_coords(ped.get_vehicle_ped_is_using(pped))
	local head = entity.get_entity_heading(ped.get_vehicle_ped_is_using(pped))
	local dir = player.get_player_heading(pid)
	local rot = entity.get_entity_rotation(veh)
	local vehpos = v3()
	vehpos = entity.get_entity_coords(veh)
	vehpos.x = vehpos.x + vehposxxx
	vehpos.y = vehpos.y + vehposyyy
	vehpos.z = vehpos.z - 1.1
	local veh_pos = v3()
	veh_pos = vehpos * 2
	local player_id = player.player_id()
	local player_ped = player.get_player_ped(player_id)
	local pos = player.get_player_coords(player_id)
	local pos2 = pos
	pos2.z = pos.z -10
	local rot = entity.get_entity_rotation(player_ped)
	local dir = rot
	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	gameplay.shoot_single_bullet_between_coords(vehpos, pos, 1000000, hash, pped, true, false, bullet_speed)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
jet_weaponn["on"] = false
jet_weaponn:set_str_data(Veh_WepL)
jet_weapon = menu.add_feature("3: ", "value_str", selfveh.id, function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local pid = player.player_id()
local pped = player.get_player_ped(pid)
local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])	
local veh = ped.get_vehicle_ped_is_using(pped)
if feat["on"] then
	controls.disable_control_action(1, 114, true)
	if not controls.is_disabled_control_pressed(1, 114) then
		return HANDLER_CONTINUE
	end
	-- if controls.is_control_pressed(1, 114) then
	entity.get_entity_coords(ped.get_vehicle_ped_is_using(pped))
	local head = entity.get_entity_heading(ped.get_vehicle_ped_is_using(pped))
	local dir = player.get_player_heading(pid)
	local rot = entity.get_entity_rotation(veh)
	local vehpos = v3()
	vehpos = entity.get_entity_coords(veh)
	vehpos.x = vehpos.x + vehposxx
	vehpos.y = vehpos.y + vehposyy
	vehpos.z = vehpos.z - 1.1
	local veh_pos = v3()
	veh_pos = vehpos * 2
	local player_id = player.player_id()
	local player_ped = player.get_player_ped(player_id)
	local pos = player.get_player_coords(player_id)
	local pos2 = pos
	pos2.z = pos.z -10
	local rot = entity.get_entity_rotation(player_ped)
	local dir = ro
	local dir = rot
	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	gameplay.shoot_single_bullet_between_coords(vehpos, pos, 1000000, hash, pped, true, false, bullet_speed)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
jet_weapon["on"] = false
jet_weapon:set_str_data(Veh_WepL)
local BlameMe, StrikeSpeed = 0, 1000.00
Blame_Me = menu.add_feature("Blame Strike on Me!", "toggle", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat["on"] then
	BlameMe = player.get_player_ped(player.player_id())
end
if not feat["on"] then
	BlameMe = 0
	return HANDLER_POP
end
end)
Blame_Me["on"] = false
Strike_Modif_step = menu.add_feature("Step Modifier: ", "autoaction_value_f", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
Strike_projSpeed["mod"] = feat.value
dam_multi["mod"] = feat.value
end)
Strike_Modif_step["max"] = 1000.000
Strike_Modif_step["min"] = 0.10
Strike_Modif_step["value"] = 1.00
Strike_Modif_step["mod"] = 5.00
Strike_projSpeed = menu.add_feature("Projectiles Speed: ", "autoaction_value_f", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
StrikeSpeed = feat.value
end)
Strike_projSpeed["max"] = 100000.000
Strike_projSpeed["min"] = 100.00
Strike_projSpeed["value"] = 1000.250
Strike_projSpeed["mod"] = 0.25
Waypoint_Air_Strike1 = menu.add_feature("Entitybase for Hills", "action_value_str", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(), v3(), v2(), 0
offset = player.get_player_coords(player.player_id())
pos = ui.get_waypoint_coord()
if pos.x and pos.y then
	coord.x = pos.x
	coord.y = pos.y
	coord.z = offset.z
end
streaming.request_model(3040635986)
while (not streaming.has_model_loaded(3040635986)) do
	system.wait(10)
end
local P_O_S = v3()
ground_test = vehicle.create_vehicle(3040635986, player.get_player_coords(player.player_id()), 0.0, true, true)
entity.set_entity_alpha(ground_test, 0, true)
vehicle.set_vehicle_on_ground_properly(ground_test)
entity.freeze_entity(ground_test, true)
entity.set_entity_coords_no_offset(ground_test, coord)
vehicle.set_vehicle_on_ground_properly(ground_test)
system.wait(10)
P_O_S = entity.get_entity_coords(ground_test)
system.wait(1)
b, z = gameplay.get_ground_z(P_O_S)
streaming.set_model_as_no_longer_needed(3040635986)
entity.delete_entity(ground_test)
local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
Pos.x = pos.x
Pos.y = pos.y
Pos.z = z + 225.0
repeat
	num = num + 1
	Coord.x = pos.x
	Coord.y = pos.y
	Coord.z = z
	Coord.x = Coord.x + math.random(-5.0, 10.0)
	Coord.y = Coord.y + math.random(-5.0, 10.0)
	gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
	system.wait(1)
	Coord.x = pos.x
	Coord.y = pos.y
	Coord.x = Coord.x + math.random(-5.0, 10.0)
	Coord.y = Coord.y + math.random(-5.0, 10.0)
	gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
	system.wait(1)
	Coord.x = pos.x
	Coord.y = pos.y
	Coord.x = Coord.x + math.random(-5.0, 10.0)
	Coord.y = Coord.y + math.random(-5.0, 10.0)
	gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
	system.wait(1)
until num == 20
-- system.wait(50)
end)
Waypoint_Air_Strike1:set_str_data(StrikeGive_label)
Waypoint_Air_Strike2 = menu.add_feature("Lower to Ground", "action_value_str", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(), v3(), v2(), 0
pos = ui.get_waypoint_coord()
if pos.x and pos.y then
	coord.x = pos.x
	coord.y = pos.y
	coord.z = 1000.0
	b, coord.z = gameplay.get_ground_z(coord)
	local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
	offset.x = 0.0
	offset.y = 0.0
	offset.z = coord.z
	Pos.x = pos.x + 10.0
	Pos.y = pos.y + 10.0
	Pos.z = coord.z + 25.0
	repeat
		num = num + 1
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = coord.z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = coord.z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = coord.z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
	until num == 20
end
-- system.wait(50)
end)
Waypoint_Air_Strike2:set_str_data(StrikeGive_label)
Waypoint_Air_Strike3 = menu.add_feature("inverted", "action_value_str", globalFeatures.self_ped_combat_POI,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(), v3(), v2(), 0
pos = ui.get_waypoint_coord()
if pos.x and pos.y then
	coord.x = pos.x
	coord.y = pos.y
	coord.z = -100.0
	b, z = gameplay.get_ground_z(v3(pos.x, pos.y, 100.00))
	--print(z)
	local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
	offset.x = 0.0
	offset.y = 0.0
	offset.z = Coord.z
	Pos.x = pos.x + 10.0
	Pos.y = pos.y + 10.0
	Pos.z = Coord.z + 25.0
	repeat
		num = num + 1
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = coord.z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
		Coord.x = pos.x
		Coord.y = pos.y
		Coord.z = coord.z
		Coord.x = Coord.x + math.random(-15.0, 30.0)
		Coord.y = Coord.y + math.random(-15.0, 30.0)
		gameplay.shoot_single_bullet_between_coords(Pos, Coord, 10000.00, hash, BlameMe, true, false,
		StrikeSpeed)
		system.wait(1)
	until num == 20
end
-- system.wait(50)
end)
Waypoint_Air_Strike3:set_str_data(StrikeGive_label)
Grenade_Strike = menu.add_feature("grenadelauncher Waypoint", "action", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(1.00, 0.50, 2.5), v3(), v2(), 0
local hash = gameplay.get_hash_key("WEAPON_GRENADELAUNCHER")
pos = ui.get_waypoint_coord()
if pos.x and pos.y then
	coord.x = pos.x
	coord.y = pos.y
	coord.z = 100.0
	b, coord.z = gameplay.get_ground_z(coord)
	Pos.x = coord.x
	Pos.y = coord.y
	Pos.z = coord.z + 25.0
	repeat
		num = num + 1
		gameplay.shoot_single_bullet_between_coords(Pos, coord, 100000.00, hash, BlameMe, true, false, 10000.00)
		system.wait(100)
	until num == 6
	--	system.wait(50)
end
end)
damage = 200
dam_multi = menu.add_feature("unfair aim Damage", "autoaction_value_i", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
damage = feat.value
--print(damage)
end)
dam_multi["max"] = 10000
dam_multi["min"] = 0
dam_multi["value"] = 400
dam_multi["mod"] = 10
local notify_sent = false
local aimhash, aimd, pped
unfair_aimbot = menu.add_feature("unfair aim Ped Head shot", "value_str", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat["on"] then
	local offset, offset2 = v3(0.0, 0.0, 0.0), v3(0.0, 0.0, 2.8)
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		aimhash = gameplay.get_hash_key(ssb_wep[feat.value + 1])
		aimd = player.get_entity_player_is_aiming_at(player.player_id())
		if entity.is_entity_a_ped(aimd) then
			-- ped.get_ped_bone_index(aimd, 31086)
			local bonebool, pos = ped.get_ped_bone_coords(pped, 6286, offset)
			local bonebool2, pos2 = ped.get_ped_bone_coords(aimd, 12844, offset)
			--print(pos)
			--print(pos2)
			gameplay.shoot_single_bullet_between_coords(pos + offset2, pos2, damage, aimhash, pped, true, false, 10000.00)
		end
	end
	--	system.yield(0)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
unfair_aimbot:set_str_data(ssb_wep_label)
unfair_aimbot2 = menu.add_feature("unfair aim Ped Head shot Stungun", "toggle", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat["on"] then
	local offset, offset2 = v3(0.0, 0.0, 0.0), v3(0.0, 0.0, 2.8)
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		aimhash = gameplay.get_hash_key("WEAPON_STUNGUN_MP")
		aimd = player.get_entity_player_is_aiming_at(player.player_id())
		if entity.is_entity_a_ped(aimd) then
			-- ped.get_ped_bone_index(aimd, 31086)
			local bonebool, pos = ped.get_ped_bone_coords(pped, 6286, offset)
			local bonebool2, pos2 = ped.get_ped_bone_coords(aimd, 12844, offset)
			--print(pos)
			--print(pos2)
			gameplay.shoot_single_bullet_between_coords(pos2 + offset2, pos2, damage, aimhash, pped, true, false, 10000.00)
		end
	end
	--	system.yield(0)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
local pos, ImpactPos, BonePos = v3(), v3(), v3()
weapon_impact_pos = menu.add_feature("Get last Weapon impact POS", "toggle", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
while feat["on"] do
	local pped = player.get_player_ped(player.player_id())
	local success, pos = ped.get_ped_last_weapon_impact(pped, v3())
	if success then
		ImpactPos = pos
		-- moist_notify(string.format("Impact POS: " .. "%s, %s, %s", pos.x, pos.y, pos.z))
		--print(ImpactPos.x .. ", " .. ImpactPos.y .. ", " .. ImpactPos.z)
		else
	end
	system.yield(0)
end
end)
weapon_impact_pos["on"] = false
impact_orbstrike = menu.add_feature("Impact Orbital Strike", "toggle", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
while feat["on"] do
	weapon_impact_pos["on"] = true
	myped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(myped) and ImpactPos ~= v3(0.0,0.0,0.0) then
		system.yield(15)
		local pos, exp_pos = v3(), v3()
		pos = ImpactPos
		offset = v3(0.0,0.0,-2000.00)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.wait(0)
		end
		native.call(0x2F844A8B08D76685, "DLC_CHRISTMAS2017/XM_ION_CANNON", false, -1)
		--gameplay.set_override_weather(3)
		--gameplay.clear_cloud_hat()
		fire.add_explosion(pos, 59, true, false, 1.5, myped)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		fire.add_explosion(pos, 62, true, false, 2.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos + offset, 59, true, false, 1.0, myped)
		-- exp_pos.x = math.random(-2700, 2700)
		-- exp_pos.y = math.random(-3300, 7500)
		-- exp_pos.z = math.random(30, 90)
		-- fire.add_explosion(exp_pos, 74, true, false, 0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.50, false, false, true)
		script.get_global_i(1964177)
		audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, "0", true, 1000, false)
		-- graphics.set_next_ptfx_asset("scr_xm_orbital")
		-- while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
		-- graphics.request_named_ptfx_asset("scr_xm_orbital")
		-- system.wait(0)
		-- end
		gameplay.set_override_weather(3)
		gameplay.clear_cloud_hat()
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		fire.add_explosion(pos, 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + offset, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.75, false, false, true)
		-- graphics.set_next_ptfx_asset("scr_xm_orbital")
		-- while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
		-- graphics.request_named_ptfx_asset("scr_xm_orbital")
		-- system.wait(0)
		-- end
		audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, "0", true, 10000, false)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.80, false, false, true)
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		fire.add_explosion(pos, 60, true, false, 1.8, myped)
		fire.add_explosion(pos, 62, true, false, 2.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		--fire.start_entity_fire(pped)
		system.yield(15)
		ImpactPos = v3(0.0,0.0,0.0)
		pos = v3(0.0,0.0,0.0)
	end
	system.yield(0)
end
weapon_impact_pos["on"] = false
return HANDLER_POP
end)
impact_orbstrike["on"] = false
impact_strike = menu.add_feature("Weapon Strike v1", "value_str", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat["on"] then
	weapon_impact_pos["on"] = true
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		--		system.yield(10)
		local posm = v3()
		posm = player.get_player_coords(player.player_id())
		posm.z = posm.z + 100
		local hash = gameplay.get_hash_key(ssb_wep[feat.value + 1])
		pos_off = v3()
		pos_off.x = pos.x + math.random(1, 5)
		pos_off.y = pos.y + math.random(1, 8)
		local playerz, zPos = gameplay.get_ground_z(pos)
		pos_off.z = zPos
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 1000.00, hash, BlameMe, true, false, StrikeSpeed)
		system.yield(10)
		ImpactPos.x = ImpactPos.x + 5
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
		system.yield(10)
		ImpactPos.y = ImpactPos.y - 5
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
		system.yield(10)
		ImpactPos.x = ImpactPos.x - 10
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
		system.yield(10)
		ImpactPos.y = ImpactPos.y + 10
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, StrikeSpeed)
	end
	return HANDLER_CONTINUE
end
weapon_impact_pos["on"] = false
return HANDLER_POP
end)
impact_strike:set_str_data(ssb_wep_label)
impact_strike["on"] = false
impact_strike = menu.add_feature("Weapon Strike v2", "value_str", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
weapon_impact_pos["on"] = true
if feat["on"] then
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		--		system.wait(100)
		local posm = v3()
		posm = player.get_player_coords(player.player_id())
		posm.z = posm.z + 100
		local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
		pos_off = v3()
		pos_off.x = pos.x + math.random(1, 5)
		pos_off.y = pos.y + math.random(1, 8)
		local playerz, zPos = gameplay.get_ground_z(pos)
		pos_off.z = zPos
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 1000.00, hash, BlameMe, true, false, 10000.0)
		system.wait(100)
		ImpactPos.x = ImpactPos.x + 5
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, 10000.0)
		system.wait(100)
		ImpactPos.y = ImpactPos.y - 5
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, 10000.0)
		system.wait(100)
		ImpactPos.x = ImpactPos.x - 10
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, 10000.0)
		system.wait(100)
		ImpactPos.y = ImpactPos.y + 10
		gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false, 10000.0)
		system.wait(100)
		--  system.yield(Settings["loop_feat_delay"])
	end
	return HANDLER_CONTINUE
end
weapon_impact_pos["on"] = false
return HANDLER_POP
end)
impact_strike:set_str_data(StrikeGive_label)
impact_strike2 = menu.add_feature("Second Weapon Fire v1:", "value_str", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
if feat["on"] then
	weapon_impact_pos["on"] = true
	local hash = gameplay.get_hash_key(ssb_wep[feat.value + 1])
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		--print("ped shooting")
		--	system.wait(100)
		offset = v3()
		-- offset = v3(0.0,0.0,0.0)
		local bonebool, pos = ped.get_ped_bone_coords(pped, 58866, offset)
		--print(string.format("Ped Bone pos: " .. "%s, %s, %s", pos.x, pos.y, pos.z))
		gameplay.shoot_single_bullet_between_coords(pos + BonePos, ImpactPos, 10000.00, hash, player.get_player_ped(player.player_id()), true, false, 100000.0)
	end
	return HANDLER_CONTINUE
end
weapon_impact_pos["on"] = false
return HANDLER_POP
end)
impact_strike2:set_str_data(ssb_wep_label)
impact_strike2["on"] = false
impact_strike3 = menu.add_feature("Second Weapon Fire v2:", "value_str", globalFeatures.self_combat_Ped,function(feat)
if type(feat) == "number" then
	return HANDLER_POP
end
weapon_impact_pos["on"] = true
if feat["on"] then
	local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
	pped = player.get_player_ped(player.player_id())
	if ped.is_ped_shooting(pped) then
		--	offset = v3(0.0,0.0,0.0)
		offset = v3()
		--	system.wait(100)
		local bonebool, pos = ped.get_ped_bone_coords(pped, 57005, offset)
		gameplay.shoot_single_bullet_between_coords(pos + BonePos, ImpactPos, 10000.00, hash, pped, true, false,
		100000.0)
		-- system.yield(Settings["loop_feat_delay"])
	end
	return HANDLER_CONTINUE
end
weapon_impact_pos["on"] = false
return HANDLER_POP
end)
impact_strike3:set_str_data(StrikeGive_label)
aim_strike = menu.add_feature("Air strike aim entity (D pad R)", "toggle", globalFeatures.self_combat_Ped,
function(feat)
	if feat["on"] then
		if controls.is_control_pressed(6, 54) then
			local hash
			pped = player.get_player_ped(player.player_id())
			local target = player.get_entity_player_is_aiming_at(player.player_id())
			local pos, posz, posm = v3(), v3(), v3()
			pos = entity.get_entity_coords(target)
			posz, pos.z = gameplay.get_ground_z(pos)
			posm = v3()
			posm = player.get_player_coords(player.player_id())
			posm.z = posm.z + 100
			hash = gameplay.get_hash_key("weapon_airstrike_rocket")
			pos_off = v3()
			pos_off.x = pos.x + math.random(1, 5)
			pos_off.y = pos.y + math.random(1, 8)
			playerz, zPos = gameplay.get_ground_z(pos)
			pos_off.z = zPos
			gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pped, true, false, 10000.0)
			system.wait(100)
			pos.x = pos.x + 5
			gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pped, true, false, 10000.0)
			system.wait(100)
			pos.y = pos.y - 5
			gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pped, true, false, 10000.0)
			system.wait(100)
		end
		--	system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
aim_strike["on"] = false
--INFO: Ragdoll Control
function MoistsRagdollControl()
	Ragdoll_Sel = 0
	ragdolltyp = {{"Normal ragdoll", 0}, {"Falls with stiff legs/body", 1}, {"Narrow leg stumble(may not fall)", 2}, {"Wide leg stumble(may not fall)", 3}}
	Ragdoll_Control = menu.add_feature("Moists RagDoll Control", "parent", globalFeatures.self_ped).id
	Ragdoll_set = menu.add_feature("Set Ragdoll Type", "action_value_i", Ragdoll_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Ragdoll_Sel = ragdolltyp[feat.value][2]
		moist_notify("Ragdoll Type Set to: " .. ragdolltyp[feat.value][2] .. "\n(" .. ragdolltyp[feat.value][1] .. ")", "Moists Ragdoll Control")
	end)
	Ragdoll_set["max"] = #ragdolltyp
	Ragdoll_set["min"] = 1
	Ragdoll_set["value"] = 1
	function Ragdoll0_3(feat)
		Number1, Number2, Number3, Number4, Number5 = 1900, 2000, 2000, 3000, 99999
		pped = player.get_player_ped(player.player_id())
		ped.set_ped_to_ragdoll(pped, Number1, Number5, 0)
		pped = player.get_player_ped(player.player_id())
		ped.set_ped_to_ragdoll(pped, Number5, Number5, Ragdoll_Sel)
		entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 1, 12, 20, 10.5, 31, 12.1, 10.3, true,
		true)
	end
	function RagdollButton(feat)
		Number1, Number2, Number3, Number4 = 1900, 2000, 2000, 3000
		entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 4, 10.0, 0.0, 10.0, 3.0, 0.0, 10.3,
		true, true)
		pped = player.get_player_ped(player.player_id())
		ped.set_ped_to_ragdoll(pped, Number1, Number2, 0)
		entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 4, 2, 0, 0.8, 3, 2.1, 10.3, false, true)
		pped = player.get_player_ped(player.player_id())
		ped.set_ped_to_ragdoll(pped, Number3, Number4, Ragdoll_Sel)
		-- end
		return HANDLER_POP
	end
	function RagdollButtontoggle(feat)
		while (feat.on) do
			Number1, Number2, Number3, Number4 = 1900, 2000, 2000, 3000
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number1, Number2, 3)
			entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 5, 2, 2, 5.8, 3, 2.1, 10.3, true,
			true)
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number3, Number4, Ragdoll_Sel)
			-- end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end
	function Ragdolltoggle(feat)
		while (feat.on) do
			Number1, Number2, Number3, Number4, Number5 = 1900, 2000, 2000, 3000, 99999
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number1, Number2, Ragdoll_Sel)
			system.wait(100)
			entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 1, 2, 0, 0.8, 3, 2.1, 10.3, true,
			false)
			system.wait(100)
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number3, Number4, Ragdoll_Sel)
			system.wait(100)
			entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 1, 2, 0, 0.8, 3, 2.1, 10.3, true,
			false)
			system.wait(100)
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number4, Number5, Ragdoll_Sel)
			system.wait(100)
			-- end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end
	function Ragdolltoggle1(feat)
		while (feat.on) do
			Number1, Number2, Number3, Number4, Number5 = 1900, 2000, 2000, 3000, 99999
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number1, Number2, Ragdoll_Sel)
			-- system.wait(100)
			-- entity.apply_force_to_entity(pped, 4, 2,0, 0.8, 3, 2.1, 10.3, true, false)
			-- system.wait(100)
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number3, Number4, Ragdoll_Sel)
			-- system.wait(100)
			-- entity.apply_force_to_entity(pped, 4, 2,0, 0.8, 3, 2.1, 10.3, true, false)
			-- system.wait(100)
			pped = player.get_player_ped(player.player_id())
			ped.set_ped_to_ragdoll(pped, Number4, Number5, Ragdoll_Sel)
			-- system.wait(100)
			-- end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end
	ragdoll_key = menu.add_feature("Ragdoll HotKey LCTRL+X ", "toggle", Ragdoll_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["RagDollHotKey"] = true
		if feat["on"] then
			local key = MenuKey()
			key:push_str("LCONTROL")
			key:push_str("x")
			if key:is_down() then
				rag_self["on"] = not rag_self.on
				moist_notify("Ragdoll Set for your Ped = " .. tostring(rag_self.on), "Moists Ragdoll Control\nMoist Script 2.0.6.8")
				system.wait(1200)
			end
			return HANDLER_CONTINUE
		end
		Settings["RagDollHotKey"] = false
		return HANDLER_POP
	end)
	ragdoll_key["on"] = Settings["RagDollHotKey"]
	set_rag_self = menu.add_feature("Set Self to Ragdoll", "action", Ragdoll_Control, RagdollButton)
	tw2rag_self = menu.add_feature("Set Ragdoll", "toggle", Ragdoll_Control, Ragdolltoggle1)
	force_rag_self = menu.add_feature("Set Ragdoll Apply force", "action", Ragdoll_Control, Ragdoll0_3)
	twrag_self = menu.add_feature("Twitching Ragdoll", "toggle", Ragdoll_Control, RagdollButtontoggle)
	tw1rag_self = menu.add_feature("Twitching Ragdoll v1", "toggle", Ragdoll_Control, Ragdolltoggle)
	rag_self = menu.add_feature("Lifeless Ragdoll(Hotkey Preset)", "toggle", Ragdoll_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(player.player_id())
		local Number1, Number2, Number3, Number4 = 1900, 2000, 2000, 3000
		while feat["on"] do
			ped.set_ped_to_ragdoll(pped, Number1, Number2, 0)
			entity.apply_force_to_entity(pped, 4, 2, 0, 0.8, 3, 2.1, 10.3, false, true)
			ped.set_ped_to_ragdoll(pped, Number3, Number4, 4)
			system.yield(0)	
		end
		return HANDLER_POP
	end)
	rag_self["on"] = false
end
MoistsRagdollControl()
--INFO: player ped options
function self_func()
	function updatedecals()
		drawable_feature["value"] = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), 10)
		texture_feature["value"] = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), 10)
		drawable_feature["max"] = ped.get_number_of_ped_drawable_variations(player.get_player_ped(player.player_id()), 10)
		texture_feature["max"] = ped.get_number_of_ped_texture_variations(player.get_player_ped(player.player_id()), 10, drawable_feature.value)
	end
	outfitshit =  menu.add_feature("Outfit Related Shit", "parent", globalFeatures.self,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		updatedecals()
	end).id
	Decals = menu.add_feature("Outfit Decal Overlays", "parent", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		updatedecals()
	end).id
	drawable_feature = menu.add_feature("Decal Drawable ID", "autoaction_value_i", Decals, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped = player.get_player_ped(player.player_id())
		local peddrawable
		local pedtexture
		peddrawable = ped.get_ped_drawable_variation(pped, 10)
		pedtexture = ped.get_ped_texture_variation(pped, 10)
		ped.set_ped_component_variation(pped, 10, drawable_feature.value, pedtexture, 0)
		texture_feature["max"] = ped.get_number_of_ped_texture_variations(player.get_player_ped(player.player_id()), 10, drawable_feature.value)
		return HANDLER_POP
	end)
	drawable_feature["max"] = 1
	drawable_feature["min"] = 0
	drawable_feature["value"] = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), 10)
	texture_feature = menu.add_feature("Decal Texture ID", "autoaction_value_i", Decals,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end 
		local pped = player.get_player_ped(player.player_id())
		local peddrawable
		local pedtexture
		peddrawable = ped.get_ped_drawable_variation(pped, 10)
		ped.set_ped_component_variation(pped, 10, peddrawable, texture_feature.value, 0)
		return HANDLER_POP
	end)
	texture_feature["max"] = 1
	texture_feature["min"] = 0
	texture_feature["value"] = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), 10)
	menu.add_feature("give self glowstick", "action", globalFeatures.self_ped,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos, offset, rot = v3(), v3(), v3()
		offset.x = 0.12
		offset.y = 0.0
		offset.z = -0.26
		rot.x = -181.0
		rot.y = 0.0
		rot.z = 0.0
		bone = ped.get_ped_bone_index(player.get_player_ped(player.player_id()), 18905)
		spawned_cunts[#spawned_cunts + 1] = object.create_object(3324004640, pos, true, false)
		entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], player.get_player_ped(player.player_id()), bone,
		offset, rot, true, false, true, 0, true)
	end)
	--Handcuffs female 25 male 41
	global_func.self = menu.add_feature("Put Handcuffs on Self", "action", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(player.player_id())
		if player.is_player_female(player.player_id()) then
			if ped.get_ped_drawable_variation(pped, 7) == 25 then
				ped.set_ped_component_variation(pped, 7, 0, 0, 0)
				else
				ped.set_ped_component_variation(pped, 7, 25, 0, 0)
			end
			elseif not player.is_player_female(player.player_id()) then
			if ped.get_ped_drawable_variation(pped, 7) == 41 then
				ped.set_ped_component_variation(pped, 7, 0, 0, 0)
				else
				ped.set_ped_component_variation(pped, 7, 41, 0, 0)
			end
		end
	end)
	global_func.self = menu.add_feature("Set Handcuffs Locked Position", "action", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(player.player_id())
		if player.is_player_female(player.player_id()) then
			ped.set_ped_component_variation(pped, 7, 25, 0, 0)
			weapon.give_delayed_weapon_to_ped(pped, 0xD04C944D, 0, 1)
			elseif not player.is_player_female(player.player_id()) then
			ped.set_ped_component_variation(pped, 7, 41, 0, 0)
			weapon.give_delayed_weapon_to_ped(pped, 0xD04C944D, 0, 1)
		end
	end)
	global_func.self = menu.add_feature("White Team parachute Pack", "action", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(player.player_id())
		ped.get_ped_drawable_variation(pped, 5)
		ped.set_ped_component_variation(pped, 5, 58, 8, 0)
	end)
	--INFO: Self Options
	local Self_FakeBounty = menu.add_feature("Set Fake Bounty on Self", "toggle", globalFeatures.self_options,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			if script.get_global_i(1835502 + (1 + (player.player_id() * 3)) + 4) == 1 then
				system.yield(100)
				script.set_global_i(1835502 + (1 + (player.player_id() * 3)) + 4, -1)
				system.yield(100)
			end
			return HANDLER_POP
		end
		script.set_global_i(1835502 + (1 + (player.player_id() * 3)) + 4,  1)
		system.yield(100)
		return HANDLER_CONTINUE
	end)
	local ewo_key = menu.add_feature("Self Suicide EWO", "toggle", globalFeatures.self_options,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["EWO_TRYHARD"] = true
		if feat["on"] then
			local pos = v3()
			local key = MenuKey()
			key:push_str("LALT")
			if key:is_down() then
				key:push_str("x")
				if key:is_down() then
					ui.notify_above_map("Suicide EWO", "KYS TRYHARD WANNABE!", 75)
					pped = player.get_player_ped(player.player_id())
					pos = player.get_player_coords(player.player_id())
					fire.add_explosion(pos, 2, true, false, 1, pped)
				end
				system.wait(10)
			end
			system.yield(100)
			return HANDLER_CONTINUE
		end
		Settings["EWO_TRYHARD"] = false
		return HANDLER_POP
	end)
	ewo_key["on"] = Settings["EWO_TRYHARD"]
	global_func.force_wPara = menu.add_feature("Force White parachute On", "toggle", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["force_wPara"] = true
		if feat["on"] then
			local pped = player.get_player_ped(player.player_id())
			ped.get_ped_drawable_variation(pped, 5)
			ped.set_ped_component_variation(pped, 5, 58, 8, 0)
			return HANDLER_CONTINUE
		end
		Settings["force_wPara"] = false
		return HANDLER_POP
	end)
	global_func.force_wPara["on"] = Settings["force_wPara"]
	global_func.force_pPara = menu.add_feature("Force pink parachute On", "toggle", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["force_pPara"] = true
		if feat["on"] then
			local pped = player.get_player_ped(player.player_id())
			ped.get_ped_drawable_variation(pped, 5)
			ped.set_ped_component_variation(pped, 5, 58, 3, 0)
			return HANDLER_CONTINUE
		end
		Settings["force_pPara"] = false
		return HANDLER_POP
	end)
	global_func.force_pPara["on"] = Settings["force_pPara"]
	global_func.force_wBPH = menu.add_feature("Force White BPH On", "toggle", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["force_wBPH"] = true
		if feat["on"] then
			local pped = player.get_player_ped(player.player_id())
			ped.get_ped_prop_index(pped, 0)
			ped.set_ped_prop_index(pped, 0, 59, 8, 0)
			return HANDLER_CONTINUE
		end
		Settings["force_wBPH"] = false
		return HANDLER_POP
	end)
	global_func.force_wBPH["on"] = Settings["force_wBPH"]
	global_func.force_pBPH = menu.add_feature("Force Pink BPH On", "toggle", outfitshit,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["force_pBPH"] = true
		if feat["on"] then
			local pped = player.get_player_ped(player.player_id())
			if ped.get_ped_prop_index(pped, 0) ~= 59 then
				ped.get_ped_prop_index(pped, 0)
				ped.set_ped_prop_index(pped, 0, 59, 3, 0)
			end
			return HANDLER_CONTINUE
		end
		Settings["force_pBPH"] = false
		return HANDLER_POP
	end)
	global_func.force_pBPH["on"] = Settings["force_pBPH"]
	--INFO: Self Options
	function escort_service()
		local beyond_limits = v3()
		beyond_limits.x = -173663.281250
		beyond_limits.y = 915722.000000
		beyond_limits.z = 362299.750000
		local myplygrp, plygrp, selected_weapon
		local drvsty = 262275
		local plyveh = player.get_player_vehicle(player.player_id())
		local player_seat = 0
		local sel_ped, sel_veh, ped_count, escort_style
		local goto_pos, Coord, offsetPos = v3(), v3(), v3()
		function Offset_Coords_POS(pos, heading, distance)
			heading = math.rad((heading - 180) * -1)
			return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
		end
		function Get_Offset_POS()
			local pos = player.get_player_coords(player.player_id())
			--print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
			offsetPos = Offset_Coords_POS(pos, player.get_player_heading(player.player_id()), 10)
			--print(string.format("%s, %s, %s", offsetPos.x, offsetPos.y, offsetPos.z))
		end
		local task = {}
		local presets = {
			{"Chiliad", 491.176,5529.808,777.503},
			{"Lesters House", 1275.544,-1721.774,53.967},
			{"arena", -264.297,-1877.562,27.756},
			{"ElysianIslandBridge", -260.923,-2414.139,124.008},
			{"LSIAFlightTower", -983.292,-2636.995,89.524},
			{"TerminalCargoShip", 983.303,-2881.645,21.619},
			{"ElBurroHeights", 1583.022,-2243.034,93.265},
			{"CypressFlats", 552.672,-2218.876,68.981},
			{"LaMesa", 1116.815,-1539.787,52.146},
			{"SupplyStreet", 777.631,-695.813,28.763},
			{"Noose", 2438.874,-384.409,92.993},
			{"TatavianMountains", 2576.999,445.654,108.456},
			{"PowerStation", 2737.046,1526.873,57.494},
			{"WindFarm", 2099.765,1766.219,102.698},
			{"Prison", 1693.473,2652.971,61.335},
			{"SandyShoresRadioTower", 1847.034,3772.019,33.151},
			{"AlamoSea", 719.878,4100.993,39.154},
			{"RebelRadioTower", 744.500,2644.334,44.400},
			{"GreatChaparral", -291.035,2835.124,55.530},
			{"ZancudoControlTower", -2361.625,3244.962,97.876},
			{"NorthChumash(Hookies)", -2205.838,4298.805,48.270},
			{"AltruistCampRadioTower", -1036.141,4832.858,251.595},
			{"CassidyCreek", -509.942,4425.454,89.828},
			{"MountChiliad", 462.795,5602.036,781.400},
			{"PaletoBayFactory", -125.284,6204.561,40.164},
			{"GreatOceanHwyCafe", 1576.385,6440.662,24.654},
			{"MountGordoRadioTower", 2784.536,5994.213,354.275},
			{"MountGordoLighthouse", 3285.519,5153.820,18.527},
			{"GrapeSeedWaterTower", 1747.518,4814.711,41.666},
			{"TatavianMountainsDam", 1625.209,-76.936,166.651},
			{"VinewoodHillsTheater", 671.748,512.226,133.446},
			{"VinewoodSignRadioTowerTop", 751.179,1245.13,353.832},
			{"Hawik", 472.588,-96.376,123.705},
			{"PacificSrandardBank", 195.464,224.341,143.946},
			{"WestVinewoodCrane", -690.273,219.728,137.518},
			{"ArcadiasRadioTower", -170.232,-586.307,200.138},
			{"HookahPalaceSign",-1.414,-1008.324,89.189},
			{"MarinaAirportRadioTower",-697.010, -1419.530,5.001},
			{"DelperoFerrisWheel", -1644.193,-1114.271,13.029},
			{"VespucciCanalsClockTower", -1238.729,-853.861,77.758},
			{"DelPeroNrMazebankwest", -1310.777,-428.985,103.465},
			{"pacifficBluffs", -2254.199,326.088,192.606},
			{"GWC&GolfingSociety", -1292.052,286.209,69.407},
			{"Burton", -545.979,-196.251,84.733},
			{"LosSantosMedicalCenter", 431.907,-1348.709,44.673},
			{"BanhamCanyon", -3085.451,774.426,20.237},
			{"TongvaHills", -1874.280,2064.565,150.852},
			{"SanChianskiMountainRange", 2900.166,4325.987,102.101},
			{"HumaineLabs", 3537.104,3689.238,45.228},
			{"YouToolStoreSanChianski", 2761.944,3466.951,55.679},
			{"GalileoObservatory", -422.917,1133.272,325.855},
			{"GrndSeroraDesertCementwks", 1236.649,1869.214,84.824}
		}
		local pedweapon = {
			{"WEAPON_UNARMED", 0xA2719263},
			{"bat", 0x958A4A8F},
			{"WEAPON_HANDCUFFS", 0xD04C944D},
			{"WEAPON_RAILGUN", 0x6D544C99},
			{"WEAPON_MACHINEPISTOL", 0xDB1AA450},
			{"WEAPON_KNIFE", 0x99B507EA},
		}
		local escort_mode = {
			{"behind", -1},
			{"ahead", 0},
			{"left", 1},
			{"right", 2},
			{"back left", 3},
			{"back right", 4},
		}
		local driving_style = {0,1,4,16,131,139,1076,7785,7791,262144,262208,262275,525116,524348,786468,786469,786475,786484,786485,786491,786597,786599,786603,786613,786619,786859,786981,790699,794660,2883621,2883755,17039360,17563684,34340900,537657381,537657515,1074272427,1074528293,1076369579,1076631588,1090781748,8388614}
		local peds_2spawn = {"a_f_y_topless_01", "ig_lestercrest_2", "ig_trafficwarden", "mp_f_deadhooker", "s_m_m_pilot_01", "s_m_m_pilot_02", "s_m_y_pilot_01", "s_m_y_robber_01", "u_m_m_jewelthief", "u_m_y_fibmugger_01", "a_f_y_juggalo_01", "mp_g_m_pros_01",}
		local veh_2spawn = {"boxville5", "limo2", "insurgent", "scramjet", "Oppressor", "monster5", "phantom2", "mower", "tampa3", "ruiner2", "ruiner3", "caddy", "caddy2", "caddy3", "bus", "apc", "buzzard"}
		local parent = menu.add_feature("Moists Escort Service", "parent", globalFeatures.self,function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			if not ped.does_relationship_group_exist(MoistEntitiesRelHash) then
				MoistEntitiesRelHash[1] = ped.add_relationship_group("MoistScript_Entities")
			end
			-- players_pos()
		end)
		local escortserv = menu.add_feature("Select Your Escort", "parent", parent.id, cb)
		local escortwith = menu.add_feature("Select Escort Vehicle", "parent", parent.id, cb)
		local sel_mode = menu.add_feature("Style/Position", "parent", parent.id, cb)
		driver = menu.add_feature("Escort as Driver", "parent", parent.id)
		player_pos = menu.add_feature("Drive to: ", "action_value_str", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			pid = feat.value - 1
			goto_player(pid)
			system.wait(10)
			setdrive_2pos()
		end)
		player_pos:set_str_data(Playerz)
		local drive2 = menu.add_feature("Location Presets", "parent", driver.id)
		local pedwep = menu.add_feature("Select Escorts Weapon", "parent", parent.id)
		local set_drstyle = menu.add_feature("set driving style", "action_value_i", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			drvsty = style_driver(feat.value)
			for i = 1, #task do
				if task[i] ~= nil then
					if ai.is_task_active(boobs[#boobs], task[i]) then
						setdrive_2pos()
					end
				end
				return HANDLER_POP
			end
		end)
		set_drstyle["max"] = #driving_style
		set_drstyle["min"] = 1
		set_drstyle["value"] = 36
		local boobped = menu.add_feature("Create Escort Ped", "action", parent.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			escort_ped()
		end)
		local vehiclepedescort = menu.add_feature("Create Veh set Escort(s) inside", "action", parent.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			veh_escort()
		end)
		local vehiclepedescort = menu.add_feature("task escort to follow", "action", parent.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local pped = player.get_player_ped(player.player_id())
			local plyveh = player.get_player_vehicle(player.player_id())
			local i = #boobveh
			local y = #boobs
			if plyveh ~= nil or plyveh ~= 0 then
				task[#task+1] = ai.task_vehicle_follow(boobs[y],boobveh[i], plyveh, 250.00, 262275, 150)
				else
				task[#task+1] = ai.task_vehicle_follow(boobs[y],boobveh[i], pped, 250.00, 262275, 150)
			end
		end)
		local ply_seat = menu.add_feature("Set your seat (default front)", "action_value_i", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			if player.is_player_in_any_vehicle(player.player_id()) then
				local pped = player.get_player_ped(player.player_id())
				local i = #boobveh
				ped.set_ped_into_vehicle(pped, boobveh[i], feat.value)
				player_seat = feat.value
			end
		end)
		ply_seat["max"] = 14
		ply_seat["min"] = -1
		ply_seat["value"] = 0
		local setwanderdrive = menu.add_feature("Task Escort Drive Me around(Wander randomly)", "action", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			set_wander(true)
		end)
		local setwanderdrive = menu.add_feature("Task Escort Drive around Alone (Wander randomly)", "action", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			set_wander(false)
		end)
		local setdrivepos = menu.add_feature("Set/Update Task Drive to POS", "action", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			set_drive_2pos()
		end)
		local drive2waypoint = menu.add_feature("Set/Update Task Drive to waypoint", "action", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local pos = v2()
			pos = ui.get_waypoint_coord()
			if pos.x and pos.y then
				local coord = v3()
				coord.x = pos.x
				coord.y = pos.y
				coord.z = 100.0
				b, coord.z = gameplay.get_ground_z(coord)
				Coord = coord
			end
			setdrive_2pos()
		end)
		local Clipboard_POS =  menu.add_feature("Task Drive To Clipboard POS (0,0,0)", "action", driver.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local pos = v3()
			local pos_data = utils.from_clipboard()
			local x, y, z = string.match(pos_data, "([+-]?%d+.%d*), ([+-]?%d+.%d*), ([+-]?%d+.%d*)")
			pos.x = tonumber(x)
			pos.y = tonumber(y)
			pos.z = tonumber(z)
			goto_pos.x = pos.x
			goto_pos.y = pos.y
			goto_pos.z = pos.z
		end)
		Clipboard_POS["hidden"] = true
		local setescortloop = menu.add_feature("Loop Ped Grouping", "toggle", parent.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			if feat["on"] then
				ped_escort_loop()
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
		end)
		setescortloop["on"] = false
		local del_spawns = menu.add_feature("Delete Escorts & Vehicles", "action", parent.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			delete_escorts()
			system.wait(10)
			delete_vehicles()
		end)
		for i = 1, #escort_mode do
			menu.add_feature("Position: " .. escort_mode[i][1], "action", sel_mode.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				mode = escort_mode[i][2]
			end)
		end
		for i = 1, #presets do
			menu.add_feature("Preset: " .. presets[i][1], "action", drive2.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				goto_pos.x = presets[i][2]
				goto_pos.y = presets[i][3]
				goto_pos.z = presets[i][4]
				--print(presets[i][2])
				--print(presets[i][3])
				--print(presets[i][4])
			end)
		end
		for i = 1, #pedweapon do
			menu.add_feature("Weapon: " .. pedweapon[i][1], "action", pedwep.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				selected_weapon = gameplay.get_hash_key(pedweapon[i][1])	
			end)
		end
		for i = 1, #peds_2spawn do
			menu.add_feature("Ped: " .. peds_2spawn[i], "action", escortserv.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				sel_ped = gameplay.get_hash_key(peds_2spawn[i])	
			end)
		end
		for i = 1, #veh_2spawn do
			menu.add_feature("Veh: " .. veh_2spawn[i], "action", escortwith.id, function(feat)
				if type(feat) == "number" then
					return HANDLER_POP
				end
				ped_count = 1
				sel_veh = gameplay.get_hash_key(veh_2spawn[i])
				streaming.request_model(sel_veh)
				while not streaming.has_model_loaded(sel_veh) do
					system.wait(25)
				end
				if sel_veh == gameplay.get_hash_key("apc") then
					ped_count = 2
					secped_seat = 0
				end
				if sel_veh == gameplay.get_hash_key("boxville5") or gameplay.get_hash_key("limo2") or gameplay.get_hash_key("insurgent") then
					ped_count = 2
					secped_seat = 7
				end
			end)
		end
		function playersid()
			escort_style = driving_style[36]
			selected_weapon = gameplay.get_hash_key(pedweapon[1][1])	
			sel_ped = gameplay.get_hash_key("a_f_y_topless_01")
			sel_veh = gameplay.get_hash_key("tampa3")
			ped_count = 1
			secped_seat = 0
			player_seat = 0
			myplygrp =  player.get_player_group(player.player_id())
			local i = #groupIDs + 1
			groupIDs[i] = ped.create_group()
			local y = #groupIDs + 1	
			groupIDs[y] = ped.create_group()	
			ped.set_relationship_between_groups(0, groupIDs[i], groupIDs[y])
			ped.set_relationship_between_groups(0, groupIDs[y], groupIDs[i])
			for x = 1, #groupIDs do
				myplygrp = player.get_player_group(player.player_id())
				ped.set_relationship_between_groups(1, groupIDs[x], myplygrp)
				ped.set_relationship_between_groups(1, myplygrp, groupIDs[x])
			end
			local me
			me = player.player_id()
			for z = 0, 31 do
				if z ~= me then
				end
				local player_groups = player.get_player_group(z)	
				local y = #groupIDs
				for i = 1, #boobs do
					ped.set_ped_as_group_member(boobs[i], groupIDs[y])
					ped.set_ped_never_leaves_group(boobs[i], true)
					ped.set_relationship_between_groups(1, groupIDs[y], myplygrp)
					ped.set_relationship_between_groups(5, player_groups, myplygrp)
					ped.set_relationship_between_groups(1, myplygrp, groupIDs[y])
					ped.set_relationship_between_groups(5, myplygrp, player_groups)
				end
			end
			return HANDLER_POP
		end
		playersid()
		function ped_escort_loop()
			local me = player.player_id()
			for x = 0, 31 do
				if x ~= me then
					local y = #groupIDs
					for i = 1, #boobs do
						ped.set_ped_as_group_member(boobs[i], groupIDs[y])
						ped.set_ped_never_leaves_group(boobs[i], true)
						ped.set_relationship_between_groups(1, groupIDs[y], myplygrp)
						ped.set_relationship_between_groups(5, player.get_player_group(x), myplygrp)
						ped.set_relationship_between_groups(1, myplygrp, groupIDs[y])
						ped.set_relationship_between_groups(5, myplygrp, player.get_player_group(x))
					end
				end
				return HANDLER_CONTINUE
			end
		end
		function ped_escort(feat)
			local mode = feat.value
			local i = #boobs
			local y = #boobveh
			if #boobveh == nil then
				moist_notify("Escort Vehicle:\nMust Be Selected\n Then Spawned Before Task can be set!!!", "Moists Escort Service")
			end
			if plyveh == nil then moist_notify("Your Vehicle:\nYou need to be in a vehicle\nBefore Task can be set!!!") end
			task[#task+1] = ai.task_vehicle_escort(boobs[i], boobveh[y], plyveh, mode, 2200.00, 262144, 2.0, -1, 5.0)
			for i = 1, #boobs do
				ped.set_ped_as_group_member(boobs[i], myplygrp)
				pedgroup = ped.get_ped_group(boobs[i])
				ped.set_ped_never_leaves_group(boobs[i], true)
			end
		end
		function escort_ped()
			--if feat["on"] then
			local pped = player.get_player_ped(player.player_id())
			local model = sel_ped
			local pos = player.get_player_coords(player.player_id())
			local offset = v3()
			local rot = v3()
			local hed = player.get_player_heading(player.player_id())
			local headtype = math.random(0, 2)
			pos.x = pos.x + 10
			Get_Offset_POS()
			streaming.request_model(model)
			while not streaming.has_model_loaded(model) do
				system.wait(10)
			end
			local i = #boobs + 1
			rot = entity.get_entity_rotation(player.get_player_ped(pped))
			boobs[i] = ped.create_ped(26, model, pos + offset, 0, true, false)
			ped.set_ped_relationship_group_hash(boobs[i], ped.get_ped_relationship_group_hash(pped))
			ped.set_can_attack_friendly(boobs[i], true, false)
			--print(boobs[i])		
			entity.set_entity_god_mode(boobs[i], true)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(boobs[i])
			ped.set_ped_component_variation(boobs[i], 0, 1, 0, 0)
			ped.set_ped_component_variation(boobs[i], 2, 0, 0, 0)
			ped.set_ped_component_variation(boobs[i], 3, 1, 0, 0)
			ped.set_ped_component_variation(boobs[i], 4, 1, 0, 0)
			ped.set_ped_component_variation(boobs[i], 0, 2, 2, 0)
			ped.set_ped_component_variation(boobs[i], 8, 1, 0, 0)
			ped.set_ped_can_switch_weapons(boobs[i], true)
			ped.set_ped_combat_attributes(boobs[i], 46, true)
			ped.set_ped_combat_attributes(boobs[i], 52, true)
			ped.set_ped_combat_attributes(boobs[i], 1, true)
			ped.set_ped_combat_attributes(boobs[i], 2, true)
			ped.set_ped_combat_range(boobs[i], 2)
			ped.set_ped_combat_ability(boobs[i], 2)
			ped.set_ped_combat_movement(boobs[i], 2)
			weapon.give_delayed_weapon_to_ped(boobs[i], selected_weapon, 0, 1)
			ped.set_ped_can_switch_weapons(boobs[i], true)
			local y = #groupIDs
			pedgroup = ped.get_ped_group(boobs[i])
			moist_notify("Ped Created spawned Group: "..pedgroup.."\nPlayer Group ID: "..myplygrp, "Ped Grouping")
			ped.set_ped_as_group_member(boobs[i], myplygrp)
			pedgroup = ped.get_ped_group(boobs[i])
			ped.set_ped_never_leaves_group(boobs[i], true)
			moist_notify("Ped Spawned Now Set into Group "..pedgroup.."\nPlayer Group ID: "..myplygrp, "Ped Grouping")
		end
		function veh_escort()
			local vehhash = sel_veh
			local pos = player.get_player_coords(player.player_id())
			pos.x = pos.x + 10
			pos.y = pos.y + 10
			streaming.request_model(vehhash)
			while (not streaming.has_model_loaded(vehhash)) do
				system.wait(100)
			end
			Get_Offset_POS()
			local y = #boobveh + 1
			boobveh[y] = vehicle.create_vehicle(vehhash, offsetPos, player.get_player_heading(player.player_id()), true, false)
			decorator.decor_set_int(boobveh[y], "MPBitset", 1 << 10)
			--print(boobveh[y])
			vehicle.set_vehicle_mod_kit_type(boobveh[y], 0)
			vehicle.get_vehicle_mod(boobveh[y], 10)
			vehicle.set_vehicle_mod(boobveh[y], 10, 0, false)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(boobveh[y])
			vehicle.set_vehicle_on_ground_properly(boobveh[y])
			entity.set_entity_god_mode(boobveh[y], true)
			vehicle.set_vehicle_doors_locked(boobveh[y], 5)
			network.request_control_of_entity(boobveh[y])
			local i = #boobs
			if #boobs == 0 or nil then
				escort_ped()
				system.wait(200)
				i = #boobs
			end
			if #boobveh == 0 or nil then
			return HANDLER_POP end
			ped.set_ped_into_vehicle(boobs[i], boobveh[y], -1)
		end
		function goto_player(pid)
			local pos = v3()
			pos =  player.get_player_coords(pid)
			if pos.x and pos.y then
				local coord = v2()
				coord.x = pos.x
				coord.y = pos.y
				Coord = coord
				ui.set_new_waypoint(coord)
			end
			local pos = v2()
			pos = ui.get_waypoint_coord()
			if pos.x and pos.y then
				local coord = v3()
				coord.x = pos.x
				coord.y = pos.y
				coord.z = 100.0
				b, coord.z = gameplay.get_ground_z(coord)
				Coord = coord
			end
		end
		function coord_pos()
			goto_pos.x = -1236.220
			goto_pos.y = -2985.805
			goto_pos.z = -41.269
		end
		function set_drive_2pos()
			local i = #boobveh
			local ped_driver
			local y = #boobs
			if #boobs == 0 or nil then return end
			ped.set_ped_into_vehicle(boobs[y], boobveh[i], -1)
			local pped = player.get_player_ped(player.player_id())
			ped.set_ped_into_vehicle(pped, boobveh[i], player_seat)		
			task[#task+1] = ai.task_vehicle_drive_to_coord(boobs[y], boobveh[i], goto_pos, 200.0, 1, sel_veh, drvsty, 10, -1)
		end
		function setdrive_2pos()
			local i = #boobveh
			local ped_driver
			local y = #boobs
			if #boobs == 0 or nil then return end
			ped.set_ped_into_vehicle(boobs[y], boobveh[i], -1)
			local pped = player.get_player_ped(player.player_id())
			ped.set_ped_into_vehicle(pped, boobveh[i], player_seat)
			task[#task+1] = ai.task_vehicle_drive_to_coord(boobs[y], boobveh[i], Coord, 200.0, 1, sel_veh, drvsty, 10, -1)
		end
		function set_wander(self)
			local i = #boobveh
			local y = #boobs
			ped.set_ped_into_vehicle(boobs[y], boobveh[i], -1)
			if self == true then
				local pped = player.get_player_ped(player.player_id())
				ped.set_ped_into_vehicle(pped, boobveh[i], player_seat)
			end
			task[#task+1] = ai.task_vehicle_drive_wander(boobs[y], boobveh[i], 180, escort_style)
		end
		function style_driver(id)
			escort_style = driving_style[id]
			return escort_style
		end
		function delete_escorts()
			if #boobs > 0 then
				for i = 1, #boobs do
					network.request_control_of_entity(boobs[i])
					entity.set_entity_coords_no_offset(boobs[i], beyond_limits)
					ped.clear_ped_tasks_immediately(boobs[i])
					entity.detach_entity(boobs[i])
					entity.set_entity_as_no_longer_needed(boobs[i])
					entity.delete_entity(boobs[i])
				end
				else
			return end
		end
		function delete_vehicles()
			if #boobveh > 0 then
				for i = 1, #boobveh do
					if player.is_player_in_any_vehicle(player.player_id()) then
						if player.get_player_vehicle(player.player_id()) == boobveh[i] then
							ped.clear_ped_tasks_immediately(player.get_player_ped(player.player_id()))
							system.yield(25)
						end end
						network.request_control_of_entity(boobveh[i])
						entity.set_entity_coords_no_offset(boobveh[i], beyond_limits)
						entity.detach_entity(boobveh[i])
						entity.set_entity_as_no_longer_needed(boobveh[i])
						entity.delete_entity(boobveh[i])
				end
				else	
			return end 
		end
	end
	local status, err = pcall(escort_service)
	if not status then
		menu.notify("Moist Script: Escort Service Container\nStatus = " .. tostring(status) .."\nError = " .. tostring(err), "Container Function Error", 5, 0xff0000ff)
	end
	--INFO: Triplet Vehicle Options
	function TripletSpawns()
		local LobbyPlayers = {}
		local spawn_cunt = {}
		local triplethash
		function Get_playerzz()
			for pid = 0, 31 do
				if player.is_player_valid(pid) then
					LobbyPlayers[#LobbyPlayers + 1] = tostring(player.get_player_name(pid))
				end
			end
		end
		function TripletVeh(hash)
			pped = player.get_player_ped(player.player_id())
			local bid = ped.get_ped_bone_index(pped, 17916)
			local rot, offset, pos = v3(0.0, 0.0, 0.0), v3(15.0, 0.0, 0.0), v3()
			local head = player.get_player_heading(player.player_id())
			pos = player.get_player_coords(player.player_id())
			pos.x = pos.x + 10.0
			local i = #spawned_cunts + 1
			streaming.request_model(hash)
			while (not streaming.has_model_loaded(hash)) do
				system.wait(10)
			end
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, head, true, false)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			local attacha = spawned_cunts[i]
			local i = #spawned_cunts + 1
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, head, true, false)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
			vehicle.control_landing_gear(spawned_cunts[i], 3)
			local attachb = spawned_cunts[i]
			local offset = v3(-15.0, 0.0, 0.0)
			local i = #spawned_cunts + 1
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, pos.z, true, false)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
			vehicle.control_landing_gear(spawned_cunts[i], 3)
		end
		function SpawnVeh(hash, pid)
			local pos, fwd, spawn_pos = v3(), v3(), v3()
			local head, pped
			pped = player.get_player_ped(pid)
			if player.is_player_valid(pid) then
				pos = player.get_player_coords(pid)	
				head = player.get_player_heading(pid)
				fwd = entity.get_entity_forward_vector(pped)
				spawnbool, spawn_pos = gameplay.find_spawn_point_in_direction(pos, fwd, 5.0)
				if spawnbool then
					streaming.request_model(hash)
					while (not streaming.has_model_loaded(hash)) do
						system.wait(10)
					end
					spawned_cunts[i] = vehicle.create_vehicle(hash, spawn_pos, head, true, false)
					decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
					vehicle.set_vehicle_mod_kit_type(spawned_cunts[i], 0)
					vehicle.get_vehicle_mod(spawned_cunts[i], 10)
					vehicle.set_vehicle_mod(spawned_cunts[i], 10, 1, false)
				end
			end
		end
		function TripletVeh_WithPed(hash)
			pped = player.get_player_ped(player.player_id())
			local bid = ped.get_ped_bone_index(pped, 17916)
			local rot, offset, pos = v3(0.0, 0.0, 0.0), v3(15.0, 0.0, 0.0), v3()
			local head = player.get_player_heading(player.player_id())
			pos = player.get_player_coords(player.player_id())
			pos.x = pos.x + 10.0
			local i = #spawned_cunts + 1
			local myplygrp = player.get_player_group(player.player_id())
			local model = 0x6E42FD26
			streaming.request_model(hash)
			while (not streaming.has_model_loaded(hash)) do
				system.wait(10)
			end
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, head, true, false)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			vehicle.set_vehicle_mod_kit_type(spawned_cunts[i], 0)
			vehicle.get_vehicle_mod(spawned_cunts[i], 10)
			vehicle.set_vehicle_mod(spawned_cunts[i], 10, 1, false)
			ped.set_ped_into_vehicle(pped, spawned_cunts[i], -1)
			local attacha = spawned_cunts[i]
			local i = #spawned_cunts + 1
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, head, true, false)
			entity.set_entity_god_mode(spawned_cunts[i], true)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			vehicle.set_vehicle_mod_kit_type(spawned_cunts[i], 0)
			vehicle.get_vehicle_mod(spawned_cunts[i], 10)
			vehicle.set_vehicle_mod(spawned_cunts[i], 10, 1, false)
			entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
			vehicle.control_landing_gear(spawned_cunts[i], 3)
			local attachb = spawned_cunts[i]
			streaming.request_model(model)
			while (not streaming.has_model_loaded(model)) do
				system.wait(10)
			end
			local y = #spawn_cunt + 1
			spawn_cunt[y] = ped.create_ped(26, model, pos + offset, 0, true, false)
			ped.set_ped_relationship_group_hash(spawn_cunt[y], ped.get_ped_relationship_group_hash(pped))
			ped.set_can_attack_friendly(spawn_cunt[y], true, false)
			ped.set_ped_can_switch_weapons(spawn_cunt[y], true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 46, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 52, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 1, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 2, true)
			ped.set_ped_combat_range(spawn_cunt[y], 2)
			ped.set_ped_combat_ability(spawn_cunt[y], 2)
			ped.set_ped_combat_movement(spawn_cunt[y], 2)
			ped.set_ped_into_vehicle(spawn_cunt[y], spawned_cunts[i], -1)
			local offset = v3(-15.0, 0.0, 0.0)
			local i = #spawned_cunts + 1
			spawned_cunts[i] = vehicle.create_vehicle(hash, pos, pos.z, true, false)
			entity.set_entity_god_mode(spawned_cunts[i], true)
			decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
			vehicle.set_vehicle_mod_kit_type(spawned_cunts[i], 0)
			vehicle.get_vehicle_mod(spawned_cunts[i], 10)
			vehicle.set_vehicle_mod(spawned_cunts[i], 10, 1, false)
			entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
			local y = #spawn_cunt + 1
			spawn_cunt[y] = ped.create_ped(26, model, pos + offset, 0, true, false)
			ped.set_ped_relationship_group_hash(spawn_cunt[y], ped.get_ped_relationship_group_hash(pped))
			ped.set_can_attack_friendly(spawn_cunt[y], true, false)
			ped.set_ped_can_switch_weapons(spawn_cunt[y], true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 46, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 52, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 1, true)
			ped.set_ped_combat_attributes(spawn_cunt[y], 2, true)
			ped.set_ped_combat_range(spawn_cunt[y], 2)
			ped.set_ped_combat_ability(spawn_cunt[y], 2)
			ped.set_ped_combat_movement(spawn_cunt[y], 2)
			ped.set_ped_into_vehicle(spawn_cunt[y], spawned_cunts[i], -1)
			for x = 0, 31 do
				if x ~= player.player_id() then
					ped.set_relationship_between_groups(5, player.get_player_group(x), myplygrp)
					ped.set_relationship_between_groups(5, myplygrp, player.get_player_group(x))
				end
			end
		end
		local Vehicles = {}
		local VehModSpawn
		local triplet_fun = menu.add_feature("Spawn Vehicles", "parent", globalFeatures.self,function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			while true do
				Get_playerzz()
				local valuestate = SingleSpawntype:get_str_data()[SingleSpawntype.value + 1]
				playerss = SingleSpawntype:get_str_data()
				for i = 1, #playerss do
					if playerss[i] == valuestate then
						SingleSpawntype["value"] = tonumber(i - 1)
					end
				end
				SingleSpawntype:set_str_data(LobbyPlayers)
				system.yield(500)
			end
			tripletspawnmodel["hidden"] = true
			tripletspawntype["hidden"] = true
			return HANDLER_POP
		end)
		tripletfun = menu.add_feature("Show Vehicles Starting: ", "action_value_str", triplet_fun.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			if feat.value == 0 then
				Vehicles = {"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1", "ambulance",
					"annihilator", "annihilator2", "apc", "ardent", "armytanker", "armytrailer", "armytrailer2",
				"asbo", "asea", "asea2", "asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"}
				tripletspawnmodel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha",
					"alphaz1", "ambulance", "annihilator", "annihilator2", "apc", "ardent",
					"armytanker", "armytrailer", "armytrailer2", "asbo", "asea", "asea2",
				"asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 1 then
				Vehicles = {"bagger", "baletrailer", "baller", "baller2", "baller3", "baller4", "baller5", "baller6",
					"banshee", "banshee2", "barracks", "barracks2", "barracks3", "barrage", "bati", "bati2",
					"benson", "besra", "bestiagts", "bf400", "bfinjection", "biff", "bifta", "bison", "bison2",
					"bison3", "bjxl", "blade", "blazer", "blazer2", "blazer3", "blazer4", "blazer5", "blimp",
					"blimp2", "blimp3", "blista", "blista2", "blista3", "bmx", "boattrailer", "bobcatxl",
					"bodhi2", "bombushka", "boxville", "boxville2", "boxville3", "boxville4", "boxville5",
					"brawler", "brickade", "brioso", "brioso2", "bruiser", "bruiser2", "bruiser3", "brutus",
					"brutus2", "brutus3", "btype", "btype2", "btype3", "buccaneer", "buccaneer2", "buffalo",
					"buffalo2", "buffalo3", "bulldozer", "bullet", "burrito", "burrito2", "burrito3",
				"burrito4", "burrito5", "bus", "buzzard", "buzzard2"}
				tripletspawnmodel:set_str_data({"bagger", "baletrailer", "baller", "baller2", "baller3", "baller4",
					"baller5", "baller6", "banshee", "banshee2", "barracks", "barracks2",
					"barracks3", "barrage", "bati", "bati2", "benson", "besra", "bestiagts",
					"bf400", "bfinjection", "biff", "bifta", "bison", "bison2", "bison3",
					"bjxl", "blade", "blazer", "blazer2", "blazer3", "blazer4", "blazer5",
					"blimp", "blimp2", "blimp3", "blista", "blista2", "blista3", "bmx",
					"boattrailer", "bobcatxl", "bodhi2", "bombushka", "boxville",
					"boxville2", "boxville3", "boxville4", "boxville5", "brawler",
					"brickade", "brioso", "brioso2", "bruiser", "bruiser2", "bruiser3",
					"brutus", "brutus2", "brutus3", "btype", "btype2", "btype3",
					"buccaneer", "buccaneer2", "buffalo", "buffalo2", "buffalo3",
					"bulldozer", "bullet", "burrito", "burrito2", "burrito3", "burrito4",
				"burrito5", "bus", "buzzard", "buzzard2"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 2 then
				Vehicles = {"cablecar", "caddy", "caddy2", "caddy3", "camper", "caracara", "caracara2", "carbonizzare",
					"carbonrs", "cargobob", "cargobob2", "cargobob3", "cargobob4", "cargoplane", "casco",
					"cavalcade", "cavalcade2", "cerberus", "cerberus2", "cerberus3", "cheburek", "cheetah",
					"cheetah2", "chernobog", "chimera", "chino", "chino2", "cliffhanger", "clique", "club",
					"coach", "cog55", "cog552", "cogcabrio", "cognoscenti", "cognoscenti2", "comet2", "comet3",
					"comet4", "comet5", "contender", "coquette", "coquette2", "coquette3", "coquette4",
				"cruiser", "crusader", "cuban800", "cutter", "cyclone"}
				tripletspawnmodel:set_str_data({"cablecar", "caddy", "caddy2", "caddy3", "camper", "caracara",
					"caracara2", "carbonizzare", "carbonrs", "cargobob", "cargobob2",
					"cargobob3", "cargobob4", "cargoplane", "casco", "cavalcade",
					"cavalcade2", "cerberus", "cerberus2", "cerberus3", "cheburek",
					"cheetah", "cheetah2", "chernobog", "chimera", "chino", "chino2",
					"cliffhanger", "clique", "club", "coach", "cog55", "cog552",
					"cogcabrio", "cognoscenti", "cognoscenti2", "comet2", "comet3",
					"comet4", "comet5", "contender", "coquette", "coquette2", "coquette3",
				"coquette4", "cruiser", "crusader", "cuban800", "cutter", "cyclone"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 3 then
				Vehicles = {"daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler", "deluxo",
					"deveste", "deviant", "diablous", "diablous2", "dilettante", "dilettante2", "dinghy",
					"dinghy2", "dinghy3", "dinghy4", "dinghy5", "dloader", "docktrailer", "docktug", "dodo",
					"dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6", "double",
					"drafter", "dubsta", "dubsta2", "dubsta3", "dukes", "dukes2", "dukes3", "dump", "dune",
				"dune2", "dune3", "dune4", "dune5", "duster", "dynasty"}
				tripletspawnmodel:set_str_data({"daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler",
					"deluxo", "deveste", "deviant", "diablous", "diablous2", "dilettante",
					"dilettante2", "dinghy", "dinghy2", "dinghy3", "dinghy4", "dinghy5",
					"dloader", "docktrailer", "docktug", "dodo", "dominator", "dominator2",
					"dominator3", "dominator4", "dominator5", "dominator6", "double",
					"drafter", "dubsta", "dubsta2", "dubsta3", "dukes", "dukes2", "dukes3",
				"dump", "dune", "dune2", "dune3", "dune4", "dune5", "duster", "dynasty"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 4 then
				Vehicles = {"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3", "enduro",
				"entity2", "entityxf", "esskey", "everon", "exemplar"}
				tripletspawnmodel:set_str_data({"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3",
				"enduro", "entity2", "entityxf", "esskey", "everon", "exemplar"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 5 then
				Vehicles = {"f620", "faction", "faction2", "faction3", "fagaloa", "faggio", "faggio2", "faggio3", "fbi",
					"fbi2", "fcr", "fcr2", "felon", "felon2", "feltzer2", "feltzer3", "firetruck", "firetruk",
					"fixter", "flashgt", "flatbed", "fmj", "forklift", "formula", "formula2", "fq2",
					"freecrawler", "freight", "freightcar", "freightcont1", "freightcont2", "freightgrain",
				"freighttrailer", "frogger", "frogger2", "fugitive", "furia", "furoregt", "fusilade", "futo"}
				tripletspawnmodel:set_str_data({"f620", "faction", "faction2", "faction3", "fagaloa", "faggio",
					"faggio2", "faggio3", "fbi", "fbi2", "fcr", "fcr2", "felon", "felon2",
					"feltzer2", "feltzer3", "firetruck", "firetruk", "fixter", "flashgt",
					"flatbed", "fmj", "forklift", "formula", "formula2", "fq2",
					"freecrawler", "freight", "freightcar", "freightcont1", "freightcont2",
					"freightgrain", "freighttrailer", "frogger", "frogger2", "fugitive",
				"furia", "furoregt", "fusilade", "futo"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 6 then
				Vehicles = {"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "gb200",
					"gburrito", "gburrito2", "glendale", "glendale2", "gp1", "graintrailer", "granger",
				"gresley", "gt500", "guardian"}
				tripletspawnmodel:set_str_data({"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4",
					"gauntlet5", "gb200", "gburrito", "gburrito2", "glendale", "glendale2",
				"gp1", "graintrailer", "granger", "gresley", "gt500", "guardian"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 7 then
				Vehicles = {"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler", "hauler2", "havok",
					"hellion", "hermes", "hexer", "hotknife", "hotring", "howard", "hunter", "huntley",
				"hustler", "hydra"}
				tripletspawnmodel:set_str_data({"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler",
					"hauler2", "havok", "hellion", "hermes", "hexer", "hotknife", "hotring",
				"howard", "hunter", "huntley", "hustler", "hydra"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 8 then
				Vehicles = {"imorgon", "impaler", "impaler2", "impaler3", "impaler4", "imperator", "imperator2",
					"imperator3", "infernus", "infernus2", "ingot", "innovation", "insurgent", "insurgent2",
					"insurgent3", "intruder", "issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "italigtb",
				"italigtb2", "italigto", "italirsx"}
				tripletspawnmodel:set_str_data({"imorgon", "impaler", "impaler2", "impaler3", "impaler4", "imperator",
					"imperator2", "imperator3", "infernus", "infernus2", "ingot",
					"innovation", "insurgent", "insurgent2", "insurgent3", "intruder",
					"issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "italigtb",
				"italigtb2", "italigto", "italirsx"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 9 then
				Vehicles = {"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet", "jetmax", "journey",
				"jugular"}
				tripletspawnmodel:set_str_data({"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet",
				"jetmax", "journey", "jugular"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 10 then
				Vehicles = {"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda", "kosatka", "krieger",
				"kuruma", "kuruma2"}
				tripletspawnmodel:set_str_data({"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda",
				"kosatka", "krieger", "kuruma", "kuruma2"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 11 then
				Vehicles = {"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard", "limo2", "locust",
				"longfin", "lurcher", "luxor", "luxor2", "lynx"}
				tripletspawnmodel:set_str_data({"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard",
				"limo2", "locust", "longfin", "lurcher", "luxor", "luxor2", "lynx"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 12 then
				Vehicles = {"mamba", "mammatus", "manana", "manana2", "manchez", "manchez2", "marquis", "marshall",
					"massacro", "massacro2", "maverick", "menacer", "mesa", "mesa2", "mesa3", "metrotrain",
					"michelli", "microlight", "miljet", "minitank", "minivan", "minivan2", "mixer", "mixer2",
					"mogul", "molotok", "monroe", "monster", "monster3", "monster4", "monster5", "moonbeam",
				"moonbeam2", "mower", "mule", "mule2", "mule3", "mule4"}
				tripletspawnmodel:set_str_data({"mamba", "mammatus", "manana", "manana2", "manchez", "manchez2",
					"marquis", "marshall", "massacro", "massacro2", "maverick", "menacer",
					"mesa", "mesa2", "mesa3", "metrotrain", "michelli", "microlight",
					"miljet", "minitank", "minivan", "minivan2", "mixer", "mixer2", "mogul",
					"molotok", "monroe", "monster", "monster3", "monster4", "monster5",
				"moonbeam", "moonbeam2", "mower", "mule", "mule2", "mule3", "mule4"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 13 then
				Vehicles = {"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade", "nightshade",
				"nightshark", "nimbus", "ninef", "ninef2", "nokota", "novak"}
				tripletspawnmodel:set_str_data({"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade",
					"nightshade", "nightshark", "nimbus", "ninef", "ninef2", "nokota",
				"novak"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 14 then
				Vehicles = {"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2", "oracle", "oracle2",
				"osiris", "outlaw"}
				tripletspawnmodel:set_str_data({"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2",
				"oracle", "oracle2", "osiris", "outlaw"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 15 then
				Vehicles = {"packer", "panto", "paradise", "paragon", "paragon2", "pariah", "patriot", "patriot2",
					"patrolboat", "pbus", "pbus2", "pcj", "penetrator", "penumbra", "penumbra2", "peyote",
					"peyote2", "peyote3", "pfister811", "phantom", "phantom2", "phantom3", "phoenix", "picador",
					"pigalle", "police", "police2", "police3", "police4", "policeb", "policeold1", "policeold2",
					"policet", "polmav", "pony", "pony2", "pounder", "pounder2", "prairie", "pranger",
				"predator", "premier", "primo", "primo2", "proptrailer", "prototipo", "pyro"}
				tripletspawnmodel:set_str_data({"packer", "panto", "paradise", "paragon", "paragon2", "pariah",
					"patriot", "patriot2", "patrolboat", "pbus", "pbus2", "pcj",
					"penetrator", "penumbra", "penumbra2", "peyote", "peyote2", "peyote3",
					"pfister811", "phantom", "phantom2", "phantom3", "phoenix", "picador",
					"pigalle", "police", "police2", "police3", "police4", "policeb",
					"policeold1", "policeold2", "policet", "polmav", "pony", "pony2",
					"pounder", "pounder2", "prairie", "pranger", "predator", "premier",
				"primo", "primo2", "proptrailer", "prototipo", "pyro"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 16 then
				Vehicles = {"radi", "raiden", "raketrailer", "rallytruck", "rancherxl", "rancherxl2", "rapidgt",
					"rapidgt2", "rapidgt3", "raptor", "ratbike", "ratloader", "ratloader2", "rcbandito",
					"reaper", "rebel", "rebel2", "rebla", "regina", "rentalbus", "retinue", "retinue2",
					"revolter", "rhapsody", "rhino", "riata", "riot", "riot2", "ripley", "rocoto", "rogue",
					"romero", "rrocket", "rubble", "ruffian", "ruiner", "ruiner2", "ruiner3", "rumpo", "rumpo2",
				"rumpo3", "ruston"}
				tripletspawnmodel:set_str_data({"radi", "raiden", "raketrailer", "rallytruck", "rancherxl",
					"rancherxl2", "rapidgt", "rapidgt2", "rapidgt3", "raptor", "ratbike",
					"ratloader", "ratloader2", "rcbandito", "reaper", "rebel", "rebel2",
					"rebla", "regina", "rentalbus", "retinue", "retinue2", "revolter",
					"rhapsody", "rhino", "riata", "riot", "riot2", "ripley", "rocoto",
					"rogue", "romero", "rrocket", "rubble", "ruffian", "ruiner", "ruiner2",
				"ruiner3", "rumpo", "rumpo2", "rumpo3", "ruston"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 17 then
				Vehicles = {"s80", "sabregt", "sabregt2", "sadler", "sadler2", "sanchez", "sanchez2", "sanctus",
					"sandking", "sandking2", "savage", "savestra", "sc1", "scarab", "scarab2", "scarab3",
					"schafter2", "schafter3", "schafter4", "schafter5", "schafter6", "schlagen", "schwarzer",
					"scorcher", "scramjet", "scrap", "seabreeze", "seashark", "seashark2", "seashark3",
					"seasparrow", "seasparrow2", "seasparrow3", "seminole", "seminole2", "sentinel",
					"sentinel2", "sentinel3", "serrano", "seven70", "shamal", "sheava", "sheriff", "sheriff2",
					"shotaro", "skylift", "slamtruck", "slamvan", "slamvan2", "slamvan3", "slamvan4",
					"slamvan5", "slamvan6", "sovereign", "specter", "specter2", "speeder", "speeder2", "speedo",
					"speedo2", "speedo4", "squaddie", "squalo", "stafford", "stalion", "stalion2", "stanier",
					"starling", "stinger", "stingergt", "stockade", "stockade3", "stratum", "streiter",
					"stretch", "strikeforce", "stromberg", "stryder", "stunt", "submersible", "submersible2",
					"sugoi", "sultan", "sultan2", "sultanrs", "suntrap", "superd", "supervolito",
				"supervolito2", "surano", "surfer", "surfer2", "surge", "swift", "swift2", "swinger"}
				tripletspawnmodel:set_str_data({"s80", "sabregt", "sabregt2", "sadler", "sadler2", "sanchez",
					"sanchez2", "sanctus", "sandking", "sandking2", "savage", "savestra",
					"sc1", "scarab", "scarab2", "scarab3", "schafter2", "schafter3",
					"schafter4", "schafter5", "schafter6", "schlagen", "schwarzer",
					"scorcher", "scramjet", "scrap", "seabreeze", "seashark", "seashark2",
					"seashark3", "seasparrow", "seasparrow2", "seasparrow3", "seminole",
					"seminole2", "sentinel", "sentinel2", "sentinel3", "serrano", "seven70",
					"shamal", "sheava", "sheriff", "sheriff2", "shotaro", "skylift",
					"slamtruck", "slamvan", "slamvan2", "slamvan3", "slamvan4", "slamvan5",
					"slamvan6", "sovereign", "specter", "specter2", "speeder", "speeder2",
					"speedo", "speedo2", "speedo4", "squaddie", "squalo", "stafford",
					"stalion", "stalion2", "stanier", "starling", "stinger", "stingergt",
					"stockade", "stockade3", "stratum", "streiter", "stretch",
					"strikeforce", "stromberg", "stryder", "stunt", "submersible",
					"submersible2", "sugoi", "sultan", "sultan2", "sultanrs", "suntrap",
					"superd", "supervolito", "supervolito2", "surano", "surfer", "surfer2",
				"surge", "swift", "swift2", "swinger"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 18 then
				Vehicles = {"t20", "taco", "tailgater", "tailgater2", "taipan", "tampa", "tampa2", "tampa3", "tanker",
					"tanker2", "tankercar", "taxi", "technical", "technical2", "technical3", "tempesta",
					"terbyte", "tezeract", "thrax", "thrust", "thruster", "tigon", "tiptruck", "tiptruck2",
					"titan", "toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4", "tornado5",
					"tornado6", "toro", "toro2", "toros", "tourbus", "towtruck", "towtruck2", "tr2", "tr3",
					"tr4", "tractor", "tractor2", "tractor3", "trailerlarge", "trailerlogs", "trailers",
					"trailers2", "trailers3", "trailers4", "trailersmall", "trailersmall2", "trash", "trash2",
					"trflat", "tribike", "tribike2", "tribike3", "trophytruck", "trophytruck2", "tropic",
					"tropic2", "tropos", "tug", "tula", "tulip", "turismo2", "turismor", "tvtrailer", "tyrant",
				"tyrus"}
				tripletspawnmodel:set_str_data({"t20", "taco", "tailgater", "tailgater2", "taipan", "tampa", "tampa2",
					"tampa3", "tanker", "tanker2", "tankercar", "taxi", "technical",
					"technical2", "technical3", "tempesta", "terbyte", "tezeract", "thrax",
					"thrust", "thruster", "tigon", "tiptruck", "tiptruck2", "titan",
					"toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4",
					"tornado5", "tornado6", "toro", "toro2", "toros", "tourbus", "towtruck",
					"towtruck2", "tr2", "tr3", "tr4", "tractor", "tractor2", "tractor3",
					"trailerlarge", "trailerlogs", "trailers", "trailers2", "trailers3",
					"trailers4", "trailersmall", "trailersmall2", "trash", "trash2",
					"trflat", "tribike", "tribike2", "tribike3", "trophytruck",
					"trophytruck2", "tropic", "tropic2", "tropos", "tug", "tula", "tulip",
				"turismo2", "turismor", "tvtrailer", "tyrant", "tyrus"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 19 then
				Vehicles = {"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck", "utillitruck2",
				"utillitruck3"}
				tripletspawnmodel:set_str_data({"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck",
				"utillitruck2", "utillitruck3"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 20 then
				Vehicles = {"vacca", "vader", "vagner", "vagrant", "valkyrie", "valkyrie2", "vamos", "velum", "velum2",
					"verlierer2", "verus", "vestra", "vetir", "veto", "veto2", "vigero", "vigilante",
					"vindicator", "virgo", "virgo2", "virgo3", "viseris", "visione", "volatol", "volatus",
				"voltic", "voltic2", "voodoo", "voodoo2", "vortex", "vstr"}
				tripletspawnmodel:set_str_data({"vacca", "vader", "vagner", "vagrant", "valkyrie", "valkyrie2", "vamos",
					"velum", "velum2", "verlierer2", "verus", "vestra", "vetir", "veto",
					"veto2", "vigero", "vigilante", "vindicator", "virgo", "virgo2",
					"virgo3", "viseris", "visione", "volatol", "volatus", "voltic",
				"voltic2", "voodoo", "voodoo2", "vortex", "vstr"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 21 then
				Vehicles = {"warrener", "washington", "wastelander", "weevil", "windsor", "windsor2", "winky",
				"wolfsbane"}
				tripletspawnmodel:set_str_data({"warrener", "washington", "wastelander", "weevil", "windsor",
				"windsor2", "winky", "wolfsbane"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 22 then
				Vehicles = {"xa21", "xls", "xls2"}
				tripletspawnmodel:set_str_data({"xa21", "xls", "xls2"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 23 then
				Vehicles = {"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"}
				tripletspawnmodel:set_str_data({"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"})
				tripletspawnmodel["hidden"] = false
				elseif feat.value == 24 then
				Vehicles = {"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea", "zombieb", "zorrusso",
				"zr380", "zr3802", "zr3803", "ztype"}
				tripletspawnmodel:set_str_data({"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea",
				"zombieb", "zorrusso", "zr380", "zr3802", "zr3803", "ztype"})
				tripletspawnmodel["hidden"] = false
			end
		end)
		tripletfun:set_str_data({"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R",
		"S", "T", "U", "V", "W", "X", "Y", "Z"})
		tripletspawnmodel = menu.add_feature("Spawn : ", "action_value_str", triplet_fun.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			VehModSpawn = Vehicles[feat.value + 1]
			tripletspawntype["hidden"] = false
		end)
		tripletspawnmodel["hidden"] = true
		tripletspawnmodel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1",
			"ambulance", "annihilator", "annihilator2", "apc", "ardent", "armytanker",
			"armytrailer", "armytrailer2", "asbo", "asea", "asea2", "asterope", "autarch",
		"avarus", "avenger", "avenger2", "avisa"})
		tripletspawntype = menu.add_feature("Spawn : ", "action_value_str", triplet_fun.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local hash = gameplay.get_hash_key(VehModSpawn)
			if feat.value == 0 then
				TripletVeh(hash)
				elseif feat.value == 1 then
				TripletVeh_WithPed(hash)
			end
		end)
		tripletspawntype["hidden"] = true
		tripletspawntype:set_str_data({"Vehicles Only", "Vehicles + Bodyguard"})
		SingleSpawntype = menu.add_feature("Spawn : ", "action_value_str", triplet_fun.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local hash = gameplay.get_hash_key(VehModSpawn)
			local pid = Get_PID(SingleSpawntype:get_str_data()[SingleSpawntype.value + 1])
			SpawnVeh(hash, pid)
		end)
		SingleSpawntype:set_str_data({"Player 0"})
		SingleSpawntype["value"] = 0
	end
	--INFO: Countermeasure Hotkey
	local Counter_key = menu.add_feature("Flare Countermeasures", "value_i", globalFeatures.moist_hotkeys,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["counter_Hotkey"] = true
		if feat["on"] then
			local key = MenuKey()
			key:push_str("LCONTROL")
			-- key:push_str("RCONTROL")
			if key:is_down() then
				pped = player.get_player_ped(player.player_id())
				local pos = v3()
				pos = player.get_player_coords(player.player_id())
				pos.z = pos.z + 20.00
				-- local posz
				-- posz, pos.z = gameplay.get_ground_z(pos)
				local offset = v3()
				offset.x = 15.0
				offset.y = -15.0
				offset.z = -5.0
				local speed = feat.value
				local hash = gameplay.get_hash_key("WEAPON_FLAREGUN")
				gameplay.shoot_single_bullet_between_coords(pos, pos + offset, 1000.00, hash, pped, false, true,
				speed)
				system.wait(10)
			end
			system.yield(10)
			return HANDLER_CONTINUE
		end
		Settings["counter_Hotkey"] = false
		return HANDLER_POP
	end)
	Counter_key["on"] = Settings["counter_Hotkey"]
	Counter_key["max"] = 10000
	Counter_key["min"] = 1
	Counter_key["value"] = 1550
	Counter_key["mod"] = 75
	--INFO: ******************  My Vehicle Control & Overide!! **********************
	Vehicle_Control = menu.add_feature("Vehicle Experiments", "parent", globalFeatures.moist_test.id).id
	local speedup_done = false
	SpeedupMyVeh =  menu.add_feature("Speed Up My Vehicle", "toggle", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pid, PlyVeh = player.player_id(), player.get_player_vehicle(player.player_id())
		if feat["on"] then
			if not speedup_done then
				vehicle.set_vehicle_undriveable(PlyVeh, true)
				playervehspd(pid, 30000.000)
				vehicle.set_vehicle_undriveable(PlyVeh, false)
				speedup_done = true
			end
			if not player.is_player_in_any_vehicle(player.player_id()) then
				SpeedupMyVeh["on"] = false
				elseif player.is_player_in_any_vehicle(player.player_id()) then
				vehicle.set_vehicle_engine_torque_multiplier_this_frame(PlyVeh, 650.00)
			end
			return HANDLER_CONTINUE
		end
		if not feat["on"] then
			speedup_done = false
		end
		return HANDLER_POP
	end)
	SpeedupMyVeh["on"] = false
	Veh_setgear = menu.add_feature("Set Current Gear: ", "value_i", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
				vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
			end
			return HANDLER_CONTINUE
		end
	end)
	Veh_setgear["max"] = 8
	Veh_setgear["min"] = 0
	Veh_setgear["value"] = 0
	Veh_setgear["on"] = false
	Veh_set_nextgear = menu.add_feature("Set Next Gear: ", "value_i", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
				vehicle.set_vehicle_next_gear(PlyVeh, feat.value)
				-- vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
			end
			return HANDLER_CONTINUE
		end
	end)
	Veh_set_nextgear["max"] = 8
	Veh_set_nextgear["min"] = 0
	Veh_set_nextgear["value"] = 0
	Veh_set_nextgear["on"] = false
	Veh_set_maxgear = menu.add_feature("Set Max Gear: ", "value_i", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
				vehicle.set_vehicle_max_gear(PlyVeh, feat.value)
				-- vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
			end
			return HANDLER_CONTINUE
		end
	end)
	Veh_set_maxgear["max"] = 8
	Veh_set_maxgear["min"] = 0
	Veh_set_maxgear["value"] = 0
	Veh_set_maxgear["on"] = false
	Veh_OVRCTRL_Modifier = menu.add_feature("Function Modifier Value: ", "action_value_f", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local modifier = feat.value
		Veh_set_gear_ratio["mod"] = modifier
		Veh_set_torq_ratio["mod"] = modifier
	end)
	Veh_OVRCTRL_Modifier["max"] = 800.00
	Veh_OVRCTRL_Modifier["min"] = -1.0
	Veh_OVRCTRL_Modifier["value"] = 1.00
	Veh_OVRCTRL_Modifier["mod"] = 2.00
	Veh_set_gear_ratio = menu.add_feature("Set Current Gear Ratio: ", "action_value_f", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local PlyVeh = player.get_player_vehicle(player.player_id())
		local Gear = vehicle.get_vehicle_current_gear(PlyVeh)
		if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 and Gear ~= 0 then
			vehicle.set_vehicle_gear_ratio(PlyVeh, Gear, feat.value)
		end
	end)
	Veh_set_gear_ratio["max"] = 800.00
	Veh_set_gear_ratio["min"] = -30.00
	Veh_set_gear_ratio["value"] = 1.80
	Veh_set_gear_ratio["mod"] = 0.10
	Veh_set_torq_ratio = menu.add_feature("Set Veh orq Ratio: ", "value_f", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			vehicle.set_vehicle_engine_torque_multiplier_this_frame(PlyVeh, feat.value)
			return HANDLER_CONTINUE
		end
	end)
	Veh_set_torq_ratio["max"] = 800.00
	Veh_set_torq_ratio["min"] = -30.00
	Veh_set_torq_ratio["value"] = 1.80
	Veh_set_torq_ratio["mod"] = 0.10
	Veh_set_torq_ratio["on"] = false
	Vehicle_Control_getGear = menu.add_feature("Get Current Gear", "toggle", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
				Veh_setgear["max"] = vehicle.get_vehicle_max_gear(PlyVeh)
				Veh_set_nextgear["max"] = vehicle.get_vehicle_max_gear(PlyVeh)
				MyCurrentGear = vehicle.get_vehicle_current_gear(PlyVeh)
				MyvehControl["MyGearNow"] = MyCurrentGear
				MyvehControl["MyNextGear"] = vehicle.get_vehicle_next_gear(PlyVeh)
				MyvehControl["MyMaxGear"] = vehicle.get_vehicle_max_gear(PlyVeh)
				Ratio = vehicle.get_vehicle_gear_ratio(PlyVeh, MyCurrentGear)
				MyvehControl["MyGearRatio"] = Ratio
			end
			return HANDLER_CONTINUE
		end
	end)
	Vehicle_Control_getGear["on"] = false
	Vehicle_Control_SetGear = menu.add_feature("Set Gear", "toggle", Vehicle_Control,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
				if controls.is_control_pressed(1, 71) and controls.is_control_just_pressed(1, 73) then
					Next = (vehicle.get_vehicle_current_gear(PlyVeh) + 1)
					vehicle.set_vehicle_next_gear(PlyVeh, Next)
					vehicle.set_vehicle_current_gear(PlyVeh, Next)
					Veh_setgear["on"] = true
					Veh_setgear["value"] = Next
				end
				elseif not controls.is_control_pressed(1, 71) and controls.is_control_pressed(1, 73) and
				controls.is_control_just_pressed(1, 68) then
				Previous = (vehicle.get_vehicle_current_gear(PlyVeh) - 1)
				vehicle.set_vehicle_next_gear(PlyVeh, Previous)
				vehicle.set_vehicle_current_gear(PlyVeh, Previous)
				Veh_setgear["on"] = true
				Veh_setgear["value"] = Previous
			end
			return HANDLER_CONTINUE
		end
		controls.disable_control_action(1, 114, false)
		controls.disable_control_action(1, 73, false)
		controls.disable_control_action(1, 68, false)
		return HANDLER_POP
	end)
	Vehicle_Control_SetGear["on"] = false
	global_func.BailExit = menu.add_feature("Bail/Exit Vehicle", "action_value_i", globalFeatures.self_veh,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(player.player_id())
		local eject = {0, 1, 16, 64, 256, 4160, 262144, 320, 512, 131072}
		ai.task_leave_vehicle(pped, player.get_player_vehicle(player.player_id()), eject[feat.value])
		return HANDLER_POP
	end)
	global_func.BailExit["max"] = #eject
	global_func.BailExit["min"] = 1
	global_func.BailExit["value"] = 6
	global_func.Veh_no_col = menu.add_feature("Vehicle has no collision", "toggle", globalFeatures.self_veh,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			local myped = player.get_player_ped(player.player_id())
			if ped.is_ped_in_any_vehicle(myped) then
				local Curveh = ped.get_vehicle_ped_is_using(myped)
				network.request_control_of_entity(Curveh)
				entity.set_entity_collision(Curveh, true, true, true)
			end
			return HANDLER_POP
		end
		local myped = player.get_player_ped(player.player_id())
		if ped.is_ped_in_any_vehicle(myped) then
			local Curveh = ped.get_vehicle_ped_is_using(myped)
			network.request_control_of_entity(Curveh)
			entity.set_entity_collision(Curveh, false, true, true)
		end
		system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE
	end)
	global_func.mk1boostrefill = menu.add_feature("VolticBoost Delayed Refill(MK1)", "toggle", globalFeatures.self_veh,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["global_func.mk1boostrefill"] = true
		if feat["on"] then
			local myped = player.get_player_ped(player.player_id())
			if ped.is_ped_in_any_vehicle(myped) == true then
				local Curveh = ped.get_vehicle_ped_is_using(myped)
				if vehicle.is_vehicle_rocket_boost_active(Curveh) == false then
					return HANDLER_CONTINUE
				end
				system.wait(5000)
				vehicle.set_vehicle_rocket_boost_percentage(Curveh, 100.00)
			end
			system.yield(Settings["loop_feat_delay"])
			return HANDLER_CONTINUE
		end
		Settings["global_func.mk1boostrefill"] = false
		return HANDLER_POP
	end)
	global_func.mk1boostrefill["on"] = Settings["global_func.mk1boostrefill"]
	global_func.mk2boostrefill = menu.add_feature("VolticBoost Instant Recharge(MK2)", "toggle", globalFeatures.self_veh,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["global_func.mk2boostrefill"] = true
		if feat["on"] then
			local myped = player.get_player_ped(player.player_id())
			if ped.is_ped_in_any_vehicle(myped) == true then
				local Curveh = ped.get_vehicle_ped_is_using(myped)
				vehicle.set_vehicle_rocket_boost_refill_time(Curveh, 0.000001)
			end
			system.yield(Settings["loop_feat_delay"])
			return HANDLER_CONTINUE
		end
		Settings["global_func.mk2boostrefill"] = false
		return HANDLER_POP
	end)
	global_func.mk2boostrefill["on"] = Settings["global_func.mk2boostrefill"]
	global_func.veh_rapid_fire = menu.add_feature("RapidFire RepairLoop Glitch", "toggle", globalFeatures.self_veh,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["global_func.veh_rapid_fire"] = true
		if feat["on"] then
			local myped = player.get_player_ped(player.player_id())
			if ped.is_ped_in_any_vehicle(myped) == true then
				local Curveh = ped.get_vehicle_ped_is_using(myped)
				vehicle.set_vehicle_fixed(Curveh)
				vehicle.set_vehicle_deformation_fixed(Curveh)
			end
			return HANDLER_CONTINUE
		end
		Settings["global_func.veh_rapid_fire"] = false
		return HANDLER_POP
	end)
	global_func.veh_rapid_fire["on"] = Settings["global_func.veh_rapid_fire"]
	global_func.rapidfire_hotkey1 = menu.add_feature("RapidFire RepairLoop Hotkey", "toggle", globalFeatures.moist_hotkeys,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["global_func.rapidfire_hotkey1"] = true
		if feat["on"] then
			local key = MenuKey()
			key:push_str("LCONTROL")
			key:push_str("r")
			if key:is_down() then
				global_func.veh_rapid_fire["on"] = not global_func.veh_rapid_fire.on
				moist_notify(
					global_func.veh_rapid_fire["on"] and "ON\n" or "OFF\n" .. global_func.veh_rapid_fire["on"] and
				"Glitch On\n" or "Set Repaired\n", "Switching Rapid Fire for your Current Vehicle ")
				system.wait(1200)
			end
			return HANDLER_CONTINUE
		end
		Settings["global_func.rapidfire_hotkey1"] = false
		return HANDLER_POP
	end)
	global_func.rapidfire_hotkey1["on"] = Settings["global_func.rapidfire_hotkey1"]
	--INFO: Self Stat Hotkey Switches
	global_func.thermal_stat_switch_hotkey = menu.add_feature("Switch Thermal/NV Hotkey", "toggle", globalFeatures.moist_hotkeys,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["global_func.thermal_stat_switch_hotkey"] = true
		local stat = Get_Last_MP("HAS_DEACTIVATE_NIGHTVISION")
		local thermalstat_hash = gameplay.get_hash_key(stat)
		if feat["on"] then
			local key = MenuKey()
			key:push_str("LCONTROL")
			key:push_str("F11")
			if key:is_down() then
				local state = stats.stat_get_bool(thermalstat_hash, 0)
				local setstate = not state
				stats.stat_set_bool(thermalstat_hash, setstate, true)
				moist_notify("Thermal/Nightvision State: " .. tostring(setstate),
				"Thermal/Nightvision Stat Hot-Switch")
				system.wait(1200)
			end
			return HANDLER_CONTINUE
		end
		Settings["global_func.thermal_stat_switch_hotkey"] = false
		return HANDLER_POP
	end)
	global_func.thermal_stat_switch_hotkey["on"] = Settings["global_func.thermal_stat_switch_hotkey"]
	local cross_hair = menu.add_feature("Show Weapon Recticle", "toggle", globalFeatures.self_options,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["Weapon_Recticle"] = true
		if feat["on"] then
			ui.show_hud_component_this_frame(14)
			return HANDLER_CONTINUE
		end
		Settings["Weapon_Recticle"] = false
		return HANDLER_POP
	end)
	cross_hair["on"] = Settings["Weapon_Recticle"]
end
self_func()
--TODO: CODE FIXUP BOOKMARK POINT
function set_waypoint(pid)
	local pos = v3()
	pos = player.get_player_coords(pid)
	if pos.x and pos.y then
		local coord = v2()
		coord.x = pos.x
		coord.y = pos.y
		ui.set_new_waypoint(coord)
	end
end
--INFO: Player stats
RTT_stat_result = "0"
local RTT_Host = menu.add_feature("Get RTT Host Add to PlayerBar", "toggle", globalFeatures.moist_UI_OSD ,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat_hash = gameplay.get_hash_key("MPPLY_AVERAGE_RTT")
	Settings["RTT_Host"] = true
	while feat["on"] do
		RTT_stat_result = tostring(stats.stat_get_int(stat_hash, 0))
		system.yield(0)
		osd_HostRTT["on"] = true
	end
	osd_HostRTT["on"] = false
	Settings["RTT_Host"] = false
	return HANDLER_POP
end)
RTT_Host["on"] = Settings["RTT_Host"]
osd_HostRTT = menu.add_feature("Host Receive Transmit Time", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		local pos = v2()
		pos.x = .9625
		pos.y =  0.0272
		ui.set_text_scale(0.175)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)	
		ui.draw_text("~h~RTT: " .. tostring(RTT_stat_result), pos)
		pos.x = .9635
		pos.y =  0.0265
		ui.set_text_scale(0.178)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)	
		ui.draw_text("~h~RTT: " .. tostring(RTT_stat_result), pos)
		system.yield(0)
	end
	return HANDLER_POP
end)
osd_HostRTT["hidden"] = true
local activecharacter_stat = menu.add_feature("Get Active Character", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat_hash = gameplay.get_hash_key("MPPLY_LAST_MP_CHAR")
	local stat_result = stats.stat_get_int(stat_hash, 0)
	moist_notify("Last Used Character:\n" .. stat_result, "Moists Self Stat Options")
end)
local activecharacter_stat = menu.add_feature("is Active Character", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat_hash = gameplay.get_hash_key("MP0_CHAR_ISACTIVE")
	local stat_result = tostring(stats.stat_get_bool(stat_hash, 0))
	moist_notify("Last Used Character:\n" .. stat_result, "Moists Self Stat Options")
end)
local mental_stat = menu.add_feature("Get Mental State", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PLAYER_MENTAL_STATE")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_float(stat_hash, 0)
	moist_notify("Current Mental State:\n" ..stat_result, "Moists Self Stat Options")
end)
local parachute_stat1 = menu.add_feature("Get Parachute Current Tint", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PARACHUTE_CURRENT_TINT")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_int(stat_hash, 0)
	moist_notify("Current Tint:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat2 = menu.add_feature("Get Parachute Current Smoke", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PARACHUTE_CURRENT_SMOKE")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_int(stat_hash, 0)
	moist_notify("Current Smoke:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat3 = menu.add_feature("Get Parachute Current Pack", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PARACHUTE_CURRENT_PACK")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_int(stat_hash, 1)
	moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat3 = menu.add_feature("Get Parachute Last Used", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("LAST_USED_PARACHUTE")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_int(stat_hash, 1)
	moist_notify("Last Used Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
local thermal = menu.add_feature("Check Thermal/NV State", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("HAS_DEACTIVATE_NIGHTVISION")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_bool(stat_hash, 0)
	local state
	if stat_result == true then
		state = "OFF"
		else
		state = "ON"
	end
	moist_notify("Thermal/Nightvision State:\n" .. state, "Moists Self Stat Options")
end)
local helmet_visor = menu.add_feature("Helmet Visor State", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("IS_VISOR_UP")
	local stat_hash = gameplay.get_hash_key(stat)
	local stat_result = stats.stat_get_bool(stat_hash, 0)
	if stat_result == true then
		state = "UP"
		else
		state = "DOWN"
	end
	moist_notify("Helmet Visor State:\n", state)
end)
local stat_one = menu.add_feature("Stat State Check", "action", globalFeatures.self_statcheck,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local vehstats = {"MPSV_VEHICLE_BS_", "MPSV_IMPOUND_TIME_", "MPSV_PREMIUM_PAID_", "MPSV_MODEL_", "MPSV_FLAGS_", "MPSV_PRICE_PAID_"}
	statstest = {"YACHT_NAME","YACHT_NAME2","GB_GANG_NAME","GB_GANG_NAME2","FM_CUT_DONE","INV_YACHT_NAME_ID"}
	for i = 0, 316 do
		for y = 1, #vehstats do
			local stat = Get_Last_MP(vehstats[y] .. i)
			local stat_hash = gameplay.get_hash_key(stat)
			local stat_result = stats.stat_get_int(stat_hash, 0)
			Debug_Out(tostring(stat) .. " : " .. tostring(stat_hash) .."\nValue = " .. tostring(stat_result), false)
		end
	end
	for i = 1, #statstest do
		local stat = Get_Last_MP(statstest[i])
		local stat_hash = gameplay.get_hash_key(stat)
		local stat_result = tostring(stats.stat_get_u64(stat_hash)) .. "\n" .. tostring(stats.stat_get_i64(stat_hash)) .. "\n" .. tostring(stats.stat_get_int(stat_hash, 0)) 
		Debug_Out(tostring(stat) .. " : " .. tostring(stat_hash) .."\nValue = " .. tostring(stat_result), false)
		moist_notify(tostring(stat) .. " : " .. tostring(stat_hash) .."\nValue = " .. tostring(stat_result), "")
	end
end)
local Defenses_forceon = menu.add_feature("Force Yacht Defences ON Assosiates", "toggle", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local stat = Get_Last_MP("YACHT_DEFENCE_SETTING")
		local stat_hash = gameplay.get_hash_key(stat)
		stats.stat_set_int(stat_hash, 7, true)
		return HANDLER_CONTINUE
	end
end)
local ClubPop = menu.add_feature("Auto Popular Nightclub", "toggle", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local stat = Get_Last_MP("CLUB_POPULARITY")
		local stat_hash = gameplay.get_hash_key(stat)
		local result = stats.stat_get_int(stat_hash, 1)
		if result < 900 then
			stats.stat_set_int(stat_hash, 1000, true)
			system.yield(20000)
		end
		system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE
	end
end)
local Orb_cool = menu.add_feature("Auto Reset Orbital Cooldown", "toggle", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local stat = Get_Last_MP("ORBITAL_CANNON_COOLDOWN")
		local stat_hash = gameplay.get_hash_key(stat)
		local result = stats.stat_get_int(stat_hash, 1)
		if result ~= 0 then
			stats.stat_set_int(stat_hash, 0, true)
			system.yield(20000)
		end
		system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE
	end
end)
local parachute_setstat1 = menu.add_feature("Set Parachute Current Pack", "action_value_i", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PARACHUTE_CURRENT_PACK")
	local stat_hash = gameplay.get_hash_key(stat)
	local i = tonumber(feat.value)
	stats.stat_set_int(stat_hash, i, true)
	local stat_result = stats.stat_get_int(stat_hash, 1)
	moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
parachute_setstat1["max"] = 100
parachute_setstat1["min"] = 0
local parachute_setstat2 = menu.add_feature("Set Parachute Current Tint", "action_value_i", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PARACHUTE_CURRENT_TINT")
	local stat_hash = gameplay.get_hash_key(stat)
	local i = tonumber(feat.value)
	stats.stat_set_int(stat_hash, i, true)
	local stat_result = stats.stat_get_int(stat_hash, 1)
	moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
parachute_setstat2["max"] = 80
parachute_setstat2["min"] = 0
--INFO: Force Mental State
mental_statset = menu.add_feature("Set Mental State", "action_value_i", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("PLAYER_MENTAL_STATE")
	local stat_hash = gameplay.get_hash_key(stat)
	local i = tonumber(feat.value)
	local stat_result1 = stats.stat_get_float(stat_hash, 0)
	stats.stat_set_float(stat_hash, i, true)
	local stat_result2 = stats.stat_get_float(stat_hash, 0)
	moist_notify("Mental State was: " .. stat_result1 .. "\nMental State Now: " .. stat_result2, "Moists Self Stat Options")
end)
mental_statset["max"] = 100
mental_statset["min"] = 0
mental_statset["value"] = 0
local thermal_set = menu.add_feature("Switch Helmet Visor State", "action", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("IS_VISOR_UP")
	local stat_hash = gameplay.get_hash_key(stat)
	local statenow
	local state = stats.stat_get_bool(stat_hash, 0)
	local setstate = not state
	stats.stat_set_bool(stat_hash, setstate, true)
	local stat_result = stats.stat_get_bool(stat_hash, 0)
	if stat_result == true then
		statenow = "UP"
		else
		statenow = "DOWN"
	end
	moist_notify("Switch Helmet Visor State:\nVisor State Now : " .. statenow, "Moists Self Stat Options")
end)
local helmet_visor_set = menu.add_feature("Switch Thermal/NV State", "action", globalFeatures.self_statsetup.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local stat = Get_Last_MP("HAS_DEACTIVATE_NIGHTVISION")
	local stat_hash = gameplay.get_hash_key(stat)
	local state = stats.stat_get_bool(stat_hash, 0)
	local setstate = not state
	local statenow
	stats.stat_set_bool(stat_hash, setstate, true)
	local stat_result = stats.stat_get_bool(stat_hash, 0)
	if stat_result == true then
		statenow = "OFF"
		else
		statenow = "ON"
	end
	moist_notify("Thermal / Nightvision State:\n" .. statenow, "Moists Self Stat Options")
end)
--INFO: Quick Stat Setups
local em_rec = {}
OfficeFloorStats = {{"LIFETIME_SELL_COMPLETE",1100},{"LIFETIME_CONTRA_EARNINGS",25000000}}
OfficeFloorStatCheck = {"LIFETIME_BUY_COMPLETE", "LIFETIME_BUY_UNDERTAKEN"}
local check = {}
OfficeFloor_Money = menu.add_feature("Setup Office Floor Money Decor", "action", globalFeatures.quick_stats,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 1, #OfficeFloorStatCheck do
		local stat = Get_Last_MP(OfficeFloorStatCheck[i])
		local stat_hash = gameplay.get_hash_key(stat)
		check[#check+1] = stats.stat_get_int(stat_hash, 0)
	end
	if  check[1] < 1 or check[2] < 1 then
		moist_notify("You need to do a Buy Mission first")
		elseif check[1] >= 0 and check[2] >= 0 then
		for i = 1, #OfficeFloorStats do
			local stat = Get_Last_MP(OfficeFloorStats[i][1])
			local stat_hash = gameplay.get_hash_key(stat)
			em_rec[#em_rec + 1] = stats.stat_get_int(stat_hash, 0)
			stats.stat_set_int(stat_hash, OfficeFloorStats[i][2], true)
		end
		moist_notify("Stats Setup\nFinished", "Moists Self Stat Options")
		moist_notify("Now Creating Stat Recovery Script\nSaved in scripts folder", "Moists Self Stat Options")
		Create_stat_RecoveryScript()
		moist_notify("Stats Recovery Script\nDone", "Moists Self Stat Options")
	end
	moist_notify("Now Switch Sessions Complete a Sell Mission and Switch Sessions Again to Apply the Money Decor")
end)
local setup_casinostats = menu.add_feature("Setup Casino Heist Stealth Diamonds", "action", globalFeatures.quick_stats,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 1, #heiststat_setup do
		local stat = Get_Last_MP(heiststat_setup[i][1])
		local stat_hash = gameplay.get_hash_key(stat)
		em_rec[#em_rec + 1] = stats.stat_get_int(stat_hash, 0)
		stats.stat_set_int(stat_hash, heiststat_setup[i][2], true)
	end
	moist_notify("Stats Setup\nFinished", "Moists Self Stat Options")
	moist_notify("Now Creating Stat Recovery Script\nSaved in scripts folder", "Moists Self Stat Options")
	Create_stat_RecoveryScript()
	moist_notify("Stats Recovery Script\nDone", "Moists Self Stat Options")
end)
script_recovery = menu.add_feature("Recovery/Transfer", "parent", globalFeatures.self_statsetup.id)
local character_design = {"MESH_HEADBLEND", "MESH_TEXBLEND", "MESH_VARBLEND", "HEADBLEND_OVER_BLEMISH_PC", "HEADBLEND_OVERLAY_BEARD_PC", "HEADBLEND_OVERLAY_EYEBRW_PC", "HEADBLEND_OVERLAY_WETHR_PC", "HEADBLEND_OVERLAY_MAKEUP_PC", "HEADBLEND_OVERLAY_DAMAGE_PC", "HEADBLEND_OVERLAY_BASE_PC", "HEADBLEND_GEOM_BLEND", "HEADBLEND_TEX_BLEND", "HEADBLEND_VAR_BLEND", "HEADBLEND_DOM", "FEATURE_0", "FEATURE_1", "FEATURE_2", "FEATURE_3", "FEATURE_4", "FEATURE_5", "FEATURE_6", "FEATURE_7", "FEATURE_8", "FEATURE_9", "FEATURE_10", "FEATURE_11", "FEATURE_12", "FEATURE_13", "FEATURE_14", "FEATURE_15", "FEATURE_16", "FEATURE_17", "FEATURE_18", "FEATURE_19", "FEATURE_20", "HEADBLENDOVERLAYCUTS_PC", "HEADBLENDOVERLAYMOLES_PC", "HEADBLEND_OVERLAY_BLUSHER", "OVERLAY_BODY_2", "OVERLAY_BODY_3", "OVERLAY_BODY_1"}
local des_rec = {}
char_design = menu.add_feature("Create Character Design Script", "action", script_recovery.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local design_value = {"1.0", "0.0", "1.0", "1.0", "1.0", "1.0", "1.0", "0.050000000745058", "0.83787792921066", "0.0", "0.0"}
	for  i = 1, #character_design do
		local stat = Get_Last_MP(character_design[i])
		local stat_hash = gameplay.get_hash_key(stat)
		des_rec[i] = stats.stat_get_float(stat_hash, 0)
	end
	Create_stat_Script()
end)
function write_recScript(text)
	local file = io.open(Paths.Root  .. "\\scripts\\Moists_statrecovery.lua", "a")
	io.output(file)
	io.write(text)
	io.close()
end
function write_stat(text)
	local file = io.open(Paths.Root  .. "\\scripts\\Moists_stat_out.lua", "a")
	io.output(file)
	io.write(text)
	io.close()
end
function Create_stat_Script()
	local txt = Cur_Date_Time()
	write_stat('function Get_Last_MP(a)local b=a;local c=gameplay.get_hash_key("MPPLY_LAST_MP_CHAR")local d=stats.stat_get_int(c,1)return string.format("MP"..d.."_"..b)end;function Get_Hash(e)return gameplay.get_hash_key(e)end\n\n')
	write_stat('menu.add_feature("statwriter Player Design'..txt ..'", "action", 0, function(feat)\n\n')
	for i = 1, #character_design do
		write_stat('local stat = Get_Hash(Get_Last_MP("'..character_design[i]..'"))\n')
		write_stat('stats.stat_set_float(stat, '..des_rec[i]..', '..'true)\n')
	end
	write_stat('end)\n\n')
	des_rec = {}
end
function Create_stat_RecoveryScript()
	for i = 1, #heiststat_setup do
		local stat = Get_Last_MP(heiststat_setup[i][1])
		local stat_hash = gameplay.get_hash_key(stat)
	end
	local txt = Cur_Date_Time()
	write_recScript('menu.add_feature("Stat Recovery'..txt ..'", "action", 0,function(feat)\n\n')
	for i = 1, #em_rec do
		local stat, statval = heiststat_setup[i][2], em_rec[i]
		write_recScript('stats.stat_set_int('..stat..', '..statval..', '..'true)\n')
	end
	write_recScript('end)\n\n')
	em_rec = {}
end
--TODO: CODE FIX FIX FIX ME FUCK ME THEN FIX ME 
function Lobby_SE_Features()
	otr_all =  menu.add_feature("Give everyone OTR", "action", globalFeatures.lobby,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				Trigger_Event(-1973627888, pid, pid, utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
			end
		end
	end)
	nocops_all =  menu.add_feature("Give everyone Cop Bribe", "action", globalFeatures.lobby,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				Trigger_Event(0x66B0F59A, pid, pid, utils.time() - 60, utils.time(), script.get_global_i(2815059 + 4624), 1, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
			end
		end
	end)
	all2island =  menu.add_feature("Send Session to Island", "action", globalFeatures.lobby,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				Trigger_Event(0xDAF8082C, pid, 1300962917)
			end
			system.wait(0)
		end
		return HANDLER_POP
	end)
	local bountyallplayerses2 = menu.add_feature("set Bounty on Lobby2", "action", globalFeatures.lobby,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if player.is_player_valid(pid) and player.get_player_scid(pid) ~= -1 then
				Send_Bounty(pid, 1)
				system.wait(100)
			end
		end
	end)
	--INFO: Send Bounty Function
	function Send_Bounty(pid, isNpc)
		--local isNpc = is_Npc and 1 or 0
		if player.is_player_valid(pid) then
			for i = 0, 31 do
				local scid = player.get_player_scid(i)
				if (scid ~= -1 or scid ~= -1) then
					Trigger_Event(1915499503, i, i, pid, 3, 10000, 1, isNpc, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1920255 + 9), script.get_global_i(1920255 + 10))
				end
			end
		end
	end
	local pasivall = menu.add_feature("Passive Mode: ", "action_value_str", globalFeatures.lobby,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				if feat.value == 0 then
					Trigger_Event(0x4267b065, pid, 1, 1)
					system.yield(10)
					elseif feat.value == 1 then
					Trigger_Event(0x4267b065, pid, 2, 0)
					system.yield(10)
				end
			end
		end
	end)
	pasivall:set_str_data({"Block All", "Unblock All"})
end
if not NewDLC() then
	Lobby_SE_Features()
end
blip_all =  menu.add_feature("Give everyone Enemy Blips", "action", globalFeatures.lobby,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 0, 31 do
		local scid = player.get_player_scid(i)
		if scid ~= -1 then
			local pped = player.get_player_ped(i)
			local oldblip = ui.get_blip_from_entity(pped)
			ui.set_blip_colour(oldblip, 80)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
			ui.set_blip_colour(BlipIDs[#BlipIDs], i)
		end
	end
end)
Lester_Wanderall = menu.add_feature("Send Mk1 Lester Wandering by all", "action",  globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local me
	me	= player.player_id()
	for i=0,32 do
		if i ~= me and player.is_player_valid(i) then
			allplayer_lester(i)
		end
	end
end)
Lesteratk_Wanderall = menu.add_feature("MK1 Lester Annihilation", "action",  globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local me
	me	= player.player_id()
	for i=0,32 do
		if i ~= me and player.is_player_valid(i) then
			allplayer_atklester(i)
		end
	end
end)
allplayer_lester = function(playerid)
	local pedd = player.get_player_ped(playerid)
	local pos = v3()
	local offset = v3()
	local pedhash = gameplay.get_hash_key("ig_lestercrest_2")
	local mk2hash = gameplay.get_hash_key("Oppressor")
	pos = player.get_player_coords(playerid)
	pos.x = pos.x + 500
	pos.z = pos.z + 500
	streaming.request_model(pedhash)
	while (not streaming.has_model_loaded(pedhash)) do 
		system.wait(100)
	end
	escort[#escort+1] = ped.create_ped(29, pedhash, pos, pos.z, true, false)
	streaming.set_model_as_no_longer_needed(pedhash)
	streaming.request_model(mk2hash)
	while (not streaming.has_model_loaded(mk2hash)) do
		system.wait(100)
	end
	escortveh[#escortveh+1] = vehicle.create_vehicle(mk2hash, pos, pos.z, true, false)
	offset.x = 0.00
	offset.y = 0.00
	offset.z = 0.00
	entity.attach_entity_to_entity(escort[#escort], escortveh[#escortveh], 23191, offset, pos, true, true, true, 0, false)
	vehicle.set_vehicle_mod_kit_type(escortveh[#escortveh], 0)
	vehicle.get_vehicle_mod(escortveh[#escortveh], 10)
	vehicle.set_vehicle_mod(escortveh[#escortveh], 10, 0, false)
	entity.set_entity_god_mode(escort[#escort], true)
	entity.set_entity_god_mode(escortveh[#escortveh], true)
	ped.set_ped_combat_attributes(escort[#escort], 46, true)
	ped.set_ped_combat_attributes(escort[#escort], 1, true)
	ped.set_ped_combat_attributes(escort[#escort], 2, true)
	ped.set_ped_combat_attributes(escort[#escort], 52, true)
	ped.set_ped_combat_attributes(escort[#escort], 3, false)
	ped.set_ped_combat_range(escort[#escort], 2)
	ped.set_ped_combat_ability(escort[#escort], 2)
	ped.set_ped_combat_movement(escort[#escort], 2)
	ped.set_ped_into_vehicle(escort[#escort], escortveh[#escortveh], -1)
	vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 5)
	pos = player.get_player_coords(playerid)
	pos.x = pos.x + 10
	network.request_control_of_entity(escortveh[#escortveh])
	entity.set_entity_coords_no_offset(escortveh[#escortveh], pos)
	vehicle.set_vehicle_on_ground_properly(escortveh[#escortveh])
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escort[#escort])
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[#escortveh])
	if	ai.task_vehicle_drive_wander(escort[#escort], escortveh[#escortveh], 250, 262144) then return HANDLER_CONTINUE end
	ai.task_combat_ped(escort[#escort], pedd, 0, 16)
	streaming.set_model_as_no_longer_needed(mk2hash)
	entity.set_entity_as_no_longer_needed(escortveh[#escortveh])
	entity.set_entity_as_no_longer_needed(escort[#escort])
	return HANDLER_POP
end
allplayer_atklester = function(playerid)
	local pedd = player.get_player_ped(playerid)
	local pos = v3()
	local offset = v3()
	local pedhash = gameplay.get_hash_key("ig_lestercrest_2")
	local mk2hash = gameplay.get_hash_key("Oppressor")
	pos = player.get_player_coords(playerid)
	pos.x = pos.x + 500
	pos.z = pos.z + 500
	streaming.request_model(pedhash)
	while (not streaming.has_model_loaded(pedhash)) do
		system.wait(100)
	end
	escort[#escort+1] = ped.create_ped(29, pedhash, pos, pos.z, true, false)
	streaming.set_model_as_no_longer_needed(pedhash)
	streaming.request_model(mk2hash)
	while (not streaming.has_model_loaded(mk2hash)) do
		system.wait(100)
	end
	escortveh[#escortveh+1] = vehicle.create_vehicle(mk2hash, pos, pos.z, true, false)
	offset.x = 0.00
	offset.y = 0.00
	offset.z = 0.00
	entity.attach_entity_to_entity(escort[#escort], escortveh[#escortveh], 23191, offset, pos, true, true, true, 0, false)
	vehicle.set_vehicle_mod_kit_type(escortveh[#escortveh], 0)
	vehicle.get_vehicle_mod(escortveh[#escortveh], 10)
	vehicle.set_vehicle_mod(escortveh[#escortveh], 10, 0, false)
	entity.set_entity_god_mode(escort[#escort], true)
	entity.set_entity_god_mode(escortveh[#escortveh], true)
	ped.set_ped_combat_attributes(escort[#escort], 46, true)
	ped.set_ped_combat_attributes(escort[#escort], 1, true)
	ped.set_ped_combat_attributes(escort[#escort], 2, true)
	ped.set_ped_combat_attributes(escort[#escort], 52, true)
	ped.set_ped_combat_attributes(escort[#escort], 3, false)
	ped.set_ped_combat_range(escort[#escort], 2)
	ped.set_ped_combat_ability(escort[#escort], 2)
	ped.set_ped_combat_movement(escort[#escort], 2)
	ped.set_ped_into_vehicle(escort[#escort], escortveh[#escortveh], -1)
	vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 5)
	pos = player.get_player_coords(playerid)
	pos.x = pos.x + 10
	network.request_control_of_entity(escortveh[#escortveh])
	entity.set_entity_coords_no_offset(escortveh[#escortveh], pos)
	vehicle.set_vehicle_on_ground_properly(escortveh[#escortveh])
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escort[#escort])
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[#escortveh])
	if	ai.task_vehicle_drive_wander(escort[#escort], escortveh[#escortveh], 250, 262144) then return HANDLER_CONTINUE end
	ai.task_combat_ped(escort[#escort], pedd, 0, 16)
	streaming.set_model_as_no_longer_needed(mk2hash)
	entity.set_entity_as_no_longer_needed(escortveh[#escortveh])
	entity.set_entity_as_no_longer_needed(escort[#escort])
	return HANDLER_POP
end
local notallmod = menu.add_feature("UnMark all Players as Modder", "action", globalFeatures.protex,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for pid = 0, 31 do
		if player.player_id() ~= pid then
			player.unset_player_as_modder(pid, -1)
		end
	end
end)
--INFO: Session Kicks
function Session_SE_Kicks()
	
	function build_params(argcnt)
		local ParaMs = {}
		for i = 1, argcnt do
			local y = math.random(1, #kick_param_data)
			ParaMs[i] = kick_param_data[y]
		end
		return ParaMs
	end
	--INFO: **************************************************SESSION KICKS***************************************
	
	--INFO: Force host
	local hostnow
	HostForce = menu.add_feature("Kick Host until Session host", "toggle", globalFeatures.kick,function(feat)
		if feat["on"] then
			hostnow = player.get_host()
			fnd = player.is_player_friend(hostnow)
			if not network.network_is_host() then
				if hostnow ~= player.player_id() or hostnow ~= fnd then
					player.unset_player_as_modder(hostnow, -1)
					
					network.force_remove_player(hostnow)
				end
				system.wait(1)
			end
			if network.network_is_host() then
				moist_notify("Force Session Host Success", "Force Session Host")
				EnabledBlacklistFeature["on"] = not EnabledBlacklistFeature.on
				HostForce["on"] = false
				EnabledBlacklistFeature["on"] = not EnabledBlacklistFeature.on
				return
				elseif not network.network_is_host() and player.is_player_friend(player.get_host()) then
				moist_notify("Session Host is Currently your Friend\nDisabling Feature", "Force The Session Host Out")
				HostForce["on"] = false
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end)
	HostForce["on"] = false
	
	netbail_kick = menu.add_feature("Session Bail except Host", "action", globalFeatures.kick, function(feat)
		local starthost = player.get_host()
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				local fnd = player.is_player_friend(pid) or Players[pid].isFriend
				if pid ~= player.player_id() and pid ~= fnd then
					if network.network_is_host() ~= pid then
						
						Trigger_Event(1674887089, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
						
						network.force_remove_player(pid)
						system.yield(Settings["ScriptEvent_delay"])
					end
				end
				
				system.yield(Settings["ScriptEvent_delay"])
			end
		end
		
		system.yield(25)
		local time = utils.time_ms() + 8200
		while time > utils.time_ms() do
		end
		network.force_remove_player(starthost)
		return HANDLER_POP
	end)
	
	
end
if not NewDLC() then
	Session_SE_Kicks()
end
local hostnotify = false
function hostkickall(pid)
	if player.is_player_valid(pid) and pid ~= player.player_id() then
		
		network.network_session_kick_player(pid)
	end
end
function ForceRemoveAll(pid)
	if player.is_player_valid(pid) and pid ~= player.player_id() then
		
		network.force_remove_player(pid)
	end
end
local RemoveAllPlayers = menu.add_feature("Remove All Method: ", "value_str", globalFeatures.kick,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if feat.value == 0 and not network.network_is_host() then
			if not hostnotify then
				moist_notify("You are not Session Host!\nSwitch to Force Remove Method Instead!", "Session Wide Kick")
				hostnotify = true
			end
			elseif feat.value == 0 and network.network_is_host() then
			hostnotify = false
			for i = 0, 31 do
				hostkickall(i)
				system.yield(Settings["ScriptEvent_delay"])
				--	end
			end
			elseif feat.value == 1 then
			for i = 0, 31 do
				ForceRemoveAll(i)
			end
		end
		system.yield(Settings["ScriptEvent_delay"])
		return HANDLER_CONTINUE
	end
	hostnotify = false
	return HANDLER_POP
end)
RemoveAllPlayers:set_str_data({"Host Kick", "Force Remove"})
RemoveAllPlayers["value"] = 1
--BUG: ------------------Script Event Hooks----------------------------
function Script_Event_Hooks()
	passive_players = {}
	function Set_PassiveTracker()
		for pid = 0, 31 do
			Players[pid].isPassive = false
		end
	end
	Set_PassiveTracker()
	Passive_trackerIN = event.add_event_listener("player_join", function(e)
		local pid = tonumber(e["player"])
		Players[pid].isvgod = true
		Players[pid].isgod = true
		Players[pid].PlayerGodMode = false
		Players[pid].PlayerVehGodMode = false
		Players[pid].isint = true
		Players[pid].isvis = false
		Players[pid].PedSpawned = false
		Players[pid].isPassive = false
		Players[pid].isPaused = false
		Players[pid].isDamagedbY = nil
		Players[pid].IsFlagRemNotif = false
		Players[pid].isFriend = player.is_player_friend(pid)
		Session_Combat[pid].name = tostring(player.get_player_name(pid))
		for i = 0, 31 do
			Session_Combat[pid].kills[i] = 0
			Session_Combat[pid].killed[i] = 0
		end
		playergroups[pid + 1]  = player.get_player_group(pid)
		playerpeds[pid + 1] = player.get_player_ped(pid)
		orbitalProxy["on"] = false
		system.wait(800)
		orbitalProxy["on"] = true
		return
	end)
	Passive_trackerOUT = event.add_event_listener("player_leave", function(e)
		local pid = tonumber(e["player"])
		CombatStat_Dump(pid, true)
		BL_Notify[pid+1] = false
		BL_M_Notify[pid+1] = false
		Modders_DB[pid].flag = nil
		Modders_DB[pid].ismod = false
		Players[pid].name = nil
		Players[pid].isHost = false
		Players[pid].isFriend = false
		Players[pid].orbnotify = false
		Players[pid].orbnotify2 = false
		Players[pid].isScHost = false
		Players[pid].pulse = false
		Players[pid].isOTR = false
		Players[pid].Spectatable = false
		Players[pid].isNotifSpec = false
		Players[pid].isRC = false
		Players[pid].JoinTime = nil
		Players[pid].PedSpawned = false
		Players[pid].bounty = false
		Players[pid].bountyvalue = nil
		Players[pid].isUnDead = false
		Players[pid].isDead = false
		Players[pid].isPassive = false
		Players[pid].isTalking = false
		Players[pid].isTyping = false
		Players[pid].ActiveMissile = false
		Players[pid].flag = nil
		Players[pid].flags = nil
		Players[pid].ismod = false
		Players[pid].isgod = false
		Players[pid].isvgod = false
		Players[pid].IsFlagRemNotif = false
		Players[pid].KickedCount = 0
		Players[pid].isKicked = false
		Players[pid].PlayerGodMode = false
		Players[pid].PlayerVehGodMode = false
		Players[pid].isint = false
		Players[pid].Interiorname = ""
		Players[pid].intID = nil
		Players[pid].onlinecheck = false
		Players[pid].online_interior = ""
		Players[pid].onlineintID = nil
		Players[pid].isvis = false
		Players[pid].speed = 0.00
		Players[pid].BlipPID = 0
		Players[pid].isDamagedbY = nil
		SessionPlayers[pid].scid = -1
		SessionPlayers[pid].Name = nil
		playergroups[pid + 1]  = nil
		playerpeds[pid + 1] = nil
		orbitalProxy["on"] = false
		system.wait(800)
		orbitalProxy["on"] = true
		return
	end)
	--TODO: MISSILE TRACKING
	Missile, MissEntity, MissCount = {}, {}, 0
	MissileBlip = {}
	function Get_Missile_Entity(pid)
		repeat
			MissCount = MissCount + 1
		until MissCount == 25
		MissCount = 0
		MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
			local hash = entity.get_entity_model_hash(MissEntity[i])
			if hash == 1262355818 then
				if ui.get_blip_from_entity(MissEntity[i]) ~= 0 then return end
				--if MissileBlip[pid].Blip == nil then
				MissileBlip[pid+1] = ui.add_blip_for_entity(MissEntity[i])
				BlipIDs[#BlipIDs+1] = MissileBlip[pid+1]
				ui.set_blip_colour(MissileBlip[pid+1], 17)
				-- 368 / 548
				Missile[#Missile+1] = MissEntity[i]
				--end
			end
		end
	end
	
	function Missile_Destroy()
		local entID
		local myped = player.get_player_ped(player.player_id())
		local MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
			local hash = entity.get_entity_model_hash(MissEntity[i])
			if hash == 1262355818 then
				entID = MissEntity[i]
				moist_notify("Found a Sub Missile!", "")
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				local speed = entity.get_entity_speed(MissEntity[i])
				local pos = pos + (fwdvec * speed)
				moist_notify("Time to Make it Go BOOM!", "Got its Trajectory!", "")
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]) + (entity.get_entity_forward_vector(MissEntity[i]) * 20) , 59, true, false, 0.01, myped)
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]) + v3(math.random(1, 25),math.random(1, 25),math.random(1, 5)), 59, true, false, 0.01, myped)
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]), 59,  true, false, 0, myped)
				fire.add_explosion(pos, 59,  true, false, 0, myped)
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				pos = pos + (fwdvec * 15)
				fire.add_explosion(pos, 59, false, true, 0, myped)
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				pos = pos + (fwdvec * 40)
				fire.add_explosion(pos, 59, false, true, 0, myped)
			end
		end
		local MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
			local hash = entity.get_entity_model_hash(MissEntity[i])
			if hash == 1262355818 then
				if entID == MissEntity[i] and entity.is_entity_dead(MissEntity[i]) then
					moist_notify("Missile Seems Dead GJ!", "")
					elseif entID == MissEntity[i] and not entity.is_entity_dead(MissEntity[i]) then
					moist_notify("Try Again its Still Alive and Flying", "")
				end
			end
		end
	end
	
	function MK2_Missile_Destroy()
		local entID
		local myped = player.get_player_ped(player.player_id())
		local MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
			local hash = entity.get_entity_model_hash(MissEntity[i])
			if hash == 4845511 then
				entID = MissEntity[i]
				moist_notify("Found a MK2 Missile!", "")
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				local speed = entity.get_entity_speed(MissEntity[i])
				local pos = pos + (fwdvec * speed)
				moist_notify("Time to Make it Go BOOM!", "Got its Trajectory!", "")
				network.request_control_of_entity(MissEntity[i])
				entity.set_entity_max_speed(MissEntity[i], 1000000)
				network.request_control_of_entity(MissEntity[i])
				entity.set_entity_max_speed(MissEntity[i], 100000)
				network.request_control_of_entity(MissEntity[i])
				entity.set_entity_velocity(MissEntity[i], v3(999.99,9999.99,1000,000))
				network.request_control_of_entity(MissEntity[i])
				entity.set_entity_velocity(MissEntity[i], v3(999.99,9999.99,1000,000))
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]) + (entity.get_entity_forward_vector(MissEntity[i]) * 20) , 59, true, false, 0.01, myped)
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]) + v3(math.random(1, 25),math.random(1, 25),math.random(1, 5)), 59, true, false, 0.01, myped)
				fire.add_explosion(entity.get_entity_coords(MissEntity[i]), 59,  true, false, 0, myped)
				fire.add_explosion(pos, 59,  true, false, 0, myped)
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				pos = pos + (fwdvec * 15)
				fire.add_explosion(pos, 59, false, true, 0, myped)
				local pos = entity.get_entity_coords(MissEntity[i])
				local fwdvec = entity.get_entity_forward_vector(MissEntity[i])
				pos = pos + (fwdvec * 40)
				fire.add_explosion(pos, 59, false, true, 0, myped)
			end
		end
		local MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
			local hash = entity.get_entity_model_hash(MissEntity[i])
			if hash == 4845511 then
				if entID == MissEntity[i] and entity.is_entity_dead(MissEntity[i]) then
					moist_notify("Missile Seems Dead GJ!", "")
					elseif entID == MissEntity[i] and not entity.is_entity_dead(MissEntity[i]) then
					moist_notify("Try Again its Still Alive and Flying", "")
				end
			end
		end
	end
	--INFO: Player Tagging
	local PlayerTagginghook_id = 0
	PlayerTagginghook_event = function(source, target, params, count)
		local pid = source
		local player_source = tostring(player.get_player_name(source))
		if params[1] == 0xb521a553  then
			Players[pid].isPaused = true
			return false	
			elseif params[1] == 0x1d6e7298 then
			Players[pid].isPaused = false
			return false
		end
		return false
	end
	SEP_2 =function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["PlayerTagginghook"] = PlayerTagginghook.on
		if PlayerTagginghook["on"] then
			PlayerTagginghook_id = hook.register_script_event_hook(PlayerTagginghook_event)
			return HANDLER_POP
		end
		if PlayerTagginghook_id ~= 0 then
			hook.remove_script_event_hook(PlayerTagginghook_id)
			PlayerTagginghook_id = 0
		end
	end
	PlayerTagginghook = menu.add_feature("Player State Tagging", "toggle", globalFeatures.moistopt, SEP_2)
	PlayerTagginghook["on"] = Settings["PlayerTagginghook"]
	--INFO: Player RC Vehicle Detection
	local PlayerRCHook_id = 0
	PlayerRCHook_event = function(source, target, params, count)
		local pid = source
		local player_source = tostring(player.get_player_name(source))
		if params[1] == 0xA3693590 then
			if params[3] == 0xB53C6C52 then 
				Players[source].isRC = true
				moist_notify(player_source .. " Has Entered a RC Tank", "RC Vehicle Detection")
				return false
				elseif params[3] == 0xEEF345EC then
				Players[source].isRC = true
				moist_notify(player_source .. " Has Entered a RC Bandito", "RC Vehicle Detection")
				return false
			end
			return false
			elseif params[1] == 0x34d1413c then
			Players[source].isRC = false
			return false
		end
		return false
	end
	SEP_3 =function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["PlayerRCHook"] = PlayerRCHook.on
		if PlayerRCHook["on"] then
			PlayerRCHook_id = hook.register_script_event_hook(PlayerRCHook_event)
			return HANDLER_POP
		end
		if PlayerRCHook_id ~= 0 then
			hook.remove_script_event_hook(PlayerRCHook_id)
			PlayerRCHook_id = 0
		end
	end
	PlayerRCHook = menu.add_feature("Player RC Detection", "toggle", globalFeatures.moistopt, SEP_3)
	PlayerRCHook["on"] = Settings["PlayerRCHook"]
	local missilehook_id, Missile_ON_PID = 0, -1
	missilehook_event = function(source, target, params, count)
		local pid = source
		local player_source = tostring(player.get_player_name(source))
		if params[1] == 0xc3f4af3e then
			Players[source].ActiveMissile = true
			playerFeatures[pid].features["Find_Missiles"].feat["on"] = true
			playerFeatures[source].features["MissileCheck"].feat["on"] = true
			Missile_ON_PID = source
			moist_notify(player_source .. "\nLaunched a Submarine Guided Missile")
			Get_Missile_Entity(source)
			return false
		end
		return false
	end
	SEP_1 =function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Settings["missilehook"] = missilehook.on
		if missilehook["on"] then
			missilehook_id = hook.register_script_event_hook(missilehook_event)
			return HANDLER_POP
		end
		if missilehook_id ~= 0 then
			hook.remove_script_event_hook(missilehook_id)
			missilehook_id = 0
		end
	end
	missilehook = menu.add_feature("Guided Missile Tracking", "toggle", globalFeatures.moistopt, SEP_1)
	missilehook["on"] = Settings["missilehook"]
	BruteForceBlips = {}
	function BruteForce_RemoveBlips()
		local PedEntitys = ped.get_all_peds()
		local VehEntitys = vehicle.get_all_vehicles()
		local ObjEntitys = object.get_all_objects()
		for i = 1, #PedEntitys do
			if not ped.is_ped_a_player(PedEntitys[i]) then
				if ui.get_blip_from_entity(PedEntitys[i]) ~= 0 or ui.get_blip_from_entity(PedEntitys[i]) ~= nil then
					BruteForceBlips[#BruteForceBlips+1] = ui.get_blip_from_entity(PedEntitys[i]) 
				end
			end
		end
		for i = 1, #VehEntitys do
			if ui.get_blip_from_entity(VehEntitys[i]) ~= 0 or ui.get_blip_from_entity(VehEntitys[i]) ~= nil then
				BruteForceBlips[#BruteForceBlips+1] = ui.get_blip_from_entity(VehEntitys[i]) 
			end
		end
		for i = 1, #ObjEntitys do
			if ui.get_blip_from_entity(ObjEntitys[i]) ~= 0 or ui.get_blip_from_entity(ObjEntitys[i]) ~= nil then
				BruteForceBlips[#BruteForceBlips+1] = ui.get_blip_from_entity(ObjEntitys[i]) 
			end
		end
		for i = 1, #BruteForceBlips do
			ui.remove_blip(BruteForceBlips[i])
		end
	end
	Check_Missiles = menu.add_feature("Check Missiles", "toggle", globalFeatures.moist_tools.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			playerFeatures[pid].features["Find_Missiles"].feat["on"] = false
			Check_Missiles["on"] = false
			for pid = 0, 31 do
				if Players[pid].ActiveMissile then
					Players[pid].ActiveMissile = false
				end
			end
			for i = 1, #BlipIDs do
				ui.remove_blip(BlipIDs[i])
			end
			BruteForce_RemoveBlips()
			return HANDLER_POP
		end
		for pid = 0, 31 do
			if Players[pid].ActiveMissile then
				if Players[pid].ActiveMissile and not ai.is_task_active(player.get_player_ped(pid), 135) then
					playerFeatures[pid].features["Find_Missiles"].feat["on"] = false
					Check_Missiles["on"] = false
				elseif Players[pid].ActiveMissile and ai.is_task_active(player.get_player_ped(pid), 135) then return end
			end
		end
		return HANDLER_CONTINUE
	end)
	Check_Missiles["on"] = false
	
	
end
if not NewDLC() then
	Script_Event_Hooks()
end
--INFO: ***** WORLD CLEANUP FUNCTIONS ****
local World_Clean = function()
	local cleanup_done = true
	clear_World_ent = menu.add_feature("Fetched World Entities Move & Delete", "action", globalFeatures.entity_removal,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not cleanup_done == true then return end
		cleanup_done = false
		moist_notify("Trying to Remove all Controllable Cunts in the World", "World Cunt Removal Cleanups Disabled!")
		get_everything()
		system.wait(500)
		clear_world()
		moist_notify("All Controllable Cunts in range Removed!\nOnly Cunt Left: is You " .. player.get_player_name(player.player_id()), "World Cunt Removal! |Finished| Cleanups Enabled")
	end)
	clear_peds = menu.add_feature("Fetch all Peds Move & Delete", "action", globalFeatures.entity_removal,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not cleanup_done == true then return end
		cleanup_done = false
		moist_notify("In Range Controllable Ped Removal Started",  "World Cunt Removal! Clean-ups Disabled")
		get_allpeds()
		system.wait(250)
		move_delete_peds()
		moist_notify("Only Peds left are Cunts", "World Cunt Removal! |Finished| Cleanups Enabled")
	end)
	fetch_obj = menu.add_feature("Fetch all objects Move & Delete", "action", globalFeatures.entity_removal,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not cleanup_done == true then return end
		cleanup_done = false
		moist_notify("Cunt Cleaning Started", "World Cunt Removal! Cleanups Disabled")
		get_allobj()
		system.wait(250)
		move_delete_obj()
		moist_notify("Cuntish Objects Within Controllable Range Removed",  "World Cunt Removal! |Done| Cleanups Enabled")
	end)
	fetch_veh = menu.add_feature("Fetch all Vehicles Move & Delete", "action", globalFeatures.entity_removal,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not cleanup_done == true then return end
		cleanup_done = false
		moist_notify("Cunt Cleanup Started\n", " Cleanups Disabled until Done!")
		get_allveh()
		system.wait(250)
		move_delete_veh()
		moist_notify("Vehicles Cleared\n", " Cleanups Enabled")
	end)
	fetch_veh = menu.add_feature("Fetch all Pickups Move & Delete", "action", globalFeatures.entity_removal,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not cleanup_done == true then return end
		cleanup_done = false
		moist_notify("Cunt Cleanup Started\n", " Cleanups Disabled until Done!")
		get_all_pickups()
		system.wait(250)
		move_delete_pickups()
		moist_notify("Vehicles Cleared\n", " Cleanups Enabled")
	end)
	function get_allpeds()
		allpeds = ped.get_all_peds()
	end
	function get_allveh()
		allveh = vehicle.get_all_vehicles()
	end
	function get_allobj()
		allobj = object.get_all_objects()
	end
	function get_all_pickups()
		allpickups = object.get_all_pickups()
	end
	function get_everything()
		get_all_pickups()
		get_allveh()
		get_allobj()
		get_allpeds()
		object.get_all_pickups()
	end
	function clear_world()
		local pos = v3()
		pos.x = -5784.258301
		pos.y = -8289.385742
		pos.z = -136.411270
		get_all_pickups()
		get_allveh()
		get_allobj()
		get_allpeds()
		object.get_all_pickups()
		if not (#allpeds) == nil or 0 then
			for i = 1, #allpeds do
				if not ped.is_ped_a_player(allpeds[i]) then
					network.request_control_of_entity(allpeds[i])
					entity.set_entity_coords_no_offset(allpeds[i], pos)
					entity.set_entity_as_no_longer_needed(allpeds[i])
					entity.delete_entity(allpeds[i])
					system.wait(25)
				end
			end
		end
		allpeds = {}
		if not (#allpickups) == nil or 0 then
			for i = 1, #allpickups do
				network.request_control_of_entity(allpickups[i])
				entity.set_entity_coords_no_offset(allpickups[i], pos)
				entity.set_entity_as_no_longer_needed(allpickups[i])
				entity.delete_entity(allpickups[i])
				system.wait(10)
			end
		end
		allpickups = {}
		if not (#allveh) == nil or 0 then
			for i = 1, #allveh do
				if entity.is_an_entity(allveh[i]) then
					if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
						network.request_control_of_entity(allveh[i])
						entity.set_entity_coords_no_offset(allveh[i], pos)
						entity.set_entity_as_no_longer_needed(allveh[i])
						entity.delete_entity(allveh[i])
						system.wait(25)
					end
				end
			end
		end
		allveh = {}
		if not (#allobj) == nil or 0 then
			for i = 1, #allobj do
				network.request_control_of_entity(allobj[i])
				entity.set_entity_coords_no_offset(allobj[i], pos)
				entity.set_entity_as_no_longer_needed(allobj[i])
				entity.delete_entity(allobj[i])
				system.wait(25)
			end
		end
		allobj = {}
		cleanup_done = true
		return HANDLER_POP
	end
	function move_delete_obj()
		local pos = v3()
		pos.x = -5784.258301
		pos.y = -8289.385742
		pos.z = -136.411270
		for i = 1, #allobj do
			if not #allobj == nil or 0 then
				network.request_control_of_entity(allobj[i])
				entity.set_entity_coords_no_offset(allobj[i], pos)
				entity.set_entity_as_no_longer_needed(allobj[i])
				entity.delete_entity(allobj[i])
				system.wait(25)
			end
		end
		allobj = {}
		cleanup_done = true
		return HANDLER_POP
	end
	function move_delete_peds()
		local pos = v3()
		pos.x = -5784.258301
		pos.y = -8289.385742
		pos.z = -136.411270
		for i = 1, #allpeds do
			if not #allpeds == nil or 0 then
				if not ped.is_ped_a_player(allpeds[i]) then
					network.request_control_of_entity(allpeds[i])
					entity.set_entity_coords_no_offset(allpeds[i], pos)
					entity.set_entity_as_no_longer_needed(allpeds[i])
					entity.delete_entity(allpeds[i])
					system.wait(25)
				end
			end
		end
		allpeds = {}
		cleanup_done = true
		return HANDLER_POP
	end
	function move_delete_veh()
		local pos = v3()
		pos.x = -5784.258301
		pos.y = -8289.385742
		pos.z = -136.411270
		for i = 1, #allveh do
			if entity.is_an_entity(allveh[i]) then
				if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
					network.request_control_of_entity(allveh[i])
					entity.set_entity_coords_no_offset(allveh[i], pos)
					entity.set_entity_as_no_longer_needed(allveh[i])
					entity.delete_entity(allveh[i])
					system.wait(25)
				end
			end
		end
		allveh = {}
		cleanup_done = true
		return HANDLER_POP
	end
	function move_delete_pickups()
		local pos = v3()
		pos.x = -5784.258301
		pos.y = -8289.385742
		pos.z = -136.411270
		for i = 1, #allpickups do
			if entity.is_an_entity(allpickups[i]) then
				network.request_control_of_entity(allpickups[i])
				entity.set_entity_coords_no_offset(allpickups[i], pos)
				entity.set_entity_as_no_longer_needed(allpickups[i])
				entity.delete_entity(allpickups[i])
				system.wait(25)
			end
		end
	end
	allpickups = {}
	cleanup_done = true
	return HANDLER_POP
end
World_Clean()
--INFO: --------------------------Session Troll------------------
function RequestAnimDict(Dict, Timeout)
	if streaming.has_anim_dict_loaded(Dict) then
		return true
	end
	Timeout = (Timeout or 1800) + utils.time_ms()
	streaming.request_anim_dict(Dict)
	while utils.time_ms() < Timeout do
		if streaming.has_anim_dict_loaded(Dict) then
			return true
		end
		system.wait(0)
	end
	return false
end
function RequestAnimSet(Set, Timeout)
	if streaming.has_anim_set_loaded(Set) then
		return true
	end
	Timeout = (Timeout or 1800) + utils.time_ms()
	streaming.request_anim_set(Set)
	while utils.time_ms() < Timeout do
		if streaming.has_anim_set_loaded(Set) then
			return true
		end
		system.wait(0)
	end
	return false
end
local animationz = {{"priv_dance_p1", "mini@strip_club@private_dance@part1"},{"priv_dance_p2", "mini@strip_club@private_dance@part2"},{"priv_dance_p3", "mini@strip_club@private_dance@part3"},{"idle_a", "amb@code_human_in_car_mp_actions@fist_pump@bodhi@rps@base"},{"pm_incar_notdoinanythin", "rcmpaparazzo_2ig_3"}}
local Optiontext = {"Private Dance 1", "Private Dance 2", "Private Dance 3", "Fist Pump", "car_mp_actions@tit_squeeze",}
anim_dic = {"amb@bagels@male@walking@", "amb@code_human_cower@female@base", "amb@code_human_cower@female@enter", "amb@code_human_cower@female@exit", "amb@code_human_cower@female@idle_a", "amb@code_human_cower@female@react_cowering", "amb@code_human_cower@male@base", "amb@code_human_cower@male@enter", "amb@code_human_cower@male@exit", "amb@code_human_cower@male@idle_a", "amb@code_human_cower@male@idle_b", "amb@code_human_cower@male@react_cowering", "amb@code_human_cower_stand@female@base", "amb@code_human_cower_stand@female@enter", "amb@code_human_cower_stand@female@exit", "amb@code_human_cower_stand@female@idle_a", "amb@code_human_cower_stand@female@react_cowering", "amb@code_human_cower_stand@male@base", "amb@code_human_cower_stand@male@enter", "amb@code_human_cower_stand@male@exit", "amb@code_human_cower_stand@male@idle_a", "amb@code_human_cower_stand@male@react_cowering"}
anim_ation = {"static", "base", "enter", "exit_flee", "idle_c", "base_back_left", "base", "enter", "exit_flee", "idle_b", "idle_d", "base_back_left", "base", "enter", "exit_flee", "idle_c", "base_back_left_exit", "base", "enter", "exit_flee", "idle_b", "base_right"}
world_dance = menu.add_feature("World Ped Cower", "action_value_str", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local worldpeds = ped.get_all_peds()
	system.wait(0)
	RequestAnimDict(anim_dic[feat.value + 1], 10)
	system.wait(10)
	local AnimDictReguested = RequestAnimDict(anim_dic[feat.value + 1], 10)
	if AnimDictReguested then
		menu.notify(anim_dic[feat.value + 1].."\n" .. anim_ation[feat.value + 1], "Animation Request", 5, 0xffffffff)
		RequestAnimSet(anim_ation[feat.value + 1], 10)
		for i = 1, #worldpeds do
			if not ped.is_ped_a_player(worldpeds[i]) then
				network.request_control_of_entity(worldpeds[i])
				if ped.is_ped_in_any_vehicle(worldpeds[i]) then
					local pedveh = ped.get_vehicle_ped_is_using(worldpeds[i])
					system.wait(0)
					ai.task_leave_vehicle(worldpeds[i], pedveh, 512)
					system.wait(100)
				end
				ped.clear_ped_tasks_immediately(worldpeds[i])
				ai.task_play_anim(worldpeds[i], anim_dic[feat.value + 1], anim_ation[feat.value + 1], 10, 2.0, 9999999999999, 1, 1.5, true, true, true)
			end
		end
		system.wait(1)
	end
end)
world_dance:set_str_data(anim_ation)
world_dance2 = menu.add_feature("World Ped Dance", "action_value_str", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local worldpeds = ped.get_all_peds()
	system.wait(0)
	RequestAnimDict(anim_dic[feat.value + 1][2], 10)
	system.wait(10)
	local AnimDictReguested = RequestAnimDict(animationz[feat.value + 1][2], 10)
	if AnimDictReguested then
		menu.notify(animationz[feat.value + 1][2] .."\n" .. animationz[feat.value + 1][1], "Animation Request", 5, 0xffffffff)
		RequestAnimSet(animationz[feat.value + 1][1], 10)
		for i = 1, #worldpeds do
			if not ped.is_ped_a_player(worldpeds[i]) then
				network.request_control_of_entity(worldpeds[i])
				if ped.is_ped_in_any_vehicle(worldpeds[i]) then
					local pedveh = ped.get_vehicle_ped_is_using(worldpeds[i])
					system.wait(0)
					ai.task_leave_vehicle(worldpeds[i], pedveh, 512)
					system.wait(100)
				end
				ped.clear_ped_tasks_immediately(worldpeds[i])
				ai.task_play_anim(worldpeds[i], animationz[feat.value + 1][2], animationz[feat.value + 1][1], 1.0, 12.0, 999999999, 1, 0.9, true, true, true)
			end
		end
		system.wait(1)
	end
end)
world_dance2:set_str_data(Optiontext)
PedHaters, Vehnearby, player_peds = {}, {}, {}
GroupHate, HateFinshed = 0, true
function entity_Vehcheck(entityVehID)
	if streaming.is_model_a_vehicle(entity.get_entity_model_hash(entityVehID)) then
		return true
		else
		return false
	end
end
--TODO: Peds Hate World
local PedHaters, player_groups, player_peds = {}, {}, {}
local GroupHate
function Peds_hateWorld(pid, weap)
	local PedHaters = {}
	local configs = {{128,1},{183,1},{140,0},{129,1},{117,1},{17,1},{13,1},{2,1},{330,1},{272,1},{430,1},{7,1}}
	local player_group = player.get_player_group(pid)
	local pped = player.get_player_ped(pid)
	PedHaters = ped.get_all_peds()
	system.wait(100)
	GroupHate = ped.create_group()
	ped.set_relationship_between_groups(5, player_group, GroupHate)
	ped.set_relationship_between_groups(5, GroupHate, player_group)
	for i = 1, #PedHaters do
		if not ped.is_ped_a_player(PedHaters[i]) then
			network.request_control_of_entity(PedHaters[i])
			ped.set_ped_max_health(PedHaters[i], 7000)
			ped.set_ped_health(PedHaters[i], 7000)
			--entity.set_entity_god_mode(PedHaters[i], true)
			ped.set_ped_as_group_member(PedHaters[i], GroupHate)
			ped.set_ped_never_leaves_group(PedHaters[i], true)
			ped.set_can_attack_friendly(PedHaters[i], true, false)
			ped.set_ped_can_switch_weapons(PedHaters[i], true)
			ped.set_ped_combat_attributes(PedHaters[i], 46, true)
			ped.set_ped_combat_attributes(PedHaters[i], 52, true)
			ped.set_ped_combat_attributes(PedHaters[i], 1, true)
			ped.set_ped_combat_attributes(PedHaters[i], 2, true)
			ped.set_ped_combat_range(PedHaters[i], 2)
			ped.set_ped_combat_ability(PedHaters[i], 2)
			ped.set_ped_combat_movement(PedHaters[i], 2)
			local hash = gameplay.get_hash_key(weap)
			weapon.give_delayed_weapon_to_ped(PedHaters[i], hash, 0, 1)
			weapon.set_ped_ammo(PedHaters[i], hash, 1000000)
			
			ai.task_combat_ped(PedHaters[i], pped, 0, 16)
		end
		for y = 1, #configs do
			ped.set_ped_config_flag(PedHaters[i], configs[y][1], configs[y][2])
			ped.set_can_attack_friendly(PedHaters[i], true, false)
		end
	end
	ped.set_relationship_between_groups(5, player_group, GroupHate)
	ped.set_relationship_between_groups(5, GroupHate, player_group)
end
function Ped_eject(pid, ejtyp)
	PedHaters, player_groups, player_peds = {}, {}, {}
	player_groups[pid + 1]  = player.get_player_group(pid)
	player_peds[pid + 1] = player.get_player_ped(pid)
	PedHaters =  ped.get_all_peds()
	system.wait(100)
	GroupHate = ped.create_group()
	for y = 1, #player_groups do
		ped.set_relationship_between_groups(5, player_groups[y], GroupHate)
		ped.set_relationship_between_groups(5, GroupHate, player_groups[y])
	end
	for i = 1, #PedHaters do
		if not ped.is_ped_a_player(PedHaters[i]) then
			network.request_control_of_entity(PedHaters[i])
			ped.set_ped_max_health(PedHaters[i], 700)
			ped.set_ped_health(PedHaters[i], 700)
			ped.set_ped_as_group_member(PedHaters[i], GroupHate)
			ped.set_ped_never_leaves_group(PedHaters[i], true)
			if ped.is_ped_in_any_vehicle(PedHaters[i]) then
				pedveh = ped.get_vehicle_ped_is_using(PedHaters[i])
				system.wait(0)
				ai.task_leave_vehicle(PedHaters[i], pedveh, ejtyp)
				system.wait(200)
			end
		end
	end
end
--INFO: Session Wide Blamed Orbital Strike
OrbitalStrike_All = menu.add_feature("Orbital Session Blaming: ", "action_value_str",  globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos, exp_pos = v3(), v3()
	Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}
	for i = 1, #Audio_POS do
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
		pos.z = 2000.00
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
		pos.z = -2000.00
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 9999, true)
	end
	for pid = 0, 31 do
		local pos =	player.get_player_coords(pid)
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", pos, "DLC_sum20_Business_Battle_AC_Sounds", true, 500, true)
		system.wait(300)
	end
	system.wait(3000)
	graphics.set_next_ptfx_asset("scr_xm_orbital")
	while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
		graphics.request_named_ptfx_asset("scr_xm_orbital")
		system.wait(0)
	end
	for pid = 0, 31 do
		system.wait(300)
		if player.is_player_valid(pid) then
			pped = player.get_player_ped(pid)
			myped = player.get_player_ped(feat.value)
			pos = entity.get_entity_coords(pped)
			offset = v3(0.0,0.0,-2000.00)
			fire.add_explosion(pos, 59, true, false, 1.5, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
			system.wait(10)
			fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
			system.wait(10)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			system.wait(10)
			exp_pos.x = math.random(-2700, 2700)
			exp_pos.y = math.random(-3300, 7500)
			exp_pos.z = math.random(30, 90)
			fire.add_explosion(exp_pos, 74, true, false, 0, myped)
			graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
			audio.play_sound_from_coord(1, "DLC_XM_Explosions_Orbital_Cannon", pos, 0, true, 0, false)
			graphics.set_next_ptfx_asset("scr_xm_orbital")
			while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
				graphics.request_named_ptfx_asset("scr_xm_orbital")
				system.wait(0)
			end
			system.wait(5)
			gameplay.set_override_weather(3)
			gameplay.clear_cloud_hat()
			fire.add_explosion(pos, 59, false, true, 1.5, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
			system.wait(10)
			fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
			system.wait(10)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			system.wait(10)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			system.wait(10)
			graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
			graphics.set_next_ptfx_asset("scr_xm_orbital")
			while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
				graphics.request_named_ptfx_asset("scr_xm_orbital")
				system.wait(0)
			end
			graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
			fire.add_explosion(pos, 59, false, true, 1.5, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
			system.wait(10)
			fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
			system.wait(10)
			fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
			system.wait(10)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			system.wait(10)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			system.wait(10)
			fire.start_entity_fire(pped)
			system.wait(1)
		end
		system.wait(1)
	end
	return HANDLER_POP
end)
OrbitalStrike_All:set_str_data(Playerz)
OrbitalStrike_All["value"] = 33
OrbitalStrike_AllEntities = menu.add_feature("Orbital Session Entities Blaming: ", "action_value_str",  globalFeatures.lobbyGrief, function(feat)
	local pos, exp_pos, all_Entitiy, a, b, c, d = v3(), v3(), {}, {}, {}, {}, {}
	Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}
	for i = 1, #Audio_POS do
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
	end
	for pid = 0, 31 do
		local pos =	player.get_player_coords(pid)
		audio.play_sound_from_coord(-1, "Air_Defences_Activated", pos, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
		system.wait(300)
	end
	local a = vehicle.get_all_vehicles()
	for i = 1, #a do
		all_Entitiy[#all_Entitiy+1] = a[i]
	end
	local b = ped.get_all_peds()
	for i = 1, #b do
		all_Entitiy[#all_Entitiy+1] = b[i]
	end
	local c = object.get_all_objects()
	for i = 1, #c do
		all_Entitiy[#all_Entitiy+1] = c[i]
	end
	local d = object.get_all_pickups()
	for i = 1, #d do
		all_Entitiy[#all_Entitiy+1] = d[i]
	end
	myped = player.get_player_ped(feat.value)
	system.wait(2000)
	graphics.set_next_ptfx_asset("scr_xm_orbital")
	while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
		graphics.request_named_ptfx_asset("scr_xm_orbital")
		system.wait(0)
	end
	for y = 1, #all_Entitiy do
		system.wait(30)
		pos = entity.get_entity_coords(all_Entitiy[y])
		offset = v3(0.0,0.0,-2000.00)
		fire.add_explosion(pos, 59, true, false, 1.5, myped)
		system.wait(10)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		system.wait(10)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		system.wait(10)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		system.wait(10)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		system.wait(10)
		exp_pos.x = math.random(-2700, 2700)
		exp_pos.y = math.random(-3300, 7500)
		exp_pos.z = math.random(30, 90)
		fire.add_explosion(exp_pos, 74, true, false, 0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		audio.play_sound_from_coord(1, "DLC_XM_Explosions_Orbital_Cannon", pos, 0, true, 0, false)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.wait(0)
		end
		system.wait(5)
		gameplay.set_override_weather(3)
		gameplay.clear_cloud_hat()
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		system.wait(10)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		system.wait(10)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		system.wait(10)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 200.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 100.000, false, false, true)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.wait(0)
		end
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 200.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 100.000, false, false, true)
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		system.wait(10)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 200.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 100.000, false, false, true)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		system.wait(10)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 200.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 100.000, false, false, true)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		system.wait(10)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 200.000, false, false, true)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos + v3(100.0,100.0,100.00), v3(0, 0, 0), 100.000, false, false, true)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		system.wait(10)
		if entity.is_entity_a_ped(all_Entitiy[y]) then
			fire.start_entity_fire(all_Entitiy[y])
		end
		system.wait(1)
	end
	system.wait(1)
	return HANDLER_POP
end)
OrbitalStrike_AllEntities:set_str_data(Playerz)
set_on_fire = menu.add_feature("set world peds on fire", "toggle", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		local all_peds = ped.get_all_peds()
		for i = 1, #all_peds do
			if entity.is_entity_on_fire(all_peds[i]) then
				fire.stop_entity_fire(all_peds[i])
			end
		end
		return HANDLER_POP
	end
	system.yield(25)
	local all_peds = ped.get_all_peds()
	for i = 1, #all_peds do
		--if not ped.is_ped_a_player(all_peds[i]) then
		fire.start_entity_fire(all_peds[i])
	end
	--end
	return HANDLER_POP
end)
--INFO: Heart beat
local heart_beat = menu.add_feature("Heart Beat", "toggle", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if (feat.on) then
		pped = player.get_player_ped(player.player_id())
		system.wait(400)
		fire.add_explosion(v3(0,-1500,100), 58, true, false, 0, pped)
		system.wait(200)
		fire.add_explosion(v3(0,-1500,100), 58, true, false, 0, pped)
		return HANDLER_CONTINUE
	end
end)
local delay_beat = 0
local heart_beat2 = menu.add_feature("Random Exp", "value_i", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		pos.x = math.random(-2700, 2700)
		pos.y = math.random(-3300, 7500)
		pos.z = math.random(30, 90)
		pped = player.get_player_ped(player.player_id())
		fire.add_explosion(pos, feat.value, true, false, 0, pped)
		system.wait(delay_beat)
		return HANDLER_CONTINUE
	end
end)
heart_beat2["max"] = 74
heart_beat2["min"] = 0
heart_beat2["value"] = 0
local hb_delay = menu.add_feature("Exp delay", "value_i", globalFeatures.troll,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	delay_beat = tonumber(feat.value)
end)
hb_delay["max"] = 1000
hb_delay["min"] = 0
hb_delay["value"] = 0

Sound_Feats = {}
for i = 1, #SoundAnnoy do
	local FeatID = string.format("Sound_ID" .. i)
	Sound_Feats[i] = menu.add_feature(i .. ": " .. SoundAnnoy[i][1], "action", SoundAnnoyances,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local id = i
		local pos = v3()
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				local ent
				if player.is_player_in_any_vehicle(pid) then
					ent = player.get_player_vehicle(pid)
					elseif not player.is_player_in_any_vehicle(pid) then
					ent = player.get_player_ped(pid)
				end
				pos = player.get_player_coords(pid)
				--audio.play_sound_frontend(-1, Snd, Aud, true)
				audio.play_sound_from_entity(-1, SoundAnnoy[id][1], ent, SoundAnnoy[id][2])
				--audio.play_sound_from_coord(-1, Snd, pos, Aud, true, 10, true)
				audio.play_sound_from_coord(-1, SoundAnnoy[id][1], pos, SoundAnnoy[id][2], true, 1000, true)
			end
		end
	end)
end
local session_soundRape = function()
	sndrape_00 = menu.add_feature("all Water Splashes", "action", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		for i = 0, 31 do
			pped = player.get_player_ped(i)
			local scid = player.get_player_scid(i)
			if (scid ~= -1 or scid ~= -1 and i ~= player.player_id()) then
				audio.play_sound_from_entity(-1, "FallingInWaterSmall", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
				system.wait(250)
				audio.play_sound_from_entity(-1, "FallingInWaterMedium", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
				system.wait(120)
				audio.play_sound_from_entity(-1, "FallingInWaterHeavy", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
				system.wait(300)
				audio.play_sound_from_entity(-1, "DiveInWater", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
				system.wait(250)
				audio.play_sound_from_coord(-1, "Hot_Tub_Loop", pos, "GTAO_Yacht_SoundSet", true, 1000000, false)
			end
		end
	end)
	sndrape_01 = menu.add_feature("all Horn", "action", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		for i = 0, 31 do
			pped = player.get_player_ped(i)
			local scid = player.get_player_scid(i)
			if (scid ~= -1 or scid ~= -1 and i ~= player.player_id()) then
				pos = entity.get_entity_coords(pped)
				audio.play_sound_from_entity(-1,  "HORN", pped, "DLC_Apt_Yacht_Ambient_Soundset", true)
				audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 100, false)
			end
		end
	end)
	local sndrape_02 = menu.add_feature("all Air Drop", "action", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		for i = 0, 31 do
			local scid = player.get_player_scid(i)
			if (scid ~= -1 or scid ~= -1 and i ~= player.player_id()) then
				pped = player.get_player_ped(i)
				pos = entity.get_entity_coords(pped)
				audio.play_sound_from_entity(-1, "Air_Drop_Package", pped, "DLC_SM_Generic_Mission_Sounds", true)
			end
		end
	end)
	local sndrape_3 = menu.add_feature("all Explosion Countdown", "action", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		for i = 0, 31 do
			local scid = player.get_player_scid(i)
			if (scid ~= -1 or scid ~= -1 and i ~= player.player_id()) then
				pped = player.get_player_ped(i)
				pos = entity.get_entity_coords(pped)
				audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 100, false)
				audio.play_sound_from_entity(-1, "Explosion_Countdown", pped, "GTAO_FM_Events_Soundset", true)
			end
		end
	end)
	local sndrape_1 = menu.add_feature("allBomb Armed", "value_i", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local delaytime = feat.value
			local pos = v3()
			for i = 0, 31 do
				local scid = player.get_player_scid(i)
				if (scid ~= -1 and i ~= player.player_id()) then
					pped = player.get_player_ped(i)
					pos = entity.get_entity_coords(pped)
					audio.play_sound_from_entity(-1, "Bomb_Armed", pped, "GTAO_Speed_Convoy_Soundset", true)
					system.wait(delaytime)
				end
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end)
	sndrape_1["max"] = 1000
	sndrape_1["min"] = 0
	sndrape_1["mod"] = 5
	local sndrape_2 = menu.add_feature("all Bomb Disarmed", "value_i", globalFeatures.troll,function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			local delaytime = feat.value
			local pos = v3()
			for i = 0, 31 do
				local scid = player.get_player_scid(i)
				if (scid ~= -1 and i ~= player.player_id()) then
					pped = player.get_player_ped(i)
					pos = entity.get_entity_coords(pped)
					audio.play_sound_from_entity(-1, "Bomb_Disarmed", pped, "GTAO_Speed_Convoy_Soundset", true)
					system.wait(delaytime)
				end
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end)
	sndrape_2["max"] = 1000
	sndrape_2["min"] = 0
	sndrape_2["mod"] = 5
end
session_soundRape()
local world_force = menu.add_feature("Apply force to world entities", "action",  globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	get_everything()
	system.wait(100)
	local vel, velo = v3(), v3()
	velo.x = 0.0
	velo.y = 0.0
	velo.z = 1000.00
	vel.x = math.random(1000.0, 10000.0)
	vel.y = math.random(1000.0, 10000.0)
	vel.z = math.random(1000.0, 7500.0)
	local myveh = player.get_player_vehicle(player.player_id())
	for i = 1, #allpeds do
		if not ped.is_ped_a_player(allpeds[i]) then
			entity.freeze_entity(allpeds[i], false)
			entity.apply_force_to_entity(allpeds[i], 5, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, true, true)
			entity.set_entity_velocity(allpeds[i], vel)
		end
	end
	for y = 1, #allveh do
		if y ~= myveh then
			entity.freeze_entity(allveh[y], false)
			entity.set_entity_gravity(allveh[y], false)
			entity.set_entity_velocity(allveh[y], velo)
			system.wait(25)
			entity.set_entity_velocity(allveh[y], vel)
		end
	end
	for x = 1, #allobj do
		entity.freeze_entity(allobj[x], false)
		entity.set_entity_velocity(allobj[x], vel)
	end
end)
--INFO: Spawn Features
--spawn variables defaults
--INFO: Ped Spawn Features
function spawn_groups()
	for pid = 0, 31 do
		playergroups[pid + 1]  = player.get_player_group(pid)
		playerpeds[pid + 1] = player.get_player_ped(pid)
	end
	system.wait(100)
	Group_Hate = ped.create_group()
	system.wait(100)
	Support_Group = ped.create_group()
	for y = 1, #player_groups do
		ped.set_relationship_between_groups(5, player_groups[y], Group_Hate)
		ped.set_relationship_between_groups(5, Group_Hate, player_groups[y])
		ped.set_relationship_between_groups(0, player_groups[y], Support_Group)
		ped.set_relationship_between_groups(0, Support_Group, player_groups[y])
	end
end
function spawn_Animal_ped(pid, pedhash, offdist, attack, Posoff)
	hash = pedhash
	pped = player.get_player_ped(pid)
	local offset = v3()
	OffSet = offdist
	if not Posoff then
		pos = player.get_player_coords(pid)
		heading = player.get_player_heading(pid)
		heading = math.rad((heading - 180) * -1)
		offset = v3(pos.x + (math.sin(heading) * -offdist), pos.y + (math.cos(heading) * -offdist), pos.z)
		else
		offset = offdist
	end
	local headtype = math.random(0, 2)
	streaming.request_model(hash)
	while not streaming.has_model_loaded(hash) do
		system.wait(10)
	end
	local p = #escort + 1
	escort[p] = ped.create_ped(28, hash, offset, 0, true, false)
	Ped_Haters[#Ped_Haters+1] = escort[p]
	--print(escort[p])
	entity.set_entity_god_mode(escort[p], true)
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escort[p])
	ped.set_ped_component_variation(escort[p], 0, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 2, 0, 0, 0)
	ped.set_ped_component_variation(escort[p], 3, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 4, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 0, 2, 2, 0)
	ped.set_ped_component_variation(escort[p], 8, 1, 0, 0)
	ped.set_ped_can_switch_weapons(escort[p], true)
	ped.set_ped_combat_attributes(escort[p], 46, true)
	ped.set_ped_combat_attributes(escort[p], 52, true)
	ped.set_ped_combat_attributes(escort[p], 1, true)
	ped.set_ped_combat_attributes(escort[p], 2, true)
	ped.set_ped_combat_range(escort[p], 2)
	ped.set_ped_combat_ability(escort[p], 2)
	ped.set_ped_combat_movement(escort[p], 2)
	if not attack == true then
		ped.set_ped_combat_attributes(escort[p], 1424, false)
		ped.set_ped_as_group_member(escort[p], Group_Hate)
		ped.set_ped_never_leaves_group(escort[p], true)
		else
	end
	streaming.set_model_as_no_longer_needed(hash)
end
function spawn_ped(pid, pedhash, offdist, attack, Posoff)
	if not ped.does_relationship_group_exist(MoistEntitiesRelHash) then
		MoistEntitiesRelHash = ped.add_relationship_group("MoistScript_Entities")
	end
	hash = pedhash
	pped = player.get_player_ped(pid)
	local offset = v3()
	OffSet = offdist
	if not Posoff then
		pos = player.get_player_coords(pid)
		heading = player.get_player_heading(pid)
		heading = math.rad((heading - 180) * -1)
		offset = v3(pos.x + (math.sin(heading) * -offdist), pos.y + (math.cos(heading) * -offdist), pos.z)
		else
		offset = offdist
	end
	local headtype = math.random(0, 2)
	streaming.request_model(hash)
	while not streaming.has_model_loaded(hash) do
		system.wait(10)
	end
	local p = #escort + 1
	escort[p] = ped.create_ped(29, hash, offset, 0, true, false)
	groupIDs[#groupIDs+1] = ped.create_group()
	ped.set_ped_as_group_member(escort[p], groupIDs[#groupIDs])
	ped.set_ped_never_leaves_group(escort[p], true)
	local plygroup = player.get_player_group(pid)
	ped.set_relationship_between_groups(5, groupIDs[#groupIDs], plygroup)
	ped.set_relationship_between_groups(5, plygroup, groupIDs[#groupIDs])
	ped.set_ped_combat_attributes(escort[p], 1424, true)
	entity.set_entity_god_mode(escort[p], true)
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escort[p])
	ped.set_ped_component_variation(escort[p], 0, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 2, 0, 0, 0)
	ped.set_ped_component_variation(escort[p], 3, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 4, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 0, 2, 2, 0)
	ped.set_ped_component_variation(escort[p], 8, 1, 0, 0)
	ped.set_ped_can_switch_weapons(escort[p], true)
	ped.set_ped_combat_attributes(escort[p], 46, true)
	ped.set_ped_combat_attributes(escort[p], 52, true)
	ped.set_ped_combat_attributes(escort[p], 1, true)
	ped.set_ped_combat_attributes(escort[p], 2, true)
	ped.set_ped_combat_range(escort[p], 2)
	ped.set_ped_combat_ability(escort[p], 2)
	ped.set_ped_combat_movement(escort[p], 2)
	ped.set_can_attack_friendly(escort[p], true, false)
	if not attack == true then
		ped.set_ped_combat_attributes(escort[p], 1424, false)
		--	ped.set_ped_as_group_member(escort[p], Group_Hate)
		--	ped.set_ped_never_leaves_group(escort[p], true)
		else
	end
	streaming.set_model_as_no_longer_needed(hash)
	return escort[p]
end
function spawn_ped_v2(pid, pedhash, attack, withGod)
	local p
	local GodMode = withGod and true or false
	if not ped.does_relationship_group_exist(MoistEntitiesRelHash) then
		MoistEntitiesRelHash = ped.add_relationship_group("MoistScript_Entities")
	end
	local hash, parachute = pedhash, 0xfbab5776
	plygrp = player.get_player_group(pid)
	pped = player.get_player_ped(pid)
	plyrel = ped.get_ped_relationship_group_hash(pped)
	local pos, offset, offset2, rot = v3(), v3(), v3(), v3()
	pos = player.get_player_coords(pid)
	pos.x = pos.x + 10
	pos.y = pos.y + 20
	local offset_z, headtype
	offset_z = math.random(10, 40)
	offset.z = offset_z
	headtype = math.random(0, 2)
	rot = entity.get_entity_rotation(pped)
	streaming.request_model(hash)
	while not streaming.has_model_loaded(hash) do
		system.wait(10)
	end
	p = #escort + 1
	escort[p] = ped.create_ped(26, hash, pos + offset, 0, true, false)
	ped.set_ped_relationship_group_hash(escort[p], MoistEntitiesRelHash)
	if withGod == true then
		entity.set_entity_god_mode(escort[p], true)
	end
	--print(escort[p])
	entity.set_entity_god_mode(escort[p], true)
	BlipIDs[#BlipIDs + 1] = ui.add_blip_for_entity(escort[p])
	ped.set_ped_component_variation(escort[p], 0, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 2, 0, 0, 0)
	ped.set_ped_component_variation(escort[p], 3, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 4, 1, 0, 0)
	ped.set_ped_component_variation(escort[p], 0, 2, 2, 0)
	ped.set_ped_component_variation(escort[p], 8, 1, 0, 0)
	ped.set_ped_can_switch_weapons(escort[p], true)
	ped.set_ped_combat_attributes(escort[p], 46, true)
	ped.set_ped_combat_attributes(escort[p], 52, true)
	ped.set_ped_combat_attributes(escort[p], 1, true)
	ped.set_ped_combat_attributes(escort[p], 2, true)
	ped.set_ped_combat_attributes(escort[p], 3, false)
	ped.set_ped_combat_range(escort[p], 2)
	ped.set_ped_combat_ability(escort[p], 2)
	ped.set_ped_combat_movement(escort[p], 2)
	ped.set_ped_can_switch_weapons(escort[p], true)
	weapon.give_delayed_weapon_to_ped(escort[p], parachute, 1, 0)
	ped.set_can_attack_friendly(escort[p], true, false)
	if not attack == true then
		ped.set_ped_combat_attributes(escort[p], 1424, false)
		pedgroup = ped.get_ped_group(escort[p])
		ped.set_ped_as_group_member(escort[p], plygrp)
		pedgroup = ped.get_ped_group(escort[p])
		ped.set_ped_never_leaves_group(escort[p], true)
		else
	end
	streaming.set_model_as_no_longer_needed(hash)
	return escort[p]
end
function spawn_veh(pid, vehhash, offdist, mod, modvalue, Posoff)
	local hash, OffSet = vehhash, offdist
	if not Posoff then
		local pos, heading = player.get_player_coords(pid), player.get_player_heading(pid)
		heading = math.rad((heading - 180) * -1)
		offset = v3(pos.x + (math.sin(heading) * -offdist), pos.y + (math.cos(heading) * -offdist), pos.z)
		else
		offset = offdist
	end
	streaming.request_model(hash)
	while not streaming.has_model_loaded(hash) do
		system.wait(10)
	end
	local y = #escortveh + 1
	if streaming.is_model_a_heli(hash) then
		-- offset = v3(-1012.2005615234,-756.86669921875,81.748390197754)
	end
	escortveh[y] = vehicle.create_vehicle(hash, offset, player.get_player_heading(pid), true, false)
	--print(escortveh[y])
	network.request_control_of_entity(escortveh[y])
	network.request_control_of_entity(escortveh[y])
	vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
	vehicle.get_vehicle_mod(escortveh[y], mod)
	vehicle.set_vehicle_mod(escortveh[y], mod, modvalue, false)
	BlipIDs[#BlipIDs + 1] = ui.add_blip_for_entity(escortveh[y])
	if not streaming.is_model_a_heli(hash) then
		vehicle.set_vehicle_on_ground_properly(escortveh[y])
	end
	entity.set_entity_god_mode(escortveh[y], true)
	vehicle.set_vehicle_doors_locked(escortveh[y], 5)
	streaming.set_model_as_no_longer_needed(hash)
	return escortveh[y]
end
--INFO: Spawn Cleanups
Blip_Cleanup = menu.add_feature("Delete Blips Added", "action", globalFeatures.cleanup,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if #BlipIDs == 0 or nil then return end
	for i = 1, #BlipIDs do
		ui.remove_blip(BlipIDs[i])
	end
	for pid = 0, 31 do
		if Players[pid].OTRBlipID ~= nil then
			local pped = player.get_player_ped(pid)
			ply_blip = ui.get_blip_from_entity(pped)
			ui.remove_blip(ply_blip)
			Players[pid].OTRBlipID = nil
		end
	end
end)
Blip_Cleanup = menu.add_feature("Try Blip Brute Force Removal", "action", globalFeatures.cleanup,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	BruteForce_RemoveBlips()
end)
alk_cleanup = menu.add_feature("Delete alkonost lag Spawns", "action", globalFeatures.cleanup,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if #alkonost == 0 or nil then return end
	local pos = v3()
	pos.x = presets[1][2]
	pos.y = presets[1][3]
	pos.z = presets[1][4]
	for i = 1, #alkonost do
		entity.detach_entity(alkonost[i])
		entity.set_entity_coords_no_offset(alkonost[i], pos)
		entity.set_entity_as_no_longer_needed(alkonost[i])
		entity.delete_entity(alkonost[i])
	end
end)
ped_cleanup = menu.add_feature("Delete Ped Spawns", "action", globalFeatures.cleanup,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if #escort == 0 or nil then return end
	local pos = v3()
	pos.x = presets[1][2]
	pos.y = presets[1][3]
	pos.z = presets[1][4]
	for i = 1, #escort do
		ped.clear_ped_tasks_immediately(escort[i])
		entity.detach_entity(escort[i])
		entity.set_entity_coords_no_offset(escort[i], pos)
		entity.set_entity_as_no_longer_needed(escort[i])
		entity.delete_entity(escort[i])
	end
end)
local pedveh_cleanup = menu.add_feature("Delete All Spawns", "action", globalFeatures.cleanup,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	spawn_cleanup()
end)
function spawn_cleanup()
	if #escort == 0 or #escort == nil then return end
	local pos = v3()
	pos.x = presets[1][2]
	pos.y = presets[1][3]
	pos.z = presets[1][4]
	for i = 1, #escort do
		network.request_control_of_entity(escort[i])
		ped.clear_ped_tasks_immediately(escort[i])
		entity.set_entity_coords_no_offset(escort[i], pos)
		entity.set_entity_as_no_longer_needed(escort[i])
		entity.delete_entity(escort[i])
	end
	if #escortveh == 0 or #escortveh == nil then return end
	for y = 1, #escortveh do
		network.request_control_of_entity(escortveh[y])
		entity.detach_entity(escortveh[y])
		entity.set_entity_coords_no_offset(escortveh[y], pos)
		entity.set_entity_as_no_longer_needed(escortveh[y])
		entity.delete_entity(escortveh[y])
	end
	if #boobs == 0 or #boobs == nil then return end
	for i = 1, #boobs do
		network.request_control_of_entity(boobs[i])
		ped.clear_ped_tasks_immediately(boobs[i])
		entity.set_entity_coords_no_offset(boobs[i], pos)
		entity.set_entity_as_no_longer_needed(boobs[i])
		entity.delete_entity(boobs[i])
	end
	if #boobveh == 0 or #boobveh == nil then return end
	for y = 1, #boobveh do
		network.request_control_of_entity(boobveh[y])
		entity.detach_entity(boobveh[y])
		entity.set_entity_coords_no_offset(boobveh[y], pos)
		entity.set_entity_as_no_longer_needed(boobveh[y])
		entity.delete_entity(boobveh[y])
	end
	if #lester == 0 or #lester == nil then return end
	for i = 1, #lester do
		network.request_control_of_entity(lester[i])
		ped.clear_ped_tasks_immediately(lester[i])
		entity.set_entity_coords_no_offset(lester[i], pos)
		entity.set_entity_as_no_longer_needed(lester[i])
		entity.delete_entity(lester[i])
	end
	if #lesveh == 0 or #lesveh == nil then return end
	for y = 1, #lesveh do
		network.request_control_of_entity(lesveh[y])
		entity.detach_entity(lesveh[y])
		entity.set_entity_coords_no_offset(lesveh[y], pos)
		entity.set_entity_as_no_longer_needed(lesveh[y])
		entity.delete_entity(lesveh[y])
	end
	if #SpawnedNPC == 0 or #SpawnedNPC == nil then return end
	for i = 1, #SpawnedNPC do
		network.request_control_of_entity(SpawnedNPC[i])
		ped.clear_ped_tasks_immediately(SpawnedNPC[i])
		entity.set_entity_coords_no_offset(SpawnedNPC[i], pos)
		entity.set_entity_as_no_longer_needed(SpawnedNPC[i])
		entity.delete_entity(SpawnedNPC[i])
	end
	if #SpawnedNPCV == 0 or #SpawnedNPCV == nil then return end
	for y = 1, #SpawnedNPCV do
		network.request_control_of_entity(SpawnedNPCV[y])
		entity.detach_entity(SpawnedNPCV[y])
		entity.set_entity_coords_no_offset(SpawnedNPCV[y], pos)
		entity.set_entity_as_no_longer_needed(SpawnedNPCV[y])
		entity.delete_entity(SpawnedNPCV[y])
	end
	for i = 1, #alkonost do
		entity.set_entity_as_no_longer_needed(alkonost[i])
		entity.delete_entity(alkonost[i])
	end
	for i = 1, #spawned_cunts do
		entity.set_entity_as_no_longer_needed(spawned_cunts[i])
		entity.delete_entity(spawned_cunts[i])
	end
	for i = 1, #spawned_cunt do
		entity.set_entity_as_no_longer_needed(spawned_cunt[i])
		entity.delete_entity(spawned_cunt[i])
	end
	for i = 1, #spawned_cunt1 do
		entity.set_entity_as_no_longer_needed(spawned_cunt1[i])
		entity.delete_entity(spawned_cunt1[i])
	end
	for i = 1, #spawned_cunt2 do
		entity.set_entity_as_no_longer_needed(spawned_cunt2[i])
		entity.delete_entity(spawned_cunt2[i])
	end
	for i = 1, #spawned_cunt3 do
		entity.set_entity_as_no_longer_needed(spawned_cunt3[i])
		entity.delete_entity(spawned_cunt3[i])
	end
	for i = 1, #lester do
		entity.set_entity_as_no_longer_needed(spawned_cunt3[i])
		entity.delete_entity(spawned_cunt3[i])
	end
	for i = 1, #huntv do
		entity.set_entity_as_no_longer_needed(huntv[i])
		entity.delete_entity(huntv[i])
	end
end
function delayed_spawn_cleanup()
	system.wait(2000)
	allveh = vehicle.get_all_vehicles()
	allpeds = ped.get_all_peds()
	if #allveh == 0 or nil then return end
	for y = 1, #allveh do
		if entity.get_entity_model_hash(allveh[y]) == 0xD9F0503D then
			entity.delete_entity(allveh[y])
			entity.set_entity_as_no_longer_needed(allveh[y])
		end
	end
	if #escort == 0 or nil then return end
	local pos = v3()
	pos.x = presets[1][2]
	pos.y = presets[1][3]
	pos.z = presets[1][4]
	for i = 1, #allpeds do
		if entity.get_entity_model_hash(allpeds[i]) == 0x6E42FD26 then
			ped.clear_ped_tasks_immediately(allpeds[i])
			network.request_control_of_entity(allpeds[i])
			entity.delete_entity(allpeds[i])
			entity.set_entity_as_no_longer_needed(allpeds[i])
		end
	end
end
local Freeze_obj = menu.add_feature("Freeze World Vehicles & Objects", "action",  globalFeatures.lobbyGrief,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	allobj = object.get_all_objects()
	system.wait(200)
	allveh = vehicle.get_all_vehicles()
	system.wait(200)
	system.wait(400)
	for i = 1, #allobj do
		entity.freeze_entity(allobj[i], false)
		network.request_control_of_entity(allobj[i])
		-- 	entity.set_entity_coords_no_offset(allobj[i], pos)
		entity.freeze_entity(allobj[i], true)
		--entity.set_entity_as_no_longer_needed(allobj[i])
		-- entity.delete_entity(allobj[i])
	end
	system.wait(400)
	for i = 1, #allveh do
		network.request_control_of_entity(allveh[i])
		--entity.freeze_entity(allveh[i], false)
		--	entity.set_entity_coords_no_offset(allveh[i], pos)
		entity.freeze_entity(allveh[i], true)
		--entity.set_entity_as_no_longer_needed(allveh[i])
		-- entity.delete_entity(allveh[i])
	end
end)
--INFO: CUNT DUMP
local dump_pickups_onplayer = function(pid, pos)
	world_dumped = false
	moist_notify("Going to Fetch all Pickups!\nWill dump on target", "Moists Cunt Dump!")
	moist_notify("3 Seconds\nUntil Pickup Cunt Dump Starts", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Pickup Cunt Dump Starts in: 2 Seconds", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Pickup Cunt Dump Starts in: 1 Second", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Pickup Cunt Dump Initiated", "Pick up & Dump on that Cunt!\nCunt Filled with your Dump! Enjoy")
	allpickups = object.get_all_pickups()
	system.wait(400)
	for i = 1, #allpickups do
		if entity.is_an_entity(allpickups[i]) then
			network.request_control_of_entity(allpickups[i])
			entity.set_entity_coords_no_offset(allpickups[i], pos)
			entity.set_entity_as_no_longer_needed(allpickups[i])
		end
		system.wait(200)
	end
	moist_notify("World Pickups have been Cunt Dumped!", "Enjoy The Creamy Cunt Moisture!")
	world_dumped = true
end
function dumpfreeze_onplayer(pid, pos)
	local allpeds, allveh, allobj, allpickups = {}, {}, {}, {}
	world_dumped = false
	moist_notify("Ensure you are NOT!\nSpectating Player", "Moists Cunt Dump!")
	moist_notify("3 Seconds\nUntil Cunt Dump Starts", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Starts in:  2 Seconds", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Starts in:  1 Second", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Initiated\n pectating now could crash you", "Moists Cunt Dump!")
	allpeds = ped.get_all_peds()
	system.wait(200)
	allveh = vehicle.get_all_vehicles()
	system.wait(200)
	allobj = object.get_all_objects()
	system.wait(200)
	allpickups = object.get_all_pickups()
	system.wait(400)
	for i = 1, #allpickups do
		if entity.is_an_entity(allpickups[i]) then
			network.request_control_of_entity(allpickups[i])
			entity.freeze_entity(allpickups[i], false)
			entity.set_entity_coords_no_offset(allpickups[i], pos)
			entity.freeze_entity(allpickups[i], true)
		end
	end
	system.wait(400)
	for i = 1, #allobj do
		if entity.is_an_entity(allobj[i]) then
			entity.freeze_entity(allobj[i], false)
			network.request_control_of_entity(allobj[i])
			entity.set_entity_coords_no_offset(allobj[i], pos)
			entity.freeze_entity(allobj[i], true)
		end
	end
	system.wait(400)
	for i = 1, #allveh do
		if entity.is_an_entity(allveh[i]) then
			if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
				network.request_control_of_entity(allveh[i])
				entity.freeze_entity(allveh[i], false)
				entity.set_entity_coords_no_offset(allveh[i], pos)
				entity.freeze_entity(allveh[i], true)
			end
		end
	end
	system.wait(400)
	for i = 1, #allpeds do
		if entity.is_an_entity(allpeds[i]) then
			if not ped.is_ped_a_player(allpeds[i]) then
				entity.freeze_entity(allpeds[i], false)
				network.request_control_of_entity(allpeds[i])
				entity.set_entity_coords_no_offset(allpeds[i], pos)
				entity.freeze_entity(allpeds[i], true)
			end
		end
		system.wait(400)
	end
	moist_notify("WorldDumped On That Cunt!", "Moists Cunt Dump!")
	world_dumped = true
	allpeds, allveh, allobj, allpickups = {}, {}, {}, {}
end
function dumpfreeze_ped_onplayer(pid, pos)
	local allpeds, allveh, allobj, allpickups = {}, {}, {}, {}
	world_dumped = false
	moist_notify("Ensure you are NOT!\nSpectating Player", "Moists Cunt Dump!")
	moist_notify("3 Seconds\nUntil Cunt Dump Starts", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Starts in: 2 Seconds", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Starts in: 1 Second", "Moists Cunt Dump!")
	system.wait(1000)
	moist_notify("Cunt Dump Initiated\n Spectating now could crash you", "Moists Cunt Dump!")
	allpeds = ped.get_all_peds()
	system.wait(200)
	allveh = vehicle.get_all_vehicles()
	system.wait(200)
	allpickups = object.get_all_pickups()
	system.wait(400)
	for i = 1, #allveh do
		if entity.is_an_entity(allveh[i]) then
			if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
				network.request_control_of_entity(allveh[i])
				-- entity.freeze_entity(allveh[i], false)
				entity.set_entity_coords_no_offset(allveh[i], pos)
				-- entity.freeze_entity(allveh[i], true)
			end
		end
	end
	system.wait(400)
	for i = 1, #allpeds do
		if entity.is_an_entity(allpeds[i]) then
			if not ped.is_ped_a_player(allpeds[i]) then
				-- entity.freeze_entity(allpeds[i], false)
				network.request_control_of_entity(allpeds[i])
				entity.set_entity_coords_no_offset(allpeds[i], pos)
				-- entity.freeze_entity(allpeds[i], true)
			end
		end
		system.wait(400)
	end
	moist_notify("World Ped + Vehicle Dumped on Player", "\nHave Fun!")
	world_dumped = true
	allpeds, allveh, allobj, allpickups = {}, {}, {}, {}
end
--INFO: Option Features
--[[
	21	INPUT_Sprint	LEFT SHIFT			A
	22	INPUT_JUMP		SPACEBAR			X
	24	INPUT_ATTACK	LEFT MOUSE BUTTON	RT
	25	INPUT_AIM		RIGHT MOUSE BUTTON	LT
]]
Hud_Comp =  menu.add_feature("HUD Components", "parent", globalFeatures.moistopt).id
menu.add_feature("Show Multiple Hud Components", "action", Hud_Comp, nil)
hud_comp1 = menu.add_feature("Show 1st: ", "value_i", Hud_Comp,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		ui.show_hud_component_this_frame(feat.value)
		return HANDLER_CONTINUE
	end
end)
hud_comp1["max"] = 255
hud_comp1["min"] = 0
local stop_snd = menu.add_feature("try to stop the sound", "action", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for id = -1, 10 do
		audio.stop_sound(id)
		system.yield(10)
	end
	return HANDLER_POP
end)
hud_comp2 = menu.add_feature("Show 2nd: ", "value_i", Hud_Comp,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		ui.show_hud_component_this_frame(feat.value)
		system.yield(0)
		return HANDLER_CONTINUE
	end
end)
hud_comp2["max"] = 255
hud_comp2["min"] = 0
hud_comp3 = menu.add_feature("Show 3rd: ", "value_i", Hud_Comp,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		ui.show_hud_component_this_frame(feat.value)
		return HANDLER_CONTINUE
	end
end)
hud_comp3["max"] = 255
hud_comp3["min"] = 0
local entity_control
OptionsVar.aim_control = menu.add_feature("DetonateVehicle Aiming@(LShift or PS:X XBC:A)", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["aimDetonate_control"] = true
	if feat["on"] then
		if player.is_player_free_aiming(player.player_id()) and controls.is_control_pressed(1, 21) then
			entity_control = player.get_entity_player_is_aiming_at(player.player_id())
			if entity.is_entity_a_ped(entity_control) then
				if entity.is_entity_dead(entity_control) then
					moist_notify("Entity is a Dead Ped\nResurrecting Ped Now!", "Moists MultiAim Tool")
					network.request_control_of_entity(entity_control)
					ped.resurrect_ped(entity_control)
					network.request_control_of_entity(entity_control)
					ped.set_ped_max_health(entity_control, 400)
					network.request_control_of_entity(entity_control)
					ped.set_ped_health(entity_control, 300)
					local pedhp1 = ped.get_ped_health(entity_control)
					local pedhp2 = ped.get_ped_max_health(entity_control)
					moist_notify("Current Health: " .. pedhp1 .. "\nMax Health: " .. pedhp2, "Moists MultiAim Tool")
					ped.clear_ped_tasks_immediately(entity_control)
				end
				if entity.get_entity_god_mode(entity_control) then
					moist_notify("Entity God Mode!!\nDisabling God Mode", "Moists MultiAim Tool")
					network.request_control_of_entity(entity_control)
					entity.set_entity_god_mode(entity_control, false)
				end
				if entity.is_entity_attached(entity_control) then
					entity_control = entity.get_entity_attached_to(entity_control)
				end
				network.request_control_of_entity(entity_control)
			end
			if entity.get_entity_god_mode(entity_control) then
				moist_notify("Attached Entity is God Mode!!\nDisabling God Mode", "Moists MultiAim Tool")
				network.request_control_of_entity(entity_control)
				entity.set_entity_god_mode(entity_control, false)
			end
			if entity.is_entity_a_vehicle(entity_control) then
				network.request_control_of_entity(entity_control)
				fire.start_entity_fire(entity_control)
				moist_notify("Vehicle God Mode!! Removing it from this CUNT!\nNow Giving it a Remote Bomb!!", "Moists MultiAim Tool")
				vehicle.add_vehicle_phone_explosive_device(entity_control)
				system.wait(25)
			end
			network.request_control_of_entity(entity_control)
			if vehicle.has_vehicle_phone_explosive_device() then
				moist_notify("RIP CUNT!\nDETONATING BOMB!!", "Moists MultiAim Tool")
				vehicle.detonate_vehicle_phone_explosive_device()
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_CONTINUE
	end
	Settings["aimDetonate_control"] = false
	return HANDLER_POP
end)
OptionsVar.aim_control["on"] = Settings["aimDetonate_control"]
--BUG: ***** Player Tracking ********
local pped1, femped1, pid2, pped2, name1, name2, text
--Session_Combat = {{pid = {},kills = {},killed = {},suicide = {},}}
function GetKiller(pid)
	--[[
		if not Players[pid].isDead then
		if not utils.file_exists(Paths.Logs .. "\\combat.log") then
		Debug_Out("Date&Time, Player Killer, Killed Player" , false, "combat.log")
		end
		pped1 = player.get_player_ped(pid)
		femped1 = player.is_player_female(pid) and "Killed Her Self!" or "Killed Him Self!"
		name1 = tostring(player.get_player_name(pid))
		for pid2 = 0, 31 do
		if player.is_player_valid(pid2) then
		system.yield(1)
		pped2 = player.get_player_ped(pid2)
		name2 = tostring(player.get_player_name(pid2))
		if entity.has_entity_been_damaged_by_entity(pped1, pped2) then
		if player.is_player_god(pid2) then
		Players[pid2].PlayerGodMode = true
		end
		Session_Combat[pid2].kills[pid] = (Session_Combat[pid2].kills[pid]) + 1
		Session_Combat[pid].killed[pid2] = (Session_Combat[pid].killed[pid2]) + 1
		if pid == pid2 then
		text = tostring(", " .. name2 .. " , " .. femped1)
		if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
		if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
		menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
		end
		elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then
		Debug_Out(text, true, "combat.log")
		elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
		if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
		menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
		end
		Debug_Out(text, true, "combat.log")
		system.wait(0)
		end
		elseif pid ~= pid2 then
		text = tostring(", " .. name2 .. " , " .. name1)
		if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
		if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
		menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
		end
		elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then  
		Debug_Out(text, true, "combat.log")
		elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
		if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
		menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
		end
		Debug_Out(text, true, "combat.log")
		system.wait(0)
		end
		end
		system.yield(0)
		end
		end
		system.yield(0)
		end
		system.yield(0)
		end
	]]
end
PlyTrackCombat = menu.add_feature("Session Combat(Kill) Tracking", "value_str", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["Combat_Tracker_ON"] = false
		return HANDLER_POP
	end
	Settings["Combat_Tracker_ON"] = true
	Settings["Combat_Tracker_Value"] = feat.value
	if feat.value == 0 then
		Settings["Combat_Tracker_DebugLog"] = true
		elseif feat.value == 1 then
		Settings["Combat_Tracker_Notify"]  = true
		elseif feat.value == 2 then
		Settings["Combat_Tracker_Notify"]  = true
		Settings["Combat_Tracker_DebugLog"] = true
	end
end)
PlyTrackCombat:set_str_data({"Log", "Notify", "Log & Notify"})
PlyTrackCombat["on"] = Settings["Combat_Tracker_ON"]
PlyTrackCombat["value"] = Settings["Combat_Tracker_Value"]
PlyTrackDamage = menu.add_feature("Track all Players Damage", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		for pid = 0, 31 do
			pped1 = player.get_player_ped(pid)
			name1 = tostring(player.get_player_name(pid))
			system.wait(0)
			for pid2 = 0, 31 do
				pped2 = player.get_player_ped(pid2)
				name2 = tostring(player.get_player_name(pid2))
				if ped.is_ped_in_any_vehicle(pped1) then
					pped1veh = ped.get_vehicle_ped_is_using(pped1)
					if entity.has_entity_been_damaged_by_entity(pped1veh, pped2) then
						Players[pid].isDamagedbY = name2
					end
					else	
					if entity.has_entity_been_damaged_by_entity(pped1, pped2) then
						Players[pid].isDamagedbY = name2
					end
					system.wait(10)
				end
				system.wait(10)
			end
		end
		system.wait(10)
		return HANDLER_CONTINUE
	end
end)
PlyTrackDamage["on"] = true
Kicked_JoinKick = menu.add_feature("Kick Previously Kicked Players", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		Settings["KickJoiningKickedPlayers"] = true
		Kick_Kicked = true
		return HANDLER_POP
	end
	Settings["KickJoiningKickedPlayers"] = false
	Kick_Kicked = false
	return HANDLER_POP
end)
Kicked_JoinKick["on"] = Settings["KickJoiningKickedPlayers"]
PlyTracker.track_all = menu.add_feature("Track all Players Speed", "toggle", globalFeatures.moistopt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		for i = 0, 31 do
			local y = i + 1
			local ent
			local ent1 = player.get_player_ped(i)
			local ent2 = ped.get_vehicle_ped_is_using(ent1)
			if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
			local speed = entity.get_entity_speed(ent)
			local speedcalc = speed * 3.6 --kmph
			local speedcalc2 =  speed * 2.236936 --mph
			tracking.playerped_speed2[y] = math.ceil(speedcalc2)
			tracking.playerped_speed1[y] = math.ceil(speedcalc)
		end
		system.yield(10)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
PlyTracker.track_all["on"] = true
PlyTracker.track_all["hidden"] = true

function Interior_Test(pid)
	local name = player.get_player_name(pid)
	local apartmen, interiorr, founda, foundb
	local pped = player.get_player_ped(pid)
	local pos1, pos2 = v2(), v2()
	local pos, intpos, pos2
	if not player.is_player_valid(pid) then return end
	Zon1, Zon2 = Entity_Zone_Info(pped)
	if Zon1 == nil then
		for y = 1, #Zone_LongNames do
			if entity.is_entity_in_zone(pped, Zone_LongNames[y][1]) then
				for i = 1, #interiors[Zone_LongNames[y][1]] do
					pos = player.get_player_coords(pid)
					intpos = interiors[Zone_LongNames[y][1]][i][2]
					local apartmen = pos:magnitude(intpos)
					system.yield(0)
					if apartmen < 50  then
						founda = true
						Players[pid].isint, Players[pid].Interiorname, Position, Players[pid].Zone, Players[pid].intID  =  true, tostring(interiors[Zone_LongNames[y][1]][i][1]), tostring(interiors[Zone_LongNames[y][1]][i][2]), Zone_LongNames[y][2], (i)
						goto NextP
						else
						Players[pid].Interiorname = ""
					end
					system.yield(0)
				end
				if founda ~= true then
					Players[pid].isint, Players[pid].Interiorname, Players[pid].Zone, Players[pid].intID  =  false, "", nil, nil
					return false
				end
			end
			founda = false
		end
	end
	system.yield(0)
	::NextP::
	if founda == true then
		return true
	end
	for i = 1, #onlineinteriors do
		local pos = player.get_player_coords(pid)
		local intpos = onlineinteriors[i][2]
		local apartmen = pos:magnitude(intpos)
		if apartmen < 25 then
			foundb = true
			Players[pid].onlinecheck, Players[pid].online_interior, Players[pid].onlineintID = true, tostring(onlineinteriors[i][1]), (i)
			goto NextR
			else
			Players[pid].online_interior = ""
		end
		system.yield(0)
	end
	if foundb ~= true then
		Players[pid].onlinecheck, Players[pid].online_interior, Players[pid].onlineintID = false, "", nil
		return false
	end
	foundb = false
	system.yield(0)
	::NextR::
	if foundb == true then
		return true
	end
	system.yield(0)
end
function SpectateNotify(pid)
	if player.is_player_valid(pid) then
		local text = ""
		if player.is_player_spectating(pid) then
			local TargetEntity = network.get_entity_player_is_spectating(pid)
			if entity.is_entity_a_ped(TargetEntity) then
				if ped.is_ped_a_player(TargetEntity) then
					target = player.get_player_from_ped(TargetEntity)
				end
			end
			text = "Spectating | "
			text = text  .. (tostring(player.get_player_name(target)) .. "\nInterior Detected = " .. tostring(Players[pid].isint))
			text = text  ..(" | Target Spectatable = " .. tostring(Players[target].Spectatable))
			if not Players[pid].isNotifSpec then 
				moist_notify(text, "Modded Specate:" .. tostring(player.get_player_name(pid)))
				Players[pid].isNotifSpec = true
			end
		end
	end
end
spec_osd = menu.add_feature("Spectate OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos = v2()
	if not feat["on"] then
		Settings["spec_osd"] = false
		return HANDLER_POP
	end
	Settings["spec_osd"] = true
	pos.x = 0.1
	pos.y = .0
	for pid = 0, 31 do
		local text = ""
		pos.y = pos.y + 0.05
		if player.is_player_valid(pid) then
			if player.is_player_spectating(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) then
				local target = network.get_entity_player_is_spectating(pid)
				if type(target) == 'number' then
					if entity.is_entity_a_ped(target) then
						if ped.is_ped_a_player(target) then
							TargetPlayer = player.get_player_from_ped(target)
						end
					end
					if Players[pid].isint ~= true then
						local test = Interior_Test(pid)
						system.yield(1000)
						if test ~= true then
							SpectateNotify(pid)
						end
					end
					elseif not player.is_player_spectating(pid) and Players[pid].isNotifSpec == true then
					Players[pid].isNotifSpec = false
				end	
			end
		end
		system.yield(0)
	end
	return HANDLER_CONTINUE	
end)
spec_osd["on"] = Settings["spec_osd"]
local barvar1, barvar2, barsize, val,  RpM  = 0, 255, 0, 0, 0.0
intexperiments = menu.add_feature("Experimental Interior Shit", "parent", globalFeatures.moist_test.id)
theforce = menu.add_feature("Experimental Force Control", "parent", globalFeatures.moist_test.id)
ForceSpin = menu.add_feature("Self Spin", "toggle", theforce.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 5, 200.0000001, 8207.00, 89207.8207, 10.0, 10.00, 100.0, 10000.0, false, true)
		return HANDLER_CONTINUE
	end
end)
CrRandCops = menu.add_feature("Create Random Cops", "toggle", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		ped.set_create_random_cops(true)
		system.wait(50000)
		return HANDLER_CONTINUE
	end
end)
--TODO: Ped Config Flag Shit
Ped_Config_Flags = {}
Ped_Config_Flags[0] = "_0x67D1A445"
Ped_Config_Flags[1] = "_0xC63DE95E"
Ped_Config_Flags[2] = "NoCriticalHits"
Ped_Config_Flags[3] = "DrownsInWater"
Ped_Config_Flags[4] = "DisableReticuleFixedLockon"
Ped_Config_Flags[5] = "_0x37D196F4"
Ped_Config_Flags[6] = "_0xE2462399"
Ped_Config_Flags[7] = "UpperBodyDamageAnimsOnly"
Ped_Config_Flags[8] = "_0xEDDEB838"
Ped_Config_Flags[9] = "_0xB398B6FD"
Ped_Config_Flags[10] = "_0xF6664E68"
Ped_Config_Flags[11] = "_0xA05E7CA3"
Ped_Config_Flags[12] = "_0xCE394045"
Ped_Config_Flags[13] = "NeverLeavesGroup"
Ped_Config_Flags[14] = "_0xCD8D1411"
Ped_Config_Flags[15] = "_0xB031F1A9"
Ped_Config_Flags[16] = "_0xFE65BEE3"
Ped_Config_Flags[17] = "BlockNonTemporaryEvents"
Ped_Config_Flags[18] = "_0x380165BD"
Ped_Config_Flags[19] = "_0x07C045C7"
Ped_Config_Flags[20] = "_0x583B5E2D can be targetted?"
Ped_Config_Flags[21] = "_0x475EDA58"
Ped_Config_Flags[22] = "_0x8629D05B"
Ped_Config_Flags[23] = "_0x1522968B"
Ped_Config_Flags[24] = "IgnoreSeenMelee"
Ped_Config_Flags[25] = "_0x4CC09C4B"
Ped_Config_Flags[26] = "_0x034F3053"
Ped_Config_Flags[27] = "_0xD91BA7CC"
Ped_Config_Flags[28] = "_0x5C8DC66E"
Ped_Config_Flags[29] = "_0x8902EAA0"
Ped_Config_Flags[30] = "_0x6580B9D2"
Ped_Config_Flags[31] = "_0x0EF7A297"
Ped_Config_Flags[32] = "CanFlyThruWindscreen"
Ped_Config_Flags[33] = "DieWhenRagdoll"
Ped_Config_Flags[34] = "HasHelmet"
Ped_Config_Flags[35] = "UseHelmet"
Ped_Config_Flags[36] = "_0xEEB3D630"
Ped_Config_Flags[37] = "_0xB130D17B"
Ped_Config_Flags[38] = "_0x5F071200"
Ped_Config_Flags[39] = "DisableEvasiveDives"
Ped_Config_Flags[40] = "_0xC287AAFF"
Ped_Config_Flags[41] = "_0x203328CC"
Ped_Config_Flags[42] = "DontInfluenceWantedLevel"
Ped_Config_Flags[43] = "DisablePlayerLockon"
Ped_Config_Flags[44] = "DisableLockonToRandomPeds"
Ped_Config_Flags[45] = "_0xEC4A8ACF"
Ped_Config_Flags[46] = "_0xDB115BFA"
Ped_Config_Flags[47] = "PedBeingDeleted"
Ped_Config_Flags[48] = "BlockWeaponSwitching"
Ped_Config_Flags[49] = "_0xF8E99565"
Ped_Config_Flags[50] = "_0xDD17FEE6"
Ped_Config_Flags[51] = "_0x7ED9B2C9"
Ped_Config_Flags[52] = "_0x655E8618"
Ped_Config_Flags[53] = "_0x5A6C1F6E"
Ped_Config_Flags[54] = "_0xD749FC41"
Ped_Config_Flags[55] = "_0x357F63F3"
Ped_Config_Flags[56] = "_0xC5E60961"
Ped_Config_Flags[57] = "_0x29275C3E"
Ped_Config_Flags[58] = "IsFiring"
Ped_Config_Flags[59] = "WasFiring"
Ped_Config_Flags[60] = "IsStanding"
Ped_Config_Flags[61] = "WasStanding"
Ped_Config_Flags[62] = "InVehicle"
Ped_Config_Flags[63] = "OnMount"
Ped_Config_Flags[64] = "AttachedToVehicle"
Ped_Config_Flags[65] = "IsSwimming"
Ped_Config_Flags[66] = "WasSwimming"
Ped_Config_Flags[67] = "IsSkiing"
Ped_Config_Flags[68] = "IsSitting"
Ped_Config_Flags[69] = "KilledByStealth"
Ped_Config_Flags[70] = "KilledByTakedown"
Ped_Config_Flags[71] = "Knockedout / Dead"
Ped_Config_Flags[72] = "IsSniperScopeActive"
Ped_Config_Flags[73] = "SuperDead"
Ped_Config_Flags[74] = "_0x6D59D275"
Ped_Config_Flags[75] = "UsingCoverPoint"
Ped_Config_Flags[76] = "IsInTheAir"
Ped_Config_Flags[77] = "_0x2D493FB7"
Ped_Config_Flags[78] = "IsAimingGun"
Ped_Config_Flags[79] = "_0x14D69875"
Ped_Config_Flags[80] = "_0x40B05311"
Ped_Config_Flags[81] = "_0x8B230BC5"
Ped_Config_Flags[82] = "_0xC74E5842"
Ped_Config_Flags[83] = "_0x9EA86147"
Ped_Config_Flags[84] = "_0x674C746C"
Ped_Config_Flags[85] = "_0x3E56A8C2"
Ped_Config_Flags[86] = "_0xC144A1EF"
Ped_Config_Flags[87] = "_0x0548512D"
Ped_Config_Flags[88] = "_0x31C93909"
Ped_Config_Flags[89] = "_0xA0269315"
Ped_Config_Flags[90] = "_0xD4D59D4D"
Ped_Config_Flags[91] = "_0x411D4420"
Ped_Config_Flags[92] = "_0xDF4AEF0D"
Ped_Config_Flags[93] = "ForcePedLoadCover"
Ped_Config_Flags[94] = "_0x300E4CD3"
Ped_Config_Flags[95] = "_0xF1C5BF04"
Ped_Config_Flags[96] = "_0x89C2EF13"
Ped_Config_Flags[97] = "VaultFromCover"
Ped_Config_Flags[98] = "_0x02A852C8"
Ped_Config_Flags[99] = "_0x3D9407F1"
Ped_Config_Flags[100] = "Drunk"
Ped_Config_Flags[101] = "ForcedAim"
Ped_Config_Flags[102] = "_0xB942D71A"
Ped_Config_Flags[103] = "_0xD26C55A8"
Ped_Config_Flags[104] = "IsNotRagdollAndNotPlayingAnim"
Ped_Config_Flags[105] = "ForceReload"
Ped_Config_Flags[106] = "_0xD9E73DA2"
Ped_Config_Flags[107] = "_0xFF71DC2C"
Ped_Config_Flags[108] = "_0x1E27E8D8"
Ped_Config_Flags[109] = "_0xF2C53966"
Ped_Config_Flags[110] = "_0xC4DBE247"
Ped_Config_Flags[111] = "_0x83C0A4BF"
Ped_Config_Flags[112] = "_0x0E0FAF8C"
Ped_Config_Flags[113] = "_0x26616660"
Ped_Config_Flags[114] = "_0x43B80B79"
Ped_Config_Flags[115] = "_0x0D2A9309"
Ped_Config_Flags[116] = "_0x12C1C983"
Ped_Config_Flags[117] = "BumpedByPlayer"
Ped_Config_Flags[118] = "_0xE586D504"
Ped_Config_Flags[119] = "_0x52374204"
Ped_Config_Flags[120] = "IsHandCuffed"
Ped_Config_Flags[121] = "IsAnkleCuffed"
Ped_Config_Flags[122] = "FLAG_DisableMelee"
Ped_Config_Flags[123] = "_0xFE714397"
Ped_Config_Flags[124] = "_0xB3E660BD"
Ped_Config_Flags[125] = "NmMessage466"
Ped_Config_Flags[126] = "_0xC9D6F66F"
Ped_Config_Flags[127] = "_0x519BC986"
Ped_Config_Flags[128] = "CanBeAgitated"
Ped_Config_Flags[129] = "FaceDirInsult"
Ped_Config_Flags[130] = "_0xDAB70E9F"
Ped_Config_Flags[131] = "_0xE569438A"
Ped_Config_Flags[132] = "_0xBBC77D6D"
Ped_Config_Flags[133] = "_0xCB59EF0F"
Ped_Config_Flags[134] = "_0x8C5EA971"
Ped_Config_Flags[135] = "IsScuba"
Ped_Config_Flags[136] = "WillArrestRatherThanJack"
Ped_Config_Flags[137] = "_0xDCE59B58"
Ped_Config_Flags[138] = "RidingTrain"
Ped_Config_Flags[139] = "ArrestResult"
Ped_Config_Flags[140] = "CanAttackFriendly"
Ped_Config_Flags[141] = "_0x98A4BE43"
Ped_Config_Flags[142] = "_0x6901E731"
Ped_Config_Flags[143] = "_0x9EC9BF6C"
Ped_Config_Flags[144] = "_0x42841A8F"
Ped_Config_Flags[145] = "ShootingAnimFlag"
Ped_Config_Flags[146] = "DisableLadderClimbing"
Ped_Config_Flags[147] = "StairsDetected"
Ped_Config_Flags[148] = "SlopeDetected"
Ped_Config_Flags[149] = "_0x1A15670B"
Ped_Config_Flags[150] = "_0x61786EE5"
Ped_Config_Flags[151] = "_0xCB9186BD"
Ped_Config_Flags[152] = "_0xF0710152"
Ped_Config_Flags[153] = "_0x43DFE310"
Ped_Config_Flags[154] = "_0xC43C624E"
Ped_Config_Flags[155] = "CanPerformArrest"
Ped_Config_Flags[156] = "CanPerformUncuff"
Ped_Config_Flags[157] = "CanBeArrested"
Ped_Config_Flags[158] = "_0xF7960FF5"
Ped_Config_Flags[159] = "_0x59564113"
Ped_Config_Flags[160] = "_0x0C6C3099"
Ped_Config_Flags[161] = "_0x645F927A"
Ped_Config_Flags[162] = "_0xA86549B9"
Ped_Config_Flags[163] = "_0x8AAF337A"
Ped_Config_Flags[164] = "_0x13BAA6E7"
Ped_Config_Flags[165] = "_0x5FB9D1F5"
Ped_Config_Flags[166] = "IsInjured|InjuredLimp"
Ped_Config_Flags[167] = "_0x6398A20B"
Ped_Config_Flags[168] = "_0xD8072639"
Ped_Config_Flags[169] = "_0xA05B1845"
Ped_Config_Flags[170] = "InjuredLimp2"
Ped_Config_Flags[171] = "_0xD8430331"
Ped_Config_Flags[172] = "_0x4B547520"
Ped_Config_Flags[173] = "_0xE66E1406"
Ped_Config_Flags[174] = "_0x1C4BFE0C"
Ped_Config_Flags[175] = "_0x90008BFA"
Ped_Config_Flags[176] = "_0x07C7A910"
Ped_Config_Flags[177] = "_0xF15F8191"
Ped_Config_Flags[178] = "_0xCE4E8BE2"
Ped_Config_Flags[179] = "_0x1D46E4F2"
Ped_Config_Flags[180] = "IsInCustody"
Ped_Config_Flags[181] = "_0xE4FD9B3A"
Ped_Config_Flags[182] = "_0x67AE0812"
Ped_Config_Flags[183] = "IsAgitated"
Ped_Config_Flags[184] = "PreventAutoShuffleToDriversSeat"
Ped_Config_Flags[185] = "_0x7B2D325E OrbitalCannon Script"
Ped_Config_Flags[186] = "EnableWeaponBlocking"
Ped_Config_Flags[187] = "HasHurtStarted|InjuredDown"
Ped_Config_Flags[188] = "DisableHurt"
Ped_Config_Flags[189] = "PlayerIsWeird"
Ped_Config_Flags[190] = "_0x32FC208B"
Ped_Config_Flags[191] = "_0x0C296E5A"
Ped_Config_Flags[192] = "_0xE63B73EC"
Ped_Config_Flags[193] = "_0x04E9CC80"
Ped_Config_Flags[194] = "UsingScenario"
Ped_Config_Flags[195] = "VisibleOnScreen"
Ped_Config_Flags[196] = "_0xD88C58A1"
Ped_Config_Flags[197] = "AvoidUnderSide"
Ped_Config_Flags[198] = "_0xEA02B420"
Ped_Config_Flags[199] = "_0x3F559CFF"
Ped_Config_Flags[200] = "_0x8C55D029"
Ped_Config_Flags[201] = "_0x5E6466F6"
Ped_Config_Flags[202] = "_0xEB5AD706"
Ped_Config_Flags[203] = "_0x0EDDDDE7"
Ped_Config_Flags[204] = "_0xA64F7B1D"
Ped_Config_Flags[205] = "_0x48532CBA"
Ped_Config_Flags[206] = "_0xAA25A9E7"
Ped_Config_Flags[207] = "_0x415B26B9"
Ped_Config_Flags[208] = "DisableExplosionReactions"
Ped_Config_Flags[209] = "DodgedPlayer"
Ped_Config_Flags[210] = "_0x67405504"
Ped_Config_Flags[211] = "_0x75DDD68C"
Ped_Config_Flags[212] = "_0x2AD879B4"
Ped_Config_Flags[213] = "_0x51486F91"
Ped_Config_Flags[214] = "_0x32F79E21"
Ped_Config_Flags[215] = "_0xBF099213"
Ped_Config_Flags[216] = "_0x054AC8E2"
Ped_Config_Flags[217] = "_0x14E495CC"
Ped_Config_Flags[218] = "_0x3C7DF9DF"
Ped_Config_Flags[219] = "_0x848FFEF2"
Ped_Config_Flags[220] = "DontEnterLeadersVehicle"
Ped_Config_Flags[221] = "_0x2618E1CF"
Ped_Config_Flags[222] = "_0x84F722FA"
Ped_Config_Flags[223] = "Shrink"
Ped_Config_Flags[224] = "MeleeCombat"
Ped_Config_Flags[225] = "DisablePotentialToBeWalkedIntoResponse"
Ped_Config_Flags[226] = "DisablePedAvoidance"
Ped_Config_Flags[227] = "_0x59E91185"
Ped_Config_Flags[228] = "_0x1EA7225F"
Ped_Config_Flags[229] = "DisablePanicInVehicle"
Ped_Config_Flags[230] = "_0x6DCA7D88"
Ped_Config_Flags[231] = "_0xFC3E572D"
Ped_Config_Flags[232] = "_0x08E9F9CF"
Ped_Config_Flags[233] = "_0x2D3BA52D"
Ped_Config_Flags[234] = "_0xFD2F53EA"
Ped_Config_Flags[235] = "_0x31A1B03B"
Ped_Config_Flags[236] = "IsHoldingProp"
Ped_Config_Flags[237] = "BlocksPathingWhenDead"
Ped_Config_Flags[238] = "_0xCE57C9A3"
Ped_Config_Flags[239] = "_0x26149198"
Ped_Config_Flags[240] = "_0x1B33B598"
Ped_Config_Flags[241] = "DisableStoppingVehEngine"
Ped_Config_Flags[242] = "_0x13E8E8E8"
Ped_Config_Flags[243] = "_0xF29739AE"
Ped_Config_Flags[244] = "_0xABEA8A74"
Ped_Config_Flags[245] = "_0xB60EA2BA"
Ped_Config_Flags[246] = "_0x536B0950"
Ped_Config_Flags[247] = "_0x0C754ACA"
Ped_Config_Flags[248] = "DisableVehicleSeatRandomAnimations"
Ped_Config_Flags[249] = "_0x12659168"
Ped_Config_Flags[250] = "_0x1BDF2F04"
Ped_Config_Flags[251] = "_0x7728FAA3"
Ped_Config_Flags[252] = "_0x6A807ED8"
Ped_Config_Flags[253] = "OnStairs"
Ped_Config_Flags[254] = "_0xE1A2F73F"
Ped_Config_Flags[255] = "_0x5B3697C8"
Ped_Config_Flags[256] = "_0xF1EB20A9"
Ped_Config_Flags[257] = "_0x8B7DF407"
Ped_Config_Flags[258] = "_0x329DCF1A"
Ped_Config_Flags[259] = "_0x8D90DD1B"
Ped_Config_Flags[260] = "_0xB8A292B7"
Ped_Config_Flags[261] = "_0x8374B087"
Ped_Config_Flags[262] = "_0x2AF558F0"
Ped_Config_Flags[263] = "_0x82251455"
Ped_Config_Flags[264] = "_0x30CF498B"
Ped_Config_Flags[265] = "_0xE1CD50AF"
Ped_Config_Flags[266] = "_0x72E4AE48"
Ped_Config_Flags[267] = "_0xC2657EA1"
Ped_Config_Flags[268] = "_0x29FF6030"
Ped_Config_Flags[269] = "_0x8248A5EC"
Ped_Config_Flags[270] = "OnStairSlope"
Ped_Config_Flags[271] = "_0xA0897933"
Ped_Config_Flags[272] = "DontBlipCop"
Ped_Config_Flags[273] = "ClimbedShiftedFence"
Ped_Config_Flags[274] = "_0xF7823618"
Ped_Config_Flags[275] = "KillWhenTrapped"
Ped_Config_Flags[276] = "EdgeDetected|HasOneLegOnGround"
Ped_Config_Flags[277] = "_0x92B67896"
Ped_Config_Flags[278] = "_0xCAD677C9"
Ped_Config_Flags[279] = "AvoidTearGas"
Ped_Config_Flags[280] = "_0x5276AC7B"
Ped_Config_Flags[281] = "NoWrithe"
Ped_Config_Flags[282] = "_0xDA23E7F1"
Ped_Config_Flags[283] = "_0x9139724D"
Ped_Config_Flags[284] = "_0xA1457461"
Ped_Config_Flags[285] = "_0x4186E095"
Ped_Config_Flags[286] = "_0xAC68E2EB"
Ped_Config_Flags[287] = "RagdollingOnBoat"
Ped_Config_Flags[288] = "HasBrandishedWeapon"
Ped_Config_Flags[289] = "_0x1B9EE8A1"
Ped_Config_Flags[290] = "_0xF3F5758C"
Ped_Config_Flags[291] = "_0x2A9307F1"
Ped_Config_Flags[292] = "Freeze"
Ped_Config_Flags[293] = "_0xA06A3C6C"
Ped_Config_Flags[294] = "DisableShockingEvents"
Ped_Config_Flags[295] = "_0xF8DA25A5"
Ped_Config_Flags[296] = "_0x7EF55802"
Ped_Config_Flags[297] = "_0xB31F1187"
Ped_Config_Flags[298] = "_0x84315402"
Ped_Config_Flags[299] = "_0x0FD69867"
Ped_Config_Flags[300] = "_0xC7829B67"
Ped_Config_Flags[301] = "DisablePedConstraints|IsStill"
Ped_Config_Flags[302] = "_0x6D23CF25"
Ped_Config_Flags[303] = "_0x2ADA871B"
Ped_Config_Flags[304] = "_0x47BC8A58"
Ped_Config_Flags[305] = "_0xEB692FA5"
Ped_Config_Flags[306] = "_0x4A133C50"
Ped_Config_Flags[307] = "_0xC58099C3"
Ped_Config_Flags[308] = "_0xF3D76D41"
Ped_Config_Flags[309] = "_0xB0EEE9F2"
Ped_Config_Flags[310] = "IsInCluster"
Ped_Config_Flags[311] = "_0x0FA153EF"
Ped_Config_Flags[312] = "_0xD73F5CD3"
Ped_Config_Flags[313] = "_0xD4136C22"
Ped_Config_Flags[314] = "NoPedMelee"
Ped_Config_Flags[315] = "_0xB9597446"
Ped_Config_Flags[316] = "_0xD5C98277"
Ped_Config_Flags[317] = "_0xD5060A9C"
Ped_Config_Flags[318] = "_0x3E5F1CBB"
Ped_Config_Flags[319] = "_0xD8BE1D54"
Ped_Config_Flags[320] = "_0x0B1F191F"
Ped_Config_Flags[321] = "_0xC995167A"
Ped_Config_Flags[322] = "HasHighHeels"
Ped_Config_Flags[323] = "_0x86B01E54"
Ped_Config_Flags[324] = "_0x3A56FE15"
Ped_Config_Flags[325] = "SpawnedAtScenario"
Ped_Config_Flags[326] = "_0xBBF47729"
Ped_Config_Flags[327] = "_0x22B668A8"
Ped_Config_Flags[328] = "_0x2624D4D4"
Ped_Config_Flags[329] = "DisableTalkTo"
Ped_Config_Flags[330] = "DontBlip"
Ped_Config_Flags[331] = "IsSwitchingWeapon"
Ped_Config_Flags[332] = "_0x630F55F3"
Ped_Config_Flags[333] = "_0x150468FD"
Ped_Config_Flags[334] = "_0x914EBD6B"
Ped_Config_Flags[335] = "_0x79AF3B6D"
Ped_Config_Flags[336] = "_0x75C7A632"
Ped_Config_Flags[337] = "_0x52D530E2"
Ped_Config_Flags[338] = "_0xDB2A90E0"
Ped_Config_Flags[339] = "_0x5922763D"
Ped_Config_Flags[340] = "_0x12ADB567"
Ped_Config_Flags[341] = "_0x105C8518"
Ped_Config_Flags[342] = "_0x106F703D"
Ped_Config_Flags[343] = "_0xED152C3E"
Ped_Config_Flags[344] = "_0xA0EFE6A8"
Ped_Config_Flags[345] = "_0xBF348C82"
Ped_Config_Flags[346] = "_0xCDDFE830"
Ped_Config_Flags[347] = "_0x7B59BD9B"
Ped_Config_Flags[348] = "_0x0124C788"
Ped_Config_Flags[349] = "EquipJetpack"
Ped_Config_Flags[350] = "_0x08D361A5"
Ped_Config_Flags[351] = "_0xE13D1F7C"
Ped_Config_Flags[352] = "_0x40E25FB9"
Ped_Config_Flags[353] = "_0x930629D9"
Ped_Config_Flags[354] = "_0xECCF0C7F"
Ped_Config_Flags[355] = "_0xB6E9613B"
Ped_Config_Flags[356] = "_0x490C0478"
Ped_Config_Flags[357] = "_0xE8865BEA"
Ped_Config_Flags[358] = "_0xF3C34A29"
Ped_Config_Flags[359] = "IsDuckingInVehicle"
Ped_Config_Flags[360] = "_0xF660E115"
Ped_Config_Flags[361] = "_0xAB0E6DED"
Ped_Config_Flags[362] = "HasReserveParachute"
Ped_Config_Flags[363] = "UseReserveParachute"
Ped_Config_Flags[364] = "_0x5C5D9CD3"
Ped_Config_Flags[365] = "_0x8F7701F3"
Ped_Config_Flags[366] = "_0xBC4436AD"
Ped_Config_Flags[367] = "_0xD7E07D37"
Ped_Config_Flags[368] = "_0x03C4FD24"
Ped_Config_Flags[369] = "_0x7675789A"
Ped_Config_Flags[370] = "_0xB7288A88"
Ped_Config_Flags[371] = "_0xC06B6291"
Ped_Config_Flags[372] = "_0x95A4A805"
Ped_Config_Flags[373] = "_0xA8E9A042"
Ped_Config_Flags[374] = "NeverLeaveTrain"
Ped_Config_Flags[375] = "_0xBAC674B3"
Ped_Config_Flags[376] = "_0x147F1FFB"
Ped_Config_Flags[377] = "_0x4376DD79"
Ped_Config_Flags[378] = "_0xCD3DB518"
Ped_Config_Flags[379] = "_0xFE4BA4B6"
Ped_Config_Flags[380] = "_0x5DF03A55"
Ped_Config_Flags[381] = "_0xBCD816CD"
Ped_Config_Flags[382] = "_0xCF02DD69"
Ped_Config_Flags[383] = "_0xF73AFA2E"
Ped_Config_Flags[384] = "_0x80B9A9D0"
Ped_Config_Flags[385] = "_0xF601F7EE"
Ped_Config_Flags[386] = "_0xA91350FC"
Ped_Config_Flags[387] = "_0x3AB23B96"
Ped_Config_Flags[388] = "IsClimbingLadder"
Ped_Config_Flags[389] = "HasBareFeet"
Ped_Config_Flags[390] = "_0xB4B1CD4C"
Ped_Config_Flags[391] = "_0x5459AFB8"
Ped_Config_Flags[392] = "_0x54F27667"
Ped_Config_Flags[393] = "_0xC11D3E8F"
Ped_Config_Flags[394] = "_0x5419EB3E"
Ped_Config_Flags[395] = "_0x82D8DBB4"
Ped_Config_Flags[396] = "_0x33B02D2F"
Ped_Config_Flags[397] = "_0xAE66176D"
Ped_Config_Flags[398] = "_0xA2692593"
Ped_Config_Flags[399] = "_0x714C7E31"
Ped_Config_Flags[400] = "_0xEC488AC7"
Ped_Config_Flags[401] = "_0xAE398504"
Ped_Config_Flags[402] = "_0xABC58D72"
Ped_Config_Flags[403] = "_0x5E5B9591"
Ped_Config_Flags[404] = "_0x6BA1091E"
Ped_Config_Flags[405] = "_0x77840177"
Ped_Config_Flags[406] = "_0x1C7ACAC4"
Ped_Config_Flags[407] = "_0x124420E9"
Ped_Config_Flags[408] = "_0x75A65587"
Ped_Config_Flags[409] = "_0xDFD2D55B"
Ped_Config_Flags[410] = "Alpha"
Ped_Config_Flags[411] = "_0x43DEC267"
Ped_Config_Flags[412] = "_0xE42B7797"
Ped_Config_Flags[413] = "IsHolsteringWeapon"
Ped_Config_Flags[414] = "_0x4F8149F5"
Ped_Config_Flags[415] = "_0xDD9ECA7A"
Ped_Config_Flags[416] = "_0x9E7EF9D2"
Ped_Config_Flags[417] = "_0x2C6ED942"
Ped_Config_Flags[418] = "IsSwitchingHelmetVisor"
Ped_Config_Flags[419] = "_0xA488727D"
Ped_Config_Flags[420] = "_0xCFF5F6DE"
Ped_Config_Flags[421] = "FlamingFootprints"
Ped_Config_Flags[422] = "DisableVehicleCombat"
Ped_Config_Flags[423] = "DisablePropKnockOff"
Ped_Config_Flags[424] = "FallsLikeAircraft"
Ped_Config_Flags[425] = "_0x2B42AE82"
Ped_Config_Flags[426] = "_0x7A95734F"
Ped_Config_Flags[427] = "_0xDF4D8617"
Ped_Config_Flags[428] = "_0x578F1F14"
Ped_Config_Flags[429] = "DisableStartEngine"
Ped_Config_Flags[430] = "IgnoreBeingOnFire"
Ped_Config_Flags[431] = "_0x153C9500"
Ped_Config_Flags[432] = "_0xCB7A632E"
Ped_Config_Flags[433] = "_0xDE727981"
Ped_Config_Flags[434] = "DisableHomingMissileLockon"
Ped_Config_Flags[435] = "_0x12BBB935"
Ped_Config_Flags[436] = "_0xAD0A1277"
Ped_Config_Flags[437] = "_0xEA6AA46A"
Ped_Config_Flags[438] = "DisableHelmetArmor"
Ped_Config_Flags[439] = "_0xCB7F3A1E"
Ped_Config_Flags[440] = "_0x50178878"
Ped_Config_Flags[441] = "_0x051B4F0D"
Ped_Config_Flags[442] = "_0x2FC3DECC"
Ped_Config_Flags[443] = "_0xC0030B0B"
Ped_Config_Flags[444] = "_0xBBDAF1E9"
Ped_Config_Flags[445] = "_0x944FE59C"
Ped_Config_Flags[446] = "_0x506FBA39"
Ped_Config_Flags[447] = "_0xDD45FE84"
Ped_Config_Flags[448] = "_0xE698AE75"
Ped_Config_Flags[449] = "_0x199633F8"
Ped_Config_Flags[450] = "PedIsArresting"
Ped_Config_Flags[451] = "IsDecoyPed"
Ped_Config_Flags[452] = "_0x3A251D83"
Ped_Config_Flags[453] = "_0xA56F6986"
Ped_Config_Flags[454] = "_0x1D19C622"
Ped_Config_Flags[455] = "_0xB68D3EAB"
Ped_Config_Flags[456] = "CanBeIncapacitated"
Ped_Config_Flags[457] = "_0x4BD5EBAD"
PedConfigFlags  = {
	{2, "NoCriticalHits"},
	{3, "DrownsInWater"},
	{4, "DisableReticuleFixedLockon"},
	{7, "UpperBodyDamageAnimsOnly"},
	{13, "NeverLeavesGroup"},
	{17, "BlockNonTemporaryEvents"},
	{24, "IgnoreSeenMelee"},
	{32, "CanFlyThruWindscreen"},
	{33, "DieWhenRagdoll"},
	{34, "HasHelmet"},
	{35, "UseHelmet"},
	{39, "DisableEvasiveDives"},
	{42, "DontInfluenceWantedLevel"},
	{43, "DisablePlayerLockon"},
	{44, "DisableLockonToRandomPeds"},
	{47, "PedBeingDeleted"},
	{48, "BlockWeaponSwitching"},
	{58, "IsFiring"},
	{59, "WasFiring"},
	{60, "IsStanding"},
	{61, "WasStanding"},
	{62, "InVehicle"},
	{63, "OnMount"},
	{64, "AttachedToVehicle"},
	{65, "IsSwimming"},
	{66, "WasSwimming"},
	{67, "IsSkiing"},
	{68, "IsSitting"},
	{69, "KilledByStealth"},
	{70, "KilledByTakedown"},
	{71, "Knockedout / Dead"},
	{72, "IsSniperScopeActive"},
	{73, "SuperDead"},
	{75, "UsingCoverPoint"},
	{76, "IsInTheAir"},
	{78, "IsAimingGun"},
	{93, "ForcePedLoadCover"},
	{97, "VaultFromCover"},
	{100, "Drunk"},
	{101, "ForcedAim"},
	{104, "IsNotRagdollAndNotPlayingAnim"},
	{105, "ForceReload"},
	{117, "BumpedByPlayer"},
	{120, "IsHandCuffed"},
	{121, "IsAnkleCuffed"},
	{122, "FLAG_DisableMelee"},
	{125, "NmMessage466"},
	{128, "CanBeAgitated"},
	{129, "FaceDirInsult"},
	{135, "IsScuba"},
	{136, "WillArrestRatherThanJack"},
	{138, "RidingTrain"},
	{139, "ArrestResult"},
	{140, "CanAttackFriendly"},
	{145, "ShootingAnimFlag"},
	{146, "DisableLadderClimbing"},
	{147, "StairsDetected"},
	{148, "SlopeDetected"},
	{155, "CanPerformArrest"},
	{156, "CanPerformUncuff"},
	{157, "CanBeArrested"},
	{166, "IsInjured|InjuredLimp"},
	{170, "InjuredLimp2"},
	{180, "IsInCustody"},
	{183, "IsAgitated"},
	{184, "PreventAutoShuffleToDriversSeat"},
	{186, "EnableWeaponBlocking"},
	{187, "HasHurtStarted|InjuredDown"},
	{188, "DisableHurt"},
	{189, "PlayerIsWeird"},
	{194, "UsingScenario"},
	{195, "VisibleOnScreen"},
	{197, "AvoidUnderSide"},
	{208, "DisableExplosionReactions"},
	{209, "DodgedPlayer"},
	{220, "DontEnterLeadersVehicle"},
	{223, "Shrink"},
	{224, "MeleeCombat"},
	{225, "DisablePotentialToBeWalkedIntoResponse"},
	{226, "DisablePedAvoidance"},
	{229, "DisablePanicInVehicle"},
	{236, "IsHoldingProp"},
	{237, "BlocksPathingWhenDead"},
	{241, "DisableStoppingVehEngine"},
	{248, "DisableVehicleSeatRandomAnimations"},
	{253, "OnStairs"},
	{270, "OnStairSlope"},
	{272, "DontBlipCop"},
	{273, "ClimbedShiftedFence"},
	{275, "KillWhenTrapped"},
	{276, "EdgeDetected|HasOneLegOnGround"},
	{279, "AvoidTearGas"},
	{281, "NoWrithe"},
	{287, "RagdollingOnBoat"},
	{288, "HasBrandishedWeapon"},
	{292, "Freeze"},
	{294, "DisableShockingEvents"},
	{301, "DisablePedConstraints|IsStill"},
	{310, "IsInCluster"},
	{314, "NoPedMelee"},
	{322, "HasHighHeels"},
	{325, "SpawnedAtScenario"},
	{329, "DisableTalkTo"},
	{330, "DontBlip"},
	{331, "IsSwitchingWeapon"},
	{349, "EquipJetpack"},
	{359, "IsDuckingInVehicle"},
	{362, "HasReserveParachute"},
	{363, "UseReserveParachute"},
	{374, "NeverLeaveTrain"},
	{388, "IsClimbingLadder"},
	{389, "HasBareFeet"},
	{410, "Alpha"},
	{413, "IsHolsteringWeapon"},
	{418, "IsSwitchingHelmetVisor"},
	{421, "FlamingFootprints"},
	{422, "DisableVehicleCombat"},
	{423, "DisablePropKnockOff"},
	{424, "FallsLikeAircraft"},
	{429, "DisableStartEngine"},
	{430, "IgnoreBeingOnFire"},
	{434, "DisableHomingMissileLockon"},
	{438, "DisableHelmetArmor"},
	{450, "PedIsArresting"},
	{451, "IsDecoyPed"},
	{456, "CanBeIncapacitated"},
	{185, "_0x7B2D325E OrbitalCannon Script"},
	{20, "_0x583B5E2D can be targetted?"},
	{0, "_0x67D1A445"},
	{1, "_0xC63DE95E"},
	{5, "_0x37D196F4"},
	{6, "_0xE2462399"},
	{8, "_0xEDDEB838"},
	{9, "_0xB398B6FD"},
	{10, "_0xF6664E68"},
	{11, "_0xA05E7CA3"},
	{12, "_0xCE394045"},
	{14, "_0xCD8D1411"},
	{15, "_0xB031F1A9"},
	{16, "_0xFE65BEE3"},
	{18, "_0x380165BD"},
	{19, "_0x07C045C7"},
	{21, "_0x475EDA58"},
	{22, "_0x8629D05B"},
	{23, "_0x1522968B"},
	{25, "_0x4CC09C4B"},
	{26, "_0x034F3053"},
	{27, "_0xD91BA7CC"},
	{28, "_0x5C8DC66E"},
	{29, "_0x8902EAA0"},
	{30, "_0x6580B9D2"},
	{31, "_0x0EF7A297"},
	{36, "_0xEEB3D630"},
	{37, "_0xB130D17B"},
	{38, "_0x5F071200"},
	{40, "_0xC287AAFF"},
	{41, "_0x203328CC"},
	{45, "_0xEC4A8ACF"},
	{46, "_0xDB115BFA"},
	{49, "_0xF8E99565"},
	{50, "_0xDD17FEE6"},
	{51, "_0x7ED9B2C9"},
	{52, "_0x655E8618"},
	{53, "_0x5A6C1F6E"},
	{54, "_0xD749FC41"},
	{55, "_0x357F63F3"},
	{56, "_0xC5E60961"},
	{57, "_0x29275C3E"},
	{74, "_0x6D59D275"},
	{77, "_0x2D493FB7"},
	{79, "_0x14D69875"},
	{80, "_0x40B05311"},
	{81, "_0x8B230BC5"},
	{82, "_0xC74E5842"},
	{83, "_0x9EA86147"},
	{84, "_0x674C746C"},
	{85, "_0x3E56A8C2"},
	{86, "_0xC144A1EF"},
	{87, "_0x0548512D"},
	{88, "_0x31C93909"},
	{89, "_0xA0269315"},
	{90, "_0xD4D59D4D"},
	{91, "_0x411D4420"},
	{92, "_0xDF4AEF0D"},
	{94, "_0x300E4CD3"},
	{95, "_0xF1C5BF04"},
	{96, "_0x89C2EF13"},
	{98, "_0x02A852C8"},
	{99, "_0x3D9407F1"},
	{102, "_0xB942D71A"},
	{103, "_0xD26C55A8"},
	{106, "_0xD9E73DA2"},
	{107, "_0xFF71DC2C"},
	{108, "_0x1E27E8D8"},
	{109, "_0xF2C53966"},
	{110, "_0xC4DBE247"},
	{111, "_0x83C0A4BF"},
	{112, "_0x0E0FAF8C"},
	{113, "_0x26616660"},
	{114, "_0x43B80B79"},
	{115, "_0x0D2A9309"},
	{116, "_0x12C1C983"},
	{118, "_0xE586D504"},
	{119, "_0x52374204"},
	{123, "_0xFE714397"},
	{124, "_0xB3E660BD"},
	{126, "_0xC9D6F66F"},
	{127, "_0x519BC986"},
	{130, "_0xDAB70E9F"},
	{131, "_0xE569438A"},
	{132, "_0xBBC77D6D"},
	{133, "_0xCB59EF0F"},
	{134, "_0x8C5EA971"},
	{137, "_0xDCE59B58"},
	{141, "_0x98A4BE43"},
	{142, "_0x6901E731"},
	{143, "_0x9EC9BF6C"},
	{144, "_0x42841A8F"},
	{149, "_0x1A15670B"},
	{150, "_0x61786EE5"},
	{151, "_0xCB9186BD"},
	{152, "_0xF0710152"},
	{153, "_0x43DFE310"},
	{154, "_0xC43C624E"},
	{158, "_0xF7960FF5"},
	{159, "_0x59564113"},
	{160, "_0x0C6C3099"},
	{161, "_0x645F927A"},
	{162, "_0xA86549B9"},
	{163, "_0x8AAF337A"},
	{164, "_0x13BAA6E7"},
	{165, "_0x5FB9D1F5"},
	{167, "_0x6398A20B"},
	{168, "_0xD8072639"},
	{169, "_0xA05B1845"},
	{171, "_0xD8430331"},
	{172, "_0x4B547520"},
	{173, "_0xE66E1406"},
	{174, "_0x1C4BFE0C"},
	{175, "_0x90008BFA"},
	{176, "_0x07C7A910"},
	{177, "_0xF15F8191"},
	{178, "_0xCE4E8BE2"},
	{179, "_0x1D46E4F2"},
	{181, "_0xE4FD9B3A"},
	{182, "_0x67AE0812"},
	{190, "_0x32FC208B"},
	{191, "_0x0C296E5A"},
	{192, "_0xE63B73EC"},
	{193, "_0x04E9CC80"},
	{196, "_0xD88C58A1"},
	{198, "_0xEA02B420"},
	{199, "_0x3F559CFF"},
	{200, "_0x8C55D029"},
	{201, "_0x5E6466F6"},
	{202, "_0xEB5AD706"},
	{203, "_0x0EDDDDE7"},
	{204, "_0xA64F7B1D"},
	{205, "_0x48532CBA"},
	{206, "_0xAA25A9E7"},
	{207, "_0x415B26B9"},
	{210, "_0x67405504"},
	{211, "_0x75DDD68C"},
	{212, "_0x2AD879B4"},
	{213, "_0x51486F91"},
	{214, "_0x32F79E21"},
	{215, "_0xBF099213"},
	{216, "_0x054AC8E2"},
	{217, "_0x14E495CC"},
	{218, "_0x3C7DF9DF"},
	{219, "_0x848FFEF2"},
	{221, "_0x2618E1CF"},
	{222, "_0x84F722FA"},
	{227, "_0x59E91185"},
	{228, "_0x1EA7225F"},
	{230, "_0x6DCA7D88"},
	{231, "_0xFC3E572D"},
	{232, "_0x08E9F9CF"},
	{233, "_0x2D3BA52D"},
	{234, "_0xFD2F53EA"},
	{235, "_0x31A1B03B"},
	{238, "_0xCE57C9A3"},
	{239, "_0x26149198"},
	{240, "_0x1B33B598"},
	{242, "_0x13E8E8E8"},
	{243, "_0xF29739AE"},
	{244, "_0xABEA8A74"},
	{245, "_0xB60EA2BA"},
	{246, "_0x536B0950"},
	{247, "_0x0C754ACA"},
	{249, "_0x12659168"},
	{250, "_0x1BDF2F04"},
	{251, "_0x7728FAA3"},
	{252, "_0x6A807ED8"},
	{254, "_0xE1A2F73F"},
	{255, "_0x5B3697C8"},
	{256, "_0xF1EB20A9"},
	{257, "_0x8B7DF407"},
	{258, "_0x329DCF1A"},
	{259, "_0x8D90DD1B"},
	{260, "_0xB8A292B7"},
	{261, "_0x8374B087"},
	{262, "_0x2AF558F0"},
	{263, "_0x82251455"},
	{264, "_0x30CF498B"},
	{265, "_0xE1CD50AF"},
	{266, "_0x72E4AE48"},
	{267, "_0xC2657EA1"},
	{268, "_0x29FF6030"},
	{269, "_0x8248A5EC"},
	{271, "_0xA0897933"},
	{274, "_0xF7823618"},
	{277, "_0x92B67896"},
	{278, "_0xCAD677C9"},
	{280, "_0x5276AC7B"},
	{282, "_0xDA23E7F1"},
	{283, "_0x9139724D"},
	{284, "_0xA1457461"},
	{285, "_0x4186E095"},
	{286, "_0xAC68E2EB"},
	{289, "_0x1B9EE8A1"},
	{290, "_0xF3F5758C"},
	{291, "_0x2A9307F1"},
	{293, "_0xA06A3C6C"},
	{295, "_0xF8DA25A5"},
	{296, "_0x7EF55802"},
	{297, "_0xB31F1187"},
	{298, "_0x84315402"},
	{299, "_0x0FD69867"},
	{300, "_0xC7829B67"},
	{302, "_0x6D23CF25"},
	{303, "_0x2ADA871B"},
	{304, "_0x47BC8A58"},
	{305, "_0xEB692FA5"},
	{306, "_0x4A133C50"},
	{307, "_0xC58099C3"},
	{308, "_0xF3D76D41"},
	{309, "_0xB0EEE9F2"},
	{311, "_0x0FA153EF"},
	{312, "_0xD73F5CD3"},
	{313, "_0xD4136C22"},
	{315, "_0xB9597446"},
	{316, "_0xD5C98277"},
	{317, "_0xD5060A9C"},
	{318, "_0x3E5F1CBB"},
	{319, "_0xD8BE1D54"},
	{320, "_0x0B1F191F"},
	{321, "_0xC995167A"},
	{323, "_0x86B01E54"},
	{324, "_0x3A56FE15"},
	{326, "_0xBBF47729"},
	{327, "_0x22B668A8"},
	{328, "_0x2624D4D4"},
	{332, "_0x630F55F3"},
	{333, "_0x150468FD"},
	{334, "_0x914EBD6B"},
	{335, "_0x79AF3B6D"},
	{336, "_0x75C7A632"},
	{337, "_0x52D530E2"},
	{338, "_0xDB2A90E0"},
	{339, "_0x5922763D"},
	{340, "_0x12ADB567"},
	{341, "_0x105C8518"},
	{342, "_0x106F703D"},
	{343, "_0xED152C3E"},
	{344, "_0xA0EFE6A8"},
	{345, "_0xBF348C82"},
	{346, "_0xCDDFE830"},
	{347, "_0x7B59BD9B"},
	{348, "_0x0124C788"},
	{350, "_0x08D361A5"},
	{351, "_0xE13D1F7C"},
	{352, "_0x40E25FB9"},
	{353, "_0x930629D9"},
	{354, "_0xECCF0C7F"},
	{355, "_0xB6E9613B"},
	{356, "_0x490C0478"},
	{357, "_0xE8865BEA"},
	{358, "_0xF3C34A29"},
	{360, "_0xF660E115"},
	{361, "_0xAB0E6DED"},
	{364, "_0x5C5D9CD3"},
	{365, "_0x8F7701F3"},
	{366, "_0xBC4436AD"},
	{367, "_0xD7E07D37"},
	{368, "_0x03C4FD24"},
	{369, "_0x7675789A"},
	{370, "_0xB7288A88"},
	{371, "_0xC06B6291"},
	{372, "_0x95A4A805"},
	{373, "_0xA8E9A042"},
	{375, "_0xBAC674B3"},
	{376, "_0x147F1FFB"},
	{377, "_0x4376DD79"},
	{378, "_0xCD3DB518"},
	{379, "_0xFE4BA4B6"},
	{380, "_0x5DF03A55"},
	{381, "_0xBCD816CD"},
	{382, "_0xCF02DD69"},
	{383, "_0xF73AFA2E"},
	{384, "_0x80B9A9D0"},
	{385, "_0xF601F7EE"},
	{386, "_0xA91350FC"},
	{387, "_0x3AB23B96"},
	{390, "_0xB4B1CD4C"},
	{391, "_0x5459AFB8"},
	{392, "_0x54F27667"},
	{393, "_0xC11D3E8F"},
	{394, "_0x5419EB3E"},
	{395, "_0x82D8DBB4"},
	{396, "_0x33B02D2F"},
	{397, "_0xAE66176D"},
	{398, "_0xA2692593"},
	{399, "_0x714C7E31"},
	{400, "_0xEC488AC7"},
	{401, "_0xAE398504"},
	{402, "_0xABC58D72"},
	{403, "_0x5E5B9591"},
	{404, "_0x6BA1091E"},
	{405, "_0x77840177"},
	{406, "_0x1C7ACAC4"},
	{407, "_0x124420E9"},
	{408, "_0x75A65587"},
	{409, "_0xDFD2D55B"},
	{411, "_0x43DEC267"},
	{412, "_0xE42B7797"},
	{414, "_0x4F8149F5"},
	{415, "_0xDD9ECA7A"},
	{416, "_0x9E7EF9D2"},
	{417, "_0x2C6ED942"},
	{419, "_0xA488727D"},
	{420, "_0xCFF5F6DE"},
	{425, "_0x2B42AE82"},
	{426, "_0x7A95734F"},
	{427, "_0xDF4D8617"},
	{428, "_0x578F1F14"},
	{431, "_0x153C9500"},
	{432, "_0xCB7A632E"},
	{433, "_0xDE727981"},
	{435, "_0x12BBB935"},
	{436, "_0xAD0A1277"},
	{437, "_0xEA6AA46A"},
	{439, "_0xCB7F3A1E"},
	{440, "_0x50178878"},
	{441, "_0x051B4F0D"},
	{442, "_0x2FC3DECC"},
	{443, "_0xC0030B0B"},
	{444, "_0xBBDAF1E9"},
	{445, "_0x944FE59C"},
	{446, "_0x506FBA39"},
	{447, "_0xDD45FE84"},
	{448, "_0xE698AE75"},
	{449, "_0x199633F8"},
	{452, "_0x3A251D83"},
	{453, "_0xA56F6986"},
	{454, "_0x1D19C622"},
	{455, "_0xB68D3EAB"},
	{457, "_0x4BD5EBAD"},
}
PedConfigLabel = {}
function PedConfigFlagLabels()
	for i = 1, #PedConfigFlags do
		PedConfigLabel[#PedConfigLabel+1] = PedConfigFlags[i][2]
	end
end
PedConfigFlagLabels()
ConfigFlag_DataValue = 1
ConfigFlagDataValue = 1 and true or false
Selected_ped = player.get_player_ped(player.player_id())
currentvalue = tostring("Current Value: " .. ConfigFlag_DataValue and true or false)
PedConfigFlagsParent = menu.add_feature("Ped Config Flags", "parent", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	SelPlayer:set_str_data(Playerz)
end)
SelPlayer = menu.add_feature("Set: ", "autoaction_value_str", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Selected_ped = player.get_player_ped(feat.value)
end)
SelPlayer:set_str_data(Playerz)
configlabel = menu.add_feature("Current Value: " .. tostring(currentvalue), "action", PedConfigFlagsParent.id)
ConfigVal = menu.add_feature("Set Value: ", "autoaction_value_str", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	ConfigFlag_DataValue = feat.value
	-- ConfigFlagDataValue = ConfigFlag_DataValue and true or false
	-- featvalue = 1 and true or false
	if feat.value == 1 then
		currentvalue = 1 and true
		elseif feat.value == 0 then
		currentvalue = 0 and false
	end
	configlabel.name = "Current Value: " .. tostring(currentvalue)
end)
ConfigVal:set_str_data({"false", "true"})
ConfigCustom = menu.add_feature("Input Custom", "action", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local r, CustInput = input.get("Enter a Custom Value or Hash ", "", 64, 0)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		return HANDLER_POP
	end
	ConfigFlag_DataValue = tonumber(CustInput)
	configlabel.name = "Current Value: " .. tostring(ConfigFlag_DataValue)
end)
ConfigCustom = menu.add_feature("Input Custom & hashit", "action", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local r, CustInput = input.get("Enter a Custom Value or Hash ", "", 64, 0)
	if r == 1 then
		return HANDLER_CONTINUE
		elseif r == 2 then
		return HANDLER_POP
	end
	ConfigFlag_DataValue = gameplay.get_hash_key(CustInput)
	configlabel.name = "Current Value: " .. tostring(ConfigFlag_DataValue)
end)
taskinF = menu.add_feature("Set config flag: ", "action_value_i", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local value_set = 1 and true or false
	local EpedCfgID, EpedCfg, isSet = PedConfigFlags[feat.value][1], PedConfigFlags[feat.value][2], ped.set_ped_config_flag(Selected_ped, PedConfigFlags[feat.value][1], ConfigFlag_DataValue)
	if ConfigFlag_DataValue ~= 1 or ConfigFlag_DataValue ~= 0 then
		valueset = " Value: " .. ConfigFlag_DataValue
		elseif ConfigFlag_DataValue == 1 then
		valueset = " Value: " ..  tostring(1 and true) .. " | " .. ConfigFlag_DataValue
		elseif ConfigFlag_DataValue == 0 then
		valueset = " Value: " ..  tostring(0 and false) .. " | " .. ConfigFlag_DataValue	
	end
	moist_notify("Config: " ..EpedCfgID ..": " .. tostring(EpedCfg) .. "\nSet: " .. valueset .."\nSuccess: " .. tostring(isSet))
end)
taskinF["max"] = 457
taskinF["min"] = 1
taskinF["value"] = 1
ConfigNearbyParent = menu.add_feature("Apply to nearby Peds", "parent", PedConfigFlagsParent.id)
local AllPeds
function GetNearby()
	AllPeds = ped.get_all_peds()
end
ConfigNearbyPeds = menu.add_feature("Set config flag: ", "action_value_i", ConfigNearbyParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	GetNearby()
	local value_set = 1 and true or false
	for i = 1, #AllPeds do
		local EpedCfgID, EpedCfg, isSet = PedConfigFlags[feat.value][1], PedConfigFlags[feat.value][2], ped.set_ped_config_flag(AllPeds[i], PedConfigFlags[feat.value][1], ConfigFlag_DataValue)
		if ConfigFlag_DataValue ~= 1 or ConfigFlag_DataValue ~= 0 then
			valueset = " Value: " .. ConfigFlag_DataValue
			elseif ConfigFlag_DataValue == 1 then
			valueset = " Value: " ..  tostring(1 and true) .. " | " .. ConfigFlag_DataValue
			elseif ConfigFlag_DataValue == 0 then
			valueset = " Value: " ..  tostring(0 and false) .. " | " .. ConfigFlag_DataValue	
		end
		moist_notify("Config: " ..EpedCfgID ..": " .. tostring(EpedCfg) .. "\nSet: " .. valueset .."\nSuccess: " .. tostring(isSet))
	end
end)
ConfigNearbyPeds["max"] = 457
ConfigNearbyPeds["min"] = 1
ConfigNearbyPeds["value"] = 1
ConfigNearbyPedsstr = menu.add_feature("Set: : ", "value_str", ConfigNearbyParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		local valueset
		ConfigNearbyPeds["value"] = feat.value
		local AllPeds = ped.get_all_peds()
		for i=1,#AllPeds do
			if not ped.is_ped_a_player(AllPeds[i]) then	
				local EpedCfgID, EpedCfg, isSet = PedConfigFlags[feat.value +1][1], PedConfigFlags[feat.value +1][2], ped.set_ped_config_flag(AllPeds[i], PedConfigFlags[feat.value+1][1], ConfigFlag_DataValue)
				if ConfigFlag_DataValue ~= 1 and ConfigFlag_DataValue ~= 0 then
					valueset = " Value: " .. ConfigFlag_DataValue
					elseif ConfigFlag_DataValue == 1 then
					valueset = " Value: " .. 1 and tostring(true) .. " | " .. ConfigFlag_DataValue
					elseif ConfigFlag_DataValue == 0 then
					valueset = " Value: " ..  0 and tostring(false) .. " | " .. ConfigFlag_DataValue	
				end
			end
		end
		system.yield(0)
	end
end)
ConfigNearbyPedsstr:set_str_data(PedConfigLabel)
configflagid, configflagname = {}, {}

for i = 1, #PedConfigFlags do
	configflagid[i], configflagname[i] = PedConfigFlags[i][1], PedConfigFlags[i][2]
end

flagcheckall = menu.add_feature("Check all config flags", "action", PedConfigFlagsParent.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local configflags = {}
	for i = 1, #PedConfigFlags do
		configflags[tostring(PedConfigFlags[i][2])] = native.call(0x7EE53118C892B513, Selected_ped, PedConfigFlags[i][1], true):__tointeger()
	end
	for k, v in pairs(configflags) do
		moist_notify(tostring(k) .. "\n" .. tostring(v), "")
	end
end)

CheckFlag = menu.add_feature("Check flag:", "action_value_str", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local result = native.call(0x7EE53118C892B513, Selected_ped, configflagid[feat.value +1], true):__tointeger()
	if result == 1 then
		result = true
		else result = false
	end
	moist_notify(tostring(result), tostring(configflagname[feat.value +1]))
	
end)
CheckFlag:set_str_data(configflagname)

flagcheckall = menu.add_feature("Check defebse config flags", "action", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			local pped = player.get_player_ped(pid)
			for i = 1, #ids do
				configflags[ids[i]] = native.call(0x7EE53118C892B513, pped, ids[i], true):__tointeger()
			end
		end
	end
	for i = 1, #ids do
		moist_notify("Flag: " .. Ped_Config_Flags[ids[i]] .. " = " .. configflags[ids[i]], "" )
	end
end
)
flagsetall = menu.add_feature("set defebse config flags", "toggle", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local configflags, ids = {}, {128,108,109,110,424,429}
	if not feat["on"] then
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				local pped = player.get_player_ped(pid)
				for i = 1, #ids do
					ped.set_ped_config_flag(pped, ids[i], 0)
				end
			end
		end
		return HANDLER_POP
	end
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			local pped = player.get_player_ped(pid)
			for i = 1, #ids do
				ped.set_ped_config_flag(pped, ids[i], 1)
			end
		end
	end
	return HANDLER_POP
end)
flagall = menu.add_feature("Set all config flag: ", "action", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	for i = 1, #PedConfigFlags do
		local value_set = 1 and true or false
		local EpedCfgID, EpedCfg, isSet = PedConfigFlags[i][1], PedConfigFlags[i][2], ped.set_ped_config_flag(Selected_ped, PedConfigFlags[i][1], ConfigFlag_DataValue)
		if ConfigFlag_DataValue ~= 1 or ConfigFlag_DataValue ~= 0 then
			valueset = " Value: " .. ConfigFlag_DataValue
			elseif ConfigFlag_DataValue == 1 then
			valueset = " Value: " ..  tostring(1 and true) .. " | " .. ConfigFlag_DataValue
			elseif ConfigFlag_DataValue == 0 then
			valueset = " Value: " ..  tostring(0 and false) .. " | " .. ConfigFlag_DataValue	
		end
		moist_notify("Config: " ..EpedCfgID ..": " .. tostring(EpedCfg) .. "\nSet: " .. valueset .."\nSuccess: " .. tostring(isSet))
		system.yield(0)
	end
end)
taskinTstr = menu.add_feature("Set: : ", "action_value_str", PedConfigFlagsParent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local valueset
	taskinF["value"] = feat.value
	local EpedCfgID, EpedCfg, isSet = PedConfigFlags[feat.value +1][1], PedConfigFlags[feat.value +1][2], ped.set_ped_config_flag(Selected_ped, PedConfigFlags[feat.value+1][1], ConfigFlag_DataValue)
	if ConfigFlag_DataValue ~= 1 and ConfigFlag_DataValue ~= 0 then
		valueset = " Value: " .. ConfigFlag_DataValue
		elseif ConfigFlag_DataValue == 1 then
		valueset = " Value: " .. 1 and tostring(true) .. " | " .. ConfigFlag_DataValue
		elseif ConfigFlag_DataValue == 0 then
		valueset = " Value: " ..  0 and tostring(false) .. " | " .. ConfigFlag_DataValue	
	end
	moist_notify("Config: " ..EpedCfgID ..": " .. tostring(EpedCfg) .. "\nSet: " .. valueset .."\nSuccess: " .. tostring(isSet))
end)
taskinTstr:set_str_data(PedConfigLabel)
applyThrust2Parachute = menu.add_feature("Set Parachute Thrust: ", "value_f", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		ai.set_parachute_task_thrust(player.get_player_ped(player.player_id()), 0.001)
		return HANDLER_POP
	end
	ai.set_parachute_task_thrust(player.get_player_ped(player.player_id()), feat.value)
	system.yield(500)	
	return HANDLER_CONTINUE	
end)
applyThrust2Parachute["on"] = false
applyThrust2Parachute["max"] = 10.00
applyThrust2Parachute["min"] = 0.01
applyThrust2Parachute["value"] = 1.00
applyThrust2Parachute["mod"] = 0.05
RefreshPlayerInterior = menu.add_feature("Refresh Interior: ", "action_value_str", intexperiments.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pped = player.get_player_ped(feat.value)
	local offset = v3()
	local pedbool, pos = ped.get_ped_bone_coords(pped, 11816, offset)
	local ped_int = interior.get_interior_from_entity(pped)
	moist_notify("Interior from Players Ped: ".. ped_int .. "\n" .. tostring(pos), "Interior Details & Refresh")
	interior.refresh_interior(ped_int)
end)
RefreshPlayerInterior:set_str_data(Playerz)
RefreshPlayerInterior["value"] = -1
interiorcheckbytype = menu.add_feature("InteriorCheck: ", "action_value_str", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Getinterior(feat.value)
	local interior, intname, pos, id = GetPlayerinterior(feat.value)
	while interior ~= true or interior ~=  false do
		system.wait(10)
	end
	moist_notify("Found Interior = " .. tostring(interior) .. "\nInterior Name = " .. intname .. "\nPos v3(" .. pos .. ")", nil)
end)
interiorcheckbytype:set_str_data(Playerz)
vectorshit = menu.add_feature("Fwd Vector Teleport Multiplier:* ", "action_value_i", globalFeatures.moist_test.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos = v3()
	pos = player.get_player_coords(player.player_id())
	local MyPed = player.get_player_ped(player.player_id())
	local fwdvec = entity.get_entity_forward_vector(MyPed)
	pos = pos + (fwdvec * feat.value)
	entity.set_entity_coords_no_offset(MyPed, pos)
end)
vectorshit["max"] = 100
vectorshit["min"] = -100
vectorshit["value"] = 1
function Toilet_Stalker_Clone(pid)
	local pped = player.get_player_ped(pid)
	local pos, offset, rot = v3(0.0,0.0,0.0), v3(0.0,-0.21,-0.10), v3(0.0,0.0,180.0)
	local pedbool, pos = ped.get_ped_bone_coords(pped, 11816, offset)
	local i = #spawned_cunts + 1
	local clone = ped.clone_ped(pped)
	local myrot = entity.get_entity_rotation(pped)
	entity.set_entity_as_mission_entity(clone, true, true)
	spawned_cunts[i] = object.create_object(1872312775, pos, true, false)
	entity.set_entity_as_mission_entity(spawned_cunts[i], true, true)
	toilet = spawned_cunts[i]
	entity.attach_entity_to_entity(spawned_cunts[i], clone, 11816, offset, rot, true, false, true, 0, true)
	system.wait(0)
	RequestAnimDict("rcmpaparazzo_2ig_3", 10)
	system.wait(10)
	local AnimDictReguested = RequestAnimDict("rcmpaparazzo_2ig_3", 10)
	system.wait(100)
	AnimDictReguested = RequestAnimDict("rcmpaparazzo_2ig_3", 10)
	if AnimDictReguested then
		RequestAnimSet("pm_incar_notdoinanythin", 10)
		system.wait(10)
		RequestAnimSet("pm_incar_notdoinanythin", 10)
		network.request_control_of_entity(clone)
	end
	system.wait(1)
	RequestAnimSet("pm_incar_notdoinanythin", 10)
	local head = player.get_player_heading(pid)
	entity.set_entity_heading(clone, head)
	system.wait(100)
	network.request_control_of_entity(clone)
	ai.task_play_anim(clone, "rcmpaparazzo_2ig_3", "pm_incar_notdoinanythin", 1.9, 12.0, 999999999, 1, 12.9, false, false, false)
	return toilet, clone
end
local contrllabel = {"LS_AXIS_X", "LS_AXIS_Y", "RS_AXIS_X", "RS_AXIS_Y", "TRIGGER_LT", "TRIGGER_RT", "TopTrigger_LB", "TopTrigger_RB"}
local controlID = {195,196,197,198,207,208,205,206}
--INFO: Input Control Coordinate System
function Ctrl_Coords(pos, heading, distance, degrees)
	--180 fwd/bkwd 90 sideways
	heading = math.rad((heading - degrees) * -1)
	return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end
function get_ctrl_coords(pid, dist, degrees)
	local pos = player.get_player_coords(pid)
	Ctrl_POS = Ctrl_Coords(pos, player.get_player_heading(pid), dist, degrees)
	return Ctrl_POS
end
Control_POS = menu.add_feature("Control Input Position", "toggle", globalFeatures.self_ped,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] and not player.is_player_in_any_vehicle(player.player_id()) then
		local pid = player.player_id()
		local x, y, z
		local Entity
		Entity = player.get_player_ped(player.player_id())
		local camrot = cam.get_gameplay_cam_rot()
		if controls.get_control_normal(-1, controlID[1]) ~= 0.0 then
			x = tostring(controls.get_control_normal(-1, controlID[1]) or 0.01)
			if x:sub(1, 1) == "-" then
				x = x:sub(2, 10)
				elseif x:sub(1, 1) ~= "-" then
				x = tostring("-" .. x)
			end
			pos = get_ctrl_coords(pid, tonumber(x), 90)
			entity.set_entity_coords_no_offset(Entity, pos)
		end
		if controls.get_control_normal(-1, controlID[2]) ~= 0.0 then
			y = tostring(controls.get_control_normal(-1, controlID[2]) or 0.01)
			if y:sub(1, 1) == "-" then
				y = y:sub(2, 10)
				elseif y:sub(1, 1) ~= "-" then
				y = tostring("-" .. y)
			end
			pos = get_ctrl_coords(pid, tonumber(y), 180)
			entity.set_entity_coords_no_offset(Entity, pos)
		end
		if controls.get_control_normal(-1, controlID[5]) ~= 0.0 then
			z = tonumber("-" ..controls.get_control_normal(-1, controlID[5]))
			pos = player.get_player_coords(pid)
			pos.z = pos.z + z
			entity.set_entity_coords_no_offset(Entity, pos)
			elseif controls.get_control_normal(-1, controlID[6])  ~= 0.0 then	
			z = math.floor(controls.get_control_normal(-1, controlID[6]))
			pos = player.get_player_coords(pid)
			pos.z = pos.z + z
			entity.set_entity_coords_no_offset(Entity, pos)
		end
		entity.set_entity_rotation(Entity, camrot)
		return HANDLER_CONTINUE
	end
end)
Control_POS["on"] = false
OSD_Control_Meter1 = menu.add_feature("Control Input Gauge", "value_str", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local ID = feat.value + 1
		local value = controls.get_control_normal(-1, controlID[ID])
		ui.draw_rect(0.010, 0.70, 0.015, tonumber(value / 10), 0, 0, 255, 255)
		return HANDLER_CONTINUE
	end
end)
OSD_Control_Meter1:set_str_data(contrllabel)
OSD_Control_Meter2 = menu.add_feature("Control Input Gauge 2", "value_str", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local ID = feat.value + 1
		local value = controls.get_control_normal(-1, controlID[ID])
		ui.draw_rect(0.025, 0.70, 0.015, tonumber(value / 10), 0, 0, 255, 255)
		return HANDLER_CONTINUE
	end
end)
OSD_Control_Meter2:set_str_data(contrllabel)
OSD_Veh_Meter = menu.add_feature("Vehicle RPM Gauge", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if not player.is_player_in_any_vehicle(player.player_id()) then
			RpM = 0.0 barsize = 0.0
		end
		if  player.is_player_in_any_vehicle(player.player_id()) then
			local PlyVeh = player.get_player_vehicle(player.player_id())
			if PlyVeh ~= nil or PlyVeh ~= 0 then
				local RpM = vehicle.get_vehicle_rpm(PlyVeh) or 0.0001
				local Scr_x, Scr_y = graphics.get_screen_width(), graphics.get_screen_height()
				local controlvalue = controls.get_control_normal(0, 257)
				local control_v = RoundNum(controlvalue, 2)
				barsize = 0.00102 * string.format("%f1", RpM) * 300
				local vc2 = (string.format("%f1", RpM) * 100)
				barvar1 = RoundNum(vc2, 0)
				barvar01 = math.ceil(RpM * 255)
				barvar02 = (math.ceil(255 - RpM) - (math.ceil(RpM * 200) ) )
				local alPha1 = RoundNum(barvar01, 0)
				local alPha2 = RoundNum(RoundNum(255 - vc2), 0)
				va1 = ModNum(255, (1.0 / 100) - (string.format("%f1", RpM)))
				ui.draw_rect(0.003, 0.70, 0.073, 0.38, 0, 0, 0, 200)
				ui.draw_rect(0.006, 0.70, 0.065, barsize, barvar01, barvar02, 0, 255)
				ui.draw_rect(0.006, 0.70, 0.065, barsize, barvar01, barvar02, 0, barvar1)
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
OSD_Veh_Meter["on"] = false
OSD_Veh_Meter["hidden"] = false
--INFO: Speed Tracking
OSD.modvehspeed_osd = menu.add_feature("High Player Speed OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["OSD.modvehspeed_osd"] = true
	if feat["on"] then
		for i = 0, 31 do
			if tracking.playerped_speed1[i + 1] > 325 then
				OSD.mod_vehspeed_osd["on"] = true
				system.yield(13000)
				else
				OSD.mod_vehspeed_osd["on"] = false
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["OSD.modvehspeed_osd"] = false
	return HANDLER_POP
end)
OSD.modvehspeed_osd["on"] = Settings["OSD.modvehspeed_osd"]
OSD.mod_vehspeed_osd = menu.add_feature("High Player Speed OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		local pos = v2()
		pos.x = 0.001
		pos.y = .040
		local name
		for i = 0, 31 do
			if player.get_player_ped(i) ~= 0 and not Players[i].isint then
				pos.x = 0.001
				if tracking.playerped_speed1[i + 1] > 325 then
					name = player.get_player_name(i)
					ui.set_text_scale(0.18)
					ui.set_text_font(0)
					ui.set_text_color(255, 0, 0, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("HighSpeed: ", pos)
					pos.x = 0.040
					ui.set_text_scale(0.18)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text(name, pos)
					pos.x = 0.080
					ui.set_text_scale(0.18)
					ui.set_text_font(0)
					ui.set_text_color(0, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text(" <" .. tracking.playerped_speed1[i + 1] .. ">", pos)
					pos.y = pos.y + 0.040
				end
			end
		end
		system.yield(0)
	end
	return HANDLER_POP
end)
OSD.mod_vehspeed_osd["on"] = false
OSD.mod_vehspeed_osd["hidden"] = true
--INFO: v3 Self info on position rotation direction heading and cam rotation
POS_OSD = menu.add_feature("My v3 OSD Info", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local pos = v2()
		pos.x = 0.001
		pos.y = .0450
		local MyPed, MyDir, MyPos, MyRot, Myheading
		MyPed = player.get_player_ped(player.player_id())
		fwdvec = entity.get_entity_forward_vector(MyPed)
		MyRot = entity.get_entity_rotation(MyPed)
		MyPos = player.get_player_coords(player.player_id())
		Myheading = player.get_player_heading(player.player_id())
		CamROT =  cam.get_gameplay_cam_rot()
		CamPOS = cam.get_gameplay_cam_pos()
		local dir = MyRot
		dir:transformRotToDir()
		dir = dir * 4
		MyDir = MyPos + dir
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("POS: " .. tostring(MyPos), pos)
		pos.x = 0.001
		pos.y = .0650
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("ROT: " .. tostring(MyRot), pos)
		pos.x = 0.001
		pos.y = .0850
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("Heading: " .. tostring(Myheading) .."\tFwdVec: " .. tostring(fwdvec), pos)
		pos.x = 0.001
		pos.y = .1050
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("Direction: " .. tostring(MyDir), pos)
		pos.x = 0.001
		pos.y = .1250
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("CamROT: " .. tostring(CamROT), pos)
		pos.x = 0.001
		pos.y = .1450
		ui.set_text_scale(0.20)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(true)
		ui.draw_text("CamPOS: " .. tostring(CamPOS), pos)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
POS_OSD["on"] = false
POS_OSD["hidden"] = false
local vehthread, GodVehThread, Pedthread = 0, 0, 0
local AllPeds_pool, AllVehicles_pool = 0, 0
Entity_Pools = menu.add_feature("Entity Pool Checks", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		AllPeds_pool = #ped.get_all_peds()
		system.yield(0)
		AllVehicles_pool = #vehicle.get_all_vehicles()
		system.yield(0)
	end
	return HANDLER_POP
end)
Entity_Pools["on"] = false
Entity_Pools["hidden"] = true
Entity_PoolsOSD = menu.add_feature("EntityPools OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos = v2(-0.965,-0.925)
	local PRY = scriptdraw.size_pixel_to_rel_y(graphics.get_screen_height())
	local PRX = scriptdraw.size_pixel_to_rel_x(graphics.get_screen_width())
	if PRY < 2.0 then
		pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y / 4 * 3)
	end
	if PRX < 2.0 then
		pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x / 4 * 3)
	end
	while feat["on"] do
		scriptdraw.draw_text("Ped Pool: " .. tostring(AllPeds_pool) .. "\nVeh Pool: " .. tostring(AllVehicles_pool), pos, v2(), 0.80, 0xFFFFFFFF, 1 << 1, nil)
		system.wait(0)
	end
	system.wait(0)
	return HANDLER_POP
end)
Entity_PoolsOSD["on"] = Settings["EntityPools"]
Entity_PoolsOSD["hidden"] = true
Entity_Pools1 = menu.add_feature("EntityPools: ", "value_str", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos = v2(-0.954,-0.940)
	local PRY = scriptdraw.size_pixel_to_rel_y(graphics.get_screen_height())
	local PRX = scriptdraw.size_pixel_to_rel_x(graphics.get_screen_width())
	if PRY < 2.0 then
		pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y / 4 * 3)
	end
	if PRX < 2.0 then
		pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x / 4 * 3)
	end
	while feat["on"] do
		Settings["EntityPools"] = true
		Settings["AutoRemoveEntityPools"] = feat.value
		if not Entity_Pools["on"] or not Entity_PoolsOSD["on"] then
			Entity_Pools["on"] = true
			Entity_PoolsOSD["on"] = true
		end
		if feat.value == 1 then
			if AllVehicles_pool >= 100 and not Remove_Veh["on"] then
				Remove_Veh["on"] = true
				elseif AllVehicles_pool < 75 and Remove_Veh["on"] then
				Remove_Veh["on"] = false
			end
			if AllPeds_pool >= 100 and not Remove_Ped["on"] then
				Remove_Ped["on"] = true
				elseif AllPeds_pool < 75 and Remove_Ped["on"] then
				Remove_Ped["on"] = false
			end
			elseif feat.value == 2 then
			if AllVehicles_pool >= 120 and not Remove_Veh["on"] then
				Remove_Veh["on"] = true
				elseif AllVehicles_pool < 85 and Remove_Veh["on"] then
				Remove_Veh["on"] = false
			end
			if AllPeds_pool >= 120 and not Remove_Ped["on"] then
				Remove_Ped["on"] = true
				system.yield(500)
				elseif AllPeds_pool < 85 and Remove_Ped["on"] then
				Remove_Ped["on"] = false
			end
		end
		system.wait(0)
	end
	Settings["EntityPools"] = false
	Settings["AutoRemoveEntityPools"] = feat.value
	Entity_Pools["on"] = false
	Entity_PoolsOSD["on"] = false
	system.wait(0)
	return HANDLER_POP
end)
Entity_Pools1:set_str_data({"Show ONSCREEN", "Show + Remove >= 100", "Show + Remove >= 120"})
Entity_Pools1["on"] = Settings["EntityPools"]
Entity_Pools1["value"] = Settings["AutoRemoveEntityPools"]
Ped_Removal_thread =function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local AllPeds = {}
	while true do
		AllPeds = ped.get_all_peds()
		for i=1,#AllPeds do
			if not ped.is_ped_a_player(AllPeds[i]) then
				network.request_control_of_entity(AllPeds[i])
				system.yield(0)
				entity.delete_entity(AllPeds[i])
				network.request_control_of_entity(AllPeds[i])
				system.yield(0)
				entity.delete_entity(AllPeds[i])
				network.request_control_of_entity(AllPeds[i])
				system.yield(0)
				entity.delete_entity(AllPeds[i])
				network.request_control_of_entity(AllPeds[i])
				system.yield(0)
				entity.delete_entity(AllPeds[i])
				network.request_control_of_entity(AllPeds[i])
				system.yield(0)
				entity.delete_entity(AllPeds[i])
				network.request_control_of_entity(AllPeds[i])
				entity.delete_entity(AllPeds[i])
			end
		end
		if not feat["on"] then
			AllPeds = {}
			system.yield(0)
			return HANDLER_POP
		end
		system.yield(0)
	end
end
Remove_Ped = menu.add_feature("Remove Peds Thread", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		system.yield(100)
		if Pedthread ~= 0 then
			if menu.has_thread_finished(Pedthread) then
				menu.delete_thread(Pedthread)
				Pedthread = 0
			end
			else
		end
		return HANDLER_POP
	end
	if Pedthread == 0 then
		Pedthread = menu.create_thread(Ped_Removal_thread, feat)
	end
	return HANDLER_CONTINUE  
end)
Remove_Ped["on"] = false
Veh_Removal_thread =function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local AllVehicles = {}
	local vehdriver
	while true do
		AllVehicles = vehicle.get_all_vehicles()
		for i=1,#AllVehicles do
			if AllVehicles[i] ~= nil then
				if entity.is_entity_a_vehicle(AllVehicles[i]) then
					vehdriver = vehicle.get_ped_in_vehicle_seat(AllVehicles[i], -1)
					if not ped.is_ped_a_player(vehdriver) or not decorator.decor_exists_on(AllVehicles[i], "Player_Vehicle") then
						network.request_control_of_entity(AllVehicles[i])
						system.yield(0)
						entity.delete_entity(AllVehicles[i])
						network.request_control_of_entity(AllVehicles[i])
						system.yield(0)
						entity.delete_entity(AllVehicles[i])
						network.request_control_of_entity(AllVehicles[i])
						system.yield(0)
						entity.delete_entity(AllVehicles[i])
						network.request_control_of_entity(AllVehicles[i])
						system.yield(0)
						entity.delete_entity(AllVehicles[i])
						network.request_control_of_entity(AllVehicles[i])
					end
					system.yield(0)
					entity.delete_entity(AllVehicles[i])
				end
			end
			system.yield(0)
		end
		if not feat["on"] then
			AllVehicles = {}
			system.yield(0)
			return HANDLER_POP
		end
		system.yield(0)
	end
end
Remove_Veh = menu.add_feature("Remove Vehicles Thread", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		system.yield(100)
		if vehthread ~= 0 then
			if menu.has_thread_finished(vehthread) then
				menu.delete_thread(vehthread)
				vehthread = 0
			end
			else
		end
		return HANDLER_POP
	end
	if vehthread == 0 then
		vehthread = menu.create_thread(Veh_Removal_thread, feat)
	end
	return HANDLER_CONTINUE  
end)
Remove_Veh["on"] = false
GodVeh_Removal_thread =function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local AllVehicles = {}
	while true do
		-- if not feat["on"] then
		-- return HANDLER_POP
		-- end
		AllVehicles = vehicle.get_all_vehicles()
		for i=1,#AllVehicles do
			if AllVehicles[i] ~= nil then
				if entity.is_entity_a_vehicle(AllVehicles[i]) and entity.get_entity_god_mode(AllVehicles[i]) == true then
					network.request_control_of_entity(AllVehicles[i])
					system.yield(0)
					entity.delete_entity(AllVehicles[i])
					network.request_control_of_entity(AllVehicles[i])
					system.yield(0)
					entity.delete_entity(AllVehicles[i])
					network.request_control_of_entity(AllVehicles[i])
					system.yield(0)
					entity.delete_entity(AllVehicles[i])
					network.request_control_of_entity(AllVehicles[i])
					system.yield(0)
					entity.delete_entity(AllVehicles[i])
					network.request_control_of_entity(AllVehicles[i])
				end
				system.yield(0)
				entity.delete_entity(AllVehicles[i])
			end
			system.yield(0)
		end
		if not feat["on"] then
			AllVehicles = {}
			system.yield(0)
			return HANDLER_POP
		end
		system.yield(0)
	end
	system.yield(0)
end
GodRemove_Veh = menu.add_feature("Remove God Vehicles Thread", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		system.yield(100)
		if GodVehThread ~= 0 then
			if menu.has_thread_finished(GodVehThread) then
				menu.delete_thread(GodVehThread)
				GodVehThread = 0
			end
			else
		end
		return HANDLER_POP
	end
	if GodVehThread == 0 then
		GodVehThread = menu.create_thread(GodVeh_Removal_thread, feat)
	end
	return HANDLER_CONTINUE  
end)
GodRemove_Veh["on"] = false
function TakeHost(pid)
	Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
end
local PCR, PCG, PCB, PCA
local PCR1, PCG1, PCB1, PCA1 = 255, 255, 255, 255
local PCR2, PCG2, PCB2, PCA2 = 0, 0, 0, 255
Pulse_RGB_R, Pulse_RGB_G, Pulse_RGB_B = 255, 255, 255
playerpulse = menu.add_feature("Pulse PlayerBar GodNames", "value_i", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		Pulse_RGB_R = math.random(0, 255)
		--system.wait(feat.value)
		Pulse_RGB_G = math.random(0, 170)
		--system.wait(feat.value)
		Pulse_RGB_B = 255 - Pulse_RGB_R
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
	Pulse_RGB_R, Pulse_RGB_G, Pulse_RGB_B = 255, 255, 255
	return HANDLER_POP
end)
playerpulse["on"] = false
playerpulse["max"] = 500
playerpulse["min"] = 1
playerpulse["value"] = 15
notifysent = {}
--TODO: **********  PLAYER BAR ***************
OSD.Player_bar = menu.add_feature("Player Bar OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["OSD.Player_bar"] = true
	while feat["on"] do
		ui.draw_rect(0.001, 0.001, 2.5, 0.085, 0, 0, 0, 210)
		local pos = v2()
		pos.x = 0.0001
		pos.y = 0.0001
		for pid = 0, 31 do
			local pped = player.get_player_ped(pid)
			local name, scid = SessionPlayers[pid].Name, SessionPlayers[pid].Scid
			if scid ~= -1 and name ~= nil then
				local PlayerName1 = SessionPlayers[pid].Name
				local PlayerName = SessionPlayers[pid].Name
				PCR, PCG, PCB, PCA = 255, 255, 255, 255
				if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Players[pid].isint == true then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 185
						else
						PCR, PCG, PCB, PCA = 255, 0, 255, 185
					end
				end
				if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PlayerName = "~o~~h~" .. tostring(PlayerName)
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 255
						else
						PlayerName = "~r~~h~" .. tostring(PlayerName)
						PCR, PCG, PCB, PCA = 255, 0, 255, 200
					end
				end
				if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Players[pid].isint == true then
					PlayerName = "~o~" .. tostring(PlayerName)
				end
				if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PlayerName = "~o~~h~" .. tostring(PlayerName)
						else
						PlayerName = "~o~" .. tostring(PlayerName)
					end
				end
				if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Players[pid].isint == true then
					PlayerName = "~r~" .. tostring(PlayerName)
				end
				if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PlayerName = "~r~~h~" .. tostring(PlayerName)
						else
						PlayerName = "~r~" .. tostring(PlayerName)
					end
				end
				if not NewDLC() then
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == true and player.is_player_god(pid) then
						if  Players[pid].pulse then
							PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 200
							else
							PCR, PCG, PCB, PCA = 255, 0, 0, 200
						end
					end
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == false and player.is_player_god(pid) then
						if  Players[pid].pulse then
							PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 255
							else
							PCR, PCG, PCB, PCA = 255, 0, 0, 255
						end
					end
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == false then
						if  Players[pid].pulse then
							PCR, PCG, PCB, PCA = 0, Pulse_RGB_R, 0, 255
							else
							PCR, PCG, PCB, PCA = 255, 255, 255, 255
						end
					end
					if Players[pid].isPassive then
						PCA = 150
						elseif not Players[pid].isPassive then
						PCA = 255
					end
				end
				if player.is_player_friend(pid) then
					PCR, PCG, PCB, PCA = 255, 255, 0, 255
				end
				if entity.is_entity_dead(pped) then
					PCR, PCG, PCB, PCA = 100, 50, 50, 200
					elseif not entity.is_entity_dead(pped) then
					PCA = 255
				end
				if pos.x >= 0.92 and pos.y < 0.001 then
					pos.y = pos.y + 0.015
					pos.x = 0.0001
					elseif pos.x >= 0.92 and pos.y >= 0.015 then
					pos.y = pos.y + 0.015
					pos.x = 0.0001
				end
				ui.set_text_scale(0.172)
				ui.set_text_color(0,0,0,255)
				ui.set_text_font(0)
				ui.set_text_centre(false)
				ui.set_text_outline(true)
				ui.draw_text(tostring(PlayerName1) .. " ", pos)
				ui.set_text_scale(0.170)
				ui.set_text_color(PCR, PCG, PCB, PCA)
				ui.set_text_font(0)
				ui.set_text_centre(false)
				ui.set_text_outline(true)
				ui.draw_text(tostring(PlayerName) .. " ", pos)
				pos.x = pos.x + 0.085
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["OSD.Player_bar"] = false
	return HANDLER_POP
end)
OSD.Player_bar["on"] = Settings["OSD.Player_bar"]
OSD.Player_bar2 = menu.add_feature("Player Bar OSD Layout Test", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["OSD.Player_bar"] = true
	local pped, name, scid, PlayerName1, PlayerName
	while feat["on"] do
		ui.draw_rect(0.001, 0.001, 2.5, 0.085, 0, 0, 0, 210)
		local pos = v2()
		pos.x = 0.0001
		pos.y = 0.0001
		for pid = 0, 31 do
			pped = player.get_player_ped(pid)
			name, scid = SessionPlayers[pid].Name, SessionPlayers[pid].Scid
			--if scid ~= -1 and name ~= nil then
			PlayerName1 = SessionPlayers[pid].Name 
			if PlayerName1 == "nil" then
				PlayerName1 = "~h~HHHHHHHHHHHHHHHH"
			end
			PlayerName = SessionPlayers[pid].Name
			if PlayerName == "nil" then
				PlayerName = "~h~HHHHHHHHHHHHHHHH"
			end
			PCR, PCG, PCB, PCA = 255, 255, 255, 255
			if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Players[pid].isint == true then
				if  Players[pid].pulse then
					PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 185
					else
					PCR, PCG, PCB, PCA = 255, 0, 255, 185
				end
			end
			if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Players[pid].isint == false then
				if  Players[pid].pulse then
					PlayerName = "~o~~h~" .. PlayerName
					PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 255
					else
					PlayerName = "~r~~h~" .. PlayerName
					PCR, PCG, PCB, PCA = 255, 0, 255, 200
				end
			end
			if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Players[pid].isint == true then
				PlayerName = "~o~" .. PlayerName
			end
			if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Players[pid].isint == false then
				if  Players[pid].pulse then
					PlayerName = "~o~~h~" .. PlayerName
					else
					PlayerName = "~o~" .. PlayerName
				end
			end
			if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Players[pid].isint == true then
				PlayerName = "~r~" .. PlayerName
			end
			if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Players[pid].isint == false then
				if  Players[pid].pulse then
					PlayerName = "~r~~h~" .. PlayerName
					else
					PlayerName = "~r~" .. PlayerName
				end
			end
			if not NewDLC() then
				if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == true and player.is_player_god(pid) then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 200
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 200
					end
				end
				if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == false and player.is_player_god(pid) then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 255
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 255
					end
				end
				if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = 0, Pulse_RGB_R, 0, 255
						else
						PCR, PCG, PCB, PCA = 255, 255, 255, 255
					end
				end
				if Players[pid].isPassive then
					PCA = 150
					elseif not Players[pid].isPassive then
					PCA = 255
				end
			end
			if player.is_player_friend(pid) then
				PCR, PCG, PCB, PCA = 255, 255, 0, 255
			end
			if entity.is_entity_dead(pped) then
				PCR, PCG, PCB, PCA = 100, 50, 50, 200
				elseif not entity.is_entity_dead(pped) then
				PCA = 255
			end
			if pos.x >= 0.92 and pos.y < 0.001 then
				pos.y = pos.y + 0.015
				pos.x = 0.0001
				elseif pos.x >= 0.92 and pos.y >= 0.015 then
				pos.y = pos.y + 0.015
				pos.x = 0.0001
			end
			ui.set_text_scale(0.172)
			ui.set_text_color(0,0,0,255)
			ui.set_text_font(0)
			ui.set_text_centre(false)
			ui.set_text_outline(true)
			ui.draw_text(PlayerName1 .. " ", pos)
			ui.set_text_scale(0.170)
			ui.set_text_color(PCR, PCG, PCB, PCA)
			ui.set_text_font(0)
			ui.set_text_centre(false)
			ui.set_text_outline(true)
			ui.draw_text(PlayerName .. " ", pos)
			pos.x = pos.x + 0.085
		end
		--end
		return HANDLER_CONTINUE
	end
	Settings["OSD.Player_bar"] = false
	return HANDLER_POP
end)
OSD.Player_bar2["on"] = false
OSD.Player_bar2["hidden"] = true
--INFO: -------- Moist Tools
function update_osd_text(text, append)
	if append then
		local screentext = ScreenText .."\n"
		ScreenText = string.format(screentext .." : " ..text)
	end
	if not append then
		ScreenText = " "
		ScreenText = text
	end
end
function updateosd_text(text, append)
	if append then
		local Screen_Text = ScreenText .."\n"
		Screen_Text = string.format(Screen_Text .." : " ..text)
	end
	if not append then
		Screen_Text = " "
		Screen_Text = text
	end
end
function update_osd_text2(Text1, Text2, Text3, Text4)
	text1 = Text1
	text2 = Text2
	text3 = Text3
	text6 = Text4
end
Screen_TeXt, Screen_Text = "", ""
OSD.date_time_OSD = menu.add_feature("Date & Time OSD", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["osd_date_time"] = true
	while feat["on"] do
		ui.draw_rect(.92155, 0.0345, 0.1375, 0.01555, 0, 0, 0, 255)
		local pos = v2()
		local d = os.date()
		local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dt = os.date("%d/%m/%Y")
		pos.x = .855
		pos.y =  0.0272
		local d = os.date()
		local dtime = os.date("%a %d %b %I:%M:%S: %p")
		-- local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dt = os.date("%d/%m/%Y")
		local osd_Cur_Time = "~h~" .. (string.format(dtime))
		ui.set_text_scale(0.175)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text(osd_Cur_Time, pos)
		pos.x = .855
		pos.y =  0.0265
		local d = os.date()
		--    local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dtime = os.date("%a %d %b %I:%M:%S: %p")
		local osd_Cur_Time = "~h~" .. (string.format(dtime))
		ui.set_text_scale(0.178)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text(osd_Cur_Time, pos)
		return HANDLER_CONTINUE
	end
	Settings["osd_date_time"] = false
	return HANDLER_POP
end)
OSD.date_time_OSD["on"] = Settings["osd_date_time"]
OSD.osd_My_speed1 = menu.add_feature("Show My Speed in Kmph", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["osd_My_speed1"] = true
	while feat["on"] do
		local pos = v2()
		pos.x = .9255
		pos.y =  0.0272
		local ent, estmax, vehmax
		vehmax = RoundNum(0.00, 1)
		local ent1 = player.get_player_ped(player.player_id())
		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
		local speed = entity.get_entity_speed(ent)
		local speedcalc = speed * 3.6 --kmph
		local speedcalcm =  speed * 2.236936 --mph
		myspeed1 = RoundNum(speedcalc, 1)
		myspeed2 = math.ceil(speedcalcm)
		if player.is_player_in_any_vehicle(player.player_id()) then
			estmax = vehicle.get_vehicle_estimated_max_speed(player.get_player_vehicle(player.player_id()))
			vehmax = RoundNum(estmax * 2.236936, 2)
		end
		ui.set_text_scale(0.175)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text("~h~" .. myspeed1   .. " / " ..  vehmax .." Kmh" , pos)
		pos.x = .9245
		pos.y =  0.0265
		ui.set_text_scale(0.178)
		ui.set_text_font(0)
		ui.set_text_color(100, 100, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text("~h~" .. myspeed1   .. " / " ..  vehmax .." Kmh" , pos)
		return HANDLER_CONTINUE
	end
	Settings["osd_My_speed1"] = false
	return HANDLER_POP
end)
OSD.osd_My_speed1["on"] = Settings["osd_My_speed1"]
--INFO: MyVeh OSD!
OSD.osd_My_speed2 = menu.add_feature("Show My Speed in MPH", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["osd_My_speed2"] = true
	while feat["on"] do
		local pos = v2()
		pos.x = .9255
		pos.y =  0.0272
		local ent, estmax, vehmax
		vehmax = RoundNum(0.00, 1)
		local ent1 = player.get_player_ped(player.player_id())
		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
		local speed = entity.get_entity_speed(ent)
		local speedcalc = speed * 3.6 --kmph
		local speedcalcm =  speed * 2.236936 --mph
		myspeed1 = math.ceil(speedcalc)
		myspeed2 = RoundNum(speedcalcm, 1)
		if player.is_player_in_any_vehicle(player.player_id()) then
			estmax = vehicle.get_vehicle_estimated_max_speed(player.get_player_vehicle(player.player_id()))
			vehmax = RoundNum(estmax * 2.236936, 1)
		end		
		ui.set_text_scale(0.175)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)	
		ui.draw_text("~h~" .. myspeed2 .. " / " ..  vehmax .." Mph", pos)
		pos.x = .9245
		pos.y =  0.0265
		ui.set_text_scale(0.178)
		ui.set_text_font(0)
		ui.set_text_color(100, 100, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text("~h~" .. myspeed2 .. " / " ..  vehmax .." Mph", pos)
		return HANDLER_CONTINUE
	end
	Settings["osd_My_speed2"] = false
	return HANDLER_POP
end)
OSD.osd_My_speed2["on"] = Settings["osd_My_speed2"]
--INFO: Player Ped Weapons
function getwephashes()
	weap =  weapon.get_all_weapon_hashes()
	for i = 1, #weap do
		weaponz[i] = {weap[i], weapon.get_weapon_name(weap[i])}
	end
	weaponz[#weaponz + 1] = {1305664598, "Smoke GrenadeLauncher"}
	weaponz[#weaponz + 1] = {4222310262, "Parachute"}
end
getwephashes()
function give_weapon()
	for i = 1, #weaponz do
		local wid = weaponz[i][1]
		wid = menu.add_feature("Give: " .. weaponz[i][2], "action", globalFeatures.self_wep,function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			pped = player.get_player_ped(player.player_id())
			weapon.give_delayed_weapon_to_ped(player.get_player_ped(player.player_id()), weaponz[i][1], 1, 1)
			weapon.set_ped_ammo(player.get_player_ped(player.player_id()), weaponz[i][1], 1000000)
			weapon.give_delayed_weapon_to_ped(pped, weaponz[i][1], 1, 1)
			weapon.set_ped_ammo(pped, weaponz[i][1], 1000000)
		end)
	end
end
give_weapon()
--INFO: RPG
local wephash, PedWeapon, wepammo	
function GiveWeaponTo(pid, hash, now, ammo_count)
	local ammo_count = ammo_count or 2000
	local pped = player.get_player_ped(pid)
	if not weapon.has_ped_got_weapon(pped, hash) then
		weapon.give_delayed_weapon_to_ped(pped, hash, 0, now)
		weapon.set_ped_ammo(pped, hash, ammo_count)
		elseif weapon.has_ped_got_weapon(pped, hash) then
		weapon.set_ped_ammo(pped, hash, ammo_count)
	end
end
function RemoveWeaponFrom(pid, hash)
	local pped = player.get_player_ped(pid)
	if weapon.has_ped_got_weapon(pped, hash) then
		weapon.remove_weapon_from_ped(pped, hash)
	end
end
function GiveAmmo(pid, hash, ByType, amount)
	local pped = player.get_player_ped(pid)
	amount = amount or 1000000
	if ByType == true then
		weapon.set_ped_ammo_by_type(pped, hash, amount)
		elseif ByType == false then
		weapon.set_ped_ammo(pped, hash, amount)
	end
end
--INFO: Self Teleport using Interior locations LUA
local teleto = {}
function interiornames()
	for i = 1, #onlineinteriors do
		teleto[#teleto+1] = onlineinteriors[i][1]:sub(1, 13)
	end
end
interiornames()
TeleSelf = menu.add_feature("Teleport: ", "action_value_str", globalFeatures.self_options,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pos = v3()
	pos = onlineinteriors[feat.value+1][2]
	--heading = 136.27784729004
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	--entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
	return HANDLER_POP
end)
TeleSelf:set_str_data(teleto)
--INFO: ------- Custom Crosshair -------
targetdot = menu.add_feature("Target Dot 1", "toggle", globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local pos = v2()
		pos.x = .500
		pos.y = .450
		--x: 1391	y: 581	w: 21	h: 21
		ui.set_text_scale(1.0)
		ui.set_text_font(0)
		ui.set_text_centre(1)
		ui.set_text_outline(1)
		ui.draw_text("°", pos)
	end
	return HANDLER_CONTINUE
end)
targetdot["on"] = false
targetdot1 = menu.add_feature("Target Dot 2", "toggle",  globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		Settings["Weapon_TargetDot"] = false
		return HANDLER_POP
	end
	Settings["Weapon_TargetDot"] = true
	local pos = v2()
	pos.x = 0.49984991550446
	pos.y = 0.48830940833092
	ui.set_text_scale(0.450)
	ui.set_text_font(0)
	ui.set_text_centre(1)
	ui.set_text_outline(1)
	ui.set_text_color(0, 0, 0, 165)
	pos.x = 0.49984991550446
	pos.y = 0.48710120433032
	ui.set_text_scale(0.52)
	ui.set_text_font(0)
	ui.set_text_centre(1)
	ui.set_text_outline(1)
	ui.set_text_color(100, 100, 100, 180)
	local txtstr = "°"
	pos.y = 0.48343940833092
	ui.set_text_scale(0.450)
	ui.set_text_font(0)
	ui.set_text_centre(1)
	ui.set_text_outline(1)
	ui.set_text_color(255, 255, 255, 165)
	ui.draw_text("[  ]", pos)
	pos.x = 0.49984991550446
	pos.y = 0.48780940833092
	ui.set_text_scale(0.450)
	ui.set_text_font(0)
	ui.set_text_centre(0)
	ui.set_text_outline(1)
	ui.set_text_color(255, 255, 255, 165)
	ui.draw_text("°", pos)
	return HANDLER_CONTINUE
end)
targetdot1["on"] = Settings["Weapon_TargetDot"] 
test1 = menu.add_feature("screentest y", "value_f",  globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local p = 0.01
		local pos = v2()
		local offset = v2(0.10,0.0)
		pos.x = 0.00
		pos.y = feat.value
		for i = 0, 1000 do
			if pos.x ~= 1.0 then
				pos.x = pos.x + p
				ui.set_text_scale(0.50)
				ui.set_text_font(0)
				ui.set_text_centre(0)
				ui.set_text_outline(1)
				ui.draw_text(".", pos)
				ui.set_text_scale(0.35)
				ui.draw_text(i, pos)
			end
		end
		return HANDLER_CONTINUE
	end
end)
test1["on"] = false
test1["hidden"] = false
test1["max"] = 1.0
test1["min"] = 0.0
test1["value"] = 0.01
test1["mod"] = 0.01
local test2 = menu.add_feature("screentest x", "value_f",  globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local p = 0.015
		local pos = v2()
		local offset = v2(0.0,0.10)
		pos.x = feat.value
		pos.y = -0.001
		for i = 0, 1000 do
			if pos.y ~= 1.0 then
				pos.y = pos.y + p
				ui.set_text_scale(0.30)
				ui.set_text_font(0)
				ui.set_text_centre(0)
				ui.set_text_outline(1)
				ui.draw_text("." .. i, pos)
			end
		end
		return HANDLER_CONTINUE
	end
end)
test2["on"] = false
test2["hidden"] = false
test2["max"] = 1.0
test2["min"] = 0.0
test2["value"] = 0.01
test2["mod"] = 0.01
targetdot2 = menu.add_feature("Target Dot 3", "toggle",  globalFeatures.moist_UI_OSD,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat.on
		then
		local pos = v2()
		pos.x = .49991
		pos.y = .4798
		ui.set_text_scale(0.50)
		ui.set_text_font(0)
		ui.set_text_centre(0)
		ui.set_text_outline(1)
		ui.set_text_color(255, 255, 255, 255)
		ui.draw_text("+", pos)
	end
	return HANDLER_CONTINUE
end)
targetdot2["on"] = false
RPG_HOTFIRE = menu.add_feature("Rapid RPG Switch", "value_str", globalFeatures.self_options,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["RPG_HOTFIRE"] = true
	local pped = player.get_player_ped(player.player_id())
	if feat["on"] then
		if player.is_player_in_any_vehicle(player.player_id()) ~= true or ped.is_ped_in_any_vehicle(pped) ~= true then
			local status, err = pcall(GiveWeaponTo, player.player_id(), 2982836145, false)
			if not status then
				--   --print(tostring(status) .. " Function Error " .. tostring(err))
				moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
			end
			local status, err = pcall(GiveWeaponTo, player.player_id(), 1752584910, false)
			if not status then
				--   --print(tostring(status) .. " Function Error " .. tostring(err))
				moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
			end
			if feat.value == 0 then
				if ped.is_ped_shooting(pped) and ped.get_current_ped_weapon(pped) == 2982836145 then
					local status, err = pcall(RemoveWeaponFrom, player.player_id(), 2982836145)
					if not status then
						--     --print(tostring(status) .. " Function Error " .. tostring(err))
						moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
					end
					local status, err = pcall(GiveWeaponTo, player.player_id(), 2982836145, true)
					if not status then
						--    --print(tostring(status) .. " Function Error " .. tostring(err))
						moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
					end
					return HANDLER_CONTINUE
				end
				elseif feat.value == 1 then
				if ped.is_ped_shooting(pped) and ped.get_current_ped_weapon(pped) == 1752584910 then
					local status, err = pcall(RemoveWeaponFrom, player.player_id(), 1752584910)
					if not status then
						--    --print(tostring(status) .. " Function Error " .. tostring(err))
						moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
					end
					local status, err = pcall(GiveWeaponTo, player.player_id(), 1752584910, true)
					if not status then
						--    --print(tostring(status) .. " Function Error " .. tostring(err))
						moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
					end
					return HANDLER_CONTINUE
				end
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["RPG_HOTFIRE"] = false
	return HANDLER_POP
end)
RPG_HOTFIRE:set_str_data({"Standard RPG", "Special RPG"})
RPG_HOTFIRE["on"] = Settings["RPG_HOTFIRE"]
WeaponFastSwitch = menu.add_feature("Loop Ammo Refill", "value_i", globalFeatures.self_options,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local pped, PedWeapon
	pped = player.get_player_ped(player.player_id())
	if feat["on"] then
		if not entity.is_entity_dead(pped) then
			if player.is_player_in_any_vehicle(player.player_id()) ~= true or ped.is_ped_in_any_vehicle(pped) ~= true then
				PedWeapon = ped.get_current_ped_weapon(pped)
			end
		end
		if PedWeapon ~= nil then
			local status, err = pcall(GiveAmmo, player.player_id(), PedWeapon, false, feat.value)
			if not status then
				--print(tostring(status) .. " Function Error " .. tostring(err))
				moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
WeaponFastSwitch["on"] = false
WeaponFastSwitch["max"] = 1000000
WeaponFastSwitch["min"] = -1
WeaponFastSwitch["value"] = 1
WeaponFastSwitch["mod"] = 5
WeaponFastSwitch = menu.add_feature("Rapid Switch Current Weapon", "toggle", globalFeatures.self_options,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Settings["WeaponFastSwitch"] = true
	local pped = player.get_player_ped(player.player_id())
	if feat["on"] then
		if not entity.is_entity_dead(pped) then
			if player.is_player_in_any_vehicle(player.player_id()) ~= true or ped.is_ped_in_any_vehicle(pped) ~= true then
				PedWeapon = ped.get_current_ped_weapon(pped)
				wepammo = weapon.get_ped_ammo_type_from_weapon(pped, PedWeapon)
				if weapon.get_weapon_weapon_type(PedWeapon) ~= 3189615009 then
					if ped.is_ped_shooting(pped) and not entity.is_entity_dead(pped) then
						local status, err = pcall(RemoveWeaponFrom, player.player_id(), PedWeapon)
						if not status then
							--   --print(tostring(status) .. " Function Error " .. tostring(err))
							moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
						end
						if entity.is_entity_dead(pped) then
							while entity.is_entity_dead(pped) do
								system.wait(100)
								return HANDLER_CONTINUE
							end
						end
						local status, err = pcall(GiveWeaponTo, player.player_id(), PedWeapon, true)
						if not status then
							--  --print(tostring(status) .. " Function Error " .. tostring(err))
							moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
						end
						local status, err = pcall(GiveAmmo, player.player_id(), wepammo, true)
						if not status then
							--  --print(tostring(status) .. " Function Error " .. tostring(err))
							moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
						end
					end
				end
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["WeaponFastSwitch"] = false
	return HANDLER_POP
end)
WeaponFastSwitch["on"] = Settings["WeaponFastSwitch"]
Mark_WeapImpPOS = menu.add_feature("Mark Weapon Impact POS", "toggle", globalFeatures.self_combat_Ped,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		pped = player.get_player_ped(player.player_id())
		local success, pos = ped.get_ped_last_weapon_impact(pped, v3())
		if success then
			if pos.x and pos.y then
				local coord = v2()
				coord.x = pos.x
				coord.y = pos.y
				ui.set_new_waypoint(coord)
			end
		end
	end
	--system.yield(0)
	return HANDLER_CONTINUE
end)
Mark_WeapImpPOS["on"] = false
--INFO: Markers
RGB_A_A = 255
RGB_A_R = 255
RGB_A_G = 255
RGB_A_B = 255
RGB = {255,0}
changeR = 255
changeG = 0
changeB = 0
changeA = 255
RGBA_R = 255
RGBA_G = 255
RGBA_B = 255
RGBA_A = 255
changRGB = menu.add_feature("fading red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		RGBA_G = RGB[1]
		RGBA_B = RGB[1]
		system.wait(100)
		RGBA_A = 180
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 25
		system.wait(25)
		RGBA_A = 0
		RGBA_G = RGB[2]
		RGBA_B = RGB[2]
		system.wait(25)
		RGBA_A = 25
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 180
		system.wait(25)
		RGBA_A = 255
		system.wait(100)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
changRGB["on"] = false
chang_RGBA = menu.add_feature("flash red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		RGBA_G = RGB[1]
		RGBA_B = RGB[1]
		system.wait(500)
		RGBA_G = RGB[2]
		RGBA_B = RGB[2]
		system.wait(500)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
chang_RGBA["on"] = false
changRGBA = menu.add_feature("multi fading colors Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		changeR = RGB[1]
		changeG = RGB[2]
		changeB = RGB[2]
		system.wait(100)
		changeA = 180
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 25
		system.wait(25)
		changeA = 0
		changeR = RGB[1]
		changeG = RGB[1]
		changeB = RGB[2]
		system.wait(1)
		changeA = 25
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 180
		system.wait(25)
		changeA = 255
		system.wait(100)
		changeA = 180
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 25
		system.wait(25)
		changeA = 0
		changeR = RGB[2]
		changeG = RGB[1]
		changeB = RGB[2]
		system.wait(1)
		changeA = 25
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 180
		system.wait(25)
		changeA = 255
		system.wait(100)
		changeA = 180
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 25
		system.wait(25)
		changeA = 0
		changeR = RGB[2]
		changeG = RGB[2]
		changeB = RGB[1]
		system.wait(1)
		changeA = 25
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 180
		system.wait(25)
		changeA = 255
		system.wait(100)
		changeA = 180
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 25
		system.wait(25)
		changeA = 0
		changeR = RGB[1]
		changeG = RGB[1]
		changeB = RGB[1]
		system.wait(1)
		changeA = 25
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 180
		system.wait(25)
		changeA = 255
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
changRGBA["on"] = false
changeRGB = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		changeG = RGB[1]
		changeB = RGB[1]
		system.wait(100)
		changeA = 180
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 25
		system.wait(25)
		changeA = 0
		changeG = RGB[2]
		changeB = RGB[2]
		system.wait(25)
		changeA = 25
		system.wait(75)
		changeA = 100
		system.wait(75)
		changeA = 180
		system.wait(25)
		changeA = 255
		system.wait(100)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
changeRGB["on"] = false
change_RGBA = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		changeG = RGB[1]
		changeB = RGB[1]
		system.wait(500)
		changeG = RGB[2]
		changeB = RGB[2]
		system.wait(500)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
change_RGBA["on"] = false
changeRGBA = menu.add_feature("Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		RGBA_R = RGB[1]
		RGBA_G = RGB[2]
		RGBA_B = RGB[2]
		system.wait(100)
		RGBA_A = 180
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 25
		system.wait(25)
		RGBA_A = 0
		RGBA_R = RGB[1]
		RGBA_G = RGB[1]
		RGBA_B = RGB[2]
		system.wait(1)
		RGBA_A = 25
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 180
		system.wait(25)
		RGBA_A = 255
		system.wait(100)
		RGBA_A = 180
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 25
		system.wait(25)
		RGBA_A = 0
		RGBA_R = RGB[2]
		RGBA_G = RGB[1]
		RGBA_B = RGB[2]
		system.wait(1)
		RGBA_A = 25
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 180
		system.wait(25)
		RGBA_A = 255
		system.wait(100)
		RGBA_A = 180
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 25
		system.wait(25)
		RGBA_A = 0
		RGBA_R = RGB[2]
		RGBA_G = RGB[2]
		RGBA_B = RGB[1]
		system.wait(1)
		RGBA_A = 25
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 180
		system.wait(25)
		RGBA_A = 255
		system.wait(100)
		RGBA_A = 180
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 25
		system.wait(25)
		RGBA_A = 0
		RGBA_R = RGB[1]
		RGBA_G = RGB[1]
		RGBA_B = RGB[1]
		system.wait(1)
		RGBA_A = 25
		system.wait(75)
		RGBA_A = 100
		system.wait(75)
		RGBA_A = 180
		system.wait(25)
		RGBA_A = 255
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
changeRGBA["on"] = false
rgb_rand = menu.add_feature("rand rgb 3 on (delay)", "value_i", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		RGBA_G = math.random(0, 255)
		system.wait(feat.value)
		RGBA_R = math.random(0, 255)
		system.wait(feat.value)
		RGBA_B = math.random(0, 255)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
end)
rgb_rand["on"] = false
rgb_rand["max"] = 500
rgb_rand["min"] = 1
rgb_rand["value"] = 5
rgb_rand1 = menu.add_feature("rand rgb 4 on (delay)", "value_i", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		RGB_A_A = math.random(0, 255)
		system.wait(feat.value / 2)
		RGB_A_G = math.random(0, 255)
		system.wait(feat.value)
		RGB_A_R = math.random(0, 255)
		system.wait(feat.value)
		RGB_A_B = math.random(0, 255)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
end)
rgb_rand1["on"] = false
rgb_rand1["max"] = 500
rgb_rand1["min"] = 1
rgb_rand1["value"] = 15
marker1_rgbd = menu.add_feature("rgb 4 on", "toggle", globalFeatures.moistMkropt,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		local RGB_A = {255,0}
		RGB_A_R = RGB_A[1]
		RGB_A_G = RGB_A[2]
		RGB_A_B = RGB_A[2]
		system.wait(100)
		RGB_A_A = 180
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 25
		system.wait(25)
		RGB_A_A = 0
		RGB_A_R = RGB_A[1]
		RGB_A_G = RGB_A[1]
		RGB_A_B = RGB_A[2]
		system.wait(1)
		RGB_A_A = 25
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 180
		system.wait(25)
		RGB_A_A = 255
		system.wait(100)
		RGB_A_A = 180
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 25
		system.wait(25)
		RGB_A_A = 0
		RGB_A_R = RGB_A[2]
		RGB_A_G = RGB_A[1]
		RGB_A_B = RGB_A[2]
		system.wait(1)
		RGB_A_A = 25
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 180
		system.wait(25)
		RGB_A_A = 255
		system.wait(100)
		RGB_A_A = 180
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 25
		system.wait(25)
		RGB_A_A = 0
		RGB_A_R = RGB_A[2]
		RGB_A_G = RGB_A[2]
		RGB_A_B = RGB_A[1]
		system.wait(1)
		RGB_A_A = 25
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 180
		system.wait(25)
		RGB_A_A = 255
		system.wait(100)
		RGB_A_A = 180
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 25
		system.wait(25)
		RGB_A_A = 0
		RGB_A_R = RGB_A[1]
		RGB_A_G = RGB_A[1]
		RGB_A_B = RGB_A[1]
		system.wait(1)
		RGB_A_A = 25
		system.wait(75)
		RGB_A_A = 100
		system.wait(75)
		RGB_A_A = 180
		system.wait(25)
		RGB_A_A = 255
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
marker1_rgbd["on"] = false
--INFO: ***********ONLINE PLAYER Ped Spawn Options ******
function OnlineSpawnOptions()
	Attacker_Model = "cs_lestercrest_2"
	AnimalAttacker = false
	Attacker_Weapon = "weapon_unarmed"
	LoadWeapList = Weapon_Lists_type.Melee
	type_value = 1
	Spawn_As = {"Send via Parachute", "Spawn & Attack", "Spawn as Support Ped", "Spawn Vehicle Attacker", "Spawn Support Vehicle"}
	local Vehicles = {}
	local PedVehModSpawn, PedVehHash
	Modal_is_set = false
	Ped_is_set = false
	Weap_type_is_set = false
	Weapon_is_set = false
	Amount_is_set = false
	vehicle_is_set = false
	function AttackPed_Vehicle(hash, pid, modal, attack)
		local y, i
		local isveh_plane = false
		local isveh_heli = false
		local Player_Group = player.get_player_group(pid)
		local pped = player.get_player_ped(pid)
		local bid = ped.get_ped_bone_index(pped, 17916)
		local rot, offset, pos, offset2 = v3(0.0,0.0,0.0), v3(15.0,0.0,0.0), v3(), v3(120.0,110.0,200.00)
		local head = player.get_player_heading(pid)
		pos = player.get_player_coords(pid)
		fwdvec =  entity.get_entity_forward_vector(player.get_player_ped(pid))
		pos = Get_Spawn_POS(player.get_player_coords(pid), fwdvec, 15.0)
		i = #SpawnedNPCV + 1
		local plygrp = ped.create_group()
		local model = modal
		streaming.request_model(hash)
		while (not streaming.has_model_loaded(hash)) do
			system.wait(10)
		end
		if streaming.is_model_a_plane(hash) then
			isveh_plane = true
			elseif streaming.is_model_a_heli(hash) then
			isveh_heli = true
		end	
		if isveh_plane or isveh_heli then
			SpawnedNPCV[i] = vehicle.create_vehicle(hash, pos + offset2, head, true, false)
			Veh_spawned = SpawnedNPCV[i]
			entity.set_entity_god_mode(SpawnedNPCV[i], true)
			BlipIDs[#BlipIDs +1] = ui.add_blip_for_entity(SpawnedNPCV[i])
			elseif not isveh_plane or not isveh_heli then
			SpawnedNPCV[i] = vehicle.create_vehicle(hash, pos, head, true, false)
			Veh_spawned = SpawnedNPCV[i]
			entity.set_entity_god_mode(SpawnedNPCV[i], true)
			BlipIDs[#BlipIDs +1] = ui.add_blip_for_entity(SpawnedNPCV[i])
		end
		--decorator.decor_set_int(SpawnedNPCV[i], "MPBitset", 1 << 10)
		vehicle.set_vehicle_mod_kit_type(SpawnedNPCV[i], 0)
		vehicle.get_vehicle_mod(SpawnedNPCV[i], 10)
		vehicle.set_vehicle_mod(SpawnedNPCV[i], 10, 0, false)
		y = #SpawnedNPC + 1
		SpawnedNPC[y] = ped.create_ped(26, model, pos + offset, 0, true, false)
		Ped_Spawned = SpawnedNPC[y]
		entity.set_entity_god_mode(SpawnedNPC[y], true)
		ped.set_ped_can_switch_weapons(SpawnedNPC[y], true)
		ped.set_ped_combat_attributes(SpawnedNPC[y], 46, true)
		ped.set_ped_combat_attributes(SpawnedNPC[y], 52, true)
		ped.set_ped_combat_attributes(SpawnedNPC[y], 1, true)
		ped.set_ped_combat_attributes(SpawnedNPC[y], 2, true)
		ped.set_ped_combat_range(SpawnedNPC[y], 2)
		ped.set_ped_combat_ability(SpawnedNPC[y], 2)
		ped.set_ped_combat_movement(SpawnedNPC[y], 2)
		ped.set_ped_into_vehicle(SpawnedNPC[y], SpawnedNPCV[i], -1)
		vehicle.set_vehicle_doors_locked(SpawnedNPCV[i], 6)
		vehicle.set_vehicle_doors_locked(SpawnedNPCV[i], 2)
		if isveh_plane or isveh_heli then
			vehicle.control_landing_gear(SpawnedNPCV[i] , 3)
			if isveh_heli then
				vehicle.set_heli_blades_full_speed(SpawnedNPCV[i])
			end
			vehicle.set_vehicle_forward_speed(SpawnedNPCV[i], 25.00)
		end
		if attack == true then
			ped.set_ped_relationship_group_hash(SpawnedNPC[y], MoistEntitiesRelHash)
			ped.set_can_attack_friendly(SpawnedNPC[y], true, false)
			ped.set_ped_as_group_member(SpawnedNPC[y], plygrp)
			ped.set_ped_never_leaves_group(SpawnedNPC[y], true)
			ped.set_relationship_between_groups(5, Player_Group, plygrp)
			ped.set_relationship_between_groups(5, plygrp, Player_Group)
			ai.task_combat_ped(SpawnedNPC[y], pped, 0, 16)
			Death_Retask.feats[pid]["hidden"] = false
			Death_Retask.feats[pid]["on"] = true
			elseif attack == false then
			PlyRelHash = ped.get_ped_relationship_group_hash(pped)
			ped.set_ped_relationship_group_hash(SpawnedNPC[y], PlyRelHash)
			ped.set_ped_as_group_member(SpawnedNPC[y],plygrp)
			ped.set_ped_never_leaves_group(SpawnedNPC[y], true)
			ped.set_relationship_between_groups(0, Player_Group, plygrp)
			ped.set_relationship_between_groups(0, plygrp, Player_Group)
			ped.set_can_attack_friendly(SpawnedNPC[y], true, false)
			local PlayerToFollow = player.get_player_ped(pid) or player.get_player_vehicle(pid)
			ai.task_vehicle_follow(SpawnedNPC[y], SpawnedNPCV[i], PlayerToFollow, 220, 262144, 200)
			for PlayerID = 0, 31 do
				if player.is_player_valid(PlayerID) then
					local PlyrrGroup =  player.get_player_group(PlayerID)
					ped.set_relationship_between_groups(5,PlyrrGroup, plygrp)
					ped.set_relationship_between_groups(5,plygrp, PlyrrGroup)
				end
				system.wait(0)
			end
		end
		return Veh_spawned, Ped_Spawned
	end    
	Online_Spawn_options = menu.add_player_feature("Ped Spawn Options", "parent", spawn_parent, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		spawn_groups()
		Support_Group = playergroups[pid +1]
		pped = player.get_player_ped(pid)
		Modal_is_set = false
		Ped_is_set = false
		Weap_type_is_set = false
		Weapon_is_set = false
		Amount_is_set = false
		vehicle_is_set = false
	end)
	Death_Retask = menu.add_player_feature("Retask Attackers On Death", "toggle", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(pid)
		for i = 1, #SpawnedNPC do
			ai.task_goto_entity(SpawnedNPC[i], pped, 999999999999, 100, 1000.00)
			ai.task_combat_ped(SpawnedNPC[i], pped, 0, 16)
		end
		if feat["on"] then
			system.wait(4000)
			if not entity.is_entity_dead(pped) then return HANDLER_CONTINUE end
			for i = 1, #SpawnedNPC do
				for y = 1, #SpawnedNPCV do
					if entity.is_entity_a_vehicle(SpawnedNPCV[y]) and not entity.is_entity_dead(SpawnedNPCV[y]) then
						ped.set_ped_into_vehicle(SpawnedNPC[i], SpawnedNPCV[i], -1)
					end
				end
				ai.task_combat_ped(SpawnedNPC[i], pped, 0, 16)
			end
			return HANDLER_CONTINUE
		end
		for i = 1, #SpawnedNPCV do
			entity.set_entity_as_no_longer_needed(SpawnedNPCV[i])
			entity.delete_entity(SpawnedNPCV[i])
		end
		for i = 1, #SpawnedNPC do
			entity.set_entity_as_no_longer_needed(SpawnedNPC[i])
			entity.delete_entity(SpawnedNPC[i])
		end
		Death_Retask.feats[pid]["hidden"] = true
		Death_Retask.feats[pid]["on"] = false
		return HANDLER_POP
	end)
	for i =0, #Death_Retask.feats do
		Death_Retask.feats[i]["hidden"] = true
		Death_Retask.feats[i]["on"] = false
	end
	PedSpawnList = menu.add_player_feature("Modals:", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		Attacker_Model = Modals[feat.value + 1]
		pedattacker:set_str_data(Modals[feat.value + 1])
		Modal_is_set = true
	end)
	PedSpawnList:set_str_data({"a_c_ a_f_ a_m_", "csb_ cs_", "g_f_ g_m_", "hc_", "ig_", "mp_", "player_", "s_f_ s_m_", "u_f_u_m"})
	pedattacker = menu.add_player_feature("Spawn Ped:", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if Modal_is_set then
			Ped_is_set = true	
			local attackerped =  Attacker_Model[feat.value + 1]
			local checktype = attackerped:sub(1, 4)
			if checktype == "a_c_" then
				AnimalAttacker = true
				else
				AnimalAttacker = false
			end
			Attacker = gameplay.get_hash_key(Attacker_Model[feat.value + 1])
			streaming.request_model(Attacker)
			while not (streaming.has_model_loaded(Attacker)) do
				system.wait(0)
			end
			moist_notify(string.format("Ped : " .. Attacker_Model[feat.value + 1] .. " Selected for spawn"), "Moists Ped Modifier")
			elseif not Modal_is_set then
			moist_notify("Modals Not Set", "Ped Spawn Error")
		end
	end)
	pedattacker:set_str_data(Modals[1])
	pedattacker_wept = menu.add_player_feature("Select Ped Weapon Type: ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if Modal_is_set and Ped_is_set then
			Weap_type_is_set = true
			type_value = feat.value
			local TyPe = Weapon_Lists_type[feat.value + 1]
			LoadWeapList = Weapon_Lists[TyPe]
			pedattacker_wep:set_str_data(LoadWeapList)
			elseif not Modal_is_set and not Ped_is_set then
			moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set), "Ped Spawn Error")
		end
	end)
	pedattacker_wept:set_str_data({"Melee", "Handguns", "Submachine_Guns", "Shotguns", "Assault_Rifles", "Machine Guns", "Sniper_Rifles", "Heavy_Weapons", "Throwables", "Miscellaneous"})
	pedattacker_wep = menu.add_player_feature("Select Ped Weapon: ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if Modal_is_set and Ped_is_set and Weap_type_is_set then
			Weapon_is_set = true
			if type_value == 0 then
				wephash = gameplay.get_hash_key(Melee[feat.value + 1])
				elseif type_value == 1 then
				wephash = gameplay.get_hash_key(Handguns[feat.value + 1])
				elseif type_value == 2 then
				wephash = gameplay.get_hash_key(Submachine_Guns[feat.value + 1])
				elseif type_value == 3 then
				wephash = gameplay.get_hash_key(Shotguns[feat.value + 1])
				elseif type_value == 4 then
				wephash = gameplay.get_hash_key(Assault_Rifles[feat.value + 1])
				elseif type_value == 5 then
				wephash = gameplay.get_hash_key(Machine_Guns[feat.value + 1])
				elseif type_value == 6 then
				wephash = gameplay.get_hash_key(Sniper_Rifles[feat.value + 1])
				elseif type_value == 7 then
				wephash = gameplay.get_hash_key(Heavy_Weapons[feat.value + 1])
				elseif type_value == 0 then
				wephash = gameplay.get_hash_key(Throwables[feat.value + 1])
				elseif type_value == 0 then
				wephash = gameplay.get_hash_key(Miscellaneous[feat.value + 1])
			end
			elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set then
			moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set), "Ped Spawn Error")
		end
	end)
	pedattacker_wep:set_str_data(Weapon_Lists.Melee)
	local SpawnCount = 1
	local attacker = {}
	Spawn_Count = menu.add_player_feature("Amount to spawn: ", "action_value_i", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set then
			SpawnCount = feat.value
			Amount_is_set = true
			elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set then
			moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set), "Ped Spawn Error")
		end
	end)
	Spawn_Count["max"] = 50
	Spawn_Count["min"] = 1
	Spawn_Count["value"] = 1
	Ped_VehModel = menu.add_player_feature("Show Vehicles Starting: ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat.value == 0 then
			Vehicles = {"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1", "ambulance",
				"annihilator", "annihilator2", "apc", "ardent", "armytanker", "armytrailer", "armytrailer2",
			"asbo", "asea", "asea2", "asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"}
			AttackPed_VehModel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha",
				"alphaz1", "ambulance", "annihilator", "annihilator2", "apc", "ardent",
				"armytanker", "armytrailer", "armytrailer2", "asbo", "asea", "asea2",
			"asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"})
			elseif feat.value == 1 then
			Vehicles = {"bagger", "baletrailer", "baller", "baller2", "baller3", "baller4", "baller5", "baller6",
				"banshee", "banshee2", "barracks", "barracks2", "barracks3", "barrage", "bati", "bati2",
				"benson", "besra", "bestiagts", "bf400", "bfinjection", "biff", "bifta", "bison", "bison2",
				"bison3", "bjxl", "blade", "blazer", "blazer2", "blazer3", "blazer4", "blazer5", "blimp",
				"blimp2", "blimp3", "blista", "blista2", "blista3", "bmx", "boattrailer", "bobcatxl",
				"bodhi2", "bombushka", "boxville", "boxville2", "boxville3", "boxville4", "boxville5",
				"brawler", "brickade", "brioso", "brioso2", "bruiser", "bruiser2", "bruiser3", "brutus",
				"brutus2", "brutus3", "btype", "btype2", "btype3", "buccaneer", "buccaneer2", "buffalo",
				"buffalo2", "buffalo3", "bulldozer", "bullet", "burrito", "burrito2", "burrito3",
			"burrito4", "burrito5", "bus", "buzzard", "buzzard2"}
			AttackPed_VehModel:set_str_data({"bagger", "baletrailer", "baller", "baller2", "baller3", "baller4",
				"baller5", "baller6", "banshee", "banshee2", "barracks", "barracks2",
				"barracks3", "barrage", "bati", "bati2", "benson", "besra", "bestiagts",
				"bf400", "bfinjection", "biff", "bifta", "bison", "bison2", "bison3",
				"bjxl", "blade", "blazer", "blazer2", "blazer3", "blazer4", "blazer5",
				"blimp", "blimp2", "blimp3", "blista", "blista2", "blista3", "bmx",
				"boattrailer", "bobcatxl", "bodhi2", "bombushka", "boxville",
				"boxville2", "boxville3", "boxville4", "boxville5", "brawler",
				"brickade", "brioso", "brioso2", "bruiser", "bruiser2", "bruiser3",
				"brutus", "brutus2", "brutus3", "btype", "btype2", "btype3",
				"buccaneer", "buccaneer2", "buffalo", "buffalo2", "buffalo3",
				"bulldozer", "bullet", "burrito", "burrito2", "burrito3", "burrito4",
			"burrito5", "bus", "buzzard", "buzzard2"})
			elseif feat.value == 2 then
			Vehicles = {"cablecar", "caddy", "caddy2", "caddy3", "camper", "caracara", "caracara2", "carbonizzare",
				"carbonrs", "cargobob", "cargobob2", "cargobob3", "cargobob4", "cargoplane", "casco",
				"cavalcade", "cavalcade2", "cerberus", "cerberus2", "cerberus3", "cheburek", "cheetah",
				"cheetah2", "chernobog", "chimera", "chino", "chino2", "cliffhanger", "clique", "club",
				"coach", "cog55", "cog552", "cogcabrio", "cognoscenti", "cognoscenti2", "comet2", "comet3",
				"comet4", "comet5", "contender", "coquette", "coquette2", "coquette3", "coquette4",
			"cruiser", "crusader", "cuban800", "cutter", "cyclone"}
			AttackPed_VehModel:set_str_data({"cablecar", "caddy", "caddy2", "caddy3", "camper", "caracara",
				"caracara2", "carbonizzare", "carbonrs", "cargobob", "cargobob2",
				"cargobob3", "cargobob4", "cargoplane", "casco", "cavalcade",
				"cavalcade2", "cerberus", "cerberus2", "cerberus3", "cheburek",
				"cheetah", "cheetah2", "chernobog", "chimera", "chino", "chino2",
				"cliffhanger", "clique", "club", "coach", "cog55", "cog552",
				"cogcabrio", "cognoscenti", "cognoscenti2", "comet2", "comet3",
				"comet4", "comet5", "contender", "coquette", "coquette2", "coquette3",
			"coquette4", "cruiser", "crusader", "cuban800", "cutter", "cyclone"})
			elseif feat.value == 3 then
			Vehicles = {"daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler", "deluxo",
				"deveste", "deviant", "diablous", "diablous2", "dilettante", "dilettante2", "dinghy",
				"dinghy2", "dinghy3", "dinghy4", "dinghy5", "dloader", "docktrailer", "docktug", "dodo",
				"dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6", "double",
				"drafter", "dubsta", "dubsta2", "dubsta3", "dukes", "dukes2", "dukes3", "dump", "dune",
			"dune2", "dune3", "dune4", "dune5", "duster", "dynasty"}
			AttackPed_VehModel:set_str_data({"daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler",
				"deluxo", "deveste", "deviant", "diablous", "diablous2", "dilettante",
				"dilettante2", "dinghy", "dinghy2", "dinghy3", "dinghy4", "dinghy5",
				"dloader", "docktrailer", "docktug", "dodo", "dominator", "dominator2",
				"dominator3", "dominator4", "dominator5", "dominator6", "double",
				"drafter", "dubsta", "dubsta2", "dubsta3", "dukes", "dukes2", "dukes3",
			"dump", "dune", "dune2", "dune3", "dune4", "dune5", "duster", "dynasty"})
			elseif feat.value == 4 then
			Vehicles = {"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3", "enduro",
			"entity2", "entityxf", "esskey", "everon", "exemplar"}
			AttackPed_VehModel:set_str_data({"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3",
			"enduro", "entity2", "entityxf", "esskey", "everon", "exemplar"})
			elseif feat.value == 5 then
			Vehicles = {"f620", "faction", "faction2", "faction3", "fagaloa", "faggio", "faggio2", "faggio3", "fbi",
				"fbi2", "fcr", "fcr2", "felon", "felon2", "feltzer2", "feltzer3", "firetruck", "firetruk",
				"fixter", "flashgt", "flatbed", "fmj", "forklift", "formula", "formula2", "fq2",
				"freecrawler", "freight", "freightcar", "freightcont1", "freightcont2", "freightgrain",
			"freighttrailer", "frogger", "frogger2", "fugitive", "furia", "furoregt", "fusilade", "futo"}
			AttackPed_VehModel:set_str_data({"f620", "faction", "faction2", "faction3", "fagaloa", "faggio",
				"faggio2", "faggio3", "fbi", "fbi2", "fcr", "fcr2", "felon", "felon2",
				"feltzer2", "feltzer3", "firetruck", "firetruk", "fixter", "flashgt",
				"flatbed", "fmj", "forklift", "formula", "formula2", "fq2",
				"freecrawler", "freight", "freightcar", "freightcont1", "freightcont2",
				"freightgrain", "freighttrailer", "frogger", "frogger2", "fugitive",
			"furia", "furoregt", "fusilade", "futo"})
			elseif feat.value == 6 then
			Vehicles = {"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "gb200",
				"gburrito", "gburrito2", "glendale", "glendale2", "gp1", "graintrailer", "granger",
			"gresley", "gt500", "guardian"}
			AttackPed_VehModel:set_str_data({"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4",
				"gauntlet5", "gb200", "gburrito", "gburrito2", "glendale", "glendale2",
			"gp1", "graintrailer", "granger", "gresley", "gt500", "guardian"})
			elseif feat.value == 7 then
			Vehicles = {"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler", "hauler2", "havok",
				"hellion", "hermes", "hexer", "hotknife", "hotring", "howard", "hunter", "huntley",
			"hustler", "hydra"}
			AttackPed_VehModel:set_str_data({"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler",
				"hauler2", "havok", "hellion", "hermes", "hexer", "hotknife", "hotring",
			"howard", "hunter", "huntley", "hustler", "hydra"})
			elseif feat.value == 8 then
			Vehicles = {"imorgon", "impaler", "impaler2", "impaler3", "impaler4", "imperator", "imperator2",
				"imperator3", "infernus", "infernus2", "ingot", "innovation", "insurgent", "insurgent2",
				"insurgent3", "intruder", "issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "italigtb",
			"italigtb2", "italigto", "italirsx"}
			AttackPed_VehModel:set_str_data({"imorgon", "impaler", "impaler2", "impaler3", "impaler4", "imperator",
				"imperator2", "imperator3", "infernus", "infernus2", "ingot",
				"innovation", "insurgent", "insurgent2", "insurgent3", "intruder",
				"issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "italigtb",
			"italigtb2", "italigto", "italirsx"})
			elseif feat.value == 9 then
			Vehicles = {"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet", "jetmax", "journey",
			"jugular"}
			AttackPed_VehModel:set_str_data({"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet",
			"jetmax", "journey", "jugular"})
			elseif feat.value == 10 then
			Vehicles = {"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda", "kosatka", "krieger",
			"kuruma", "kuruma2"}
			AttackPed_VehModel:set_str_data({"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda",
			"kosatka", "krieger", "kuruma", "kuruma2"})
			elseif feat.value == 11 then
			Vehicles = {"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard", "limo2", "locust",
			"longfin", "lurcher", "luxor", "luxor2", "lynx"}
			AttackPed_VehModel:set_str_data({"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard",
			"limo2", "locust", "longfin", "lurcher", "luxor", "luxor2", "lynx"})
			elseif feat.value == 12 then
			Vehicles = {"mamba", "mammatus", "manana", "manana2", "manchez", "manchez2", "marquis", "marshall",
				"massacro", "massacro2", "maverick", "menacer", "mesa", "mesa2", "mesa3", "metrotrain",
				"michelli", "microlight", "miljet", "minitank", "minivan", "minivan2", "mixer", "mixer2",
				"mogul", "molotok", "monroe", "monster", "monster3", "monster4", "monster5", "moonbeam",
			"moonbeam2", "mower", "mule", "mule2", "mule3", "mule4"}
			AttackPed_VehModel:set_str_data({"mamba", "mammatus", "manana", "manana2", "manchez", "manchez2",
				"marquis", "marshall", "massacro", "massacro2", "maverick", "menacer",
				"mesa", "mesa2", "mesa3", "metrotrain", "michelli", "microlight",
				"miljet", "minitank", "minivan", "minivan2", "mixer", "mixer2", "mogul",
				"molotok", "monroe", "monster", "monster3", "monster4", "monster5",
			"moonbeam", "moonbeam2", "mower", "mule", "mule2", "mule3", "mule4"})
			elseif feat.value == 13 then
			Vehicles = {"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade", "nightshade",
			"nightshark", "nimbus", "ninef", "ninef2", "nokota", "novak"}
			AttackPed_VehModel:set_str_data({"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade",
				"nightshade", "nightshark", "nimbus", "ninef", "ninef2", "nokota",
			"novak"})
			elseif feat.value == 14 then
			Vehicles = {"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2", "oracle", "oracle2",
			"osiris", "outlaw"}
			AttackPed_VehModel:set_str_data({"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2",
			"oracle", "oracle2", "osiris", "outlaw"})
			elseif feat.value == 15 then
			Vehicles = {"packer", "panto", "paradise", "paragon", "paragon2", "pariah", "patriot", "patriot2",
				"patrolboat", "pbus", "pbus2", "pcj", "penetrator", "penumbra", "penumbra2", "peyote",
				"peyote2", "peyote3", "pfister811", "phantom", "phantom2", "phantom3", "phoenix", "picador",
				"pigalle", "police", "police2", "police3", "police4", "policeb", "policeold1", "policeold2",
				"policet", "polmav", "pony", "pony2", "pounder", "pounder2", "prairie", "pranger",
			"predator", "premier", "primo", "primo2", "proptrailer", "prototipo", "pyro"}
			AttackPed_VehModel:set_str_data({"packer", "panto", "paradise", "paragon", "paragon2", "pariah",
				"patriot", "patriot2", "patrolboat", "pbus", "pbus2", "pcj",
				"penetrator", "penumbra", "penumbra2", "peyote", "peyote2", "peyote3",
				"pfister811", "phantom", "phantom2", "phantom3", "phoenix", "picador",
				"pigalle", "police", "police2", "police3", "police4", "policeb",
				"policeold1", "policeold2", "policet", "polmav", "pony", "pony2",
				"pounder", "pounder2", "prairie", "pranger", "predator", "premier",
			"primo", "primo2", "proptrailer", "prototipo", "pyro"})
			elseif feat.value == 16 then
			Vehicles = {"radi", "raiden", "raketrailer", "rallytruck", "rancherxl", "rancherxl2", "rapidgt",
				"rapidgt2", "rapidgt3", "raptor", "ratbike", "ratloader", "ratloader2", "rcbandito",
				"reaper", "rebel", "rebel2", "rebla", "regina", "rentalbus", "retinue", "retinue2",
				"revolter", "rhapsody", "rhino", "riata", "riot", "riot2", "ripley", "rocoto", "rogue",
				"romero", "rrocket", "rubble", "ruffian", "ruiner", "ruiner2", "ruiner3", "rumpo", "rumpo2",
			"rumpo3", "ruston"}
			AttackPed_VehModel:set_str_data({"radi", "raiden", "raketrailer", "rallytruck", "rancherxl",
				"rancherxl2", "rapidgt", "rapidgt2", "rapidgt3", "raptor", "ratbike",
				"ratloader", "ratloader2", "rcbandito", "reaper", "rebel", "rebel2",
				"rebla", "regina", "rentalbus", "retinue", "retinue2", "revolter",
				"rhapsody", "rhino", "riata", "riot", "riot2", "ripley", "rocoto",
				"rogue", "romero", "rrocket", "rubble", "ruffian", "ruiner", "ruiner2",
			"ruiner3", "rumpo", "rumpo2", "rumpo3", "ruston"})
			elseif feat.value == 17 then
			Vehicles = {"s80", "sabregt", "sabregt2", "sadler", "sadler2", "sanchez", "sanchez2", "sanctus",
				"sandking", "sandking2", "savage", "savestra", "sc1", "scarab", "scarab2", "scarab3",
				"schafter2", "schafter3", "schafter4", "schafter5", "schafter6", "schlagen", "schwarzer",
				"scorcher", "scramjet", "scrap", "seabreeze", "seashark", "seashark2", "seashark3",
				"seasparrow", "seasparrow2", "seasparrow3", "seminole", "seminole2", "sentinel",
				"sentinel2", "sentinel3", "serrano", "seven70", "shamal", "sheava", "sheriff", "sheriff2",
				"shotaro", "skylift", "slamtruck", "slamvan", "slamvan2", "slamvan3", "slamvan4",
				"slamvan5", "slamvan6", "sovereign", "specter", "specter2", "speeder", "speeder2", "speedo",
				"speedo2", "speedo4", "squaddie", "squalo", "stafford", "stalion", "stalion2", "stanier",
				"starling", "stinger", "stingergt", "stockade", "stockade3", "stratum", "streiter",
				"stretch", "strikeforce", "stromberg", "stryder", "stunt", "submersible", "submersible2",
				"sugoi", "sultan", "sultan2", "sultanrs", "suntrap", "superd", "supervolito",
			"supervolito2", "surano", "surfer", "surfer2", "surge", "swift", "swift2", "swinger"}
			AttackPed_VehModel:set_str_data({"s80", "sabregt", "sabregt2", "sadler", "sadler2", "sanchez",
				"sanchez2", "sanctus", "sandking", "sandking2", "savage", "savestra",
				"sc1", "scarab", "scarab2", "scarab3", "schafter2", "schafter3",
				"schafter4", "schafter5", "schafter6", "schlagen", "schwarzer",
				"scorcher", "scramjet", "scrap", "seabreeze", "seashark", "seashark2",
				"seashark3", "seasparrow", "seasparrow2", "seasparrow3", "seminole",
				"seminole2", "sentinel", "sentinel2", "sentinel3", "serrano", "seven70",
				"shamal", "sheava", "sheriff", "sheriff2", "shotaro", "skylift",
				"slamtruck", "slamvan", "slamvan2", "slamvan3", "slamvan4", "slamvan5",
				"slamvan6", "sovereign", "specter", "specter2", "speeder", "speeder2",
				"speedo", "speedo2", "speedo4", "squaddie", "squalo", "stafford",
				"stalion", "stalion2", "stanier", "starling", "stinger", "stingergt",
				"stockade", "stockade3", "stratum", "streiter", "stretch",
				"strikeforce", "stromberg", "stryder", "stunt", "submersible",
				"submersible2", "sugoi", "sultan", "sultan2", "sultanrs", "suntrap",
				"superd", "supervolito", "supervolito2", "surano", "surfer", "surfer2",
			"surge", "swift", "swift2", "swinger"})
			elseif feat.value == 18 then
			Vehicles = {"t20", "taco", "tailgater", "tailgater2", "taipan", "tampa", "tampa2", "tampa3", "tanker",
				"tanker2", "tankercar", "taxi", "technical", "technical2", "technical3", "tempesta",
				"terbyte", "tezeract", "thrax", "thrust", "thruster", "tigon", "tiptruck", "tiptruck2",
				"titan", "toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4", "tornado5",
				"tornado6", "toro", "toro2", "toros", "tourbus", "towtruck", "towtruck2", "tr2", "tr3",
				"tr4", "tractor", "tractor2", "tractor3", "trailerlarge", "trailerlogs", "trailers",
				"trailers2", "trailers3", "trailers4", "trailersmall", "trailersmall2", "trash", "trash2",
				"trflat", "tribike", "tribike2", "tribike3", "trophytruck", "trophytruck2", "tropic",
				"tropic2", "tropos", "tug", "tula", "tulip", "turismo2", "turismor", "tvtrailer", "tyrant",
			"tyrus"}
			AttackPed_VehModel:set_str_data({"t20", "taco", "tailgater", "tailgater2", "taipan", "tampa", "tampa2",
				"tampa3", "tanker", "tanker2", "tankercar", "taxi", "technical",
				"technical2", "technical3", "tempesta", "terbyte", "tezeract", "thrax",
				"thrust", "thruster", "tigon", "tiptruck", "tiptruck2", "titan",
				"toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4",
				"tornado5", "tornado6", "toro", "toro2", "toros", "tourbus", "towtruck",
				"towtruck2", "tr2", "tr3", "tr4", "tractor", "tractor2", "tractor3",
				"trailerlarge", "trailerlogs", "trailers", "trailers2", "trailers3",
				"trailers4", "trailersmall", "trailersmall2", "trash", "trash2",
				"trflat", "tribike", "tribike2", "tribike3", "trophytruck",
				"trophytruck2", "tropic", "tropic2", "tropos", "tug", "tula", "tulip",
			"turismo2", "turismor", "tvtrailer", "tyrant", "tyrus"})
			elseif feat.value == 19 then
			Vehicles = {"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck", "utillitruck2",
			"utillitruck3"}
			AttackPed_VehModel:set_str_data({"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck",
			"utillitruck2", "utillitruck3"})
			elseif feat.value == 20 then
			Vehicles = {"vacca", "vader", "vagner", "vagrant", "valkyrie", "valkyrie2", "vamos", "velum", "velum2",
				"verlierer2", "verus", "vestra", "vetir", "veto", "veto2", "vigero", "vigilante",
				"vindicator", "virgo", "virgo2", "virgo3", "viseris", "visione", "volatol", "volatus",
			"voltic", "voltic2", "voodoo", "voodoo2", "vortex", "vstr"}
			AttackPed_VehModel:set_str_data({"vacca", "vader", "vagner", "vagrant", "valkyrie", "valkyrie2", "vamos",
				"velum", "velum2", "verlierer2", "verus", "vestra", "vetir", "veto",
				"veto2", "vigero", "vigilante", "vindicator", "virgo", "virgo2",
				"virgo3", "viseris", "visione", "volatol", "volatus", "voltic",
			"voltic2", "voodoo", "voodoo2", "vortex", "vstr"})
			elseif feat.value == 21 then
			Vehicles = {"warrener", "washington", "wastelander", "weevil", "windsor", "windsor2", "winky",
			"wolfsbane"}
			AttackPed_VehModel:set_str_data({"warrener", "washington", "wastelander", "weevil", "windsor",
			"windsor2", "winky", "wolfsbane"})
			elseif feat.value == 22 then
			Vehicles = {"xa21", "xls", "xls2"}
			AttackPed_VehModel:set_str_data({"xa21", "xls", "xls2"})
			elseif feat.value == 23 then
			Vehicles = {"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"}
			AttackPed_VehModel:set_str_data({"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"})
			elseif feat.value == 24 then
			Vehicles = {"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea", "zombieb", "zorrusso",
			"zr380", "zr3802", "zr3803", "ztype"}
			AttackPed_VehModel:set_str_data({"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea",
			"zombieb", "zorrusso", "zr380", "zr3802", "zr3803", "ztype"})
		end
	end)
	Ped_VehModel:set_str_data({"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R",
	"S", "T", "U", "V", "W", "X", "Y", "Z"})
	AttackPed_VehModel = menu.add_player_feature("Spawn : ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set then
			ppededVehModSpawn = Vehicles[feat.value + 1]
			vehicle_is_set = true
			elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set then
			moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set), "Ped Spawn Error")
		end
	end)
	AttackPed_VehModel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1",
		"ambulance", "annihilator", "annihilator2", "apc", "ardent", "armytanker",
		"armytrailer", "armytrailer2", "asbo", "asea", "asea2", "asterope", "autarch",
	"avarus", "avenger", "avenger2", "avisa"})
	Send_Attacker = menu.add_player_feature("", "action_value_str", Online_Spawn_options.id, function(feat, pid)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(pid)
		for v = 1, SpawnCount do
			if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set and Amount_is_set then
				local i = #SpawnedNPC + 1
				if feat.value == 0 then
					if wephash == nil then
						wephash = gameplay.get_hash_key(Attacker_Weapon)
					end
					SpawnedNPC[i]  = spawn_ped_v2(pid, Attacker, true)
					system.wait(10)
					entity.set_entity_god_mode(SpawnedNPC[i], true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 52, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 1, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 46, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 2, true)
					ped.set_ped_combat_range(SpawnedNPC[i], 2)
					ped.set_ped_combat_ability(SpawnedNPC[i], 2)
					ped.set_ped_combat_movement(SpawnedNPC[i], 2)
					local pos = v3()
					pos = player.get_player_coords(pid)
					ai.task_parachute_to_target(SpawnedNPC[i], pos)
					system.wait(12000)
					weapon.give_delayed_weapon_to_ped(SpawnedNPC[i], wephash, 0, 1)
					ped.set_relationship_between_groups(5, Support_Group, Group_Hate)
					ped.set_relationship_between_groups(5, Group_Hate, Support_Group)
					ped.set_ped_as_group_member(SpawnedNPC[i], Group_Hate)
					weapon.give_delayed_weapon_to_ped(SpawnedNPC[i], wephash, 0, 1)
					weapon.set_ped_ammo(SpawnedNPC[i], wephash, 1000000)
					ai.task_combat_ped(SpawnedNPC[i], pped, 0, 16)
					Death_Retask.feats[pid]["hidden"] = false
					Death_Retask.feats[pid]["on"] = true
					elseif feat.value == 1 then
					if AnimalAttacker then
						SpawnedNPC[i] = spawn_Animal_ped(pid, Attacker, -8, true, nil)
						else
						SpawnedNPC[i] = spawn_ped(pid, Attacker, -8, true, nil)
					end
					if SpawnedNPC[i] == nil or not type(SpawnedNPC[i]) == 'number' then return end
					entity.set_entity_god_mode(SpawnedNPC[i], true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 52, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 1, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 46, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 2, true)
					ped.set_ped_combat_range(SpawnedNPC[i], 2)
					ped.set_ped_combat_ability(SpawnedNPC[i], 2)
					ped.set_ped_combat_movement(SpawnedNPC[i], 2)
					weapon.give_delayed_weapon_to_ped(SpawnedNPC[i], wephash, 1, 1)
					weapon.set_ped_ammo(SpawnedNPC[i], wephash, 1000000)
					ped.set_ped_can_switch_weapons(SpawnedNPC[i], true)
					plygrp =  player.get_player_group(pid)
					pedgroup = ped.get_ped_group(SpawnedNPC[i])
					ped.set_relationship_between_groups(5, plygrp, pedgroup)
					ped.set_relationship_between_groups(5, pedgroup, plygrp)
					weapon.give_delayed_weapon_to_ped(SpawnedNPC[i], wephash, 0, 1)
					weapon.set_ped_ammo(SpawnedNPC[i], wephash, 1000000)
					pped = player.get_player_ped(pid)
					ai.task_combat_ped(SpawnedNPC[i], pped, 0, 16)
					Death_Retask.feats[pid]["hidden"] = false
					Death_Retask.feats[pid]["on"] = true
					elseif feat.value == 2 then
					pped = player.get_player_ped(pid)
					if AnimalAttacker then
						SpawnedNPC[i] = spawn_Animal_ped(pid, Attacker, -8, true, nil)
						else
						SpawnedNPC[i] = spawn_ped(pid, Attacker, -8, true, nil)
					end
					system.wait(100)
					if not SpawnedNPC[i] == nil or not type(SpawnedNPC[i]) == 'number' then return end
					spawn_groups()
					entity.set_entity_god_mode(SpawnedNPC[i], true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 52, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 1, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 46, true)
					ped.set_ped_combat_attributes(SpawnedNPC[i], 2, true)
					ped.set_ped_combat_range(SpawnedNPC[i], 2)
					ped.set_ped_combat_ability(SpawnedNPC[i], 2)
					ped.set_ped_combat_movement(SpawnedNPC[i], 2)
					weapon.give_delayed_weapon_to_ped(SpawnedNPC[i], wephash, 0, 1)
					weapon.set_ped_ammo(SpawnedNPC[i], wephash, 1000000)
					ped.set_ped_can_switch_weapons(SpawnedNPC[i], true)
					supportgroup = ped.create_group()
					plygrp =  player.get_player_group(pid)
					pedgroup = ped.get_ped_group(SpawnedNPC[i])
					ped.set_ped_as_group_member(SpawnedNPC[i], plygrp)
					pedgroup = ped.get_ped_group(SpawnedNPC[i])
					ped.set_relationship_between_groups(0, plygrp, pedgroup)
					ped.set_relationship_between_groups(0, pedgroup, plygrp)
					ped.set_ped_as_group_member(SpawnedNPC[i], plygrp)
					ped.set_ped_never_leaves_group(SpawnedNPC[i], true)
					for Pi = 0, 31 do
						if Pi ~= pid then
							pedgroup = ped.get_ped_group(SpawnedNPC[i])
							ped.set_relationship_between_groups(5, pedgroup, playergroups[Pi + 1])
							ped.set_relationship_between_groups(5, playergroups[Pi + 1], pedgroup)
						end
					end
					elseif feat.value == 3 and Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set and vehicle_is_set then
					local PedVehHash = gameplay.get_hash_key(ppededVehModSpawn)
					local y = #SpawnedNPCV + 1
					local i = #SpawnedNPC + 1
					SpawnedNPCV[y], SpawnedNPC[i] = AttackPed_Vehicle(PedVehHash, pid, Attacker, true)
					Death_Retask.feats[pid]["hidden"] = false
					Death_Retask.feats[pid]["on"] = true
					elseif feat.value == 4 and Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set and vehicle_is_set then
					local y = #SpawnedNPCV + 1
					local i = #SpawnedNPC + 1
					local PedVehHash = gameplay.get_hash_key(ppededVehModSpawn)
					SpawnedNPCV[y], SpawnedNPC[i] = AttackPed_Vehicle(PedVehHash, pid, Attacker, false)
					local PlayerToFollow = player.get_player_ped(pid) or player.get_player_vehicle(pid)
					system.yield(1000)
					ai.task_vehicle_follow(SpawnedNPC[i], SpawnedNPCV[y], PlayerToFollow, 220, 1074528293, 200)
					system.yield(1000)
					ai.task_vehicle_follow(SpawnedNPC[i],SpawnedNPCV[y], PlayerToFollow, 250.00, 1074528293, 400)
					elseif feat.value == 3 or feat.value == 4 and not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set and not vehicle_is_set then
					moist_notify("Vehicle Needs to be Set for this option!", "Ped Spawn Error")
					moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set) .. "\nVehicle is Set: " .. tostring(vehicle_is_set), "Ped Spawn Error")
				end
				elseif not Modal_is_set or not Ped_is_set or not Weap_type_is_set or not Weapon_is_set or not vehicle_is_set then
				moist_notify("All Options Must Be Set First\nVehicle Selection is not Required if Vehicle Spawn Not Used", "Error!\nSpawn Options Not Set")
				moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set) .. "\nVehicle is Set: " .. tostring(vehicle_is_set), "Ped Spawn Error")
			end
		end
		system.wait(10)
	end)
	Send_Attacker:set_str_data(Spawn_As)
end
OnlineSpawnOptions()
-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians
--INFO: Online Friends Checker
FriendsOnline = menu.add_feature("Online Friends: ", "action_value_str", globalFeatures.lobby,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat.value == 0 then
		for i=0,network.get_friend_count()-1 do
			local friendName, friendScid, friendOnline, friendMplay
			friendName = network.get_friend_index_name(i)
			friendScid = network.get_friend_scid(friendName)
			friendOnline = network.is_friend_index_online(i)
			friendMplay = network.is_friend_in_multiplayer(friendName)
			--print(string.format("Friend index %s %s (%s) is %s", i, friendName, friendScid, friendOnline and "online" or "offline"))
			if friendOnline then
				Debug_Out("Online Friends Found: \n" .. i ..": " .. friendName .." (" .. friendScid .. ")")
				if friendMplay then
					moist_notify("Online Friend : " .. friendName .. "\nis Playing Online", "Network Presence", nil, 15)
					else
					moist_notify("Online Friend : " .. friendName , "Network Presence", nil, 15)
				end
				system.wait(100)
			end
		end
		elseif feat.value == 1 then
		Debug_Out("[Friend Index Output]", true)
		for i=0,network.get_friend_count()-1 do
			local friendName, friendScid
			friendName = network.get_friend_index_name(i)
			friendScid = network.get_friend_scid(friendName)
			Debug_Out(i ..": Name : " .. friendName .." Scid: " .. friendScid, false)
			system.wait(10)
		end
	end
end)
FriendsOnline:set_str_data({"Check", "Output to DebugFile"})
--INFO: Orbitor Features
Degree = 0
function Orbit2(Distance)
	while not streaming.has_model_loaded(2906806882) do
		streaming.request_model(2906806882)
		system.wait(1)
	end
	local RootPos = player.get_player_coords(orbit_pid)
	RootPos.z = RootPos.z + 3.500
	EntityHash.pid[#EntityHash.pid + 1] = object.create_object(2906806882, RootPos + Distance, true, false)
	entity.set_entity_gravity(EntityHash.pid[#EntityHash.pid], 0)
	entity.freeze_entity(EntityHash.pid[#EntityHash.pid], false)
	while true do
		Degree = Degree + 3.75
		if Degree > 360 then Degree = -360 end
		local rad = math.rad(Degree)
		RootPos = player.get_player_coords(orbit_pid)
		local x = Distance*math.cos(rad) + RootPos.x
		local y = Distance*math.sin(rad) + RootPos.y
		local zz = Distance*math.sin(rad) + RootPos.z
		entity.set_entity_coords_no_offset(EntityHash.pid[#EntityHash.pid], v3(x, y, RootPos.z))
		entity.set_entity_rotation(EntityHash.pid[#EntityHash.pid], v3(x, y, zz))
		system.wait(1)
	end
end
function Orbit1(Distance)
	while not streaming.has_model_loaded(2906806882) do
		streaming.request_model(2906806882)
		system.wait(1)
	end
	RootPos = player.get_player_coords(orbit_pid)
	RootPos.z = RootPos.z + 3.500
	EntityHash2.pid[#EntityHash2.pid + 1] = object.create_object(2906806882, RootPos + Distance, true, false)
	entity.set_entity_gravity(EntityHash2.pid[#EntityHash2.pid], 0)
	entity.freeze_entity(EntityHash2.pid[#EntityHash2.pid], false)
	while true do
		local rad, RootPos, x,  y , zz
		Degree = Degree + 3.75
		if Degree > 360 then Degree = -360 end
		rad = math.rad(Degree)
		RootPos = player.get_player_coords(orbit_pid)
		x = Distance*math.cos(rad) + RootPos.x
		y = Distance*math.sin(rad) + RootPos.y
		zz = Distance*math.sin(rad) + RootPos.z
		entity.set_entity_coords_no_offset(EntityHash2.pid[#EntityHash2.pid], v3(x + 1.0, y + 1.0, RootPos.z + 0.5))
		entity.set_entity_rotation(EntityHash2.pid[#EntityHash2.pid], v3(x, y, zz))
		system.wait(1)
	end
end
function spawn_attach(hash, bone, pos, rot, col, pid)
	streaming.request_model(hash)
	while (not streaming.has_model_loaded(hash)) do
		system.wait(10)
	end
	local i = #spawned_cunts + 1
	spawned_cunts[i] = object.create_object(hash, pos, true, false)
	pped = player.get_player_ped(pid)
	entity.attach_entity_to_entity(spawned_cunts[i], pped, bone, pos, rot, true, col, false, 0, true)
end
function ped_groups()
	local a, b
	groupIDs[#groupIDs + 1] = ped.create_group()
	groupIDs[#groupIDs + 1] = ped.create_group()
	a = #groupIDs
	b = #groupIDs - 1
	ped.set_relationship_between_groups(0, groupIDs[a], groupIDs[b])
	ped.set_relationship_between_groups(0, groupIDs[b], groupIDs[a])
end
function PlayerInfo(pid)
	while OSD_Debug2["on"] do
		if player.is_player_valid(pid) then
			Active_menu = pid
			health, infoA, infoAB, infoB = Player_Check(pid)
			system.wait(25)
		end
		system.wait(5)
	end
	system.wait(250)
end
Ped_WepL = {}
function PedWeapLabel()
	for i = 1, #ped_wep do
		local text = ped_wep[i]
		local separator = text:find("_", 1, true)
		if separator then
			local label = text:sub(1, separator - 1)
			local value = text:sub(separator + 1)
			Ped_WepL[#Ped_WepL+1] = value
		end
	end
end
PedWeapLabel()
--INFO: Player list
ScriptLocals["playerlist"] = function()
local pos, offset, ply_veh, ply_ped, name, PlyImpactPos = v3(), v3(), {}, {}, {}, {}
God_thread = {}
ScriptLocals["featureVars"] = featureVars
featureVars = {}
for pid = 0, 31 do
OSD_Debug2["on"] = false
featureVars.f = menu.add_feature("Player " .. pid, "parent", playersFeature,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	Active_menu = pid
	if Settings["playerscriptinfo"] and player.is_player_valid(pid) then
		health, infoA, infoAB, infoB, text1, text2, text3, text4, text5, text6, text7 = "", "", "", "", "", "", "", "", "", "", ""
		health, infoA, infoAB, infoB = Player_Check(pid)
		--if not Settings["GodCheck"] then
		playerFeatures[pid].features["interiortest2"].feat["on"] = not playerFeatures[pid].features["interiortest2"].feat.on
		playerFeatures[pid].features["interiortest"].feat["on"] = not playerFeatures[pid].features["interiortest"].feat.on
		--end
		OSD_Debug2["on"] = true
		PlayerInfo(pid)
		system.yield(10)
	end
	system.yield(10)
end)
featureVars.k = menu.add_feature("Remove Player Options", "parent", featureVars.f.id)
featureVars.k["hidden"] = NewDLC()		
featureVars.v = menu.add_feature("Vehicle Options", "parent", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
end)
featureVars.exp = menu.add_feature("Experimental Shit!", "parent", featureVars.v.id)
featureVars.g = menu.add_feature("Griefing Options", "parent", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	playerFeatures[pid].features["blamer"].feat:set_str_data(Playerz)
	playerFeatures[pid].features["blamedorbital"].feat:set_str_data(Playerz)
	playerFeatures[pid].features["blamer"].feat["value"] = 32
	playerFeatures[pid].features["blamedorbital"].feat["value"] = 32
end)		
featureVars.tr = menu.add_feature("Troll Options", "parent", featureVars.f.id)
featureVars.t = menu.add_feature("Teleport Options", "parent", featureVars.f.id)
featureVars.vd = menu.add_feature("Experimental Decor's", "parent", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
end)
featureVars.pd = menu.add_feature("Ped Decorators", "parent", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
end)
featureVars.h = menu.add_feature("Highlight Options", "parent", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not highlight_set[pid+1] then
		markID.z[pid+5] = 1.0
		markID.s[pid+5] = 1.0
		markID.ROT[pid+5] = true
		markID.BOB[pid+5] = true
		markID.z[pid+4] = 1.0
		markID.s[pid+4] = 1.0
		markID.BOB[pid+4] = true
		markID.ROT[pid+4] = true
		markID.z[pid+2] = -2.0
		markID.s[pid+2] = 2.5
		markID.BOB[pid+2] = true
		markID.ROT[pid+2] = true
		markID.z[pid+3] = 1.0
		markID.s[pid+3] = 1.0
		markID.BOB[pid+3] = true
		markID.ROT[pid+3] = true
		markID.z[pid+6] = 1.0
		markID.s[pid+6] = 1.0
		markID.BOB[pid+6] = true
		markID.ROT[pid+6] = true
		highlight_set[pid+1] = true
	end
end)
featureVars.ch = menu.add_feature("Custom Options", "parent", featureVars.h.id)
featureVars.chc = menu.add_feature("Custom Color Change", "parent", featureVars.ch.id)
featureVars.str = menu.add_feature("Sound Features", "parent", featureVars.tr.id)
featureVars.lgr = menu.add_feature("Lester Griefer", "parent", featureVars.g.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	ped_group_setup()
end)
featureVars.gr = menu.add_feature("Lester Ramjet", "parent", featureVars.lgr.id)
featureVars.n = menu.add_feature("Info Options", "parent", featureVars.f.id)
features = {}
local killengine = false
features["disableveh"] = {feat = menu.add_feature("Disable Players Vehicle", "toggle", featureVars.exp.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	if not feat["on"] then
		playerFeatures[pid].features["tog_godvehoff"].feat["on"] = false
		killengine = false
		return HANDLER_POP
	end
	playerFeatures[pid].features["tog_godvehoff"].feat["on"] = true
	local PlyVeh = player.get_player_vehicle(pid)
	vehicle.set_vehicle_undriveable(PlyVeh, true)
	vehicle.set_vehicle_engine_on(PlyVeh, false, true, true)
	if vehicle.is_vehicle_engine_running(PlyVeh) and killengine == false then
		vehicle.set_vehicle_engine_health(PlyVeh, 0.00001)
		killengine = true
	end			
	return HANDLER_CONTINUE
end), type = "toggle", callback = function()
end}
features["disableveh"].feat["on"] = false
features["info_notif"] = {feat = menu.add_feature("Get Player infos", "action", featureVars.n.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) or not network.is_session_started() then return end
	local test = "Time Joined: " .. tostring(Players[pid].JoinTime) .. "\nJoined time: " .. tostring(os.time() - Players[pid].JoinTime .. "\nSpectatable = " ..tostring(Players[pid].Spectatable))
	moist_notify(test)
	system.wait(1000)
	test = "spawned: " .. tostring(Players[pid].PedSpawned) .. "\nundead: " .. tostring(Players[pid].isUnDead)  .. "\nOrg ID = " .. tostring(script.get_global_i(1893551 + (1 + (pid * 599)) + 10))
	moist_notify(test)
	system.wait(1000)
	if Players[pid].isOTR then
		local test = tonumber(os.time())
		local otrtime = test - tonumber(Players[pid].OTR_Start)
		moist_notify("OTR Time: | " .. tostring(player.get_player_name(pid)) .. " | " .. tostring(otrtime  / 60) .. " mins", "")
	end
	CombatStat_notify(pid)
end), type = "action", callback = function()
end}
features["Combat_stat"] = {feat = menu.add_feature("Send Combat Stats in Chat", "action", featureVars.n.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) or not network.is_session_started() then return end
	CombatStat_Chat(pid)
end), type = "action", callback = function()
end}
features["SetSpawned"] = {feat = menu.add_feature("Set/unset Player Ped Spawned", "action", featureVars.n.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	Players[pid].PedSpawned = not Players[pid].PedSpawned
	moist_notify("Ped Spawned = " .. tostring(Players[pid].PedSpawned))
end), type = "action", callback = function()
end}
features["sendlestermtk"] = {feat = menu.add_feature("minitank Lester", "action_value_str", featureVars.lgr.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	local attack = feat.value
	local pped = player.get_player_ped(pid)
	local pos = get_offset(pid, -8)
	local e = #lester * 3
	local d = 15
	local c = d + e
	pos.x = pos.x + c
	local heading = player.get_player_heading(pid)
	local model = gameplay.get_hash_key("ig_lestercrest_2")
	local vehhash = gameplay.get_hash_key("minitank")
	streaming.request_model(model)
	while (not streaming.has_model_loaded(model)) do
		system.wait(10)
	end
	local i = #lester + 1
	lester[i] = ped.create_ped(6, model, pos, heading, true, false)
	ped.set_ped_relationship_group_hash(lester[i], MoistEntRelHash[1])
	ped.set_can_attack_friendly(lester[i], true, false)
	if #groupIDs == nil then
		ped_group_setup()
		else
	end
	if #lester >= 8 then
		local t = #lester / 8
		local j = #groupIDs
		if  t > j then
			ped_group_setup()
			local j = #groupIDs
			local lester_group = groupIDs[j]		
			else
		end
		local lester_group = groupIDs[j]
		else
		local j = #groupIDs - 1
		local lester_group = groupIDs[j]
		ped.set_ped_as_group_member(lester[i], lester_group)
		ped.set_ped_never_leaves_group(lester[i], true)
		if i == 1 or 9 then
			if i == 1 then ped.set_ped_as_group_leader(lester[i], groupIDs[1])
			end
			elseif i == 9 then ped.set_ped_as_group_leader(lester[i], groupIDs[2])
		end
	end
	entity.set_entity_god_mode(lester[i], true)
	streaming.request_model(vehhash)
	while (not streaming.has_model_loaded(vehhash)) do
		system.wait(10)
	end
	local y = #lesveh + 1
	lesveh[y] = vehicle.create_vehicle(vehhash, pos, heading, true, false)
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(lesveh[y])
	ui.set_blip_sprite(BlipIDs[#BlipIDs], 742)
	ped.set_ped_into_vehicle(lester[i], lesveh[y], -1)
	vehicle.set_vehicle_on_ground_properly(lesveh[y])
	entity.set_entity_god_mode(lesveh[y], true)
	vehicle.set_vehicle_doors_locked(lesveh[y], 5)
	vehicle.get_vehicle_mod(lesveh[y], 10)
	vehicle.set_vehicle_mod(lesveh[y], 10, 2, false)
	network.request_control_of_entity(lesveh[y])
	ped.set_ped_combat_attributes(lester[i], 46, true)
	ped.set_ped_combat_attributes(lester[i], 52, true)
	ped.set_ped_combat_attributes(lester[i], 1, true)
	ped.set_ped_combat_attributes(lester[i], 2, true)
	ped.set_ped_combat_range(lester[i], 2)
	ped.set_ped_combat_ability(lester[i], 2)
	ped.set_ped_combat_movement(lester[i], 2)
	if ai.task_vehicle_drive_wander(lester[i], lesveh[y], 180, 262144) then
		return HANDLER_CONTINUE
	end
	vehicle.set_vehicle_doors_locked(lesveh[y], 6)
	pos = player.get_player_coords(pid)
	pos.x = pos.x + 8
	pos.y = pos.y + 8
	vehicle.set_vehicle_doors_locked(lesveh[y], 2)
	entity.set_entity_coords_no_offset(lesveh[y], pos)
	vehicle.set_vehicle_on_ground_properly(lesveh[y])
	if attack == 1 then
		ai.task_combat_ped(lester[i], pped, 0, 16)
		else
		if attack == 2 then
			ai.task_vehicle_follow(lester[i], lesveh[y], pped, 220, 262144, 25)
		end
	end
	streaming.set_model_as_no_longer_needed(vehhash)
	streaming.set_model_as_no_longer_needed(model)
end), type = "action_value_str"}
features["sendlestermtk"].feat:set_str_data({"Send Wandering", "Send to Attack!", "Send Stalker"})
features["sendlesterapc"] = {feat = menu.add_feature("APC Lester", "action_value_str", featureVars.lgr.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	local attack = feat.value
	local pped = player.get_player_ped(pid)
	local pos =  get_offset(pid, -8)
	local e = #lester * 3
	local d = 15
	local c = d + e
	pos.x = pos.x + c
	local heading = player.get_player_heading(pid)
	local model = gameplay.get_hash_key("ig_lestercrest_2")
	local vehhash = gameplay.get_hash_key("apc")
	streaming.request_model(model)
	while (not streaming.has_model_loaded(model)) do
		system.wait(10)
	end
	local i = #lester + 1
	lester[i] = ped.create_ped(6, model, pos, heading, true, false)
	ped.set_ped_relationship_group_hash(lester[i], MoistEntRelHash[1])
	ped.set_can_attack_friendly(lester[i], true, false)
	if #groupIDs == nil then
		ped_group_setup()
		else
	end
	if #lester >= 8 then
		local t = #lester / 8
		local j = #groupIDs
		if  t > j then
			ped_group_setup()
			local j = #groupIDs
			local lester_group = groupIDs[j]		
			else
		end
		local lester_group = groupIDs[j]
		else
		local j = #groupIDs - 1
		local lester_group = groupIDs[j]
		ped.set_ped_as_group_member(lester[i], lester_group)
		ped.set_ped_never_leaves_group(lester[i], true)
		if i == 1 or 9 then
			if i == 1 then ped.set_ped_as_group_leader(lester[i], groupIDs[1])
			end
			elseif i == 9 then ped.set_ped_as_group_leader(lester[i], groupIDs[2])
		end
	end
	entity.set_entity_god_mode(lester[i], true)
	streaming.request_model(vehhash)
	while (not streaming.has_model_loaded(vehhash)) do
		system.wait(10)
	end
	local y = #lesveh + 1
	lesveh[y] = vehicle.create_vehicle(vehhash, pos, heading, true, false)
	BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(lesveh[y])
	ui.set_blip_sprite(BlipIDs[#BlipIDs], 558)
	ped.set_ped_into_vehicle(lester[i], lesveh[y], -1)
	vehicle.set_vehicle_on_ground_properly(lesveh[y])
	entity.set_entity_god_mode(lesveh[y], true)
	vehicle.set_vehicle_doors_locked(lesveh[y], 5)
	vehicle.get_vehicle_mod(lesveh[y], 10)
	vehicle.set_vehicle_mod(lesveh[y], 10, 0, false)
	network.request_control_of_entity(lesveh[y])
	ped.set_ped_combat_attributes(lester[i], 46, true)
	ped.set_ped_combat_attributes(lester[i], 52, true)
	ped.set_ped_combat_attributes(lester[i], 1, true)
	ped.set_ped_combat_attributes(lester[i], 2, true)
	ped.set_ped_combat_range(lester[i], 2)
	ped.set_ped_combat_ability(lester[i], 2)
	ped.set_ped_combat_movement(lester[i], 2)
	if ai.task_vehicle_drive_wander(lester[i], lesveh[y], 180, 262144) then
		system.wait(10)
	end
	local i = #lester + 1
	lester[i] = ped.create_ped(6, model, pos, heading, true, false)
	if #groupIDs == nil then
		ped_group_setup()
		else
	end
	if #lester >= 8 then
		local t = #lester / 8
		local j = #groupIDs
		if  t > j then
			ped_group_setup()
			local j = #groupIDs
			local lester_group = groupIDs[j]		
			else
		end
		local lester_group = groupIDs[j]
		else
		local j = #groupIDs - 1
		local lester_group = groupIDs[j]
		ped.set_ped_as_group_member(lester[i], lester_group)
		ped.set_ped_never_leaves_group(lester[i], true)
		if i == 1 or 9 then
			if i == 1 then ped.set_ped_as_group_leader(lester[i], groupIDs[1])
			end
			elseif i == 9 then ped.set_ped_as_group_leader(lester[i], groupIDs[2])
		end
	end
	entity.set_entity_god_mode(lester[i], true)
	ped.set_ped_combat_attributes(lester[i], 52, true)
	ped.set_ped_combat_attributes(lester[i], 1, true)
	ped.set_ped_combat_attributes(lester[i], 46, true)
	ped.set_ped_combat_attributes(lester[i], 2, true)
	ped.set_ped_combat_range(lester[i], 2)
	ped.set_ped_combat_ability(lester[i], 2)
	ped.set_ped_combat_movement(lester[i], 2)
	ped.set_ped_into_vehicle(lester[i], lesveh[y], 0)
	vehicle.set_vehicle_doors_locked(lesveh[y], 6)
	pos = player.get_player_coords(pid)
	pos.x = pos.x + 8
	pos.y = pos.y + 8
	vehicle.set_vehicle_doors_locked(lesveh[y], 2)
	entity.set_entity_coords_no_offset(lesveh[y], pos)
	if attack == 1 then
		ai.task_combat_ped(lester[i], pped, 0, 16)
		else
		if attack == 2 then
			local i = #lester - 1
			ai.task_vehicle_follow(lester[i], lesveh[y], pped, 220, 262144, 25)
		end
	end
	streaming.set_model_as_no_longer_needed(vehhash)
	streaming.set_model_as_no_longer_needed(model)
end), type = "action_value_str"}
features["sendlesterapc"].feat:set_str_data({"Send Wandering", "Send to Attack!", "Send Stalker"})
--INFO: God Check Auto Function
pulsecount = 0
features["PBPulse"] = {feat = menu.add_feature("Pulse Playerbar", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		Players[pid].pulse = true
		system.wait(1000)
		repeat
			pulsecount = pulsecount + 1	
		until pulsecount == 1000
		pulsecount = 0
		Players[pid].pulse = false
		system.wait(1000)
		return HANDLER_CONTINUE
	end
end),  type = "toggle", callback = function()
end}
features["PBPulse"].feat["on"] = false
features["PBPulse"].feat["hidden"] = true
--TODO: Missile check feature
features["Find_Missiles"] = {feat = menu.add_feature("Find Missiles", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end	
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		Get_Missile_Entity(pid)
		system.yield(5)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Find_Missiles"].feat["on"] = false
features["Find_Missiles"].feat["hidden"] = true

features["MissileCheck"] = {feat = menu.add_feature("Check Missiles", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		if not player.is_player_valid(pid) then return end
		BruteForce_RemoveBlips()
		playerFeatures[pid].features["Find_Missiles"].feat["on"] = false
		playerFeatures[pid].features["MissileCheck"].feat["on"] = false
		for pid = 0, 31 do
			if Players[pid].ActiveMissile then
				Players[pid].ActiveMissile = false
			end
		end
		for i = 1, #BlipIDs do
			ui.remove_blip(BlipIDs[i])
		end
		return HANDLER_POP
	end	
	if not player.is_player_valid(pid) then return end
	if not ai.is_task_active(player.get_player_ped(pid), 135) then
		playerFeatures[pid].features["Find_Missiles"].feat["on"] = false
		BruteForce_RemoveBlips()
		MissileBlip[pid+1] = nil
		playerFeatures[pid].features["MissileCheck"].feat["on"] = false
	end
	playerFeatures[pid].features["Find_Missiles"].feat["on"] = true
	return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["MissileCheck"].feat["on"] = false
features["MissileCheck"].feat["hidden"] = true
features["GetKiller"] = {feat = menu.add_feature("GetKiller", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	if Players[pid].isDead then
		if not utils.file_exists(Paths.Logs .. "\\combat.log") then
			Debug_Out("Date&Time, Player Killer, Killed Player" , false, "combat.log")
		end
		pped1 = player.get_player_ped(pid)
		femped1 = player.is_player_female(pid) and "Killed Her Self!" or "Killed Him Self!"
		name1 = tostring(player.get_player_name(pid))
		for pid2 = 0, 31 do
			if player.is_player_valid(pid2) then
				system.yield(1)
				pped2 = player.get_player_ped(pid2)
				name2 = tostring(player.get_player_name(pid2))
				if entity.has_entity_been_damaged_by_entity(pped1, pped2) then
					if player.is_player_god(pid2) then
						Players[pid2].PlayerGodMode = true
					end
					Session_Combat[pid2].kills[pid] = (Session_Combat[pid2].kills[pid]) + 1
					Session_Combat[pid].killed[pid2] = (Session_Combat[pid].killed[pid2]) + 1
					if pid == pid2 then
						text = tostring(", " .. name2 .. " , " .. femped1)
						if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
							if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
								menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
							end
							elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then
							Debug_Out(text, true, "combat.log")
							elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
							if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
								menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
							end
							Debug_Out(text, true, "combat.log")
							system.wait(0)
						end
						elseif pid ~= pid2 then
						text = tostring(", " .. name2 .. " , " .. name1)
						if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
							if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
								menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
							end
							elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then  
							Debug_Out(text, true, "combat.log")
							elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
							if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
								menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
							end
							Debug_Out(text, true, "combat.log")
							system.wait(0)
						end
					end
					system.yield(0)
				end
				system.yield(0)
			end
			system.yield(0)
		end
		system.yield(0)
	end
	system.yield(1)
	return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["GetKiller"].feat["on"] = false
features["GetKiller"].feat["hidden"] = true
features["GodCheck"] = {feat = menu.add_feature("God Mode Check", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		playerFeatures[pid].features["interiortest"].feat["on"]  = false
		return HANDLER_POP
	end
	playerFeatures[pid].features["interiortest"].feat["on"]  = true
	local name = player.get_player_name(pid)
	local check, pos1, pos2 = 0, v3(), v3()
	if not player.is_player_valid(pid) then return end
	if Players[pid].PedSpawned then
		system.wait(15000)
		if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not Players[pid].isRC --[[and Players[pid].PedSpawned == true]]  then
			d = os.date()
			stdtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
			pos1 = player.get_player_coords(pid)
		end
		system.wait(1000)
		if pos1 == v3(0.0,0.0,0.0) then return end
		if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) --[[and Players[pid].PedSpawned == true]] then
			d = os.date()
			enddtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
			pos2 = player.get_player_coords(pid)
			check = Get_Dist2D_POS2POS(pos1, pos2)
			--print(check)
		end
		if check > 11.00 and Players[pid].isint ~= true and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and not Players[pid].isRC --[[and Players[pid].PedSpawned == true]] then
			ModderAudio_notify_thread["on"] = true
			moist_notify("Player Failed Position to Position Check:\n" .. pid .. " : " .. name.. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection")
		end
		elseif  not Players[pid].PedSpawned then
		system.wait(8000)
		elseif not Players[pid].PedSpawned then
		system.wait(45000)
	end
	return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["GodCheck"].feat["on"] = false
features["GodCheck"].feat["hidden"] = true
features["RemoveModflagging"] = {feat = menu.add_feature("AutoRemove Flagging", "value_i", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		if not player.is_player_valid(pid) then return end
		if feat.value == 0 then
			player.unset_player_as_modder(pid, Settings["RemoveModFlag"])
			if not Players[pid].IsFlagRemNotif then
				moist_notify("Removed Flag from: " .. tostring(player.get_player_name(pid)), "Moist Automated\nModder Flag Removal")
				Players[pid].IsFlagRemNotif = true
			end
			elseif feat.value == 1 then
			player.is_player_modder(pid, Settings["KickModFlag"])
			player.unset_player_as_modder(pid, Settings["KickModFlag"])
		end
		system.yield(0)
	end
	system.yield(0)
end),  type = "toggle", callback = function()
end}
features["RemoveModflagging"].feat["on"] = false
features["RemoveModflagging"].feat["max"] = 1
features["RemoveModflagging"].feat["min"] = 0
features["RemoveModflagging"].feat["value"] = 0
features["RemoveModflagging"].feat["hidden"] = true
local loopcnt = 0
features["pos2pos"] = {feat = menu.add_feature("Point to Point Test", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	local name = player.get_player_name(pid)
	local check, pos1, pos2 = 0, v3(), v3()
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		d = os.date()
		stdtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
		pos1 = player.get_player_coords(pid)
		--end
		system.wait(3000)
		if pos1 == v3(0.0,0.0,0.0) then return end
		d = os.date()
		enddtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
		pos2 = player.get_player_coords(pid)
		check = Get_Dist2D_POS2POS(pos1, pos2)
		repeat
			loopcnt = loopcnt + 1
			if not feat["on"] then
				loopcnt = 45000
			end
			system.yield(0)
		until loopcnt == 45000
		loopcnt = 0
		--end
		return HANDLER_CONTINUE
	end
end),  type = "toggle", callback = function()
end}
features["pos2pos"].feat["on"] = false
features["pos2pos"].feat["hidden"] = true
--BUG: **** Interior Check Loop ****
features["interiortest"] = {feat = menu.add_feature("Interior Test", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local name = player.get_player_name(pid)
	local apartmen, interiorr, founda, foundb
	local pped = player.get_player_ped(pid)
	local pos1, pos2 = v2(), v2()
	local pos, intpos, pos2
	while feat["on"] do
		if not player.is_player_valid(pid) then return end
		Zon1, Zon2 = Entity_Zone_Info(pped)
		if Zon1 == nil then
			for y = 1, #Zone_LongNames do
				if entity.is_entity_in_zone(pped, Zone_LongNames[y][1]) then
					for i = 1, #interiors[Zone_LongNames[y][1]] do
						pos = player.get_player_coords(pid)
						intpos = interiors[Zone_LongNames[y][1]][i][2]
						--pos2 = interiors[Zon][i][2]
						local apartmen = pos:magnitude(intpos)
						--local apartm = pos:magnitude(pos2)
						system.yield(0)
						if apartmen < 50  then
							founda = true
							Players[pid].isint, Players[pid].Interiorname, Position, Players[pid].Zone, Players[pid].intID  =  true, tostring(interiors[Zone_LongNames[y][1]][i][1]), tostring(interiors[Zone_LongNames[y][1]][i][2]), Zone_LongNames[y][2], (i)
							goto NextP
							else
							Players[pid].Interiorname = ""
						end
						system.yield(0)
					end
					if founda ~= true then
						Players[pid].isint, Players[pid].Interiorname, Players[pid].Zone, Players[pid].intID  =  false, "", nil, nil
					end
				end
				founda = false
			end
		end
		system.yield(0)
		::NextP::
		for i = 1, #onlineinteriors do
			local pos = player.get_player_coords(pid)
			local intpos = onlineinteriors[i][2]
			local apartmen = pos:magnitude(intpos)
			if apartmen < 25 then
				foundb = true
				Players[pid].onlinecheck, Players[pid].online_interior, Players[pid].onlineintID = true, tostring(onlineinteriors[i][1]), (i)
				goto NextR
				else
				Players[pid].online_interior = ""
			end
			system.yield(0)
		end
		if foundb ~= true then
			Players[pid].onlinecheck, Players[pid].online_interior, Players[pid].onlineintID = false, "", nil
		end
		foundb = false
		system.yield(0)
	end
	::NextR::
	system.yield(0)
	return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["interiortest"].feat["on"] = false
features["interiortest"].feat["hidden"] = false
features["interiortest2"] = {feat = menu.add_feature("Interior Test", "toggle", featureVars.f.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local name = player.get_player_name(pid)
	local apartmen, interiorr, founda, foundb
	local pped = player.get_player_ped(pid)
	local pos1, pos2 = v2(), v2()
	local pos, intpos, pos2
	while feat["on"] do
		if not player.is_player_valid(pid) then return end
		for y = 1, #zones do
			if entity.is_entity_in_zone(pped, zones[y]) then
				for i = 1, #interiors[zones[y]] do
					pos = player.get_player_coords(pid)
					intpos = interiors[zones[y]][i][2]
					--pos2 = interiors[Zon][i][2]
					pos1 = v2(pos.x,pos.y)
					pos2 = v2(intpos.x,intpos.y)
					local apartmen = pos1:magnitude(pos2)
					--local apartmen = pos:magnitude(intpos)
					--local apartm = pos:magnitude(pos2)
					--system.yield(0)
					if apartmen < 25  then
						founda = true
						Players[pid].isint, Players[pid].Interiorname, Position, Players[pid].Zone, Players[pid].intID  =  true, tostring(interiors[zones[y]][i][1]), tostring(interiors[zones[y]][i][2]), Zon, (i)
						playerFeatures[pid].features["interiortest"].feat["on"]  = true
						goto NextP
					end
					system.yield(0)
				end
				if founda ~= true then
					playerFeatures[pid].features["interiortest"].feat["on"]  = false
					Players[pid].isint, Players[pid].Interiorname, Players[pid].Zone, Players[pid].intID  =  false, "", nil, nil
				end
			end
			founda = false
		end
		::NextP::
		system.yield(0)
		--system.yield(0)
	end
	--system.yield(0)
	return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["interiortest2"].feat["on"] = false
features["interiortest2"].feat["hidden"] = false
--INFO: Vehicle Options
local decorator_typetable = {"DECOR_TYPE_FLOAT", "DECOR_TYPE_BOOL", "DECOR_TYPE_INT", "DECOR_TYPE_UNK", "DECOR_TYPE_TIME"}
local DecorAddFeat, DecorFeat, Bool_Value, Bool_Bool = {}, {}, {"true", "false"},  {true, false}
local function vehdecor()
	for d = 1, #decorators do
		decor_typetable = decorator_typetable
		decor_type = {"float", "bool", "int", "unk", "time"}
		DecorType, typenum = decoratorType[decorators[d][2]], decorators[d][2]
		decor = tostring(decorators[d][1])
		features[decor] = {feat = menu.add_feature(d ..": " .. decor, "parent", featureVars.vd.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
		end), type = "parent", callback = function()
		end}
		Decor_feat = features[decor].feat
		features["DecorCheckCustype"] = {feat =  menu.add_feature("Check for Decorator", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval
			local plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
				decor = tostring(decorators[d][1])
				Type = {"float", "bool", "int", "unk", "time"}
				exists = decorator.decor_exists_on(plyveh, decor)
				local decorget = {}
				decorget[1] = decorator.decor_get_float
				decorget[2] = decorator.decor_get_bool
				decorget[3] = decorator.decor_get_int
				decorget[4] = decorator.decor_get_int
				decorget[5] = decorator.decor_get_int
				if exists then
					decorval = decorget[feat.value + 1](plyveh, decor)
					moist_notify("Decorator Exists on Vehicle | " .. string.lower(Type[feat.value + 1]) .. " | " .. tostring(decorval), "")
					--moist_notify(decor .." Exists\n" .. string.lower(Type[feat.value + 1]) .." Value is: " .. tostring(decorval), "Decorator Check")
					elseif not exists then
					moist_notify("Decorator | " .. decor .. " |  Does Not Exist on Vehicle", "")
					--moist_notify(decor .." Does not Exist", "Decorator Check")
				end
			end		
		end),  type = "action_value_str", callback = function()
		end}
		features["DecorCheckCustype"].feat:set_str_data(decor_typetable)
		--  if decorators[d][2] == 2 then
		features["SetBool"] = {feat = menu.add_feature("Set BOOL Decor on Vehicle as: ", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval, nplyhash, plyveh
			plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
				decor = tostring(decorators[d][1])
				Type = decoratorType[decorators[d][2]]
				nplyhash = network.network_hash_from_player(pid)
				if not network.has_control_of_entity(plyveh) then
					network.request_control_of_entity(plyveh)
					return HANDLER_CONTINUE
				end
				decorator.decor_register(decor, 2)
				network.request_control_of_entity(plyveh)
				decorator.decor_set_bool(plyveh, decor, Bool_Bool[feat.value + 1])
				decorval = tostring(decorator.decor_get_bool(plyveh, decor))
				moist_notify("Decorator Exists on Vehicle | " .. decor .. " | " .. decorval, "")
			end
		end),  type = "action_value_str", callback = function()
		end}
		features["SetBool"].feat:set_str_data(Bool_Value)
		features["RemDecor"] = {feat = menu.add_feature("Remove Decorator from Vehicle", "action", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local plyveh, decor
			decor = decorators[d][1]
			plyveh = player.get_player_vehicle(pid)
			if not network.has_control_of_entity(plyveh) then
				network.request_control_of_entity(plyveh)
				return HANDLER_CONTINUE
			end
			decorator.decor_remove(plyveh, decor)
			local existson = decorator.decor_exists_on(plyveh, decor) 
			moist_notify("Decorator Removed", decor)
		end),  type = "action", callback = function()
		end}
		features["add_decor_custype"] = {feat = menu.add_feature("Add Decorator to Vehicle", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval, nplyhash, plyveh, InputType, InputPreset, val
			local decor_type = {"float", "bool", "int", "unk", "time"}
			local decorset = {}
			decorset[1] = decorator.decor_set_float
			decorset[2] = decorator.decor_set_bool
			decorset[3] = decorator.decor_set_int 
			decorset[4] = decorator.decor_set_int
			decorset[5] = decorator.decor_set_time
			plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
				decor = tostring(decorators[d][1])
				Type = decoratorType[feat.value + 1]
				if feat.value + 1 == 1 then
					InputType = 5
					InputPreset = tonumber(321.445)
					elseif feat.value + 1 == 2 then
					InputType = 1
					InputPreset = "true"
					elseif feat.value + 1 == 3 then
					InputType = 3
					InputPreset = network.network_hash_from_player(pid)
					elseif feat.value + 1 == 4 then
					InputType = 3
					InputPreset = math.random(0, 65535)
					elseif feat.value + 1 == 5 then
					InputType = 2
					InputPreset = utils.time()
				end
				Decor_example = {"float:NumDot(1234.5678)", "Bool:(<true|false>)", "INT:Num(1234)", "UNK:Unavailable", "Time: " .. utils.time()}
				Type_input = string.format(Decor_example[feat.value + 1])
				nplyhash = network.network_hash_from_player(pid)
				local r,s = input.get("Input DecorValue:" .. Type_input, InputPreset, 96, InputType)
				if r == 1 then
					return HANDLER_CONTINUE
				end
				if r == 2 then
					return HANDLER_POP
				end
				network.request_control_of_entity(plyveh)
				decorator.decor_register(decor, 1)
				if feat.value + 1 == 2 and s == "true" then
					val = true
					elseif feat.value + 1 == 2 and s == "false" then
					val = false
					else
					val = s
				end
				if not network.has_control_of_entity(plyveh) then
					network.request_control_of_entity(plyveh)
					return HANDLER_CONTINUE
				end
				decorset[feat.value + 1](plyveh, decor, val)
			end
		end),  type = "action_value_str", callback = function()
		end}
		features["add_decor_custype"].feat:set_str_data(decoratorType)
	end
end
vehdecor()
local function Ped_Decor()
	for i = 1, #decorators do
		local decor_typetable = decorator_typetable
		local decor_type = {"float", "bool", "int", "unk", "time"}
		local DecorType, typenum = decoratorType[decorators[i][2]], decorators[i][2]		
		local decor = tostring(decorators[i][1])
		local y = #DecorFeat + 1
		local Decor_feat = DecorFeat[y]
		Decor_feat = menu.add_feature(i ..": " .. decor, "parent", featureVars.pd.id)
		local DecorCheckCustype = menu.add_feature("Check for Decorator", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval
			local pped = player.get_player_ped(pid)
			if pped ~= nil or pped ~= 0 then
				decor = tostring(decorators[i][1])
				Type = {"float", "bool", "int", "unk", "time"}
				exists = decorator.decor_exists_on(pped, decor)
				local decorget = {}
				decorget[1] = decorator.decor_get_float
				decorget[2] = decorator.decor_get_bool
				decorget[3] = decorator.decor_get_int
				decorget[4] = decorator.decor_get_int
				decorget[5] = decorator.decor_get_int
				if exists then
					decorval = decorget[feat.value + 1](pped, decor)
					moist_notify(decor .." Exists\n" .. string.lower(Type[feat.value + 1]) .." Value is: " .. tostring(decorval), "Decorator Check")
					elseif not exists then
					moist_notify(decor .." Does not Exist", "Decorator Check")
				end
			end
		end)
		DecorCheckCustype:set_str_data(decor_typetable)
		--  if decorators[i][2] == 2 then
		local f = menu.add_feature("Set BOOL Decor on Ped as: ", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval, nplyhash, pped
			pped = player.get_player_ped(pid)
			if pped ~= nil or pped ~= 0 then
				decor = tostring(decorators[i][1])
				Type = decoratorType[decorators[i][2]]
				nplyhash = network.network_hash_from_player(pid)
				while not network.has_control_of_entity(pped) do
					network.request_control_of_entity(pped)
					system.wait(10)
				end
				decorator.decor_register(decor, 2)
				decorator.decor_set_bool(pped, decor, Bool_Bool[feat.value + 1])
				decorval = tostring(decorator.decor_get_bool(pped, decor))
				moist_notify(decor .." Exists on Ped\n", decorval, "Decorator Check")
			end
		end)
		f:set_str_data(Bool_Value)
		--  end
		menu.add_feature("Remove Decorator from Ped", "action", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local pped, decor
			decor = decorators[i][1]
			pped = player.get_player_ped(pid)
			-- while not network.has_control_of_entity(pped) do
			-- network.request_control_of_entity(pped)
			-- system.wait(10)
			-- end
			decorator.decor_remove(pped, decor)
			moist_notify("Decorator Removed", decor)
		end)
		local add_decor_custype = menu.add_feature("Add Decorator to Ped", "action_value_str", Decor_feat.id, function(feat)
			if type(feat) == "number" then
				return HANDLER_POP
			end
			local decor, Type, exists, decorval, nplyhash, pped, InputType, InputPreset, val
			local decor_type = {"float", "bool", "int", "unk", "time"}
			local decorset = {}
			decorset[1] = decorator.decor_set_float
			decorset[2] = decorator.decor_set_bool
			decorset[3] = decorator.decor_set_int
			decorset[4] = decorator.decor_set_int
			decorset[5] = decorator.decor_set_time
			pped = player.get_player_ped(pid)
			if pped ~= nil or pped ~= 0 then
				decor = tostring(decorators[i][1])
				Type = decoratorType[feat.value + 1]
				if feat.value + 1 == 1 then
					InputType = 5
					InputPreset = tonumber(321.445)
					elseif feat.value + 1 == 2 then
					InputType = 1
					InputPreset = "true"
					elseif feat.value + 1 == 3 then
					InputType = 3
					InputPreset = network.network_hash_from_player(pid)
					elseif feat.value + 1 == 4 then
					InputType = 3
					InputPreset = math.random(0, 65535)
					elseif feat.value + 1 == 5 then
					InputType = 2
					InputPreset = utils.time()
				end
				Decor_example = {"float:NumDot(1234.5678)", "Bool:(<true|false>)", "INT:Num(1234)", "UNK:Unavailable", "Time: " .. utils.time()}
				Type_input = string.format(Decor_example[feat.value + 1])
				nplyhash = network.network_hash_from_player(pid)
				local r,s = input.get("Input DecorValue:" .. Type_input, InputPreset, 96, InputType)
				if r == 1 then
					return HANDLER_CONTINUE
				end
				if r == 2 then
					return HANDLER_POP
				end
				--	network.request_control_of_entity(pped)
				decorator.decor_register(decor, 1)
				if feat.value + 1 == 2 and s == "true" then
					val = true
					elseif feat.value + 1 == 2 and s == "false" then
					val = false
					else
					val = s
				end
				decorset[feat.value + 1](pped, decor, val)
			end
		end)
		add_decor_custype:set_str_data(decoratorType)
	end
end
Ped_Decor()
features["decorabuse"] = {feat = menu.add_feature("Player Vehicle Decorator Abuse", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local plyveh, Tveh
	plyveh = player.get_player_vehicle(pid)
	local playern = network.network_hash_from_player(pid)
	if plyveh == nil or plyveh == 0 then
		local pos = get_offset(pid, 10)
		local head = player.get_player_heading(pid)
		vehhash = gameplay.get_hash_key("scramjet")
		streaming.request_model(vehhash)
		if not network.has_control_of_entity(plyveh) then
			network.request_control_of_entity(plyveh)
			return HANDLER_CONTINUE
		end
		spawned_cunts[#spawned_cunts + 1] = vehicle.create_vehicle(vehhash, pos, head, true, false)
		streaming.set_model_as_no_longer_needed(vehhash)
		network.request_control_of_entity(spawned_cunts[#spawned_cunts])
		Tveh = spawned_cunts[#spawned_cunts]
	end
	Tveh =  Tveh or plyveh
	for i = 1, #Decorators do
		network.request_control_of_entity(Tveh)
		decorator.decor_register(Decorators[i], 3)
		decorator.decor_set_int(Tveh, Decorators[i], playern)
	end
	return HANDLER_POP
end),  type = "action", callback = function()
end}

features["godvehon"] = {feat = menu.add_feature("Player Vehicle God Mode ON", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	while not network.has_control_of_entity(plyveh) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	entity.set_entity_god_mode(plyveh, true)
	return HANDLER_POP
end),  type = "action", callback = function()
end}
features["godvehoff"] = {feat = menu.add_feature("Player Vehicle God Mode OFF", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	while not network.has_control_of_entity(plyveh) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	entity.set_entity_god_mode(plyveh, false)
	return HANDLER_POP
end),  type = "action", callback = function()
end}
features["Veh_Gift"] = {feat = menu.add_feature("Gift Current Vehicle", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	while not network.has_control_of_entity(plyveh) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	
	decorator.decor_set_int(plyveh, "Player_Vehicle", network.network_hash_from_player(pid))
	decorator.decor_set_int(plyveh, "PYV_Owner", network.network_hash_from_player(pid))
	decorator.decor_set_int(plyveh, "PYV_Vehicle", network.network_hash_from_player(pid))
	
	return HANDLER_POP
end),  type = "action", callback = function()
end}
local achieved, count = false, 0
features["tog_godvehoff"] = {feat = menu.add_feature("Force Control & God Mode OFF", "toggle", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		plyveh = player.get_player_vehicle(pid)
		network.request_control_of_entity(plyveh)
		system.wait(10)
		if not network.has_control_of_entity(plyveh) then
			network.request_control_of_entity(plyveh)
			system.wait(10)
			entity.set_entity_god_mode(plyveh, false)
			elseif network.has_control_of_entity(plyveh) then
			achieved = true
			entity.set_entity_god_mode(plyveh, false)
			if count <= 1 then
				moist_notify("Control achieved", "Vehicle Control Request")
			end
		end
		if achieved == true and count >= 20000 then
			count = 0
			elseif achieved == true and count < 20000 then
			count = count + 1
		end
		return HANDLER_CONTINUE
	end
	achieved = false
	count = 0
	return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["tog_godvehoff"].feat["on"] = false
features["LockOn"] = {feat = menu.add_feature("Vehicle Targetable", "toggle",  featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		if not player.is_player_valid(pid) then return end
		plyveh = player.get_player_vehicle(pid)
		while not network.has_control_of_entity(plyveh) do
			network.request_control_of_entity(plyveh)
			system.wait(10)
		end
		vehicle.set_vehicle_can_be_locked_on(plyveh,true, true)
		system.yield(0)
	end
	return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["LockOFF"] = {feat = menu.add_feature("Vehicle Not Targetable", "action",  featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	while not network.has_control_of_entity(plyveh) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	vehicle.set_vehicle_can_be_locked_on(plyveh, false, false)
	return HANDLER_POP
end), type = "action", callback = function()
end}
features["set_Boost"] = {feat = menu.add_feature("Set Boost & Forward Speed", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	if plyveh ~= nil then
		network.request_control_of_entity(plyveh)
		vehicle.set_vehicle_rocket_boost_active(plyveh, true)
		vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
	end
	network.request_control_of_entity(plyveh)
	vehicle.set_vehicle_rocket_boost_active(plyveh, true)
	vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end), type = "action"}
features["set_Boost2"] = {feat = menu.add_feature("Set Boost & Forward Speed v2", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	if plyveh ~= nil then
		network.request_control_of_entity(plyveh)
		vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
	end
	network.request_control_of_entity(plyveh)
	vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end), type = "action"}
features["set_speed"] = {feat = menu.add_feature("Force Forward Speed: 90000", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	if plyveh ~= nil then
		network.request_control_of_entity(plyveh)
		system.wait(10)
		vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
		vehicle.set_vehicle_forward_speed(plyveh, 90000.00)
		vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
		--
		vehicle.set_vehicle_forward_speed(plyveh, 9000.00)
	end
	vehicle.set_vehicle_forward_speed(plyveh, 9000.00)
end), type = "action"}
features["vehicleexplode1"] = {feat = menu.add_feature("Vehicle Explode OnImpact", "toggle", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		plyveh = player.get_player_vehicle(pid)
		if plyveh ~= nil then
			network.request_control_of_entity(plyveh)
			vehicle.set_vehicle_out_of_control(plyveh, false, true)
		end
		network.request_control_of_entity(plyveh)
		vehicle.set_vehicle_rocket_boost_percentage(plyveh, 100)
		vehicle.set_vehicle_rocket_boost_active(plyveh, true)
		vehicle.set_vehicle_out_of_control(plyveh, false, true)
		vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
	end
	return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["vehicleexplode2"] = {feat = menu.add_feature("Vehicle Explode OnImpact v2", "toggle", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		plyveh = player.get_player_vehicle(pid)
		if plyveh ~= nil then
			network.request_control_of_entity(plyveh)
			vehicle.set_vehicle_out_of_control(plyveh, false, true)
		end
		network.request_control_of_entity(plyveh)
		vehicle.set_vehicle_out_of_control(plyveh, false, true)
		vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
	end
	return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["vehspdslow"] = {feat = menu.add_feature("Set Max Speed 5", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
	playervehspd(pid, 5.0)
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehspdcust"] = {feat = menu.add_feature("Input Custom Max Speed", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local r,s = input.get("Enter a Speed value:", "0.0001", 64, 5)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
	playervehspd(pid, s)
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehspdfast"] = {feat = menu.add_feature("Reset Max Speed", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
	playervehspd(pid, 9000000.0)
	vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehaddexpl"] = {feat = menu.add_feature("Add Explosive Device", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	if plyveh == 0 or nil then
		return
	end
	while not (network.has_control_of_entity(plyveh)) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	vehicle.add_vehicle_phone_explosive_device(plyveh)
end), type = "action"}
features["vehdetonate"] = {feat = menu.add_feature("Detonate Explosive Device (named)", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	--print(vehicle.has_vehicle_phone_explosive_device())
	if vehicle.has_vehicle_phone_explosive_device() then
		vehicle.detonate_vehicle_phone_explosive_device()
	end
end), type = "action"}
features["timedexp"] = {feat = menu.add_feature("Set Vehicle Timed Explosion", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	pos = v3()
	pos = player.get_player_coords(pid)
	pped = player.get_player_ped(pid)
	plyveh = player.get_player_vehicle(pid)
	audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 10000, false)
	audio.play_sound_from_entity(-1, "Explosion_Countdown", pped, "GTAO_FM_Events_Soundset")
	while not network.has_control_of_entity(plyveh) do
		network.request_control_of_entity(plyveh)
		system.wait(10)
	end
	vehicle.set_vehicle_timed_explosion(plyveh, pped, true)
end), type = "action"}
features["boostlag"] = {feat = menu.add_feature("Lag Vehicle Boost Refill", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	vehicle.set_vehicle_rocket_boost_active(plyveh, true)
	vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 999999.999999999999)
end), type = "action"}
features["boostrefill"] = {feat = menu.add_feature("Fast Vehicle Boost Refill", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 0.0000010)
end), type = "action"}
features["nomissmk2"] = {feat = menu.add_feature("Set MK2 Machineguns Only", "action", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not player.is_player_valid(pid) then return end
	pped = player.get_player_ped(pid)
	plyveh = player.get_player_vehicle(pid)
	if plyveh ~= nil then
		network.request_control_of_entity(plyveh)
	end
	network.request_control_of_entity(plyveh)
	vehicle.set_vehicle_mod_kit_type(plyveh, 0)
	vehicle.get_vehicle_mod(plyveh, 10)
	vehicle.set_vehicle_mod(plyveh, 10, -1, false)
end), type = "action"}
features["rapidmk2"] = {feat = menu.add_feature("MK2 Rapid fire", "toggle", featureVars.v.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		plyveh = player.get_player_vehicle(pid)
		if plyveh ~= nil then
			network.request_control_of_entity(plyveh)
		end
		vehicle.set_vehicle_fixed(plyveh)
		vehicle.set_vehicle_deformation_fixed(plyveh)
	end
	return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
--INFO: Highight Controls
features["RGB1"] = {feat = menu.add_feature("fading red white Marker3 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	changRGB["on"] = not changRGB.on
end), type = "action"}
features["RGB1"].feat["on"] = false
features["RGB2"] = {feat = menu.add_feature("flash red white Marker3 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	chang_RGBA["on"] = not chang_RGBA.on
end), type = "action"}
features["RGB2"].feat["on"] = false
features["RGB3"] = {feat = menu.add_feature("multi fading colors Marker 1 2 5 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	changRGBA["on"] = not changRGBA.on
end), type = "action"}
features["RGB3"].feat["on"] = false
features["RGB4"] = {feat = menu.add_feature("Marker 1 2 5 RGB on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	changeRGB["on"] = not changeRGB.on
end), type = "action"}
features["RGB4"].feat["on"] = false
features["RGB5"] = {feat = menu.add_feature("Marker 1 2 5 RGB2 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	change_RGBA["on"] = not change_RGBA.on
end), type = "action"}
features["RGB5"].feat["on"] = false
features["RGB6"] = {feat = menu.add_feature("Marker3 RGBA on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	changeRGBA["on"] = not changeRGBA.on
end), type = "action"}
features["RGB6"].feat["on"] = false
features["RGB7"] = {feat = menu.add_feature("rand rgb Marker3 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	rgb_rand["on"] = not rgb_rand.on
end), type = "action"}
features["RGB7"].feat["on"] = false
features["RGB8"] = {feat = menu.add_feature("rand rgb Marker4 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	rgb_rand1["on"] = not rgb_rand1.on
end), type = "action"}
features["RGB8"].feat["on"] = false
features["RGB9"] = {feat = menu.add_feature("RGB Marker4 on/off", "action", featureVars.chc.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	marker1_rgbd["on"] = not marker1_rgbd.on
end), type = "action"}
features["RGB9"].feat["on"] = false
--INFO: active marker
features["Mark_Control"] = {feat = menu.add_feature("Marker ID  to Control", "value_i", featureVars.ch.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] then
		actM = feat.value + pid + 1
		return HANDLER_CONTINUE
	end
end), type = "toggle"}
features["Mark_Control"].feat["on"] = false
features["Mark_Control"].feat["max"] = 5
features["Mark_Control"].feat["min"] = 1
features["RGB_OFF"] = {feat = menu.add_feature("Turn off all RGB Changers", "action", featureVars.h.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	changeRGBA["on"] = false
	change_RGBA["on"] = false
	changeRGB["on"] = false
	changRGBA["on"] = false
	chang_RGBA["on"] = false
	changRGB["on"] = false
end), type = "action"}
features["cprecision"] = {feat = menu.add_feature("Precision Multipliers", "toggle", featureVars.ch.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end end), type = "toggle"}
	features["MarkSize"] = {feat = menu.add_feature("Marker Size Muliplier", "action_value_f", featureVars.ch.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not playerFeatures[pid].features["Mark_Control"].feat["on"] then return end
		if features["cprecision"].feat["on"] then
			size_marker = tonumber(feat.value / 100)
			markID.s[actM] = size_marker
			else
			size_marker = tonumber(feat.value / 2)
			markID.s[actM] = size_marker
		end
	end), type = "action_value_f"}
	features["MarkSize"].feat["max"] = 3000.100
	features["MarkSize"].feat["min"] = 0.001
	features["MarkSize"].feat["value"] = 2.000
	features["MarkZoff"] = {feat = menu.add_feature("Marker Z Offset Multiplier", "action_value_f", featureVars.ch.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not playerFeatures[pid].features["Mark_Control"].feat["on"] then return end
		if features["cprecision"].feat["on"] then
			offsetz_marker = tonumber(feat.value / 100)
			markID.z[actM] = offsetz_marker
			else
			offsetz_marker = tonumber(feat.value / 2)
			markID.z[actM] = offsetz_marker
		end
	end), type = "action_value_i"}
	features["MarkZoff"].feat["max"] = 30000.100
	features["MarkZoff"].feat["min"] = -3000.100
	features["MarkZoff"].feat["value"] = 1.100
	features["BOB_Marker"] = {feat = menu.add_feature("Bob Marker Up & Down", "toggle", featureVars.ch.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not playerFeatures[pid].features["Mark_Control"].feat["on"] then return end
		BobUPnDown = true
		local i = actM
		markID.BOB[i]  = BobUPnDown
		if feat["on"] then
			return HANDLER_CONTINUE
		end BobUPnDown = false
		markID.BOB[i] = BobUPnDown
		return HANDLER_POP
	end), type = "toggle"}
	features["ROT_Marker"] = {feat = menu.add_feature("Rotate Marker", "toggle", featureVars.ch.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not playerFeatures[pid].features["Mark_Control"].feat["on"] then return end
		ROTMRK = true
		local i = actM
		markID.ROT[i] = ROTMRK
		if feat["on"] then
			return HANDLER_CONTINUE
		end ROTMRK = false
		markID.ROT[i] = ROTMRK
		return HANDLER_POP
	end)}
	featureVars.blip = menu.add_feature("Radar Blips", "parent", featureVars.h.id)
	features["Blipcol"] = {feat =  menu.add_feature("Update Current Blip Colour", "autoaction_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped = player.get_player_ped(pid)
		local oldblip = ui.get_blip_from_entity(pped)
		ui.set_blip_colour(oldblip, feat.value)
	end), type = "autoaction_value_i"}
	features["Blipcol"].feat["max"] = 85
	features["Blipcol"].feat["min"] = 1
	features["Blipcol"].feat["value"] = 1
	features["Blip2col"] = {feat =  menu.add_feature("Add Coloured Blip", "action_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pped = player.get_player_ped(pid)
		local oldblip = ui.get_blip_from_entity(pped)
		ui.set_blip_colour(oldblip, 85)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
		ui.set_blip_colour(BlipIDs[#BlipIDs], feat.value)
	end), type = "action_value_i"}
	features["Blip2col"].feat["max"] = 85
	features["Blip2col"].feat["min"] = 1
	features["Blip2col"].feat["value"] = 1
	features["Blip"] = {feat =  menu.add_feature("Add Radar Blip", "action", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(pid)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
	end), type = "action"}
	features["Blip01"] = {feat =  menu.add_feature("Add Radar Blip", "value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		pped = player.get_player_ped(pid)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
		ui.set_blip_colour(BlipIDs[#BlipIDs], feat.value)
	end), type = "value_i"}
	features["Blip01"].feat["max"] = 85
	features["Blip01"].feat["min"] = 1
	features["Blip01"].feat["value"] = 1
	local blip
	features["Blipv2"] = {feat =  menu.add_feature("Radial Radar Blip", "action_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if blip ~= nil then
			ui.remove_blip(blip)
			blip = nil
		end
		local bliprad = tonumber(feat.value) + 0.001
		blip = ui.add_blip_for_radius(player.get_player_coords(pid), bliprad)
		BlipIDs[#BlipIDs+1] = blip
		ui.set_blip_colour(blip, 79)
		playerFeatures[pid].features["RadBlipUpdate"].feat["on"] = true
		return HANDLER_POP
	end), type = "action"}
	features["Blipv2"].feat["max"] = 1000
	features["Blipv2"].feat["min"] = 1
	features["Blipv2"].feat["value"] = 25
	features["Blip_v2"] = {feat =  menu.add_feature("Radial Radar Blip v2", "action_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local bliprad = tonumber(feat.value) + 0.001
		blip = ui.add_blip_for_radius(player.get_player_coords(pid), bliprad)
		BlipIDs[#BlipIDs+1] = blip
		ui.set_blip_colour(BlipIDs[#BlipIDs], 79)
		playerFeatures[pid].features["RadBlipUpdate"].feat["on"] = true
		return HANDLER_POP
	end), type = "action"}
	features["Blip_v2"].feat["max"] = 1000
	features["Blip_v2"].feat["min"] = 1
	features["Blip_v2"].feat["value"] = 1
	features["Blip_v3"] = {feat =  menu.add_feature("Radial Blip v3 Vehicle", "action_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local bliprad = tonumber(feat.value) + 0.001
		plyveh = player.get_player_vehicle(pid)
		blip = ui.add_blip_for_radius(entity.get_entity_coords(plyveh), bliprad)
		BlipIDs[#BlipIDs+1] = blip
		ui.set_blip_colour(BlipIDs[#BlipIDs], 79)
		return HANDLER_POP
	end), type = "action"}
	features["Blip_v3"].feat["max"] = 10000
	features["Blip_v3"].feat["min"] = 1
	features["Blip_v3"].feat["value"] = 3500
	features["Blip_v3"].feat["mod"] = 1
	features["Blipv2col"] = {feat =  menu.add_feature("Update Radial Blip Colour", "action_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if blip ~= nil then
			for i = 1, #BlipIDs do
				ui.set_blip_colour(BlipIDs[i], feat.value)
			end
		end
	end), type = "action_value_i"}
	features["Blipv2col"].feat["max"] = 120
	features["Blipv2col"].feat["min"] = 1
	features["Blipv2col"].feat["value"] = 1
	features["Blipv2col"] = {feat =  menu.add_feature("Update Radial Blip Colour v2", "autoaction_value_i", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if blip ~= nil then
			ui.set_blip_colour(blip, feat.value)
		end
	end), type = "autoaction_value_i"}
	features["Blipv2col"].feat["max"] = 85
	features["Blipv2col"].feat["min"] = 1
	features["Blipv2col"].feat["value"] = 1
	features["RadBlipUpdate"] = {feat = menu.add_feature("Update Blip v2 Pos", "toggle", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if blip ~= nil then
				ui.set_blip_coord(blip, entity.get_entity_coords(player.get_player_vehicle(pid)))
			end
			return HANDLER_CONTINUE
		end
		if blip ~= nil then
			ui.remove_blip(blip)
			blip = nil
		end
		return HANDLER_POP
	end), type = "toggle"}
	features["RadBlipUpdate"].feat["on"] = false
	features["RadBlipvehUpdate"] = {feat = menu.add_feature("Update Blip v2 Pos", "toggle", featureVars.blip.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if blip ~= nil then
				ui.set_blip_coord(blip, player.get_player_coords(pid))
			end
			return HANDLER_CONTINUE
		end
		if blip ~= nil then
			ui.remove_blip(blip)
			blip = nil
		end
		return HANDLER_POP
	end), type = "toggle"}
	features["RadBlipvehUpdate"].feat["on"] = false
	features["marker_active1"] = {feat =  menu.add_feature("Marker 1 Type:", "value_i", featureVars.h.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local offset, pos = v3(), v3()
			offset.z = markID.z[pid+2]
			local size = markID.s[pid+2]
			local posbool, pped
			pped = player.get_player_ped(pid)
			offset = v3(0.0,0.0,0.0)
			posbool, pos = ped.get_ped_bone_coords(pped, 31086, offset)
			graphics.draw_marker(feat.value, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)
			return HANDLER_CONTINUE
		end
	end), type = "value_i"}
	features["marker_active1"].feat["max"] = 44
	features["marker_active1"].feat["min"] = 0
	features["marker_active1"].feat["value"] = 1
	features["marker_active1"].feat["on"] = false
	features["marker_active2"] = {feat =  menu.add_feature("Marker 2 Type:", "value_i", featureVars.h.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local offset = v3(0.0,0.0,0.0)
			offset.z = markID.z[pid+3]
			local size = markID.s[pid+3]
			local pos = v3()
			local posbool, pped
			pped = player.get_player_ped(pid)
			posbool, pos = ped.get_ped_bone_coords(pped, 31086, offset)
			graphics.draw_marker(feat.value, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)
			return HANDLER_CONTINUE
		end
	end), type = "value_i"}
	features["marker_active2"].feat["max"] = 44
	features["marker_active2"].feat["min"] = 0
	features["marker_active2"].feat["value"] = 43
	features["marker_active2"].feat["on"] = false
	features["marker_active3"] = {feat =  menu.add_feature("Marker 3 Type:", "value_i", featureVars.h.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local offset = v3(0.0,0.0,0.0)
			offset.z = markID.z[pid+4]
			local size = markID.s[pid+4]
			local pos = v3()
			local posbool, pped
			pped = player.get_player_ped(pid)
			posbool, pos = ped.get_ped_bone_coords(pped, 31086, offset)
			graphics.draw_marker(feat.value, pos + offset, v3(), v3(), v3(size), RGBA_R, RGBA_G, RGBA_B, RGBA_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)
			return HANDLER_CONTINUE
		end
	end), type = "value_i"}
	features["marker_active3"].feat["max"] = 44
	features["marker_active3"].feat["min"] = 0
	features["marker_active3"].feat["value"] = 0
	features["marker_active3"].feat["on"] = false
	features["marker_active4"] = {feat =  menu.add_feature("Marker 4 Type:", "value_i", featureVars.h.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local offset = v3(0.0,0.0,0.0)
			offset.z = markID.z[pid+5]
			local size = markID.s[pid+5]
			local pos = v3()
			local posbool, pped
			pped = player.get_player_ped(pid)
			posbool, pos = ped.get_ped_bone_coords(pped, 31086, offset)
			graphics.draw_marker(feat.value, pos + offset, v3(), v3(), v3(size), RGB_A_R, RGB_A_G, RGB_A_B, RGB_A_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)
			return HANDLER_CONTINUE
		end
	end), type = "value_i"}
	features["marker_active4"].feat["max"] = 44
	features["marker_active4"].feat["min"] = 0
	features["marker_active4"].feat["value"] = 29
	features["marker_active4"].feat["on"] = false
	features["marker_active5"] = {feat =  menu.add_feature("Marker 5 (Drawn on Entity) Type:", "value_i", featureVars.h.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local offset = v3(0.0,0.0,0.0)
			offset.z = markID.z[pid+6]
			local size = markID.s[pid+6]
			local pos = v3()
			local posbool, pped
			pped = player.get_player_ped(pid)
			posbool, pos = ped.get_ped_bone_coords(pped, 31086, offset)
			graphics.draw_marker(feat.value, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, true)
			return HANDLER_CONTINUE
		end
	end), type = "value_i"}
	features["marker_active5"].feat["max"] = 44
	features["marker_active5"].feat["min"] = 0
	features["marker_active5"].feat["value"] = 28
	features["marker_active5"].feat["on"] = false
	--INFO: CEO Money
	
	features["ceo_otr"] = {feat = menu.add_feature("OTR", "toggle", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		while feat["on"] do
			if not player.is_player_valid(pid) then return end
			Trigger_Event(-1973627888, pid, pid, (utils.time() - 60), utils.time(), 1, 1, script.get_global_i(1892703 +(1 + (pid * 599)) + 510))
			system.yield(0)
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	
	features["TeleportPlayernext2me"] = {feat = menu.add_feature("Teleport Next 2 Me(old Version)", "toggle", featureVars.t.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local plyveh
			pped = player.get_player_ped(pid)
			local pos = v3()
			pos = player.get_player_coords(player.player_id())
			pos.x = pos.x + 3
			if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
				plyveh = player.get_player_vehicle(pid)
				network.request_control_of_entity(plyveh)
				entity.set_entity_coords_no_offset(plyveh, pos)
				
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["TeleportPlayernext2me"].feat["on"] = false
	features["TeleportPlayerinfront"] = {feat = menu.add_feature("Teleport in front of Me", "toggle", featureVars.t.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local plyveh, pped, pos, me
			pped = player.get_player_ped(pid)
			me = player.player_id()
			pos = get_offset2me(5)
			if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
				plyveh = player.get_player_vehicle(pid)
				network.request_control_of_entity(plyveh)
				entity.set_entity_coords_no_offset(plyveh, pos)
				vehicle.set_vehicle_on_ground_properly(plyveh)
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["TeleportPlayerinfront"].feat["on"] = false
	features["TeleportPlayerBeyondLimits"] = {feat = menu.add_feature("Teleport Beyond World Limits", "toggle", featureVars.t.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local plyveh, pped
			local pos = v3()
			pos.x = presets[1][2]
			pos.y = presets[1][3]
			pos.z = presets[1][4]
			pped = player.get_player_ped(pid)
			if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
				plyveh = player.get_player_vehicle(pid)
				network.request_control_of_entity(plyveh)
				entity.set_entity_coords_no_offset(plyveh, pos)
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["TeleportPlayerBeyondLimits"].feat["on"] = false
	features["Teleport_God-mode_Death"] = {feat = menu.add_feature("Teleport to Death (Ocean Out of World Limits)", "toggle", featureVars.t.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local plyveh, pped
			local pos = v3()
			pos.x = presets[3][2]
			pos.y = presets[3][3]
			pos.z = presets[3][4]
			pped = player.get_player_ped(pid)
			if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
				plyveh = player.get_player_vehicle(pid)
				network.request_control_of_entity(plyveh)
				entity.set_entity_coords_no_offset(plyveh, pos)
			end
		end
		return HANDLER_CONTINUE
	end),  type = "toggle", callback = function()
	end}
	features["Teleport_God-mode_Death"].feat["on"] = false
	features["Teleport_God-mode_Death_2"] = {feat = menu.add_feature("Teleport to Death (KillBarrier)", "toggle", featureVars.t.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local plyveh, pped
			local pos = v3()
			pos.x = presets[2][2]
			pos.y = presets[2][3]
			pos.z = presets[2][4]
			pped = player.get_player_ped(pid)
			if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
				plyveh = player.get_player_vehicle(pid)
				network.request_control_of_entity(plyveh)
				entity.set_entity_coords_no_offset(plyveh, pos)
			end
		end
		return HANDLER_CONTINUE
	end),  type = "toggle", callback = function()
	end}
	features["Teleport_God-mode_Death_2"].feat["on"] = false
	--INFO: Sound Troll
	features["sound_troll1"] = {feat = menu.add_feature("Annoy With Air Drop Sounds", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		if not player.is_player_valid(pid) then return end
		pos = entity.get_entity_coords(player.get_player_ped(pid))
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "Air_Drop_Package", pped, "DLC_SM_Generic_Mission_Sounds", true)
	end), type = "action"}
	features["sound_troll2"] = {feat = menu.add_feature("Annoy With Countdown sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		if not player.is_player_valid(pid) then return end
		pos = entity.get_entity_coords(player.get_player_ped(pid))
		pped = player.get_player_ped(pid)
		audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 1000, false)
		audio.play_sound_from_entity(-1, "Explosion_Countdown", pped, "GTAO_FM_Events_Soundset", true)
	end), type = "action"}
	features["sound_troll3"] = {feat = menu.add_feature("Annoy With Yacht Horn Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		if not player.is_player_valid(pid) then return end
		pos = entity.get_entity_coords(player.get_player_ped(pid))
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1,  "HORN", pped, "DLC_Apt_Yacht_Ambient_Soundset", true)
		audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 1000000, false)
	end), type = "action"}
	features["sound_troll4"] = {feat = menu.add_feature("Annoy With Chaff Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		if not player.is_player_valid(pid) then return end
		pos = entity.get_entity_coords(player.get_player_ped(pid))
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "chaff_released", pped, "DLC_SM_Countermeasures_Sounds", true)
	end), type = "action"}
	features["sound_troll5"] = {feat = menu.add_feature("Annoy With Flare sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		if not player.is_player_valid(pid) then return end
		pos = entity.get_entity_coords(player.get_player_ped(pid))
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "flares_released", pped, "DLC_SM_Countermeasures_Sounds", true)
	end), type = "action"}
	features["sound_troll6"] = {feat = menu.add_feature("Annoy With Remote KeyFob Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "Remote_Control_Fob", pped, "PI_Menu_Sounds", true)
	end), type = "action"}
	features["sound_troll7"] = {feat = menu.add_feature("Annoy With Remote Close Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "Remote_Control_Close", pped, "PI_Menu_Sounds", true)
	end), type = "action"}
	features["sound_troll8"] = {feat = menu.add_feature("Annoy With Remote Open Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "Remote_Control_Open", pped, "PI_Menu_Sounds", true)
	end), type = "action"}
	features["sound_troll9"] = {feat = menu.add_feature("Annoy With Light Toggle Sound", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "Toggle_Lights", pped, "PI_Menu_Sounds", true)
	end), type = "action"}
	features["sound_troll10"] = {feat = menu.add_feature("Annoy With Water Sounds", "action", featureVars.str.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		audio.play_sound_from_entity(-1, "FallingInWaterSmall", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
		system.wait(120)
		audio.play_sound_from_entity(-1, "FallingInWaterMedium", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
		system.wait(120)
		audio.play_sound_from_entity(-1, "FallingInWaterHeavy", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
		system.wait(120)
		audio.play_sound_from_entity(-1, "DiveInWater", pped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
		system.wait(120)
	end), type = "action"}
	features["arrowindicator"] = {feat = menu.add_feature("Bouncing Arrow above Player", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		if playerFeatures[pid].features["arrow_indicator2"].feat["on"] then
			playerFeatures[pid].features["arrow_indicator2"].feat["on"] = false
			system.wait(1000)
		end
		local hash = gameplay.get_hash_key("prop_mk_arrow_flat")
		AttachedCunt[pid+1], AttachedCunt2[pid+1] = spawn_object_onp(hash, pid)
		spawned_cunts[#spawned_cunts + 1] = AttachedCunt[pid+1]
		spawned_cunts[#spawned_cunts + 1] = AttachedCunt2[pid+1]
		system.wait(100)
		playerFeatures[pid].features["arrow_indicator"].feat["hidden"] = false
		playerFeatures[pid].features["arrow_indicator"].feat["on"] = true
		return HANDLER_POP
	end), type = "action", callback = function()
	end}
	features["arrowindicator"].feat["hidden"] = false
	features["arrow_indicator"] = {feat = menu.add_feature("Arrow move & Bounce with Player", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		playerFeatures[pid].features["arrowindicator"].feat["hidden"] = true
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos, offset
			pos = v3()
			pos = player.get_player_coords(pid)
			offset = v3(0.0,0.0,2.0)
			local z = 0
			local ent = AttachedCunt[pid+1]
			repeat
				z = z + 1
				pos = player.get_player_coords(pid)
				network.request_control_of_entity(ent)
				entity.set_entity_coords_no_offset(AttachedCunt[pid+1], pos + offset)
				system.wait(1)
				network.request_control_of_entity(ent)
			until z == 10
			z = 0
			offset.z = 3.0
			repeat
				z = z + 1
				network.request_control_of_entity(ent)
				pos = player.get_player_coords(pid)
				entity.set_entity_coords_no_offset(AttachedCunt[pid+1], pos + offset)
				system.wait(1)
				network.request_control_of_entity(ent)
			until z == 10
			z = 0
			offset.z = 4.0
			repeat
				z = z + 1
				network.request_control_of_entity(ent)
				pos = player.get_player_coords(pid)
				entity.set_entity_coords_no_offset(AttachedCunt[pid+1], pos + offset)
				system.wait(1)
				network.request_control_of_entity(ent)
			until z == 10
			z = 0
			return HANDLER_CONTINUE
		end
		playerFeatures[pid].features["arrowindicator"].feat["hidden"] = false
		playerFeatures[pid].features["arrow_indicator"].feat["hidden"] = true
		network.request_control_of_entity(AttachedCunt[pid+1])
		entity.delete_entity(AttachedCunt[pid+1])
		network.request_control_of_entity(AttachedCunt2[pid+1])
		entity.delete_entity(AttachedCunt2[pid+1])
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["arrow_indicator"].feat["on"] = false
	features["arrow_indicator"].feat["hidden"] = true
	features["arrowindicator2"] = {feat = menu.add_feature("Arrow Indicator above Player", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		if playerFeatures[pid].features["arrow_indicator"].feat["on"] then
			playerFeatures[pid].features["arrow_indicator"].feat["on"] = false
			system.wait(1000)
		end
		local hash = gameplay.get_hash_key("prop_mk_arrow_flat")
		AttachedCunt[pid+1], AttachedCunt2[pid+1] = spawn_object_onp(hash, pid)
		spawned_cunts[#spawned_cunts + 1] = AttachedCunt[pid+1]
		spawned_cunts[#spawned_cunts + 1] = AttachedCunt2[pid+1]
		system.wait(100)
		playerFeatures[pid].features["arrow_indicator2"].feat["hidden"] = false
		playerFeatures[pid].features["arrow_indicator2"].feat["on"] = true
		return HANDLER_POP
	end), type = "action", callback = function()
	end}
	features["arrowindicator2"].feat["hidden"] = false
	features["arrow_indicator2"] = {feat = menu.add_feature("Arrow update move with Player", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		playerFeatures[pid].features["arrowindicator2"].feat["hidden"] = true
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos, offset
			pos = v3()
			pos = player.get_player_coords(pid)
			offset = v3(0.0,0.0,5.0)
			network.request_control_of_entity(AttachedCunt[pid+1])
			entity.set_entity_coords_no_offset(AttachedCunt[pid+1], pos + offset)
			return HANDLER_CONTINUE
		end
		playerFeatures[pid].features["arrowindicator2"].feat["hidden"] = false
		playerFeatures[pid].features["arrow_indicator2"].feat["hidden"] = true
		network.request_control_of_entity(AttachedCunt[pid+1])
		entity.delete_entity(AttachedCunt[pid+1])
		network.request_control_of_entity(AttachedCunt2[pid+1])
		entity.delete_entity(AttachedCunt2[pid+1])
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["arrow_indicator2"].feat["on"] = false
	features["arrow_indicator2"].feat["hidden"] = true
	features["LightPOS1way"] = {feat = menu.add_feature("Lights v2 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local i, y, t = #spawned_cunt, (#spawned_cunt - 1), #spawned_cunt3
			if not entity.is_an_entity(spawned_cunt[i]) or entity.is_an_entity(spawned_cunt[y]) then
			return end
			local pos, offset, offset2, offset3
			pos = v3()
			pos = player.get_player_coords(pid)
			offset = v3()
			offset2 = v3()
			offset3 = v3()
			offset.x = 23.2
			offset.y = 0.5
			offset.z = 12.0
			entity.set_entity_coords_no_offset(spawned_cunt[i], pos + offset)
			offset2.x = 1.0
			offset2.y = 0.3
			offset2.z = 19.0
			entity.set_entity_coords_no_offset(spawned_cunt[y], pos + offset2)
			offset3.x = -10.0
			offset3.y = -09.3
			offset3.z = 15.0
			entity.set_entity_coords_no_offset(spawned_cunt3[t], pos + offset3)
			return HANDLER_CONTINUE
		end
		for i = 1, #spawned_cunt do
			network.request_control_of_entity(spawned_cunt[i])
			entity.delete_entity(spawned_cunt[i])
		end
		for i = 1, #spawned_cunt1 do
			network.request_control_of_entity(spawned_cunt3[i])
			entity.delete_entity(spawned_cunt3[i])
		end
		playerFeatures[pid].features["LightPOS1way"].feat["hidden"] = true
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["LightPOS1way"].feat["on"] = false
	features["LightPOS1way"].feat["hidden"] = true
	local Toilet_Cloned, starttime, resettime = false, 0.0, 0.0
	local toilet1, clone1, toilet2, clone2
	features["ToiletClone"] = {feat = menu.add_feature("ToiletClone", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			if not Toilet_Cloned then
				starttime = os.clock()
				toilet1, clone1 = Toilet_Stalker_Clone(pid)
				spawned_cunts[#spawned_cunts+1] = toilet1
				spawned_cunts[#spawned_cunts+1] = clone1
				toilet2, clone2 = Toilet_Stalker_Clone(pid)
				spawned_cunts[#spawned_cunts+1] = toilet2
				spawned_cunts[#spawned_cunts+1] = clone2
				Toilet_Cloned = true
				entity.set_entity_collision(clone2, false, false, true)
				entity.set_entity_collision(clone1, false, false, true)
			end
			local pos, offset, offset2
			pos = v3()
			pos = player.get_player_coords(pid)
			offset = v3()
			offset2 = v3()
			local heading, heading2
			heading = player.get_player_heading(pid)
			heading = math.rad((heading - 90) * -1)
			offset = v3(pos.x + (math.sin(heading) * -3.1), pos.y + (math.cos(heading) * -3.1), pos.z)
			entity.set_entity_coords_no_offset(clone1, offset)
			entity.set_entity_heading(clone1, player.get_player_heading(pid))
			heading2 = player.get_player_heading(pid)
			heading2 = math.rad((heading2 - 90) * -1)
			offset2 = v3(pos.x + (math.sin(heading2) * 3.1), pos.y + (math.cos(heading2) * 3.1), pos.z)
			entity.set_entity_coords_no_offset(clone2, offset2)
			entity.set_entity_heading(clone2, player.get_player_heading(pid))
			check = os.clock()
			if check >= (starttime + 20.0) then
				RequestAnimDict("rcmpaparazzo_2ig_3", 10)
				system.wait(10)
				local AnimDictReguested = RequestAnimDict("rcmpaparazzo_2ig_3", 10)
				system.wait(100)
				AnimDictReguested = RequestAnimDict("rcmpaparazzo_2ig_3", 10)
				if AnimDictReguested then
					RequestAnimSet("pm_incar_notdoinanythin", 10)
					system.wait(10)
					RequestAnimSet("pm_incar_notdoinanythin", 10)
				end
				system.wait(1)
				RequestAnimSet("pm_incar_notdoinanythin", 10)
				network.request_control_of_entity(clone1)
				ped.clear_ped_tasks_immediately(clone1)
				ai.task_play_anim(clone1, "rcmpaparazzo_2ig_3", "pm_incar_notdoinanythin", 1.9, 12.0, 999999999, 1, 12.9, false, false, false)
				network.request_control_of_entity(clone2)
				ped.clear_ped_tasks_immediately(clone2)
				ai.task_play_anim(clone2, "rcmpaparazzo_2ig_3", "pm_incar_notdoinanythin", 1.9, 12.0, 999999999, 1, 12.9, false, false, false)
				starttime = os.clock() 
			end
			return HANDLER_CONTINUE
		end
		Toilet_Cloned = false
		network.request_control_of_entity(toilet1)
		system.wait(10)
		entity.delete_entity(toilet1)
		network.request_control_of_entity(clone1)
		system.wait(10)
		entity.delete_entity(clone1)
		network.request_control_of_entity(toilet2)
		system.wait(10)
		entity.delete_entity(toilet2)
		network.request_control_of_entity(clone2)
		system.wait(10)
		entity.delete_entity(clone2)
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["ToiletClone"].feat["on"] = false
	features["ToiletClone"].feat["hidden"] = false
	features["LightPOSway"] = {feat = menu.add_feature("Lights v2 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos, offset, offset2
			pos = v3()
			pos = player.get_player_coords(pid)
			offset = v3()
			offset2 = v3()
			local heading, heading2
			heading = player.get_player_heading(pid)
			heading = math.rad((heading - 180) * -1)
			offset = v3(pos.x + (math.sin(heading) * -0.8), pos.y + (math.cos(heading) * -0.8), pos.z)
			offset.z = offset.z + 13.0
			offset.x = offset.x + 16.0
			for i = 1, #spawned_cunt1 do
				entity.set_entity_coords_no_offset(spawned_cunt1[i], offset)
			end
			heading2 = player.get_player_heading(pid)
			heading2 = math.rad((heading2 - 180) * -1)
			offset2 = v3(pos.x + (math.sin(heading2) * -(-1.8)), pos.y + (math.cos(heading2) * -(-1.8)), pos.z)
			offset2.z = offset2.z + 13.0
			offset2.x = offset2.x - 16.0
			for y = 1, #spawned_cunt2 do
				entity.set_entity_coords_no_offset(spawned_cunt2[y], offset2)
			end
			return HANDLER_CONTINUE
		end
		for i = 1, #spawned_cunt2 do
			network.request_control_of_entity(spawned_cunt2[i])
			entity.delete_entity(spawned_cunt2[i])
		end
		for i = 1, #spawned_cunt1 do
			network.request_control_of_entity(spawned_cunt1[i])
			entity.delete_entity(spawned_cunt1[i])
		end
		playerFeatures[pid].features["LightPOSway"].feat["hidden"] = true
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["LightPOSway"].feat["on"] = false
	features["LightPOSway"].feat["hidden"] = true
	--INFO: Light
	features["Light_POS1way"] = {feat = menu.add_feature("Lights v1 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local i = #spawned_cunt
			local y = (#spawned_cunt - 1)
			local t = #spawned_cunt3
			if not entity.is_an_entity(spawned_cunt[i]) or entity.is_an_entity(spawned_cunt[y]) then
			return end
			local pos = v3()
			pos = player.get_player_coords(pid)
			local offset = v3()
			local offset2 = v3()
			local offset3 = v3()
			offset.x = 0.2
			offset.y = 0.5
			offset.z = 0.0
			entity.set_entity_coords_no_offset(spawned_cunt[i], pos + offset)
			offset2.x = 1.0
			offset2.y = 0.3
			offset2.z = 0.0
			entity.set_entity_coords_no_offset(spawned_cunt[y], pos + offset2)
			offset3.x = -1.0
			offset3.y = -0.3
			offset3.z = -0.0
			entity.set_entity_coords_no_offset(spawned_cunt3[t], pos + offset3)
			return HANDLER_CONTINUE
		end
		for i = 1, #spawned_cunt do
			network.request_control_of_entity(spawned_cunt[i])
			entity.delete_entity(spawned_cunt[i])
		end
		for i = 1, #spawned_cunt1 do
			network.request_control_of_entity(spawned_cunt3[i])
			entity.delete_entity(spawned_cunt3[i])
		end
		playerFeatures[pid].features["Light_POS1way"].feat["hidden"] = true
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Light_POS1way"].feat["on"] = false
	features["Light_POS1way"].feat["hidden"] = true
	features["Light_POSway"] = {feat = menu.add_feature("Lights v1 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos = v3()
			pos = player.get_player_coords(pid)
			local heading
			local heading2
			local offset = v3()
			local offset2 = v3()	
			heading = player.get_player_heading(pid)
			heading = math.rad((heading - 180) * -1)			
			offset = v3(pos.x + (math.sin(heading) * -0.8), pos.y + (math.cos(heading) * -0.8), pos.z)
			offset.z = offset.z + 1.0
			offset.x = offset.x + 1.0
			for i = 1, #spawned_cunt1 do
				entity.set_entity_coords_no_offset(spawned_cunt1[i], offset)
			end
			heading2 = player.get_player_heading(pid)
			heading2 = math.rad((heading2 - 180) * -1)
			offset2 = v3(pos.x + (math.sin(heading2) * -(-1.8)), pos.y + (math.cos(heading2) * -(-1.8)), pos.z)
			offset2.z = offset2.z + 1.2
			offset2.x = offset2.x - 3.0
			for y = 1, #spawned_cunt2 do
				entity.set_entity_coords_no_offset(spawned_cunt2[y], offset2)
			end
			return HANDLER_CONTINUE
		end
		for i = 1, #spawned_cunt2 do
			network.request_control_of_entity(spawned_cunt2[i])
			entity.delete_entity(spawned_cunt2[i])
		end
		for i = 1, #spawned_cunt1 do
			network.request_control_of_entity(spawned_cunt1[i])
			entity.delete_entity(spawned_cunt1[i])
		end
		playerFeatures[pid].features["Light_POSway"].feat["hidden"] = true
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Light_POSway"].feat["on"] = false
	features["Light_POSway"].feat["hidden"] = true
	features["Lightway"] = {feat = menu.add_feature("Set Lights around player", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local offset, pos
		offset = v3()
		pos = v3()
		pos = player.get_player_coords(pid)
		object.create_object(2906806882, pos, true, true)
		spawned_cunt1[#spawned_cunt1 + 1]  = object.create_object(2906806882, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt1[#spawned_cunt1], true, false)
		spawned_cunt2[#spawned_cunt2 + 1]  = object.create_object(2906806882, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt2[#spawned_cunt2], true, false)
		spawned_cunt3[#spawned_cunt3 + 1]  = object.create_object(2906806882, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt3[#spawned_cunt3], true, false)
		spawned_cunt[#spawned_cunt + 1]  = object.create_object(2906806882, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, false)
		spawned_cunt[#spawned_cunt + 1]  = object.create_object(2906806882, pos, true, false)
		entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, false)
		playerFeatures[pid].features["Light_POS1way"].feat["on"] = true
		playerFeatures[pid].features["Light_POSway"].feat["on"] = true
		playerFeatures[pid].features["Light_POS1way"].feat["hidden"] = false
		playerFeatures[pid].features["Light_POSway"].feat["hidden"] = false
	end),  type = "action"}
	features["Lightway2"] = {feat = menu.add_feature("Set Lights around player v2", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local offset, pos
		offset = v3()
		pos = v3()
		pos = player.get_player_coords(pid)
		spawned_cunt1[#spawned_cunt1 + 1]  = object.create_object(1031052499, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt1[#spawned_cunt1], true, false)
		spawned_cunt2[#spawned_cunt2 + 1]  = object.create_object(1031052499, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt2[#spawned_cunt2], true, false)
		spawned_cunt3[#spawned_cunt3 + 1]  = object.create_object(1031052499, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt3[#spawned_cunt3], true, false)
		spawned_cunt[#spawned_cunt + 1]  = object.create_object(1031052499, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, false)
		spawned_cunt[#spawned_cunt + 1]  = object.create_object(1031052499, pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, false)
		playerFeatures[pid].features["LightPOS1way"].feat["hidden"] = false
		playerFeatures[pid].features["LightPOS1way"].feat["on"] = true
		playerFeatures[pid].features["LightPOSway"].feat["on"] = true
		playerFeatures[pid].features["LightPOSway"].feat["hidden"] = false
	end),  type = "action"}
	features["RotatingLights"] = {feat = menu.add_feature("Rotating Lights", "value_i", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		if Thread2Id[pid + 1] then
			menu.delete_thread(Thread2Id[pid + 1])
			Thread2Id[pid + 1] = nil
		end
		if EntityHash.pid then
			for i = 1, #EntityHash.pid do
				entity.delete_entity(EntityHash.pid[i])
				EntityHash.pid[i] = nil
			end
		end
		if feat["on"] then
			orbit_pid = pid
			Thread2Id[pid + 1] = menu.create_thread(Orbit2, feat.value)
		end
	end), type = "toggle", callback = function()
	end}
	features["RotatingLights"].feat["min"] = 1
	features["RotatingLights"].feat["max"] = 10
	features["RotatingLights"].feat["mod"] = 1
	features["RotatingLights"].feat["value"] = 1
	features["RotatingLights2"] = {feat = menu.add_feature("Rotating Lights", "value_i", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		if Thread1Id[pid + 1] then
			menu.delete_thread(Thread1Id[pid + 1])
			Thread1Id[pid + 1] = nil
		end
		if EntityHash2.pid then
			for i = 1, #EntityHash2.pid do
				entity.delete_entity(EntityHash2.pid[i])
				EntityHash2.pid[i] = nil
			end
		end
		if feat["on"] then
			orbit_pid = pid
			Thread1Id[pid + 1] = menu.create_thread(Orbit1, feat.value)
		end
	end), type = "toggle", callback = function()
	end}
	features["RotatingLights2"].feat["min"] = 1
	features["RotatingLights2"].feat["max"] = 20
	features["RotatingLights2"].feat["mod"] = 1
	features["RotatingLights2"].feat["value"] = 6
	features["scramdeer"] = {feat = menu.add_feature("scramjet Deer", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		local pos, heading, blipid, i, y, vehhash
		pos = v3()
		heading = v3()
		heading = player.get_player_heading(pid)
		pos = player.get_player_coords(pid)
		distance = -5
		heading = math.rad((heading - 180) * -1)
		pose = v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
		model = 0xD86B5A95
		streaming.request_model(model)
		while (not streaming.has_model_loaded(model)) do
			system.wait(10)
		end
		i = #escort + 1
		escort[i] = ped.create_ped(6, model, pose, heading, true, false)
		entity.set_entity_god_mode(escort[i], true)
		streaming.set_model_as_no_longer_needed(model)
		vehhash = gameplay.get_hash_key("scramjet")
		streaming.request_model(vehhash)
		while (not streaming.has_model_loaded(vehhash)) do
			system.wait(10)
		end
		y = #escortveh + 1
		escortveh[y] = vehicle.create_vehicle(vehhash, pose, heading, true, false)
		network.request_control_of_entity(escortveh[y])
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 10)
		vehicle.set_vehicle_mod(escortveh[y], 10, 0, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[y])
		blipid = ui.get_blip_from_entity(escortveh[y])
		ui.set_blip_sprite(blipid, 634)
		vehicle.set_vehicle_on_ground_properly(escortveh[y])
		entity.set_entity_god_mode(escortveh[y], true)
		vehicle.set_vehicle_doors_locked(escortveh[y], 5)
		ped.set_ped_into_vehicle(escort[i], escortveh[y], -1)
		if ai.task_vehicle_drive_wander(escort[i], escortveh[y], 180, 262144) then
			system.wait(10)
		end
		vehicle.set_vehicle_doors_locked(escortveh[y], 6)
		vehicle.set_vehicle_doors_locked(escortveh[y], 2)
		entity.set_entity_coords_no_offset(escortveh[y], pose)
		ai.task_vehicle_follow(escort[i], escortveh[y], pped, 220, 262144, 25)
		streaming.set_model_as_no_longer_needed(vehhash)
	end), type = "action"}
	features["Build_World"] = {feat = menu.add_feature("Spawn Parts of World Map: ", "action_value_i", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local pos, rot, offset = v3(), v3(-14.599995613098,-1.7075473124351e-06,0.0), v3(0.0,0.0,0.0)
		local pos = player.get_player_coords(pid)
		local i = #spawned_cunts + 1
		spawned_cunts[i] = object.create_object(ObjectModel[feat.value], pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunts[i], true, true)
		entity.set_entity_collision(spawned_cunts[i], true, true, true)
		entity.freeze_entity(spawned_cunts[i], true)
		system.wait(25)
	end),  type = "action_value_i"}
	features["Build_World"].feat["max"] = #ObjectModel
	features["Build_World"].feat["min"] = 1
	features["Build_World"] = {feat = menu.add_feature("SpawnMap Part: ", "action_value_str", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local pos, rot, offset = v3(), v3(-14.599995613098,-1.7075473124351e-06,0.0), v3(0.0,0.0,0.0)
		local pos = player.get_player_coords(pid)
		local i = #spawned_cunts + 1
		Mapname = Map_Array[feat.value+1]
		spawned_cunts[i] = object.create_world_object(World_Map[Mapname], pos, true, true)
		entity.set_entity_as_mission_entity(spawned_cunts[i], true, true)
		entity.set_entity_collision(spawned_cunts[i], true, true, true)
		entity.freeze_entity(spawned_cunts[i], true)
		system.wait(25)
	end),  type = "action_value_i"}
	features["Build_World"].feat:set_str_data(Map_Array)
	features["Build_World"].feat["value"] = 0
	--INFO: Lester Ramjet
	features["Ram_Jet_cleanup"] = {feat = menu.add_feature("Run Delayed Cleanup?", "toggle", featureVars.gr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		features["RamJet_cleanup"].feat["on"] = true
	end),  type = "toggle", callback = function()
	features["RamJet_cleanup"].feat["on"] = false
	end}
	features["Ram_Jet_cleanup"].feat["on"] = false
	features["RamJet2"] = {feat = menu.add_feature("Lester RamJet Attack Player", "action_value_i", featureVars.gr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		local pos = v3()
		local heading, heading2 = player.get_player_heading(pid), player.get_player_heading(pid)
		pos = player.get_player_coords(pid)
		distance = tonumber(feat.value)
		heading = math.rad((heading - 180) * -1)
		pose = v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
		model = 0x6E42FD26
		streaming.request_model(model)
		while (not streaming.has_model_loaded(model)) do
			system.wait(10)
		end
		escort[#escort + 1] = ped.create_ped(29, model, pos, heading2, true, false)
		entity.set_entity_god_mode(escort[#escort], true)
		ped.set_ped_relationship_group_hash(escort[#escort], MoistEntRelHash[1])
		ped.set_can_attack_friendly(escort[#escort], true, false)
		ped.set_ped_can_switch_weapons(escort[#escort], true)
		ped.set_ped_combat_attributes(escort[#escort], 46, true)
		ped.set_ped_combat_attributes(escort[#escort], 52, true)
		ped.set_ped_combat_attributes(escort[#escort], 1, true)
		ped.set_ped_combat_attributes(escort[#escort], 2, true)
		ped.set_ped_combat_range(escort[#escort], 2)
		ped.set_ped_combat_ability(escort[#escort], 2)
		ped.set_ped_combat_movement(escort[#escort], 2)
		ai.task_combat_ped(escort[#escort], pped, 0, 16)
		streaming.set_model_as_no_longer_needed(model)
		vehhash = gameplay.get_hash_key("scramjet")
		streaming.request_model(vehhash)
		while (not streaming.has_model_loaded(vehhash)) do
			system.wait(10)
		end
		escortveh[#escortveh + 1] = vehicle.create_vehicle(vehhash, pose, heading2, true, false)
		network.request_control_of_entity(escortveh[#escortveh])
		entity.set_entity_god_mode(escortveh[#escortveh], true)
		network.request_control_of_entity(escortveh[#escortveh])
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 5)
		ped.set_ped_into_vehicle(escort[#escort], escortveh[#escortveh], -1)
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 6)
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 2)
		vehicle.set_vehicle_mod_kit_type(escortveh[#escortveh], 0)
		vehicle.get_vehicle_mod(escortveh[#escortveh], 10)
		vehicle.set_vehicle_mod(escortveh[#escortveh], 10, 0, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[#escortveh])
		local blipid = ui.get_blip_from_entity(escortveh[#escortveh])
		ui.set_blip_sprite(blipid, 634)
		ai.task_vehicle_aim_at_ped(escort[#escort], pped)
		ai.task_combat_ped(escort[#escort], pped, 0, 16)
		vehicle.set_vehicle_rocket_boost_active(escortveh[#escortveh], true)
		return HANDLER_POP
	end), type = "action"}
	features["RamJet2"].feat["max"] = -10
	features["RamJet2"].feat["min"] = -200
	features["RamJet2"].feat["value"] = -20
	features["RamJet3"] = {feat = menu.add_feature("Lester RamJet Impact Player", "action_value_i",featureVars.gr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		pped = player.get_player_ped(pid)
		local pos = v3()
		local heading, heading2 = player.get_player_heading(pid), player.get_player_heading(pid)
		pos = player.get_player_coords(pid)
		local distance = tonumber(feat.value)
		heading = math.rad((heading - 180) * -1)
		local pose = v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
		local model = 0x6E42FD26
		streaming.request_model(model)
		while (not streaming.has_model_loaded(model)) do
			system.wait(10)
		end
		local i = #escort + 1
		escort[i] = ped.create_ped(29, model, pos, heading2, true, false)
		ped.set_ped_relationship_group_hash(escort[i], MoistEntRelHash[1])
		ped.set_can_attack_friendly(escort[i], true, false)
		--entity.set_entity_god_mode(escort[i], true)
		ped.set_ped_can_switch_weapons(escort[i], true)
		ped.set_ped_combat_attributes(escort[i], 46, true)
		ped.set_ped_combat_attributes(escort[i], 52, true)
		ped.set_ped_combat_attributes(escort[i], 1, true)
		ped.set_ped_combat_attributes(escort[i], 2, true)
		ped.set_ped_combat_range(escort[i], 2)
		ped.set_ped_combat_ability(escort[i], 2)
		ped.set_ped_combat_movement(escort[i], 2)
		ai.task_combat_ped(escort[i], pped, 0, 16)
		-- streaming.set_model_as_no_longer_needed(model)
		local vehhash = gameplay.get_hash_key("scramjet")
		streaming.request_model(vehhash)
		while (not streaming.has_model_loaded(vehhash)) do
			system.wait(10)
		end
		escortveh[#escortveh + 1] = vehicle.create_vehicle(vehhash, pose, heading2, true, false)
		ped.set_ped_into_vehicle(escort[i], escortveh[#escortveh], -1)
		network.request_control_of_entity(escortveh[#escortveh])
		--entity.set_entity_god_mode(escortveh[#escortveh], true)
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 5)
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 6)
		vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 2)
		vehicle.set_vehicle_mod_kit_type(escortveh[#escortveh], 0)
		vehicle.get_vehicle_mod(escortveh[#escortveh], 10)
		vehicle.set_vehicle_mod(escortveh[#escortveh], 10, 0, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[#escortveh])
		local blipid = ui.get_blip_from_entity(escortveh[#escortveh])
		ui.set_blip_sprite(blipid, 634)
		ai.task_vehicle_aim_at_ped(escort[i], pped)
		ai.task_combat_ped(escort[i], pped, 0, 16)
		vehicle.set_vehicle_out_of_control(escortveh[#escortveh], true, true)
		vehicle.set_vehicle_rocket_boost_active(escortveh[#escortveh], true)
		return HANDLER_POP
	end), type = "action"}
	features["RamJet3"].feat["max"] = -10
	features["RamJet3"].feat["min"] = -200
	features["RamJet3"].feat["value"] = -20
	features["Ramjet_Attach"] = {feat = menu.add_feature("Remove All RamJets in Range", "toggle", featureVars.gr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			for i = 1, #escortveh do
				if #escortveh ~= nil or #escortveh ~= 0 then
					entity.set_entity_as_no_longer_needed(escortveh[i])
					entity.delete_entity(escortveh[i])
				end
			end
			for i = 1, #escort do
				if #escort ~= nil or #escort ~= 0 then
					entity.set_entity_as_no_longer_needed(escort[i])
					entity.delete_entity(escort[i])
				end
			end
		end		
		feat["on"] = false
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Ramjet_Attach"].feat["on"] = false
	features["RamJet_cleanup"] = {feat = menu.add_feature("Run Delayed Ramjet Cleanup", "toggle", featureVars.gr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			system.wait(10000)
			delayed_spawn_cleanup()
			return HANDLER_CONTINUE
		end
	end),  type = "toggle", callback = function()
	end}
	features["RamJet_cleanup"].feat["on"] = false
	features["RamJet_cleanup"].feat["hidden"] = true
	features["sendlesmonster"] = {feat = menu.add_feature("Arenawar Monster Lester", "action_value_str", featureVars.lgr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		ped_groups()
		local attack, modd, pped, e, d, c
		local pos = v3()
		attack = feat.value
		modd = 1
		pped = player.get_player_ped(pid)
		pos = player.get_player_coords(pid)
		e = #escort * 3
		d = 15
		c = d + e
		pos.x = pos.x + c
		pos.y = pos.y + 10
		ground, pos.z = gameplay.get_ground_z(pos)
		local model = gameplay.get_hash_key("ig_lestercrest_2")
		streaming.request_model(model)
		while (not streaming.has_model_loaded(model)) do
			system.wait(10)
		end
		local i = #escort + 1
		escort[i] = ped.create_ped(6, model, pos, pos.z, true, false)
		ped.set_ped_relationship_group_hash(escort[i], MoistEntRelHash[1])
		ped.set_can_attack_friendly(escort[i], true, false)
		if #groupIDs == nil then
			ped_groups()
			else
		end
		if #escort >= 8 then
			local t = #escort / 8
			local j = #groupIDs
			if  t > j then
				ped_groups()
				local j = #groupIDs
				local escort_group = groupIDs[j]
				else
			end
			local escort_group = groupIDs[j]
			else
			local j = #groupIDs - 1
			local escort_group = groupIDs[j]
			ped.set_ped_as_group_member(escort[i], escort_group)
			ped.set_ped_never_leaves_group(escort[i], true)
			if i == 1 or 9 then
				if i == 1 then ped.set_ped_as_group_leader(escort[i], groupIDs[#groupIDs - 1])
				end
				elseif i == 9 then ped.set_ped_as_group_leader(escort[i], groupIDs[#groupIDs])
			end
		end
		entity.set_entity_god_mode(escort[i], true)
		streaming.set_model_as_no_longer_needed(model)
		local vehhash = 1721676810
		streaming.request_model(vehhash)
		while (not streaming.has_model_loaded(vehhash)) do
			system.wait(10)
		end
		local y = #escortveh + 1
		escortveh[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[y])
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 42)
		vehicle.set_vehicle_mod(escortveh[y], 42, 1, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 45)
		vehicle.set_vehicle_mod(escortveh[y], 45, 0, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 34)
		vehicle.set_vehicle_mod(escortveh[y], 34, -1, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 48)
		vehicle.set_vehicle_mod(escortveh[y], 48, 1, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 40)
		vehicle.set_vehicle_mod(escortveh[y], 40, 2, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 41)
		vehicle.set_vehicle_mod(escortveh[y], 41, 2, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 11)
		vehicle.set_vehicle_mod(escortveh[y], 11, 3, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 9)
		vehicle.set_vehicle_mod(escortveh[y], 9, 0, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 11)
		vehicle.set_vehicle_mod(escortveh[y], 11, 3, false)
		vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
		vehicle.get_vehicle_mod(escortveh[y], 16)
		vehicle.set_vehicle_mod(escortveh[y], 16, 4, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escortveh[y])
		ui.set_blip_sprite(BlipIDs[#BlipIDs] , 666)
		vehicle.set_vehicle_on_ground_properly(escortveh[y])
		entity.set_entity_god_mode(escortveh[y], true)
		vehicle.set_vehicle_doors_locked(escortveh[y], 5)
		network.request_control_of_entity(escortveh[y])
		ped.set_ped_combat_attributes(escort[i], 46, true)
		ped.set_ped_combat_attributes(escort[i], 52, true)
		ped.set_ped_combat_attributes(escort[i], 1, true)
		ped.set_ped_combat_attributes(escort[i], 2, true)
		ped.set_ped_combat_range(escort[i], 2)
		ped.set_ped_combat_ability(escort[i], 2)
		ped.set_ped_combat_movement(escort[i], 2)
		ped.set_ped_into_vehicle(escort[i], escortveh[y], -1)
		if ai.task_vehicle_drive_wander(escort[i], escortveh[y], 180, 262144) then
			system.wait(10)
		end
		vehicle.set_vehicle_doors_locked(escortveh[y], 6)
		vehicle.set_vehicle_doors_locked(escortveh[y], 2)
		entity.set_entity_coords_no_offset(escortveh[y], pos)
		if attack == 1 then
			ai.task_combat_ped(escort[i], pped, 0, 16)
			else
			if attack == 2 then
				playerFeatures[pid].features["hunter_taskloop"].feat["on"] = true
				ai.task_vehicle_follow(escort[i], escortveh[y], pped, 220, 262144, 25)
			end
		end
		streaming.set_model_as_no_longer_needed(vehhash)
	end), type = "action_value_i"}
	features["sendlesmonster"].feat:set_str_data({"Send Wandering", "Send to Attack!", "Send Stalker"})
	features["weapon_impact"] = {feat = menu.add_feature("Get last Weapon impact POS", "toggle", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local success, pos
			pos = v3()
			success, pos  = ped.get_ped_last_weapon_impact(player.get_player_ped(pid), v3())
			if success then
				PlyImpactPos[pid+1] = pos
				else
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	success, pos  = ped.get_ped_last_weapon_impact(player.get_player_ped(pid), v3())
	if success then			
		PlyImpactPos[pid+1] = pos
		else
	end
	end}
	features["weapon_impact"].feat["on"] = false
	features["weapon_impact"].feat["hidden"] = false
	features["Giveimpact_orbstrike"] = {feat = menu.add_feature("Give Impact Orbital Strike", "toggle", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			playerFeatures[pid].features["weapon_impact"].feat["on"] = true
			if ped.is_ped_shooting( player.get_player_ped(pid)) and PlyImpactPos[pid+1] ~= v3(0.0,0.0,0.0) then
				system.yield(150)
				local pos, exp_pos = v3(), v3()
				pos = PlyImpactPos[pid+1]
				offset = v3(0.0,0.0,-2000.00)
				graphics.set_next_ptfx_asset("scr_xm_orbital")
				while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
					graphics.request_named_ptfx_asset("scr_xm_orbital")
					system.wait(0)
				end
				fire.add_explosion(pos, 59, true, false, 1.5,  player.get_player_ped(pid))
				fire.add_explosion(pos + offset, 60, true, false, 1.8,  player.get_player_ped(pid))
				fire.add_explosion(pos, 62, true, false, 2.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				fire.add_explosion(pos + offset, 50, true, false, 1.0,  player.get_player_ped(pid))
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.50, false, false, true)
				fire.add_explosion(pos, 59, false, true, 1.5,  player.get_player_ped(pid))
				fire.add_explosion(pos, 60, true, false, 1.8,  player.get_player_ped(pid))
				fire.add_explosion(pos + offset, 62, true, false, 2.0,  player.get_player_ped(pid))
				fire.add_explosion(pos + offset, 50, true, false, 1.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.75, false, false, true)
				graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 0.80, false, false, true)
				fire.add_explosion(pos, 59, false, true, 1.5,  player.get_player_ped(pid))
				fire.add_explosion(pos, 60, true, false, 1.8,  player.get_player_ped(pid))
				fire.add_explosion(pos, 62, true, false, 2.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				fire.add_explosion(pos, 50, true, false, 1.0,  player.get_player_ped(pid))
				system.yield(150)
				PlyImpactPos[pid+1] = v3(0.0,0.0,0.0)
				pos = v3(0.0,0.0,0.0)
			end
			return HANDLER_CONTINUE
		end
		playerFeatures[pid].features["weapon_impact"].feat["on"]  = false
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Giveimpact_orbstrike"].feat["on"] = false
	--INFO: Weapon strike
	local current_loop_delay
	current_loop_delay = Settings["playerlist_loop"]
	features["Give_Airstrike"] = {feat = menu.add_feature("Give WeaponStrike:", "value_str", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		playerFeatures[pid].features["weapon_impact"].feat["on"] = true
		local posm, playerz, zPos, hash
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			pped = player.get_player_ped(pid)
			Settings["playerlist_loop"] = 0
			if not notify_sent then
				moist_notify(StrikeGive[feat.value+1], "Weapon Projectile Selected")
				notify_sent = true
			end
			if not ped.is_ped_shooting(pped) then
			return HANDLER_CONTINUE end
			posm = v3()
			posm = player.get_player_coords(pid)
			if feat.value == 6 then
				posm.z = posm.z + 10
				else
				posm.z = posm.z + 100
			end
			hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
			pos_off = v3()
			pos_off.x = PlyImpactPos[pid+1].x + math.random(1, 5)
			pos_off.y = PlyImpactPos[pid+1].y + math.random(1, 8)
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 1000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].x = PlyImpactPos[pid+1].x + 5
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].y = PlyImpactPos[pid+1].y - 5
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].x = PlyImpactPos[pid+1].x - 6
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].y = PlyImpactPos[pid+1].y + 6
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 1000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].x = PlyImpactPos[pid+1].x + 5
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].y = PlyImpactPos[pid+1].y - 5
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].x = PlyImpactPos[pid+1].x - 4
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			PlyImpactPos[pid+1].y = PlyImpactPos[pid+1].y + 4
			gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos[pid+1], 10000.00, hash, pped, true, false, 100000.0)
			system.wait(50)
			--print(PlyImpactPos[pid+1])
			return HANDLER_CONTINUE
		end
		playerFeatures[pid].features["weapon_impact"].feat["on"] = false
		notify_sent = false
		Settings["playerlist_loop"] = current_loop_delay
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Give_Airstrike"].feat["on"] = false
	features["Give_Airstrike"].feat:set_str_data(StrikeGive_label)
	--INFO: *** **** Sticky Bomb Back **** ***	
	features["StickyBack"] = {feat = menu.add_feature("Stickbomb on Back of this cunt!", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local PosBool, pos, offset, Tpos = false, v3(), v3(), v3()
		local pped = player.get_player_ped(pid)
		local BoneID = entity.get_entity_bone_index_by_name(pped, "SKEL_Spine_Root")
		local hash = gameplay.get_hash_key("WEAPON_STICKYBOMB")
		PosBool, pos = ped.get_ped_bone_coords(pped, 11816, offset)
		Tpos = get_offset(pid, -0.19)
		offset = v3(0.0,0.0,1.250)
		myped = player.get_player_ped(player.player_id())
		gameplay.shoot_single_bullet_between_coords(Tpos + offset, pos, 10000.00, hash, myped, true, false, 10.0)
		PosBool, pos = ped.get_ped_bone_coords(pped, 57597, offset)
		Tpos = get_offset(pid, 0.05)
		gameplay.shoot_single_bullet_between_coords(Tpos + offset, pos, 10000.00, hash, myped, true, false, 10.0)
	end), type = "action"}
	features["StickyBombBack"] = {feat = menu.add_feature("Sticky Bomb on Back of this cunt!", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local PosBool, pos, offset, Tpos = false, v3(), v3(), v3()
		local pped = player.get_player_ped(pid)
		local hash = gameplay.get_hash_key("WEAPON_STICKYBOMB")
		PosBool, pos = ped.get_ped_bone_coords(pped, 57597, offset)
		Pos1Bool, pos1 = ped.get_ped_bone_coords(pped, 64729, offset)
		Tpos = get_offset(pid, -0.05)
		offset = v3(0.0,0.0,0.12)
		myped = player.get_player_ped(player.player_id())
		gameplay.shoot_single_bullet_between_coords(pos1, pos, 10000200, hash, myped, true, false, 0.001)
		PosBool, pos = ped.get_ped_bone_coords(pped, 57597, offset)
		system.wait(5)
		gameplay.shoot_single_bullet_between_coords(pos, pos1, 100000, hash, myped, true, false, 0.001)
	end), type = "action"}
	features["World_PickupDump"] = {feat = menu.add_feature("Dump World Pickups on this Cunt!", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if world_dumped then
			if not player.is_player_valid(pid) then return end
			local pos = v3()
			pos = player.get_player_coords(pid)
			dump_pickups_onplayer(pid, pos)
		end
		return HANDLER_POP
	end), type = "action"}
	features["Block Passive"] = {feat = menu.add_feature("Block Passive Mode", "action", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		Trigger_Event(65268844, pid, 1, 1)
		local scid = player.get_player_scid(pid)
		local name = tostring(player.get_player_name(pid))
		Debug_Out(string.format("Player: " ..name .." [" ..scid .."]" .."Blocked Passive"))
	end), type = "action"}
	features["Block Passive"].feat["hidden"] = NewDLC()
	features["Unblock Passive"] = {feat = menu.add_feature("Unblock Passive Mode", "action", featureVars.f.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		Trigger_Event(65268844, pid, 2, 0)
		scid = player.get_player_scid(pid)
		name = tostring(player.get_player_name(pid))
		Debug_Out(string.format("Player: " .. name .. " [" .. scid .. "]" .. "Passive Unblocked"))
	end), type = "action"}
	features["Unblock Passive"].feat["hidden"] = NewDLC()
	--INFO: Grief
	featureVars.lag = menu.add_feature("Entity Area Lag", "parent", featureVars.g.id)
	menu.add_feature("Value = Spawn Amount", "action", featureVars.lag.id)
	local attack_peds2 = {"u_m_y_juggernaut_01", "a_f_y_topless_01", "ig_lestercrest_2", "ig_lestercrest_3", "ig_trafficwarden", "mp_f_deadhooker", "s_m_m_pilot_01", "s_m_m_pilot_02", "s_m_y_pilot_01", "s_m_y_robber_01", "u_m_m_jewelthief", "u_m_y_fibmugger_01", "a_f_y_juggalo_01", "mp_g_m_pros_01",}
	features["attacker2"] = {feat = menu.add_feature("Send Attacker", "action_value_str", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local pped = player.get_player_ped(pid)
		local pos = get_offset(pid, -6)
		local model = gameplay.get_hash_key(attack_peds2[feat.value + 1])
		streaming.request_model(model)
		while (not streaming.has_model_loaded(model)) do
			system.wait(10)
		end
		local i = #escort + 1
		escort[i] = ped.create_ped(29, model, pos, player.get_player_heading(pid), true, false)
		ped.set_ped_relationship_group_hash(escort[i], MoistEntRelHash[1])
		ped.set_can_attack_friendly(escort[i], true, false)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(escort[i])
		if #groupIDs == nil then
			ped_group_setup()
			else
		end
		local y = #groupIDs
		for i = 1, #escort do
			pedgroup = ped.get_ped_group(escort[i])
			myplygrp = player.get_player_group(player.player_id())
			player_group = player.get_player_group(pid)
			ped.set_ped_as_group_member(escort[i], groupIDs[y])
			ped.set_ped_never_leaves_group(escort[i], true)
			ped.set_relationship_between_groups(5, groupIDs[y], player_group)
			ped.set_relationship_between_groups(5, player_group,  groupIDs[y])
			ped.set_relationship_between_groups(1, groupIDs[y], myplygrp)
			ped.set_relationship_between_groups(1, myplygrp,  groupIDs[y])
		end
		--entity.set_entity_god_mode(escort[i], true)
		ped.set_ped_combat_attributes(escort[i], 46, true)
		ped.set_ped_combat_attributes(escort[i], 52, true)
		ped.set_ped_combat_attributes(escort[i], 1, true)
		ped.set_ped_combat_attributes(escort[i], 2, true)
		ped.set_ped_combat_range(escort[i], 2)
		ped.set_ped_combat_ability(escort[i], 2)
		ped.set_ped_combat_movement(escort[i], 2)
		entity.set_entity_god_mode(escort[i], true)
		ped.set_ped_combat_attributes(escort[i], 52, true)
		ped.set_ped_combat_attributes(escort[i], 1, true)
		ped.set_ped_combat_attributes(escort[i], 46, true)
		ped.set_ped_combat_attributes(escort[i], 2, true)
		ped.set_ped_combat_range(escort[i], 2)
		ped.set_ped_combat_ability(escort[i], 2)
		ped.set_ped_combat_movement(escort[i], 2)
		weapon.give_delayed_weapon_to_ped(escort[i], 0xb62d1f67, 1, 1)
		ped.set_ped_can_switch_weapons(escort[i], true)
		pos = player.get_player_coords(pid)
		pos.x = pos.x + 8
		pos.y = pos.y + 8
		entity.set_entity_coords_no_offset(escort[i], pos)
		ai.task_combat_ped(escort[i], pped, 0, 16)
	end), type = "action_value_str"}
	features["attacker2"].feat:set_str_data(attack_peds2)
	local blame = 0
	features["blamer"] = {feat = menu.add_feature("Set Blame: ", "value_str", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if feat.value == 32 then
				blame = 0
				elseif feat.value ~= 32 then
				if not blame == player.get_player_ped(feat.value) then
					blame = player.get_player_ped(feat.value)
					moist_notify("Blame Set: " .. Playerz[feat.value+1])
				end
			end
			system.wait(200)
			return HANDLER_CONTINUE
		end
		blame = 0
		return HANDLER_POP
	end), type = "toggle"}
	features["blamer"].feat:set_str_data(Playerz)
	features["blamedorbital"] = {feat = menu.add_feature("Orbital Player Blaming: ", "action_value_str", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local pos, exp_pos = v3(), v3()
		pped = player.get_player_ped(pid)
		myped = player.get_player_ped(feat.value)
		pos = entity.get_entity_coords(pped)
		offset = v3(0.0,0.0,-2000.00)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.wait(0)
		end
		fire.add_explosion(pos, 59, true, false, 1.5, myped)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		exp_pos.x = math.random(-2700, 2700)
		exp_pos.y = math.random(-3300, 7500)
		exp_pos.z = math.random(30, 90)
		fire.add_explosion(exp_pos, 74, true, false, 0, myped)
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
		graphics.set_next_ptfx_asset("scr_xm_orbital")
		while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
			graphics.request_named_ptfx_asset("scr_xm_orbital")
			system.wait(0)
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
			system.wait(0)
		end
		graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10.000, false, false, true)
		fire.add_explosion(pos, 59, false, true, 1.5, myped)
		fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
		fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
		fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.add_explosion(pos, 50, true, false, 1.0, myped)
		fire.start_entity_fire(pped)
	end), type = "action"}
	features["blamedorbital"].feat:set_str_data(Playerz)
	features["Firework_ply"] = {feat = menu.add_feature("Fireworks Around Player Delay: ", "value_i", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos, Pos, Rpos1, Rpos2
			pos, Pos = v3(), v3()
			pos = player.get_player_coords(pid)
			Pos = player.get_player_coords(pid)
			Pos.x = pos.x + math.random(-10, 20)
			Pos.y = pos.y + math.random(-10, 20)
			Pos.z = pos.z + math.random(5, 50)
			fire.add_explosion(Pos, 38, true, false, 0, blame)
			system.wait(feat.value)
			Pos.x = pos.x + math.random(-10, 20)
			Pos.y = pos.y + math.random(-10, 20)
			Pos.z = pos.z + math.random(5, 50)
			fire.add_explosion(Pos, 38,  true, false, 0, blame)
			system.wait(feat.value)
			pos = player.get_player_coords(pid)
			Pos.x = pos.x + math.random(-100, 200)
			Pos.y = pos.y + math.random(-100, 200)
			Pos.z = pos.z + math.random(5, 50)
			fire.add_explosion(Pos, 38, true, false, 0, blame)
			system.wait(feat.value)
			Pos.x = pos.x + math.random(1, 200)
			Pos.y = pos.y + math.random(1, 200)
			Pos.z = pos.z + math.random(5, 50)
			fire.add_explosion(Pos, 38,  true, false, 0, blame)
			system.wait(feat.value)
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle"}
	features["Firework_ply"].feat["max"] = 2000
	features["Firework_ply"].feat["min"] = 0
	features["Firework_ply"].feat["value"] = 100
	features["Firework_ply"].feat["mod"] = 10
	features["explodeply"] = {feat = menu.add_feature("Explosions Around Player", "value_i", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return end
			local pos, Pos, Rpos1, Rpos2
			pos, Pos = v3(), v3()
			pos = player.get_player_coords(pid)
			Pos = player.get_player_coords(pid)
			Pos.x = pos.x + math.random(1, 5)
			Pos.y = pos.y + math.random(1, 8)
			fire.add_explosion(Pos, feat.value, true, false, 0, blame)
			system.wait(25)
			Pos.x = pos.x - math.random(1, 5)
			Pos.y = pos.y - math.random(1, 8)
			fire.add_explosion(Pos, feat.value, true, false, 0, blame)
			system.wait(25)
			fire.add_explosion(pos, feat.value, true, false, 0, blame)
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle"}
	features["explodeply"].feat["max"] = 82
	features["explodeply"].feat["min"] = -1
	features["explodeply"].feat["value"] = 0
	features["explode_ply"] = {feat = menu.add_feature("Explosions Around Player", "action_value_i", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return end
		local pos, Pos, Rpos1, Rpos2
		pos, Pos = v3(), v3()
		pos = player.get_player_coords(pid)
		Pos = player.get_player_coords(pid)
		Pos.x = pos.x + math.random(1, 5)
		Pos.y = pos.y + math.random(1, 8)
		fire.add_explosion(Pos, feat.value, true, false, 0, blame)
		system.wait(25)
		Pos.x = pos.x - math.random(1, 5)
		Pos.y = pos.y - math.random(1, 8)
		fire.add_explosion(Pos, feat.value, true, false, 0, blame)
		system.wait(25)
		fire.add_explosion(pos, feat.value, true, false, 0, blame)
	end), type = "toggle"}
	features["explode_ply"].feat["max"] = 82
	features["explode_ply"].feat["min"] = -1
	features["explode_ply"].feat["value"] = 0
	--INFO: ************** PTFX ********************
	local asset = "scr_bike_adversary"
	local effect = "scr_adversary_foot_flames"
	features["ptfx_annoy"] = {feat = menu.add_feature("PTFX: ", "value_str", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			local pos = v3()
			pos = player.get_player_coords(pid)
			graphics.remove_ptfx_from_entity(pped)
			graphics.remove_ptfx_in_range(pos, 200000.00)
			graphics.remove_particle_fx(gameplay.get_hash_key(effect), false)
			graphics.remove_named_ptfx_asset(asset)
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(pid)
		local i = feat.value + 1
		local pos, rot = v3(), v3()
		rot.x = math.random(0.0, 360.0)
		rot.y = math.random(0.0, 360.0)
		rot.z = math.random(0.0, 360.0)
		asset = tostring(ptfx_dictasset[i][1])
		effect = tostring(ptfx_dictasset[i][2]) 
		graphics.set_next_ptfx_asset(asset)
		while not graphics.has_named_ptfx_asset_loaded(asset)do graphics.request_named_ptfx_asset(asset)system.wait(0)end
		pos = player.get_player_coords(pid)
		
		if not graphics.does_looped_ptfx_exist(gameplay.get_hash_key(effect)) then
			graphics.start_networked_ptfx_looped_on_entity(effect, pped, v3(0.0,0.0,0.0), rot, 3.0)
		end
		system.wait(1)
		return HANDLER_CONTINUE
	end), type = "value_str", callback = function()
	end}
	features["ptfx_annoy"].feat:set_str_data(ptfx_Label)
	local asset2 = "scr_bike_adversary"
	local effect2 = "scr_adversary_foot_flames"
	features["ptfx_annoy2"] = {feat = menu.add_feature("PTFX: ", "value_str", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			local pos = v3()
			pos = player.get_player_coords(pid)
			graphics.remove_ptfx_from_entity(pped)
			graphics.remove_ptfx_in_range(pos, 200000.00)
			graphics.remove_particle_fx(gameplay.get_hash_key(effect2), false)
			graphics.remove_named_ptfx_asset(asset2)
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(pid)
		local i = feat.value + 1
		local pos, rot = v3(), v3()
		rot.x = math.random(0.0, 360.0)
		rot.y = math.random(0.0, 360.0)
		rot.z = math.random(0.0, 360.0)
		asset2 = tostring(ptfx_dictasset[i][1])
		effect2 = tostring(ptfx_dictasset[i][2]) 
		graphics.set_next_ptfx_asset(asset2)
		while not graphics.has_named_ptfx_asset_loaded(asset2)do graphics.request_named_ptfx_asset(asset2)system.wait(0)end
		pos = player.get_player_coords(pid)
		
		if not graphics.does_looped_ptfx_exist(gameplay.get_hash_key(effect2)) then
			graphics.start_networked_ptfx_looped_on_entity(effect2, pped, v3(0.0,0.0,0.0), rot, 1.2)
		end
		system.wait(1)
		return HANDLER_CONTINUE
	end), type = "value_str", callback = function()
	end}
	features["ptfx_annoy2"].feat:set_str_data(ptfx_Label)
	features["dildobombs"] = {feat = menu.add_feature("Dildo Bombs From Ass", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(pid)
		local pedbool
		local pos = v3()
		local offset = v3(0.0,0.0,0.0)
		pos = ped.get_ped_bone_coords(pped, 0, offset)
		offset.x = 0.0
		offset.y = -0.001
		offset.z = 0.0
		pedbool, pos = ped.get_ped_bone_coords(pped, 0, offset)
		spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)
		entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, 100, 0, 0, 0, true, true)
		pedbool, pos = ped.get_ped_bone_coords(pped, 0, offset)
		offset.y = offset.y + -0.001
		system.wait(10)
		spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)
		entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, -100, -2, 0, 0, true, true)
		pedbool, pos = ped.get_ped_bone_coords(pped, 0, offset)
		system.wait(10)
		offset.y = offset.y + -0.001
		spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)
		entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 3, 0, 0, 100, 1, 0, 0, true, true)
		system.wait(10)
		pedbool, pos = ped.get_ped_bone_coords(pped, 0, offset)
		offset.y = offset.y + -0.001
		spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)
		system.wait(10)
		entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, -100, 10, 0, 10, true, true)
		system.wait(100)
		for i = 1, #spawned_cunts do
			pos = entity.get_entity_coords(spawned_cunts[i])
			offset.x = -0.5
			offset.y = 0.5
			fire.add_explosion(pos + offset, 60, true, false, 5, blame)
			fire.add_explosion(pos + offset, 59, true, false, 1, blame)
			offset.x = 0.5
			offset.y = -0.5
			pos = entity.get_entity_coords(spawned_cunts[i])
			fire.add_explosion(pos + offset, 59, true, false, 1, blame)
			fire.add_explosion(pos + offset, 60, true, false, 1, blame)
			offset.x = -0.5
			offset.y = -0.5
			fire.add_explosion(pos + offset, 59, true, false, 5, blame)
			system.wait(10)
			fire.add_explosion(pos + offset, 60, true, false, 5, blame)
			offset.x = 0.5
			offset.y = 0.5
			fire.add_explosion(pos + offset, 58, true, false, 5, blame)
			fire.add_explosion(pos + offset, 59, true, false, 1, blame)
			offset.x = -1.0
			offset.y = 1.0
			fire.add_explosion(pos + offset, 60, true, false, 1, blame)
			fire.add_explosion(pos + offset, 59, true, false, 1, blame)
			offset.x = 0.0
			offset.y = 0.0
			system.wait(10)
			fire.add_explosion(pos + offset, 59, true, false, 5, blame)
			fire.add_explosion(pos + offset, 60, true, false, 5, blame)
			system.wait(10)
			entity.set_entity_as_no_longer_needed(spawned_cunts[i])
			entity.delete_entity(spawned_cunts[i])
		end
	end), type = "action"}
	features["SetOnFire"] = {feat = menu.add_feature("Set Them on Fire", "toggle", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not feat["on"] then
			fire.stop_entity_fire(player.get_player_ped(pid))
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		fire.start_entity_fire(player.get_player_ped(pid))
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["SetOnFire"].feat["on"] = false
	features["HomingFlare"] = {feat = menu.add_feature("Flare assisted Homing", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(player.player_id())
		local pos = v3()
		pos = player.get_player_coords(pid)
		pos.z =  pos.z + 50.00
		local offset = v3()
		offset = get_offset(pid, 55)
		
		local speed = 300000
		local hash = gameplay.get_hash_key("WEAPON_FLAREGUN")
		gameplay.shoot_single_bullet_between_coords(pos, offset, 1000.00, hash, pped, false, true, speed)
		system.wait(0)
		local hash = gameplay.get_hash_key(StrikeGive[12])
		local pos = v3()
		pos = player.get_player_coords(pid)
		pos.z = pos.z + 750.0
		local offset = v3()
		offset = get_offset(pid, -200)
		offset.z = offset.z + 75.0
		gameplay.shoot_single_bullet_between_coords(offset, get_offset(pid, 50), 10000.00, hash, blame, true, false, 10000.0)
		system.wait(10)
		local hash = gameplay.get_hash_key(StrikeGive[12])
		local pos = v3()
		pos = player.get_player_coords(pid)
		pos.z = pos.z + 75.0
		local offset = v3()
		offset = get_offset(pid, -200)
		offset.z = offset.z + 100.0
		gameplay.shoot_single_bullet_between_coords(offset, get_offset(pid, 50), 10000.00, hash, blame, true, false, 10000.0)
		system.wait(10)
		local hash = gameplay.get_hash_key(StrikeGive[13])
		local pos = v3()
		pos = player.get_player_coords(pid)
		pos.z = pos.z + 75.0
		local offset = v3()
		offset = get_offset(pid, -200)
		offset.z = offset.z + 100.0
		gameplay.shoot_single_bullet_between_coords(offset, get_offset(pid, 50), 10000.00, hash, blame, true, false, 10000.0)
		system.wait(10)
	end), type = "action"}
	features["Homing_Flare"] = {feat = menu.add_feature("Flare assisted Homing v2", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		local pos = v3()
		pos = player.get_player_coords(pid)
		-- local posz
		-- posz, pos.z = gameplay.get_ground_z(pos)
		local offset = v3()
		offset = get_offset(pid, 50)
		offset.z =  offset.z + 30.00
		local speed = 300000
		local hash = gameplay.get_hash_key("WEAPON_FLAREGUN")
		gameplay.shoot_single_bullet_between_coords(pos, offset, 1000.00, hash, blame, false, true, speed)
		system.wait(0)
		local hash = gameplay.get_hash_key(StrikeGive[12])
		local pos = v3()
		pos = player.get_player_coords(pid)
		local offset = v3()
		offset = get_offset(pid, -20)
		offset.z = offset.z + 150.0
		gameplay.shoot_single_bullet_between_coords(offset, get_offset(pid, 100), 10000.00, hash, blame, true, false, 100000.0)
		gameplay.shoot_single_bullet_between_coords(offset, pos, 10000.00, hash, blame, true, false, 100000.0)
	end), type = "action"}
	features["airstrike"] = {feat = menu.add_feature("Airstrike player", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
		local pos = v3()
		pos = player.get_player_coords(pid)
		pos.z = pos.z + 10.0
		local offset = v3()
		offset.x = 0.0
		offset.y = 0.0
		offset.z = -1.0
		gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash, blame, true, false, 10000.0)
	end), type = "action"}
	features["multishoot"] = {feat = menu.add_feature("Snipe for all Directions", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		local hash = gameplay.get_hash_key("weapon_heavysniper")
		local pos = v3()
		pos = player.get_player_coords(pid)
		blame = player.get_player_ped(player.player_id())
		pos.z = pos.z + 5.0
		offset = v3()
		offset.x = 10.0
		offset.y = 0.0
		offset.z = 0.0
		local boolpos, bonepos = ped.get_ped_bone_coords(player.get_player_ped(pid), 12844, offset)
		gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 10000.00, hash, blame, true, false, 10000.0)
		offset.x = -10.0
		offset.y = 0.0
		offset.z = 0.0
		gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 10000.00, hash, blame, true, false, 10000.0)
		offset.x = 0.0
		offset.y = 10.0
		offset.z = 0.0
		gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 10000.00, hash, blame, true, false, 10000.0)
		offset.x = 0.0
		offset.y = -10.0
		offset.z = 0.0
		gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 10000.00, hash, blame, true, false, 10000.0)
	end), type = "action"}
	features["Ped_hate"] = {feat = menu.add_feature("World Peds Hate:", "action_value_str", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local weap = ped_wep[feat.value + 1]
		moist_notify("Peds Attack With:\n" .. Ped_WepL[feat.value +1], "Moist Ped Haters")
		Peds_hateWorld(pid, weap)
	end), type = "action_value_i", callback = function()
	end}
	features["Ped_hate"].feat:set_str_data(Ped_WepL)
	features["Ped_hate"].feat["value"] = 11
	features["Peds_eject"] = {feat = menu.add_feature("Task NearbyPeds Bail/Exit Veh", "action_value_i", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		moist_notify("Peds around Target Player\nWill Exit Vehicle or Bail from it", "MoistScript Troll")
		Ped_eject(pid, eject[feat.value])
	end), type = "action_value_i", callback = function()
	end}
	features["Peds_eject"].feat["max"] = #eject
	features["Peds_eject"].feat["min"] = 1
	features["Peds_eject"].feat["value"] = 6
	lester, huntv = {}, {}
	features["Send_HunterLester"] = {feat = menu.add_feature("Send Lester Hunt them in savage", "action", featureVars.lgr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		local pos = get_offset(pid, 25)
		local offset = v3(120.0,110.0,200.00)
		local vehhash = veh_list[2][2]
		mod = 10
		modvalue = -1
		pped = player.get_player_ped(pid)
		lester[#lester+1] = spawn_ped(pid, 0x6E42FD26, pos + offset, true, true)
		system.wait(100)
		local huntv = spawn_veh(pid, vehhash, pos + offset, mod, modvalue, true)
		local blipid = ui.get_blip_from_entity(huntv)
		ui.set_blip_sprite(blipid, 43)
		local p = #escort
		local y = #escortveh
		local curhead = player.get_player_heading(pid)
		entity.set_entity_heading(escortveh[y], curhead)
		
		ped.set_ped_into_vehicle(lester[#lester], escortveh[y], -1)
		vehicle.control_landing_gear(escortveh[y], 3)
		vehicle.set_heli_blades_full_speed(escortveh[y])
		vehicle.set_vehicle_forward_speed(escortveh[y], 25.00)
		
		ai.task_combat_ped(lester[#lester], pped, 0, 16)
		
		ai.task_combat_ped(lester[#lester], pped, 0, 16)
		
		playerFeatures[pid].features["hunter_taskloop"].feat["on"] = true
		playerFeatures[pid].features["hunter_taskloop"].feat["hidden"] = false
	end), type = "action"}
	features["hunter_taskloop"] = {feat = menu.add_feature("Retask Lester on Death", "toggle", featureVars.lgr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			pped = player.get_player_ped(pid)
			ai.task_combat_ped(lester[#lester], pped, 0, 16)
			ai.task_goto_entity(lester[#lester], pped, 999999999999, 100, 1000.00)
			if not entity.is_entity_dead(pped) then return HANDLER_CONTINUE end
			system.wait(4000)
			for i = 1, #escort do
				-- if #escortveh == nil or 0 then
				-- goto next
				-- end
				ped.set_ped_into_vehicle(escort[i], escortveh[i], -1)
				-- ::next::
				ai.task_combat_ped(escort[i], pped, 0, 16)
			end
			return HANDLER_CONTINUE
		end
		for i = 1, #escortveh do
			entity.set_entity_as_no_longer_needed(escortveh[i])
			entity.delete_entity(escortveh[i])
		end
		for i = 1, #escort do
			entity.set_entity_as_no_longer_needed(escort[i])
			entity.delete_entity(escort[i])
		end
		playerFeatures[pid].features["hunter_taskloop"].feat["hidden"] = true
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["hunter_taskloop"].feat["on"] = false
	features["hunter_taskloop"].feat["hidden"] = true
	--INFO: World Dump Run Check
	features["World_Dump1"] = {feat = menu.add_feature("Dump World on this Cunt!(Frozen)", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if world_dumped then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			local pos = v3()
			pos = player.get_player_coords(pid)
			dumpfreeze_onplayer(pid, pos)
		end
		return HANDLER_POP
	end), type = "action"}
	features["World_Dump1"] = {feat = menu.add_feature("Dump peds n vehicles on player(Un-Frozen)", "action", featureVars.tr.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if world_dumped then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			local pos = v3()
			pos = player.get_player_coords(pid)
			dumpfreeze_ped_onplayer(pid, pos)
		end
		return HANDLER_POP
	end), type = "action"}
	--INFO: Alkonostlag
	features["alkonost_lag"] = {feat = menu.add_feature("Alkonost Lag Area", "action_value_i", featureVars.lag.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(pid)
		local heading, pos, hash
		heading = player.get_player_heading(pid)
		pos = v3()
		local offset, rot = v3(0.0,0.0,0.0), v3(0.0,0.0,0.0)
		pos = player.get_player_coords(pid)
		hash = 3929093893
		streaming.request_model(hash)
		while (not streaming.has_model_loaded(hash)) do
			system.wait(10)
		end
		for y = 1, feat.value do
			pos.x = pos.x + 1.0
			alkonost[#alkonost + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
		end
		streaming.set_model_as_no_longer_needed(hash)
		return HANDLER_POP
	end),  type = "action_value_i", callback = function()
	end}
	features["alkonost_lag"].feat["min"] = 1
	features["alkonost_lag"].feat["max"] = 100
	features["alkonost_lag"].feat["value"] = 15
	features["alkonost_lagattach"] = {feat = menu.add_feature("Try to Remove Alkonost's", "toggle", featureVars.lag.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			for i = 1, #alkonost do
				entity.set_entity_as_no_longer_needed(alkonost[i])
				entity.delete_entity(alkonost[i])
			end
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	--INFO: kosatkalag
	features["kosatka_lag"] = {feat = menu.add_feature("kosatka Lag Area", "action_value_i", featureVars.lag.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		pped = player.get_player_ped(pid)
		local heading, pos, hash
		heading = player.get_player_heading(pid)
		pos = v3()
		local offset, rot = v3(0.0,0.0,0.0), v3(0.0,0.0,0.0)
		pos = player.get_player_coords(pid)
		hash = 1336872304
		streaming.request_model(hash)
		while (not streaming.has_model_loaded(hash)) do
			system.wait(10)
		end
		for y = 1, feat.value do
			pos.x = pos.x + 1.0
			kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
			spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], kosatka[#kosatka], 0, pos, pos, true, true, false, 0, false)
		end
		streaming.set_model_as_no_longer_needed(hash)
		return HANDLER_POP
	end),  type = "action_value_i", callback = function()
	end}
	features["kosatka_lag"].feat["min"] = 1
	features["kosatka_lag"].feat["max"] = 100
	features["kosatka_lag"].feat["value"] = 15
	features["kosatka_lagattach"] = {feat = menu.add_feature("Try To Remove Kosatka's", "toggle", featureVars.lag.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			for i = 1, #kosatka do
				entity.set_entity_as_no_longer_needed(kosatka[i])
				entity.delete_entity(kosatka[i])
			end
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	--INFO: Kick System
	featureVars.ses = menu.add_feature("Script Event Spam", "parent", featureVars.k.id)
	featureVars.ses["hidden"] = NewDLC()
	features["ForceRemove"] = {feat = menu.add_feature("Force Remove Player", "action", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		
		network.force_remove_player(pid)
		return HANDLER_POP
	end), type = "action", callback = function()
	end}
	features["ForceRemove"].feat["on"] = false	
	features["SE_Kick_Crash"] = {feat = menu.add_feature("New Randomised Kick Crash", "toggle", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			system.yield(1)
			SE_KickCrash(pid)
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["SE_Kick_Crash"].feat["on"] = false	
	features["SE_Kick_Crash2"] = {feat = menu.add_feature("New Randomised Kick Crash 2", "toggle", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			system.yield(1)
			SE_KickCrash2(pid)
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["SE_Kick_Crash"].feat["on"] = false	
	local args_done = false
	features["SE_CRASH_DATA1"] = {feat = menu.add_feature("SEKick Custom Arg Count:", "value_i", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local Args = {}
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			if args_done ~= true then
				Args = build_params(feat.value)
				system.yield(10000)
				args_done = true
			end
			-- player.unset_player_as_modder(pid, -1)
			if player.is_player_valid(pid)then
				
				system.yield(Settings["ScriptEvent_delay"])
				for i = 1, #data do
					par1 = math.random(-1000, 99999999)
					par2 = math.random(20000, 99999999)
					par3 = math.random(-1, 1)
					par4 = math.random(-1, 9)
					par5 = math.random(-1, 1)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, par1, par2, par3, par4, par5, par1, par2, par3, par2)
					system.yield(Settings["ScriptEvent_delay"])
					system.yield(Settings["ScriptEvent_delay"])
				end
				system.yield(Settings["ScriptEvent_delay"])
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		args_done = false
		return HANDLER_POP
	end),
	type = "toggle", callback = function()
	end}
	features["SE_CRASH_DATA1"].feat["max"] = 100
	features["SE_CRASH_DATA1"].feat["min"] = 1
	features["SE_CRASH_DATA1"].feat["value"] = 100
	features["SE_CRASH_DATA1"].feat["on"] = false
	features["Vec_Kick"] = {feat = menu.add_feature("New Vector Kick", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local args, pos, mult = {}, v3(), 10^0
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			args = {}
			system.yield(25)
			pos = player.get_player_coords(pid)
			args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
			for i = 1, #data do
				if not player.is_player_valid(pid) then return HANDLER_POP end
				pos = player.get_player_coords(pid)
				args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
				if not player.is_player_valid(pid) then return HANDLER_POP end
				Trigger_Event(data[i], pid, args)
				system.yield(10)
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["Vec_Kick"].feat["on"] = false
	features["Vec_Kick2"] = {feat = menu.add_feature("New Vector v2 Kick", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local args, pos, mult = {}, v3(), 10^0
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			args = {}
			system.yield(25)
			pos = player.get_player_coords(player.player_id())
			args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
			args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
			for i = 1, #data do
				if not player.is_player_valid(pid) then return HANDLER_POP end
				pos = player.get_player_coords(player.player_id())
				args[#args+1] = (((pos.x * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.y * mult + 0.5) // 1) / mult) << 20
				args[#args+1] = (((pos.z * mult + 0.5) // 1) / mult) << 20
				if not player.is_player_valid(pid) then return HANDLER_POP end
				Trigger_Event(data[i], pid, args)
				system.yield(10)
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["Vec_Kick2"].feat["on"] = false
	features["ArgArray_Kick"] = {feat = menu.add_feature("Script Array Kick", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local pos = v3()
		local args = {{1, -1},{1, 0, 5688},{1},{1, 0},{1},{1, 260176910, 1116},{1, 279349627, 5225},{1, 0, 9299},{1, 0, 8684},{1, 387748548, 826658647, 59984},{-72614, 63007, 59027, -12012, -26996, 33399},{1, -2118308144, 2122375111, 35737},{28, -1, -1},{28, -1, -1},{41,48},{18467},{6334},{26500},{19169},{15724,0},{0, 0, -950497366, 22, 739, -931834499, -1, 1},{0, -997503452, 1160177970, 1099617219, 0, 456714581, 1340086989},{16, 0, 0},{16, 0, 0},{0, 1, 0},{16, 0, 2},{16, 0, 1},{16, 0, 2},{16, 0, 2},{16, 0, 1},{16, 0, 1},{24464, 0},{5705, 0},{28145, 0},{23281, 0},{16827, 0},{9961, 0},{491, 0},{2995, 0},{11942, 0},{4827, 0},{5436, 0},{32391, 0},{14604, 0},{3902, 0},{153, 0},{292, 0},{12382, 0},{17421, 0},{28145, 0},{18716, 0},{19718, 0},{19895, 0},{5447, 0},{491, 0},{21726, 0},{14771, 0},{11538, 0},{1869, 0},{5436, 0},{19912, 0},{32391, 0},{25667, 0},{3902, 0},{17421, 0},{5447, 0},{21726, 0},{1869, 0},{26299, 0},{17035, 0},{9894, 0},{28703, 0},{23811, 0},{31322, 0},{30333, 0},{17613, 0},{4664, 0},{15141, 0},{7711, 0},{28703, 0},{23811, 0},{31322, 0},{27644, 0},{28523, 0},{6868, 0},{25547, 0},{27644, 0},{28253, 0},{41, 48},{18467},{6334},{26500},{19169},{-452918768, 15724, 1788, 0},{41, 48},{18467},{6334},{26500},{19169},{-452918768, 15724, 1788, 0},{41, 0},{18467, 0},{6334, 0},{26500, 0},{19169, 0},{15724, 0},{11478, 0},{29358, 0},{26962, 0},{24464, 0},{5705, 0},{28145, 0},{23281, 0},{16827, 0},{9961, 0},{491, 0},{2995, 0},{11942, 0},{4827, 0},{5436, 0},{41, 0},{32391, 0},{18467, 0},{14604, 0},{6334, 0},{3902, 0},{26500, 0},{153, 0},{292, 0},{15724, 0},{12382, 0},{11478, 0},{17421, 0},{29358, 0},{18716, 0},{26962, 0},{19718, 0},{19895, 0},{5705, 0},{5447, 0},{28145, 0},{21726, 0},{23281, 0},{14771, 0},{16827, 0},{11538, 0},{9961, 0},{1869, 0},{491, 0},{19912, 0},{2995, 0},{25667, 0},{11942, 0},{26299, 0},{4827, 0},{17035, 0},{5436, 0},{9894, 0},{32391, 0},{28703, 0},{14604, 0},{23811, 0},{3902, 0},{31322, 0},{153, 0},{30333, 0},{292, 0},{17673, 0},{12382, 0},{4664, 0},{17421, 0},{15141, 0},{18716, 0},{7711, 0},{19718, 0},{28253, 0},{19895, 0},{6868, 0},{5447, 0},{25547, 0},{21726, 0},{27644, 0},{14771, 0},{32662, 0},{11538, 0},{32757, 0},{1869, 0},{20037, 0},{19912, 0},{12859, 0},{25667, 0},{8723, 0},{26299, 0},{9741, 0},{17035, 0},{27529, 0},{5436, 0},{9894, 0},{778, 0},{32391, 0},{28703, 0},{12316, 0},{14604, 0},{23811, 0},{3035, 0},{3902, 0},{31322, 0},{22190, 0},{153, 0},{30333, 0},{1842, 0},{292, 0},{17673, 0},{288, 0},{12382, 0},{4664, 0},{30106, 0},{17421, 0},{15141, 0},{9040, 0},{18716, 0},{7711, 0},{8942, 0},{19264, 0},{6868, 0},{22648, 0},{25547, 0},{27446, 0},{27644, 0},{23805, 0},{32662, 0},{15890, 0},{6729, 0},{20037, 0},{24370, 0},{12859, 0},{15350, 0},{8723, 0},{15006, 0},{9741, 0},{31101, 0},{24393, 0},{778, 0},{3548, 0},{12316, 0},{19629, 0},{3035, 0},{12623, 0},{22190, 0},{24084, 0},{19954, 0},{22648, 0},{18756, 0},{27446, 0},{11840, 0},{23805, 0},{15890, 0},{4966, 0},{7376, 0},{24370, 0},{13931, 0},{15350, 0},{26308, 0},{15006, 0},{16944, 0},{31101, 0},{32439, 0},{24626, 0},{3548, 0},{11323, 0},{19629, 0},{5537, 0},{12623, 0},{21538, 0},{24084, 0},{16118, 0},{2082, 0},{22929, 0},{16541, 0},{4833, 0},{31115, 0},{4639, 0},{19954, 0},{18756, 0},{29658, 0},{22704, 0},{11840, 0},{9930, 0},{13977, 0},{7376, 0},{2306, 0},{13931, 0},{31673, 0},{26308, 0},{22386, 0},{16944, 0},{5021, 0},{32439, 0},{28745, 0},{24626, 0},{11323, 0},{5537, 0},{26924, 0},{21538, 0},{19072, 0},{2082, 0},{6270, 0},{22929, 0},{5829, 0},{16541, 0},{26777, 0},{4833, 0},{15573, 0},{31115, 0},{5097, 0},{4639, 0},{16512, 0},{23986, 0},{29658, 0},{22704, 0},{13290, 0},{9161, 0},{18636, 0},{2, 260176910, 6187},{2},{2, 279349627, 8410},{2, -1},{2},{2},{2, 1584169018, 2669},{-1, 1421294746, 0},{0, 89},{0, 1756},{0, 156}}
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			for i = 1, #data do
				for y = 1, #args do
					if not player.is_player_valid(pid) then return HANDLER_POP end
					Trigger_Event(data[i], pid, args[y])
					system.yield(Settings["ScriptEvent_delay"])
				end
				if not player.is_player_valid(pid) then return HANDLER_POP end
				system.yield(Settings["ScriptEvent_delay"])
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["ArgArray_Kick"].feat["on"] = false
	features["Kick1_Type1"] = {feat = menu.add_feature("Kick Data 1 Type 1", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			system.yield(Settings["ScriptEvent_delay"])
			if player.is_player_valid(pid)then
				
				system.yield(Settings["ScriptEvent_delay"])
				-- player.unset_player_as_modder(pid, -1)
				for i = 1, #data do
					system.yield(Settings["ScriptEvent_delay"])
					par1 = math.random(-1000, 99999999)
					par2 = math.random(-1, 9)
					par3 = math.random(-1, 1)
					par4 = math.random(-1, 9)
					par5 = math.random(-1, 1)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, par3, par5, par2, par3, par2)
					system.yield(Settings["ScriptEvent_delay"])
					Trigger_Event(data[i], pid, par3, par5, par2, par3, par2, par1, par3, par1)
					system.yield(Settings["ScriptEvent_delay"])
				end
				system.yield(Settings["ScriptEvent_delay"])
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),
	type = "toggle", callback = function()
	end}
	features["Kick1_Type1"].feat["on"] = false
	features["Kick1_Type2"] = {feat = menu.add_feature("Kick Data 1 Type 2", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			system.yield(Settings["ScriptEvent_delay"])
			for i = 1, #data do
				system.yield(Settings["ScriptEvent_delay"])
				par1 = math.random(-1000, 99999999)
				par2 = math.random(-99999999999999, -9)
				par3 = math.random(46190868, 999999999)
				par4 = math.random(-1, 9)
				par5 = math.random(-99999999999999, -46190868)
				par6 = math.random(9999999999, 9999999899990868)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(data[i], pid, par3, par5, par2, par3, par2, par1, par3, par1)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(data[i], pid, par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1)
				system.yield(Settings["ScriptEvent_delay"])
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Kick1_Type2"].feat["on"] = false
	features["Kick1_Type3"] = {feat = menu.add_feature("Kick Data 1 Type 3", "toggle", featureVars.ses.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			system.yield(Settings["ScriptEvent_delay"])
			for i = 1, #data do
				system.yield(Settings["ScriptEvent_delay"])
				par1 = kick_param_data[math.random(1, #kick_param_data)]
				par2 = kick_param_data[math.random(1, #kick_param_data)]
				par3 = kick_param_data[math.random(1, #kick_param_data)]
				par4 = kick_param_data[math.random(1, #kick_param_data)]
				par5 = kick_param_data[math.random(1, #kick_param_data)]
				par6 = kick_param_data[math.random(1, #kick_param_data)]
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(data[i], pid, par3, par5, par2, par3, par2, par1, par3, par1)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(data[i], pid, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par6, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par6, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par6)
				system.yield(Settings["ScriptEvent_delay"])
				Trigger_Event(data[i], pid, par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1)
				system.yield(Settings["ScriptEvent_delay"])
			end
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end),  type = "toggle", callback = function()
	end}
	features["Kick1_Type3"].feat["on"] = false
	features["net-kick"] = {feat = menu.add_feature("Network Bail Kick", "action", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		player.unset_player_as_modder(pid, -1)
		local scid = player.get_player_scid(pid)
		local name = tostring(player.get_player_name(pid))
		
		Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x493FC6BB, pid, pid, script.get_global_i(1892703 + (1 + (pid * 599)) + 510))
		system.yield(Settings["ScriptEvent_delay"])
		Debug_Out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))
	end), type = "action", callback = function()
	end}
	features["Host-kick"] = {feat = menu.add_feature("Host Kick", "action", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		--player.unset_player_as_modder(pid, -1)
		local scid = player.get_player_scid(pid)
		local name = tostring(player.get_player_name(pid))
		Debug_Out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Host Kicked"))
		network.network_session_kick_player(pid)
	end), type = "action", callback = function()
	end}
	features["SE_Crash"] = {feat = menu.add_feature("Script Event Crash", "action", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		
		Trigger_Event(0xc50f74ca, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0x8638a0ab, pid, pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0)
		system.yield(Settings["ScriptEvent_delay"])
		Trigger_Event(0xc50f74ca, pid, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778,  23135423, 827870001, 23135423)
	end), type = "action",  callback = function()
	end}
	features["SE1_Crash"] = {feat = menu.add_feature("New Script Event Crash", "toggle", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		local Params = build_params(120)
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			for y = 1, #Recent_Players do
				if Recent_Players[y].rid == player.get_player_scid(pid) and Recent_Players[y].WasKicked == false then
					if not Players[pid].isFriend then
						Kicked_Players[player.get_player_scid(pid)] = tostring(player.get_player_name(pid))
						local token = tostring(player.get_player_host_token(pid))
						Kicked_Player[token:sub(1, 8)] = tostring(player.get_player_name(pid))
						Recent_Players[y].WasKicked = true 
					end
				end
			end
			for y = 1, #SECrash do
				Trigger_Event(SECrash[y], pid, Params)
				system.yield(Settings["ScriptEvent_delay"])
			end
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle",  callback = function()
	end}
	features["SE1_Crash"].feat["on"] = false
	features["SEC-kick"] = {feat = menu.add_feature("Random Script Event Crash", "toggle", featureVars.k.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			
			par1 = kick_param_data[math.random(1, #kick_param_data)]
			par2 = kick_param_data[math.random(1, #kick_param_data)]
			par3 = kick_param_data[math.random(1, #kick_param_data)]
			par4 = kick_param_data[math.random(1, #kick_param_data)]
			par5 = kick_param_data[math.random(1, #kick_param_data)]
			Trigger_Event(data[math.random(1, #data)], pid, pid, par5, par3, par1, par5, par3, par1, par5, par3, pid, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, pid, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1)
			system.yield(Settings["ScriptEvent_delay"])
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle",  callback = function()
	end}
	features["SEC-kick"].feat["on"] = false
	features["DisableGame"] = {feat = menu.add_feature("Disable Players Game & Give God", "action", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if not player.is_player_valid(pid) then return HANDLER_POP end
		Trigger_Event(0xAD1762A7, pid, 24, 24, 1, 0, 115, 1, 1, 1)
		system.yield(Settings["ScriptEvent_delay"])
		return HANDLER_POP
	end), type = "action", callback = function()
	end}
	features["DisableGame"].feat["hidden"] = NewDLC()
	features["AptInv_Spam"] = {feat = menu.add_feature("Spam Random Apt Invites", "toggle", featureVars.g.id, function(feat)
		if type(feat) == "number" then
			return HANDLER_POP
		end
		if feat["on"] then
			if not player.is_player_valid(pid) then return HANDLER_POP end
			Settings["playerlist_loop"] = 0
			
			Trigger_Event(-1390976345, pid, 24, 24, 1, 0, math.ceil(math.random(0, 100)), 1, 1, 1)
			system.yield(6000)
			Trigger_Event(2130458390, pid, 24, 24, 1, 0, math.ceil(math.random(0, 100)), 1, 1, 1)
			return HANDLER_CONTINUE
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	end}
	features["AptInv_Spam"].feat["on"] = false
	features["AptInv_Spam"].feat["hidden"] = NewDLC()
	playerFeatures[pid] = {feat = featureVars.f, scid = -1, features = features}
	featureVars.f["hidden"] = false
end
	loop_logsent, count, playercount, check = false, 0, 0, 0
	--INFO: Standard Player Loop function
loopFeat2 = menu.add_feature("Normal Loop Function", "toggle", globalFeatures.moist_tools.id, function(feat)
	if type(feat) == "number" then
	return HANDLER_POP
	end
	while feat["on"] do
	local Online = network.is_session_started()
	if not Online then
	SessionHost = nil
	ScriptHost = nil
	loop_logsent = false
	Active_menu = nil
	Playercount = 0
	end
	local lpid = player.player_id()
	for pid = 0, 31 do
	local pped = player.get_player_ped(pid)
	local tbl = playerFeatures[pid]
	local f = tbl.feat
	local scid, name
	scid = player.get_player_scid(pid)
	SessionPlayers[pid].Scid = scid
	playerFeatures[pid].scid = scid
	if scid ~= -1 then
		if f.hidden then
			f["hidden"] = false
		end
		Playerz[pid+1] = player.get_player_name(pid)
		local name = player.get_player_name(pid)
		Players[pid].name = name
		SessionPlayers[pid].sessionname = name
		local toname = ""
		local isYou = lpid == pid
		local tags, tagz = {}, {}
		if Online then
			if playercount ~= player.player_count() then
				for y = 0, 31 do
					if Players[y].OTRBlipID ~= nil then
						ui.remove_blip(Players[y].OTRBlipID)
						Players[y].OTRBlipID = nil
					end
				end
				playercount = player.player_count()
				RefreshPlayerInterior:set_str_data(Playerz)
				interiorcheckbytype:set_str_data(Playerz)
				player_pos:set_str_data(Playerz)
				OrbitalStrike_All:set_str_data(Playerz)
				paracrash:set_str_data(Playerz)
			end
			if isYou then
				tags[#tags + 1] = "Y"
			end
			if player.is_player_friend(pid) then
				tags[#tags + 1] = "F"
			end
			if player.is_player_host(pid) then
				tags[#tags + 1] = "H"
				toname = toname .."~h~~b~[H]"
				if SessionHost ~= pid then
					SessionHost = pid
					moist_notify((isYou and "You Are Now The The Session Host!" or "The Session Host is Now") .."\n" .. name, nil)
					Debug_Out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
				end
			end
			if pid == script.get_host_of_this_script() then
				tags[#tags + 1] = "S"
				toname = toname .. "~h~~y~[S]"
				if ScriptHost ~= pid then
					ScriptHost = pid
					moist_notify((isYou and "You Are Now The Script Host!"  or  "The Script Host is Now") .."\n" .. name, nil)
					Debug_Out(string.format("Script Host is Now : " .. (isYou and " you " or name)))
				end
			end
			if not Players[pid].PedSpawned and tracking.playerped_speed1[pid + 1] >= 15 and not Players[pid].isint then
				Players[pid].PedSpawned = true
				elseif Players[pid].PedSpawned and Players[pid].isint then
				Players[pid].PedSpawned = false
			end
			if entity.is_entity_dead(player.get_player_ped(pid)) then
				playerFeatures[pid].features["GetKiller"].feat["on"] = true
				--GetKiller(pid)
				Players[pid].isDead = true
				Players[pid].PedSpawned = false
				elseif not entity.is_entity_dead(player.get_player_ped(pid)) and Players[pid].isDead then
				playerFeatures[pid].features["GetKiller"].feat["on"] = false
				Players[pid].isDead = false
				Players[pid].isDamagedbY = nil
				Players[pid].PedSpawned = true
			end
			if player.is_player_valid(pid) and Settings["GodCheck"] then
				if player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) then
					tags[#tags + 1] = "G"
					--playerFeatures[pid].features["interiortest2"].feat["on"]  = true
					elseif not player.is_player_god(pid) or entity.is_entity_dead(player.get_player_ped(pid)) then
					if Active_menu ~= pid then
						--playerFeatures[pid].features["interiortest2"].feat["on"]  = false
					end
				end
			end
			if Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 1 then
				if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
					--playerFeatures[pid].features["GodCheck"].feat["on"]  = true
					--playerFeatures[pid].features["interiortest"].feat["on"]  = true
					--	playerFeatures[pid].features["PBPulse"].feat["on"]  = true
					elseif not player.is_player_god(pid) or not player.is_player_vehicle_god(pid) then
					--playerFeatures[pid].features["GodCheck"].feat["on"]  = false
					--playerFeatures[pid].features["interiortest"].feat["on"]  = false
					--	playerFeatures[pid].features["PBPulse"].feat["on"]  = false
				end
				elseif Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 2 then
				if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
					--playerFeatures[pid].features["GodCheck"].feat["on"]  = true
					--	playerFeatures[pid].features["interiortest"].feat["on"]  = true
					--	playerFeatures[pid].features["PBPulse"].feat["on"]  = true
					elseif not player.is_player_god(pid) and player.is_player_vehicle_god(pid) then
					--	playerFeatures[pid].features["GodCheck"].feat["on"]  = false
					--playerFeatures[pid].features["interiortest"].feat["on"]  = false
					--	playerFeatures[pid].features["PBPulse"].feat["on"]  = false
				end
			end
			if player.is_player_god(pid) and Players[pid].PedSpawned --[[and (tracking.playerped_speed1[pid + 1] >= 28)]] and Players[pid].isint ~= true and not Players[pid].isRC then
				tagz[#tagz + 1] = "~h~~r~[~y~G~r~~h~]"
				Players[pid].pulse = not Players[pid].pulse
			end
			if Players[pid].isRC then
				tags[#tags + 1] = "RC"
				tagz[#tagz + 1] = "~h~~q~[~h~~b~RC~h~~q~]"
			end
			if player.is_player_playing(pid) and player.is_player_vehicle_god(pid) then
				if interior.get_interior_at_coords_with_type(player.get_player_coords(pid), "") ~= 0 or interior.get_interior_from_entity(player.get_player_ped(pid)) ~= 0 or not Players[pid].isint and not Players[pid].isRC  then
					tags[#tags + 1] = "V"
				end
			end
			if player.is_player_vehicle_god(pid) and Players[pid].isint ~= true and not Players[pid].isRC and Players[pid].PedSpawned == true then
				--	if (tracking.playerped_speed1[pid + 1] >= 28) then
				if Players[pid].pulse == true then
					tagz[#tagz + 1] = "~h~~o~[V]"
					--	else
				end
				elseif player.is_player_vehicle_god(pid) and Players[pid].isint ~= true and (tracking.playerped_speed1[pid + 1] >= 28) and not Players[pid].isRC then
				tagz[#tagz + 1] =  "~h~~r~[~o~V~r~]"
				Players[pid].pulse = not Players[pid].pulse
			end
			if Players[pid].isint ~= true then
				if player.is_player_spectating(pid) and player.is_player_playing(pid) then
					tags[#tags + 1] = ".SPEC."
				end
			end
			Players[pid].Spectatable = ( script.get_global_i(1853348 + (1 + (pid * 834)) + 205 + 52) == 1 and true or 0 and false)
			if Settings["PlayerTagginghook"] then
				if Players[pid].isTyping then
					if (script.get_global_i(1644218 + (2 + (pid * 1) + (241 + 136)))& 1 << 16 ~= 0) then																  
						tags[#tags + 1] = "T"
						tagz[#tagz + 1] = "~h~~q~[~h~~b~T~h~~q~]"
					end
				end
				if Players[pid].isTalking then
					tags[#tags + 1] = "VC"
					tagz[#tagz + 1] = "~h~~q~[~h~~b~VC~h~~q~]"
				end
			end
			if player.get_player_armour(pid) > 50 then
				tags[#tags + 1] = "U"
				tagz[#tagz + 1] = "~h~~q~[U]"
				if Settings["GodCheckNotif"] and not Players[pid].isgod then
					moist_notify(name .. " Has Excessive Armour ", "Modder Detection")
					Players[pid].isgod = true
				end
			end
			if not isYou then
				if not NewDLC() then
					if (script.get_global_i(2689235 + (1 + (pid * 453)) + 208) ==  1) then
						
						tags[#tags + 1] = "O"
						tagz[#tagz + 1] = "~h~~g~[O]"
						if not Players[pid].isOTR then
							Debug_Out(string.format("Start Player OTR: " .. name .. "\n"))
							Players[pid].isOTR = true
							Players[pid].OTR_Start = tonumber(os.time())
							elseif Players[pid].isOTR then
							local test = tonumber(os.time())
							local otrtime = test - tonumber(Players[pid].OTR_Start)
							if otrtime > 200 then
								if not Players[pid].OTRTNotify then
									moist_notify("OTR Time: | " .. name .. " | " .. tostring(RoundNum(otrtime  / 60, 2)) .. " mins", "")
									Players[pid].OTRTNotify = true
								end
							end
						end 
						if Settings["OTR_Blips"] and Players[pid].OTRBlipID == nil then
							Players[pid].OTRBlipID = ui.add_blip_for_entity(pped)
							ui.set_blip_colour(Players[pid].OTRBlipID, 2)
						end
					end
					if (script.get_global_i(2689235 + (1 + (pid * 453)) + 208) ==  0) then
						if Players[pid].isOTR then
							Debug_Out(string.format("Player OTR End: " .. name .. "\n"))
							Players[pid].isOTR = false
						end
						if Players[pid].OTRBlipID ~= nil then
							ui.remove_blip(Players[pid].OTRBlipID)
							Players[pid].OTRBlipID = ui.get_blip_from_entity(pped)
							ui.remove_blip(Players[pid].OTRBlipID)
							Players[pid].OTRBlipID = nil
						end
					end
				end
			end
			if not player.is_player_modder(pid, -1) then
				if (player.get_player_health(pid) > 100) and not (player.get_player_max_health(pid) > 0) then
					tags[#tags + 1] = "U"
					tagz[#tagz + 1] = "~h~~q~[U]"
				end
			end
			if not player.is_player_modder(pid, -1) then
				if (player.get_player_health(pid) == 0) and (player.get_player_max_health(pid) == 0) and (tracking.playerped_speed1[pid + 1] >= 10) then
					tags[#tags + 1] = "U"
					tagz[#tagz + 1] = "~h~~q~[U]"
				end
			end
			if (script.get_global_i(1835502 + (1 + (pid * 3)) + 4) == 1) then
				tags[#tags + 1] = "B"
				tagz[#tagz + 1] = "~h~~y~[~h~~q~B~h~~y~]"
				elseif (script.get_global_i(1835502 + (1 + (pid * 3)) + 4) == 0) and Players[pid].bounty then
				Players[pid].bounty = false
				Players[pid].bountyvalue = nil
			end
			if player.is_player_modder(pid, -1) then
				tags[#tags + 1] = "M"
				tagz[#tagz + 1] = "~r~~h~[~y~~h~M~r~~h~]"
			end
			if not player.is_player_modder(pid, -1) then
				Modders_DB[pid].ismod = false
			end
			if Players[pid].isPaused and Settings["PlayerTagginghook"] then
				tags[#tags + 1] = "P"
				tagz[#tagz + 1] = "~y~~h~[~q~~h~P~y~~h~]"
			end
			if tbl.scid ~= scid then
				for cf_name,cf in pairs(tbl.features) do
					if cf.type == "toggle" or cf.type == "value_str" or cf.type == "value_i" or cf.type == "value_f" and cf.feat["on"] then
						cf.feat["on"] = false
					end
				end
				tbl.scid = scid
				if not isYou then
					--INFO: Modder shit
				end
			end
		end
		if player.is_player_host(pid) or pid == script.get_host_of_this_script() then
			SessionPlayers[pid].Name = name .. " " .. toname
			if #tagz > 0 then
				SessionPlayers[pid].Name = name .. " " .. toname .. table.concat(tagz)
			end
			else
			SessionPlayers[pid].Name = name
			if #tagz > 0 then
				SessionPlayers[pid].Name = name .. " " .. table.concat(tagz)
			end
		end
		if #tags > 0 then
			name = name .. "[" .. table.concat(tags) .."]"
		end
		if f.name ~= name then f.name = name end
		for cf_name,cf in pairs(tbl.features) do
			if (cf.type ~= "toggle" or cf.type ~= "value_str" or cf.type ~= "value_i" or cf.type ~= "value_f" or cf.feat.on) and cf.callback then
				local status, err = pcall(cf.callback)
				if not status then
					moist_notify("Error running feature " .. cf.callback .. "\nOn pid: " .. pid, "MoistScript PlayerLoop Error")
					--   Print(status .. err)
				end
			end
		end
		else
		if not f.hidden then
			f["hidden"] = true
			for cf_name,cf in pairs(tbl.features) do
				if cf.type == "toggle" or cf.type == "value_str" or cf.type == "value_i" or cf.type == "value_f" and cf.feat["on"] then
					cf.feat["on"] = false
				end
			end
		end
		Playerz[pid+1] = string.format("Player " .. pid)
	end
	end
	system.yield(Settings["playerlist_loop"])
	--return HANDLER_CONTINUE
	end
	for i = 0, 31 do
	playerFeatures[i].feat["hidden"] = false
	end
	return HANDLER_POP
	end)
	loopFeat2["hidden"] = false
	loopFeat2["on"] = true
end
ScriptLocals["playerlist"]()
--INFO: Startup
intgod = {}
function OnlineResetCheck()
	local canspectate 
	intgod[#intgod + 1] = menu.create_thread(inter_godcheck_thread, feat)
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			playerRDB(pid)
			Players[pid].JoinTime = os.time()
			Players[pid].isFriend = player.is_player_friend(pid)
			canspectate = script.get_global_i(1853348 + (1 + (pid * 834)) + 205 + 52)
			if canspectate == 0 then
				Players[pid].Spectatable = false
				elseif canspectate == 1 then
				Players[pid].Spectatable = true
			end
		end
		--intgod[pid + 1] =	menu.create_thread(inter_godcheck_thread, pid)
		--interiorcheckpid(pid, Settings["PlayerCheckVersion"])
		--	God_Check_pid(pid)
		--	God_Check1_pid(pid)
		--OrbitalProxy(pid)
		Session_Combat[pid] = {
			name = {},
			kills = {},
			killed = {},
		}
		Session_Combat[pid].name = tostring(player.get_player_name(pid))
		for i = 0, 31 do
			Session_Combat[pid].kills[i] = 0
			Session_Combat[pid].killed[i] = 0
		end
	end
end

notify_colour_setting()
Create_Csv()
TripletSpawns()
recentplayerslist()
--LoadRecent()
OnlineResetCheck()

end
--INFO: Script Initialisation
function Load_Module(scriptname)
	local file = Paths.Root .. "\\scripts\\" .. scriptname
	if not utils.file_exists(file) then return end
	local a = assert(loadfile(file))
	return a()
end
function RunMain()
	local status, err = pcall(Load_Moist)
	if err then
		--print(err)
		menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
	end
	Moist_Script_Main()
	-- local status, err = pcall(Moist_Script_Main)
	-- if err then
	-- --print(err)
	-- menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
	-- end
	local file = Paths.Cfg  .. "\\Moists_Modder_Module.lua"
	if utils.file_exists(file) then
		local status, err = pcall(Load_Module, "MoistsLUA_cfg\\Moists_Modder_Module.lua")
		if err then
			--print(err)
			menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
		end
	end
	local file = Paths.Cfg  .. "\\zones.lua"
	local status, err = pcall(Load_Module, "MoistsLUA_cfg\\zones.lua")
	if err then
		--print(err)
		menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
	end
	local file = Paths.Cfg  .. "\\CrashObjects.lua"
	local status, err = pcall(Load_Module, "MoistsLUA_cfg\\CrashObjects.lua")
	CrashObjectFunc()
	if err then
		--print(err)
		menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
	end
	local status, err = pcall(scriptloader)
	--print(err)
	if err then
		menu.notify(tostring(err), tostring(status), 5, 0xffff00ff)
	end
	menu.notify("All Modules & MoistScript\nLoaded and any Scripts for Autoload")
	MylastPID = player.player_id()
	--FIX: Load Saved Recent players
	--LoadRecents()
end
local YieldCount, count = nil, 0
YieldCount = utils.time()
local InstallState = MoistScript_SelfCheck()
startup = menu.add_feature("int MoistScript", "value_str", 0,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		return HANDLER_POP
	end
	if InstallState == "Pass" then
		if feat.value == 0 then
			if utils.time() - YieldCount > 9 then
				--INFO: **********Remove Personal Script Execution from Public**************
				RunMain()
				--	Load_Module("Moist_Multi_Blacklist.lua")
				startup["hidden"] = true
				startup["on"] = false
			end
			elseif feat.value == 1 then
			RunMain()
			--INFO: **********Remove Personal Script Execution from Public**************
			--			Load_Module("Moist_Multi_Blacklist.lua")
			startup["hidden"] = true
			startup["on"] = false
		end
		elseif InstallState == "Fail" then
		startup["hidden"] = false
		startup.name = "Script Self Check FAILED!"
		system.wait(700)
		startup.name = "Script Files Missing"
		system.wait(400)
		--	startup["on"] = false
	end
	-- KickFlagSetup()
	return HANDLER_CONTINUE
end)
startup:set_str_data({"Delayed Startup", "No Delay"})
startup["on"] = true
startup["hidden"] = true
startup["value"] = 1
--end
--MoistScript_Main()
--INFO: Script Exit Cleanup
event.add_event_listener("exit", function()
	for i = 1, #BlipIDs do
		ui.remove_blip(BlipIDs[i])
	end
	for pid = 0, 31 do
		if Players[pid].OTRBlipID ~= nil then
			ui.remove_blip(Players[pid].OTRBlipID)
		end
	end
	if ObitalBlip ~= nil then
		ui.remove_blip(ObitalBlip)
	end
	if #escort == 0 or #escort == nil then return end
	local pos = v3()
	pos.x = presets[1][2]
	pos.y = presets[1][3]
	pos.z = presets[1][4]
	for i = 1, #escort do
		network.request_control_of_entity(escort[i])
		ped.clear_ped_tasks_immediately(escort[i])
		entity.set_entity_coords_no_offset(escort[i], pos)
		entity.set_entity_as_no_longer_needed(escort[i])
		entity.delete_entity(escort[i])
	end
	if #escortveh == 0 or #escortveh == nil then return end
	for y = 1, #escortveh do
		network.request_control_of_entity(escortveh[y])
		entity.detach_entity(escortveh[y])
		entity.set_entity_coords_no_offset(escortveh[y], pos)
		entity.set_entity_as_no_longer_needed(escortveh[y])
		entity.delete_entity(escortveh[y])
	end
	if #boobs == 0 or #boobs == nil then return end
	for i = 1, #boobs do
		network.request_control_of_entity(boobs[i])
		ped.clear_ped_tasks_immediately(boobs[i])
		entity.set_entity_coords_no_offset(boobs[i], pos)
		entity.set_entity_as_no_longer_needed(boobs[i])
		entity.delete_entity(boobs[i])
	end
	if #boobveh == 0 or #boobveh == nil then return end
	for y = 1, #boobveh do
		network.request_control_of_entity(boobveh[y])
		entity.detach_entity(boobveh[y])
		entity.set_entity_coords_no_offset(boobveh[y], pos)
		entity.set_entity_as_no_longer_needed(boobveh[y])
		entity.delete_entity(boobveh[y])
	end
	if #lester == 0 or #lester == nil then return end
	for i = 1, #lester do
		network.request_control_of_entity(lester[i])
		ped.clear_ped_tasks_immediately(lester[i])
		entity.set_entity_coords_no_offset(lester[i], pos)
		entity.set_entity_as_no_longer_needed(lester[i])
		entity.delete_entity(lester[i])
	end
	if #lesveh == 0 or #lesveh == nil then return end
	for y = 1, #lesveh do
		network.request_control_of_entity(lesveh[y])
		entity.detach_entity(lesveh[y])
		entity.set_entity_coords_no_offset(lesveh[y], pos)
		entity.set_entity_as_no_longer_needed(lesveh[y])
		entity.delete_entity(lesveh[y])
	end
	if #SpawnedNPC == 0 or #SpawnedNPC == nil then return end
	for i = 1, #SpawnedNPC do
		network.request_control_of_entity(SpawnedNPC[i])
		ped.clear_ped_tasks_immediately(SpawnedNPC[i])
		entity.set_entity_coords_no_offset(SpawnedNPC[i], pos)
		entity.set_entity_as_no_longer_needed(SpawnedNPC[i])
		entity.delete_entity(SpawnedNPC[i])
	end
	if #SpawnedNPCV == 0 or #SpawnedNPCV == nil then return end
	for y = 1, #SpawnedNPCV do
		network.request_control_of_entity(SpawnedNPCV[y])
		entity.detach_entity(SpawnedNPCV[y])
		entity.set_entity_coords_no_offset(SpawnedNPCV[y], pos)
		entity.set_entity_as_no_longer_needed(SpawnedNPCV[y])
		entity.delete_entity(SpawnedNPCV[y])
	end
	for i = 1, #alkonost do
		entity.set_entity_as_no_longer_needed(alkonost[i])
		entity.delete_entity(alkonost[i])
	end
	for i = 1, #spawned_cunts do
		entity.set_entity_as_no_longer_needed(spawned_cunts[i])
		entity.delete_entity(spawned_cunts[i])
	end
	for i = 1, #spawned_cunt do
		entity.set_entity_as_no_longer_needed(spawned_cunt[i])
		entity.delete_entity(spawned_cunt[i])
	end
	for i = 1, #spawned_cunt1 do
		entity.set_entity_as_no_longer_needed(spawned_cunt1[i])
		entity.delete_entity(spawned_cunt1[i])
	end
	for i = 1, #spawned_cunt2 do
		entity.set_entity_as_no_longer_needed(spawned_cunt2[i])
		entity.delete_entity(spawned_cunt2[i])
	end
	for i = 1, #spawned_cunt3 do
		entity.set_entity_as_no_longer_needed(spawned_cunt3[i])
		entity.delete_entity(spawned_cunt3[i])
	end
	for i = 1, #lester do
		entity.set_entity_as_no_longer_needed(spawned_cunt3[i])
		entity.delete_entity(spawned_cunt3[i])
	end
	for i = 1, #huntv do
		entity.set_entity_as_no_longer_needed(huntv[i])
		entity.delete_entity(huntv[i])
	end
	if missilehook_id ~= 0 then
		hook.remove_script_event_hook(missilehook_id)
		missilehook_id = 0
	end
	event.remove_event_listener("chat", ChatEventID)
	event.remove_event_listener("modder", Modder_Event)
	event.remove_event_listener("modder", Modder_EventLog)
	event.remove_event_listener("modder", Modder_EventRem)
	event.remove_event_listener("player_join",  Join_Event_Check)
	event.remove_event_listener("player_join", joining_players_logger)
	event.remove_event_listener("player_join", Passive_trackerIN)
	event.remove_event_listener("player_leave", Passive_trackerOUT)
	local rootPath = os.getenv("APPDATA") .. "\\PopstarDevs\\2Take1Menu"
	local file = io.open(rootPath .. "\\lualogs\\Moists_debug.log", "a")
	io.output(file)
	local curdate_time
	local d, dtime, dt
	d = os.date()
	dtime = string.match(d, "%d%d:%d%d:%d%d")
	dt = os.date("%d/%m/%y")
	curdate_time = (string.format("[" .. dt .. "]" .. "[" .. dtime .. "]"))
	Text_Out = string.format("\n" .. curdate_time .. "State Reset" .. "\n")
	file:write(Text_Out)
	file:flush()
	file:close()
end)