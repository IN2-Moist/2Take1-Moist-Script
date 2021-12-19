--[[
Credits & Thanks to Kektram for help with OTR Code and code Advice
Thanks to haekkzer for his help and advice over time i was a tester for the menu
Big thanks goes Proddy for all his coding help advice and work to get shit done which without him alot of this
script would  not exist!
--]]


function Load_Moist()
	local Root = (utils.get_appdata_path("PopstarDevs", "2Take1Menu") ..  "\\scripts\\MoistsLUA_cfg" .. "\\MoistsScript_settings.ini")

if not utils.file_exists(Root) then
menu.notify("No Saved Settings Found!!", "MoistScript Settings", 8, 0xffffff00)
		
local file = io.open(Root, "a")
file:write(tostring("OSD.modvehspeed_osd=true") .. "\n")
file:write(tostring("OTR_Blips=true") .. "\n")
file:write(tostring("New_Notifys=true") .. "\n")
file:write(tostring("osd_My_speed2=true") .. "\n")
file:write(tostring("Notify_Me=true") .. "\n")
file:write(tostring("NotifyColorBDefault=0") .. "\n")
file:write(tostring("aimDetonate_control=false") .. "\n")
file:write(tostring("Auto_Off_RAC=false") .. "\n")
file:write(tostring("osd_My_speed1=false") .. "\n")
file:write(tostring("playerlist_loop=0") .. "\n")
file:write(tostring("GodCheckNotif=false") .. "\n")
file:write(tostring("Blacklist_kick=false") .. "\n")
file:write(tostring("RPG_HOTFIRE=false") .. "\n")
file:write(tostring("blipGodcheckvalue=1") .. "\n")
file:write(tostring("counter_Hotkey=false") .. "\n")
file:write(tostring("NotifyColorGDefault=255") .. "\n")
file:write(tostring("blipGodcheck=false") .. "\n")
file:write(tostring("chat_log=true") .. "\n")
file:write(tostring("PlayerGodCheckVersion=1") .. "\n")
file:write(tostring("lag_out=false") .. "\n")
file:write(tostring("no_peds=false") .. "\n")
file:write(tostring("no_traffic=false") .. "\n")
file:write(tostring("osd_date_time=true") .. "\n")
file:write(tostring("Blacklist_ON=false") .. "\n")
file:write(tostring("global_func.rapidfire_hotkey1=true") .. "\n")
file:write(tostring("NotifyColorRDefault=0") .. "\n")
file:write(tostring("OSDDebug2=false") .. "\n")
file:write(tostring("force_wPara=false") .. "\n")
file:write(tostring("NotifyColorDefault=0xffffff00") .. "\n")
file:write(tostring("EWO_TRYHARD=false") .. "\n")
file:write(tostring("global_func.thermal_stat_switch_hotkey=true") .. "\n")
file:write(tostring("spam_wait=1000") .. "\n")
file:write(tostring("Weapon_Recticle=false") .. "\n")
file:write(tostring("Weapon_TargetDot=false") .. "\n")
file:write(tostring("global_func.mk1boostrefill=false") .. "\n")
file:write(tostring("PlayerCheckVersion=1") .. "\n")
file:write(tostring("ScriptEvent_delay=2") .. "\n")
file:write(tostring("loop_feat_delay=0") .. "\n")
file:write(tostring("playerscriptinfo=false") .. "\n")
file:write(tostring("force_pBPH=false") .. "\n")
file:write(tostring("global_func.veh_rapid_fire=false") .. "\n")
file:write(tostring("GodCheck=false") .. "\n")
file:write(tostring("NotifyColorADefault=255") .. "\n")
file:write(tostring("RagDollHotKey=false") .. "\n")
file:write(tostring("MoistScript=2.0.5.7") .. "\n")
file:write(tostring("global_func.mk2boostrefill=true") .. "\n")
file:write(tostring("chat_debug=false") .. "\n")
file:write(tostring("orbitalProxyBlip=true") .. "\n")
todaysdate = os.date("%d-%m-%y")
file:write(tostring("DateSettingsSaved=" .. todaysdate) .. "\n")
file:write(tostring("force_wBPH=false") .. "\n")
file:write(tostring("WeaponFastSwitch=false") .. "\n")
file:write(tostring("Chat_Command=false") .. "\n")
file:write(tostring("RecentPlayer_Notify=true") .. "\n")
file:write(tostring("OSD.Player_bar=true") .. "\n")
file:write(tostring("Blacklist_Mark=false") .. "\n")
file:write(tostring("force_pPara=false") .. "\n")
file:write(tostring("AudioNotify=0") .. "\n")
file:write(tostring("VFX_NotifyGod_ON=false") .. "\n")
file:write(tostring("VFX_NotifyGod=0") .. "\n")
file:write(tostring("Combat_Tracker_Notify=false") .. "\n")
file:write(tostring("Combat_Tracker_DebugLog=true") .. "\n")
file:write(tostring("Combat_Tracker_ON=true") .. "\n")
file:write(tostring("Combat_Tracker_Value=0") .. "\n")
file:write(tostring("spec_osd=false") .. "\n")
file:close()

menu.notify("Default Settings Created!!\nPlease Set & Save Settings\nThen Reset Script State", "MoistScript Settings", 8, 0xffffffff)

end
end



Paths, Settings, threads, kick_param = {}, {}, {}, {}
local Passive_trackerOUT, Passive_trackerIN, ChatEventID, joining_players_logger, Join_Event_Check
Modders_DB = {{flag = {}, flags = {}, ismod = {}}}
SessionPlayers = {{pid = {}, Name = {}, Tags = {}, tags = {}, Scid = {}}}
Players = {{name = {}, orbnotify = {}, isHost = {}, isScHost = {}, isTyping = {}, isOTR = {}, OTRBlipID = {}, BlipPID = {}, pulse = {}, PedSpawned = {}, bounty = {}, bountyvalue = {}, isUnDead = {}, isPassive = {}, isTalking = {},  flag = {}, flags = {}, ismod = {}, isgod = {}, isvgod = {}, PlayerGodMode = {}, PlayerVehGodMode = {}, isint = {}, Interiorname = {}, isDead = {}, isDamagedbY = {},  isvis = {}, speedK = {}, speedM = {}, InteriorThread = {}, IsGodThread = {}, IsGodThread1 = {}}}
CurrentMenuVersion = "2.40.0"
MenuVersion = nil
function NewDLC()
	MenuVersion = menu.get_version()
	if MenuVersion ~= CurrentMenuVersion then

	return true
	elseif MenuVersion == CurrentMenuVersion then
	return false
	end
end
function moist_notify2(msg1, msg2, colour)

msg1 = msg1 or "MoistScript Putting Fun and Moisture over GTA ONLINE\nLike a Pussy Dripping ona Hard Cock!\nPenetrating Like a Missile from Lester on Opressor!!"
msg2 =  msg2 or "MoistScript 2.0.5.7"
local color = Settings["NotifyColorDefault"] or colour
menu.notify(msg1, msg2, 15, color)
end

function Moist_Script_Main()

math.randomseed(utils.time_ms())
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
Paths.tempchat = Paths.Cfg .. "\\TempChatSpam.ini"

Settings["MoistScript"] = "2.0.5.7"
Settings["DateSettingsSaved"] = ""
Settings["OSD.modvehspeed_osd"] = false
Settings["OSD.Player_bar"] = false
Settings["aimDetonate_control"] = false
Settings["osd_date_time"] = false
Settings["force_wPara"] = false
Settings["force_wBPH"] = false
Settings["lag_out"] = true
Settings["global_func.mk1boostrefill"] = false
Settings["global_func.mk2boostrefill"] = true
Settings["global_func.veh_rapid_fire"] = false
Settings["global_func.rapidfire_hotkey1"] = true
Settings["NotifyColorDefault"] = 0xffffff00
Settings["NotifyColorRDefault"] = 0
Settings["NotifyColorGDefault"] = 255
Settings["NotifyColorBDefault"] = 0
Settings["NotifyColorADefault"] = 255
Settings["Weapon_Recticle"] = false
Settings["no_peds"] = false
Settings["no_traffic"] = false
Settings["chat_log"] = true
Settings["Chat_Command"] = false
Settings["chat_debug"] = false
Settings["Blacklist_ON"] = false
Settings["Blacklist_Mark"] = false
Settings["Blacklist_kick"] = false
Settings["global_func.thermal_stat_switch_hotkey"] = true
Settings["osd_My_speed1"] = false
Settings["osd_My_speed2"] = true
Settings["RPG_HOTFIRE"] = false
Settings["counter_Hotkey"] = false
Settings["spam_wait"] = 0
Settings["GodCheck"] = false
Settings["GodCheckNotif"] = false
Settings["force_pPara"] = false
Settings["force_pBPH"] = false
Settings["Notify_Me"] = true
Settings["New_Notifys"] = true
Settings["playerscriptinfo"] = true
Settings["OSDDebug2"] = false
Settings["playerlist_loop"] = 1
Settings["loop_feat_delay"] = 1
Settings["ScriptEvent_delay"] = 3
Settings["PlayerCheckVersion"] = 1
Settings["PlayerGodCheckVersion"] = 1
Settings["RagDollHotKey"] = false
Settings["OTR_Blips"] = true
Settings["EWO_TRYHARD"] = false
Settings["RecentPlayer_Notify"] = true
Settings["Auto_Off_RAC"] = false
Settings["orbitalProxyBlip"] = false
Settings["WeaponFastSwitch"] = false
Settings["blipGodcheck"] = false
Settings["AudioNotify"] = 0
Settings["VFX_NotifyGod_ON"] = false
Settings["VFX_NotifyGod"] = 0
Settings["Add_Blips"] = false
Settings["blipGodcheckvalue"] = 1
Settings["Weapon_TargetDot"] = false
Settings["Combat_Tracker_Notify"] = false
Settings["Combat_Tracker_DebugLog"] = true
Settings["Combat_Tracker_ON"] = true
Settings["Combat_Tracker_Value"] = 0
Settings["spec_osd"] = false
Settings["missilehook"] = true

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
	print("No saved settings")
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
	--No saved settings
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
		Settings[key] = value
	end
end
-- Edit feature values based on new Settings values
end
function VersionCheck()
	
	Load_Settings()
if Settings["MoistScript"] ~= "2.0.5.7" then
	local saved_version = Settings["MoistScript"]
	Settings["MoistScript"] = "2.0.5.7"
	moist_notify2("Saved Version = " ..  saved_version .."\nThis Version = ".. Settings["MoistScript"], "Script Version Out of Date", 0xffffff)
	moist_notify2("Loading Current Saved Settings\nAdding New Settings\nSaving all", "Script Version Updated", 0xffffff)

	SaveSettings()
end
end
VersionCheck()
Load_Settings()

--TODO: Version Check only to enable when major settings are changed



function Debug_Out(text, adddate)
local file = io.open(Paths.debugfile, "a")
local Text_Out
if adddate == true or adddate == nil then
	local curdate_time = tostring(Cur_Date_Time() .. "\n")
	Text_Out = string.format(curdate_time .. text .."\n")
	elseif adddate == false then
	Text_Out = tostring(text .."\n")
end
	
	io.output(file)
	io.write(Text_Out)
	io.close()
end

function Print(text)
print(text)
local txt = Cur_Date_Time()
local file = io.open(Paths.Root .. "\\2Take1Menu.log", "a")
io.output(file)
io.write("\n" .. txt .. "\t")
io.write(tostring(text))
io.close()
end

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
function Cur_Date_Time()
local d, dtime, dt
d = os.date()
dtime = string.match(d, "%d%d:%d%d:%d%d")
dt = os.date("%d/%m/%y")
return (string.format("[" .. dt .. "]" .. "[" .. dtime .. "]"))
end
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


--TODO: Arrays for function variables
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

--TODO: Function Data & Entity Arrays

AttachedCunt={}AttachedCunt2={}
escort, escortveh, spawned_cunts, groupIDs, allpeds, allveh, allobj, allpickups, alkonost, kosatka, scids, spawned_cunt1, spawned_cunt2, spawned_cunt3, spawned_cunt, BlipIDs, EntityHash, EntityHash2, Thread2Id, Thread1Id, Esp_pid, markID, boobs, boobveh = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
lesveh, lester, lester_group = {}, {}, {}
lester, huntv = {}, {}

scidN = 0
local size_marker, marker_type, offsetz_marker = 1.0, 0, 1.5

--TODO: Function Localisation

local Online = network.is_session_started()

--TODO: Function Variables

local SessionHost, ScriptHost, pped, pos_bool, myplygrp, plygrp, RemoveBlacklistFeature, MainEntityHash, orbit_pid, Degree, mk_id, mod_flag_1, mod_flag_2, mod_flag_3, mod_flag_4, mod_flag_5, dist, wave_int_cur
EntityHash.pid, EntityHash2.pid = {}, {}
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
local note = false
spam_wait = Settings["spam_wait"]
preset_color = Settings["NotifyColorDefault"]
notifytype = Settings["NotifyVarDefault"]
local AnonymousBounty, trigger_time, cleanup_done, world_dumped, kicklogsent, logsent, spawnoptions_loaded  = true, nil, true, true, false, false, false
local ScreenText, ScreenText2, ScreenTextdebug = " ", " ", ""

--TODO: Function return values

function ModNum(a, b)
	return a - (math.floor(a/b)*b)
end

function RoundNum(num, dot)
	local mult = 10^(dot or 0)
	return math.floor(num * mult + 0.5) / mult
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
local SelfoffsetPos, offsetPos = v3(), v3()

function Self_offsetPos(pos, heading, distance)
heading = math.rad((heading - 180) * -1)
return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end
function get_offset2me(dist)
local pos = player.get_player_coords(player.player_id())
print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
SelfoffsetPos = Self_offsetPos(pos, player.get_player_heading(player.player_id()), dist)
print(string.format("%s, %s, %s", SelfoffsetPos.x, SelfoffsetPos.y, SelfoffsetPos.z))
return SelfoffsetPos
end
--TODO: offset to player calculation
function OffsetCoords(pos, heading, distance)
heading = math.rad((heading - 180) * -1)
return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset(pid, dist)
local pos = player.get_player_coords(pid)

offsetPos = OffsetCoords(pos, player.get_player_heading(pid), dist)

return offsetPos
end

function Get_Distance(pid)
local pped = player.get_player_ped(pid)
local playerCoord = player.get_player_coords(player.player_id())
local coord = entity.get_entity_coords(pped)
local xDis = playerCoord.x - coord.x;
local yDis = playerCoord.y - coord.y;
local distance = math.sqrt(xDis*xDis+yDis*yDis);
return distance
end

function Get_Dist2D_POS2POS(v3pos1, v3pos2)
    local Coord = v3pos1
    local coord = v3pos2
    local xDis = Coord.x - coord.x;
    local yDis = Coord.y - coord.y;
    local distance = math.sqrt(xDis*xDis+yDis*yDis);
    return distance
end


function Get_Distance2D(pid, v3pos)
local playerCoord = v3pos
local coord = player.get_player_coords(pid)
local xDis = playerCoord.x - coord.x;
local yDis = playerCoord.y - coord.y;
local distance = math.sqrt(xDis*xDis+yDis*yDis);
return distance
end

function Get_Distance3D(pid)
local pped = player.get_player_ped(pid)
local playerCoord = player.get_player_coords(player.player_id())
local coord = entity.get_entity_coords(pped)
local xDis = playerCoord.x - coord.x --PED
local yDis = playerCoord.y - coord.y	--PED
local zDis = playerCoord.z - coord.z	--PED
local distance = math.sqrt(xDis*xDis+yDis*yDis+zDis*zDis);
return distance
end
--TODO: interior Check

function Getinterior(pid)
	local interioor, pos = "", v3()
	for i = 1, #InteriorTypes do
		pos = player.get_player_coords(pid)
	interioor = interior.get_interior_at_coords_with_type(pos, InteriorTypes[i])
	if interioor ~= 0 then
	moist_notify(tostring(interioor) .. "\n" .. tostring(pos), "Interior by type at POS")
	end
	end
end
	


function Get_Dist3D(pid, v3pos)
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
		
        interior_thread[pid+1] = menu.create_thread(interiorcheck_1_thread, { pid = player_id } )

        local i = #feat + 1
        feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
        feat[i].data = {thread = interior_thread[pid+1]}
    elseif version == 2 then
        player_id = pid
        pid = player_id
		local i = pid + 32
		interior_thread[i] = menu.create_thread(interiorcheck1_thread, pid)
        interior_thread[pid+1] = menu.create_thread(interiorcheck2_thread, pid)
        local i = #feat + 1
        feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
        feat[i].data = {thread = interior_thread[pid+1]}
    end


end

function OrbitalProxy(pid)
player_id = pid
pid = player_id
OrbitalProxyThread[pid+1] = menu.create_thread(Orbital_Proxy_Thread, pid)
local i = #feat + 1
feat[i] = menu.add_feature("Delete interior Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
feat[i].data = {thread = OrbitalProxyThread[pid+1]}
end



Orbital_Proxy_Thread = function(pid)
	local orbprox
	while true do
	if player.is_player_valid(pid) then
	if player.get_player_scid(pid) ~= 4294967295 then
		orbprox = Get_Distance2D(pid, v3(339.379,4836.629,-58.999))
		if orbprox < 18 and not Players[pid].orbnotify then
				moist_notify("Player Close To Orbital Room!\n" .. (Players[pid].name or "PID:" ..pid) .. " is: " .. orbprox .. " Away from entrance", "Possible Orbital User")
				Players[pid].orbnotify = true
			elseif orbprox > 18 and Players[pid].orbnotify then
			Players[pid].orbnotify = false
			end
		end
		system.yield(10)
	end
		system.yield(100)
	end
		system.yield(100)
end

interiorcheck1_thread = function(pid)
local apartmen, orbprox
local interiorr, pped
local exitfound = false
while true do
	if player.get_player_ped(pid) ~= 0 or player.get_player_ped(pid) ~= nil then
		if interior.get_interior_from_entity(pped) ~= 0 then
		Players[pid].isint = true
		Players[pid].PedSpawned = false
		end

		orbprox = Get_Distance2D(pid, v3(339.379,4836.629,-58.999))
		if orbprox < 18 and not Players[pid].orbnotify then
			if player.get_player_scid(pid) ~= 4294967295 then
				moist_notify("Player Close To Orbital Room!\n" .. (Players[pid].name or "PID:" ..pid) .. " is: " .. orbprox .. " Away from entrance", "Possible Orbital User")
				Players[pid].orbnotify = true
			end
			elseif orbprox > 18 and Players[pid].orbnotify then
			Players[pid].orbnotify = false
		end
		Players[pid].isint, Players[pid].Interiorname, Position  = GetPlayerinterior(pid)
		system.wait(70)
	end
		

	system.yield(6)
end
	system.yield(6)
end

interiorcheck_1_thread = function(pid)
    local apartmen, orbprox, pped
    while true do

        pped = player.get_player_ped(pid)
        if interior.get_interior_from_entity(pped) ~= 0 then
            Players[pid].isint = true
            Players[pid].PedSpawned = false
        end

        local pos = player.get_player_coords(pid)
        if interior.get_interior_from_entity(pped) ~= 0 and player.is_player_playing(pid) then
            Players[pid].isint = true
        elseif pos.z < -120 then
            Players[pid].isint = true
        elseif pos.z > -90 then
            Players[pid].isint = false
        elseif interior.get_interior_from_entity(pped) == 0 and player.is_player_playing(pid) then
            for i = 1, #interiors do
                apartmen = Get_Dist3D(pid, interiors[i][2])
                if apartmen < 60 then
                    Players[pid].isint = true
                    Players[pid].PedSpawned = false

                    goto interiorcheckEnd
                end
                system.yield(10)
            end

            system.yield(10)

            ::interiorcheckEnd::

            system.yield(600)
        end

        system.yield(600)

    end

end

--TODO: New Player Interior Check

function GetPlayerinterior(pid)
	
	local apartmen, interiorr, found
	for i = 1, #interiors do
	apartmen = Get_Dist3D(pid, interiors[i][2])
	if apartmen < 60 then
	found = true
	return true, tostring(interiors[i][1]), tostring(interiors[i][2]), (i)
end

end
if found ~= true then
	Players[pid].isint = false
	return false
end
end

function GetPlayer_onlineinterior(pid)
	
	local apartmen, interiorr, found
	for i = 1, #onlineinteriors do
	apartmen = Get_Dist3D(pid, onlineinteriors[i][2])
	if apartmen < 60 then
	found = true
	return true, tostring(onlineinteriors[i][1]), (i)
end

end
if found ~= true then
	return false
end
end

interiorcheck2_thread = function(pid)
local apartmen, interiorr 
pped = player.get_player_ped(pid)
while true do
	if player.is_player_valid(pid) and player.get_player_scid(pid) ~= 4294967295 then
		if interior.get_interior_from_entity(pped) ~= 0 then
		Players[pid].isint = true
		Players[pid].PedSpawned = false
		end
		if Players[pid].isint == true then
		Players[pid].isint, Players[pid].Interiorname, Position, id  = GetPlayerinterior(pid)
		end

	if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
	Players[pid].isint, Players[pid].Interiorname, Position, id  = GetPlayerinterior(pid)
	system.yield(6)
	end
	system.yield(6)
end
system.yield(6)
end
system.yield(6)

end


-- Player IP
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

function veh_check(pid)
pped = player.get_player_ped(pid)
if player.is_player_in_any_vehicle(pid) or ped.is_ped_in_any_vehicle(pped) then
	local plyveh, pedveh = player.is_player_in_any_vehicle(pid),  ped.is_ped_in_any_vehicle(pped)
	moist_notify("Player in Veh Check: " .. tostring(plyveh) .."\nPlayer Ped in Veh Check: " ..  tostring(pedveh), "Player Vehicle Check")
	local vehchk1 = ped.get_vehicle_ped_is_using(pped)
	local vehchk2 = player.get_player_vehicle(pid)

	moist_notify("Player Vehicle ID: " .. vehchk2 .."\nPlayers Ped Vehicle ID: " .. vehchk1, "Player Vehicle Check")
end
end

--TODO: **** Player Info Check ****
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
	
	
return ("~h~~r~H.~o~P~w~ | ~y~A:~r~  " .. health .. "~w~ / ~o~" .. maxhp .. "~h~~w~ | ~y~" .. armo ..  "    ~q~~h~BlipID: " .. PlayerBlip),("\n~h~~w~Vehicle/Attached =~y~ " .. tostring(player.is_player_in_any_vehicle(pid)) .. "~w~ /~y~ " ..  tostring(entity.is_entity_attached(pped)) .. "\t" .. attachedhash .. "~w~)"), ("\n~b~Team~w~ | ~y~Group | ~q~Relhash: ~b~\t~h~" .. plyteam  .."~w~ | ~y~" .. plygrp .. "~w~ | ~q~" .. relhash .."\t"), ("~w~\nNetHash:\t\t " .. playern)

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
function dec2ip(decip)
local div, quote, ip;
for i = 3, 0, -1 do
	div = 2 ^ (i * 8)
	quote, decip = math.floor(decip / div), math.fmod(decip, div)
	if nil == ip then
		ip = quote
		else ip = ip .. "." .. quote
	end
end
return ip
end

function Get_Partial_IP(ip)
	local text, check = ip, ""
local sep = text:find(".", 1, true)
--print(sep)
if sep then
				local Part = text:sub(1, sep - 1)
				check = check .. Part .. "."
			--	print(Part)
				local value = text:sub(sep + 1)
				text = value
			--	print(value)
				end
				local sep = text:find(".", 1, true)
--print(sep)
if sep then
				local Part = text:sub(1, sep - 1)
				check = check .. Part .. "."
			---	print(Part)
				local value = text:sub(sep + 1)
				text = value
			--	print(value)
				end
				local sep = text:find(".", 1, true)
--print(sep)
if sep then
				local Part = text:sub(1, sep - 1)
				check = check .. Part
			--	print(Part)
				local value = text:sub(sep + 1)
				text = value
			--	print(value)
				end
			--	print(check)
	return check
end

function moist_notify(msg1, msg2, colour)
if Settings["Notify_Me"] == true then
	colour = colour or Settings["NotifyColorDefault"]
	moist_notify2(msg1, msg2, colour)
	else
end
end

ped_group_setup = function()
	
	local i = #groupIDs + 1
	groupIDs[i] = ped.create_group()
	
	local i = #groupIDs + 1	
	groupIDs[i] = ped.create_group()
	ped.set_relationship_between_groups(0, groupIDs[1], groupIDs[2])
end

--TODO: Preset Data Arrays
local presets, escort_ped, veh_list, ped_wep, missions, BountyPresets, ssb_wep, StrikeGive, eject, heiststat_setup, decorators, int_flags, ObitalBlip
local spam_presets, spamm, spammRU = {}, {}, {}
spamm.var, spammRU.var = {}, {}
local mod, modvalue, pedspawns, Group_Hate, Support_Group
local Ped_Haters, playergroups, playerpeds = {}, {}, {}
eject = {0, 1, 16, 64, 256, 4160, 262144, 320, 512, 131072}
spam_preset={
	{"Love Me","Love Me"},
	{"Eat Dick","EAT D I C K  !"},
	{"DEATH TO KOREA(in Korean)","데스 투 코리아"},
	{"Fake Chinese Looking Boxes","�� ��� � ���� �� � �� ���� ��� �� � �� �� �"},
	{"Fake Chinese Sell Bot","� ��� ��\nGTA5:� �� ��� ����� Discord:���#��� ����"},
	{"Mass Locksign Spam","ΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ"},
	{"Mass R* Verified Spam","¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦"},
	{"Mass R* Logo Spam","∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑∑"},
	{"Fuck You! MassSpam","Fuck You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You!\nFuck You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You! Fuck  You!"},
	{"Suck Cum Drip Cunt MassSpam","SUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \nSUCK MY C U M DRIPPING C U N T ! YOU F U C K ! \n"},
	{"FAGGOT","F A G G O T"},
	{"Cry","CRY"},
	{"Suck","SUCK"},
	{"You Suck MassSpam","YOU SUCK \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n "},
	{"Insert Space"," "},
	{"Big ! ScreenSpam",string.format("!			!			!			!			!			!			!			!			!			\n!			!			!			!			!			!			!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			")},
	{"Weird Ascii line","��������������������������������������������������������������������������͹"}
}
russian_spam={{"Die Infidel", "СМЕРТЬ ИНФИДЕЛ\n\nУМРИ НЕВЕРНЫЙ"},{"Talk English Russian scum", "Говорите по-английски, русские подонки!"},{"Want crashing", "хотите аварийного сбоя"},{"Russia sucks","Россия отстой"},{"iwill pleasure your mom","Я собираюсь, порадовать твою маму! Потом твою сестру! Потм обоих одновременно на твоей кровати."},{"Death to Russia","Смерть России!"},{"Kill all Russians","Убить всех русских"},{"Suck Russia","Соси, Россия"},{"Pussy","киска"},{"Cunt","пизда"},{"Learn English russian Sucks","Учите английский! Русский отстой! !"},{"I'm going to kill all russians!\nPlease Identify Yourself and prepare to die!","Я собираюсь убить всех русских! Пожалуйста идентифицируйте себя, и приготовьтесь умереть!"}}presets={{"beyond_limits",-173663.281250,915722.000000,362299.750000},{"God Mode Death (Kill Barrier)",-1387.175,-618.242,30.362},{"Ocean God Mode Death\n(Outside Limits Deep Ocean)",-5784.258301,-8289.385742,-136.411270},{"Chiliad",491.176,5529.808,777.503},{"Lesters House",1275.544,-1721.774,53.967},{"arena",-264.297,-1877.562,27.756},{"ElysianIslandBridge",-260.923,-2414.139,124.008},{"LSIAFlightTower",-983.292,-2636.995,89.524},{"TerminalCargoShip",983.303,-2881.645,21.619},{"ElBurroHeights",1583.022,-2243.034,93.265},{"CypressFlats",552.672,-2218.876,68.981},{"LaMesa",1116.815,-1539.787,52.146},{"SupplyStreet",777.631,-695.813,28.763},{"Noose",2438.874,-384.409,92.993},{"TatavianMountains",2576.999,445.654,108.456},{"PowerStation",2737.046,1526.873,57.494},{"WindFarm",2099.765,1766.219,102.698},{"Prison",1693.473,2652.971,61.335},{"SandyShoresRadioTower",1847.034,3772.019,33.151},{"AlamoSea",719.878,4100.993,39.154},{"RebelRadioTower",744.500,2644.334,44.400},{"GreatChaparral",-291.035,2835.124,55.530},{"ZancudoControlTower",-2361.625,3244.962,97.876},{"NorthChumash(Hookies)",-2205.838,4298.805,48.270},{"AltruistCampRadioTower",-1036.141,4832.858,251.595},{"CassidyCreek",-509.942,4425.454,89.828},{"MountChiliad",462.795,5602.036,781.400},{"PaletoBayFactory",-125.284,6204.561,40.164},{"GreatOceanHwyCafe",1576.385,6440.662,24.654},{"MountGordoRadioTower",2784.536,5994.213,354.275},{"MountGordoLighthouse",3285.519,5153.820,18.527},{"GrapeSeedWaterTower",1747.518,4814.711,41.666},{"TatavianMountainsDam",1625.209,-76.936,166.651},{"VinewoodHillsTheater",671.748,512.226,133.446},{"VinewoodSignRadioTowerTop",751.179,1245.13,353.832},{"Hawik",472.588,-96.376,123.705},{"PacificSrandardBank",195.464,224.341,143.946},{"WestVinewoodCrane",-690.273,219.728,137.518},{"ArcadiasRadioTower",-170.232,-586.307,200.138},{"HookahPalaceSign",-1.414,-1008.324,89.189},{"MarinaAirportRadioTower",-697.010,-1419.530,5.001},{"DelperoFerrisWheel",-1644.193,-1114.271,13.029},{"VespucciCanalsClockTower",-1238.729,-853.861,77.758},{"DelPeroNrMazebankwest",-1310.777,-428.985,103.465},{"pacifficBluffs",-2254.199,326.088,192.606},{"GWC&GolfingSociety",-1292.052,286.209,69.407},{"Burton",-545.979,-196.251,84.733},{"LosSantosMedicalCenter",431.907,-1348.709,44.673},{"BanhamCanyon",-3085.451,774.426,20.237},{"TongvaHills",-1874.280,2064.565,150.852},{"SanChianskiMountainRange",2900.166,4325.987,102.101},{"HumaineLabs",3537.104,3689.238,45.228},{"YouToolStoreSanChianski",2761.944,3466.951,55.679},{"GalileoObservatory",-422.917,1133.272,325.855},{"GrndSeroraDesertCementwks",1236.649,1869.214,84.824}}
escort_ped={{"juggalo_01",0xDB134533},{"topless_01",0x9CF26183},{"juggalo_02",0x91CA3E2C},{"lester crest",0xB594F5C3},{"cop",0x9AB35F63},{"mp_agent14",0x6DBBFC8B},{"ramp_marine",0x616C97B9},{"trafficwarden",0xDE2937F3},{"lestercrest_2",0x6E42FD26},{"lestercrest",0x4DA6E849},{"agent14",0xFBF98469},{"m_pros_01",0x6C9DD7C9},{"waremech_01",0xF7A74139},{"weapexp_01",0x36EA5B09},{"weapwork_01",0x4186506E},{"securoguard_01",0xDA2C984E},{"armoured_01",0xCDEF5408},{"armoured_01",0x95C76ECD},{"armoured_02",0x63858A4A},{"marine_01",0xF2DAA2ED},{"marine_02",0xF0259D83},{"security_01",0xD768B228},{"snowcop_01",0x1AE8BB58},{"prisguard_01",0x56C96FC6},{"pilot_01",0xE75B4B1C},{"pilot_02",0xF63DE8E1},{"blackops_01",0xB3F3EE34},{"blackops_02",0x7A05FA59},{"blackops_03",0x5076A73B},{"hwaycop_01",0x739B1EF5},{"marine_01",0x65793043},{"marine_02",0x58D696FE},{"marine_03",0x72C0CAD2},{"ranger_01",0xEF7135AE},{"robber_01",0xC05E1399},{"sheriff_01",0xB144F9B9},{"pilot_01",0xAB300C07},{"swat_01",0x8D8F1B10},{"fibmugger_01",0x85B9C668},{"juggernaut_01",0x90EF5134},{"rsranger_01",0x3C438CD2},{"mp_m_niko_01",4007317449}}
missions={"Force to Severe Weather","Force to Half Track","Force to Night Shark AAT","Force to APC Mission","Force to MOC Mission","Force to Tampa Mission","Force to Opressor Mission1","Force to Opressor Mission2"}
--ped_wep={{"unarmed",0xA2719263},{"parachute",0xfbab5776},{"weapon_handcuffs",0xD04C944D},{"Garbage Bag",0xE232C28C},{"WEAPON_FIREWORK",0x7F7497E5},{"stone_hatchet",0x3813FC08},{"knife",0x99B507EA},{"bat",0x958A4A8F},{"weapon_machinepistol",0xDB1AA450},{"raypistol",0xAF3696A1},{"stungun",0x3656C8C1},{"weapon_gadgetpistol",0x57A4368C},{"raycarbine",0x476BF15},{"combatmg_mk2",0xDBBD7280},{"Special RPG",1752584910},{"Standard RPG",2982836145},{"railgun",0x6D544C99},{"minigun",0x42BF8A85},{"Smoke GrenadeLauncher",0x4DD2DC56},{"WEAPON_REMOTESNIPER",0x33058E22},{"rayminigun",0xB62D1F6}}
ped_wep={"weapon_unarmed","weapon_parachute","weapon_handcuffs","weapon_Garbage Bag","weapon_FIREWORK","weapon_stone_hatchet","weapon_knife","weapon_bat","weapon_machinepistol","weapon_raypistol","weapon_stungun","weapon_gadgetpistol","weapon_raycarbine","weapon_combatmg_mk2","weapon_Special RPG","weapon_Standard RPG","weapon_railgun","weapon_minigun","weapon_Smoke GrenadeLauncher","weapon_REMOTESNIPER","weapon_rayminigun"}
veh_list={{"buzzard",0x2F03547B,nil,nil},{"savage",0xFB133A17,nil,nil},{"seasparrow",0xD4AE63D9,10,1},{"valkyrie2",0x5BFA5C4B,nil,nil},{"valkyrie",0xA09E15FD,nil,nil},{"boxville5",0x28AD20E1,nil,nil},{"apc",0x2189D250,10,0},{"oppressor2",0x7B54A9D3,10,1},{"oppressor",0x34B82784,10,0},{"ruiner2",0x381E10BD,nil,nil},{"scramjet",0xD9F0503D,10,0},{"stromberg",0x34DBA661},{"tampa3",0xB7D9F7F1},{"khanjali",0xAA6F980A,nil,nil},{"insurgent3",0x8D4B7A8A,nil,nil},{"insurgent",0x9114EADA,nil,nil},{"limo2",0xF92AEC4D,nil,nil},{"mower",0x6A4BD8F6,nil,nil},{"police2",0x9F05F101,nil,nil},{"police3",0x71FA16EA,nil,nil},{"police4",0x8A63C7B9,nil,nil},{"police",0x79FBB0C5,nil,nil},{"policeb",0xFDEFAEC3,nil,nil},{"policeold1",0xA46462F7,nil,nil},{"policeold2",0x95F4C618,nil,nil},{"policet",0x1B38E955,nil,nil},{"polmav",0x1517D4D9,nil,nil},{"sheriff2",0x72935408,nil,nil},{"sheriff",0x9BAA707C,nil,nil},{"phantom2",0x9DAE1398,nil,nil},{"ruiner3",0x2E5AFD37,nil,nil},{"scorcher",0xF4E1AA15,nil,nil},{"bmx",0x43779C54,nil,nil}}
BountyPresets={0,1,10,50,70,100,250,500,600,750,800,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000}
ssb_wep_label={"SNIPERRIFLE","HEAVYSNIPER","REMOTESNIPER","GRENADELAUNCHER","TRAILER_DUALAA","PLAYER_BULLET","PLAYER_LAZER","AIRSTRIKE_ROCKET","SPACE_ROCKET","PLANE_ROCKET","AVENGER_CANNON","AIR_DEFENCE_GUN"}
StrikeGive_label={"AIRSTRIKE_ROCKET","AVENGER_CANNON","KHANJALI_CANNON_HEAVY","GRENADELAUNCHER","PLAYER_LAZER","AKULA_BARRAGE","SPACE_ROCKET","PLANE_ROCKET","AIR_DEFENCE_GUN","GRENADELAUNCHER_SMOKE","FIREWORK","RUINER_ROCKET","DELUXO_MISSILE","HOMINGLAUNCHER","STINGER","STICKYBOMB","PROXMINE"}
ssb_wep={"WEAPON_SNIPERRIFLE","WEAPON_HEAVYSNIPER","WEAPON_REMOTESNIPER","WEAPON_GRENADELAUNCHER","VEHICLE_WEAPON_TRAILER_DUALAA","VEHICLE_WEAPON_PLAYER_BULLET","VEHICLE_WEAPON_PLAYER_LAZER","WEAPON_AIRSTRIKE_ROCKET","VEHICLE_WEAPON_SPACE_ROCKET","VEHICLE_WEAPON_PLANE_ROCKET","VEHICLE_WEAPON_AVENGER_CANNON","WEAPON_AIR_DEFENCE_GUN"}StrikeGive={"WEAPON_AIRSTRIKE_ROCKET","VEHICLE_WEAPON_AVENGER_CANNON","VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY","WEAPON_GRENADELAUNCHER","VEHICLE_WEAPON_PLAYER_LAZER","VEHICLE_WEAPON_AKULA_BARRAGE","VEHICLE_WEAPON_SPACE_ROCKET","VEHICLE_WEAPON_PLANE_ROCKET","WEAPON_AIR_DEFENCE_GUN","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_FIREWORK","VEHICLE_WEAPON_RUINER_ROCKET","VEHICLE_WEAPON_DELUXO_MISSILE","WEAPON_HOMINGLAUNCHER","WEAPON_STINGER","WEAPON_STICKYBOMB","WEAPON_PROXMINE"}
heiststat_setup={{"H3_COMPLETEDPOSIX",-1},{"H3OPT_APPROACH",1},{"H3_HARD_APPROACH",3},{"H3OPT_TARGET",3},{"H3OPT_POI",1023},{"H3OPT_ACCESSPOINTS",2047},{"H3OPT_BITSET1",-1},{"H3OPT_CREWWEAP",1},{"H3OPT_CREWDRIVER",1},{"H3OPT_CREWHACKER",5},{"H3OPT_WEAPS",1},{"H3OPT_VEHS",3},{"H3OPT_DISRUPTSHIP",3},{"H3OPT_BODYARMORLVL",3},{"H3OPT_KEYLEVELS",2},{"H3OPT_MASKS",math.ceil(math.random(0,12))},{"H3OPT_BITSET0",-1}}AmmoType={{"FullMetalJacket",1586900444},{"FullMetalJacket",4126262806},{"FullMetalJacket",234717365},{"FullMetalJacket",758230489},{"FullMetalJacket",3162174467},{"Tracer",3101486635},{"Tracer",1226421483},{"Tracer",1569785553},{"Tracer",1184011213},{"HollowPoint",670318226},{"HollowPoint",3458447638},{"HollowPoint",2089185906},{"Explosive",2916183225},{"Explosive",3985664341},{"Incendiary",2878251257},{"Incendiary",1461941360},{"Incendiary",2465278413},{"Incendiary",3685537684},{"Incendiary",3962074599},{"Incendiary",796697766},{"ArmourPiercing",784861712},{"ArmourPiercing",2797387177},{"ArmourPiercing",423744068},{"ArmourPiercing",423744068},{"ArmourPiercing",1923327840}}
ptfx_dictasset = {{"scr_bike_adversary", "scr_adversary_ped_light_good"},{"scr_bike_adversary", "scr_adversary_ped_light_bad"},{"scr_bike_adversary", "scr_adversary_ped_glow"},{"scr_ojdg4_water_exp", "scr_oddjobtraffickingair"},{"veh_xs_vehicle_mods", "veh_nitrous"},{"scr_xs_celebration", "scr_xs_confetti_burst"},{"scr_xs_celebration", "scr_xs_money_rain"},{"scr_xs_celebration", "scr_xs_money_rain_celeb"},{"proj_indep_firework_v2", "scr_firework_indep_spiral_burst_rwb"},{"proj_indep_firework_v2", "scr_firework_indep_burst_rwb"},{"proj_indep_firework_v2", "scr_firework_indep_ring_burst_rwb"},{"weap_xs_weapons", "muz_xs_sr_raygun"},{"wpn_flare", "proj_heist_flare_trail"},{"wpn_indep_firework", "muz_indep_firework  "},{"proj_indep_firework_v2", "scr_firework_indep_repeat_burst_rwb"},{"proj_indep_firework_v", "scr_xmas_firework_burst_fizzle"},{"scr_indep_fireworks", "scr_indep_firework_fountain"},{"scr_indep_fireworks", "scr_indep_firework_starburst"},{"scr_indep_fireworks", "scr_indep_firework_shotburst"},{"proj_indep_firework", "scr_indep_firework_air_burst"},{"scr_weap_bombs", "scr_bomb_gas"},{"scr_dlc_independence", "proj_indep_flare_trail"},{"scr_bike_adversary", "scr_adversary_foot_flames"},{"scr_bike_adversary", "scr_adversary_slipstream"},{"scr_indep_fireworks", "scr_indep_firework_trailburst"},{"scr_indep_fireworks", "scr_indep_firework_trail_spawn"},}
ptfx_Label = {"adversary_ped_light_good","adversary_ped_light_bad","adversary_ped_glow","oddjobtraffickingair","veh_nitrous","xs_confetti_burst","xs_money_rain","xs_money_rain_celeb","firework_indep_spiral_burst_rwb","firework_indep_burst_rwb","firework_indep_ring_burst_rwb","muz_xs_sr_raygun","proj_heist_flare_trail","muz_indep_firework  ","firework_indep_repeat_burst_rwb","xmas_firework_burst_fizzle","indep_firework_fountain","indep_firework_starburst","indep_firework_shotburst","indep_firework_air_burst","bomb_gas","proj_indep_flare_trail","adversary_foot_flames","adversary_slipstream","indep_firework_trailburst","indep_firework_trail_spawn"}
Cus_Obj = {"xm_prop_base_crew_emblem"}
InteriorTypes = {"v_31_tun_05","xm_x17dlc_int_02","apa_v_mp_h_01","apa_v_mp_h_02","apa_v_mp_h_03","apa_v_mp_h_04","apa_v_mp_h_05","apa_v_mp_h_06","apa_v_mp_h_07","apa_v_mp_h_08","apa_v_mp_stilts_a","apa_v_mp_stilts_b","hei_dlc_apart_high2_new","hei_dlc_apart_high_new","v_methlab","v_shop_247","v_gen_liquor","v_gasstation","v_garagem","hei_dlc_garage_high_new","v_garagem","v_garages","hei_dlc_garage_high_new","v_garagem","v_garages","vbca_tunnel1","vbca_tunnel2","vbca_tunnel3","vbca_tunnel4","vbca_tunnel5","v_31_tun_01","v_31_newtunnel1","v_31_newtun5","v_31_newtun4b","v_31_newtun3","v_31_newtun2","sm20_tun4","sm20_tun3","sm20_tun2","sm20_tun1","sc1_rd_inttunshort","sc1_rd_inttun3b_end","sc1_rd_inttun3b","sc1_rd_inttun3","sc1_rd_inttun2b_end","sc1_rd_inttun2b","sc1_rd_inttun2","sc1_rd_inttun1","kt1_04_roadtunnel_int","kt1_03_carpark_int","id2_21_a_tun5","id2_21_a_tun4","id2_21_a_tun3","id2_21_a_tun2","id2_21_a_tun1","id1_11_tunnel8_int","id1_11_tunnel7_int","id1_11_tunnel6_int","id1_11_tunnel5_int","id1_11_tunnel4_int","id1_11_tunnel3_int","id1_11_tunnel2_int","id1_11_tunnel1_int","dt1_rd1_tun3","dt1_rd1_tun2","dt1_rd1_tun","cs4_rwayb_tunnelint","cs3_03railtunnel_int4","cs3_03railtunnel_int3","cs3_03railtunnel_int2","cs3_03railtunnel_int1","cs2_roadsb_tunnel_03","cs2_roadsb_tunnel_02","cs2_roadsb_tunnel_01","cs1_14brailway6","cs1_14brailway5","cs1_14brailway4","cs1_14brailway3","cs1_14brailway2","cs1_14brailway1","cs1_12_tunnel03_int","cs1_12_tunnel02_int","cs1_12_tunnel01_int","ch1_roadsdint_tun2","ch1_roadsdint_tun1","bt1_04_carpark","sm20_tun4","sm20_tun3","sm20_tun2","sm20_tun1","kt1_04_roadtunnel_int","kt1_03_carpark_int","dt1_rd1_tun3","dt1_rd1_tun2","dt1_rd1_tun","cs2_roadsb_tunnel_03","cs2_roadsb_tunnel_02","cs2_roadsb_tunnel_01","cs1_12_tunnel03_int","cs1_12_tunnel02_int","cs1_12_tunnel01_int","ch1_roadsdint_tun2","ch1_roadsdint_tun1","bt1_04_carpark"}


Weapon_Lists = {}
Weapon_Lists_type = {"Melee","Handguns","Submachine_Guns","Shotguns","Assault_Rifles","Machine_Guns","Sniper_Rifles","Heavy_Weapons","Throwables","Miscellaneous"}
--Weapon_Lists[1] = {"Melee" = {}, "Handguns" = {}, "Submachine_Guns" = {}, "Shotguns" = {}, "Assault_Rifles" = {}, "Machine" = {}, "Sniper_Rifles" = {}, "Heavy_Weapons" = {}, "Throwables" = {}, "Miscellaneous" = {}}}

Weapon_Lists.Melee = {"unarmed","Cougar","Animal","Antique Cavalry Dagger","Baseball Bat","Broken Bottle","Crowbar","Flashlight","Golf Club","Hammer","Hatchet","Brass Knuckles","Knife","Machete","Switchblade","Nightstick","Pipe Wrench","Battle Axe","Pool Cue","Stone Hatchet"}

Weapon_Lists.Handguns = {"Pistol","PistolMkII","CombatPistol","APPistol","StunGun","Pistol.50","SNSPistol","SNSPistolMkII","HeavyPistol","VintagePistol","FlareGun","MarksmanPistol","HeavyRevolver","HeavyRevolverMkII","DoubleActionRevolver","Up-n-Atomizer","CeramicPistol","NavyRevolver","PericoPistol",}

Weapon_Lists.Submachine_Guns = {"Micro SMG","SMG","SMG Mk II","Assault SMG","Combat PDW","Machine Pistol","Mini SMG","Unholy Hellbringer"}

Weapon_Lists.Shotguns = {"Pump Shotgun","Pump Shotgun Mk II","Sawed-Off Shotgun","Assault Shotgun","Bullpup Shotgun","Musket","Heavy Shotgun","Double Barrel Shotgun","Sweeper Shotgun","Combat Shotgun"}

Weapon_Lists.Assault_Rifles = {"Assault Rifle","Assault Rifle Mk II","Carbine Rifle","Carbine Rifle Mk II","Advanced Rifle","Special Carbine","Special Carbine Mk II","Bullpup Rifle","Bullpup Rifle Mk II","Compact Rifle","Military Rifle"}

Weapon_Lists.Machine_Guns = {"MG","Combat MG","Combat MG Mk II","Gusenberg Sweeper"}

Weapon_Lists.Sniper_Rifles = {"Sniper Rifle","Heavy Sniper","Heavy Sniper Mk II","Marksman Rifle","Marksman Rifle Mk II"}

Weapon_Lists.Heavy_Weapons = {"RPG","Grenade Launcher","Grenade Launcher Smoke","Minigun","Firework Launcher","Railgun","Homing Launcher","Compact Grenade Launcher","Widowmaker"}

Weapon_Lists.Throwables = {"Grenade","BZ Gas","Molotov Cocktail","Sticky Bomb","Proximity Mines","Snowballs","Pipe Bombs","Baseball","Tear Gas","Flare"}

Weapon_Lists.Miscellaneous = {"Jerry Can","Parachute","Fire Extinguisher","Hazardous Jerry Can"}

Melee = {
"weapon_unarmed",
"weapon_cougar",
"weapon_animal",
"weapon_dagger",
"weapon_bat",
"weapon_bottle",
"weapon_crowbar",
"weapon_flashlight",
"weapon_golfclub",
"weapon_hammer",
"weapon_hatchet",
"weapon_knuckle",
"weapon_knife",
"weapon_machete",
"weapon_switchblade",
"weapon_nightstick",
"weapon_wrench",
"weapon_battleaxe",
"weapon_poolcue",
"weapon_stone_hatchet",
}

Handguns = {
"weapon_pistol",
"weapon_pistol_mk2",
"weapon_combatpistol",
"weapon_appistol",
"weapon_stungun",
"weapon_pistol50",
"weapon_snspistol",
"weapon_snspistol_mk2",
"weapon_heavypistol",
"weapon_vintagepistol",
"weapon_flaregun",
"weapon_marksmanpistol",
"weapon_revolver",
"weapon_revolver_mk2",
"weapon_doubleaction",
"weapon_raypistol",
"weapon_ceramicpistol",
"weapon_navyrevolver",
"weapon_gadgetpistol",
}

Submachine_Guns = {
"weapon_microsmg",
"weapon_smg",
"weapon_smg_mk2",
"weapon_assaultsmg",
"weapon_combatpdw",
"weapon_machinepistol",
"weapon_minismg",
"weapon_raycarbine",
}

Shotguns = {
"weapon_pumpshotgun",
"weapon_pumpshotgun_mk2",
"weapon_sawnoffshotgun",
"weapon_assaultshotgun",
"weapon_bullpupshotgun",
"weapon_musket",
"weapon_heavyshotgun",
"weapon_dbshotgun",
"weapon_autoshotgun",
"weapon_combatshotgun",
}

Assault_Rifles = {
"weapon_assaultrifle",
"weapon_assaultrifle_mk2",
"weapon_carbinerifle",
"weapon_carbinerifle_mk2",
"weapon_advancedrifle",
"weapon_specialcarbine",
"weapon_specialcarbine_mk2",
"weapon_bullpuprifle",
"weapon_bullpuprifle_mk2",
"weapon_compactrifle",
"weapon_militaryrifle",
}

Machine_Guns = {
"weapon_mg",
"weapon_combatmg",
"weapon_combatmg_mk2",
"weapon_gusenberg",
}

Sniper_Rifles = {
"weapon_sniperrifle",
"weapon_heavysniper",
"weapon_heavysniper_mk2",
"weapon_marksmanrifle",
"weapon_marksmanrifle_mk2",
}

Heavy_Weapons = {
"weapon_rpg",
"weapon_grenadelauncher",
"weapon_grenadelauncher_smoke",
"weapon_minigun",
"weapon_firework",
"weapon_railgun",
"weapon_hominglauncher",
"weapon_compactlauncher",
"weapon_rayminigun",
}

Throwables = {
"weapon_grenade",
"weapon_bzgas",
"weapon_molotov",
"weapon_stickybomb",
"weapon_proxmine",
"weapon_snowball",
"weapon_pipebomb",
"weapon_ball",
"weapon_smokegrenade",
"weapon_flare",
}

Miscellaneous = {
"weapon_petrolcan",
"gadget_parachute",
"weapon_fireextinguisher",
"weapon_hazardcan"
}



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
{"Player_Submarine", 3},
}
decoratorType = {"DECOR_TYPE_FLOAT","DECOR_TYPE_BOOL","DECOR_TYPE_INT","DECOR_TYPE_UNK","DECOR_TYPE_TIME"}
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

int_flags = {65536, 131072, 262144, 524288, 1048576, 2097152, 4194304}

local boneid = {
6286,
57597,
24818,
24817,
24816,
23553,
11816,
40269,
51826,
57005,
28252,
52301,
10706,
36864,
11816,
39317,
45509,
58271,
18905,
61163,
14201,
64729,
63931,
65068,
31086,
12844,
}

Ped_modals_a = {
"a_c_boar",
"a_c_cat_01",
"a_c_chickenhawk",
"a_c_chimp",
"a_c_chop",
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
"a_f_y_juggalo_01",
"a_f_y_runner_01",
"a_f_y_rurmeth_01",
"a_f_y_scdressy_01",
"a_f_y_skater_01",
"a_f_y_smartcaspat_01",
"a_f_y_soucent_01",
"a_f_y_soucent_02",
"a_f_y_soucent_03",
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
"a_m_y_stwhi_01",
"a_m_y_stwhi_02",
"a_m_y_sunbathe_01",
"a_m_y_surfer_01",
"a_m_y_vindouche_01",
"a_m_y_vinewood_01",
"a_m_y_vinewood_02",
"a_m_y_vinewood_03",
"a_m_y_vinewood_04",
"a_m_y_yoga_01"
}

Ped_modals_c = {
"cs_amandatownley",
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
"cs_karen_daniels",
"cs_lamardavis",
"cs_lazlow",
"cs_lestercrest",
"cs_lestercrest_2",
"cs_lestercrest_3",
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
"csb_avery",
"csb_avon",
"csb_ballasog",
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
"csb_englishdave",
"csb_englishdave_02",
"csb_fos_rep",
"csb_g",
"csb_georginacheng",
"csb_groom",
"csb_grove_str_dlr",
"csb_gustavo",
"csb_hao",
"csb_helmsmanpavel",
"csb_huang",
"csb_hugh",
"csb_imran",
"csb_isldj_00",
"csb_isldj_01",
"csb_isldj_02",
"csb_isldj_03",
"csb_isldj_04",
"csb_jackhowitzer",
"csb_janitor",
"csb_jio",
"csb_juanstrickler",
"csb_maude",
"csb_miguelmadrazo",
"csb_mjo",
"csb_money",
"csb_mp_agent14",
"csb_mrs_r",
"csb_mweather",
"csb_ortega",
"csb_oscar",
"csb_paige",
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
"csb_roccopelosi",
"csb_screen_writer",
"csb_sol",
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
"csb_vagspeak",
"csb_vincent",
"csb_vincent_2",
"csb_wendy"
}

Ped_modals_g = {
"g_f_importexport_01",
"g_f_importexport_01",
"g_f_y_ballas_01",
"g_f_y_families_01",
"g_f_y_lost_01",
"g_f_y_vagos_01",
"g_m_importexport_01",
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
"g_m_m_korboss_01",
"g_m_m_mexboss_01",
"g_m_m_mexboss_02",
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
"ig_abigail",
"ig_agatha",
"ig_agent",
"ig_amandatownley",
"ig_andreas",
"ig_ary",
"ig_ashley",
"ig_avery",
"ig_avon",
"ig_avon",
"ig_ballasog",
"ig_bankman",
"ig_barry",
"ig_benny",
"ig_bestmen",
"ig_beverly",
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
"ig_englishdave",
"ig_englishdave_02",
"ig_fabien",
"ig_fbisuit_01",
"ig_floyd",
"ig_g",
"ig_georginacheng",
"ig_groom",
"ig_gustavo",
"ig_hao",
"ig_helmsmanpavel",
"ig_huang",
"ig_hunter",
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
"ig_joeminuteman",
"ig_johnnyklebitz",
"ig_josef",
"ig_josh",
"ig_juanstrickler",
"ig_karen_daniels",
"ig_kaylee",
"ig_kerrymcintosh",
"ig_kerrymcintosh_02",
"ig_lacey_jones_02",
"ig_lamardavis",
"ig_lazlow",
"ig_lazlow_2",
"ig_lestercrest",
"ig_lestercrest_2",
"ig_lestercrest_2",
"ig_lestercrest_3",
"ig_lifeinvad_01",
"ig_lifeinvad_02",
"ig_magenta",
"ig_malc",
"ig_malc",
"ig_manuel",
"ig_marnie",
"ig_maryann",
"ig_maude",
"ig_michelle",
"ig_miguelmadrazo",
"ig_milton",
"ig_mjo",
"ig_molly",
"ig_money",
"ig_mp_agent14",
"ig_mrk",
"ig_mrs_thornhill",
"ig_mrsphillips",
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
"ig_roccopelosi",
"ig_russiandrunk",
"ig_sacha",
"ig_screen_writer",
"ig_siemonyetarian",
"ig_sol",
"ig_solomon",
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
"ig_vagspeak",
"ig_vincent",
"ig_vincent_2",
"ig_wade",
"ig_wendy",
"ig_zimbor"
}

Ped_modals_m = {
"mp_f_bennymech_01",
"mp_f_boatstaff_01",
"mp_f_cardesign_01",
"mp_f_cardesign_01",
"mp_f_chbar_01",
"mp_f_chbar_01",
"mp_f_cocaine_01",
"mp_f_cocaine_01",
"mp_f_counterfeit_01",
"mp_f_counterfeit_01",
"mp_f_deadhooker",
"mp_f_execpa_01",
"mp_f_execpa_01",
"mp_f_execpa_02",
"mp_f_forgery_01",
"mp_f_forgery_01",
"mp_f_freemode_01",
"mp_f_helistaff_01",
"mp_f_helistaff_01",
"mp_f_meth_01",
"mp_f_meth_01",
"mp_f_misty_01",
"mp_f_stripperlite",
"mp_f_weed_01",
"mp_f_weed_01",
"mp_g_m_pros_01",
"mp_m_avongoon",
"mp_m_avongoon",
"mp_m_boatstaff_01",
"mp_m_bogdangoon",
"mp_m_bogdangoon",
"mp_m_claude_01",
"mp_m_cocaine_01",
"mp_m_cocaine_01",
"mp_m_counterfeit_01",
"mp_m_counterfeit_01",
"mp_m_exarmy_01",
"mp_m_execpa_01",
"mp_m_execpa_01",
"mp_m_famdd_01",
"mp_m_fibsec_01",
"mp_m_forgery_01",
"mp_m_forgery_01",
"mp_m_freemode_01",
"mp_m_g_vagfun_01",
"mp_m_marston_01",
"mp_m_meth_01",
"mp_m_meth_01",
"mp_m_niko_01",
"mp_m_securoguard_01",
"mp_m_securoguard_01",
"mp_m_shopkeep_01",
"mp_m_waremech_01",
"mp_m_waremech_01",
"mp_m_weapexp_01",
"mp_m_weapexp_01",
"mp_m_weapwork_01",
"mp_m_weapwork_01",
"mp_m_weed_01",
"mp_m_weed_01",
"mp_s_m_armoured_01"
}

Ped_modals_p = {
"player_one",
"player_two",
"player_zero"
}

Ped_modals_s = {
"s_f_m_fembarber",
"s_f_m_maid_01",
"s_f_m_shop_high",
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
"s_m_m_scientist_01",
"s_m_m_security_01",
"s_m_m_snowcop_01",
"s_m_m_strperf_01",
"s_m_m_strpreach_01",
"s_m_m_strvend_01",
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
"s_m_y_xmech_02_mp",
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
"u_m_y_hippie_01",
"u_m_y_imporage",
"u_m_y_juggernaut_01",
"u_m_y_juggernaut_01",
"u_m_y_justin",
"u_m_y_mani",
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
"u_m_y_zombie_01"
}

SoundAnnoy = {
{"CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
{"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
{"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
{"TIME_LAPSE_MASTER", "0"},
{"Lester_Laugh_Phone", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
{"Leave_Horn", "DLC_Apartment_Yacht_Streams_Soundset"},
{"Arrive_Horn", "DLC_Apartment_Yacht_Streams_Soundset"},
{"Moor_SEASHARK3_Engine", "DLC_Apartment_Yacht_Streams_Soundset"},
{"Turret_Camera_Hum_Loop", "DLC_BTL_Terrobyte_Turret_Sounds"},
{"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
{"Moor_Boat_Engine", "DLC_Apartment_Yacht_Streams_Soundset"},
{"VULKAN_LOCK_ON_AMBER", 0},
{"VULKAN_LOCK_ON_RED", 0},
{"cannon_activating_loop", "dlc_xm_orbital_cannon_sounds"},
{"cannon_charge_fire_loop", "dlc_xm_orbital_cannon_sounds"},
{"DLC_XM_Explosions_Orbital_Cannon", 0},	
{"TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
{"Timer_10s", "DLC_HALLOWEEN_FVJ_Sounds"},
{"TIMER_STOP", "HUD_MINI_GAME_SOUNDSET"},
{"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset"},
{"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
{"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
{"5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
{"5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET"},
{"3_2_1_NON_RACE", "HUD_MINI_GAME_SOUNDSET"},
{"3_2_1", "HUD_MINI_GAME_SOUNDSET"},
{"WIND", "EXTREME_01_SOUNDSET"},
{"HOUSE_FIRE", "JOSH_03_SOUNDSET"},
{"Hot_Tub_Loop", "GTAO_Yacht_SoundSet"},
{"Arming_Countdown", "GTAO_Speed_Convoy_Soundset"},
{"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset"},
{"Boss_Blipped", "GTAO_Magnate_Hunt_Boss_SoundSet"},
{"Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset"},
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
{"BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS"},
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
{"Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET"},
{"Dropped", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
{"EDIT", "HUD_DEATHMATCH_SOUNDSET"},
{"Start_Squelch", "CB_RADIO_SFX"},
{"End_Squelch", "CB_RADIO_SFX"},
{"Enemy_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
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
}
--TODO: Modder Flagging
function modflag_set()
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
	if player.get_modder_flag_text(int_flags[i]) == "Player is a CUNT!" then
		mod_flag_5 = int_flags[i]
	end
end
if mod_flag_1 == nil then
	mod_flag_1 = player.add_modder_flag("Moist Protex you")
end
if mod_flag_2 == nil then
	mod_flag_2 = player.add_modder_flag("You Kicked")
end
if mod_flag_3 == nil then
	mod_flag_3 = player.add_modder_flag("Spectating(with Mod)")
end
if mod_flag_4 == nil then
	mod_flag_4 = player.add_modder_flag("Blacklist")
end
if mod_flag_5 == nil then
	mod_flag_5 = player.add_modder_flag("Player is a CUNT!")
end
end
modflag_set()

--TODO: OSD_Debug2
text_scale = 0.0
OSD_Debug2 = menu.add_feature("Debug OSD2", "toggle", 0, function(feat)
Settings["OSDDebug2"] = true
if not Settings["playerscriptinfo"] then return end
local Scr_x, Scr_y = graphics.get_screen_width(), graphics.get_screen_height()
if feat.on then
	text_scale = 0.185
	if Scr_x < 2000 and Scr_y  > 1020 then
		text_scale = 0.18
	end
	ui.draw_rect(0.001, 0.990, 0.325, 0.200, 0, 0, 0, 180)
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
OSD_Debug2.on = Settings["OSDDebug2"]
OSD_Debug2.hidden = true

--TODO: --------------Setup Player ARRAY------------
function modstart()
for pid = 0, 31 do
	Modders_DB[pid] = {}
	Modders_DB[pid].flag = nil
	Modders_DB[pid].flags = nil
	Modders_DB[pid].ismod = false
	SessionPlayers[pid] = {}
	SessionPlayers[pid].Name = "nil"
	SessionPlayers[pid].Tags = {}
	SessionPlayers[pid].Scid = 4294967295
	Players[pid] = {}
	-- Tags[pid + 1] = {}
	Players[pid].isHost = false
	Players[pid].orbnotify = false
	Players[pid].isScHost = false
	Players[pid].pulse = false
	Players[pid].isOTR = false
	Players[pid].OTRBlipID = nil
	Players[pid].PedSpawned = false
	Players[pid].bounty = false
	Players[pid].bountyvalue = nil
	Players[pid].isUnDead = false
	Players[pid].isDead = false
	Players[pid].isPassive = false
	Players[pid].isTalking = false
	Players[pid].isTyping = false
	Players[pid].flag = nil
	Players[pid].flags = nil
	Players[pid].ismod = false
	Players[pid].isgod = false
	Players[pid].isvgod = false
	Players[pid].PlayerGodMode = false
	Players[pid].PlayerVehGodMode = false
	Players[pid].isint = false
	Players[pid].Interiorname = ""
	Players[pid].isvis = false
	Players[pid].speed = 0.00
end
end
modstart()
--TODO: Feature & Variable Arrays
global_func, globalFeatures,  playerFeatures, playerfeatVars  = {}, {}, {}, {}
playerFeat = {}
playerFeatParent = {}
playerFeatParent2 = {}
playerFeat1 = {}
playerFeat2 = {}
playerFeat3 = {}
playerFeat4 = {}
Active_menu = nil
local health, infoA, infoAB, infoB
--local Menu Features
globalFeatures.parent = menu.add_feature("MoistScript 2.0.5.7", "parent", 0).id
globalFeatures.Online_Session = menu.add_feature("Online Features", "parent", globalFeatures.parent, function(feat)
	if network.network_is_host() then
	HostOptionsParent.hidden = false
	elseif not network.network_is_host() then
	HostOptionsParent.hidden = true
	end
	return HANDLER_POP
end).id

--TODO: Online Feature Parents
playersFeature = menu.add_feature("Online Players", "parent", globalFeatures.Online_Session, function(feat)
	health, infoA, infoAB, infoB = "#", "#", "#", "#"
Active_menu = nil
OSD_Debug2.on = false
end).id
Recent = menu.add_feature("Recent Players", "parent", globalFeatures.Online_Session).id
God_Threads_Created = menu.add_feature("PlayerCheck threads", "parent", globalFeatures.Online_Session)
God_Threads_Created.hidden = true
--session

HostOptionsParent = menu.add_feature("Session Host Options", "parent", globalFeatures.Online_Session)
HostOptionsParent.hidden = true

globalFeatures.lobby = menu.add_feature("Online Session", "parent", globalFeatures.Online_Session, function(feat)
    RefreshPlayerInterior:set_str_data(Playerz)
    interiorcheckbytype:set_str_data(Playerz)
    OrbitalStrike_AllEntities:set_str_data(Playerz)
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
globalFeatures.self_ped = menu.add_feature("Ped Features", "parent", globalFeatures.self).id
globalFeatures.self_veh = menu.add_feature("Vehicle Features", "parent", globalFeatures.self).id
globalFeatures.self_quickstat = menu.add_feature("Player Stats", "parent", globalFeatures.self).id

globalFeatures.self_statLabel = menu.add_feature("Stats Require Trusted Mode!", "action", globalFeatures.self_quickstat)

globalFeatures.self_statcheck = menu.add_feature("Player Stat Checks", "parent", globalFeatures.self_quickstat).id
globalFeatures.self_statsetup = menu.add_feature("Player Stat Setup", "parent", globalFeatures.self_quickstat, function()
local stat_hash, curval, valu, value_set, stat
stat = Get_Last_MP("PLAYER_MENTAL_STATE")
stat_hash = gameplay.get_hash_key(stat)
curval = stats.stat_get_float(stat_hash, 0)
valu = math.ceil(curval)
value_set = tonumber(valu)
mental_statset.value = value_set
end)
globalFeatures.quick_stats = menu.add_feature("Quick Stat Setups", "parent", globalFeatures.self_quickstat, function(feat)
moist_notify("ensure to pay for heist setup first", "Casino Heist Quick Stat Setup")
moist_notify("cooldown can be removed running the setup first\nEnsure to reapply after paying for it", "Casino Heist Quick Stat Setup")
end).id

--TODO: Remove ------------------------------------------ REMOVE ---------------------------------------------

globalFeatures.self_options = menu.add_feature("Player Options", "parent", globalFeatures.self).id
globalFeatures.self_wep = menu.add_feature("Player Weapons", "parent", globalFeatures.self_ped).id
globalFeatures.self_ped_combat = menu.add_feature("Combat Features", "parent", globalFeatures.parent).id
--stats
--world
globalFeatures.cleanup = menu.add_feature("Clean Shit Up!", "parent",  globalFeatures.Online_Session).id
globalFeatures.entity_removal = menu.add_feature("World Clean-up", "parent", globalFeatures.cleanup).id
globalFeatures.World = menu.add_feature("World Options", "parent", globalFeatures.parent).id
globalFeatures.Weather = menu.add_feature("Weather Overide", "parent", globalFeatures.World).id
menu.add_feature("Reset Override Weather", "action", globalFeatures.Weather, function(feat)
gameplay.clear_cloud_hat()
gameplay.clear_override_weather()
end)
menu.add_feature("Clear Cloud Hat", "action", globalFeatures.Weather, function(feat)
gameplay.clear_cloud_hat()
end)
weather = {"FUCK","Extra Sunny","Clear","Clouds","Smog","Fog","Clouds","Rain","Thunder","Clearing","Neutral","Snow","Blizzard","Snow Light","Xmas","Halloween","Psychedelic Screen Fuck"}
for i = 1, #weather do
menu.add_feature(weather[i], "action", globalFeatures.Weather, function(feat)
	local i = i - 2
	gameplay.set_override_weather(i)
end)
end
globalFeatures.Wave = menu.add_feature("World Wave Modifiers", "parent", globalFeatures.World, function(feat)
wave_int_cur = tostring("~q~~h~"..water.get_waves_intensity())
wave_int_osd.on = true
system.yield(1000)
wave_int_osd.on = false
end).id
--spam
globalFeatures.Moist_Spam = menu.add_feature("Chat & SMS Features", "parent", globalFeatures.Online_Session).id
globalFeatures.custom_Chat = menu.add_feature("Custom Presets", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Preset_Chat = menu.add_feature("Preset Spam", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Preset_RUS = menu.add_feature("Russian Spam", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Spam_Options = menu.add_feature("Chat & SMS Options", "parent", globalFeatures.Moist_Spam).id
--globalFeatures.Script_loader = menu.add_feature("Script (Auto)Loader", "parent", globalFeatures.parent).id
globalFeatures.moist_test = menu.add_feature("Experimental Features", "parent", globalFeatures.parent, function(feat)

        for pid = 0, 31 do
            if player.is_player_valid(pid) then

                Playerz[pid+1] = player.get_player_name(pid)
            end
        end
        RefreshPlayerInterior:set_str_data(Playerz)
        interiorcheckbytype:set_str_data(Playerz)
        OrbitalStrike_AllEntities:set_str_data(Playerz)

end)

globalFeatures.moist_test.hidden = false

globalFeatures.Script_loader = menu.add_feature("Moists Script Loader", "parent", globalFeatures.parent).id


--options
globalFeatures.moistopt = menu.add_feature("MoistScript Options", "parent", globalFeatures.parent, function(feat)

OSD_Debug2.on = false
end).id

--TODO: save settings
menu.add_feature("Save Current Settings", "action", globalFeatures.moistopt, function(feat)
SaveSettings()
moist_notify("Current Settings Saved!", "MoistScript Settings")
end)

globalFeatures.moist_hotkeys = menu.add_feature("Hotkeys", "parent", globalFeatures.moistopt).id
ModderShit = menu.add_feature("Modder Shit", "parent", globalFeatures.moistopt).id
logging = menu.add_feature("Logging Shit", "parent", globalFeatures.moistopt).id

globalFeatures.moist_hiMkropt = menu.add_feature("Markers & Blips Options", "parent", globalFeatures.moistopt).id
globalFeatures.moistMkropt = menu.add_feature("Player Highlight options", "parent", globalFeatures.moist_hiMkropt).id


--TODO: Save Settings Hotkey
SaveOptions_Hotkey = menu.add_feature("Options Save HotKey", "toggle", globalFeatures.moist_hotkeys, function(feat)
if not feat.on then
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
SaveOptions_Hotkey.on = true

globalFeatures.moist_perf = menu.add_feature("Performance Options","parent",globalFeatures.moistopt).id

playerlistloop = menu.add_feature("Player List Loop Delay ms:", "autoaction_value_i", globalFeatures.moist_perf, function(feat)
Settings["playerlist_loop"] = feat.value
print(feat.value)
end)
playerlistloop.max = 25
playerlistloop.min = 0
playerlistloop.mod = 1
playerlistloop.value = Settings["playerlist_loop"]

loopfeatdelay = menu.add_feature("Other FeatureLoops Delay ms:", "autoaction_value_i", globalFeatures.moist_perf, function(feat)
Settings["loop_feat_delay"] = feat.value
end)
loopfeatdelay.max = 100
loopfeatdelay.min = 0
loopfeatdelay.mod = 1
loopfeatdelay.value = Settings["loop_feat_delay"]

ScriptEvent_delay = menu.add_feature("Scriptevent Delay ms:", "autoaction_value_i", globalFeatures.moist_perf, function(feat)
Settings["ScriptEvent_delay"] = feat.value
end)
ScriptEvent_delay.max = 100
ScriptEvent_delay.min = 0
ScriptEvent_delay.mod = 1
ScriptEvent_delay.value = Settings["ScriptEvent_delay"]

globalFeatures.notifyParent = menu.add_feature("Notify Customisation", "parent", globalFeatures.moistopt, function(feat)
OSD_Debug2.on = true
update_osd_text2("~h~~b~ 1: ~h~~w~Disables Almost all Notifys\n", "\n~h~~b~ 2: ~w~Also use new Notify System\n", "\nPress+Hold: LCTRL + LSHIFT\nPress: S To save When Done")

end).id

AddOTRBlips =  menu.add_feature("Add Blips for OTR Players", "toggle", globalFeatures.moist_hiMkropt, function(feat)
if not feat.on then
	Settings["OTR_Blips"] = false
	return HANDLER_POP
end
Settings["OTR_Blips"] = true
end)
AddOTRBlips.on = Settings["OTR_Blips"]

AddFunctionBlips =  menu.add_feature("Add Blips for Script Functions", "toggle", globalFeatures.moist_hiMkropt, function(feat)
if not feat.on then
	Settings["Add_Blips"] = false
	return HANDLER_POP
end
Settings["Add_Blips"] = true
end)
AddFunctionBlips.on = Settings["Add_Blips"]

AddOrbitalProx =  menu.add_feature("Add Orbital Room Proximity Blip", "toggle", globalFeatures.moist_hiMkropt, function(feat)
if not feat.on then
	Settings["orbitalProxyBlip"] = false
	return HANDLER_POP
end
Settings["orbitalProxyBlip"] = true
end)
AddOrbitalProx.on = Settings["orbitalProxyBlip"]

ToBeNotify =  menu.add_feature("1:Script Notify Me", "toggle", globalFeatures.notifyParent, function(feat)
if not feat.on then
	Settings["Notify_Me"] = false
	return HANDLER_POP
end
Settings["Notify_Me"] = true

end)
ToBeNotify.on = Settings["Notify_Me"]

New_Notify =  menu.add_feature("2:Use New Notify Type?", "toggle", globalFeatures.notifyParent, function(feat)
if not feat.on then
	Settings["New_Notifys"] = false
	return HANDLER_POP
end
Settings["New_Notifys"] = true
end)
New_Notify.on = Settings["New_Notifys"]
New_Notify.hidden = true

--TODO: ---------------------Moist Test Shit-----------------
globalFeatures.moist_tools = menu.add_feature("Moist Test Shit", "parent", globalFeatures.moistopt)
globalFeatures.moist_tools.hidden = true
Test_ScriptMode = false
--TODO: -----------------UPDATE FEATURE VISIBILITY-------------------------

blipids = menu.add_feature("Enable TestMode", "toggle", globalFeatures.moist_tools.id, function(feat)
	if not feat.on then
	Test_ScriptMode = false
	return HANDLER_POP
	end
	Test_ScriptMode = true
end)
blipids.on = false

ScreenAnimPostFX={"CamPushInNeutral","FocusIn","FocusOut","BulletTime","BulletTimeOut","DrivingFocus","DrivingFocusOut","REDMIST","REDMISTOut","SwitchShortMichaelIn","SwitchShortFranklinMid","CamPushInFranklin","CamPushInMichael","CamPushInTrevor","SwitchHUDOut","MP_job_load","MenuMGTrevorIn","MenuMGMichaelIn","MenuMGFranklinIn","MenuMGTrevorOut","MenuMGMichaelOut","MenuMGFranklinOut","MenuMGIn","MenuMGSelectionIn","MenuMGSelectionTint","MenuMGTournamentIn","MenuMGHeistIn","MenuMGHeistTint","MenuMGHeistIntro","MenuMGTournamentTint","MenuMGRemixIn","MenuSurvivalAlienIn","MP_race_crash","DeathFailMPDark","DeathFailMPIn","CrossLine","SuccessFranklin","SuccessTrevor","SuccessMichael","MinigameTransitionIn","MP_Celeb_Preload_Fade","MP_Celeb_Win","MP_Celeb_Lose","MinigameTransitionOut","MinigameEndNeutral","RaceTurbo","MP_corona_switch_supermod","WeaponUpgrade","MinigameEndMichael","MinigameEndFranklin","MinigameEndTrevor","Rampage","RampageOut","MP_TransformRaceFlash","DeathFailOut","HeistCelebPass","HeistCelebPassBW","HeistCelebFail","HeistCelebFailBW","SuccessNeutral","HeistCelebEnd","SwitchSceneMichael","SwitchSceneFranklin","SwitchSceneTrevor","SwitchOpenNeutralOutHeist","ArenaWheelPurple","CarDamageHit","MenuMGHeistOut","CrossLineOut","MP_SmugglerCheckpoint","MP_Celeb_Win_Out","MP_Celeb_Lose_Out","MP_WarpCheckpoint","MP_intro_logo","InchPickup","PPOrange","PPPurple","PPGreen","PPPink","DeadlineNeon","MP_Celeb_Preload","HeistTripSkipFade","InchPickupOut","PPOrangeOut","PPPurpleOut","PPGreenOut","PPPinkOut","HeistLocate","BeastIntroScene","BeastTransition","BeastLaunch","MP_OrbitalCannon","RemixDrone","pennedIn","PennedInOut","PeyoteEndIn","PeyoteEndOut","PeyoteIn","PeyoteOut","DefaultBlinkOutro","SwitchShortFranklinIn","SwitchShortMichaelMid","SwitchShortTrevorIn","SwitchShortTrevorMid","ChopVision","DMT_flight","DrugsDrivingOut","DMT_flight_intro","DrugsDrivingIn","SwitchOpenNeutralFIB5","SwitchOpenMichaelMid","SwitchOpenMichaelIn","MP_corona_switch","InchPurple","DeathFailNeutralIn","SwitchShortNeutralIn","CarPitstopHealth","InchOrange","LostTimeDay","LostTimeNight","MP_Bull_tost","PPFilter","PPFilterOut","TinyRacerPink","TinyRacerGreen","TinyRacerGreenOut","TinyRacerPinkOut","InchOrangeOut","InchPurpleOut","TinyRacerIntroCam","SurvivalAlien","BikerFormation","BikerFormationOut","ArenaEMP","ArenaEMPOut","SwitchOpenFranklin","ExplosionJosh3","SwitchSceneNeutral","SniperOverlay","SwitchSceneNetural","Dont_tazeme_bro","SwitchHUDMichaelIn","SwitchHUDFranklinIn","SwitchHUDTrevorIn","SwitchHUDIn","SwitchHUDMichaelOut","SwitchHUDFranklinOut","SwitchHUDTrevorOut","PokerCamTransition"}

ScreenFX = menu.add_feature("ScreenFX: ", "value_str", globalFeatures.moist_test.id, function(feat)
	if not feat.on then
	graphics.animpostfx_stop_all()
return HANDLER_POP
	end
	
			local postfxhash = gameplay.get_hash_key(ScreenAnimPostFX[feat.value + 1])
			graphics.animpostfx_play(postfxhash, 20, true)
	
end)
ScreenFX:set_str_data(ScreenAnimPostFX)
	
fxremoveal = menu.add_feature("Stop all Anim Post FX", "action", globalFeatures.moist_test.id, function(feat)
	graphics.animpostfx_stop_all()
return HANDLER_POP
end)
	
--TODO: Blip Interior Checks
local Blip_God = {"Normal Radar","Expanded Radar"}



blipcheck = menu.add_feature("Blip Interior Check", "value_str", ModderShit, function(feat)
	local pped
	if feat.on then
	for pid = 0, 31 do
	if player.is_player_valid(pid) then
	pped = player.get_player_ped(pid)
	Players[pid].BlipPID = ui.get_blip_from_entity(pped)
		
	
	if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) then return end
	if Settings["blipGodcheckvalue"] == 0 then
	if (interior.get_interior_from_entity(player.get_player_ped(player.player_id())) == 0) then
	system.wait(2000)
	
	
	if ui.get_blip_from_entity(pped) ~= 0 and (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  0) then
		Players[pid].isint = false
	end
	end

	system.wait(1)
	elseif Settings["blipGodcheckvalue"] == 1 then

	if not player.is_player_god(player.player_id()) or player.is_player_vehicle_god(player.player_id()) then
	system.wait(2000)
	
		if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) then return end
	if ui.get_blip_from_entity(pped) ~= 0 and (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  0) then
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
blipcheck.value = Settings["blipGodcheckvalue"]
blipcheck.on = false
	
blipGodcheck = menu.add_feature("God Blip Check", "value_str", ModderShit, function(feat)
    local pped
    if not feat.on then
	blipcheck.on = false
        Settings["blipGodcheck"] = false
		Settings["blipGodcheckvalue"] = feat.value
		--Print(feat.value)
        return HANDLER_POP
    end
    Settings["blipGodcheck"] = true
	Settings["blipGodcheckvalue"] = feat.value
	if feat.on then
	blipcheck.on = true


    for pid = 0, 31 do
        if player.is_player_valid(pid) and Players[pid].PedSpawned then
            name = player.get_player_name(pid)
            pped = player.get_player_ped(pid)
            Players[pid].BlipPID = ui.get_blip_from_entity(pped)
            local pos = player.get_player_coords(pid)
		
				if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) then return end

            if feat.value == 0 then

                if (interior.get_interior_from_entity(player.get_player_ped(player.player_id())) == 0) and not player.is_player_god(player.player_id()) or player.is_player_vehicle_god(player.player_id()) then
                  system.wait(2000)


                    if not ui.get_blip_from_entity(pped) == 0 and pos.z >= -90 then
                      --  Players[pid].isint = false
                        if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                            system.wait(15000)
							 Players[pid].BlipPID = ui.get_blip_from_entity(pped)
							 if not Players[pid].isint then
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

             --   system.wait(2000)

                if not ui.get_blip_from_entity(pped) == 0 and pos.z >= -90 then
                  --  Players[pid].isint = false
                    if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                        system.wait(15000)
						 Players[pid].BlipPID = ui.get_blip_from_entity(pped)
						if not Players[pid].isint then
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
blipGodcheck.on = Settings["blipGodcheck"]
blipGodcheck.value = Settings["blipGodcheckvalue"]
--TODO: Blip God Checks

blipGodcheck = menu.add_feature("God Blip Check 2", "toggle", ModderShit, function(feat)
    local pped
    if not feat.on then
	blipcheck.on = false
        Settings["blipGodcheck"] = false
		--Print(feat.value)
        return HANDLER_POP
    end
    Settings["blipGodcheck"] = true
	if feat.on then
	blipcheck.on = true


    for pid = 0, 31 do
	if  ui.get_blip_from_entity(player.get_player_ped(pid)) == 0 then return end
	
        if player.is_player_valid(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
		            name = player.get_player_name(pid)
         
                        if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                            system.wait(25000)
							        if player.is_player_valid(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
									 system.wait(25000)
							 if not Players[pid].isint and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
							  system.wait(25000)
                            if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and ui.get_blip_from_entity(player.get_player_ped(pid)) ~= 0 then
									if Settings["GodCheckNotif"] and not Players[pid].isgod then
								Players[pid].isgod = player.is_player_god(pid)
								--Players[pid].isvgod = player.is_player_vehicle_god(pid)
							
                                moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Blip Check 2")
								ModderAudio_notify()
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
blipGodcheck.on = Settings["blipGodcheck"]

RecentNotify = menu.add_feature("Recent Players Seen Notify", "toggle", globalFeatures.notifyParent, function(feat)
if not feat.on then
	Settings["RecentPlayer_Notify"] = false
	return HANDLER_POP
end
Settings["RecentPlayer_Notify"] = true
end)
RecentNotify.on = Settings["RecentPlayer_Notify"]

ply_seat = menu.add_feature("Set your seat (default front)", "action_value_i", globalFeatures.self_veh, function(feat)
local pid = player.player_id()
local pped = player.get_player_ped(pid)
local veh = ped.get_vehicle_ped_is_using(pped)
if veh == nil or 0 then
	veh = player.get_player_vehicle(player.player_id())
	ped.set_ped_into_vehicle(pped, veh, feat.value)
end
end)
ply_seat.max = 14
ply_seat.min = -1
ply_seat.value = -1

local health, infoA, infoAB, infoB = "#", "#", "#", "#"
text1, text2, text3, text4, text5 , text6 = "", "", "", "", "", "", "", "", ""

Active_scriptmenu = menu.add_feature("Active Script item Player info", "toggle", globalFeatures.moistopt, function(feat)
	Settings["playerscriptinfo"] = true
	if feat.on then
		local pid, intchk, intname, pos, dist2D = Active_menu, "", "", v3(0.0,0.0,0.0), ""
		local precheck
		if Active_menu ~= nil then
			dis = Get_Distance3D(pid)
			dist = RoundNum(dis, 2)
			if dist < 1000.00 then
				dist = "~r~~h~" .. dist
			end
			local info = tostring(infoB .. "\nDistance:  " .. dist .. "\n~h~~r~Player Damaged by: ~o~" .. tostring(Players[pid].isDamagedbY))
			
			if Players[pid].isint == false then
				intchk = "~h~~g~False"
				precheck = false
			end
			if Players[pid].isint == true then
				intchk = "~h~~r~True"
				precheck = true
			end
			Players[pid].isint = precheck
			Players[pid].isint, Players[pid].Interiorname, Position, id  = GetPlayerinterior(pid)
			realcheck, Players[pid].Interiorname, Position, id  = GetPlayerinterior(pid)
			if realcheck == true and id ~= nil then
			Players[pid].isint = true
			dist2D = RoundNum(Get_Distance2D(pid, interiors[id][2]), 2)
			dist3D = RoundNum(Get_Dist3D(pid, interiors[id][2]), 2)
			-- if interiors[id][1] == "alt" then
			text5 = "~h~~o~Interior:~w~ " .. tostring(Players[pid].Interiorname) ..  "\t | 2D = " .. tostring(dist2D) .."\t | 3D = " .. tostring(dist3D)
			-- elseif  interiors[id][1] ~= "alt" then
			-- text5 = "~h~~o~Interior:~w~ " .. tostring(interiors[id][1]) .. "\t2D = " .. tostring(dist2D) .."\t3D = " .. tostring(dist3D)
			-- end
			elseif realcheck ~= true then
			-- text5 = "~h~~o~Interior =~r~ NoneDetected~w~ "
			-- end
			onlinecheck, online_interior, id2 = GetPlayer_onlineinterior(pid)
			if onlinecheck == true and id2 ~= nil then
			dist2D = RoundNum(Get_Distance2D(pid, onlineinteriors[id2][2]), 2)
			dist3D = RoundNum(Get_Dist3D(pid, onlineinteriors[id2][2]), 2)
			text5 = "~h~~o~Interior:~w~ " .. tostring(online_interior)  .. " | 2D = " .. tostring(dist2D) .." | 3D = " .. tostring(dist3D)
			elseif onlinecheck ~= true then
			
			text5 = "~h~~o~Interior =~r~ NoneDetected~w~ "
			end
			end
			text4 = "~h~~b~Interior Check:~w~ " .. intchk .. "\nCheck now: " .. tostring(realcheck)
			update_osd_text2(health, infoA, info, infoAB)
		end
		system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE
	end
	health, infoA, infoAB, infoB, text1, text2, text3, text4, text5, text6 = "", "", "", "", "", "", "", "", "", ""
	
		--	Players[pid].isint, Players[pid].Interiorname, Position  = GetPlayerinterior(pid)
	
	Settings["playerscriptinfo"] = false
	return HANDLER_POP
end)
Active_scriptmenu.on = Settings["playerscriptinfo"]



event_test1 = menu.add_feature("Frames", "toggle", globalFeatures.moist_tools.id, function(feat)
local ft, fc, th, tm, ts, rt, rs
if feat.on then
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


Hostkick_PID_SLOT = menu.add_feature("Host Kick Session Slot:", "action_value_i", globalFeatures.moist_tools.id, function(feat)
hostkickall(feat.value)
end)
Hostkick_PID_SLOT.min = 0
Hostkick_PID_SLOT.max = 32


InteriorTest = menu.add_feature("is interior test", "toggle", globalFeatures.moist_tools.id, function(feat)
if feat.on then
	OSD_DEBUG.on = true
	update_osd_text(interior.get_interior_from_entity(player.get_player_ped(player.player_id())), false)
	return HANDLER_CONTINUE
end
OSD_DEBUG.on = false
return HANDLER_POP
end)

local hash
spawnobject = menu.add_feature("clipboard Object Spawn", "action", globalFeatures.moist_test.id, function(feat)
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
if feat.on then
	local key = MenuKey()
	key:push_str("LCONTROL")
	key:push_str("LSHIFT")
	key:push_str("h")
	if key:is_down() then
		globalFeatures.moist_tools.hidden = not globalFeatures.moist_tools.hidden
		system.wait(1200)
	end
	system.yield(10)
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
moist_tools_hotkey.on = true


--TODO: Modder Flag logs
Auto_Off_RAC = menu.add_feature("Auto-Remove RAC-Modder Marking", "toggle", ModderShit, function(feat)
if not feat.on then
	Settings["Auto_Off_RAC"] = false
	return HANDLER_POP
end
Settings["Auto_Off_RAC"] = true
system.wait(500)
end)
Auto_Off_RAC.on = Settings["Auto_Off_RAC"]

function RAC_OFF(pid)
if not Auto_Off_RAC.on then return end
local flags = player.get_player_modder_flags(pid)
local flag_ends = player.get_modder_flag_ends(player.get_player_modder_flags(pid))
local flag_name = player.get_modder_flag_text(flags)
if flag_name == "RAC" then
	player.unset_player_as_modder(pid, 128)
end
end

function ModderAudio_notify()
	-- if Settings["AudioNotify"] == 1 then
	-- audio.play_sound_frontend(-1, "TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	
		-- audio.play_sound_from_entity(-1, "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
		-- system.wait(800)
		-- audio.play_sound_from_entity(-1, "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
		-- system.wait(8)
		-- audio.play_sound_from_entity(-1, "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
		-- -- system.wait(8)
		-- -- audio.play_sound_from_entity(-1, "Zone_Enemy_Capture", player.get_player_ped(player.player_id()), "DLC_Apartments_Drop_Zone_Sounds")
	-- end
	
	-- ScreenFX = {"RaceTurbo","LostTimeDay","LostTimeNight"}

	-- local i = Settings["VFX_NotifyGod"] + 1
			-- local postfxhash = gameplay.get_hash_key(ScreenFX[i])
			
		
			-- graphics.animpostfx_play(postfxhash, 20, true)
-- system.wait(1000)
			-- graphics.animpostfx_stop_all()
end


--TODO: God Check Thread Shit
Audio_NotifyGod = menu.add_feature("Audio Notify God Modders", "autoaction_value_str", ModderShit, function(feat)
	if feat.value == 0 then
	Settings["AudioNotify"] = 0
	elseif feat.value == 1 then
	Settings["AudioNotify"] = 1
	end
end)
Audio_NotifyGod:set_str_data({"OFF","ON"})
Audio_NotifyGod.value = Settings["AudioNotify"]

VFX_NotifyGod = menu.add_feature("VisualFX Notify God Modders", "value_str", ModderShit, function(feat)
	if not feat.on then
	Settings["VFX_NotifyGod_ON"] = false
	Settings["VFX_NotifyGod"] = feat.value
	return HANDLER_POP
	end
	 Settings["VFX_NotifyGod_ON"] = true
	if feat.value == 0 then
	Settings["VFX_NotifyGod"] = 0
	elseif feat.value == 1 then
	Settings["VFX_NotifyGod"] = 1
	end
end)
VFX_NotifyGod:set_str_data({"RaceTurbo","LostTimeDay","LostTimeNight"})
VFX_NotifyGod.value = Settings["VFX_NotifyGod"]
VFX_NotifyGod.on = Settings["VFX_NotifyGod_ON"]
	
	
NotifyGod = menu.add_feature("Notify God Player/Vehicle", "toggle", ModderShit, function(feat)
if not feat.on then
	Settings["GodCheckNotif"] = false
	for pid = 0, 31 do
		Players[pid].isgod = true
		Players[pid].isvgod = true
	end
	return HANDLER_POP
end
Settings["GodCheckNotif"] = true
notifyclear.on = true
for pid = 0, 31 do
	Players[pid].isgod = false
	Players[pid].isvgod = false
end
end)
NotifyGod.on = Settings["GodCheckNotif"]

GodVersion = Settings["PlayerGodCheckVersion"]
InteriorVersion = Settings["PlayerCheckVersion"]

GodCheckVer = menu.add_feature("God Check Version", "value_i", ModderShit, function(feat)
	if not feat.on then
	Settings["GodCheck"] = false
	return HANDLER_POP
	end
	Settings["GodCheck"] = true
	if feat.on and feat.value == 1 then
	Settings["PlayerGodCheckVersion"] = 1
	elseif feat.on and feat.value == 2 then
	Settings["PlayerGodCheckVersion"] = 2
	end
	return HANDLER_POP
end)
GodCheckVer.min = 1
GodCheckVer.max = 2
GodCheckVer.value = Settings["PlayerGodCheckVersion"]
GodCheckVer.on = Settings["GodCheck"]


InteriorCheckVer = menu.add_feature("Interior Check Version", "value_i", ModderShit, function(feat)
	if feat.value == 1 then
	Settings["PlayerCheckVersion"] = 1
	elseif feat.value == 2 then
	Settings["PlayerCheckVersion"] = 2
	end
end)
InteriorCheckVer.min = 1
InteriorCheckVer.max = 2
InteriorCheckVer.value = Settings["PlayerCheckVersion"]
InteriorCheckVer.on = Settings["GodCheckNotif"]



function clearnotif()
for pid = 0, 31 do
	note = false
	Players[pid].isvgod = false
	Players[pid].isgod = false
	Players[pid].orbnotify = false
	Players[pid].isint = false
	Players[pid].PlayerGodMode = false
	Players[pid].PlayerVehGodMode = false
	
end
end
notifyclear = menu.add_feature("clear Detection notify's", "toggle", ModderShit, function(feat)
Settings["GodCheckNotif"] = true
if feat.on then
	clearnotif()
	local delay = 0
	repeat
		delay = delay + 1
		system.wait(25000)
	until delay == 10
	clearnotif()
	return HANDLER_CONTINUE
end
Settings["GodCheckNotif"] = false
return HANDLER_POP
end)
notifyclear.on = Settings["GodCheckNotif"]
notifyclear.hidden = false

God_Check1_pid_thread = function(pid)
	
	while true do
	if player.is_player_valid(pid) and pid ~= player.player_id() and player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
	local pped, name
	name = player.get_player_name(pid)
	pped = player.get_player_ped(pid)
		if ped.is_ped_shooting(pped) then
			--if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
				system.wait(2000)
				if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
				Players[pid].PlayerGodMode = true
					if Settings["GodCheckNotif"] and not Players[pid].isgod then
						moist_notify("Shooting While God Mode: " .. name, "Player God Mode Check Failure!")
						Players[pid].isgod = true
					end
					
				end
			end
		end
	system.yield(10)
	end


system.yield(10)
end

God_Check_pid_thread = function(pid)
while true do
	local pped, plyveh, name
	if player.is_player_valid(pid) then
	name = player.get_player_name(pid)
		if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
			system.wait(12000)
			pped = player.get_player_ped(pid)
		--	if pped ~= nil or pped ~= 0 then
				local pos = v3()
				plyveh = player.get_player_vehicle(pid)
				--if Players[pid].isint then return end
				if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
					system.wait(20000)
					if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) then
						
						--if tracking.playerped_speed1[pid + 1] >= 18 then
							if Settings["GodCheckNotif"] and not Players[pid].isgod then
					Players[pid].PlayerGodMode = true

								Players[pid].isgod = true
						--		Players[pid].PlayerGodMode = true
								moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Check v1 Thread")
								 ModderAudio_notify()							end
						end
					end
					
					plyveh = player.get_player_vehicle(pid)
					if plyveh ~= nil or plyveh ~= 0 then
						--if Players[pid].isint then return end
						if player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
							--if tracking.playerped_speed1[pid + 1] >= 18 then
								system.wait(20000)
								if player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) --[[and tracking.playerped_speed1[pid + 1] >= 21]] then
									if Settings["GodCheckNotif"] and not Players[pid].isvgod then
									Players[pid].PlayerVehGodMode = true
										Players[pid].isvgod = true
										moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection\nGod Check v1 Thread")
									ModderAudio_notify()
									end
								end
							--end
						end
					end
					
			--	end
			end
		end
		
	system.wait(2)
	end
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
				if Players[pid].isint then return end
				if not Players[pid].PedSpawned then return end
				if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
					system.wait(2000)
					if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) then
						
						if tracking.playerped_speed1[pid + 1] >= 21 then
							if Settings["GodCheckNotif"] and not Players[pid].isgod then
								Entity = "Player God mode"
								
								Players[pid].isgod = true
								
								moist_notify(Entity .. "\n" .. pid .. " : " .. (Playerz[pid+1]), "God Mode Player Detected")
								ModderAudio_notify()
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
										ModderAudio_notify()
									end
								end
							end
						end
					end
					
				end
			end
			
	system.wait(2)
		end
	end




God_Check2_pid_thread = function(pid)
    local pped, plyveh, name
    while true do
        if player.is_player_valid(pid) --[[and player.player_id() ~= pid]]  then
            if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                name = player.get_player_name(pid)
                system.wait(200)
                local Entity = ""
                pped = player.get_player_ped(pid)
                --			if pped ~= nil or pped ~= 0 then
                local pos = v3()
                plyveh = player.get_player_vehicle(pid)
                if not Players[pid].isint then
                    if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
                        system.wait(8000)
                        if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) then
						system.wait(8000)
						if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) then
                            Players[pid].PlayerGodMode = true

                            --if tracking.playerped_speed1[pid + 1] >= 18 then
                            if Settings["GodCheckNotif"] and not Players[pid].isgod then
                                Entity = "Player God mode"

                                Players[pid].isgod = true

                                moist_notify(Entity .. "\n" .. pid .. " : " .. name, "GodMode! Player Detected")
								ModderAudio_notify()
                            end
                        end
						end


                        plyveh = player.get_player_vehicle(pid)

                        --	if not Players[pid].isint then
                        if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
                            system.wait(8000)
							
                            if not Players[pid].isint and player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
							 system.wait(2000)
							if not Players[pid].isint and player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
                                Players[pid].PlayerVehGodMode = true
                                --if tracking.playerped_speed1[pid + 1] >= 18 then
                                if Settings["GodCheckNotif"] and not Players[pid].isvgod then
                                    Entity = "Player Vehicle God mode"
                                    Players[pid].isvgod = true
                                    moist_notify(Entity .. "\n" .. pid .. " : " .. name, "GodMode! Vehicle Detected")
									 ModderAudio_notify()
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
			


delete_God_thread = function(feat, data)
menu.create_thread(function(id) menu.delete_feature(id) end, feat.id)
end

function God_Check_pid(pid)
if not Settings["GodCheck"] then return end
God_thread[pid] = {}
local player_id = pid
if Settings["GodCheckVer"] == 1 then
--God_thread[pid] = menu.create_thread(God_Check_pid_thread, pid)
God_thread[pid] = menu.create_thread(GodCheck_pid_thread, pid)
elseif Settings["GodCheckVer"] == 2 then
God_thread[pid] = menu.create_thread(God_Check2_pid_thread, pid)
end
-- local i = #feat + 1
-- feat[i] = menu.add_feature("Delete God Check Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
-- feat[i].data = {thread = God_thread[pid]}

end
function God_Check1_pid(pid)
if not Settings["GodCheck"] then return end
God_thread1[pid] = {}
local player_id = pid
God_thread1[pid] = menu.create_thread(God_Check1_pid_thread, pid)

-- local i = #feat + 1
-- feat[i] = menu.add_feature("Delete God Check 2 Thread: ".. pid, "action", God_Threads_Created.id, delete_God_thread)
-- feat[i].data = {thread = God_thread1[pid]}

end

-- God_Check1_pid_thread = function(context)
-- while true do
	-- local pped = player.get_player_ped(context.pid)
	-- if player.is_player_valid(context.pid) and  context.pid ~= player.player_id() then
	-- if not Players[context.pid].PedSpawned then return end
		-- if ped.is_ped_shooting(pped) then
			-- if player.is_player_god(context.pid) or player.is_player_vehicle_god(context.pid) and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) then
				-- system.wait(2000)
				-- if player.is_player_god(context.pid) or player.is_player_vehicle_god(context.pid) and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) then
					-- if Settings["GodCheckNotif"] and not Players[context.pid].isgod then
						-- moist_notify("Shooting While God Mode: " .. (SessionPlayers[context.pid].Name), "Player God Mode Check Failure!")
						 -- ModderAudio_notify()
						-- Players[context.pid].isgod = true
					-- end
					
				-- end
			-- end
		-- end
	-- end
	-- system.wait(10)
-- end
-- return HANDLER_CONTINUE
-- end

-- God_Check_pid_thread = function(context)
-- while true do
	-- if player.is_player_valid(context.pid) ~= false and context.pid ~= player.player_id()then
		-- local pped, plyveh
		-- if player.is_player_god(context.pid) or player.is_player_vehicle_god(context.pid) then
			-- system.wait(200)
			-- local Entity = ""
			-- pped = player.get_player_ped(context.pid)
			-- if pped ~= nil or pped ~= 0 then
				-- local pos = v3()
				-- plyveh = player.get_player_vehicle(context.pid)
				-- if Players[context.pid].isint then return end
				-- --if not Players[context.pid].PedSpawned then return end
				-- if player.is_player_god(context.pid) or player.is_player_vehicle_god(context.pid) and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) then
					-- system.wait(2000)
					-- if not Players[context.pid].isint and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) and player.is_player_god(context.pid) then
						
						-- if tracking.playerped_speed1[context.pid + 1] >= 21 then
							-- if Settings["GodCheckNotif"] and not Players[context.pid].isgod then
								-- Entity = "Player God mode"
								
								-- Players[context.pid].isgod = true
								
								-- moist_notify(Entity .. "\n" .. context.pid .. " : " .. (SessionPlayers[context.pid].Name), "God Mode Player Detected")
								
							-- end
						-- end
					-- end
					
					-- plyveh = player.get_player_vehicle(context.pid)
					-- if plyveh == nil or plyveh == 0 then return end
						-- if Players[context.pid].isint then return end
						-- elseif player.is_player_vehicle_god(context.pid) and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) then
							-- if tracking.playerped_speed1[context.pid + 1] >= 21 then
								-- system.wait(2000)
								-- if player.is_player_vehicle_god(context.pid) and player.is_player_playing(context.pid) and not entity.is_entity_dead(pped) and tracking.playerped_speed1[context.pid + 1] >= 21 then
									-- if Settings["GodCheckNotif"] and not Players[context.pid].isvgod then
										-- Entity = "Player Vehicle God mode"
										-- Players[context.pid].isvgod = true
										-- moist_notify(Entity .. "\n" .. context.pid .. " : " .. (SessionPlayers[context.pid].Name), "Player Vehicle God Mode Detected")
									-- end
								-- end
							-- end
						-- end
					-- end
					
				-- end
			-- end
			
	-- system.wait(2)
		-- end
	-- end


-- local spawn_feat
-- local spawnwait = 0
-- NetEventHookID1 = 0

-- function SpawnNetEvent()
 -- function spawn_net()
        -- if NetEventHookID1 == 0 then
            -- NetEventHookID1 = hook.register_net_event_hook(PlayerSpawnNetHook)
            -- return HANDLER_POP
        -- end
        -- if NetEventHookID1 ~= 0 then
            -- hook.remove_net_event_hook(NetEventHookID1)
            -- NetEventHookID1 = 0
        -- end
 -- end
    -- PlayerSpawnNetHook = function(b, c, d)
        -- if d == 11 then
            -- local e, f
            -- e = player.get_player_name(b)
            -- f = player.get_player_name(c)
            -- --Print("\nNetEvent[" .. d .. "]" .. " | " .. b .. " : " .. e .. " : " .. c .. " | " .. f .. "\n")
			-- repeat
			-- spawnwait = spawnwait + 1
			-- until spawnwait == 9000
			-- spawnwait = 0
           -- Players[b].PedSpawned = true
            -- return false
        -- elseif d ~= 11 then
            -- return false
        -- end
    -- end
    -- spawn_net()
-- end
-- threads[#threads + 1] = menu.create_thread(SpawnNetEvent, spawn_feat)


			

--TODO: *************MODDER FLAG LOGS
function modderflag(pid)
if not Modders_DB[pid].ismod then
	local flags = player.get_player_modder_flags(pid)
	local flaghex = string.format("%x", flags)
	print(flaghex)
	local flag_ends = player.get_modder_flag_ends(player.get_player_modder_flags(pid))
	local flag_name = player.get_modder_flag_text(flags)
	Modders_DB[pid].flag = flag_name
	Modders_DB[pid].flags = flags
	print(Modders_DB[pid].flags)
	Modders_DB[pid].ismod = true
	local name = player.get_player_name(pid)
	Debug_Out(string.format("[Modder]: " .. name .. " [modder Flags]: " ..  flag_name))
	elseif Modders_DB[pid].ismod then
	test = player.get_player_modder_flags(pid)
	-- print(test)
	-- print(Modders_DB[pid].flags)
	if Modders_DB[pid].flags ~= test then
		player.unset_player_as_modder(pid, Modders_DB[pid].flags)
		-- return end
		local flags = player.get_player_modder_flags(pid)
		local flaghex = string.format("%x", flags)
		print(flaghex)
		local flag_ends = player.get_modder_flag_ends(player.get_player_modder_flags(pid))
		local flag_name = player.get_modder_flag_text(flags)
		Modders_DB[pid].flag = flag_name
		Modders_DB[pid].flags = flags
		Modders_DB[pid].ismod = true
		local name = player.get_player_name(pid)
		Debug_Out(string.format("[Modder]: " .. name .. " [modder Flags]: " ..  flag_name))
	end
end
return HANDLER_POP
end
--TODO: Player Feature Parents
PlayerFeatParent = menu.add_player_feature("Moists Script 2.0.5.7", "parent", 0).id
spawn_parent = menu.add_player_feature("Spawn Options", "parent", PlayerFeatParent).id

Player_Tools = menu.add_player_feature("Player Tools", "parent", PlayerFeatParent).id
--vehicle_Tools = menu.add_player_feature("Vehicle Tools", "parent", PlayerFeatParent).id

	
BountyId = menu.add_player_feature("Bounty Options", "parent", PlayerFeatParent, function(feat)
	return HANDLER_POP
end)
for i=0,#BountyId.feats do
BountyId.feats[i].hidden = NewDLC()
end

playerfeatVars.fm = menu.add_player_feature("Force Player to Mission", "parent", PlayerFeatParent)
for i=0,#playerfeatVars.fm.feats do
playerfeatVars.fm.feats[i].hidden = NewDLC()
end

playerfeatVars.spam_sms = menu.add_player_feature("SMS Spam", "parent", PlayerFeatParent).id
playerfeatVars.Preset_sms = menu.add_player_feature("SMS Spam Presets", "parent", playerfeatVars.spam_sms).id
playerfeatVars.Preset_RUS = menu.add_player_feature("Russian Spam Presets", "parent", playerfeatVars.Preset_sms).id

--TODO: Chat Spam
local function SpamByFile()
local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local loaded_text, Feats, Spam_Modifier = {}, {}, 1
utils.make_dir(rootPath  .. "\\Chat_Textfiles")

local parent1 = menu.add_feature("ChatSpam From File", "parent", globalFeatures.Moist_Spam)
local text_file = menu.add_feature("Load Text file: ", "parent", parent1.id)

menu.add_feature("Reload File List", "action", text_file.id, function(feat)
	if #Feats ~= nil then
	for i = 1, #Feats do
	 menu.delete_feature(Feats[i].id)
	end
	end
	Feats = {}
		 
	list_File_load_Text()
end)

local spam_modifier = menu.add_feature("Modifier Value", "autoaction_value_i", parent1.id, function(feat)
	update_mod_value(feat.value)
	menu.notify("Spam by Line Slider will now:\nIncrement by: " .. feat.value .."\nEach step", "Moists ChatSpam By File", 5, 0xffffff00)
		
end)
spam_modifier.max = 200
spam_modifier.min = 1
spam_modifier.value = 1
Spam_type_set = " "
typeset = "Spam File "

spam_type = menu.add_feature("Spam Type: ", "autoaction_value_str", parent1.id, function(feat)
	local notifyvalue = {}
	notifyvalue = spam_type:get_str_data()
	menu.notify("Spam Type Set:\n" .. notifyvalue[feat.value+1], "Moists ChatSpam By File", 5, 0xffffff00)
	if feat.value == 0 then Spam_type_set = "SpamFile on " elseif feat.value == 1 then Spam_type_set = "Spam2End " end
	spambyline.name = tostring(Spam_type_set .. notifyvalue[feat.value+1])
	
end)
spam_type:set_str_data({"Loop","Once"})
spam_type.value = 0

spam_byline = menu.add_feature("1 Shot Spam Line: " .. typeset, "action_value_i", parent1.id, function(feat)

	if #loaded_text == nil then return end
	network.send_chat_message(loaded_text[feat.value], false)

end)
spam_byline.max = 1
spam_byline.min = 1
spam_byline.value = 1




spambyline = menu.add_feature(typeset, "slider", parent1.id, function(feat)
	if feat.on then
	if #loaded_text == nil then return end
	for i = 1, #loaded_text do
	network.send_chat_message(loaded_text[i], false)
	system.yield(math.ceil(feat.value))
	if not feat.on then break end
	if spam_type.value == 1 and i == #loaded_text  then 
		feat.on = false
		break end
	end
	return HANDLER_CONTINUE
	end
end)
spambyline.on = false
spambyline.max = 2000.00
spambyline.min = 0.0
spambyline.mod = 50.0



function list_File_load_Text()

local text_dir = rootPath .. "\\Chat_Textfiles\\"
local files = utils.get_all_files_in_directory(text_dir, "txt")
    for i = 1, #files do
	
	local feat = "filesID" .. i
	Feats[#Feats+1] = menu.add_feature(files[i], "action_value_str", text_file.id, function(feat)
	local spamon
	if spambyline.on then
	spamon = true
	spambyline.on = false
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
	spam_byline.max = #loaded_text
	end
	if spamon == true then
	spambyline.on = true
	spamon = nil
	end
	
	end)
	Feats[#Feats]:set_str_data({"Load Fresh","Append to Current"})
	end
end
list_File_load_Text()

update_mod_value = function(value)
	
spambyline.mod = value
end
end
SpamByFile()



ChatSpamOn = false
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
            if feat.on then
                text = tostring(russian_spam[i][2])
                player.send_player_sms(pid, text)
                return HANDLER_CONTINUE
            end
        end)

end
for y =1, #ScriptLocals["RUSPAM"] do
for i=0,#ScriptLocals["RUSPAM"][y].feats do
	ScriptLocals["RUSPAM"][y].feats[i].on = false
	
end
end

    for i = 1, #russian_spam do
        spammRU.var[i] =  menu.add_feature(i..": " .. russian_spam[i][1], "value_i", globalFeatures.Preset_RUS, function(feat)
            if feat.on then
                ChatSpamOn = true
                text = tostring(russian_spam[i][2])
                network.send_chat_message(text, false)
                system.wait(feat.value)
                return HANDLER_CONTINUE
            end
            ChatSpamOn = false
            return HANDLER_POP
        end)
        spammRU.var[i].max = 1000
        spammRU.var[i].min = 0
        spammRU.var[i].value = Settings["spam_wait"]
end

    for i = 1, #spam_preset do
        ScriptLocals["SMS_spam"][i] = menu.add_player_feature("sms: " .. spam_preset[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
            if feat.on then
                text = tostring(spam_preset[i][2])
                player.send_player_sms(pid, text)
                return HANDLER_CONTINUE
            end
        end)
end
    for i = 1, #spam_preset do
        spamm.var[i] =  menu.add_feature(i..": " .. spam_preset[i][1], "value_i", globalFeatures.Preset_Chat, function(feat)
            if feat.on then
                ChatSpamOn = true
                text = tostring(spam_preset[i][2])
                network.send_chat_message(text, false)
                system.wait(feat.value)
                return HANDLER_CONTINUE
            end
            ChatSpamOn = false
            return HANDLER_POP
        end)
        spamm.var[i].max = 1000
        spamm.var[i].min = 0
        spamm.var[i].value = Settings["spam_wait"]
end
    for i = 1, #spam_presets do
        ScriptLocals["SMS_spam"][i] = menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
            if feat.on then
                text = tostring(spam_presets[i][2])
                player.send_player_sms(pid, text)
                return HANDLER_CONTINUE
            end
        end)
end
    for i = 1, #spam_presets do
        local pfeat = string.format("preset" .. i)
        pfeat = menu.add_feature(i..": ".. spam_presets[i][1], "parent", globalFeatures.custom_Chat)
        pfeat.hidden = false
        spamm.var[i] = menu.add_feature("Send Chat Spam", "value_i", pfeat.id, function(feat)
            if feat.on then
                ChatSpamOn = true
                text = tostring(spam_presets[i][2])
                network.send_chat_message(text, false)
                system.wait(feat.value)
                return HANDLER_CONTINUE
            end
            ChatSpamOn = false
            return HANDLER_POP
        end)
        spamm.var[i].max = 1000
        spamm.var[i].min = 0
        spamm.var[i].value = Settings["spam_wait"]
        spamm.var[i] = menu.add_feature("Delete Chat Spam", "action", pfeat.id, function(feat)
            spam_presets[i][1] = nil
            spam_presets[i][2] = nil
            moist_notify("Remember to rewrite presets to Finalise Save & Delete\nThis can be Found in Spam Options", "Moists ChatSpam:\nPreset Deleted")
            pfeat.hidden = true
        end)
end
	for y =1, #ScriptLocals["RUSPAM"] do
	    for i=0,#ScriptLocals["RUSPAM"][y].feats do
        ScriptLocals["RUSPAM"][y].feats[i].on = false
end
		end
	for y =1, #ScriptLocals["SMS_spam"] do
    for i=0,#ScriptLocals["SMS_spam"][y].feats do
        ScriptLocals["SMS_spam"][y].feats[i].on = false
end
	end

end
Chat_N_SMS_Spam()


notxtspam = menu.add_feature("no text spam", "toggle", globalFeatures.Moist_Spam, function(feat)
	if feat.on then
		ChatSpamOn = true
		network.send_chat_message(" ", false)
		return HANDLER_CONTINUE
	end
	ChatSpamOn = false
	return HANDLER_POP
end)
notxtspam.on = false
menu.add_feature("3-2-1-GO", "action", globalFeatures.Moist_Spam, function(feat)
	local count = 4
	for i = 0, 3 do
		count = count - 1
		if count == 0 then count = "GO" end
		network.send_chat_message(count, false)
		system.yield(1000)
	end
	return HANDLER_POP
end)


chatclipboard = menu.add_feature("Send Clipboard Contents", "action_value_str", globalFeatures.Moist_Spam, function(feat)
	ChatSpamOn = false
	if feat.value == 0 then
	local text = string.format(utils.from_clipboard())
	network.send_chat_message(text, false)
	elseif feat.value == 1 then
	local text = string.format(utils.from_clipboard())
	network.send_chat_message(text, true)
	end
	
	--ChatSpamOn = false
	return HANDLER_POP
end)
chatclipboard:set_str_data({"Public Chat","Team Chat"})

chatclipboardv2 = menu.add_feature("Send Clipboard Contents", "action_value_str", globalFeatures.Moist_Spam, function(feat)
	
if utils.file_exists(Paths.tempchat) then
	local file = io.open(Paths.tempchat, "w+")
	io.output(file)
	io.write("")
	io.write(utils.from_clipboard() .. "\n")
	io.close()
end
	
	for line in io.lines(Paths.tempchat) do
		
	if feat.value == 0 then
	network.send_chat_message(line, false)
	elseif feat.value == 1 then
	network.send_chat_message(line, true)
	end
	end
	--ChatSpamOn = false
		
	return HANDLER_POP
end)
chatclipboardv2:set_str_data({"Public Chat","Team Chat"})


menu.add_feature("String Char randomised spam", "toggle", globalFeatures.Moist_Spam, function(feat)
	ChatSpamOn = true
	if feat.on then
		local a, b, c
		a = math.random(1, 254)
		local a1 = math.random(1, 254)
		local text = string.char(a, 255, 255) .." " .. string.char(a, a1, 255) .." " ..  string.char(a, a1, a1)
		network.send_chat_message(text, false)
		return HANDLER_CONTINUE
	end
	ChatSpamOn = false
	return HANDLER_POP
end)
menu.add_feature("String Char randomised delayspam", "toggle", globalFeatures.Moist_Spam, function(feat)
	ChatSpamOn = true
	if feat.on then
		local a, b, c
		a = math.random(1, 254)
		local a1 = math.random(1, 254)
		local text = string.char(a, 255, 255) .." " .. string.char(a, a1, 255) .." " ..  string.char(a, a1, a1)
		network.send_chat_message(text, false)
		system.wait(100)
		return HANDLER_CONTINUE
	end
	ChatSpamOn = false
	return HANDLER_POP
end)
spam_delay = menu.add_feature("Set Delay in ms", "action_value_i", globalFeatures.Spam_Options, function(feat)
	Settings["spam_wait"] = feat.value
end)
spam_delay.max = 1000
spam_delay.min = 0
spam_delay.value = Settings["spam_wait"]


menu.add_feature("Add Custom Preset", "action", globalFeatures.Spam_Options, function(feat)
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
            pfeat.hidden = false
            spamm.var[i] = menu.add_feature("Send Chat Spam", "value_i", pfeat.id, function(feat)
                if feat.on then
                    ChatSpamOn = true
                    text= tostring(spam_presets[i][2])
                    network.send_chat_message(text, false)
                    system.wait(feat.value)
                    return HANDLER_CONTINUE
                end
                ChatSpamOn = false
                return HANDLER_POP
            end)
            spamm.var[i].max = 1000
            spamm.var[i].min = 0
            spamm.var[i].value = Settings["spam_wait"]
            spamm.var[i] = menu.add_feature("Delete Chat Spam", "action", pfeat.id, function(feat)
                spam_presets[i][1] = nil
                spam_presets[i][2] = nil
                moist_notify("Remember to rewrite presets to Finalise Save & Delete\nThis can be Found in Spam Options", "Moists ChatSpam:\nPreset Deleted")
                pfeat.hidden = true
            end)
            local plyfeat = string.format("preset" .. i)
            plyfeat = menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
                if feat.on then
                    text= tostring(spam_presets[i][2])
                    player.send_player_sms(pid, text)
                    return HANDLER_CONTINUE
                end
            end)
            for i=0,#plyfeat.feats do
                plyfeat.feats[i].on = false
            end
        end
end)


 spam_cus_long = menu.add_feature("Rewrite Preset file", "action", globalFeatures.Spam_Options, function(feat)
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


function scriptloader()
    ScriptFiles = {}
    ScriptFeat = {}
    loadedScripts = {}
    local scriptload = Paths.Cfg .. "\\scriptloader.ini"

    if not utils.file_exists(scriptload) then
        io.open(scriptload, "w+")
        io.output(scriptload)
        io.write("")
        io.close()
    end

    menu.add_feature("Save Loaded Scripts", "action", globalFeatures.Script_loader, function(feat)
        io.open(scriptload, "w+")
        io.output(scriptload)
        for i = 1, #loadedScripts do
            io.write(loadedScripts[i] .. "\n")
        end
        io.close()
    end)

    function GetScripts()
        local files = utils.get_all_files_in_directory(Paths.Root .. "\\scripts\\", "lua")
        for i = 1, #files do

            ScriptFiles[#ScriptFiles + 1] = files[i]
        end
    end
    GetScripts()

    for i = 1, #ScriptFiles do
        local feat_name, featname, funcname
        feat_name = string.format(ScriptFiles[i])
        featname = {feat_name:sub(1, 6), feat_name}
        ScriptFeat[i] = menu.add_feature(ScriptFiles[i], "action", globalFeatures.Script_loader, function(feat)
            funcname = featname
			
		local status, err = pcall(LoadScript, ScriptFiles[i], ScriptFeat[i])
	--	if not status then
	--	print(tostring(status) .. " Function Error " .. tostring(err))
	--	menu.notify("MoistScript: Script Loader\nStatus = " .. tostring(status) .."\nError = " .. tostring(err), "Error Loading Script", 5, 0xff0000ff)

	--	end

        end)
        ScriptFeat[i].hidden = false

    end

    function LoadScript(scriptname, feature)
        local file = Paths.Root .. "\\scripts\\" .. scriptname
        loadedScripts[#loadedScripts + 1] = scriptname

        local a = assert(loadfile(file))
        feature.hidden = true

        return a()
    end

    for line in io.lines(scriptload) do
        local file = Paths.Root .. "\\scripts\\" .. line

        local f = assert(loadfile(file))
        return f()

    end

end


-- TODO: Recent Player Features
function recentplayerslist()
    local RecentPlayers_Feat, blacklistpid = {}, {}
    Recent_Players = {{
        name = {},
        count = {},
        rid = {},
        nid = {},
        htoken = {},
        DecIP = {},
		PartIP = {},
    }}
    RecentPlayers = {}
    TempBlacklist = {{
        name = {},
        scid = {},
        decip = {},
        decip2 = {},
        nameON = {},
        scidON = {},
        decipON = {},
        decip2ON = {},
    }}
    RecentPlayer = {
        Features = {},
		Blacklist1 = {},
		Blacklist2 = {},
		Blacklist3 = {},
		
    }

    Join_Event_Check = event.add_event_listener("player_join", function(e)
        if e.player ~= nil then
            playerRDB(e.player)
            TempBlacklistCheck(e.player)
        end
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
        --	system.wait(10)
        if network.network_is_host() then
            network.network_session_kick_player(pid)
        elseif not network.network_is_host() then
            script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
            script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
        end
        network.network_session_kick_player(pid)
end

    function playerRDB(pid)
        local scid, playername, token, tokeen, count, PlyIP, Part_IP
        PlyIP = player.get_player_ip(pid)
		local TranIP = dec2ip(PlyIP)
		Part_IP = Get_Partial_IP(TranIP)
        scid = player.get_player_scid(pid)
        if scid ~= 4294967295 then
            playername = player.get_player_name(pid) or "NaN"
            count = -1
            token = player.get_player_host_token(pid)
            tokhex = string.format("%x", token)
            --tokeen = tostring(tokhex:sub(1, 8))
            tokeen = tostring(tokhex)
            local i = #Recent_Players + 1
            Recent_Players[i] = {}
            RecentPlayer[i] = {}
            TempBlacklist[i] = {}

            for y = 1, #Recent_Players do
                if Recent_Players[y].rid == scid then
                    count = Recent_Players[y].count + 1
                    Recent_Players[y].count = count
                    if count > 2 and Settings["RecentPlayer_Notify"] then
                        moist_notify("Recently Seen Player:\n" .. tostring(playername) .. "\nSCID: " .. scid .. "\nSeen: " .. count .. " times", "Recently Seen Player Joined")
                    end
                    return
                end
            end
            RecentPlayer[i].Features = {}
            Recent_Players[i].name = player.get_player_name(pid)
            Recent_Players[i].count = count + 1
            Recent_Players[i].rid = scid
            Recent_Players[i].DecIP = PlyIP
			Recent_Players[i].PartIP = Part_IP			
            Recent_Players[i].nid = network.network_hash_from_player(pid)
            Recent_Players[i].htoken = tokeen
            TempBlacklist[i].nameON = false
            TempBlacklist[i].scidON = false
            TempBlacklist[i].nameON = false
            TempBlacklist[i].decipON = false
            TempBlacklist[i].name = playername
            TempBlacklist[i].scid = scid
            TempBlacklist[i].decip = PlyIP
			TempBlacklist[i].decip2 = Part_IP
			
			Recent_Player(pid, i)
            count = 0
		end
end
    PNum = 0
	
 function Recent_Player(pid, spid)
        if player.is_player_valid(pid) then
            rpid = spid
            local RecentID = Recent_Players[rpid].rid
            local idc = spid - 1
            name = tostring(idc .. ": " .. Recent_Players[rpid].name)
            RecentID = menu.add_feature(name, "parent", Recent)
            local scid, nid = Recent_Players[spid].rid, Recent_Players[spid].nid
			local DIP = Recent_Players[spid].DecIP
            local TranIP = dec2ip(DIP)
            local i = #RecentPlayer + 1
            RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players SCID = " .. scid, "action", RecentID.id, function(feat)
			local scid = Recent_Players[spid].rid
                utils.to_clipboard(scid)
                return HANDLER_POP
            end)
			
            RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players nethash = " .. nid, "action", RecentID.id, function(feat)
            local nid = Recent_Players[spid].nid
                utils.to_clipboard(nid)
                return HANDLER_POP
            end)
			
            RecentPlayers_Feat[#RecentPlayers_Feat + 1 ] = menu.add_feature("Players IP = " .. TranIP, "action", RecentID.id, function(feat)
			local ip = TranIP
                utils.to_clipboard(ip)
                return HANDLER_POP
            end)
            local scid, name, token = (Recent_Players[rpid].rid), (Recent_Players[rpid].name), (Recent_Players[rpid].htoken)
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

            RecentPlayer[spid].Features = menu.add_feature("Temp BlacklistPlayer", "parent", RecentID.id)
            RecentPlayer[spid].Blacklist1 = menu.add_feature("Blacklist IP", "toggle", RecentPlayer[spid].Features.id, function(feat)
                if not feat.on then
                    TempBlacklist[spid].decipON = false
                    return HANDLER_POP
                end
                CheckIF_INSession()
                if feat.on then
                    TempBlacklist[spid].decipON = true
                    --system.wait(3000)
                    return HANDLER_CONTINUE
                end
            end)
            RecentPlayer[spid].Blacklist1.on = false
			
			RecentPlayer[spid].Blacklist12 = menu.add_feature("Partial Blacklist IP", "toggle", RecentPlayer[spid].Features.id, function(feat)
			local ip = TranIP
                if not feat.on then
                    TempBlacklist[spid].decip2ON = false
                    return HANDLER_POP
                end
                CheckIF_INSession()
                if feat.on then
                    TempBlacklist[spid].decip2ON = true
                    --system.wait(3000)
                    return HANDLER_CONTINUE
                end
            end)
            RecentPlayer[spid].Blacklist12.on = false
			
            RecentPlayer[spid].Blacklist2 = menu.add_feature("Blacklist SCID", "toggle", RecentPlayer[spid].Features.id, function(feat)
                if not feat.on then
                    TempBlacklist[spid].scidON = false
                    return HANDLER_POP
                end
                CheckIF_INSession()
                if feat.on then
                    TempBlacklist[spid].scidON = true
                    --	system.wait(3000)
                    return HANDLER_CONTINUE
                end
            end)
            RecentPlayer[spid].Blacklist2.on = false
            RecentPlayer[spid].Blacklist3 = menu.add_feature("Blacklist Name", "toggle", RecentPlayer[spid].Features.id, function(feat)
                if not feat.on then
                    TempBlacklist[spid].nameON = false
                    return HANDLER_POP
                end
                CheckIF_INSession()
                if feat.on then
                    TempBlacklist[spid].nameON = true
                    --system.wait(3000)
                    return HANDLER_CONTINUE
                end
            end)
            RecentPlayer[spid].Blacklist3.on = false
        end
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
moist_notify(string.format("%f, %f, %f", pos.x, pos.y, pos.z), "Saved Players Position")
savepos(string.format("\nPosition Saved From Player: "..tostring(name).."\n"..s..",	"..'{'..pos.x ..", "..pos.y ..", "..pos.z..'}'))
return HANDLER_POP
end)

savepos = function(text)
local file = io.open(Paths.Logs .. "\\saveposoutput.txt", "a")
io.output(file)
io.write(text)
io.close()
end

--TODO: Notify settings

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

    print(color)
end

notifyvalue = menu.add_feature("Current Value", "action_value_str", globalFeatures.notifyParent, function(feat)
utils.to_clipboard(NotifyVar_Value[feat.value])
end)
notifyvalue:set_str_data(NotifyVar_Value)

notify_R = menu.add_feature("Notify Red:", "action_value_i", globalFeatures.notifyParent, function(feat)
NotifyR = feat.value
notify_colour_setting()
Settings["NotifyColorRDefault"] = feat.value
moist_notify("Test Color:\n", Notify_Var_Value)
return HANDLER_POP
end)
notify_R.max = 255
notify_R.min = 0
notify_R.value = Settings["NotifyColorRDefault"]

notify_G = menu.add_feature("Notify Green:", "action_value_i", globalFeatures.notifyParent, function(feat)
NotifyG = feat.value
notify_colour_setting()
Settings["NotifyColorGDefault"] = feat.value
moist_notify("Test Color:\n", Notify_Var_Value)
return HANDLER_POP
end)
notify_G.max = 255
notify_G.min = 0
notify_G.value = Settings["NotifyColorGDefault"]

notify_B = menu.add_feature("Notify Blue:", "action_value_i", globalFeatures.notifyParent, function(feat)
NotifyB = feat.value
notify_colour_setting()
Settings["NotifyColorBDefault"] = feat.value
moist_notify("Test Color:\n", Notify_Var_Value)
return HANDLER_POP
end)
notify_B.max = 255
notify_B.min = 0
notify_B.value = Settings["NotifyColorBDefault"]

notify_A = menu.add_feature("Notify Alpha Transparency:", "action_value_i", globalFeatures.notifyParent, function(feat)
NotifyA = feat.value
notify_colour_setting()
Settings["NotifyColorADefault"] = feat.value
return HANDLER_POP
end)
notify_A.max = 255
notify_A.min = 0
notify_A.value = Settings["NotifyColorADefault"]
notify_A.hidden = true

--TODO: Online Features
Send2Island = menu.add_player_feature("Force Player to Island", "action", 0, function(feat, pid)
script.trigger_script_event(0xDAF8082C, pid, {1300962917})
script.trigger_script_event(0xDAF8082C, pid, {0, 0, 9})
script.trigger_script_event(0xDAF8082C, pid, {pid, 0, 0, 9})
return HANDLER_POP
end)
for i=0,#Send2Island.feats do
    Send2Island.feats[i].hidden = NewDLC()
end


ip_clip = menu.add_player_feature("Copy IP to Clipboard", "action", 0, function(feat, pid)
ip = GetIP(pid)
utils.to_clipboard(dec2ip(ip))
end)

--TODO: Orbital Room Protection

OrbitalThreads = {}

orbitalProxy = menu.add_feature("Add Orbital Proximity Blip", "value_f", globalFeatures.orbital, function(feat)
if not feat.on then
	Settings["orbitalProxyBlip"] = false
	orbitalProxy_colour.hidden = true
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
	orbitalProxy_colour.hidden = false
	end
end
system.yield(600)
return HANDLER_CONTINUE
end)
orbitalProxy.max = 120.00
orbitalProxy.min = 0.01
orbitalProxy.value = 18.05
orbitalProxy.mod = 0.10
orbitalProxy.on = Settings["orbitalProxyBlip"]



orbitalProxy_colour = menu.add_feature("Update Orbital Proximity Blip Colour", "action_value_i",  globalFeatures.orbital, function(feat)
if ObitalBlip ~= nil then
	ui.set_blip_colour(ObitalBlip, feat.value)
end
end)
orbitalProxy_colour.max = 120
orbitalProxy_colour.min = 1
orbitalProxy_colour.value = 1
orbitalProxy_colour.hidden = true

menu.add_feature("Teleport to block location?", "action", globalFeatures.orbital, function(feat)
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
orbital_blastdoor = menu.add_feature("New Orbital Block Blast Door", "action", globalFeatures.orbital, function(feat)
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
Force_block_orbital.on = true

--system.wait(0)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
end)

Force_block_orbital = menu.add_feature("Force Orbital Block", "toggle", globalFeatures.orbital, function(feat)
local pos, rot = v3(), v3()	
pos.x = 337.73406982422
pos.y = 4833.0112304688
pos.z = -56.326847076416
rot.x = 5.0000038146973
rot.y = -5.0000038146973
rot.z = 164.99998474121
	
	if feat.on then
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
Force_block_orbital.on = false
	
	
	


block_orbital = menu.add_feature("Moving Wall Orbital Block", "action", globalFeatures.orbital, function(feat)
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

blockplaces03 = menu.add_feature("Block Orbital Entrance with Wall", "action", globalFeatures.orbital, function(feat)
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
orbscreens = menu.add_feature("Orbital Inactive Screens over Block", "action", globalFeatures.orbital, function(feat)
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
pos3.x = 336.016083
pos3.y = 4834.12988
pos3.z = -59.5252228
rot3.x = -25.160162
rot3.y = 2.82980454e-06
rot3.z = 122.541527
pos4.x = 336.016083
pos4.y = 4834.12988
pos4.z = -57.5355568
rot4.x = -25.160162
rot4.y = 2.82980454e-06
rot4.z = 122.541527
pos5.x = 336.28463745117
pos5.y = 4833.7241210938
pos5.z = -80.422435760498
rot5.x = 25.0
rot5.y = 5.0000004768372
rot5.z = -94.999992370605
spawned_cunts[#spawned_cunts + 1] = object.create_object(3544215092, pos5, true, false)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot5)
if AddBlips == true then
BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
end
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
spawned_cunts[#spawned_cunts + 1] = object.create_object(-1399826314, pos3, true, true)
entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot3)
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
menu.add_feature("Teleport to Casino God Mode Glitch location?", "action", globalFeatures.glitch, function(feat)
local pos = v3()
pos.x = 980.99298095703
pos.y = 67.855430603027
pos.z = 117.94748687744
heading = -1.1678575901897e-006
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
return HANDLER_POP
end)
casinoglitch = menu.add_feature("Block Casino God Mode Glitch area", "action", globalFeatures.glitch, function(feat)
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

delete_cunt = menu.add_feature("Delete Spawned Cunts", "action", globalFeatures.cleanup, function(feat)

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

--TODO: Player Joins
joining_players_logger = event.add_event_listener("player_join", function(e)
    local pid, scid, schx, name
    pid = e.player
    scid = player.get_player_scid(pid)
    schx = string.format("%x", scid)
    name = tostring(player.get_player_name(pid))
    netplyhash = network.network_hash_from_player(e.player)
    local ip, sip, token, tohex, prior
    token = player.get_player_host_token(pid)
    tokhex = string.format("%x", token)
    prior = player.get_player_host_priority(pid)
	DecIP = player.get_player_ip(pid)
	
    if string.len(scid) <= 5 then
	moist_notify("Joining Player: " .. name .. "\nUsing Very Short scid\n Most likely this is Spoofed!!", "Moists Joining Modder Detection")
	end
	if DecIP == 1162167621 or DecIP == 4294967295 or DecIP == 16843009 or DecIP == 2130706433 then
	moist_notify("Joining Player: " .. name .. "\nUsing a known Modder Spoofed IP !", "Moists Joining Modder Detection")
      --  KickPid(pid)
end

    ip = GetIP(pid)
    sip = dec2ip(ip)
	IP_Info(sip)
    joined_data(name .. ":" .. schx .. "|" .. pid .. "|" .. scid .. "|" .. token .. "|" .. tokhex .. "|" .. prior .. "|" .. ip .. "|" .. sip .. "\n")
    joined_csv(name .. ',' .. schx .. ',' .. pid .. ',' .. scid .. ',' .. netplyhash .. ',' .. token .. ',' .. tokhex .. ',' .. prior .. ',' .. ip .. ',' .. sip)
    playerDB(pid, player.get_player_ip(pid))
    blacklist_check(pid)
    return
end)

function IP_Info(ip)
	
	 file = io.open(Paths.Logs .. "\\Translated_IP_OUT_4console.txt", "a")
	io.output(file)
	local IPData = tostring("http://ip-api.com/line/" .. ip .. "?fields=country,city,proxy")
	io.write("\n" .. IPData)
	io.flush()
	io.close(file)
	system.wait(500)
end

	

function joined_data(text)
    local d, dtime, dt, CurDateTime, file
    d = os.date()
    dtime = string.match(d, "%d%d:%d%d:%d%d")
    dt = os.date("%d/%m/%y")
    CurDateTime = (string.format(dt .. "|" .. dtime .. "|"))
    file = io.open(Paths.Logs .. "\\PlayerJoins.txt", "a")
    io.output(file)
    io.write("\n" .. CurDateTime .. text)
    io.close()
end


function joined_csv(text)
    local d, dtime, dt, CurDateTime, file
    d = os.date()
    dtime = string.match(d, "%d%d:%d%d:%d%d")
    dt = os.date("%d/%m/%y%y")
    local Date = os.date("%d-%m-%y")
    if not utils.file_exists(Paths.Logs .. "\\PlayerJoins" .. Date .. ".csv") then
        Create_Csv()
        -- system.wait(10)
end
    CurDateTime = (string.format(dt .. ',' .. dtime .. ','))
    file = io.open(Paths.Logs .. "\\PlayerJoins" .. Date .. ".csv", "a")
    io.output(file)
    io.write(CurDateTime .. text .. "\n")
    io.close()
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


function playerDB(pid, ip)
    if player.is_player_valid(pid) then
        local scid, name, token, file1, file2, tokeen
        scid = player.get_player_scid(pid)
        name = player.get_player_name(pid)
        token = string.format("%x", player.get_player_host_token(pid))
        file1 = io.open(Paths.Logs .. "\\PlayerDB.txt", "a")
        io.output(file1)
        tokeen = tostring(token)
        io.write("\n" .. tokeen .. "|" .. name .. ", " .. scid .. "|" .. name .. ", " .. ip)
        io.close()
        file2 = io.open(Paths.Logs .. "\\IP_LIST.txt", "a")
        io.output(file2)
        io.write(ip .. "\n")
        io.close()
end
end

--TODO: Blacklist

function ValidScid(scid)
    return scid ~= -1 and scid ~= 4294967295
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
        print("Removed " .. scid .. " from blacklist.")
		
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
    menu.add_feature(scidN .. ": " .. scid .. " (" .. name .. ")", "action", RemoveBlacklistFeature.id, RemoveScidByFeature)
        .data = scid
    Debug_Out(string.format("Added " .. scid .. " (" .. name .. ")" .. "to blacklist"))
    print("Added " .. scid .. " (" .. name .. ") to blacklist.")
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
    print("Loaded blacklist with " .. scidN .. " entries.")
end

--TODO: Blacklist kick
BL_Notify = {}
BL_M_Notify = {}

for pid = 0, 31 do
BL_Notify[pid] = false

BL_M_Notify[pid] = false
end
function KickPid(pid)
    if pid == player.player_id() then
        return
end

    scid = player.get_player_scid(pid)
    name = (player.get_player_name(pid)) or (SessionPlayers.Name)
    -- system.wait(10)
    if network.network_is_host() then
        if not BL_Notify[pid + 1] then
            Debug_Out(string.format("Black List: Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ")"))
            print("Black List: Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ").")
            moist_notify("Host Kicked: " .. name .. " : " .. scids[scid], "Blacklist Player Kicked", 0xff0000ff)
            BL_Notify[pid + 1] = true
        end
        network.network_session_kick_player(pid)
    else
        if not BL_Notify[pid + 1] then
            name = (player.get_player_name(pid)) or (string.format(SessionPlayers.Name) .. scids[scid])
            Debug_Out(
                string.format("Black List: Non-Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ")"))
            print("Non-Host kicked " .. pid .. " (" .. name .. " : " .. scids[scid] .. ")")
            moist_notify("Script-Event Kicked: " .. name .. " : " .. scids[scid], "Blacklist Player Kicked", 0xff0000ff)
            BL_Notify[pid + 1] = true
        end
        script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
        script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})

end
    network.network_session_kick_player(pid)
end

function MarkPidAsModder(pid)
    if pid == player.player_id() then
        return
end
    local scid = player.get_player_scid(pid)
    name = (player.get_player_name(pid)) or (SessionPlayers.Name .. scids[scid])
    -- system.wait(10)
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

EnabledBlacklistFeature = menu.add_feature("Enable blacklist", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        Settings["Blacklist_ON"] = false
        return HANDLER_POP
end
    Settings["Blacklist_ON"] = true

    local lp = player.player_id()
    for pid = 0, 31 do
        if pid ~= lp then
            local scid = player.get_player_scid(pid)
            if ValidScid(scid) and scids[scid] then
                if MarkAsModderFeature.on then
                    MarkPidAsModder(pid)
                end
                if KickFeature.on then
                    KickPid(pid)
                end
            end
        end
end
    -- system.wait(100)
    return HANDLER_CONTINUE
end)
EnabledBlacklistFeature.on = Settings["Blacklist_ON"]

MarkAsModderFeature = menu.add_feature("Mark As Modder", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        Settings["Blacklist_Mark"] = false
        return HANDLER_POP
end
    Settings["Blacklist_Mark"] = true
    return HANDLER_POP
end)
MarkAsModderFeature.on = Settings["Blacklist_Mark"]
KickFeature = menu.add_feature("Kick Player", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        Settings["Blacklist_kick"] = false
        return HANDLER_POP
end
    Settings["Blacklist_kick"] = true
    return HANDLER_POP
end)
KickFeature.on = Settings["Blacklist_kick"]
menu.add_feature("Manually add scid", "action", globalFeatures.parentID, function(feat)
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
        AddScidByPid(pid)
        if EnabledBlacklistFeature.on then
            if MarkAsModderFeature.on then
                MarkPidAsModder(pid)
            end
            if KickFeature.on then
                KickPid(pid)
            end
        end
end)
for i =0, #globalFeatures.addtoblacklist.feats do
globalFeatures.addtoblacklist.feats[i].hidden = false
end

globalFeatures.removefromblacklist = menu.add_player_feature("Remove from Blacklist", "action", PlayerFeatParent, function(feat, pid)
RemoveScidByPid(pid)
player.unset_player_as_modder(pid, mod_flag_4)
end)
for i =0, #globalFeatures.removefromblacklist.feats do
globalFeatures.removefromblacklist.feats[i].hidden = false
end

--TODO: Blacklist Player Join
function blacklist_check(pid)
    if not EnabledBlacklistFeature.on then
        return
end
    local scid = player.get_player_scid(pid)
    if ValidScid(scid) and scids[scid] then
        local name = player.get_player_name(pid) or SessionPlayers.Name and scids[scid]
        -- system.wait(10)

        moist_notify("(" .. name .. " : " .. scids[scid] .. ") " .. scid, "BlackList Player Joining:", 0xff0000ff)
        if MarkAsModderFeature.on then
            MarkPidAsModder(pid)
        end
        if KickFeature.on then
            KickPid(pid)
        end
end
end
LoadBlacklist()

--TODO: Chat Logger
function chat(name, text)
    if not chat_log.on then
        return
end
    local d = os.date()
    local t = string.match(d, "%d%d:%d%d:%d%d")
    local dt = os.date("%d/%m/%y%y")
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
    print(t .. " [ " .. name .. " ] " .. text)
end

ChatEventID = event.add_event_listener("chat", function(e)
local sender
--if player.get_player_ped(e.player) == 0 then return end
if not player.is_player_valid(e.player) then
	sender = "NaN"
	elseif  player.is_player_valid(e.player) then
	sender = player.get_player_name(e.player)
--end
--if not ChatSpamOn then
	chat(sender, e.body)
	Console_chat(sender, e.body)
	Chat_Command(e.player, e.body)
--	elseif ChatSpamOn then
--	if e.player ~= player.player_id() then
--		chat(sender, e.body)
--		Console_chat(sender, e.body)
--		Chat_Command(e.player, e.body)
	--end
end
end)


DeathEvent = event.add_event_listener("PlayerDeath", function(e)
	moist_notify("event" .. e .. "\nPlayerDeath Triggered")
end)

-- ChatEventID = event.add_event_listener("chat", function(e)
    -- local sender = e.player
        -- sender = player.get_player_name(e.player)

    -- if not ChatSpamOn then
	-- local status, err = pcall(chat, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
	-- local status, err = pcall(Console_chat, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
	-- local status, err = pcall(Chat_Command, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
    -- elseif ChatSpamOn then
        -- if e.player ~= player.player_id() then
	-- local status, err = pcall(chat, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
	-- local status, err = pcall(Console_chat, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
	-- local status, err = pcall(Chat_Command, sender, e.body)
-- --	print(tostring(status) .. tostring(err))
	 -- if not status then
	-- moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err))
	 -- end
        -- end
-- end
-- end)

local comm, playername

function Chat_Command(playerid, text)
    local chat_clear = 0
    if not ChatCommand.on then
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
                    end
                    if player.is_player_host(player.player_id()) then
                        player.send_player_sms(playerid, "Sending Host Kick Now!")
                        network.network_session_kick_player(i)
                    end
                end
            end
        end
        return HANDLER_POP
end
end

function SE_KickCrash(pid)

    for i = 1, #data do
        script.trigger_script_event(data[i], pid, {(math.random(1002039228, 9999993922)), 3, (math.random(827870001, 927870001)), (math.random(1002039228, 2022580431)), (math.random(-938762645, -908761645)), (math.random(175165, 1754244778)), (math.random(827470001, 827870001)), 1754244778, 23135423, 827870001, 23135423})
        system.yield(10)
        script.trigger_script_event(data[i], pid, {pid, (math.random(-1, 1)), 30583, 0, (math.random(-1, 1)), 0, -328966, 1132039228, (math.random(-1, 1))})
        system.yield(10)
		
    end
    system.yield(25)
end

function send_SE_Kick(pid)

    script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
    script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
end

chat_log = menu.add_feature("Log in Game Chat", "toggle", logging, function(feat)
    if not feat.on then
        Settings["chat_log"] = false
        return HANDLER_POP
end
    Settings["chat_log"] = true
    return HANDLER_POP
end)
chat_log.on = Settings["chat_log"]

--TODO: Chat Command Thread Feature

ChatCommand = menu.add_feature("Chat Command", "toggle", logging, function(feat)
    if not feat.on then
        Settings["Chat_Command"] = false
        return HANDLER_POP
end
    Settings["Chat_Command"] = true
    return HANDLER_POP
end)
ChatCommand.on = Settings["Chat_Command"]

chat_console = menu.add_feature("Ouput Game Chat to Debug Console", "toggle", logging, function(feat)
    if not feat.on then
        Settings["chat_debug"] = false
        return HANDLER_POP
end
    Settings["chat_debug"] = true
    return HANDLER_POP
end)
chat_console.on = Settings["chat_debug"]

--TODO: player Features --Griefing

function griefing()
    menu.add_player_feature("Attach Big dildo on every bone", "action", PlayerFeatParent, function(feat, pid)
        moist_notify("Overusing Dildo Spawn & Attaches", "WARNING GTA WILL CRASH!", 0xff0000ff)
        pped = player.get_player_ped(pid)
        local pos = v3()
        local hash = gameplay.get_hash_key("v_res_d_dildo_f")
        streaming.request_model(hash)
        while (not streaming.has_model_loaded(hash)) do
            system.wait(10)
        end
        for i = 1, #boneid do
            bone_idx = ped.get_ped_bone_index(pped, boneid[i])
            spawned_cunts[#spawned_cunts + 1] = object.create_world_object(hash, pos, true, false)

            entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
            entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone_idx, pos, pos, true, true, false,
                0, false)

            spawned_cunts[#spawned_cunts + 1] = object.create_object(hash, pos, true, false)

            entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
            entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone_idx, pos, pos, true, true, false,
                0, false)

        end
        moist_notify("To Reduce Crash Risk!", "Delete Spawned Cunts in Online Cleanup!")
end)

    menu.add_player_feature("Attach dildo on every bone", "action", PlayerFeatParent, function(feat, pid)
        moist_notify("Overusing Dildo Spawn & Attaches", "WARNING GTA WILL CRASH!", 0xff0000ff)
        pped = player.get_player_ped(pid)
        local pos = v3()
        for i = 1, #boneid do
            bone_idx = ped.get_ped_bone_index(pped, boneid[i])
            spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
            entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone_idx, pos, pos, true, true, false,
                0, false)
        end
        moist_notify("To Reduce Crash Risk!", "Delete Spawned Cunts in Online Cleanup!")
end)
    menu.add_player_feature("Attach dildo in Skeleton root", "action", PlayerFeatParent, function(feat, pid)
        pped = player.get_player_ped(pid)
        local pos = v3()
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, 0, pos, pos, true, true, false, 0, false)
end)


plyfeatkick1 = menu.add_player_feature("Crash ScriptEvent Kick", "action", PlayerFeatParent, function(feat, pid)
        local SE_ARGS = build_params(20)
        script.trigger_script_event(0xcbb6ce33, pid, SE_ARGS)
        script.trigger_script_event(0x12d09136, pid, SE_ARGS)
        script.trigger_script_event(0xc50f74ca, pid, SE_ARGS)
        script.trigger_script_event(0x493FC6BB, pid, SE_ARGS)

end)
for i=0,#plyfeatkick1.feats do
    plyfeatkick1.feats[i].hidden = NewDLC()	
end

plyfeatkick2 = menu.add_player_feature("Script Host Crash Kick", "action", PlayerFeatParent, function(feat, pid)
        local SE_ARGS, SE_HASH = build_params(20), {0xB82BDCA4,0x4B07E333}
		system.wait(800)
		
		
		for i = 1, # SE_HASH do
        script.trigger_script_event(SE_HASH[i], pid, SE_ARGS)
		system.yield(0)
		end

end)
for i=0,#plyfeatkick2.feats do
    plyfeatkick2.feats[i].hidden = NewDLC()
end


    -- TODO: REMOVE THESE KICKS FROM PUBLC

plyfeatBailkick = menu.add_player_feature("Network Bail Kick", "action", 0, function(feat, pid)
        player.unset_player_as_modder(pid, -1)
        script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})

end)
for i=0,#plyfeatBailkick.feats do
    plyfeatBailkick.feats[i].hidden = NewDLC()
end


plyerkick = menu.add_player_feature("Player Crash Modder Kick v1", "action", 0, function(feat, pid)
	
	local args_array1 = {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423}
	local args_array2 = {23135423, pid, 827870001, -1729222815, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423}
	local events_array = {0x39624029,0xAD63290E,0x7DE8CAC0,0x285DDF33}
	
	for i = 1, #events_array do
	
        script.trigger_script_event(events_array[i], pid, args_array1)
		system.yield(0)
		script.trigger_script_event(events_array[i], pid, args_array2)
		system.yield(0)
	end
		
		
        return HANDLER_POP
end)
for i=0,#plyerkick.feats do
    plyerkick.feats[i].hidden = NewDLC()
end

plyerCrashkick = menu.add_player_feature("Player Crash Modder Kick v2", "action", 0, function(feat, pid)
	
	
	
	
	

        script.trigger_script_event(0x39624029, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        script.trigger_script_event(0xAD63290E, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        script.trigger_script_event(0x7DE8CAC0, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        script.trigger_script_event(0x285DDF33, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        
		script.trigger_script_event(0x39624029, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        script.trigger_script_event(0xAD63290E, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        script.trigger_script_event(0x7DE8CAC0, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        script.trigger_script_event(0x285DDF33, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        
        return HANDLER_POP
end)
for i=0,#plyerCrashkick.feats do
    plyerCrashkick.feats[i].hidden = NewDLC()
end

CEOBAN = menu.add_player_feature("CEO BAN", "action", PlayerFeatParent, function(feat, pid)
        script.trigger_script_event(0xD26E4A01, pid, {0, 1, 5, 0})
end)
for i=0,#CEOBAN.feats do
    CEOBAN.feats[i].hidden = NewDLC()
end
CEODISS = menu.add_player_feature("CEO DISMISS", "action", PlayerFeatParent, function(feat, pid)
        script.trigger_script_event(0x0ED6F046, pid, {0, 1, 5})
end)
for i=0,#CEODISS.feats do
    CEODISS.feats[i].hidden = NewDLC()
end
CEOTER = menu.add_player_feature("CEO TERMINATE", "action", PlayerFeatParent, function(feat, pid)
        script.trigger_script_event(0x0ED6F046, pid, {1, 1, 6})
        script.trigger_script_event(0x0ED6F046, pid, {0, 1, 6, 0})
end)
for i=0,#CEOTER.feats do
    CEOTER.feats[i].hidden = NewDLC()
end

ScriptEvents = {1258808115,-1205085020,677240627,2112408256,-1386010354,962740265,-2113023004,704979198,-1715193475,163598572,-1970125962,-1056683619,1757755807}
KickParamArray = {{0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1015222895, 1021665346, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, -1, 996499522, 1002740646, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1016296636, 220, 255, 255, 255, 255, 255, 255, 4096, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 1065353216, 0, 0, 1056964608, 1056964608, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1065353216, 0},{23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423},{0, 30583, 0, 0, 0, -328966, 1132039228, 0}}


PlayerEventCrash =  menu.add_player_feature("Spam EventCrash", "toggle", 0, function(feat, pid)
	if feat.on then

	for y = 1, #KickParamArray do

      for i = 1,#ScriptEvents do
	  
        script.trigger_script_event(ScriptEvents[i], pid, KickParamArray[y])
		system.yield(10)
	  end
	  system.yield(10)
	  end
	  system.yield(10)
	  return HANDLER_CONTINUE
	end
	return HANDLER_POP
 end)
for i=0,#PlayerEventCrash.feats do
    PlayerEventCrash.feats[i].on = false
    PlayerEventCrash.feats[i].hidden = NewDLC()
end

PlayerEventCrash1 =  menu.add_player_feature("Spam EventCrash other players", "toggle", 0, function(feat, pid)
	if feat.on then
	for playerid = 0, 31 do
	if player.is_player_valid(playerid) and playerid ~= pid then

	for y = 1, #KickParamArray do

      for i = 1,#ScriptEvents do
	  
        script.trigger_script_event(ScriptEvents[i], playerid, KickParamArray[y])
		system.yield(0)
	  end
	  system.yield(0)
	  end
	  
	end
	  system.yield(0)
	end
	  return HANDLER_CONTINUE
	end
	return HANDLER_POP
 end)
for i=0,#PlayerEventCrash1.feats do
    PlayerEventCrash1.feats[i].on = false
    PlayerEventCrash1.feats[i].hidden = NewDLC()
end


    for i = 1, #missions do
        local y = #missions - 1
        menu.add_player_feature("Force to Mission" .. missions[i], "action", playerfeatVars.fm.id, function(feat, pid)
            script.trigger_script_event(0x786FBAAE, pid, {y})
        end)
end

function Send_Bounty(pid, value, isNpc)
    if value == nil then value = 10000 end
    if player.is_player_valid(pid) then
        for i = 0, 31 do
            -- local scid = player.get_player_scid(i)
            -- if (scid ~= -1 or scid ~= 4294967295) then
			if player.is_player_valid(i) then
                script.trigger_script_event(0x4d3010a8, i, {i, pid, 0, value, 0, isNpc, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
            end
        end
    end
end

function AddBounty(pid, value, anonymous)
        -- if not network.is_session_started() then return end
        local npc_bit = anonymous and 1 or 0
        for i = 0, 31 do
            if player.is_player_valid(i) then
              --  script.trigger_script_event(0x4d3010a8, i, {i, pid, 3, value, 1, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
			  
				--script.trigger_script_event(0x4d3010a8, i, {i, pid, 3, value, 1, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				script.trigger_script_event(0x4d3010a8, i, {i, pid, 1, value, 0, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				
            end
			system.yield(10)	
        end
end

menu.add_player_feature("Anonymous Bounty", "toggle", BountyId.id, function(feat, pid)
        if feat.on ~= AnonymousBounty then
            AnonymousBounty = feat.on
            local pf = menu.get_player_feature(feat.id)
            for i = 1, #pf.feats do
                if pf.feats[i].on ~= AnonymousBounty then
                    pf.feats[i].on = AnonymousBounty
                end
            end
        end
        return HANDLER_POP
end)

menu.add_player_feature("Custom Value", "action", BountyId.id, function(feat, pid)
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
        -- notify_above_map("I've placed a $" .. value .. " bounty on " .. (pid == player.player_id() and "your" or player.get_player_name(pid) .. "'s") ..  " head.")
end)
    for i = 1, #BountyPresets do
        menu.add_player_feature("$" .. BountyPresets[i], "action", BountyId.id, function(feat, pid)
            AddBounty(pid, BountyPresets[i], AnonymousBounty)
            -- notify_above_map("I've placed a $" .. BountyPresets[i] .. " bounty on " .. (pid == player.player_id() and "your" or player.get_player_name(pid) .. "'s") ..  " head.")
        end)
end
end
griefing()

--TODO: Features
function playervehspd(pid, speed)
    local plyveh = player.get_player_vehicle(pid)
    entity.set_entity_max_speed(plyveh, speed)
    network.request_control_of_entity(plyveh)
    vehicle.modify_vehicle_top_speed(plyveh, speed)
    entity.set_entity_max_speed(plyveh, speed)
end
function playvehspdboost(pid, reftime)
    --- lag 100000.000010
    --- fast 0.000010
    local plyveh
    plyveh = player.get_player_vehicle(pid)
    network.request_control_of_entity(plyveh)
    vehicle.set_vehicle_rocket_boost_refill_time(plyveh, reftime)
end

--Options Toggles etc
global_func.lag_out = menu.add_feature("Lag Self out of session", "toggle", globalFeatures.moistopt, function(feat)
    Settings["lag_out"] = true
    if feat.on then
        local key = MenuKey()
        key:push_str("LCONTROL")
        key:push_str("LSHIFT")
        key:push_str("l")
        if key:is_down() then
            local time = utils.time_ms() + 8500
            while time > utils.time_ms() do
            end
            system.wait(1200)
        end
        -- system.yield(10)
        return HANDLER_CONTINUE
end
    Settings["lag_out"] = false
    return HANDLER_POP
end)
global_func.lag_out.on = Settings["lag_out"]

--TODO: World Features
global_func.no_traffic = menu.add_feature("No World Traffic", "toggle", globalFeatures.moistopt, function(feat)
    Settings["no_traffic"] = true
    if feat.on then
        vehicle.set_vehicle_density_multipliers_this_frame(0)
        return HANDLER_CONTINUE
end
    Settings["no_traffic"] = false
    return HANDLER_POP
end)
global_func.no_traffic.on = Settings["no_traffic"]

global_func.no_peds = menu.add_feature("No World Peds", "toggle", globalFeatures.moistopt, function(feat)
    Settings["no_peds"] = true
    if feat.on then
        ped.set_ped_density_multiplier_this_frame(0)
        return HANDLER_CONTINUE
end
    Settings["no_peds"] = false
    return HANDLER_POP
end)
global_func.no_peds.on = Settings["no_peds"]

--TODO: Self Features

-- Self modifiers --Max Health 0:0 1: 2: 3: 4: 5: 6:
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

    menu.add_feature("set: " .. HP_modifiers[i][1], "action", globalFeatures.self_ped_modify, function(feat)
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
PedModifyList = menu.add_feature("Modals:", "autoaction_value_str", globalFeatures.self_ped_modalify, function(feat)

    model_set = Modals[feat.value + 1]
    PedModify:set_str_data(Modals[feat.value + 1])

end)
PedModifyList:set_str_data({"a_c_ a_f_ a_m_", "csb_ cs_", "g_f_ g_m_", "hc_", "ig_", "mp_", "player_", "s_f_ s_m_","u_f_u_m"})

PedModify = menu.add_feature("set: ", "action_value_str", globalFeatures.self_ped_modalify, function(feat)
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


--TODO: Combat Features
local Veh_Wep = {"vehicle_weapon_player_bullet","vehicle_weapon_player_lazer","weapon_airstrike_rocket","vehicle_weapon_space_rocket","vehicle_weapon_plane_rocket","vehicle_weapon_trailer_missile","vehicle_weapon_tampa_mortar","vehicle_weapon_akula_missile","vehicle_weapon_akula_barrage","vehicle_weapon_avenger_cannon",}
Veh_WepL = {}
function VehWeapLabel()
for i = 1, #Veh_Wep do
 local text = Veh_Wep[i]
 local separator = text:find("_", 1, true)
 if separator then
		local label = text:sub(1, separator - 1)
		local value = text:sub(separator + 1)

 Veh_WepL[#Veh_WepL+1] = value
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
	
	bullet_speed = 0
	vehwep_speed.value = 1000
	
end)

vehwep_speed = menu.add_feature("Speed of fire", "autoaction_value_i", selfveh.id, function(feat)
	
	bullet_speed = tonumber(feat.value)
	
end)
vehwep_speed.max = 100000
vehwep_speed.min = 100
vehwep_speed.mod = 10
vehwep_speed.value = 1000


vehposx = menu.add_feature("2.vehpos x", "autoaction_value_i", selfveh.id, function(feat)
	
	local x = tonumber(feat.value)
	vehposxx =	x / 5
end)
vehposx.max = 100000
vehposx.min =  -100000
vehposx.mod = 1
vehposx.value = 0


vehposy = menu.add_feature("2.vehpos y", "autoaction_value_i", selfveh.id, function(feat)
	
	local y = tonumber(feat.value)
	vehposyy =	y / 5
	
end)
vehposy.max = 100000
vehposy.min =  -100000
vehposy.mod = 1
vehposy.value = 0

vehposx = menu.add_feature("3.vehpos x", "autoaction_value_i", selfveh.id, function(feat)
	
	local x = tonumber(feat.value)
	vehposxxx =	x / 5
end)
vehposx.max = 100000
vehposx.min =  -100000
vehposx.mod = 1
vehposx.value = 0


vehposy = menu.add_feature("3.vehpos y", "autoaction_value_i", selfveh.id, function(feat)
	
	local y = tonumber(feat.value)
	vehposyyy =	y / 5
	
end)
vehposy.max = 100000
vehposy.min =  -100000
vehposy.mod = 1
vehposy.value = 0



jett_weapon = menu.add_feature("1.Add WeaponFire[CAM_POS]: ", "value_str", selfveh.id, function(feat)
	
	local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])	
	local pid = player.player_id()
	
	local pped = player.get_player_ped(pid)
	
	local veh = ped.get_vehicle_ped_is_using(pped)
	if feat.on then
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
jett_weapon.on = false 
jett_weapon:set_str_data(Veh_WepL)



jet_weaponn = menu.add_feature("2.Add Weapon Fire: ", "value_str", selfveh.id, function(feat)
	
	local pid = player.player_id()
	local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])
	
	local pped = player.get_player_ped(pid)
	
	local veh = ped.get_vehicle_ped_is_using(pped)
	if feat.on then
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
jet_weaponn.on = false
jet_weaponn:set_str_data(Veh_WepL)


jet_weapon = menu.add_feature("3.Add extra Weapon Fire: ", "value_str", selfveh.id, function(feat)
	
	local pid = player.player_id()
	
	local pped = player.get_player_ped(pid)
	local hash = gameplay.get_hash_key(Veh_Wep[feat.value + 1])	
	local veh = ped.get_vehicle_ped_is_using(pped)
	if feat.on then
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
jet_weapon.on = false
jet_weapon:set_str_data(Veh_WepL)


local BlameMe, StrikeSpeed = 0, 1000.00
Blame_Me = menu.add_feature("Blame Strike on Me!", "toggle", globalFeatures.self_ped_combat_POI, function(feat)
    if feat.on then
        BlameMe = player.get_player_ped(player.player_id())
end
    if not feat.on then
        BlameMe = 0
        return HANDLER_POP
end
end)
Blame_Me.on = false

Strike_Modif_step = menu.add_feature("Step Modifier: ", "autoaction_value_f", globalFeatures.self_ped_combat_POI, function(feat)
        Strike_projSpeed.mod = feat.value
        dam_multi.mod = feat.value
end)
Strike_Modif_step.max = 100000.000
Strike_Modif_step.min = 0.10
Strike_Modif_step.value = 1.0
Strike_Modif_step.mod = 10.0

Strike_projSpeed = menu.add_feature("Projectiles Speed: ", "autoaction_value_f",
    globalFeatures.self_ped_combat_POI, function(feat)
        StrikeSpeed = feat.value
end)
Strike_projSpeed.max = 100000.000
Strike_projSpeed.min = 100.00
Strike_projSpeed.value = 1000.250
Strike_projSpeed.mod = 0.25
Waypoint_Air_Strike1 = menu.add_feature("Entitybase for Hills", "action_value_str", globalFeatures.self_ped_combat_POI, function(feat)
        -- OSD_Debug_text(string.format("Current Weapon Strike: " .. StrikeGive[feat.value]))
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
Waypoint_Air_Strike2 = menu.add_feature("Lower to Ground", "action_value_str", globalFeatures.self_ped_combat_POI, function(feat)
        local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(), v3(), v2(), 0
        pos = ui.get_waypoint_coord()
        if pos.x and pos.y then
            coord.x = pos.x
            coord.y = pos.y
            coord.z = 1000.0
            b, coord.z = gameplay.get_ground_z(coord)
            local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
            -- OSD_Debug_text(string.format("Current Weapon Strike: " .. StrikeGive[feat.value + 1]))
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
Waypoint_Air_Strike3 = menu.add_feature("inverted", "action_value_str", globalFeatures.self_ped_combat_POI, function(feat)
        local coord, Coord, offset, Pos, pos, num = v3(), v3(), v3(), v3(), v2(), 0
        pos = ui.get_waypoint_coord()
        if pos.x and pos.y then
            coord.x = pos.x
            coord.y = pos.y
            coord.z = -100.0
            b, z = gameplay.get_ground_z(v3(pos.x, pos.y, 100.00))
            -- print(z)
            local hash = gameplay.get_hash_key(StrikeGive[feat.value + 1])
            OSD_Debug_text(string.format("Current Weapon Strike: " .. StrikeGive[feat.value + 1]))
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
Grenade_Strike = menu.add_feature("grenadelauncher Waypoint", "action", globalFeatures.self_combat_Ped, function(feat)
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
dam_multi = menu.add_feature("unfair aim Damage", "autoaction_value_i", globalFeatures.self_combat_Ped, function(feat)
    damage = feat.value
    -- print(damage)
end)
dam_multi.max = 10000
dam_multi.min = 0
dam_multi.value = 200
dam_multi.mod = 1

local notify_sent = false
local aimhash, aimd, pped
unfair_aimbot = menu.add_feature("unfair aim Ped Head shot", "value_str", globalFeatures.self_combat_Ped, function(feat)
    -- OSD_Debug_text(ssb_wep[feat.value], 0)
    if feat.on then
        local offset, offset2 = v3(0.0, 0.0, 0.0), v3(0.0, 0.0, 2.8)
        pped = player.get_player_ped(player.player_id())
        if ped.is_ped_shooting(pped) then
            aimhash = gameplay.get_hash_key(ssb_wep[feat.value + 1])
            aimd = player.get_entity_player_is_aiming_at(player.player_id())
            if entity.is_entity_a_ped(aimd) then
                -- ped.get_ped_bone_index(aimd, 31086)
                local bonebool, pos = ped.get_ped_bone_coords(pped, 6286, offset)
                local bonebool2, pos2 = ped.get_ped_bone_coords(aimd, 12844, offset)
                -- print(pos)
                -- print(pos2)
                gameplay.shoot_single_bullet_between_coords(pos + offset2, pos2, damage, aimhash, pped, true, false,
                    10000.00)
            end
        end
        --	system.yield(0)
        return HANDLER_CONTINUE
end
    return HANDLER_POP
end)
unfair_aimbot:set_str_data(ssb_wep_label)

pos, ImpactPos, BonePos = v3(), v3(), v3()

weapon_impact_pos = menu.add_feature("Get last Weapon impact POS", "toggle", globalFeatures.self_combat_Ped, function(feat)
        while feat.on do
            local pped = player.get_player_ped(player.player_id())
            local success, pos = ped.get_ped_last_weapon_impact(pped, v3())
            if success then
                ImpactPos = pos
                print(string.format("Impact POS: " .. "%s, %s, %s", pos.x, pos.y, pos.z))
                print(ImpactPos.x .. "," .. ImpactPos.y .. "," .. ImpactPos.z)
            else
                system.yield(0)
            end
            system.yield(0)
        end
end)
weapon_impact_pos.on = false
impact_strike = menu.add_feature("Weapon Strike v1", "value_str", globalFeatures.self_combat_Ped, function(feat)
    -- OSD_Debug_text(string.format("Weapon Strike: " .. ssb_wep[feat.value]))
    if feat.on then
        weapon_impact_pos.on = true
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
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 1000.00, hash, BlameMe, true, false,
                StrikeSpeed)
            system.yield(10)
            ImpactPos.x = ImpactPos.x + 5
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false,
                StrikeSpeed)
            system.yield(10)
            ImpactPos.y = ImpactPos.y - 5
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false,
                StrikeSpeed)
            system.yield(10)
            ImpactPos.x = ImpactPos.x - 10
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false,
                StrikeSpeed)
            system.yield(10)
            ImpactPos.y = ImpactPos.y + 10
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, BlameMe, true, false,
                StrikeSpeed)
        end
        return HANDLER_CONTINUE
end
    weapon_impact_pos.on = false
    return HANDLER_POP
end)
impact_strike:set_str_data(ssb_wep_label)
impact_strike.on = false

impact_strike = menu.add_feature("Weapon Strike v2", "value_str", globalFeatures.self_combat_Ped, function(feat)
    -- OSD_Debug_text(string.format("Weapon Strike: " .. StrikeGive[feat.value]))
    weapon_impact_pos.on = true
    if feat.on then
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
    weapon_impact_pos.on = false
    return HANDLER_POP
end)
impact_strike:set_str_data(StrikeGive_label)
impact_strike2 = menu.add_feature("Second Weapon Fire v1:", "value_str", globalFeatures.self_combat_Ped, function(feat)
    -- OSD_Debug_text(string.format("Weapon Strike: " .. ssb_wep[feat.value]))

    if feat.on then
        weapon_impact_pos.on = true
        local hash = gameplay.get_hash_key(ssb_wep[feat.value + 1])
        pped = player.get_player_ped(player.player_id())
        if ped.is_ped_shooting(pped) then
            print("ped shooting")
            --	system.wait(100)
            offset = v3()
            -- offset = v3(0.0,0.0,0.0)

            local bonebool, pos = ped.get_ped_bone_coords(pped, 58866, offset)
            print(string.format("Ped Bone pos: " .. "%s, %s, %s", pos.x, pos.y, pos.z))
            gameplay.shoot_single_bullet_between_coords(pos + BonePos, ImpactPos, 10000.00, hash, player.get_player_ped(player.player_id()), true, false, 100000.0)
        end
        return HANDLER_CONTINUE
end
    weapon_impact_pos.on = false
    return HANDLER_POP
end)
impact_strike2:set_str_data(ssb_wep_label)
impact_strike2.on = false

impact_strike3 = menu.add_feature("Second Weapon Fire v2:", "value_str", globalFeatures.self_combat_Ped, function(feat)
    -- OSD_Debug_text(string.format("Weapon Strike: " .. StrikeGive[feat.value]))

    weapon_impact_pos.on = true
    if feat.on then
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
    weapon_impact_pos.on = false

    return HANDLER_POP
end)
impact_strike3:set_str_data(StrikeGive_label)
aim_strike = menu.add_feature("Air strike aim entity (D pad R)", "toggle", globalFeatures.self_combat_Ped,
    function(feat)
        if feat.on then
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
aim_strike.on = false

--TODO: Ragdoll Control
function MoistsRagdollControl()
    Ragdoll_Sel = 0
    ragdolltyp = {{"Normal ragdoll", 0}, {"Falls with stiff legs/body", 1}, {"Narrow leg stumble(may not fall)", 2}, {"Wide leg stumble(may not fall)", 3}}
    Ragdoll_Control = menu.add_feature("Moists RagDoll Control", "parent", globalFeatures.self_ped).id
    Ragdoll_set = menu.add_feature("Set Ragdoll Type", "action_value_i", Ragdoll_Control, function(feat)
        Ragdoll_Sel = ragdolltyp[feat.value][2]
        moist_notify("Ragdoll Type Set to: " .. ragdolltyp[feat.value][2] .. "\n(" .. ragdolltyp[feat.value][1] .. ")", "Moists Ragdoll Control")
end)
    Ragdoll_set.max = #ragdolltyp
    Ragdoll_set.min = 1
    Ragdoll_set.value = 1
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
    ragdoll_key = menu.add_feature("Ragdoll HotKey LCTRL+X ", "toggle", Ragdoll_Control, function(feat)
        Settings["RagDollHotKey"] = true
        if feat.on then
            local key = MenuKey()
            key:push_str("LCONTROL")
            key:push_str("x")
            if key:is_down() then
                rag_self.on = not rag_self.on
			moist_notify("Ragdoll Set for your Ped = " .. tostring(rag_self.on), "Moists Ragdoll Control\nMoist Script 2.0.5.7")
                system.wait(1200)
            end
            return HANDLER_CONTINUE
        end
        Settings["RagDollHotKey"] = false
        return HANDLER_POP
end)
    ragdoll_key.on = Settings["RagDollHotKey"]
    set_rag_self = menu.add_feature("Set Self to Ragdoll", "action", Ragdoll_Control, RagdollButton)
    tw2rag_self = menu.add_feature("Set Ragdoll", "toggle", Ragdoll_Control, Ragdolltoggle1)
    force_rag_self = menu.add_feature("Set Ragdoll Apply force", "action", Ragdoll_Control, Ragdoll0_3)
    twrag_self = menu.add_feature("Twitching Ragdoll", "toggle", Ragdoll_Control, RagdollButtontoggle)
    tw1rag_self = menu.add_feature("Twitching Ragdoll v1", "toggle", Ragdoll_Control, Ragdolltoggle)
    rag_self = menu.add_feature("Lifeless Ragdoll(Hotkey Preset)", "toggle", Ragdoll_Control, function(feat)
        if feat.on then
            local Number1, Number2, Number3, Number4 = 1900, 2000, 2000, 3000
            pped = player.get_player_ped(player.player_id());
            ped.set_ped_to_ragdoll(pped, Number1, Number2, 0)
            entity.apply_force_to_entity(pped, 4, 2, 0, 0.8, 3, 2.1, 10.3, false, true)
            ped.set_ped_to_ragdoll(pped, Number3, Number4, 4)
        end
        return HANDLER_CONTINUE
end)
    rag_self.on = false
end
MoistsRagdollControl()

-- TODO: player ped options
function self_func()

function updatedecals()
	
	drawable_feature.value = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), 10)
	texture_feature.value = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), 10)
	drawable_feature.max = ped.get_number_of_ped_drawable_variations(player.get_player_ped(player.player_id()), 10)
	texture_feature.max = ped.get_number_of_ped_texture_variations(player.get_player_ped(player.player_id()), 10, drawable_feature.value)
end

outfitshit =  menu.add_feature("Outfit Related Shit", "parent", globalFeatures.self, function(feat)
	updatedecals()
	
end).id

Decals = menu.add_feature("Outfit Decal Overlays", "parent", outfitshit, function(feat)
	updatedecals()
end).id
	
drawable_feature = menu.add_feature("Decal Drawable ID", "autoaction_value_i", Decals,  function(feat)
	local pped = player.get_player_ped(player.player_id())
	local peddrawable
	local pedtexture

	peddrawable = ped.get_ped_drawable_variation(pped, 10)

	pedtexture = ped.get_ped_texture_variation(pped, 10)
			
	ped.set_ped_component_variation(pped, 10, drawable_feature.value, pedtexture, 0)
	texture_feature.max = ped.get_number_of_ped_texture_variations(player.get_player_ped(player.player_id()), 10, drawable_feature.value)

	return HANDLER_POP

end)
drawable_feature.max = 1
drawable_feature.min = 0
drawable_feature.value = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), 10)

texture_feature = menu.add_feature("Decal Texture ID", "autoaction_value_i", Decals, function(feat) 
	local pped = player.get_player_ped(player.player_id())
	local peddrawable
	local pedtexture

	peddrawable = ped.get_ped_drawable_variation(pped, 10)

	ped.set_ped_component_variation(pped, 10, peddrawable, texture_feature.value, 0)

	return HANDLER_POP
end)
texture_feature.max = 1
texture_feature.min = 0
texture_feature.value = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), 10)

	
    menu.add_feature("give self glowstick", "action", globalFeatures.self_ped, function(feat)
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
    global_func.self = menu.add_feature("Put Handcuffs on Self", "action", outfitshit, function(feat)
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
    global_func.self = menu.add_feature("Set Handcuffs Locked Position", "action", outfitshit, function(feat)
		pped = player.get_player_ped(player.player_id())
	
		if player.is_player_female(player.player_id()) then
            ped.set_ped_component_variation(pped, 7, 25, 0, 0)
            weapon.give_delayed_weapon_to_ped(pped, 0xD04C944D, 0, 1)
			elseif not player.is_player_female(player.player_id()) then
            ped.set_ped_component_variation(pped, 7, 41, 0, 0)
            weapon.give_delayed_weapon_to_ped(pped, 0xD04C944D, 0, 1)
		end
			
        end)
		
    global_func.self = menu.add_feature("White Team parachute Pack", "action", outfitshit, function(feat)
        pped = player.get_player_ped(player.player_id())
        ped.get_ped_drawable_variation(pped, 5)
        ped.set_ped_component_variation(pped, 5, 58, 8, 0)
end)



-- TODO: Self Options
    local ewo_key = menu.add_feature("Self Suicide EWO", "toggle", globalFeatures.self_options, function(feat)
        Settings["EWO_TRYHARD"] = true
        if feat.on then
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
    ewo_key.on = Settings["EWO_TRYHARD"]

    global_func.force_wPara = menu.add_feature("Force White parachute On", "toggle", outfitshit, function(feat)
            Settings["force_wPara"] = true
            if feat.on then
                local pped = player.get_player_ped(player.player_id())
                ped.get_ped_drawable_variation(pped, 5)
                ped.set_ped_component_variation(pped, 5, 58, 8, 0)
                return HANDLER_CONTINUE
            end
            Settings["force_wPara"] = false
            return HANDLER_POP
        end)
    global_func.force_wPara.on = Settings["force_wPara"]
    global_func.force_pPara = menu.add_feature("Force pink parachute On", "toggle", outfitshit, function(feat)
            Settings["force_pPara"] = true
            if feat.on then
                local pped = player.get_player_ped(player.player_id())
                ped.get_ped_drawable_variation(pped, 5)
                ped.set_ped_component_variation(pped, 5, 58, 3, 0)
                return HANDLER_CONTINUE
            end
            Settings["force_pPara"] = false
            return HANDLER_POP
        end)
    global_func.force_pPara.on = Settings["force_pPara"]
    global_func.force_wBPH = menu.add_feature("Force White BPH On", "toggle", outfitshit, function(feat)
            Settings["force_wBPH"] = true
            if feat.on then
                local pped = player.get_player_ped(player.player_id())
                ped.get_ped_prop_index(pped, 0)
                ped.set_ped_prop_index(pped, 0, 59, 8, 0)
                return HANDLER_CONTINUE
            end
            Settings["force_wBPH"] = false
            return HANDLER_POP
        end)
    global_func.force_wBPH.on = Settings["force_wBPH"]
    global_func.force_pBPH = menu.add_feature("Force Pink BPH On", "toggle", outfitshit, function(feat)
        Settings["force_pBPH"] = true
        if feat.on then
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
global_func.force_pBPH.on = Settings["force_pBPH"]
    -- TODO: Self Options
	
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
	print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
	offsetPos = Offset_Coords_POS(pos, player.get_player_heading(player.player_id()), 10)
	print(string.format("%s, %s, %s", offsetPos.x, offsetPos.y, offsetPos.z))
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

local peds_2spawn = {"a_f_y_topless_01","ig_lestercrest_2","ig_trafficwarden","mp_f_deadhooker","s_m_m_pilot_01","s_m_m_pilot_02","s_m_y_pilot_01","s_m_y_robber_01","u_m_m_jewelthief","u_m_y_fibmugger_01","a_f_y_juggalo_01","mp_g_m_pros_01",}
local veh_2spawn = {"boxville5","limo2","insurgent","scramjet","Oppressor","monster5","phantom2","mower","tampa3","ruiner2","ruiner3","caddy","caddy2","caddy3","bus","apc","buzzard"}

local parent = menu.add_feature("Moists Escort Service", "parent", globalFeatures.self, function(feat)
	-- players_pos()
end)

local escortserv = menu.add_feature("Select Your Escort", "parent", parent.id, cb)
local escortwith = menu.add_feature("Select Escort Vehicle", "parent", parent.id, cb)
local sel_mode = menu.add_feature("Style/Position", "parent", parent.id, cb)

driver = menu.add_feature("Escort as Driver", "parent", parent.id)
	
player_pos = menu.add_feature("Drive to: ", "action_value_str", driver.id, function(feat)
	pid = feat.value - 1
	goto_player(pid)
	system.wait(10)
	setdrive_2pos()
end)
player_pos:set_str_data(Playerz)

local drive2 = menu.add_feature("Location Presets", "parent", driver.id)
local pedwep = menu.add_feature("Select Escorts Weapon", "parent", parent.id)


local set_drstyle = menu.add_feature("set driving style", "action_value_i", driver.id, function(feat)
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
set_drstyle.max = #driving_style
set_drstyle.min = 1
set_drstyle.value = 36

local boobped = menu.add_feature("Create Escort Ped", "action", parent.id, function(feat)
	escort_ped()
end)

local vehiclepedescort = menu.add_feature("Create Veh set Escort(s) inside", "action", parent.id, function(feat)
	veh_escort()
end)

local vehiclepedescort = menu.add_feature("task escort to follow", "action", parent.id, function(feat)
	local plyveh = player.get_player_vehicle(player.player_id())
	local i = #boobveh
	local y = #boobs
	task[#task+1] = ai.task_vehicle_follow(boobs[y],boobveh[i], plyveh, 250.00, 262275, 150)
end)


local ply_seat = menu.add_feature("Set your seat (default front)", "action_value_i", driver.id, function(feat)
	if player.is_player_in_any_vehicle(player.player_id()) then
		local pped = player.get_player_ped(player.player_id())
		local i = #boobveh
		ped.set_ped_into_vehicle(pped, boobveh[i], feat.value)
		player_seat = feat.value
	end
end)
ply_seat.max = 14
ply_seat.min = -1
ply_seat.value = 0

local setwanderdrive = menu.add_feature("Task Escort Drive around(Wander randomly)", "action", driver.id, function(feat)
	set_wander()
end)


local setdrivepos = menu.add_feature("Set/Update Task Drive to POS", "action", driver.id, function(feat)
	set_drive_2pos()
end)

local drive2waypoint = menu.add_feature("Set/Update Task Drive to waypoint", "action", driver.id, function(feat)
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


local setescortloop = menu.add_feature("Loop Ped Grouping", "toggle", parent.id, function(feat)
	if feat.on then
		ped_escort_loop()
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
setescortloop.on = false


local del_spawns = menu.add_feature("Delete Escorts & Vehicles", "action", parent.id, function(feat)
	delete_escorts()
	system.wait(10)
	delete_vehicles()
end)

for i = 1, #escort_mode do
	menu.add_feature("Position: " .. escort_mode[i][1], "action", sel_mode.id, function(feat)
			mode = escort_mode[i][2]
	end)
end

for i = 1, #presets do
	menu.add_feature("Preset: " .. presets[i][1], "action", drive2.id, function(feat)
		goto_pos.x = presets[i][2]
		goto_pos.y = presets[i][3]
		goto_pos.z = presets[i][4]
		print(presets[i][2])
		print(presets[i][3])
		print(presets[i][4])
		
	end)
end

for i = 1, #pedweapon do
	menu.add_feature("Weapon: " .. pedweapon[i][1], "action", pedwep.id, function(feat)
		selected_weapon = gameplay.get_hash_key(pedweapon[i][1])	
	end)
end


for i = 1, #peds_2spawn do
	menu.add_feature("Ped: " .. peds_2spawn[i], "action", escortserv.id, function(feat)
		sel_ped = gameplay.get_hash_key(peds_2spawn[i])	
	end)
end

for i = 1, #veh_2spawn do
	menu.add_feature("Veh: " .. veh_2spawn[i], "action", escortwith.id, function(feat)
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
	
	--if feat.on then
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
	print(boobs[i])		
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
	print(boobveh[y])
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

function set_wander()
	local i = #boobveh
	
	local y = #boobs
    ped.set_ped_into_vehicle(boobs[y], boobveh[i], -1)
	local pped = player.get_player_ped(player.player_id())
    ped.set_ped_into_vehicle(pped, boobveh[i], player_seat)	
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


    -- TODO: Triplet Vehicle Options
 function TripletSpawns()
        local spawn_cunt = {}
        local triplethash

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

            ped.set_ped_as_group_member(spawn_cunt[y], myplygrp)
            ped.set_ped_never_leaves_group(spawn_cunt[y], true)
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

            ped.set_ped_as_group_member(spawn_cunt[y], myplygrp)
            ped.set_ped_never_leaves_group(spawn_cunt[y], true)
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

        local triplet_fun = menu.add_feature("Spawn Triplet Vehicles", "parent", globalFeatures.self, function(feat)
            tripletspawnmodel.hidden = true
            tripletspawntype.hidden = true
        end)

        tripletfun = menu.add_feature("Show Vehicles Starting: ", "action_value_str", triplet_fun.id, function(feat)
            if feat.value == 0 then

                Vehicles = {"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1", "ambulance",
                            "annihilator", "annihilator2", "apc", "ardent", "armytanker", "armytrailer", "armytrailer2",
                            "asbo", "asea", "asea2", "asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"}
                tripletspawnmodel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha",
                                                "alphaz1", "ambulance", "annihilator", "annihilator2", "apc", "ardent",
                                                "armytanker", "armytrailer", "armytrailer2", "asbo", "asea", "asea2",
                                                "asterope", "autarch", "avarus", "avenger", "avenger2", "avisa"})

                tripletspawnmodel.hidden = false
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
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 4 then

                Vehicles = {"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3", "enduro",
                            "entity2", "entityxf", "esskey", "everon", "exemplar"}
                tripletspawnmodel:set_str_data({"elegy", "elegy2", "ellie", "emerus", "emperor", "emperor2", "emperor3",
                                                "enduro", "entity2", "entityxf", "esskey", "everon", "exemplar"})
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 6 then

                Vehicles = {"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "gb200",
                            "gburrito", "gburrito2", "glendale", "glendale2", "gp1", "graintrailer", "granger",
                            "gresley", "gt500", "guardian"}
                tripletspawnmodel:set_str_data({"gargoyle", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4",
                                                "gauntlet5", "gb200", "gburrito", "gburrito2", "glendale", "glendale2",
                                                "gp1", "graintrailer", "granger", "gresley", "gt500", "guardian"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 7 then

                Vehicles = {"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler", "hauler2", "havok",
                            "hellion", "hermes", "hexer", "hotknife", "hotring", "howard", "hunter", "huntley",
                            "hustler", "hydra"}
                tripletspawnmodel:set_str_data({"habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "hauler",
                                                "hauler2", "havok", "hellion", "hermes", "hexer", "hotknife", "hotring",
                                                "howard", "hunter", "huntley", "hustler", "hydra"})
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 9 then

                Vehicles = {"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet", "jetmax", "journey",
                            "jugular"}
                tripletspawnmodel:set_str_data({"jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jet",
                                                "jetmax", "journey", "jugular"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 10 then

                Vehicles = {"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda", "kosatka", "krieger",
                            "kuruma", "kuruma2"}
                tripletspawnmodel:set_str_data({"kalahari", "kamacho", "kanjo", "khamelion", "khanjali", "komoda",
                                                "kosatka", "krieger", "kuruma", "kuruma2"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 11 then

                Vehicles = {"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard", "limo2", "locust",
                            "longfin", "lurcher", "luxor", "luxor2", "lynx"}
                tripletspawnmodel:set_str_data({"landstalker", "landstalker2", "lazer", "le7b", "lectro", "lguard",
                                                "limo2", "locust", "longfin", "lurcher", "luxor", "luxor2", "lynx"})
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 13 then

                Vehicles = {"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade", "nightshade",
                            "nightshark", "nimbus", "ninef", "ninef2", "nokota", "novak"}
                tripletspawnmodel:set_str_data({"nebula", "nemesis", "neo", "neon", "nero", "nero2", "nightblade",
                                                "nightshade", "nightshark", "nimbus", "ninef", "ninef2", "nokota",
                                                "novak"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 14 then

                Vehicles = {"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2", "oracle", "oracle2",
                            "osiris", "outlaw"}
                tripletspawnmodel:set_str_data({"omnis", "openwheel1", "openwheel2", "oppressor", "oppressor2",
                                                "oracle", "oracle2", "osiris", "outlaw"})
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 19 then

                Vehicles = {"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck", "utillitruck2",
                            "utillitruck3"}
                tripletspawnmodel:set_str_data({"utilitytruck", "utilitytruck2", "utilitytruck3", "utillitruck",
                                                "utillitruck2", "utillitruck3"})
                tripletspawnmodel.hidden = false

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
                tripletspawnmodel.hidden = false

            elseif feat.value == 21 then

                Vehicles = {"warrener", "washington", "wastelander", "weevil", "windsor", "windsor2", "winky",
                            "wolfsbane"}
                tripletspawnmodel:set_str_data({"warrener", "washington", "wastelander", "weevil", "windsor",
                                                "windsor2", "winky", "wolfsbane"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 22 then

                Vehicles = {"xa21", "xls", "xls2"}
                tripletspawnmodel:set_str_data({"xa21", "xls", "xls2"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 23 then

                Vehicles = {"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"}
                tripletspawnmodel:set_str_data({"yosemite", "yosemite2", "yosemite3", "youga", "youga2", "youga3"})
                tripletspawnmodel.hidden = false

            elseif feat.value == 24 then

                Vehicles = {"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea", "zombieb", "zorrusso",
                            "zr380", "zr3802", "zr3803", "ztype"}
                tripletspawnmodel:set_str_data({"z190", "zentorno", "zhaba", "zion", "zion2", "zion3", "zombiea",
                                                "zombieb", "zorrusso", "zr380", "zr3802", "zr3803", "ztype"})
                tripletspawnmodel.hidden = false
            end

        end)
        tripletfun:set_str_data({"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R",
                                 "S", "T", "U", "V", "W", "X", "Y", "Z"})

        tripletspawnmodel = menu.add_feature("Spawn : ", "action_value_str", triplet_fun.id, function(feat)
            VehModSpawn = Vehicles[feat.value + 1]
            tripletspawntype.hidden = false

        end)
        tripletspawnmodel.hidden = true
        tripletspawnmodel:set_str_data({"adder", "airbus", "airtug", "akula", "akuma", "alkonost", "alpha", "alphaz1",
                                        "ambulance", "annihilator", "annihilator2", "apc", "ardent", "armytanker",
                                        "armytrailer", "armytrailer2", "asbo", "asea", "asea2", "asterope", "autarch",
                                        "avarus", "avenger", "avenger2", "avisa"})

        tripletspawntype = menu.add_feature("Spawn : ", "action_value_str", triplet_fun.id, function(feat)
            local hash = gameplay.get_hash_key(VehModSpawn)
            if feat.value == 0 then
                TripletVeh(hash)
            elseif feat.value == 1 then
                TripletVeh_WithPed(hash)
            end

        end)
        tripletspawntype.hidden = true
        tripletspawntype:set_str_data({"Vehicles Only", "Vehicles + Bodyguard"})

end

    -- TODO: Countermeasure Hotkey

    local Counter_key = menu.add_feature("Flare Countermeasures", "value_i", globalFeatures.moist_hotkeys,
        function(feat)
            Settings["counter_Hotkey"] = true
            if feat.on then
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
    Counter_key.on = Settings["counter_Hotkey"]
    Counter_key.max = 10000
    Counter_key.min = 1
    Counter_key.value = 1550
    Counter_key.mod = 75

    -- TODO: ******************  My Vehicle Control & Overide!! **********************

Vehicle_Control = menu.add_feature("Vehicle Experiments", "parent", globalFeatures.moist_test.id).id

local speedup_done = false

SpeedupMyVeh =  menu.add_feature("Speed Up My Vehicle", "toggle", Vehicle_Control, function(feat)
local pid, PlyVeh = player.player_id(), player.get_player_vehicle(player.player_id())
if feat.on then
if not speedup_done then
vehicle.set_vehicle_undriveable(PlyVeh, true)
playervehspd(pid, 30000.000)
vehicle.set_vehicle_undriveable(PlyVeh, false)
speedup_done = true
end
if not player.is_player_in_any_vehicle(player.player_id()) then
SpeedupMyVeh.on = false
elseif player.is_player_in_any_vehicle(player.player_id()) then
vehicle.set_vehicle_engine_torque_multiplier_this_frame(PlyVeh, 650.00)
end
return HANDLER_CONTINUE
end
if not feat.on then
speedup_done = false
end
return HANDLER_POP
end)
SpeedupMyVeh.on = false


	
	
	
	
	
    Veh_setgear = menu.add_feature("Set Current Gear: ", "value_i", Vehicle_Control, function(feat)
        if feat.on then
            local PlyVeh = player.get_player_vehicle(player.player_id())
            if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
                -- vehicle.set_vehicle_next_gear(PlyVeh, feat.value)
                vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
            end
            return HANDLER_CONTINUE
        end
end)
    Veh_setgear.max = 8
    Veh_setgear.min = 0
    Veh_setgear.value = 0
    Veh_setgear.on = false

    Veh_set_nextgear = menu.add_feature("Set Next Gear: ", "value_i", Vehicle_Control, function(feat)
        if feat.on then
            local PlyVeh = player.get_player_vehicle(player.player_id())
            if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
                vehicle.set_vehicle_next_gear(PlyVeh, feat.value)
                -- vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
            end
            return HANDLER_CONTINUE
        end
end)
    Veh_set_nextgear.max = 8
    Veh_set_nextgear.min = 0
    Veh_set_nextgear.value = 0
    Veh_set_nextgear.on = false

    Veh_set_maxgear = menu.add_feature("Set Max Gear: ", "value_i", Vehicle_Control, function(feat)
        if feat.on then
            local PlyVeh = player.get_player_vehicle(player.player_id())
            if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
                vehicle.set_vehicle_max_gear(PlyVeh, feat.value)
                -- vehicle.set_vehicle_current_gear(PlyVeh, feat.value)
            end
            return HANDLER_CONTINUE
        end
end)
    Veh_set_maxgear.max = 8
    Veh_set_maxgear.min = 0
    Veh_set_maxgear.value = 0
    Veh_set_maxgear.on = false

    Veh_OVRCTRL_Modifier = menu.add_feature("Function Modifier Value: ", "action_value_f", Vehicle_Control,
        function(feat)
            local modifier = feat.value
            Veh_set_gear_ratio.mod = modifier
            Veh_set_torq_ratio.mod = modifier

        end)
    Veh_OVRCTRL_Modifier.max = 800.00
    Veh_OVRCTRL_Modifier.min = -1.0
    Veh_OVRCTRL_Modifier.value = 1.00
    Veh_OVRCTRL_Modifier.mod = 2.00

    Veh_set_gear_ratio = menu.add_feature("Set Current Gear Ratio: ", "action_value_f", Vehicle_Control, function(feat)
        local PlyVeh = player.get_player_vehicle(player.player_id())
        local Gear = vehicle.get_vehicle_current_gear(PlyVeh)
        if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 and Gear ~= 0 then

            vehicle.set_vehicle_gear_ratio(PlyVeh, Gear, feat.value)
        end
end)
    Veh_set_gear_ratio.max = 800.00
    Veh_set_gear_ratio.min = -30.00
    Veh_set_gear_ratio.value = 1.80
    Veh_set_gear_ratio.mod = 0.10

    Veh_set_torq_ratio = menu.add_feature("Set Veh orq Ratio: ", "value_f", Vehicle_Control, function(feat)
        if feat.on then
            local PlyVeh = player.get_player_vehicle(player.player_id())
            vehicle.set_vehicle_engine_torque_multiplier_this_frame(PlyVeh, feat.value)

            return HANDLER_CONTINUE
        end
end)
    Veh_set_torq_ratio.max = 800.00
    Veh_set_torq_ratio.min = -30.00
    Veh_set_torq_ratio.value = 1.80
    Veh_set_torq_ratio.mod = 0.10
    Veh_set_torq_ratio.on = false

    Vehicle_Control_getGear = menu.add_feature("Get Current Gear", "toggle", Vehicle_Control, function(feat)
        if feat.on then

            local PlyVeh = player.get_player_vehicle(player.player_id())
            if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then
                Veh_setgear.max = vehicle.get_vehicle_max_gear(PlyVeh)
                Veh_set_nextgear.max = vehicle.get_vehicle_max_gear(PlyVeh)

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
    Vehicle_Control_getGear.on = false

    Vehicle_Control_SetGear = menu.add_feature("Set Gear", "toggle", Vehicle_Control, function(feat)

        if feat.on then

            local PlyVeh = player.get_player_vehicle(player.player_id())
            if player.is_player_in_any_vehicle(player.player_id()) or PlyVeh ~= 0 then

                if controls.is_control_pressed(1, 71) and controls.is_control_just_pressed(1, 73) then
                    Next = (vehicle.get_vehicle_current_gear(PlyVeh) + 1)
                    vehicle.set_vehicle_next_gear(PlyVeh, Next)
                    vehicle.set_vehicle_current_gear(PlyVeh, Next)
                    Veh_setgear.on = true
                    Veh_setgear.value = Next
                end
            elseif not controls.is_control_pressed(1, 71) and controls.is_control_pressed(1, 73) and
                controls.is_control_just_pressed(1, 68) then
                Previous = (vehicle.get_vehicle_current_gear(PlyVeh) - 1)
                vehicle.set_vehicle_next_gear(PlyVeh, Previous)
                vehicle.set_vehicle_current_gear(PlyVeh, Previous)
                Veh_setgear.on = true
                Veh_setgear.value = Previous
            end

            return HANDLER_CONTINUE
        end
        controls.disable_control_action(1, 114, false)
        controls.disable_control_action(1, 73, false)
        controls.disable_control_action(1, 68, false)
        return HANDLER_POP
end)
    Vehicle_Control_SetGear.on = false

    global_func.BailExit = menu.add_feature("Bail/Exit Vehicle", "action_value_i", globalFeatures.self_veh,
        function(feat)
            pped = player.get_player_ped(player.player_id())
            local eject = {0, 1, 16, 64, 256, 4160, 262144, 320, 512, 131072}
            ai.task_leave_vehicle(pped, player.get_player_vehicle(player.player_id()), eject[feat.value])
            return HANDLER_POP
        end)
    global_func.BailExit.max = #eject
    global_func.BailExit.min = 1
    global_func.BailExit.value = 6

    global_func.Veh_no_col = menu.add_feature("Vehicle has no collision", "toggle", globalFeatures.self_veh,
        function(feat)
            if not feat.on then
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
    global_func.mk1boostrefill = menu.add_feature("VolticBoost Delayed Refill(MK1)", "toggle", globalFeatures.self_veh,
        function(feat)
            Settings["global_func.mk1boostrefill"] = true
            if feat.on then
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
    global_func.mk1boostrefill.on = Settings["global_func.mk1boostrefill"]
    global_func.mk2boostrefill = menu.add_feature("VolticBoost Instant Recharge(MK2)", "toggle",
        globalFeatures.self_veh, function(feat)
            Settings["global_func.mk2boostrefill"] = true
            if feat.on then
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
    global_func.mk2boostrefill.on = Settings["global_func.mk2boostrefill"]
    global_func.veh_rapid_fire = menu.add_feature("RapidFire RepairLoop Glitch", "toggle", globalFeatures.self_veh,
        function(feat)
            Settings["global_func.veh_rapid_fire"] = true
            if feat.on then
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
    global_func.veh_rapid_fire.on = Settings["global_func.veh_rapid_fire"]
    global_func.rapidfire_hotkey1 = menu.add_feature("RapidFire RepairLoop Hotkey", "toggle",
        globalFeatures.moist_hotkeys, function(feat)
            Settings["global_func.rapidfire_hotkey1"] = true
            if feat.on then
                local key = MenuKey()
                key:push_str("LCONTROL")
                key:push_str("r")
                if key:is_down() then
                    global_func.veh_rapid_fire.on = not global_func.veh_rapid_fire.on
                    moist_notify(
                        global_func.veh_rapid_fire.on and "ON\n" or "OFF\n" .. global_func.veh_rapid_fire.on and
                            "Glitch On\n" or "Set Repaired\n", "Switching Rapid Fire for your Current Vehicle ")
                    system.wait(1200)
                end
                return HANDLER_CONTINUE
            end
            Settings["global_func.rapidfire_hotkey1"] = false
            return HANDLER_POP
        end)
    global_func.rapidfire_hotkey1.on = Settings["global_func.rapidfire_hotkey1"]
    -- TODO: Self Stat Hotkey Switches
    global_func.thermal_stat_switch_hotkey = menu.add_feature("Switch Thermal/NV Hotkey", "toggle",
        globalFeatures.moist_hotkeys, function(feat)
            Settings["global_func.thermal_stat_switch_hotkey"] = true
            local stat = Get_Last_MP("HAS_DEACTIVATE_NIGHTVISION")
            local thermalstat_hash = gameplay.get_hash_key(stat)
            if feat.on then
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
    global_func.thermal_stat_switch_hotkey.on = Settings["global_func.thermal_stat_switch_hotkey"]
    local cross_hair = menu.add_feature("Show Weapon Recticle", "toggle", globalFeatures.self_options, function(feat)
        Settings["Weapon_Recticle"] = true
        if feat.on then
            ui.show_hud_component_this_frame(14)
            return HANDLER_CONTINUE
        end
        Settings["Weapon_Recticle"] = false
        return HANDLER_POP
end)
    cross_hair.on = Settings["Weapon_Recticle"]
end
self_func()

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
--TODO: Player stats
local activecharacter_stat = menu.add_feature("Get Active Character", "action", globalFeatures.self_statcheck, function(feat)
local stat_hash = gameplay.get_hash_key("MPPLY_LAST_MP_CHAR")
local stat_result = stats.stat_get_int(stat_hash, 0)
moist_notify("Last Used Character:\n" .. stat_result, "Moists Self Stat Options")
end)
local activecharacter_stat = menu.add_feature("is Active Character", "action", globalFeatures.self_statcheck, function(feat)
local stat_hash = gameplay.get_hash_key("MP0_CHAR_ISACTIVE")
local stat_result = tostring(stats.stat_get_bool(stat_hash, 0))
moist_notify("Last Used Character:\n" .. stat_result, "Moists Self Stat Options")
end)
local mental_stat = menu.add_feature("Get Mental State", "action", globalFeatures.self_statcheck, function(feat)
local stat = Get_Last_MP("PLAYER_MENTAL_STATE")
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_float(stat_hash, 0)
moist_notify("Current Mental State:\n" ..stat_result, "Moists Self Stat Options")
end)
local parachute_stat1 = menu.add_feature("Get Parachute Current Tint", "action", globalFeatures.self_statcheck, function(feat)
local stat = Get_Last_MP("PARACHUTE_CURRENT_TINT")
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_int(stat_hash, 0)
moist_notify("Current Tint:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat2 = menu.add_feature("Get Parachute Current Smoke", "action", globalFeatures.self_statcheck, function(feat)
local stat = Get_Last_MP("PARACHUTE_CURRENT_SMOKE")
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_int(stat_hash, 0)
moist_notify("Current Smoke:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat3 = menu.add_feature("Get Parachute Current Pack", "action", globalFeatures.self_statcheck, function(feat)
local stat = Get_Last_MP("PARACHUTE_CURRENT_PACK")
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_int(stat_hash, 1)
moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
local parachute_stat3 = menu.add_feature("Get Parachute Last Used", "action", globalFeatures.self_statcheck, function(feat)
local stat = Get_Last_MP("LAST_USED_PARACHUTE")
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_int(stat_hash, 1)
moist_notify("Last Used Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
local thermal = menu.add_feature("Check Thermal/NV State", "action", globalFeatures.self_statcheck, function(feat)
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
local helmet_visor = menu.add_feature("Helmet Visor State", "action", globalFeatures.self_statcheck, function(feat)
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

local stat_one = menu.add_feature("Stat State Check", "action", globalFeatures.self_statcheck, function(feat)
local vehstats = {"_MPSV_VEHICLE_BS_","_MPSV_IMPOUND_TIME_","_MPSV_PREMIUM_PAID_","_MPSV_MODEL_","_MPSV_FLAGS_","_MPSV_PRICE_PAID_"}
for i = 0, 316 do
for y = 1, #vehstats do
local stat = Get_Last_MP(vehstats[y] .. i)
local stat_hash = gameplay.get_hash_key(stat)
local stat_result = stats.stat_get_int(stat_hash, 0)
Debug_Out(tostring(stat) .. " : " .. tostring(stat_hash) .."\nValue = " .. tostring(stat_result), false)
end
end
end)

local Defenses_forceon = menu.add_feature("Force Yacht Defences ON Assosiates", "toggle", globalFeatures.self_statsetup.id, function(feat)
if feat.on then
	local stat = Get_Last_MP("YACHT_DEFENCE_SETTING")
	local stat_hash = gameplay.get_hash_key(stat)
	stats.stat_set_int(stat_hash, 7, true)
	return HANDLER_CONTINUE
end
end)
local ClubPop = menu.add_feature("Auto Popular Nightclub", "toggle", globalFeatures.self_statsetup.id, function(feat)
if feat.on then
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
if feat.on then
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
local stat = Get_Last_MP("PARACHUTE_CURRENT_PACK")
local stat_hash = gameplay.get_hash_key(stat)
local i = tonumber(feat.value)
stats.stat_set_int(stat_hash, i, true)
local stat_result = stats.stat_get_int(stat_hash, 1)
moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
parachute_setstat1.max = 100
parachute_setstat1.min = 0
local parachute_setstat2 = menu.add_feature("Set Parachute Current Tint", "action_value_i", globalFeatures.self_statsetup.id, function(feat)
local stat = Get_Last_MP("PARACHUTE_CURRENT_TINT")
local stat_hash = gameplay.get_hash_key(stat)
local i = tonumber(feat.value)
stats.stat_set_int(stat_hash, i, true)
local stat_result = stats.stat_get_int(stat_hash, 1)
moist_notify("Current Pack:\n" .. stat_result, "Moists Self Stat Options")
end)
parachute_setstat2.max = 80
parachute_setstat2.min = 0
--TODO: Force Mental State
mental_statset = menu.add_feature("Set Mental State", "action_value_i", globalFeatures.self_statsetup.id, function(feat)
local stat = Get_Last_MP("PLAYER_MENTAL_STATE")
local stat_hash = gameplay.get_hash_key(stat)
local i = tonumber(feat.value)
local stat_result1 = stats.stat_get_float(stat_hash, 0)
stats.stat_set_float(stat_hash, i, true)
local stat_result2 = stats.stat_get_float(stat_hash, 0)
moist_notify("Mental State was: " .. stat_result1 .. "\nMental State Now: " .. stat_result2, "Moists Self Stat Options")
end)
mental_statset.max = 100
mental_statset.min = 0
mental_statset.value = 0
local thermal_set = menu.add_feature("Switch Helmet Visor State", "action", globalFeatures.self_statsetup.id, function(feat)
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
--TODO: Quick Stat Setups
local em_rec = {}
OfficeFloorStats = {{"LIFETIME_SELL_COMPLETE",1100},{"LIFETIME_CONTRA_EARNINGS",25000000}}
OfficeFloorStatCheck = {"LIFETIME_BUY_COMPLETE","LIFETIME_BUY_UNDERTAKEN"}


local check = {}
OfficeFloor_Money = menu.add_feature("Setup Office Floor Money Decor", "action", globalFeatures.quick_stats, function(feat)
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

local setup_casinostats = menu.add_feature("Setup Casino Heist Stealth Diamonds", "action", globalFeatures.quick_stats, function(feat)
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
local character_design = {"MESH_HEADBLEND","MESH_TEXBLEND","MESH_VARBLEND","HEADBLEND_OVER_BLEMISH_PC","HEADBLEND_OVERLAY_BEARD_PC","HEADBLEND_OVERLAY_EYEBRW_PC","HEADBLEND_OVERLAY_WETHR_PC","HEADBLEND_OVERLAY_MAKEUP_PC","HEADBLEND_OVERLAY_DAMAGE_PC","HEADBLEND_OVERLAY_BASE_PC","HEADBLEND_GEOM_BLEND","HEADBLEND_TEX_BLEND","HEADBLEND_VAR_BLEND","HEADBLEND_DOM","FEATURE_0","FEATURE_1","FEATURE_2","FEATURE_3","FEATURE_4","FEATURE_5","FEATURE_6","FEATURE_7","FEATURE_8","FEATURE_9","FEATURE_10","FEATURE_11","FEATURE_12","FEATURE_13","FEATURE_14","FEATURE_15","FEATURE_16","FEATURE_17","FEATURE_18","FEATURE_19","FEATURE_20","HEADBLENDOVERLAYCUTS_PC","HEADBLENDOVERLAYMOLES_PC","HEADBLEND_OVERLAY_BLUSHER","OVERLAY_BODY_2","OVERLAY_BODY_3","OVERLAY_BODY_1"}
local des_rec = {}
char_design = menu.add_feature("Create Character Design Script", "action", script_recovery.id, function(feat)
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
write_recScript('menu.add_feature("Stat Recovery'..txt ..'", "action", 0, function(feat)\n\n')
for i = 1, #em_rec do
	local stat, statval = heiststat_setup[i][2], em_rec[i]
	write_recScript('stats.stat_set_int('..stat..', '..statval..', '..'true)\n')
end
write_recScript('end)\n\n')
em_rec = {}
end
--TODO: local session Features
					
slotfriend = menu.add_feature("Session Slot for Friends", "parent", HostOptionsParent.id)

for pid = 0, 31 do
	local feat = "slot" .. pid
	feat =  menu.add_feature("Slot " .. pid, "toggle", slotfriend.id, function(feat)
	local PlayerID = pid
		if feat.on then
			if not player.is_player_friend(PlayerID) then
				if network.network_is_host() then
				system.wait(1000)
					network.network_session_kick_player(PlayerID)
					end
			end
			system.wait(100)
			return HANDLER_CONTINUE
		end
	end)
	feat.on = false
end
					

function Lobby_SE_Features()
otr_all =  menu.add_feature("Give everyone OTR", "action", globalFeatures.lobby, function(feat)
for pid = 0, 31 do
	script.trigger_script_event(0xE8A824A0, pid, {pid, utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
	
end
end)

nocops_all =  menu.add_feature("Give everyone Cop Bribe", "action", globalFeatures.lobby, function(feat)
for pid = 0, 31 do
	script.trigger_script_event(0x66B0F59A, pid, {pid, utils.time() - 60, utils.time(), script.get_global_i(2810287 + 4628), 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
	
end
end)

all2island =  menu.add_feature("Send Session to Island", "action", globalFeatures.lobby, function(feat)
	for pid = 0, 31 do
	if player.is_player_valid(pid) then
	script.trigger_script_event(0xDAF8082C, pid, {1300962917})
	end
	system.wait(0)
	end
return HANDLER_POP
end)

function blockpassiveall()
for i=0,32 do
	fnd = player.is_player_friend(i)
	if i ~= player.player_id() or i ~= fnd then
		script.trigger_script_event(0x4267b065, i, {1, 1})
		
	end
end
end

local bountyallplayerses2 = menu.add_feature("set Bounty on Lobby2", "action", globalFeatures.lobby, function(feat)
for pid = 0, 31 do
	
	if player.is_player_valid(pid) and player.get_player_scid(pid) ~= 4294967295 then
		Send_Bounty(pid, 1)
		system.wait(100)
	end
end
end)

--TODO: Send Bounty Function
function Send_Bounty(pid, isNpc)
	--local isNpc = is_Npc and 1 or 0
if player.is_player_valid(pid) then
	for i = 0, 31 do
		local scid = player.get_player_scid(i)
		if (scid ~= -1 or scid ~= 4294967295) then
			script.trigger_script_event(0x4d3010a8, i, {i, pid, 3, 10000, 1, isNpc, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
		end
	end
end
end

local pasivall = menu.add_feature("Block all players Passive", "action", globalFeatures.lobby, function(feat)
blockpassiveall()
end)

end
if not NewDLC() then
	Lobby_SE_Features()
end

blip_all =  menu.add_feature("Give everyone Enemy Blips", "action", globalFeatures.lobby, function(feat)
for i = 0, 31 do
	local scid = player.get_player_scid(i)
	if scid ~= 4294967295 then
		local pped = player.get_player_ped(i)
		local oldblip = ui.get_blip_from_entity(pped)
		ui.set_blip_colour(oldblip, 80)
		BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
		ui.set_blip_colour(BlipIDs[#BlipIDs], i)
	end
end
end)


Lester_Wanderall = menu.add_feature("Send Mk1 Lester Wandering by all", "action",  globalFeatures.lobbyGrief, function(feat)

    local me

    me	= player.player_id()

    for i=0,32 do
        if i ~= me and player.is_player_valid(i) then
            allplayer_lester(i)
        end
end
end)

Lesteratk_Wanderall = menu.add_feature("MK1 Lester Annihilation", "action",  globalFeatures.lobbyGrief, function(feat)

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





local notallmod = menu.add_feature("UnMark all Players as Modder", "action", globalFeatures.protex, function(feat)
	for pid = 0, 31 do
		if player.player_id() ~= pid then
			player.unset_player_as_modder(pid, -1)
		end
	end
end)

--TODO: Session Kicks
function Session_SE_Kicks()
-- local NetBail_SHF_Kick = menu.add_feature("ScriptHost Fuckarino (Friends Excluded)", "toggle", globalFeatures.kick, function(feat)
-- if feat.on then
	-- for i = 0, 31 do
		-- if player.is_player_valid(i) then
			-- local fnd = player.is_player_friend(i)
			-- if player.player_id() ~= i or fnd ~= i then
				-- script.trigger_script_event(-877212109, i, {91645, -99683, 1788, 60877, 55085, 72028})
				-- script.trigger_script_event(-877212109, i, {91645, -99683, 1788, 60877, 55085, 72028})
				-- script.trigger_script_event(0x493FC6BB, i, {i, script.get_global_i(1630816 + (1 + (i * 597)) + 508)})
				-- script.trigger_script_event(-877212109, i, {-1, 500000, 849451549, -1, -1})
				-- script.trigger_script_event(315658550, i, {-1, 500000, 849451549, -1, -1})
				-- script.trigger_script_event(-877212109, i, {-1139568479, -1, 1, 100099})
				-- script.trigger_script_event(315658550, i, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
				-- script.trigger_script_event(-877212109, i, {-1, -1, -1, -1, -1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
				-- script.trigger_script_event(315658550, i, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
				
			-- end
			
			-- system.yield(Settings["ScriptEvent_delay"])
			
		-- end
	-- end
	-- return HANDLER_CONTINUE
-- end
-- return HANDLER_POP
-- end)

Kick_Session = menu.add_feature("Session Kick (excludes friends)", "toggle", globalFeatures.kick, function(feat)
if feat.on then
	for i = 1, #data do
	for pid = 0, 31 do
		if player.is_player_valid(pid) then
			local fnd = player.is_player_friend(pid)
			if player.player_id() ~= pid or fnd ~= pid then
				script.trigger_script_event(data[i], pid, {13, math.random(-5139791970, -1139791970)})
				system.yield(10)
				script.trigger_script_event(data[i], pid, {13, math.random(-5139791970, -1139791970)})
				
				system.yield(Settings["ScriptEvent_delay"])
				
			end
		end
	end
	system.yield(Settings["ScriptEvent_delay"])
	end
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)


local SECrash = {1258808115,-1205085020,677240627,2112408256,-1386010354,962740265,-2113023004,704979198,-1715193475,163598572,-1970125962,-1056683619,1757755807}

function build_params(argcnt)
local ParaMs = {}
for i = 1, argcnt do
	local y = math.random(1, #kick_param_data)
	ParaMs[i] = kick_param_data[y]
end
return ParaMs
end

--TODO: **************************************************SESSION KICKS***************************************

local SEC_SESS = menu.add_feature("Script Event Crash Session", "toggle", globalFeatures.kick, function(feat)
local Params = build_params(120)
if feat.on then
	for i = 0, 31 do
		if player.is_player_valid(i) then
			local fnd = player.is_player_friend(i)
			if i ~= player.player_id() or i ~= fnd then
				for y = 1, #SECrash do
					script.trigger_script_event(SECrash[y], i, Params)
					system.wait(1)
				end
			end
		end
		
		system.yield(Settings["ScriptEvent_delay"])
		
	end
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
--TODO: Force host
	local hostnow
HostForce = menu.add_feature("Kick Host until Session host", "toggle", globalFeatures.kick,function(feat)
if feat.on then
	-- HostForce_togglecheck.on = true
	hostnow = player.get_host()
	fnd = player.is_player_friend(hostnow)
	if not network.network_is_host() then
		if hostnow ~= player.player_id() or hostnow ~= fnd then
			player.unset_player_as_modder(hostnow, -1)
			script.trigger_script_event(0x493FC6BB, hostnow, {hostnow, script.get_global_i(1893548 + (1 + (hostnow * 600)) + 511)})
				system.yield(Settings["ScriptEvent_delay"])
			script.trigger_script_event(0x493FC6BB, hostnow, {hostnow, script.get_global_i(1893548 + (1 + (hostnow * 600)) + 511)})
				system.yield(Settings["ScriptEvent_delay"])
		end
			system.wait(1)
	end
	if network.network_is_host() then
	moist_notify("Force Session Host Success", "Force Session Host")
	EnabledBlacklistFeature.on = not EnabledBlacklistFeature.on
		HostForce.on = false
		EnabledBlacklistFeature.on = not EnabledBlacklistFeature.on
		return
	elseif not network.network_is_host() and player.is_player_friend(player.get_host()) then
	moist_notify("Session Host is Currently your Friend\nDisabling Feature", "Force The Session Host Out")
	HostForce.on = false
	end
	
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
HostForce.on = false

local netbailkick = menu.add_feature("Network Bail Kick", "toggle", globalFeatures.kick, function(feat)
if feat.on then
	for i = 0, 31 do
		if player.is_player_valid(i) then
			local fnd = player.is_player_friend(i)
			if i ~= player.player_id() or i ~= fnd then
				script.trigger_script_event(0x493FC6BB, i, {i, script.get_global_i(1893548 + (1 + (i * 600)) + 511)})
					system.wait(1)
				script.trigger_script_event(0x493FC6BB, i, {i, script.get_global_i(1893548 + (1 + (i * 600)) + 511)})
					system.wait(1)
			end
		end
		
		system.yield(Settings["ScriptEvent_delay"])
		
	end
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)

--TODO: Update Session Crash Events

local SessionCrash = menu.add_feature("SE Kick Crash Session", "action", globalFeatures.kick, function(feat)
	local Kick_Array1 = {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778,  23135423, 827870001, 23135423}
	local Kick_Array2 = {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0}
	
	for i = 1, #data do
	for pid = 0, 31 do
		if not player.is_player_valid(pid) then return end
		script.trigger_script_event(data[i], pid, Kick_Array1)
		system.yield(0)
		script.trigger_script_event(data[i], pid, Kick_Array2)
		end
	end
end)
	

--TODO: REMOVE REMOVE REMOVE REMOVE REMOVE REMOVE ! ! ! ! ! ! ! ! ! !! ! 

end
if not NewDLC() then
Session_SE_Kicks()
end

local hostnotify = false
function hostkickall(pid)
network.network_session_kick_player(pid)
end

local hostkick = menu.add_feature("Host Kick All", "toggle", globalFeatures.kick, function(feat)
if feat.on then
	if not network.network_is_host() then
		if not hostnotify then
			moist_notify("You are not Session Host Yet!\nTake Host first By Force if Necessary!", "Session Wide Host Kick")
			hostnotify = true
		end
	end
	if network.network_is_host() then
		hostnotify = false
		for i = 0, 31 do
			if player.is_player_valid(i) then
				if player.player_id() ~= i then
					--	if i ~= player.is_player_friend(i) then
					hostkickall(i)
					system.wait(1)
				--	end
				end
			end
		end
		
		system.yield(Settings["ScriptEvent_delay"])
	end
	return HANDLER_CONTINUE
end
hostnotify = false
return HANDLER_POP
end)

local all_mod = menu.add_feature("Mark all Players as Modder", "toggle", globalFeatures.protex, function(feat)
if feat.on then
	for i = 0, 31 do
		for i = 0, 31 do
			if i ~= player.player_id() then
				if i ~= player.is_player_friend(i) then
					player.set_player_as_modder(i, 1)
					player.set_player_as_modder(i, mod_flag_1)
					player.set_player_as_modder(i, mod_flag_2)
				end
			end
		end
	end
	system.yield(Settings["loop_feat_delay"])
	return HANDLER_CONTINUE
end
return HANDLER_POP
end)
all_mod.on = false

--TODO: ------------------Script Event Hooks----------------------------

function Script_Event_Hooks()
	
passive_players = {}
function Set_PassiveTracker()
for i = 1, 31 do
	passive_players[i] = false
end
end
Set_PassiveTracker()

Passive_trackerIN = event.add_event_listener("player_join", function(e)
local pid = tonumber(e.player)
passive_players[pid +  1] = false
Players[pid].isvgod = true
Players[pid].isgod = true
Players[pid].PlayerGodMode = false
Players[pid].PlayerVehGodMode = false
Players[pid].isint = true
Players[pid].isvis = false
Players[pid].PedSpawned = false
Players[pid].isPassive = false
Players[pid].isDamagedbY = nil


playergroups[pid + 1]  = player.get_player_group(pid)
playerpeds[pid + 1] = player.get_player_ped(pid)
orbitalProxy.on = false
system.wait(800)
orbitalProxy.on = true



return
end)

Passive_trackerOUT = event.add_event_listener("player_leave", function(e)
local pid = tonumber(e.player)
BL_Notify[pid+1] = false
BL_M_Notify[pid+1] = false
Modders_DB[pid + 1].flag = nil
Modders_DB[pid + 1].ismod = false
passive_players[pid +  1] = false
Players[pid].isPassive = false
Players[pid].bounty = false
Players[pid].bountyvalue = nil
Players[pid].PedSpawned = false
Players[pid].isvgod = false
Players[pid].isgod = false
Players[pid].BlipPID = 0
Players[pid].PlayerGodMode = false
Players[pid].PlayerVehGodMode = false
Players[pid].isint = false
Players[pid].isvis = false
Players[pid].orbnotify = false
Players[pid].isDamagedbY = nil
SessionPlayers[pid].scid = 4294967295
SessionPlayers[pid].Name = nil
playergroups[pid + 1]  = nil
playerpeds[pid + 1] = nil
orbitalProxy.on = false
system.wait(800)
orbitalProxy.on = true
return
end)
--TODO: Bounty SEP



local bountyhook_id = 0
bountyhook_event = function(source, target, params, count)
local player_source = player.get_player_name(source)
if params[1] == 0x4d3010a8 then
	if params[3] ~= player_source then
		Players[params[3]].bounty = true
		Players[params[3]].bountyvalue = params[5]
		return false
		elseif params[3] == player_source then
		
		Players[source].bounty = true
		Players[source].bountyvalue = params[5]
		return false
	end
	elseif params[1] == 0x151b3bc2 then
	Players[source].bounty = false
	Players[source].bountyvalue = nil
	return false
end
return false
end

--TODO: MISSILE TRACKING
Missile, MissEntity, MissileBlip, MissCount = {}, {}, {}, 0

function Get_Missile_Entity()
	
	repeat
	MissCount = MissCount + 1
	
	until MissCount == 25
	MissCount = 0
	
	
		MissEntity = object.get_all_objects()
		for i = 1, #MissEntity do
		local hash = entity.get_entity_model_hash(MissEntity[i])
		if hash == 1262355818 then
		bliprem = ui.get_blip_from_entity(MissEntity[i])
		if #MissileBlip ~= nil then
		for b = 1, #MissileBlip do
		if bliprem == MissileBlip[b] then
		ui.remove_blip(MissileBlip[b])
		MissileBlip[b] = nil
		elseif #MissileBlip == nil then
		ui.remove_blip(bliprem)
		end
		end
		end
		MissileBlip[#MissileBlip+1] = ui.add_blip_for_entity(MissEntity[i])
		BlipIDs[#BlipIDs+1] = MissileBlip[#MissileBlip]
		
		ui.set_blip_colour(MissileBlip[#MissileBlip], 48)
		Missile[#Missile+1] = MissEntity[i]

end
		end
end


function Missile_Exist()
	
	for i = 1, #Missile do
	
	if entity.has_entity_collided_with_anything(Missile[i]) then
	isOnFire = entity.is_entity_on_fire(Missile[i])
	isNowDead = entity.is_entity_dead(Missile[i])
	moist_notify("On Fire: " .. tostring(isOnFire) .. "\nIs Dead: " .. tostring(isNowDead))
	ui.remove_blip(MissileBlip[i])
	Missile[i] = nil
	end
	end
end

local missilehook_id, Missile_ON_PID = 0, -1
missilehook_event = function(source, target, params, count)
	local pid = source
local player_source = tostring(player.get_player_name(source))
if params[1] == 0xd621a95f then
	Find_Missiles.on = true
	Check_Missiles.on = true
	Find_Missiles.value = 1
	Missile_ON_PID = source
	moist_notify(player_source .. "\nLaunched a Submarine Guided Missile")
	Get_Missile_Entity()
 
	return false
	elseif params[1] == 0x2c8a72d0 then
	Players[source].isTyping = true
	
	return false
	elseif params[1] == 0xc4ef2d0b then
	Players[source].isTyping = false
	
	return false
	end
return false
end

SEP_1 = function(feat)
	Settings["missilehook"] = missilehook.on
if missilehook.on then
	--Settings["missilehook"] = true
	missilehook_id = hook.register_script_event_hook(missilehook_event)
	return HANDLER_POP
end
if missilehook_id ~= 0 then
	hook.remove_script_event_hook(missilehook_id)
	missilehook_id = 0
end
end

missilehook = menu.add_feature("Guided Missile Tracking", "toggle", globalFeatures.moistopt, SEP_1)
missilehook.on = Settings["missilehook"]

Find_Missiles = menu.add_feature("Find Missiles", "value_str", globalFeatures.moist_tools.id, function(feat)	
	if feat.on and feat.value == 0 then
	Get_Missile_Entity()
	Find_Missiles.on = false
	elseif feat.on and feat.value == 1 then
		Get_Missile_Entity()
		system.yield(25)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
Find_Missiles:set_str_data({"One Time","Loop Find"})
Find_Missiles.on = false

--TODO: MISSILE TIMER
	missiletime = -1
Check_Missiles = menu.add_feature("Check Missiles", "toggle", globalFeatures.moist_tools.id, function(feat)
	if not feat.on then
	Find_Missiles.on = false
	Check_Missiles.on = false
	missiletime = -1
	return HANDLER_POP
	end
	if missiletime < 0 then
	missiletime = utils.time()
	end
	if utils.time() - missiletime > 100 then
	Find_Missiles.on = false
	Check_Missiles.on = false
	missiletime = -1
	end
		return HANDLER_CONTINUE
	
end)
Check_Missiles.on = false

sep1 = function(feat)
if bountyhook.on then
	bountyhook_id = hook.register_script_event_hook(bountyhook_event)
	return HANDLER_POP
end
if bountyhook_id ~= 0 then
	hook.remove_script_event_hook(bountyhook_id)
	bountyhook_id = 0
end
end
bountyhook = menu.add_feature("SEP Bounty Value", "toggle", globalFeatures.moist_tools.id, sep1)
bountyhook.on = true

local passivehook_id = 0
local passivehook_event = function(source, target, params, count)
	local pid = source
	
local player_source = player.get_player_name(pid)
if params[1] == 0xd4052bab then
	Players[pid].isPassive = true
	return false
	elseif params[1] == 0xc674d326 then
	Players[pid].isPassive = false
	return false
end
return false
end
sep = function(feat)
if passivehook_Alert.on then
	passivehook_id = hook.register_script_event_hook(passivehook_event)
	return HANDLER_POP
end
if passivehook_id ~= 0 then
	hook.remove_script_event_hook(passivehook_id)
	passivehook_id = 0
end
end
passivehook_Alert = menu.add_feature("Custom SEP Passive", "toggle", globalFeatures.moist_tools.id, sep)
passivehook_Alert.on = true
end
if not NewDLC() then
	Script_Event_Hooks()
end
	



--TODO: World stuff
-- **WATER WAVE MODIFIERS (local)**
Moists_Wave_Mod = function()
wave_int_cur = tostring(water.get_waves_intensity())
function Moist_WaveMod()
	CurrentIntensity = tostring(wave_int_cur)
	moist_notify("Current Wave Intensity is: ".." " ..wave_int_cur.." ", "Moists Wave Mod")
end
wave_int_osd = menu.add_feature("Get Current Wave Intensity", "toggle", globalFeatures.Wave, function(feat)
	if feat.on then
		local pos = v2()
		pos.x = .05
		pos.y = .086
		ui.set_text_scale(0.25)
		ui.set_text_font(0)
		ui.set_text_centre(0)
		ui.set_text_color(255, 0, 0, 255)
		ui.set_text_outline(1)
		ui.draw_text("Wave Intensity: "..wave_int_cur, pos)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
wave_int_osd.on = false
local notifymodvalue = false

waveintmodifiers = menu.add_feature("Persistant Wave Intensity", "value_f", globalFeatures.Wave, function(feat)
	if not feat.on then
        notifymodvalue = false
        return HANDLER_POP
    end

		local x = feat.value
		water.set_waves_intensity(x)
        if not notifymodvalue then
		Moist_WaveMod()
        notifymodvalue = true
        end
		system.yield(Settings["loop_feat_delay"])
		return HANDLER_CONTINUE	
end)
waveintmodifiers.max = 5000.00
waveintmodifiers.min = -200.00
waveintmodifiers.mod = 0.01

waveintmodifiers = menu.add_feature("Change Wave Intensity", "action_value_f", globalFeatures.Wave, function(feat)
	local x = feat.value
	water.set_waves_intensity(x)
	Moist_WaveMod()
end)
waveintmodifiers.max = 500000
waveintmodifiers.min = -200
waveintmodifiers.mod = 1

wavestep = menu.add_feature("Change step Size", "autoaction_value_f",  globalFeatures.Wave, function(feat)
	waveintmodifiers.mod = feat.value
end)
wavestep.max = 100.00
wavestep.min = 0.05
wavestep.mod = 0.10

local wavemodifiers = menu.add_feature("Reset Intensity", "action", globalFeatures.Wave, function(feat)
	water.reset_waves_intensity()
end)

end
Moists_Wave_Mod()

--TODO: ***** WORLD CLEANUP FUNCTIONS ****
local World_Clean = function()
local cleanup_done = true
clear_World_ent = menu.add_feature("Fetched World Entities Move & Delete", "action", globalFeatures.entity_removal, function(feat)
	if not cleanup_done == true then return end
	cleanup_done = false
	moist_notify("Trying to Remove all Controllable Cunts in the World", "World Cunt Removal Cleanups Disabled!")
	get_everything()
	system.wait(500)
	clear_world()
	moist_notify("All Controllable Cunts in range Removed!\nOnly Cunt Left: is You " .. player.get_player_name(player.player_id()), "World Cunt Removal! |Finished| Cleanups Enabled")
end)
clear_peds = menu.add_feature("Fetch all Peds Move & Delete", "action", globalFeatures.entity_removal, function(feat)
	if not cleanup_done == true then return end
	cleanup_done = false
	moist_notify("In Range Controllable Ped Removal Started",  "World Cunt Removal! Clean-ups Disabled")
	get_allpeds()
	system.wait(250)
	move_delete_peds()
	moist_notify("Only Peds left are Cunts", "World Cunt Removal! |Finished| Cleanups Enabled")
end)
fetch_obj = menu.add_feature("Fetch all objects Move & Delete", "action", globalFeatures.entity_removal, function(feat)
	if not cleanup_done == true then return end
	cleanup_done = false
	moist_notify("Cunt Cleaning Started", "World Cunt Removal! Cleanups Disabled")
	get_allobj()
	system.wait(250)
	move_delete_obj()
	moist_notify("Cuntish Objects Within Controllable Range Removed",  "World Cunt Removal! |Done| Cleanups Enabled")
end)
fetch_veh = menu.add_feature("Fetch all Vehicles Move & Delete", "action", globalFeatures.entity_removal, function(feat)
	if not cleanup_done == true then return end
	cleanup_done = false
	moist_notify("Cunt Cleanup Started\n", " Cleanups Disabled until Done!")
	get_allveh()
	system.wait(250)
	move_delete_veh()
	moist_notify("Vehicles Cleared\n", " Cleanups Enabled")
end)
fetch_veh = menu.add_feature("Fetch all Pickups Move & Delete", "action", globalFeatures.entity_removal, function(feat)
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

--TODO: --------------------------Session Troll------------------

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


local animationz = {{"priv_dance_p1", "mini@strip_club@private_dance@part1"},{"priv_dance_p2", "mini@strip_club@private_dance@part2"},{"priv_dance_p3", "mini@strip_club@private_dance@part3"},{"idle_a","amb@code_human_in_car_mp_actions@fist_pump@bodhi@rps@base"},{"pm_incar_notdoinanythin", "rcmpaparazzo_2ig_3"}}
local Optiontext = {"Private Dance 1","Private Dance 2","Private Dance 3","Fist Pump","car_mp_actions@tit_squeeze",}
anim_dic = {"amb@bagels@male@walking@","amb@code_human_cower@female@base","amb@code_human_cower@female@enter","amb@code_human_cower@female@exit","amb@code_human_cower@female@idle_a","amb@code_human_cower@female@react_cowering","amb@code_human_cower@male@base","amb@code_human_cower@male@enter","amb@code_human_cower@male@exit","amb@code_human_cower@male@idle_a","amb@code_human_cower@male@idle_b","amb@code_human_cower@male@react_cowering","amb@code_human_cower_stand@female@base","amb@code_human_cower_stand@female@enter","amb@code_human_cower_stand@female@exit","amb@code_human_cower_stand@female@idle_a","amb@code_human_cower_stand@female@react_cowering","amb@code_human_cower_stand@male@base","amb@code_human_cower_stand@male@enter","amb@code_human_cower_stand@male@exit","amb@code_human_cower_stand@male@idle_a","amb@code_human_cower_stand@male@react_cowering"}
anim_ation = {"static","base","enter","exit_flee","idle_c","base_back_left","base","enter","exit_flee","idle_b","idle_d","base_back_left","base","enter","exit_flee","idle_c","base_back_left_exit","base","enter","exit_flee","idle_b","base_right"}


world_dance = menu.add_feature("World Ped Cower", "action_value_str", globalFeatures.troll, function(feat)

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

world_dance2 = menu.add_feature("World Ped Dance", "action_value_str", globalFeatures.troll, function(feat)

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
			--task_play_anim(Ped ped, string dict, string anim, float speed, float speedMult, int duration, int flag, float playbackRate, bool lockX, bool lockY, bool lockZ) 0.1, 0.01, 999999999, 1, 0.01,
			ai.task_play_anim(worldpeds[i], animationz[feat.value + 1][2], animationz[feat.value + 1][1], 1.0, 12.0, 999999999, 1, 0.9, true, true, true)
		end
	end
	system.wait(1)
end


end)
world_dance2:set_str_data(Optiontext)

local PedHaters, player_groups, player_peds = {}, {}, {}
local GroupHate
function Peds_hateWorld(pid, weap)
PedHaters, player_groups, player_peds = {}, {}, {}
player_groups[pid + 1]  = player.get_player_group(pid)
player_peds[pid + 1] = player.get_player_ped(pid)
PedHaters = ped.get_all_peds()
system.wait(100)
GroupHate = ped.create_group()
for y = 1, #player_groups do
	ped.set_relationship_between_groups(5, player_groups[y], GroupHate)
	ped.set_relationship_between_groups(5, GroupHate, player_groups[y])
end
for i = 1, #PedHaters do
	if not ped.is_ped_a_player(PedHaters[i]) then
		network.request_control_of_entity(PedHaters[i])
		ped.set_ped_max_health(PedHaters[i], 7000)
		ped.set_ped_health(PedHaters[i], 7000)
		entity.set_entity_god_mode(PedHaters[i], true)
		ped.set_ped_as_group_member(PedHaters[i], GroupHate)
		ped.set_ped_never_leaves_group(PedHaters[i], true)
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
		if ped.is_ped_in_any_vehicle(PedHaters[i]) then
			pedveh = ped.get_vehicle_ped_is_using(PedHaters[i])
			system.wait(0)
			ai.task_leave_vehicle(PedHaters[i], pedveh, 4160)
			system.wait(500)
			--  ped.clear_ped_tasks_immediately(PedHaters[i])
			system.wait(250)
		end
		--  entity.set_entity_god_mode(PedHaters[i], true)
		ai.task_combat_ped(PedHaters[i], player_peds[pid + 1], 0, 16)
	end
end
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


--TODO: Session Wide Blamed Orbital Strike

OrbitalStrike_All = menu.add_feature("Orbital Session Blaming: ", "action_value_str",  globalFeatures.lobbyGrief, function(feat)
	local pos, exp_pos = v3(), v3()
	
Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}
	
	for i = 1, #Audio_POS do

	audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
	pos.z = 2000.00
	
	audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
		pos.z = -2000.00
	
	audio.play_sound_from_coord(-1, "Air_Defences_Activated", Audio_POS[i], "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
	
	
	end
				for pid = 0, 31 do
			local pos =	player.get_player_coords(pid)
			audio.play_sound_from_coord(-1, "Air_Defences_Activated", pos, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
			system.wait(300)
				end
			system.wait(3000)
			graphics.set_next_ptfx_asset("scr_xm_orbital")
			while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
				graphics.request_named_ptfx_asset("scr_xm_orbital")
				system.wait(0)
			end
			for pid = 0, 31 do
			system.wait(30)
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
OrbitalStrike_All.value = 33


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






--TODO: Heart beat
local heart_beat = menu.add_feature("Heart Beat", "toggle", globalFeatures.troll, function(feat)
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
local heart_beat2 = menu.add_feature("Random Exp", "value_i", globalFeatures.troll, function(feat)
if feat.on then
	pos.x = math.random(-2700, 2700)
	pos.y = math.random(-3300, 7500)
	pos.z = math.random(30, 90)
	pped = player.get_player_ped(player.player_id())
	fire.add_explosion(pos, feat.value, true, false, 0, pped)
	system.wait(delay_beat)
	return HANDLER_CONTINUE
end
end)
heart_beat2.max = 74
heart_beat2.min = 0
heart_beat2.value = 0
local hb_delay = menu.add_feature("Exp delay", "value_i", globalFeatures.troll, function(feat)
delay_beat = tonumber(feat.value)
end)
hb_delay.max = 1000
hb_delay.min = 0
hb_delay.value = 0

function AudioAnnoyance(Snd, Aud)
local pos = v3()
for i = 0, 31 do
	pped = player.get_player_ped(i)
	local scid = player.get_player_scid(i)
	if (scid ~= -1 or scid ~= 4294967295 and pped ~= 0) then
		pos = entity.get_entity_coords(pped)
		audio.play_sound_frontend(-1, Snd, Aud, true)
		audio.play_sound_from_entity(-1, Snd, pped, Aud)
	end
end
		audio.play_sound_from_coord(-1, Snd, v3(-70.019515991211,-817.59228515625,326.17556762695), Aud, true, 10000, true)
--audio.play_sound_from_coord(-1, Snd, pos, Aud, true, 1000, true)
end

for i = 1, #SoundAnnoy do
local FeatID = string.format("Sound_ID" .. i)
FeatID = menu.add_feature(i .. ": " .. SoundAnnoy[i][1], "action", SoundAnnoyances, function(feat)
	local Snd, Aud
	Snd = tostring(SoundAnnoy[i][1])
	Aud = tostring(SoundAnnoy[i][2])
	AudioAnnoyance(Snd, Aud)
end)
end

local session_soundRape = function()
sndrape_00 = menu.add_feature("all Water Splashes", "action", globalFeatures.troll, function(feat)
	local pos = v3()
	for i = 0, 31 do
		pped = player.get_player_ped(i)
		local scid = player.get_player_scid(i)
		if (scid ~= -1 or scid ~= 4294967295 and i ~= player.player_id()) then
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
sndrape_01 = menu.add_feature("all Horn", "action", globalFeatures.troll, function(feat)
	local pos = v3()
	for i = 0, 31 do
		pped = player.get_player_ped(i)
		local scid = player.get_player_scid(i)
		if (scid ~= -1 or scid ~= 4294967295 and i ~= player.player_id()) then
			pos = entity.get_entity_coords(pped)
			audio.play_sound_from_entity(-1,  "HORN", pped, "DLC_Apt_Yacht_Ambient_Soundset", true)
			audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 1000000, false)
		end
	end
end)
local sndrape_02 = menu.add_feature("all Air Drop", "action", globalFeatures.troll, function(feat)
	local pos = v3()
	for i = 0, 31 do
		local scid = player.get_player_scid(i)
		if (scid ~= -1 or scid ~= 4294967295 and i ~= player.player_id()) then
			pped = player.get_player_ped(i)
			pos = entity.get_entity_coords(pped)
			audio.play_sound_from_entity(-1, "Air_Drop_Package", pped, "DLC_SM_Generic_Mission_Sounds", true)
		end
	end
end)
local sndrape_3 = menu.add_feature("all Explosion Countdown", "action", globalFeatures.troll, function(feat)
	local pos = v3()
	for i = 0, 31 do
		local scid = player.get_player_scid(i)
		if (scid ~= -1 or scid ~= 4294967295 and i ~= player.player_id()) then
			pped = player.get_player_ped(i)
			pos = entity.get_entity_coords(pped)
			audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 1000, false)
			audio.play_sound_from_entity(-1, "Explosion_Countdown", pped, "GTAO_FM_Events_Soundset", true)
		end
	end
end)
local sndrape_4 = menu.add_feature("Annoying sound! CANT BE UNDONE!", "action", globalFeatures.troll, function(feat)
	local pos = v3()
	for i = 0, 31 do
		local scid = player.get_player_scid(i)
		if (scid ~= -1 and i ~= player.player_id()) then
			pped = player.get_player_ped(i)
			pos = entity.get_entity_coords(pped)
			audio.play_sound_from_coord(-1, "Frontend_Beast_Frozen_Screen_Loop", pos, "FM_Events_Sasquatch_Sounds", true, 1000, false)
		end
	end
end)
local sndrape_1 = menu.add_feature("allBomb Armed", "value_i", globalFeatures.troll, function(feat)
	if feat.on then
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
sndrape_1.max = 1000
sndrape_1.min = 0
sndrape_1.mod = 5
local sndrape_2 = menu.add_feature("all Bomb Disarmed", "value_i", globalFeatures.troll, function(feat)
	if feat.on then
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
sndrape_2.max = 1000
sndrape_2.min = 0
sndrape_2.mod = 5
end
session_soundRape()
menu.add_feature("Illuminate Everyone", "action", globalFeatures.troll, function(feat)
for i = 0, 31 do
	pped = player.get_player_ped(i)
	if pped ~= 0 then
		local pos, offset, rot = v3(), v3(), v3()
		offset.x = 1.0
		offset.y = 0.1
		offset.z = -0.1
		rot.x = 1.0
		rot.y = 1.0
		rot.z = 1.0
		local bid = ped.get_ped_bone_index(pped, 65068)
		local hash = gameplay.get_hash_key("prop_dummy_light")
		spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, false)
		entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, false, false, false, 0, false)
		offset.x = 0.010
		offset.y = 0.01
		offset.z = 0.001
		rot.x = 1.0
		rot.y = 1.0
		rot.z = 1.0
		local hash = gameplay.get_hash_key("prop_air_lights_02a")
		spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, true)
		entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, false)
	end
end
return HANDLER_POP
end)
menu.add_feature("Everyone is a Dick Head!", "action", globalFeatures.troll, function(feat)
for i = 0, 31 do
	pped = player.get_player_ped(i)
	if pped ~= 0 then
		local pos, rot, offset = v3(), v3(), v3()
		offset.x = 0.08
		offset.y = 0.0
		offset.z = 0.0
		rot.x = 40
		rot.y = -83
		rot.z = -134
		local bid = ped.get_ped_bone_index(pped, 65068)
		local hash = gameplay.get_hash_key("v_res_d_dildo_f")
		spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, false)
		entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, true, 0, true)
	end
end
return HANDLER_POP
end)
menu.add_feature("Give all Dildo Dicks", "action", globalFeatures.troll, function(feat)
for i = 0, 31 do
	pped = player.get_player_ped(i)
	if pped ~= 0 then
		local pos, rot, offset = v3(), v3(), v3()
		offset.x = 0.0
		offset.y = 0.0
		offset.z = 0.0
		rot.x = 293.0
		rot.y = 28.0
		rot.z = 24.0
		local bid = ped.get_ped_bone_index(pped, 23553)
		local hash = gameplay.get_hash_key("v_res_d_dildo_f")
		spawned_cunts[#spawned_cunts + 1] = object.create_object(hash, pos, true, true)
		entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, true, 0, true)
	end
end
return HANDLER_POP
end)
local world_force = menu.add_feature("Apply force to world entities", "action",  globalFeatures.lobbyGrief, function(feat)
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
--TODO: Spawn Features
--spawn variables defaults

--TODO: Ped Spawn Features

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
print(escort[p])
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
-- streaming.set_model_as_no_longer_needed(hash)
end

function spawn_ped(pid, pedhash, offdist, attack, Posoff)
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
Ped_Haters[#Ped_Haters+1] = escort[p]
print(escort[p])
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
--	ped.set_ped_as_group_member(escort[p], Group_Hate)
--	ped.set_ped_never_leaves_group(escort[p], true)
	else
end
-- streaming.set_model_as_no_longer_needed(hash)
return escort[p]
end

function spawn_ped_v2(pid, pedhash, attack)
    local hash, parachute = pedhash, 0xfbab5776
    plygrp = player.get_player_group(pid)
    pped = player.get_player_ped(pid)
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
    local p = #escort + 1
    escort[p] = ped.create_ped(26, hash, pos + offset, 0, true, false)
    print(escort[p])
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
    if not attack == true then
        ped.set_ped_combat_attributes(escort[p], 1424, false)
        pedgroup = ped.get_ped_group(escort[p])
        ped.set_ped_as_group_member(escort[p], plygrp)
        pedgroup = ped.get_ped_group(escort[p])
        ped.set_ped_never_leaves_group(escort[p], true)
    else
end
    streaming.set_model_as_no_longer_needed(hash)
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
        offset = v3(-73.31681060791, -820.26013183594, 326.17517089844)
end
    escortveh[y] = vehicle.create_vehicle(hash, offset, player.get_player_heading(pid), true, false)
    print(escortveh[y])
    vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
    vehicle.get_vehicle_mod(escortveh[y], mod)
    vehicle.set_vehicle_mod(escortveh[y], mod, modvalue, false)
    BlipIDs[#BlipIDs + 1] = ui.add_blip_for_entity(escortveh[y])
    vehicle.set_vehicle_on_ground_properly(escortveh[y])
    entity.set_entity_god_mode(escortveh[y], true)
    vehicle.set_vehicle_doors_locked(escortveh[y], 5)
    network.request_control_of_entity(escortveh[y])
    -- streaming.set_model_as_no_longer_needed(hash)
    return escortveh[y]
end

--TODO: Spawn Cleanups

local Blip_Cleanup = menu.add_feature("Delete Blips Added", "action", globalFeatures.cleanup, function(feat)
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

local alk_cleanup = menu.add_feature("Delete alkonost lag Spawns", "action", globalFeatures.cleanup, function(feat)
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

local ped_cleanup = menu.add_feature("Delete Ped Spawns", "action", globalFeatures.cleanup, function(feat)
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


local pedveh_cleanup = menu.add_feature("Delete Ped Spawns + Vehicles", "action", globalFeatures.cleanup, function(feat)
spawn_cleanup()
end)

function spawn_cleanup()
if #escort == 0 or nil then return end
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
if #escortveh == 0 or nil then return end
for y = 1, #escortveh do
	network.request_control_of_entity(escortveh[y])
	entity.detach_entity(escortveh[y])
	entity.set_entity_coords_no_offset(escortveh[y], pos)
	entity.set_entity_as_no_longer_needed(escortveh[y])
	entity.delete_entity(escortveh[y])
end
if #lester == 0 or nil then return end
for i = 1, #lester do
	network.request_control_of_entity(lester[i])
	ped.clear_ped_tasks_immediately(lester[i])
	entity.set_entity_coords_no_offset(lester[i], pos)
	entity.set_entity_as_no_longer_needed(lester[i])
	entity.delete_entity(lester[i])
end
if #lesveh == 0 or nil then return end
for y = 1, #lesveh do
	network.request_control_of_entity(lesveh[y])
	entity.detach_entity(lesveh[y])
	entity.set_entity_coords_no_offset(lesveh[y], pos)
	entity.set_entity_as_no_longer_needed(lesveh[y])
	entity.delete_entity(lesveh[y])
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

local Freeze_obj = menu.add_feature("Freeze World Vehicles & Objects", "action",  globalFeatures.lobbyGrief, function(feat)
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


--TODO: CUNT DUMP

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

--TODO: Option Features
--[[
21	INPUT_Sprint	LEFT SHIFT			A
22	INPUT_JUMP		SPACEBAR			X
24	INPUT_ATTACK	LEFT MOUSE BUTTON	RT
25	INPUT_AIM		RIGHT MOUSE BUTTON	LT
]]

hud_comp = menu.add_feature("Show hud_comp", "value_i", globalFeatures.moistopt, function(feat)
    if feat.on then
        ui.show_hud_component_this_frame(feat.value)
        return HANDLER_CONTINUE
end
end)


hud_comp.max = 255
hud_comp.min = 0
local entity_control
OptionsVar.aim_control = menu.add_feature("DetonateVehicle Aiming@(LShift or PS:X XBC:A)", "toggle", globalFeatures.moistopt, function(feat)
	Settings["aimDetonate_control"] = true
	if feat.on then
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
OptionsVar.aim_control.on = Settings["aimDetonate_control"]
--TODO: Player Tracking
local pped1, femped1, pid2, pped2, name1, name2, text

function GetKiller(pid)
    if not Players[pid].isDead then

    pped1 = player.get_player_ped(pid)
  --  if player.is_player_female(pid) then
        femped1 = player.is_player_female(pid) and "Killed Her Self!" or "Killed Him Self!"
  --  end
    --  femped = femped and "Killed Her Self!" or "Killed Him Self!"
    name1 = tostring(player.get_player_name(pid))
    for pid2 = 0, 31 do
        pped2 = player.get_player_ped(pid2)
        name2 = tostring(player.get_player_name(pid2))
        if entity.has_entity_been_damaged_by_entity(pped1, pped2) then
            if player.is_player_god(pid2) then
                Players[pid2].PlayerGodMode = true
            end
            if pid == pid2 then
                text = tostring("Player: " .. name2 .. "\n" .. femped1)
                if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
                    if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
                    menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
                    end
                elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then
                    Debug_Out(text, false)
                    
                elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
                    
                    if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
                    menu.notify("Player: " .. name2 .. "\n" .. femped1, "Session Combat Tracker", 6, 0xffff00ff)
                    end
                    Debug_Out(text, false)
                    system.wait(0)
                    end
                elseif pid ~= pid2 then
                    text = tostring("Player: " .. name2 .. "\nKilled: " .. name1)
                    if Settings["Combat_Tracker_Notify"] and not Settings["Combat_Tracker_DebugLog"] then
                        if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
                        menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
                        end
                    elseif Settings["Combat_Tracker_DebugLog"] and not Settings["Combat_Tracker_Notify"] then  
                    Debug_Out(text, false)
                elseif Settings["Combat_Tracker_DebugLog"] and Settings["Combat_Tracker_Notify"] then
                    if Settings["Combat_Tracker_ON"] and Settings["Combat_Tracker_Notify"] then
                    menu.notify("Player: " .. name2 .. "\nKilled: " .. name1, "Session Combat Tracker", 6, 0xffff00ff)
                    end
                    Debug_Out(text, false)
                    system.wait(0)
                end
            end
        end
    end
end
end

PlyTrackCombat = menu.add_feature("Session Combat(Kill) Tracking", "value_str", globalFeatures.moistopt, function(feat)
    if not feat.on then

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
PlyTrackCombat:set_str_data({"Log","Notify","Log & Notify"})
PlyTrackCombat.on = Settings["Combat_Tracker_ON"]
PlyTrackCombat.value = Settings["Combat_Tracker_Value"]




PlyTrackDamage = menu.add_feature("Track all Players Damage", "toggle", globalFeatures.moistopt, function(feat)
	if feat.on then
	for pid1 = 0, 31 do
	pped1 = player.get_player_ped(pid1)
	name1 = tostring(player.get_player_name(pid1))
    system.wait(0)
	for pid2 = 0, 31 do
	pped2 = player.get_player_ped(pid2)
	name2 = tostring(player.get_player_name(pid2))
	if entity.has_entity_been_damaged_by_entity(pped1, pped2) then
	Players[pid1].isDamagedbY = name2
    system.wait(10)
	 end
	    system.wait(10)
		end
end
   system.wait(10)
return HANDLER_CONTINUE
end
end)
PlyTrackDamage.on = true

PlyTracker.track_all = menu.add_feature("Track all Players Speed", "toggle", globalFeatures.moistopt, function(feat)
	if feat.on then
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
PlyTracker.track_all.on = true
PlyTracker.track_all.hidden = true
--TODO: OSD STUFF

--TODO: V1.40 Functions
OldVersion_stuff = menu.add_feature("V1.40 Functions", "parent", globalFeatures.moistopt).id
spec_osd = menu.add_feature("Spectate OSD", "toggle", OldVersion_stuff, function(feat)
    if not feat.on then
        Settings["spec_osd"] = false
        return HANDLER_POP
    end
    Settings["spec_osd"] = true
	local pos = v2()
	pos.x = 0.10
	pos.y = .05
	
	for pid = 0, 31 do
	if --[[pid ~= player.player_id() and]] player.is_player_valid(pid) then
	if player.is_player_spectating(pid) and player.is_player_playing(pid) and interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
	local target = network.get_player_player_is_spectating(pid)
	local name, targetname
	name = ("~r~~h~" .. (tostring(player.get_player_name(pid))))
	targetname = ("~h~~g~" .. (tostring(player.get_player_name(target))))
	pos.y = pos.y + 0.05
	if Players[pid].isint == true then
	ui.set_text_scale(0.255)
	ui.set_text_font(0)
	ui.set_text_color(255, 255, 255, 255)
	ui.set_text_centre(0)
	ui.set_text_outline(1)
	
	ui.draw_text("~h~~r~Modded~y~ Specate:", pos)
		ui.set_text_scale(0.255)
	ui.set_text_font(0)
	ui.set_text_color(255, 255, 255, 255)
	ui.set_text_centre(0)
	ui.set_text_outline(1)
	pos.x = 0.30
	ui.draw_text(" ~b~ " ..(tostring(name)) .. " ~w~Spectating: ", pos)
		ui.set_text_scale(0.255)
	ui.set_text_font(0)
	ui.set_text_color(255, 255, 255, 255)
	ui.set_text_centre(0)
	ui.set_text_outline(1)
	pos.x = 0.50
	
	ui.draw_text(" " .. (tostring(targetname)), pos)
	elseif Players[pid].isint ~= true then
	ui.set_text_scale(0.255)
	ui.set_text_font(0)
	ui.set_text_color(255, 255, 255, 255)
	ui.set_text_centre(0)
	ui.set_text_outline(1)
	ui.draw_text("~h~~g~Player~b~ Specate: " .. (tostring(name)) .. " ~w~Spectating: " .. (tostring(targetname)), pos)
	end
	end
	end
	end
	return HANDLER_CONTINUE
	
end)
spec_osd.on = Settings["spec_osd"]


local barvar1, barvar2, barsize, val,  RpM  = 0, 255, 0, 0, 0.0

intexperiments = menu.add_feature("Experimental Interior Shit", "parent", globalFeatures.moist_test.id)

theforce = menu.add_feature("Experimental Force Control", "parent", globalFeatures.moist_test.id)

ForceSpin = menu.add_feature("Self Spin", "toggle", theforce.id, function(feat)
	if feat.on then
	entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 5, 200.0000001, 8207.00, 89207.8207, 10.0, 10.00, 100.0, 10000.0, false, true)
	return HANDLER_CONTINUE
	end
end)

ForceSpin = menu.add_feature("Create Random Cops", "toggle", globalFeatures.moist_test.id, function(feat)
	if feat.on then
	ped.set_create_random_cops(true)
system.wait(50000)
	return HANDLER_CONTINUE
	end
end)

RefreshPlayerInterior = menu.add_feature("Refresh Interior: ", "action_value_str", intexperiments.id, function(feat)

			local pped = player.get_player_ped(feat.value)
			local offset = v3()
			local pedbool, pos = ped.get_ped_bone_coords(pped, 11816, offset)
			
			local ped_int = interior.get_interior_from_entity(pped)
			moist_notify("Interior from Players Ped: ".. ped_int .. "\n" .. tostring(pos), "Interior Details & Refresh")
			interior.refresh_interior(ped_int)
end)
RefreshPlayerInterior:set_str_data(Playerz)
RefreshPlayerInterior.value = -1

interiorcheckbytype = menu.add_feature("InteriorCheck: ", "action_value_str", globalFeatures.moist_test.id, function(feat)
	
	Getinterior(feat.value)
local interior, intname, pos, id = GetPlayerinterior(feat.value)
while interior ~= true or interior ~=  false do
	system.wait(10)
end

moist_notify("Found Interior = " .. tostring(interior) .. "\nInterior Name = " .. intname .. "\nPos v3(" .. pos .. ")", nil)

	
end)
interiorcheckbytype:set_str_data(Playerz)
-- toilet = 0
-- update_ent =  menu.add_feature("Update Toiler", "toggle",  globalFeatures.moist_test.id, function(feat)


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

local contrllabel = {"LS_AXIS_X","LS_AXIS_Y","RS_AXIS_X","RS_AXIS_Y","TRIGGER_LT","TRIGGER_RT","TopTrigger_LB","TopTrigger_RB"}
local controlID = {195,196,197,198,207,208,205,206}

--TODO: INPUTCONTROL VELOSITY
Control_Force = menu.add_feature("Control Input Apply Force", "toggle", globalFeatures.moist_test.id, function(feat)
	if feat.on then
	local pid = player.player_id()
	local pped = player.get_player_ped(pid)
	local pos = player.get_player_coords(pid)
	local rot = entity.get_entity_rotation(pped)
	local camrot = cam.get_gameplay_cam_rot()
	local dir = rot

	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	
	
	

	local value, rotvalue = v3(), v3()
	
	value.x = controls.get_control_normal(-1, controlID[1]) * 100
	value.y = controls.get_control_normal(-1, controlID[2]) * 100
	rotvalue.x = controls.get_control_normal(-1, controlID[3]) * 100
	rotvalue.y = controls.get_control_normal(-1, controlID[4]) * 100
	if controls.get_control_normal(-1, controlID[5]) ~= 0.0 then
	value.z = tonumber("-" ..controls.get_control_normal(-1, controlID[5]) *100)
	elseif controls.get_control_normal(-1, controlID[6])  ~= 0.0 then
	
	value.z = math.floor(controls.get_control_normal(-1, controlID[6])* 100)
	end
	if controls.get_control_normal(-1, controlID[7]) ~= 0.0 then
	rotvalue.z = tonumber("-" ..controls.get_control_normal(-1, controlID[7]) *100)
	elseif controls.get_control_normal(-1, controlID[8])  ~= 0.0 then
	
	rotvalue.z = math.floor(controls.get_control_normal(-1, controlID[8])* 100)
	end
	
	--	ui.draw_rect(0.003, 0.70, 0.073, 0.038, 0, 0, 0, 200)
		ui.set_text_scale(0.235)
		ui.set_text_font(0)
		ui.set_text_outline(true)
		
	ui.draw_text(tostring(value.x) .. " " .. tostring(value.y) .. " " .. tostring(value.z) .. "\n" .. tostring(rotvalue.x) .. " " .. tostring(rotvalue.y) .. " " .. tostring(rotvalue.z), v2(0.03, 0.70))
	entity.set_entity_rotation(pped, camrot)
		--entity.set_entity_velocity(player.get_player_ped(player.player_id()), v3(value.x, value.y, value.z))
		--apply_force_to_entity(Ped ped, int forceType, float x, float y, float z, float rx, float ry, float rz, bool isRel, bool highForce)
		--entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 5, controls.get_control_normal(-1, controlID[1]), controls.get_control_normal(-1, controlID[2]),  value.z, controls.get_control_normal(-1, controlID[3]), controls.get_control_normal(-1, controlID[4]), rotvalue.z, true)
			entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 1, value.x, value.y, value.z, rotvalue.x, rotvalue.y, rotvalue.z, true)
	
	return HANDLER_CONTINUE
	end
end)
Control_Force.on = false
Control_Force.hidden = true
Control_Velo = menu.add_feature("Control Input velocity", "toggle", globalFeatures.moist_test.id, function(feat)
	if feat.on then
	local pid = player.player_id()
	local pped = player.get_player_ped(pid)
	local pos = player.get_player_coords(pid)
	local rot = entity.get_entity_rotation(pped)
	local camrot = cam.get_gameplay_cam_rot()
	local dir = rot

	dir:transformRotToDir()
	dir = dir * 4
	pos = pos + dir
	
	
	

	local value = v3()
	
	value.x = controls.get_control_normal(-1, controlID[1]) * 100
	value.y = controls.get_control_normal(-1, controlID[2]) * 100
		local rad = math.rad(180)
		RootPos = player.get_player_coords(pid)
		local x = value.x*math.cos(rad) + value.x
		local y = value.y*math.sin(rad) + value.y
		value.x = tonumber(x)
		value.y = tonumber(y)
	if controls.get_control_normal(-1, controlID[5]) ~= 0.0 then
	value.z = tonumber("-" ..controls.get_control_normal(-1, controlID[5]) *100)
	elseif controls.get_control_normal(-1, controlID[6])  ~= 0.0 then
	
	value.z = math.floor(controls.get_control_normal(-1, controlID[6])* 100)
	end
	
	--	ui.draw_rect(0.003, 0.70, 0.073, 0.038, 0, 0, 0, 200)
		ui.set_text_scale(0.235)
		ui.set_text_font(0)
		ui.set_text_outline(true)
		
	ui.draw_text(tostring(value.x) .. " " .. tostring(value.y) .. " " .. tostring(value.z), v2(0.03, 0.70))
	entity.set_entity_rotation(pped, camrot)
		entity.set_entity_velocity(player.get_player_ped(player.player_id()), value)
		--apply_force_to_entity(Ped ped, int forceType, float x, float y, float z, float rx, float ry, float rz, bool isRel, bool highForce)
		--entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 5, controls.get_control_normal(-1, controlID[1]), controls.get_control_normal(-1, controlID[2]),  value.z, controls.get_control_normal(-1, controlID[3]), controls.get_control_normal(-1, controlID[4]), rotvalue.z, true)
			--entity.apply_force_to_entity(player.get_player_ped(player.player_id()), 1, value.x, value.y, value.z, rotvalue.x, rotvalue.y, rotvalue.z, true)
	
	return HANDLER_CONTINUE
	end
end)
Control_Velo.on = false
Control_Velo.hidden = true
--TODO: Input Control Coordinate System

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



Control_POS = menu.add_feature("Control Input Position", "toggle", globalFeatures.moist_test.id, function(feat)
	if feat.on and not player.is_player_in_any_vehicle(player.player_id()) then
	local pid = player.player_id()
	local x, y, z
	local Entity
	-- if player.is_player_in_any_vehicle(player.player_id()) then
	-- Entity = player.get_player_vehicle(player.player_id())
	-- else 
	Entity = player.get_player_ped(player.player_id())
	--end
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
	-- if player.is_player_in_any_vehicle(player.player_id()) then
	-- vehicle.set_vehicle_on_ground_properly(Entity)
	 end
	--end
	if controls.get_control_normal(-1, controlID[2]) ~= 0.0 then
	y = tostring(controls.get_control_normal(-1, controlID[2]) or 0.01)
	if y:sub(1, 1) == "-" then
	y = y:sub(2, 10)
	elseif y:sub(1, 1) ~= "-" then
	y = tostring("-" .. y)
	end
	
	pos = get_ctrl_coords(pid, tonumber(y), 180)
	entity.set_entity_coords_no_offset(Entity, pos)
	-- if player.is_player_in_any_vehicle(player.player_id()) then
	-- vehicle.set_vehicle_on_ground_properly(Entity)
	-- end
	end
	--if not player.is_player_in_any_vehicle(player.player_id()) then
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
	--end
	--if not player.is_player_in_any_vehicle(player.player_id()) then
	entity.set_entity_rotation(Entity, camrot)
	-- if player.is_player_in_any_vehicle(player.player_id()) then
	-- vehicle.set_vehicle_on_ground_properly(Entity)
	-- end
	--end


	return HANDLER_CONTINUE
	end
end)
Control_POS.on = false
-- Control_POS.max = 100
-- Control_POS.min = 1
-- Control_POS.value = 1

	

OSD_Control_Meter1 = menu.add_feature("Control Input Gauge", "value_str", globalFeatures.moist_test.id, function(feat)
	if feat.on then
	local ID = feat.value + 1
	local value = controls.get_control_normal(-1, controlID[ID])
	--controls.set_control_normal(-1, controlID[ID], 0.00000001)
		ui.draw_rect(0.0165, 0.70, 0.030, 0.12, 0, 0, 0, 200)
	ui.draw_text(tostring(value), v2(0.03, 0.70))
			--draw_rect(float x, float y, float width, float height, int r, int g, int b, int a)	
				ui.draw_rect(0.0178, 0.70, 0.0220, tonumber(value / 10), 255, 0, 0, 255)
				--ui.draw_rect(0.006, 0.70, 0.065, value, barvar01, barvar02, 0, value)
	
	
	return HANDLER_CONTINUE
	end
end)
OSD_Control_Meter1:set_str_data(contrllabel)


OSD_Veh_Meter = menu.add_feature("Vehicle RPM Gauge", "toggle", Vehicle_Control, function(feat)
	if feat.on then
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
OSD_Veh_Meter.on = false
OSD_Veh_Meter.hidden = false


--TODO: Speed Tracking
OSD.modvehspeed_osd = menu.add_feature("High Player Speed OSD", "toggle", globalFeatures.moistopt, function(feat)
	Settings["OSD.modvehspeed_osd"] = true
	if feat.on then
		for i = 1, 31 do
			if tracking.playerped_speed1[i + 1] > 325 then
				OSD.mod_vehspeed_osd.on = true
				system.yield(13000)
				else
				OSD.mod_vehspeed_osd.on = false
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["OSD.modvehspeed_osd"] = false
	return HANDLER_POP
end)
OSD.modvehspeed_osd.on = Settings["OSD.modvehspeed_osd"]

OSD.mod_vehspeed_osd = menu.add_feature("High Player Speed OSD", "toggle", globalFeatures.moistopt, function(feat)
	if feat.on then
		local pos = v2()
		pos.x = 0.001
		pos.y = .0300
		local name
		for i = 0, 31 do
			if player.get_player_ped(i) ~= 0 and not Players[i].isint then
				pos.x = 0.001
				if tracking.playerped_speed1[i + 1] > 325 then
					name = player.get_player_name(i)
					ui.set_text_scale(0.235)
					ui.set_text_font(0)
					ui.set_text_color(255, 0, 0, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("HighSpeed: ", pos)
					pos.x = 0.035
					ui.set_text_scale(0.235)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text(name, pos)
					pos.x = 0.089
					ui.set_text_scale(0.235)
					ui.set_text_font(0)
					ui.set_text_color(0, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text(" <" .. tracking.playerped_speed1[i + 1] .. ">", pos)
					pos.y = pos.y + 0.040
				end
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
OSD.mod_vehspeed_osd.on = false
OSD.mod_vehspeed_osd.hidden = true

--TODO: v3 Self info on position rotation direction heading and cam rotation

POS_OSD = menu.add_feature("My v3 OSD Info", "toggle", globalFeatures.moistopt, function(feat)
	if feat.on then
		local pos = v2()
		pos.x = 0.001
		pos.y = .0350
        local MyPed, MyDir, MyPos, MyRot, Myheading
        MyPed = player.get_player_ped(player.player_id()) 
        MyRot = entity.get_entity_rotation(MyPed)
        MyPos = player.get_player_coords(player.player_id())
        Myheading = player.get_player_heading(player.player_id())
		CamROT =  cam.get_gameplay_cam_rot()
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
                    pos.y = .0450
                    ui.set_text_scale(0.20)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("ROT: " .. tostring(MyRot), pos)
                    pos.x = 0.001
                    pos.y = .0550
                    ui.set_text_scale(0.20)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("Heading: " .. tostring(Myheading), pos)
                    pos.x = 0.001
                    pos.y = .0650
                    ui.set_text_scale(0.20)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("Direction: " .. tostring(MyDir), pos)
					pos.x = 0.001
                    pos.y = .0750
                    ui.set_text_scale(0.20)
					ui.set_text_font(0)
					ui.set_text_color(255, 255, 255, 255)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text("CamROT: " .. tostring(CamROT), pos)

		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
POS_OSD.on = false
POS_OSD.hidden = false


function TakeHost(pid)
	script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
end

local PCR, PCG, PCB, PCA
local PCR1, PCG1, PCB1, PCA1 = 255, 255, 255, 255
local PCR2, PCG2, PCB2, PCA2 = 0, 0, 0, 255

-- playerpulse = menu.add_feature("Pulse PlayerBar Names", "value_i", globalFeatures.moistopt, function(feat)
	-- if feat.on then
	
		-- for pid = 0, 31 do
			-- if player.is_player_valid(pid) then
				-- pped = player.get_player_ped(pid)
				-- if Players[pid].isint then
					-- goto next
				-- end
					-- if interior.get_interior_from_entity(pped) == 0 or Players[pid].isint == false then
					-- system.wait(feat.value)
					-- Players[pid].pulse = true
					-- system.wait(feat.value)
					-- Players[pid].pulse = false
					-- system.wait(feat.value)
				-- end
				  -- system.wait(feat.value)
			-- end
			-- ::next::
		-- end
		-- return HANDLER_CONTINUE
	-- end
	-- return HANDLER_POP
-- end)
-- playerpulse.on = false
-- playerpulse.max = 800
-- playerpulse.min = 200
-- playerpulse.value = 500
-- playerpulse.mod = 1
Pulse_RGB_R, Pulse_RGB_G, Pulse_RGB_B = 255, 255, 255
playerpulse = menu.add_feature("Pulse PlayerBar GodNames", "value_i", globalFeatures.moistopt, function(feat)
	if feat.on then
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
playerpulse.on = false
playerpulse.max = 500
playerpulse.min = 1
playerpulse.value = 15



notifysent = {}
--TODO: PLAYERBAR
OSD.Player_bar = menu.add_feature("Player Bar OSD", "toggle", globalFeatures.moistopt, function(feat)
	Settings["OSD.Player_bar"] = true
	if feat.on then
		ui.draw_rect(0.001, 0.001, 2.5, 0.075, 0, 0, 0, 225)
		local pos = v2()
		pos.x = 0.0001
		pos.y = 0.000001
		for pid = 0, 31 do
			pped = player.get_player_ped(pid)
			local i = pid
			local name, scid = SessionPlayers[pid].Name, SessionPlayers[pid].Scid
			if scid ~= 4294967295 and name ~= nil then
				local PlayerName = SessionPlayers[pid].Name
				PCR, PCG, PCB, PCA = 255, 255, 255, 255
				if player.is_player_god(i) and player.is_player_vehicle_god(i) and Players[pid].isint == true then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 185
						else
						PCR, PCG, PCB, PCA = 255, 0, 255, 185
					end
				end
				if player.is_player_god(i) and player.is_player_vehicle_god(i) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, Pulse_RGB_R, 255
						else
						PCR, PCG, PCB, PCA = 255, 0, 255, 200
					end
				end
				if player.is_player_vehicle_god(i) and not player.is_player_god(i) and Players[pid].isint == true then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA =  Pulse_RGB_R, Pulse_RGB_G, 0, 185
						else
						PCR, PCG, PCB, PCA = 255, 170, 0, 185
					end
				end
				if player.is_player_vehicle_god(i) and not player.is_player_god(i) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA =  Pulse_RGB_R, Pulse_RGB_G, 0, 255
						else
						PCR, PCG, PCB, PCA = 255, 170, 0, 200
					end
				end
				if player.is_player_god(i) and not player.is_player_vehicle_god(i) and Players[pid].isint == true then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, 0, 185
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 185
					end
				end
				if player.is_player_god(i) and not player.is_player_vehicle_god(i) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_R, 0, 0, 255
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 200
					end
				end
				if not NewDLC() then
				if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) and Players[pid].isint == true and player.is_player_god(i) then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 200
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 200
					end
				end
				if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) and Players[pid].isint == false and player.is_player_god(i) then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = Pulse_RGB_B, Pulse_RGB_R, Pulse_RGB_B, 255
						else
						PCR, PCG, PCB, PCA = 255, 0, 0, 255
					end
				end
				if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1) and Players[pid].isint == false then
					if  Players[pid].pulse then
						PCR, PCG, PCB, PCA = 0, Pulse_RGB_R, 0, 255
						else
						PCR, PCG, PCB, PCA = 255, 255, 255, 255
					end
				end
				if Players[i].isPassive then
					PCA = 150
				elseif not Players[i].isPassive then
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
				if pos.x > 0.95 then
					pos.y = .015
					pos.x = 0.0001
				end
				ui.set_text_color(PCR, PCG, PCB, PCA)
				if pos.x > 0.95 then
					pos.y = .015
					pos.x = 0.0001
					else
				end
				ui.set_text_scale(0.175)
				ui.set_text_font(0)
				ui.set_text_centre(false)
				ui.set_text_outline(true)
				ui.draw_text(PlayerName .. " ", pos)
				pos.x = pos.x + 0.0652
			end
		end
		return HANDLER_CONTINUE
	end
	Settings["OSD.Player_bar"] = false
	return HANDLER_POP
end)
OSD.Player_bar.on = Settings["OSD.Player_bar"]

--TODO: -------- Moist Tools

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
OSD_Debug = menu.add_feature("Debug OSD", "toggle", globalFeatures.moist_tools.id, function(feat)
	if feat.on then
		ScreenText2 = ' ` â€Ÿ '
		ui.draw_rect(0.001, 0.090, 2.0, 0.075, 0, 0, 0, 125)
		--	ui.draw_rect(.38, .006, 0.250, 0.100, 0, 0, 0, 100)
		local pos = v2()
		pos.x = .5
		pos.y = 0.06
		ui.set_text_scale(0.40)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		ui.draw_text(Screen_Text, pos)
		pos.x = .5
		pos.y = 0.06
		ui.set_text_scale(0.40)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
OSD_Debug.on = false
OSD_Debug.hidden = false
Screen_TeXt, Screen_Text = "", ""
Debug_Font = false
local DebugThreads = {}
function OSD_Debug_text(Text)
	text = Text
	DebugThreads[#DebugThreads + 1] = menu.create_thread(OSD_Debug_text_thread, {text = Text})
end
function OSD_Debug_text_thread(context)
	function updateosd_text(text, append)
		if append then
			Screen_Text = ScreenText .."\n"
			Screen_Text = string.format(Screen_Text .." : " ..text)
		end
		if not append then
			Screen_Text = " "
			Screen_Text = text
		end
	end
	function Text_thread(msg)
		local TeXt = msg or "These Functions are Experimental use at your own risk"
		local ScreenTe_Xt = ""
		updateosd_text(msg, false)
		OSD_Debug.on = true
		if not Debug_Font then
			system.wait(4500)
			OSD_Debug.on = false
		end
		local idx, idx2 = 0, 0
		while OSD_Debug.on and Debug_Font do
			idx = idx + 1
			ScreenTe_Xt = TeXt:sub(1, idx)
			updateosd_text(ScreenTe_Xt, false)
			idx2 = idx2 + 1
			if idx > #TeXt then
				idx = 0
				system.wait(50)
				elseif idx2 == 95 then
				idx2 = 0
				OSD_Debug.on = false
			end
			system.wait(35)
		end
		system.wait(30000)
		OSD_Debug.on = false
	end
	Text_thread(context.text)
end
OSD1_Debug = menu.add_feature("Debug OSD", "toggle", globalFeatures.moist_tools.id, function(feat)
	if feat.on then
		ScreenText2 = ' ` â€Ÿ '
		ui.draw_rect(0.001, 0.090, 2.0, 0.075, 0, 0, 0, 125)
		--	ui.draw_rect(.38, .006, 0.250, 0.100, 0, 0, 0, 100)
		local pos = v2()
		pos.x = .5
		pos.y = 0.06
		ui.set_text_scale(0.40)
		ui.set_text_font(2)
		ui.set_text_color(255, 80, 80, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		ui.draw_text(Screen_Text, pos)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
OSD1_Debug.on = false
OSD1_Debug.hidden = false
OSD2_Debug = menu.add_feature("Debug OSD", "toggle", globalFeatures.moist_tools.id, function(feat)
	if feat.on then
		ui.draw_rect(0.001, 0.090, 2.0, 0.075, 0, 0, 0, 125)
		--	ui.draw_rect(.38, .006, 0.250, 0.100, 0, 0, 0, 100)
		local osdPos = v2(.5,0.06)
		ui.set_text_scale(0.40)
		ui.set_text_font(0)
		ui.set_text_color(255, 80, 80, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		ui.draw_text(Screen_Text, osdPos)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
OSD2_Debug.on = false
OSD2_Debug.hidden = false

OSD.date_time_OSD = menu.add_feature("Date & Time OSD", "toggle", globalFeatures.moistopt, function(feat)
	Settings["osd_date_time"] = true
	while feat.on do
		local pos = v2()
		local d = os.date()
		local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dt = os.date("%d/%m/%y%y")
		pos.x = .5
		pos.y =  0.0395
		local d = os.date()
		local dtime = os.date("%a %d %b %I:%M:%S: %p")
		-- local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dt = os.date("%d/%m/%y%y")
		local osd_Cur_Time = (string.format(dtime))
		ui.set_text_scale(0.175)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		ui.draw_text(osd_Cur_Time, pos)
		pos.x = .5
		pos.y =  0.0375
		local d = os.date()
		--    local dtime = string.match(d, "%d%d:%d%d:%d%d")
		local dtime = os.date("%a %d %b %I:%M:%S: %p")
		local osd_Cur_Time = (string.format(dtime))
		ui.set_text_scale(0.18)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		ui.draw_text(osd_Cur_Time, pos)
		return HANDLER_CONTINUE
	end
	Settings["osd_date_time"] = false
	return HANDLER_POP
end)
OSD.date_time_OSD.on = Settings["osd_date_time"]
OSD.osd_My_speed1 = menu.add_feature("Show My Speed in Kmph", "toggle", globalFeatures.moistopt, function(feat)
	Settings["osd_My_speed1"] = true
	while feat.on do
		local pos = v2()
		pos.x = .950
		pos.y =  0.0600001
		local ent, estmax, vehmax, veh_max
		veh_max = "00.00"
		local ent1 = player.get_player_ped(player.player_id())
		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
		local speed = entity.get_entity_speed(ent)
		local speedcalc = speed * 3.6 --kmph
		local speedcalcm =  speed * 2.236936 --mph
		myspeed1 = RoundNum(speedcalc, 2)
		myspeed2 = math.ceil(speedcalcm)
		
		if player.is_player_in_any_vehicle(player.player_id()) then
		estmax = vehicle.get_vehicle_estimated_max_speed(player.get_player_vehicle(player.player_id()))
		vehmax = RoundNum(estmax * 2.236936, 2)
		end
		vehmax = vehmax or veh_max
		ui.set_text_scale(0.22)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text(myspeed1   .. " / " ..  vehmax .."\nkmph" , pos)
		pos.x = .951
		pos.y =  0.060002
		ui.set_text_scale(0.22)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(false)
		ui.set_text_outline(1)
		ui.draw_text(myspeed1   .. " / " ..  vehmax .."\nkmph" , pos)
		return HANDLER_CONTINUE
	end
	Settings["osd_My_speed1"] = false
	return HANDLER_POP
end)
OSD.osd_My_speed1.on = Settings["osd_My_speed1"]

function frames()
	local fps1, fps2
	 
	fps1 = gameplay.get_frame_count()
	local time = utils.time_ms() + 1000
	if time >= utils.time_ms() then
	 fps2 = gameplay.get_frame_count()
	end

	return  tonumber(fps2 - fps1)
end


--TODO: MyVeh OSD!
OSD.osd_My_speed2 = menu.add_feature("Show My Speed in Mph", "toggle", globalFeatures.moistopt, function(feat)
	Settings["osd_My_speed2"] = true
	while feat.on do
		local pos = v2()
		pos.x = .945
		pos.y =  0.0600001
		local ent, estmax, vehmax
		vehmax = RoundNum(0.0, 2)
		local ent1 = player.get_player_ped(player.player_id())
		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
		local speed = entity.get_entity_speed(ent)
		local speedcalc = speed * 3.6 --kmph
		local speedcalcm =  speed * 2.236936 --mph
		myspeed1 = math.ceil(speedcalc)
		myspeed2 = RoundNum(speedcalcm, 2)
		if player.is_player_in_any_vehicle(player.player_id()) then
		estmax = vehicle.get_vehicle_estimated_max_speed(player.get_player_vehicle(player.player_id()))
		vehmax = RoundNum(estmax * 2.236936, 2)
		end		
		ui.set_text_scale(0.22)
		ui.set_text_font(0)
		ui.set_text_color(0, 0, 0, 255)
		ui.set_text_centre(1)
		ui.set_text_outline(1)	
		ui.draw_text(myspeed2 .. " / " ..  vehmax .."\nmph", pos)
		pos.x = .946
		pos.y =  0.0600002
		ui.set_text_scale(0.22)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(1)
		ui.set_text_outline(1)
		ui.draw_text(myspeed2 .. " / " ..  vehmax .."\nmph", pos)
		
		-- local gear_Text1 = tostring("~h~~r~Gears:\n" .. "~w~~h~Now: " .. MyvehControl["MyGearNow"].. "\nNext: " .. MyvehControl["MyNextGear"] .. "\nMax:" .. MyvehControl["MyMaxGear"] .. "\nRatio: " .. MyvehControl["MyGearRatio"])
		-- local gear_Text2 = tostring("Gears:\n" .. "Now: " .. MyvehControl["MyGearNow"].. "\nNext: " .. MyvehControl["MyNextGear"] .. "\nMax: " .. MyvehControl["MyMaxGear"] .. "\nRatio: " .. MyvehControl["MyGearRatio"])
		-- pos.x = .970
		-- pos.y =  0.0750001
		-- ui.set_text_scale(0.18)
		-- ui.set_text_font(0)
		-- ui.set_text_color(0, 0, 0, 255)
		-- ui.set_text_centre(false)
		-- ui.set_text_outline(1)
		-- ui.draw_text(gear_Text2, pos)
		-- pos.x = .971
		-- pos.y =  0.0750002
		-- ui.set_text_scale(0.18)
		-- ui.set_text_font(0)
		-- ui.set_text_color(255, 255, 255, 255)
		-- ui.set_text_centre(false)
		-- ui.set_text_outline(1)
		-- ui.draw_text(gear_Text1, pos)
		
		return HANDLER_CONTINUE
	end
	Settings["osd_My_speed2"] = false
	return HANDLER_POP
end)
OSD.osd_My_speed2.on = Settings["osd_My_speed2"]
function SpamNotifyClear()
	local notifycount = ui.get_current_notification()
	for i = 0, notifycount do
		ui.remove_notification(i)
	end
end
--TODO: Player Ped Weapons
local weap, weaponz
weap = {}
weaponz = {
}
function getwephashes()
	weap =  weapon.get_all_weapon_hashes()
	for i = 1, #weap do
		weaponz[i] = {weap[i], weapon.get_weapon_name(weap[i])}
	end
	weaponz[#weaponz + 1] = {1305664598, "Smoke GrenadeLauncher"}
end
getwephashes()
function give_weapon()
	for i = 1, #weaponz do
		local wid = weaponz[i][1]
		wid = menu.add_feature("Give: " .. weaponz[i][2], "action", globalFeatures.self_wep, function(feat)
			pped = player.get_player_ped(player.player_id())
			weapon.give_delayed_weapon_to_ped(player.get_player_ped(player.player_id()), weaponz[i][1], 1, 1)
			weapon.set_ped_ammo(player.get_player_ped(player.player_id()), weaponz[i][1], 1000000)
			weapon.give_delayed_weapon_to_ped(pped, weaponz[i][1], 1, 1)
			weapon.set_ped_ammo(pped, weaponz[i][1], 1000000)
end)
	end
end
give_weapon()
--TODO: RPG
local wephash, PedWeapon, wepammo	
	
function GiveWeaponTo(pid, hash, now)
	local pped = player.get_player_ped(pid)
	if not weapon.has_ped_got_weapon(pped, hash) then
	weapon.give_delayed_weapon_to_ped(pped, hash, 0, now)
	weapon.set_ped_ammo(pped, hash, 2000)
	elseif weapon.has_ped_got_weapon(pped, hash) then
	weapon.set_ped_ammo(pped, hash, 2000)
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
--TODO: Self Teleport using Interior locations LUA
local teleto = {}
function interiornames()
	for i = 1, #onlineinteriors do
	teleto[#teleto+1] = onlineinteriors[i][1]:sub(1, 13)
end
end
interiornames()



TeleSelf = menu.add_feature("Teleport: ", "action_value_str", globalFeatures.self_options, function(feat)
	
		local pos = v3()
	pos = onlineinteriors[feat.value+1][2]
	--heading = 136.27784729004
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	--entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
	return HANDLER_POP
end)
TeleSelf:set_str_data(teleto)

--TODO: ------- Custom Crosshair -------

targetdot = menu.add_feature("Target Dot 1", "toggle", globalFeatures.self_options, function(feat)
	if feat.on
		then
		
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
targetdot.on = false

targetdot1 = menu.add_feature("Target Dot 2", "toggle",  globalFeatures.self_options, function(feat)
	if not feat.on then
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
targetdot1.on = Settings["Weapon_TargetDot"] 

local test1 = menu.add_feature("screentest y", "value_f",  globalFeatures.self_options, function(feat)
	if feat.on then
	local p = 0.01
	local pos = v2()
		local offset = v2(0.10,0.0)
	pos.x = 0.00
	pos.y = 0.5
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
test1.on = false
test1.hidden = true
test1.max = 1.0
test1.min = 0.0
test1.value = 0.01
test1.mod = 0.01

local test2 = menu.add_feature("screentest x", "value_f",  globalFeatures.self_options, function(feat)
	if feat.on then
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
test2.on = false
test2.hidden = true
test2.max = 1.0
test2.min = 0.0
test2.value = 0.01
test2.mod = 0.01

targetdot2 = menu.add_feature("Target Dot 3", "toggle",  globalFeatures.self_options, function(feat)
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
targetdot2.on = false



local RPG_HOTFIRE = menu.add_feature("Rapid RPG Switch", "value_str", globalFeatures.self_options, function(feat)
    Settings["RPG_HOTFIRE"] = true
	local pped = player.get_player_ped(player.player_id())
	if feat.on then
	if player.is_player_in_any_vehicle(player.player_id()) ~= true or ped.is_ped_in_any_vehicle(pped) ~= true then
	      local status, err = pcall(GiveWeaponTo, player.player_id(), 2982836145, false)
        if not status then
         --   print(tostring(status) .. " Function Error " .. tostring(err))
            moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
        end
        local status, err = pcall(GiveWeaponTo, player.player_id(), 1752584910, false)
        if not status then
         --   print(tostring(status) .. " Function Error " .. tostring(err))
            moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
        end

        if feat.value == 0 then

            if ped.is_ped_shooting(pped) and ped.get_current_ped_weapon(pped) == 2982836145 then
                local status, err = pcall(RemoveWeaponFrom, player.player_id(), 2982836145)
                if not status then
               --     print(tostring(status) .. " Function Error " .. tostring(err))
                    moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
                end

                local status, err = pcall(GiveWeaponTo, player.player_id(), 2982836145, true)
                if not status then
                --    print(tostring(status) .. " Function Error " .. tostring(err))
                    moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
                end
                return HANDLER_CONTINUE
            end

        elseif feat.value == 1 then

            if ped.is_ped_shooting(pped) and ped.get_current_ped_weapon(pped) == 1752584910 then
                local status, err = pcall(RemoveWeaponFrom, player.player_id(), 1752584910)
                if not status then
                --    print(tostring(status) .. " Function Error " .. tostring(err))
                    moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")
                end

                local status, err = pcall(GiveWeaponTo, player.player_id(), 1752584910, true)
                if not status then
                --    print(tostring(status) .. " Function Error " .. tostring(err))
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
RPG_HOTFIRE:set_str_data({"Standard RPG","Special RPG"})
RPG_HOTFIRE.on = Settings["RPG_HOTFIRE"]


local WeaponFastSwitch = menu.add_feature("Loop Ammo Refill", "value_i", globalFeatures.self_options, function(feat)
	local pped, PedWeapon
	pped = player.get_player_ped(player.player_id())
    if feat.on then
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
WeaponFastSwitch.on = false
WeaponFastSwitch.max = 1000000
WeaponFastSwitch.min = -1
WeaponFastSwitch.value = 1
WeaponFastSwitch.mod = 5

local WeaponFastSwitch = menu.add_feature("Rapid Switch Current Weapon", "toggle", globalFeatures.self_options, function(feat)
    Settings["WeaponFastSwitch"] = true
    local pped = player.get_player_ped(player.player_id())
    if feat.on then
		if not entity.is_entity_dead(pped) then
        if player.is_player_in_any_vehicle(player.player_id()) ~= true or ped.is_ped_in_any_vehicle(pped) ~= true then
            PedWeapon = ped.get_current_ped_weapon(pped)
            wepammo = weapon.get_ped_ammo_type_from_weapon(pped, PedWeapon)
            if weapon.get_weapon_weapon_type(PedWeapon) ~= 3189615009 then
                if ped.is_ped_shooting(pped) and not entity.is_entity_dead(pped) then
                    local status, err = pcall(RemoveWeaponFrom, player.player_id(), PedWeapon)
                    if not status then
                     --   print(tostring(status) .. " Function Error " .. tostring(err))
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
                      --  print(tostring(status) .. " Function Error " .. tostring(err))
                        moist_notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error")

                    end
					  local status, err = pcall(GiveAmmo, player.player_id(), wepammo, true)
                    if not status then
                      --  print(tostring(status) .. " Function Error " .. tostring(err))
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
WeaponFastSwitch.on = Settings["WeaponFastSwitch"]

Mark_WeapImpPOS = menu.add_feature("Mark Weapon Impact POS", "toggle", globalFeatures.self_combat_Ped, function(feat)
	if feat.on then
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
	system.yield(0)
	return HANDLER_CONTINUE
end)
Mark_WeapImpPOS.on = false

--TODO: Markers
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
changRGB = menu.add_feature("fading red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
changRGB.on = false
chang_RGBA = menu.add_feature("flash red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
chang_RGBA.on = false
changRGBA = menu.add_feature("multi fading colors Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
changRGBA.on = false
changeRGB = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
changeRGB.on = false
change_RGBA = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
change_RGBA.on = false
changeRGBA = menu.add_feature("Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
changeRGBA.on = false
rgb_rand = menu.add_feature("rand rgb 3 on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
	if feat.on then
		RGBA_G = math.random(0, 255)
		system.wait(feat.value)
		RGBA_R = math.random(0, 255)
		system.wait(feat.value)
		RGBA_B = math.random(0, 255)
		system.wait(feat.value)
		return HANDLER_CONTINUE
	end
end)
rgb_rand.on = false
rgb_rand.max = 500
rgb_rand.min = 1
rgb_rand.value = 5

rgb_rand1 = menu.add_feature("rand rgb 4 on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
rgb_rand1.on = false
rgb_rand1.max = 500
rgb_rand1.min = 1
rgb_rand1.value = 15

marker1_rgbd = menu.add_feature("rgb 4 on", "toggle", globalFeatures.moistMkropt, function(feat)
	if feat.on then
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
marker1_rgbd.on = false

--TODO: ***********ONLINE PLAYER Ped Spawn Options ******

function OnlineSpawnOptions()

Attacker_Model = "cs_lestercrest_2"
AnimalAttacker = false
Attacker_Weapon = "weapon_unarmed"
LoadWeapList = Weapon_Lists_type.Melee
type_value = 1
Spawn_As = {"Send via Parachute","Spawn & Attack","Spawn as Support Ped","Spawn Vehicle Attacker"}
local Vehicles = {}
local PedVehModSpawn, PedVehHash
Modal_is_set = false
Ped_is_set = false
Weap_type_is_set = false
Weapon_is_set = false
Amount_is_set = false
vehicle_is_set = false

	

function AttackPed_Vehicle(hash, pid, modal, attack)
	
	
	pped = player.get_player_ped(pid)
	local bid = ped.get_ped_bone_index(pped, 17916)
	local rot, offset, pos = v3(0.0, 0.0, 0.0), v3(15.0, 0.0, 0.0), v3()
	local head = player.get_player_heading(pid)
	pos = player.get_player_coords(pid)
	pos.x = pos.x + 10.0
	local i = #spawned_cunts + 1
	local plygrp = ped.create_group()
	local model = modal
	streaming.request_model(hash)
	while (not streaming.has_model_loaded(hash)) do
		system.wait(10)
	end

	spawned_cunts[i] = vehicle.create_vehicle(hash, pos, head, true, false)
	decorator.decor_set_int(spawned_cunts[i], "MPBitset", 1 << 10)
	vehicle.set_vehicle_mod_kit_type(spawned_cunts[i], 0)
	vehicle.get_vehicle_mod(spawned_cunts[i], 10)
	vehicle.set_vehicle_mod(spawned_cunts[i], 10, 1, false)
	local y = #escort + 1


	escort[y] = ped.create_ped(26, model, pos + offset, 0, true, false)

	ped.set_ped_can_switch_weapons(escort[y], true)
	ped.set_ped_combat_attributes(escort[y], 46, true)
	ped.set_ped_combat_attributes(escort[y], 52, true)
	ped.set_ped_combat_attributes(escort[y], 1, true)
	ped.set_ped_combat_attributes(escort[y], 2, true)
	ped.set_ped_combat_range(escort[y], 2)
	ped.set_ped_combat_ability(escort[y], 2)
	ped.set_ped_combat_movement(escort[y], 2)
	ped.set_ped_into_vehicle(escort[y], spawned_cunts[i], -1)

		if attack == true then
		ped.set_ped_as_group_member(escort[y], plygrp)
		ped.set_ped_never_leaves_group(escort[y], true)
			ped.set_relationship_between_groups(5, player.get_player_group(pid), plygrp)
			ped.set_relationship_between_groups(5, plygrp, player.get_player_group(pid))
			ai.task_combat_ped(escort[y], pped, 0, 16)
		elseif attack == false then
		ped.set_ped_as_group_member(escort[y], player.get_player_group(pid))
		ped.set_ped_never_leaves_group(escort[y], true)
		vehicle.set_vehicle_doors_locked(escortveh[y], 6)
		vehicle.set_vehicle_doors_locked(escortveh[y], 2)
		entity.set_entity_coords_no_offset(escortveh[y], pose)
		ai.task_vehicle_follow(spawned_cunts[y], spawned_cunts[i], pped, 220, 262144, 25)
		for PlayerID = 0, 31 do
		if player.is_player_valid(PlayerID) then

		ped.set_relationship_between_groups(5, player.get_player_group(PlayerID), plygrp)
		ped.set_relationship_between_groups(5, plygrp, player.get_player_group(PlayerID))
		end
		system.wait(0)
		
	end
	
end
return escort[y]
end


Online_Spawn_options = menu.add_player_feature("Ped Spawn Options", "parent", spawn_parent, function(feat, pid)
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

PedSpawnList = menu.add_player_feature("Modals:", "autoaction_value_str", Online_Spawn_options.id, function(feat, pid)
	
	Attacker_Model = Modals[feat.value + 1]
	pedattacker:set_str_data(Modals[feat.value + 1])
	Modal_is_set = true
	
end)
PedSpawnList:set_str_data({"a_c_ a_f_ a_m_","csb_ cs_","g_f_ g_m_","hc_","ig_","mp_","player_","s_f_ s_m_","u_f_u_m"})

pedattacker = menu.add_player_feature("Spawn Ped:", "action_value_str", Online_Spawn_options.id, function(feat, pid)
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
pedattacker_wept:set_str_data({"Melee","Handguns","Submachine_Guns","Shotguns","Assault_Rifles","Machine Guns","Sniper_Rifles","Heavy_Weapons","Throwables","Miscellaneous"})


pedattacker_wep = menu.add_player_feature("Select Ped Weapon: ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
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

Spawn_Count = menu.add_player_feature("Amount to spawn: ", "autoaction_value_i", Online_Spawn_options.id, function(feat, pid)
	if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set then
	
	SpawnCount = feat.value
	Amount_is_set = true
	elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set then
		moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set), "Ped Spawn Error")
	end

end)
Spawn_Count.max = 50
Spawn_Count.min = 1
Spawn_Count.value = 1

Ped_VehModel = menu.add_player_feature("Show Vehicles Starting: ", "action_value_str", Online_Spawn_options.id, function(feat, pid)
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
	
	if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set and Amount_is_set then

		for v = 0, SpawnCount do
		
		if feat.value == 0 then
--		"Send via Parachute" 
			if wephash == nil then
				wephash = gameplay.get_hash_key(Attacker_Weapon)
			end
			local v = #attacker + 1
			
			attacker[v] = spawn_ped_v2(pid, Attacker, true)
			
			system.wait(10)
			local i = #escort
			entity.set_entity_god_mode(escort[i], true)
			ped.set_ped_combat_attributes(escort[i], 52, true)
			ped.set_ped_combat_attributes(escort[i], 1, true)
			ped.set_ped_combat_attributes(escort[i], 46, true)
			ped.set_ped_combat_attributes(escort[i], 2, true)
			ped.set_ped_combat_range(escort[i], 2)
			ped.set_ped_combat_ability(escort[i], 2)
			ped.set_ped_combat_movement(escort[i], 2)
			
			
			local pos = v3()
			pos = player.get_player_coords(pid)
			ai.task_parachute_to_target(escort[i], pos)
			system.wait(12000)
			weapon.give_delayed_weapon_to_ped(escort[i], wephash, 0, 1)
			ped.set_relationship_between_groups(5, Support_Group, Group_Hate)
			ped.set_relationship_between_groups(5, Group_Hate, Support_Group)
			ped.set_ped_as_group_member(escort[i], Group_Hate)
			
			weapon.give_delayed_weapon_to_ped(escort[i], wephash, 0, 1)
			weapon.set_ped_ammo(escort[i], wephash, 1000000)
			
			
			ai.task_combat_ped(escort[i], pped, 0, 16)
			
			
			elseif feat.value  == 1 then
			--"Spawn & Task"
			
			
			local v = #attacker + 1
			if AnimalAttacker then
				attacker[v] = spawn_Animal_ped(pid, Attacker, -8, true, nil)
				else
				attacker[v] = spawn_ped(pid, Attacker, -8, true, nil)
			end
			local i = #escort
			entity.set_entity_god_mode(escort[i], true)
			ped.set_ped_combat_attributes(escort[i], 52, true)
			ped.set_ped_combat_attributes(escort[i], 1, true)
			ped.set_ped_combat_attributes(escort[i], 46, true)
			ped.set_ped_combat_attributes(escort[i], 2, true)
			ped.set_ped_combat_range(escort[i], 2)
			ped.set_ped_combat_ability(escort[i], 2)
			ped.set_ped_combat_movement(escort[i], 2)
			weapon.give_delayed_weapon_to_ped(escort[i], wephash, 1, 1)
			weapon.set_ped_ammo(escort[i], wephash, 1000000)
			ped.set_ped_can_switch_weapons(escort[i], true)
			
			plygrp =  player.get_player_group(pid)
			pedgroup = ped.get_ped_group(escort[i])
			--ped.set_ped_as_group_member(escort[i], plygrp)
			ped.set_relationship_between_groups(5, plygrp, pedgroup)
			ped.set_relationship_between_groups(5, pedgroup, plygrp)
			-- ped.set_ped_as_group_member(escort[i], plygrp)
			-- ped.set_ped_never_leaves_group(escort[i], true)
			weapon.give_delayed_weapon_to_ped(escort[i], wephash, 0, 1)
			weapon.set_ped_ammo(escort[i], wephash, 1000000)
			pped = player.get_player_ped(pid)
			ai.task_combat_ped(escort[i], pped, 0, 16)
			
			elseif feat.value == 2 then
			--"Spawn as Support Ped"

			
			pped = player.get_player_ped(pid)
			local v = #attacker + 1
			if AnimalAttacker then
				attacker[v] = spawn_Animal_ped(pid, Attacker, -8, true, nil)
				else
				attacker[v] = spawn_ped(pid, Attacker, -8, true, nil)
			end
			system.wait(100)
			local i = #escort
			entity.set_entity_god_mode(escort[i], true)
			ped.set_ped_combat_attributes(escort[i], 52, true)
			ped.set_ped_combat_attributes(escort[i], 1, true)
			ped.set_ped_combat_attributes(escort[i], 46, true)
			ped.set_ped_combat_attributes(escort[i], 2, true)
			ped.set_ped_combat_range(escort[i], 2)
			ped.set_ped_combat_ability(escort[i], 2)
			ped.set_ped_combat_movement(escort[i], 2)
			weapon.give_delayed_weapon_to_ped(escort[i], wephash, 0, 1)
			weapon.set_ped_ammo(escort[i], wephash, 1000000)
			ped.set_ped_can_switch_weapons(escort[i], true)
			supportgroup = ped.create_group()
			plygrp =  player.get_player_group(pid)
			pedgroup = ped.get_ped_group(escort[i])
			ped.set_ped_as_group_member(escort[i], plygrp)
			pedgroup = ped.get_ped_group(escort[i])
			ped.set_relationship_between_groups(0, plygrp, pedgroup)
			ped.set_relationship_between_groups(0, pedgroup, plygrp)
			ped.set_ped_as_group_member(escort[i], plygrp)
			ped.set_ped_never_leaves_group(escort[i], true)
			spawn_groups()
			for Pi = 0, 31 do
				if Pi ~= pid then
					pedgroup = ped.get_ped_group(escort[i])
					ped.set_relationship_between_groups(5, pedgroup, playergroups[Pi + 1])
					ped.set_relationship_between_groups(5, playergroups[Pi + 1], pedgroup)
				end
			end
		end
		end
			if feat.value == 3 then
				--"Spawn as Support Ped" then
			if Modal_is_set and Ped_is_set and Weap_type_is_set and Weapon_is_set and vehicle_is_set then
		local PedVehHash = gameplay.get_hash_key(ppededVehModSpawn)
			
			local v = #attacker + 1
			attacker[v] = AttackPed_Vehicle(PedVehHash, pid, Attacker, true)

			elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set and not vehicle_is_set then
		moist_notify("Vehicle Needs to be Set for this option!", "Ped Spawn Error")
		moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set) .. "\nVehicle is Set: " .. tostring(vehicle_is_set), "Ped Spawn Error")
			
			end
			
		end
		system.wait(10)
	elseif not Modal_is_set and not Ped_is_set and not Weap_type_is_set and not Weapon_is_set and not Amount_is_set then
		moist_notify("Modals Set: " .. tostring(Modal_is_set) .. "\nPed Set: " .. tostring(Ped_is_set) .. "\nWeapon type Set: " .. tostring(Weap_type_is_set) .. "\nPed Weapon Set: " .. tostring(Weapon_is_set) .. "\nAmount is Set: " .. tostring(Amount_is_set), "Ped Spawn Error")
	end
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

--TODO: Online Friends Checker
FriendsOnline = menu.add_feature("Online Friends: ", "action_value_str", globalFeatures.lobby, function(feat)
	if feat.value == 0 then
	for i=0,network.get_friend_count()-1 do
		local friendName, friendScid, friendOnline, friendMplay
		friendName = network.get_friend_index_name(i)
		friendScid = network.get_friend_scid(friendName)
		friendOnline = network.is_friend_index_online(i)
		friendMplay = network.is_friend_in_multiplayer(friendName)
		print(string.format("Friend index %s %s (%s) is %s", i, friendName, friendScid, friendOnline and "online" or "offline"))
		if friendOnline then
			Debug_Out("Online Friends Found: \n" .. i ..": " .. friendName .." (" .. friendScid .. ")")
			if friendMplay then
				moist_notify("Online Friend : " .. friendName .. "\nis Playing Online", "Network Presence")
				else
				moist_notify("Online Friend : " .. friendName , "Network Presence")
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
FriendsOnline:set_str_data({"Check","Output to DebugFile"})
--TODO: Orbitor Features
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

--TODO: Player list

function PlayerInfo(pid)
	while OSD_Debug2.on do
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

ScriptLocals["playerlist"] = function()
	PlyImpactPos = {}
	local pos, offset, ply_veh, ply_ped, name = v3(), v3(), {}, {}, {}
	checkstart = {{pid = {}, thread = {}}}
	God_thread = {}
 
	for pid = 0, 31 do
	checkstart[pid] = {}
	checkstart[pid].thread = false
		ScriptLocals["featureVars"] = featureVars
		featureVars = {}
		OSD_Debug2.on = false
		featureVars.f = menu.add_feature("Player " .. pid, "parent", playersFeature, function(feat)
		Active_menu = pid
		health, infoA, infoAB, infoB = Player_Check(pid)
		OSD_Debug2.on = true
		ply_veh[pid+1] = player.get_player_vehicle(pid)
		ply_ped[pid+1] = player.get_player_ped(pid)

end)
		featureVars.k = menu.add_feature("Remove Player Options", "parent", featureVars.f.id)
		featureVars.k.hidden = NewDLC()		
        featureVars.exp = menu.add_feature("Experimental Shit!", "parent", featureVars.f.id)
		featureVars.g = menu.add_feature("Griefing Options", "parent", featureVars.f.id, function(feat)
			playerFeatures[pid].features["blamer"].feat:set_str_data(Playerz)
			playerFeatures[pid].features["blamedorbital"].feat:set_str_data(Playerz)
			playerFeatures[pid].features["blamer"].feat.value = 32
			playerFeatures[pid].features["blamedorbital"].feat.value = 32
			
		end)		
		featureVars.tr = menu.add_feature("Troll Options", "parent", featureVars.f.id)
		featureVars.t = menu.add_feature("Teleport Options", "parent", featureVars.f.id)
		featureVars.at = menu.add_feature("Attachment Options", "parent", featureVars.f.id)
		featureVars.v = menu.add_feature("Vehicle Options", "parent", featureVars.f.id, function(feat)
end)
		featureVars.vd = menu.add_feature("Experimental Decor's", "parent", featureVars.v.id, function(feat)
end)
		featureVars.pd = menu.add_feature("Ped Decorators", "parent", featureVars.f.id, function(feat)
end)
		featureVars.h = menu.add_feature("Highlight Options", "parent", featureVars.f.id, function(feat)
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
				ped_group_setup()
			end)
		featureVars.gr = menu.add_feature("Lester Ramjet", "parent", featureVars.lgr.id)
		--featureVars.n = menu.add_feature("Info Options", "parent", featureVars.f.id)

	features = {}
local killengine = false
    features["disableveh"] = {feat = menu.add_feature("Disable Players Vehicle", "toggle", featureVars.exp.id, function(feat)
        if not feat.on then
            playerFeatures[pid].features["tog_godvehoff"].feat.on = false
			 killengine = false
            return HANDLER_POP
        end
           playerFeatures[pid].features["tog_godvehoff"].feat.on = true
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
features["disableveh"].feat.on = false

features["sendlestermtk"] = {feat = menu.add_feature("minitank Lester", "action_value_str", featureVars.lgr.id, function(feat)
	
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
features["sendlestermtk"].feat:set_str_data({"Send Wandering","Send to Attack!","Send Stalker"})

features["sendlesterapc"] = {feat = menu.add_feature("APC Lester", "action_value_str", featureVars.lgr.id, function(feat)
	
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
features["sendlesterapc"].feat:set_str_data({"Send Wandering","Send to Attack!","Send Stalker"})

	
features["moneytroll2"] = {feat = menu.add_feature("ped money drop", "toggle", featureVars.tr.id, function(feat)
	local Plypos, offset, offset2, Offset, pped = v3(), v3(0.0,0.0,1.80), v3(1.10,2.10,1.10), v3(), player.get_player_ped(pid)
	if feat.on then
	Plypos = player.get_player_coords(pid)
	allpeds = ped.get_all_peds()
	system.wait(100)
	for i = 1, #allpeds do
	if not ped.is_ped_a_player(allpeds[i]) and not entity.is_entity_dead(allpeds[i]) then

	-- decorator.decor_remove(allpeds[i], "cashondeadbody")
	-- --Print("decor on")
	-- system.wait(250)
	-- network.request_control_of_entity(allpeds[i])
	-- system.wait(250)
				decorator.decor_register("cashondeadbody", 3)
	system.wait(250)
						network.request_control_of_entity(allpeds[i])
				system.wait(250)
				decorator.decor_set_int(allpeds[i], "cashondeadbody", 500)
		system.wait(250)
				
				-- --Print("decor not on")
				-- --	system.wait(250)
		-- network.request_control_of_entity(allpeds[i])
		-- system.wait(250)
				-- decorator.decor_register("cashondeadbody", 3)
				-- system.wait(250)
						-- network.request_control_of_entity(allpeds[i])
		-- system.wait(250)
				-- decorator.decor_set_int(allpeds[i], "cashondeadbody", 500)
				

		network.request_control_of_entity(allpeds[i])
	system.wait(100)		
	entity.set_entity_coords_no_offset(allpeds[i], Plypos + offset)
	system.wait(0)
	spawned_cunts[#spawned_cunts + 1] = ped.clone_ped(allpeds[i])
		-- system.wait(250)
	
	

	ped.set_ped_health(allpeds[i], 0.0)
	system.wait(5)
	ped.set_ped_health(spawned_cunts[#spawned_cunts], 0.0)
	end
	--system.wait(1000)
	-- ped.set_ped_health(spawned_cunts[y], 0.0)

	end
	system.wait(100)
	--end
	for i = 1, #allpeds do
	if not ped.is_ped_a_player(allpeds[i]) and entity.is_entity_dead(allpeds[i]) then
	entity.delete_entity(allpeds[i])
	end
	
	system.wait(10)
	end
	--entity.set_entity_as_no_longer_needed(allpeds[i])
	-- entity.delete_entity(allpeds[i])
	-- entity.set_entity_as_no_longer_needed(spawned_cunts[y])
	--entity.delete_entity(spawned_cunts[y])
	
	--end
	
	system.wait(10)
	return HANDLER_CONTINUE
	end
	return HANDLER_POP
	
end),  type = "toggle", callback = function()
end}
features["moneytroll2"].feat.on = false

--TODO: God Check Auto Function
pulsecount = 0
features["PBPulse"] = {feat = menu.add_feature("Pulse Playerbar", "toggle", featureVars.f.id, function(feat)
	if feat.on then
	
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
features["PBPulse"].feat.on = false
features["PBPulse"].feat.hidden = true

features["GodCheck"] = {feat = menu.add_feature("God Mode Check", "toggle", featureVars.f.id, function(feat)
	local name = player.get_player_name(pid)
	local check, pos1, pos2 = 0, v3(), v3()
    if feat.on then
	--playerFeatures[pid].features["spawntest"].feat.on = true
		if Players[pid].PedSpawned then
        system.wait(15000)
        if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid)  and Players[pid].PedSpawned == true  then
           d = os.date()
		   stdtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()

             pos1 = player.get_player_coords(pid)
		end
             system.wait(1000)
			if pos1 == v3(0.0,0.0,0.0) then return end
            if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) and Players[pid].PedSpawned == true  then
			   d = os.date()
		  enddtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
                 pos2 = player.get_player_coords(pid)
                 check = Get_Dist2D_POS2POS(pos1, pos2)
			--print(check)
			end
                if check > 11.00 and Players[pid].isint ~= true and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and Players[pid].PedSpawned == true  then
					 ModderAudio_notify()
                    moist_notify("Player Failed Position to Position Check:\n" .. pid .. " : " .. name.. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "Modder Detection")
				
				Debug_Out(name.. " Start Time : " .. stdtime .. " Check Start Postion = " .. tostring(pos1))
				
				Debug_Out(name.. "End Time : " .. enddtime .. " : Check end Postion = " .. tostring(pos2) .."\nDistance: " .. check)
				--moist_notify(name.. " Start Time : " .. stdtime .. " Check Start Postion = " .. tostring(pos1) .. "\nEnd Time : " .. enddtime .. " : Check end Postion = " .. tostring(pos2) .."\nDistance: " .. check)
					
					 ModderAudio_notify()
					end
		elseif  not Players[pid].PedSpawned then
        system.wait(8000)
		elseif not Players[pid].PedSpawned then
		 system.wait(45000)
		end
    return HANDLER_CONTINUE
		end
end),  type = "toggle", callback = function()

end}
features["GodCheck"].feat.on = false
features["GodCheck"].feat.hidden = false

local loopcnt = 0
features["pos2pos"] = {feat = menu.add_feature("Point to Point Test", "toggle", featureVars.f.id, function(feat)
	if not feat.on then
	return HANDLER_POP
	end
	local name = player.get_player_name(pid)
	local check, pos1, pos2 = 0, v3(), v3()
    if feat.on then
		-- if Players[pid].PedSpawned then
        -- system.wait(15000)
        -- if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid)  and Players[pid].PedSpawned == true  then
           d = os.date()
		   stdtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()

             pos1 = player.get_player_coords(pid)
		--end
            system.wait(1000)
			if pos1 == v3(0.0,0.0,0.0) then return end
           -- if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and player.is_player_god(pid) or player.is_player_vehicle_god(pid) and Players[pid].PedSpawned == true  then
			   d = os.date()
		  enddtime = string.match(d, "%d%d:%d%d:%d%d") .. " : " .. utils.time_ms()
                 pos2 = player.get_player_coords(pid)
                 check = Get_Dist2D_POS2POS(pos1, pos2)
			--print(check)
			--end
               -- if check > 69.00 and Players[pid].isint ~= true and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) and Players[pid].PedSpawned == true  then
               -- moist_notify("Player Position to Position Check:\n" .. pid .. " : " .. name, "Point To Point Position Test")
				
				Debug_Out(name.. " Start Time : " .. stdtime .. " Check Start Postion = " .. tostring(pos1))
				
				Debug_Out(name.. "End Time : " .. enddtime .. " : Check end Postion = " .. tostring(pos2) .."\nDistance: " .. check)
			--	moist_notify(name.. "\nStart Time : " .. stdtime .. "\nCheck Start Postion = " .. tostring(pos1) .. "\nEnd Time : " .. enddtime .. " :\nCheck end Postion = " .. tostring(pos2) .."\nDistance: " .. check, "Point To Point Position Test")
					
					-- ModderAudio_notify()
				--	end
		-- elseif  not Players[pid].PedSpawned then
        -- system.wait(8000)
		-- elseif not Players[pid].PedSpawned then
		repeat
			loopcnt = loopcnt + 1
		if not feat.on then
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
features["pos2pos"].feat.on = false
features["pos2pos"].feat.hidden = false

features["spawntest"] = {feat = menu.add_feature("God Test", "toggle", featureVars.f.id, function(feat)
		local name = player.get_player_name(pid)
		if feat.on then
	--	if not Players[pid].isint and player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
		for i = 0, 31 do
		if player.is_player_valid(i) then 
		local col = entity.has_entity_been_damaged_by_entity(player.get_player_ped(i), player.get_player_ped(pid))
				if col == true and note == false then
					moist_notify(name.. "\nHas Damaged Player: " .. tostring(player.get_player_name(i)) ..  "\nWhile God Mode", "Modder test")
					note = true
		--		end
		end
		end
		end
		
	-- if not playerFeatures[pid].features["GodCheck"].feat.on then
	-- feat.on = false
	-- end
    return HANDLER_CONTINUE
	
		end
		if not feat.on then
		note = false
		return HANDLER_POP
		end
end),  type = "toggle", callback = function()

end}

features["spawntest"].feat.on = false
features["spawntest"].feat.hidden = false

		--TODO: Vehicle Options
local decorator_typetable = {"DECOR_TYPE_FLOAT","DECOR_TYPE_BOOL","DECOR_TYPE_INT","DECOR_TYPE_UNK","DECOR_TYPE_TIME"}
local DecorAddFeat, DecorFeat, Bool_Value, Bool_Bool = {}, {}, {"true","false"},  {true, false}
local function vehdecor()
	for i = 1, #decorators do
		local decor_typetable = decorator_typetable
		local decor_type = {"float","bool","int","unk","time"}
		local DecorType, typenum = decoratorType[decorators[i][2]], decorators[i][2]
		local decor = tostring(decorators[i][1])
		local y = #DecorFeat + 1
		local Decor_feat = DecorFeat[y]
		Decor_feat = menu.add_feature(i ..": " .. decor, "parent", featureVars.vd.id)
		
		local DecorCheckCustype = menu.add_feature("Check for Decorator", "action_value_str", Decor_feat.id, function(feat)
			local decor, Type, exists, decorval
			local plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
				decor = tostring(decorators[i][1])
				Type = {"float","bool","int","unk","time"}
				exists = decorator.decor_exists_on(plyveh, decor)
				local decorget = {}
				decorget[1] = decorator.decor_get_float
				decorget[2] = decorator.decor_get_bool
				decorget[3] = decorator.decor_get_int
				decorget[4] = decorator.decor_get_int
				decorget[5] = decorator.decor_get_int
				if exists then
					decorval = decorget[feat.value + 1](plyveh, decor)
					moist_notify(decor .." Exists\n" .. string.lower(Type[feat.value + 1]) .." Value is: " .. tostring(decorval), "Decorator Check")
					elseif not exists then
					moist_notify(decor .." Does not Exist", "Decorator Check")
				end
			end		
end)
DecorCheckCustype:set_str_data(decor_typetable)
		
		--  if decorators[i][2] == 2 then
		local f = menu.add_feature("Set BOOL Decor on Vehicle as: ", "action_value_str", Decor_feat.id, function(feat)
			local decor, Type, exists, decorval, nplyhash, plyveh
			plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
				decor = tostring(decorators[i][1])
				Type = decoratorType[decorators[i][2]]
				nplyhash = network.network_hash_from_player(pid)
				while not network.has_control_of_entity(plyveh) do
					network.request_control_of_entity(plyveh)
					system.wait(10)
				end
				decorator.decor_register(decor, 2)
				network.request_control_of_entity(plyveh)
				decorator.decor_set_bool(plyveh, decor, Bool_Bool[feat.value + 1])
				decorval = tostring(decorator.decor_get_bool(plyveh, decor))
				moist_notify(decor .." Exists on Vehicle\n", decorval, "Decorator Check")
			end
end)
		f:set_str_data(Bool_Value)
		menu.add_feature("Remove Decorator from Vehicle", "action", Decor_feat.id, function(feat)
			local plyveh, decor
			decor = decorators[i][1]
			plyveh = player.get_player_vehicle(pid)
			while not network.has_control_of_entity(plyveh) do
				network.request_control_of_entity(plyveh)
				system.wait(10)
			end
			decorator.decor_remove(plyveh, decor)
			moist_notify("Decorator Removed", decor)
end)
		
local add_decor_custype = menu.add_feature("Add Decorator to Vehicle", "action_value_str", Decor_feat.id, function(feat)
			local decor, Type, exists, decorval, nplyhash, plyveh, InputType, InputPreset, val
			local decor_type = {"float","bool","int","unk","time"}
			
			local decorset = {}
			decorset[1] = decorator.decor_set_float
			decorset[2] = decorator.decor_set_bool
			decorset[3] = decorator.decor_set_int 
			decorset[4] = decorator.decor_set_int
			decorset[5] = decorator.decor_set_time
			plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil or plyveh ~= 0 then
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
				Decor_example = {"float:NumDot(1234.5678)","Bool:(<true|false>)","INT:Num(1234)","UNK:Unavailable","Time: " .. utils.time()}
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
				while not network.has_control_of_entity(plyveh) do
					network.request_control_of_entity(plyveh)
					system.wait(10)
				end
				decorset[feat.value + 1](plyveh, decor, val)
			end
			
end)
add_decor_custype:set_str_data(decoratorType)

	end
end
vehdecor()

features["godvehon"] = {feat = menu.add_feature("Player Vehicle God Mode ON", "action", featureVars.v.id, function(feat)
			plyveh = player.get_player_vehicle(pid)
			while not network.has_control_of_entity(plyveh) do
				network.request_control_of_entity(plyveh)
				system.wait(10)
			end
			entity.set_entity_god_mode(plyveh, true)
			return HANDLER_POP
end),  type = "action", callback = function()
end}


local AttachTo
features["Attach2me"] = {feat = menu.add_feature("Attach Vehicle to Mine", "value_str", featureVars.v.id, function(feat)
	AttachTo = feat.value
	if feat.on and pid ~= player.player_id() then
	
	if feat.value == 0 --[[and not entity.is_entity_attached(player.get_player_vehicle(player.player_id()))]] then

	myveh = player.get_player_vehicle(player.player_id())
	bone = entity.get_entity_bone_index_by_name(AttachTo, "chassis")
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	system.wait(10)
	
	entity.attach_entity_to_entity(plyveh, myveh, bone, v3(-5.0,2.01,0.20), v3(0.0,0.0,0.0), true, false, false, 0, true)
	entity.set_entity_alpha(plyveh, 80, true)

	elseif feat.value == 1 --[[and not entity.is_entity_attached(player.get_player_ped(player.player_id()))]] then
	myped = player.get_player_ped(player.player_id())
	bone = entity.get_entity_bone_index_by_name(myped, "SKEL_Pelvis")
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	system.wait(10)
	
	entity.attach_entity_to_entity(plyveh, myped, bone, v3(-5.0,2.01,0.20), v3(0.0,0.0,0.0), true, false, true, 0, true)
	entity.set_entity_alpha(plyveh, 80, true)
	end

	end
		if not feat.on then
		atentity = entity.get_entity_attached_to(player.get_player_vehicle(player.player_id()))
		network.request_control_of_entity(plyveh)
		system.wait(10)
		entity.detach_entity(plyveh)
		system.wait(10)
		entity.detach_entity(player.get_player_vehicle(player.player_id()))
		entity.reset_entity_alpha(plyveh)
		elseif entity.is_entity_attached(player.get_player_ped(player.player_id())) then
		atentity = entity.get_entity_attached_to(player.get_player_ped(player.player_id()))
		network.request_control_of_entity(plyveh)
		system.wait(10)
		entity.detach_entity(plyveh)
		system.wait(10)
		entity.detach_entity(player.get_player_ped(player.player_id()))
		entity.reset_entity_alpha(plyveh)
		end
		
			return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
		-- if not feat.on then
			-- atentity = entity.get_entity_attached_to(player.get_player_vehicle(player.player_id()))
		-- network.request_control_of_entity(plyveh)
		-- system.wait(10)
		-- entity.detach_entity(plyveh)
		-- system.wait(10)
		-- entity.detach_entity(player.get_player_vehicle(player.player_id()))
		-- entity.reset_entity_alpha(plyveh)
		-- elseif entity.is_entity_attached(player.get_player_ped(player.player_id())) then
		-- atentity = entity.get_entity_attached_to(player.get_player_ped(player.player_id()))
		-- network.request_control_of_entity(plyveh)
		-- system.wait(10)
		-- entity.detach_entity(plyveh)
		-- system.wait(10)
		-- entity.detach_entity(player.get_player_ped(player.player_id()))
		-- entity.reset_entity_alpha(plyveh)
		-- return HANDLER_CONTINUE
		-- end

end}
features["Attach2me"].feat:set_str_data({"Attach to My Vehicle","Attach to My Ped"})
features["Attach2me"].feat.on = false

		
features["godvehoff"] = {feat = menu.add_feature("Player Vehicle God Mode OFF", "action", featureVars.v.id, function(feat)
			plyveh = player.get_player_vehicle(pid)
			while not network.has_control_of_entity(plyveh) do
				network.request_control_of_entity(plyveh)
				system.wait(10)
			end
			entity.set_entity_god_mode(plyveh, false)
			return HANDLER_POP
			
end),  type = "action", callback = function()
end}
		

local achieved, count = false, 0
		
features["tog_godvehoff"] = {feat = menu.add_feature("Force Control & God Mode OFF", "toggle", featureVars.v.id, function(feat)
			if feat.on then
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
features["tog_godvehoff"].feat.on = false
			
features["LockOn"] = {feat = menu.add_feature("Vehicle Targetable", "action",  featureVars.v.id, function(feat)
			plyveh = player.get_player_vehicle(pid)
			while not network.has_control_of_entity(plyveh) do
				network.request_control_of_entity(plyveh)
				system.wait(10)
			end
			vehicle.set_vehicle_can_be_locked_on(plyveh,true, true)
			return HANDLER_POP
end), type = "action", callback = function()
end}
features["LockOFF"] = {feat = menu.add_feature("Vehicle Not Targetable", "action",  featureVars.v.id, function(feat)
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
			plyveh = player.get_player_vehicle(pid)
			if plyveh ~= nil then
				network.request_control_of_entity(plyveh)
				vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
			end
			network.request_control_of_entity(plyveh)
			vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end), type = "action"}
features["set_speed"] = {feat = menu.add_feature("Force Forward Speed: 90000", "action", featureVars.v.id, function(feat)
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
			if feat.on then
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
			if feat.on then
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
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
			playervehspd(pid, 5.0)
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehspdcust"] = {feat = menu.add_feature("Input Custom Max Speed", "action", featureVars.v.id, function(feat)
			local r,s = input.get("Enter a Speed value:", "0.0001", 64, 5)
			if r == 1 then
				return HANDLER_CONTINUE
			end
			if r == 2 then
				return HANDLER_POP
			end
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
			playervehspd(pid, s)
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehspdfast"] = {feat = menu.add_feature("Reset Max Speed", "action", featureVars.v.id, function(feat)
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
			playervehspd(pid, 9000000.0)
			vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
end), type = "action"}
features["vehaddexpl"] = {feat = menu.add_feature("Add Explosive Device", "action", featureVars.v.id, function(feat)
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
			plyveh = player.get_player_vehicle(pid)
			network.request_control_of_entity(plyveh)
			print(vehicle.has_vehicle_phone_explosive_device())
			if vehicle.has_vehicle_phone_explosive_device() then
				vehicle.detonate_vehicle_phone_explosive_device()
			end
end), type = "action"}
		
features["timedexp"] = {feat = menu.add_feature("Set Vehicle Timed Explosion", "action", featureVars.v.id, function(feat)
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
			plyveh = player.get_player_vehicle(pid)
			network.request_control_of_entity(plyveh)
			vehicle.set_vehicle_rocket_boost_active(plyveh, true)
			vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 999999.999999999999)
end), type = "action"}
features["boostrefill"] = {feat = menu.add_feature("Fast Vehicle Boost Refill", "action", featureVars.v.id, function(feat)
			plyveh = player.get_player_vehicle(pid)
			network.request_control_of_entity(plyveh)
			vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 0.0000010)
end), type = "action"}
features["nomissmk2"] = {feat = menu.add_feature("Set MK2 Machineguns Only", "action", featureVars.v.id, function(feat)
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
			if feat.on then
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
		--TODO: Highight Controls
features["RGB1"] = {feat = menu.add_feature("fading red white Marker3 on/off", "action", featureVars.chc.id, function(feat)
			changRGB.on = not changRGB.on
end), type = "action"}
features["RGB1"].feat.on = false
features["RGB2"] = {feat = menu.add_feature("flash red white Marker3 on/off", "action", featureVars.chc.id, function(feat)
			chang_RGBA.on = not chang_RGBA.on
end), type = "action"}
features["RGB2"].feat.on = false
features["RGB3"] = {feat = menu.add_feature("multi fading colors Marker 1 2 5 on/off", "action", featureVars.chc.id, function(feat)
			changRGBA.on = not changRGBA.on
end), type = "action"}
features["RGB3"].feat.on = false
features["RGB4"] = {feat = menu.add_feature("Marker 1 2 5 RGB on/off", "action", featureVars.chc.id, function(feat)
			changeRGB.on = not changeRGB.on
end), type = "action"}
features["RGB4"].feat.on = false
features["RGB5"] = {feat = menu.add_feature("Marker 1 2 5 RGB2 on/off", "action", featureVars.chc.id, function(feat)
			change_RGBA.on = not change_RGBA.on
end), type = "action"}
features["RGB5"].feat.on = false
features["RGB6"] = {feat = menu.add_feature("Marker3 RGBA on/off", "action", featureVars.chc.id, function(feat)
			changeRGBA.on = not changeRGBA.on
end), type = "action"}
features["RGB6"].feat.on = false
features["RGB7"] = {feat = menu.add_feature("rand rgb Marker3 on/off", "action", featureVars.chc.id, function(feat)
			rgb_rand.on = not rgb_rand.on
end), type = "action"}
features["RGB7"].feat.on = false
features["RGB8"] = {feat = menu.add_feature("rand rgb Marker4 on/off", "action", featureVars.chc.id, function(feat)
			rgb_rand1.on = not rgb_rand1.on
end), type = "action"}
features["RGB8"].feat.on = false
features["RGB9"] = {feat = menu.add_feature("RGB Marker4 on/off", "action", featureVars.chc.id, function(feat)
			marker1_rgbd.on = not marker1_rgbd.on
end), type = "action"}
features["RGB9"].feat.on = false
		--TODO: active marker
features["Mark_Control"] = {feat = menu.add_feature("Marker ID  to Control", "value_i", featureVars.ch.id, function(feat)
			if feat.on then
				actM = feat.value + pid + 1
				return HANDLER_CONTINUE
			end
end), type = "toggle"}
features["Mark_Control"].feat.on = false
features["Mark_Control"].feat.max = 5
features["Mark_Control"].feat.min = 1
features["RGB_OFF"] = {feat = menu.add_feature("Turn off all RGB Changers", "action", featureVars.h.id, function(feat)
			changeRGBA.on = false
			change_RGBA.on = false
			changeRGB.on = false
			changRGBA.on = false
			chang_RGBA.on = false
			changRGB.on = false
end), type = "action"}
features["cprecision"] = {feat = menu.add_feature("Precision Multipliers", "toggle", featureVars.ch.id, function(feat) end), type = "toggle"}
features["MarkSize"] = {feat = menu.add_feature("Marker Size Muliplier", "action_value_i", featureVars.ch.id, function(feat)
			if not playerFeatures[pid].features["Mark_Control"].feat.on then return end
			if features["cprecision"].feat.on then
				size_marker = tonumber(feat.value / 100)
				markID.s[actM] = size_marker
				else
				size_marker = tonumber(feat.value / 2)
				markID.s[actM] = size_marker
			end
end), type = "action_value_i"}
features["MarkSize"].feat.max = 30000
features["MarkSize"].feat.min = 1
features["MarkSize"].feat.value = 2
features["MarkZoff"] = {feat = menu.add_feature("Marker Z Offset Multiplier", "action_value_i", featureVars.ch.id, function(feat)
			if not playerFeatures[pid].features["Mark_Control"].feat.on then return end
			if features["cprecision"].feat.on then
				offsetz_marker = tonumber(feat.value / 100)
				markID.z[actM] = offsetz_marker
				else
				offsetz_marker = tonumber(feat.value / 2)
				markID.z[actM] = offsetz_marker
			end
end), type = "action_value_i"}
features["MarkZoff"].feat.max = 30000
features["MarkZoff"].feat.min = -30000
features["MarkZoff"].feat.value = 1
features["BOB_Marker"] = {feat = menu.add_feature("Bob Marker Up & Down", "toggle", featureVars.ch.id, function(feat)
			if not playerFeatures[pid].features["Mark_Control"].feat.on then return end
			BobUPnDown = true
			local i = actM
			markID.BOB[i]  = BobUPnDown
			if feat.on then
				return HANDLER_CONTINUE
			end BobUPnDown = false
			markID.BOB[i] = BobUPnDown
			return HANDLER_POP
end), type = "toggle"}
features["ROT_Marker"] = {feat = menu.add_feature("Rotate Marker", "toggle", featureVars.ch.id, function(feat)
			if not playerFeatures[pid].features["Mark_Control"].feat.on then return end
			ROTMRK = true
			local i = actM
			markID.ROT[i] = ROTMRK
			if feat.on then
				return HANDLER_CONTINUE
			end ROTMRK = false
			markID.ROT[i] = ROTMRK
			return HANDLER_POP
end)}
		featureVars.blip = menu.add_feature("Radar Blips", "parent", featureVars.h.id)
features["Blipcol"] = {feat =  menu.add_feature("Update Current Blip Colour", "autoaction_value_i", featureVars.blip.id, function(feat)
			local pped = player.get_player_ped(pid)
			local oldblip = ui.get_blip_from_entity(pped)
			ui.set_blip_colour(oldblip, feat.value)
end), type = "autoaction_value_i"}
features["Blipcol"].feat.max = 85
features["Blipcol"].feat.min = 1
features["Blipcol"].feat.value = 1
features["Blip2col"] = {feat =  menu.add_feature("Add Coloured Blip", "action_value_i", featureVars.blip.id, function(feat)
			local pped = player.get_player_ped(pid)
			local oldblip = ui.get_blip_from_entity(pped)
			ui.set_blip_colour(oldblip, 85)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
			ui.set_blip_colour(BlipIDs[#BlipIDs], feat.value)
end), type = "action_value_i"}
features["Blip2col"].feat.max = 85
features["Blip2col"].feat.min = 1
features["Blip2col"].feat.value = 1

features["Blip"] = {feat =  menu.add_feature("Add Radar Blip", "action", featureVars.blip.id, function(feat)
			pped = player.get_player_ped(pid)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
end), type = "action"}


features["Blip01"] = {feat =  menu.add_feature("Add Radar Blip", "value_i", featureVars.blip.id, function(feat)
			pped = player.get_player_ped(pid)
			BlipIDs[#BlipIDs+1] = ui.add_blip_for_entity(pped)
			ui.set_blip_colour(BlipIDs[#BlipIDs], feat.value)
			
end), type = "value_i"}
features["Blip01"].feat.max = 85
features["Blip01"].feat.min = 1
features["Blip01"].feat.value = 1

local blip
features["Blipv2"] = {feat =  menu.add_feature("Radial Radar Blip", "action_value_i", featureVars.blip.id, function(feat)
			if blip ~= nil then
				ui.remove_blip(blip)
				blip = nil
			end
			local bliprad = tonumber(feat.value) + 0.001
			blip = ui.add_blip_for_radius(player.get_player_coords(pid), bliprad)
			BlipIDs[#BlipIDs+1] = blip
			ui.set_blip_colour(blip, 79)
			playerFeatures[pid].features["RadBlipUpdate"].feat.on = true
			return HANDLER_POP
end), type = "action"}
features["Blipv2"].feat.max = 1000
features["Blipv2"].feat.min = 1
features["Blipv2"].feat.value = 25

features["Blip_v2"] = {feat =  menu.add_feature("Radial Radar Blip v2", "action_value_i", featureVars.blip.id, function(feat)
			local bliprad = tonumber(feat.value) + 0.001
			blip = ui.add_blip_for_radius(player.get_player_coords(pid), bliprad)
			BlipIDs[#BlipIDs+1] = blip
			ui.set_blip_colour(BlipIDs[#BlipIDs], 79)
			playerFeatures[pid].features["RadBlipUpdate"].feat.on = true
			return HANDLER_POP
end), type = "action"}
features["Blip_v2"].feat.max = 1000
features["Blip_v2"].feat.min = 1
features["Blip_v2"].feat.value = 1
		
features["Blip_v3"] = {feat =  menu.add_feature("Radial Blip v3 Vehicle", "action_value_i", featureVars.blip.id, function(feat)
			local bliprad = tonumber(feat.value) + 0.001
			plyveh = player.get_player_vehicle(pid)
			blip = ui.add_blip_for_radius(entity.get_entity_coords(plyveh), bliprad)
			BlipIDs[#BlipIDs+1] = blip
			ui.set_blip_colour(BlipIDs[#BlipIDs], 79)
			return HANDLER_POP
end), type = "action"}
features["Blip_v3"].feat.max = 10000
features["Blip_v3"].feat.min = 1
features["Blip_v3"].feat.value = 3500
features["Blip_v3"].feat.mod = 1
		
features["Blipv2col"] = {feat =  menu.add_feature("Update Radial Blip Colour", "action_value_i", featureVars.blip.id, function(feat)
			if blip ~= nil then
				for i = 1, #BlipIDs do
					ui.set_blip_colour(BlipIDs[i], feat.value)
				end
			end
end), type = "action_value_i"}
features["Blipv2col"].feat.max = 120
features["Blipv2col"].feat.min = 1
features["Blipv2col"].feat.value = 1
features["Blipv2col"] = {feat =  menu.add_feature("Update Radial Blip Colour v2", "autoaction_value_i", featureVars.blip.id, function(feat)
			if blip ~= nil then
				ui.set_blip_colour(blip, feat.value)
			end
end), type = "autoaction_value_i"}
features["Blipv2col"].feat.max = 85
features["Blipv2col"].feat.min = 1
features["Blipv2col"].feat.value = 1
		
features["RadBlipUpdate"] = {feat = menu.add_feature("Update Blip v2 Pos", "toggle", featureVars.blip.id, function(feat)
			if feat.on then
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
features["RadBlipUpdate"].feat.on = false
features["RadBlipvehUpdate"] = {feat = menu.add_feature("Update Blip v2 Pos", "toggle", featureVars.blip.id, function(feat)
			if feat.on then
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
features["RadBlipvehUpdate"].feat.on = false
features["marker_active1"] = {feat =  menu.add_feature("Marker 1 Type:", "value_i", featureVars.h.id, function(feat)
			if feat.on then
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
features["marker_active1"].feat.max = 44
features["marker_active1"].feat.min = 0
features["marker_active1"].feat.value = 1
features["marker_active1"].feat.on = false
features["marker_active2"] = {feat =  menu.add_feature("Marker 2 Type:", "value_i", featureVars.h.id, function(feat)
			if feat.on then
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
features["marker_active2"].feat.max = 44
features["marker_active2"].feat.min = 0
features["marker_active2"].feat.value = 43
features["marker_active2"].feat.on = false
features["marker_active3"] = {feat =  menu.add_feature("Marker 3 Type:", "value_i", featureVars.h.id, function(feat)
			if feat.on then
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
features["marker_active3"].feat.max = 44
features["marker_active3"].feat.min = 0
features["marker_active3"].feat.value = 0
features["marker_active3"].feat.on = false
features["marker_active4"] = {feat =  menu.add_feature("Marker 4 Type:", "value_i", featureVars.h.id, function(feat)
			if feat.on then
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
features["marker_active4"].feat.max = 44
features["marker_active4"].feat.min = 0
features["marker_active4"].feat.value = 29
features["marker_active4"].feat.on = false
features["marker_active5"] = {feat =  menu.add_feature("Marker 5 (Drawn on Entity) Type:", "value_i", featureVars.h.id, function(feat)
			if feat.on then
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
features["marker_active5"].feat.max = 44
features["marker_active5"].feat.min = 0
features["marker_active5"].feat.value = 28
features["marker_active5"].feat.on = false
		--TODO: CEO Money
		featureVars.ceo = menu.add_feature("CEO Money Shit", "parent", featureVars.f.id)
		featureVars.ceo.hidden = NewDLC()
		
features["ceo_money1"] = {feat = menu.add_feature("10k money loop (Their Current CEO)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				print("Money Trigger loop")
				print(os.date())
				
				script.trigger_script_event(0x70AB59D5, pid, {pid, 10000, -1292453789, 0, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(16000)
				print(os.date())
				return HANDLER_CONTINUE
			end
			print("loop end")
			
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_money1"].feat.on = false
features["ceo_money1"].feat.hidden = NewDLC()
		
features["ceo_money15"] = {feat = menu.add_feature("15k money loop (Their Current CEO)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				print("Money Trigger loop")
				print(os.date())
				
				script.trigger_script_event(0x70AB59D5, pid, {pid, 15000, -1292453789, 0, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(16000)
				print(os.date())
				return HANDLER_CONTINUE
			end
			print("loop end")
			
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_money15"].feat.on = false
features["ceo_money15"].feat.hidden = NewDLC()
		
features["ceo_money2"] = {feat = menu.add_feature("20k money loop (Their Current CEO)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				print("Money Trigger loop")
				print(os.date())
				
				script.trigger_script_event(0x70AB59D5, pid, {pid, 20000, 198210293, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(121000)
				print(os.date())
				return HANDLER_CONTINUE
			end
			print("loop end")
			
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_money2"].feat.on = false
features["ceo_money2"].feat.hidden = NewDLC()
		
features["ceo_money3"] = {feat = menu.add_feature("30k money loop (Their Current CEO)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
			
			script.trigger_script_event(0x70AB59D5, pid, {pid, 30000, 198210293, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
			system.wait(121000)

				return HANDLER_CONTINUE
			end
		
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_money3"].feat.on = false
features["ceo_money3"].feat.hidden = NewDLC()
		
features["Yceo_money3"] = {feat = menu.add_feature("10k money loop (Your CEO As Assosiate)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				script.trigger_script_event(0x70AB59D5, pid, {player.player_id(), 10000, -1292453789, 0, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(16000)
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["Yceo_money3"].feat.on = false
features["Yceo_money3"].feat.hidden = NewDLC()
		
features["Yceo_money35"] = {feat = menu.add_feature("15k money loop (Your CEO As Assosiate)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				script.trigger_script_event(0x70AB59D5, pid, {player.player_id(), 15000, -1292453789, 0, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(16000)
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["Yceo_money35"].feat.on = false
features["Yceo_money35"].feat.hidden = NewDLC()
		
features["Yceo_money4"] = {feat = menu.add_feature("20k money loop (Your CEO As Assosiate)", "toggle", featureVars.ceo.id, function(feat)
			while feat.on do
				script.trigger_script_event(0x70AB59D5, pid, {player.player_id(), 20000, 198210293, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
				system.wait(121000)
				return HANDLER_CONTINUE
			end			
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["Yceo_money4"].feat.on = false
features["Yceo_money4"].feat.hidden = NewDLC()
		
		
features["Yceo_money5"] = {feat = menu.add_feature("30k money loop (Your CEO As Assosiate)", "toggle", featureVars.ceo.id, function(feat)
	while feat.on do
		script.trigger_script_event(0x70AB59D5, pid, {player.player_id(), 30000, 198210293, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511), script.get_global_i(1921036 + 9), script.get_global_i(1921036 + 10)})
		system.wait(121000)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["Yceo_money5"].feat.on = false
features["Yceo_money5"].feat.hidden = NewDLC()
		
features["ceo_otr"] = {feat = menu.add_feature("OTR", "action", featureVars.f.id, function(feat)
			
			script.trigger_script_event(0xE8A824A0, pid, {pid, utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_otr"].feat.hidden = NewDLC()
		
features["give_nocops"] = {feat = menu.add_feature("Give Long Cop Bribe", "action", featureVars.f.id, function(feat)
			script.trigger_script_event(0x66B0F59A, pid, {pid, utils.time() - 60, utils.time(), script.get_global_i(2810287 + 4628), 1, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
			return HANDLER_POP
end), type = "action", callback = function()
end}
features["give_nocops"].feat.hidden = NewDLC()

		--TODO: teleport
features["TeleportPlayernext2me"] = {feat = menu.add_feature("Teleport Next 2 Me(old Version)", "toggle", featureVars.t.id, function(feat)
			if feat.on then
				local plyveh
				pped = player.get_player_ped(pid)
				local pos = v3()
				pos = player.get_player_coords(player.player_id())
				pos.x = pos.x + 3
				if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
					plyveh = player.get_player_vehicle(pid)
					network.request_control_of_entity(plyveh)
					entity.set_entity_coords_no_offset(plyveh, pos)
					--vehicle.set_vehicle_on_ground_properly(plyveh)
				end
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["TeleportPlayernext2me"].feat.on = false

features["TeleportPlayerinfront"] = {feat = menu.add_feature("Teleport in front of Me", "toggle", featureVars.t.id, function(feat)
			if feat.on then
				local plyveh, pped, pos, me
				pped = player.get_player_ped(pid)
				me = player.player_id()
				get_offset2me(player.player_id(), 3)
				pos = SelfoffsetPos
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
features["TeleportPlayerinfront"].feat.on = false

features["TeleportPlayerBeyondLimits"] = {feat = menu.add_feature("Teleport Beyond World Limits", "toggle", featureVars.t.id, function(feat)
			if feat.on then
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
features["TeleportPlayerBeyondLimits"].feat.on = false

features["TeleportPlayerBeyondGameLimits"] = {feat = menu.add_feature("Teleport Beyond Game Limits", "value_i", featureVars.t.id, function(feat)
			if feat.on then
				local plyveh, pped
				local pos = v3()
				pos.x = math.random(-118417, 118417) .. tonumber(".00")
				pos.y = math.random(-1920795, 1920795) .. tonumber(".00")
				pos.z = -213384.391
				pped = player.get_player_ped(pid)
				if player.get_player_vehicle(pid) ~= 0 or player.get_player_vehicle(pid) ~= nil then
					plyveh = player.get_player_vehicle(pid)
					network.request_control_of_entity(plyveh)
					entity.set_entity_coords_no_offset(plyveh, pos)
					system.wait(feat.value)
				end
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["TeleportPlayerBeyondGameLimits"].feat.on = false
features["TeleportPlayerBeyondGameLimits"].feat.max = 500
features["TeleportPlayerBeyondGameLimits"].feat.min = 0
features["Teleport_God-mode_Death"] = {feat = menu.add_feature("Teleport to Death (Ocean Out of World Limits)", "toggle", featureVars.t.id, function(feat)
			if feat.on then
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
features["Teleport_God-mode_Death"].feat.on = false
features["Teleport_God-mode_Death_2"] = {feat = menu.add_feature("Teleport to Death (KillBarrier)", "toggle", featureVars.t.id, function(feat)
			if feat.on then
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
features["Teleport_God-mode_Death_2"].feat.on = false
		--TODO: Sound Troll
features["sound_troll1"] = {feat = menu.add_feature("Annoy With Air Drop Sounds", "action", featureVars.str.id, function(feat)
			local pos = v3()
			pos = entity.get_entity_coords(player.get_player_ped(pid))
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "Air_Drop_Package", pped, "DLC_SM_Generic_Mission_Sounds", true)
end), type = "action"}
features["sound_troll2"] = {feat = menu.add_feature("Annoy With Countdown sound", "action", featureVars.str.id, function(feat)
			local pos = v3()
			pos = entity.get_entity_coords(player.get_player_ped(pid))
			pped = player.get_player_ped(pid)
			audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 1000, false)
			audio.play_sound_from_entity(-1, "Explosion_Countdown", pped, "GTAO_FM_Events_Soundset", true)
end), type = "action"}
features["sound_troll3"] = {feat = menu.add_feature("Annoy With Yacht Horn Sound", "action", featureVars.str.id, function(feat)
			local pos = v3()
			pos = entity.get_entity_coords(player.get_player_ped(pid))
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1,  "HORN", pped, "DLC_Apt_Yacht_Ambient_Soundset", true)
			audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 1000000, false)
end), type = "action"}
features["sound_troll4"] = {feat = menu.add_feature("Annoy With Chaff Sound", "action", featureVars.str.id, function(feat)
			local pos = v3()
			pos = entity.get_entity_coords(player.get_player_ped(pid))
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "chaff_released", pped, "DLC_SM_Countermeasures_Sounds", true)
end), type = "action"}
features["sound_troll5"] = {feat = menu.add_feature("Annoy With Flare sound", "action", featureVars.str.id, function(feat)
			local pos = v3()
			pos = entity.get_entity_coords(player.get_player_ped(pid))
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "flares_released", pped, "DLC_SM_Countermeasures_Sounds", true)
end), type = "action"}
features["sound_troll6"] = {feat = menu.add_feature("Annoy With Remote KeyFob Sound", "action", featureVars.str.id, function(feat)
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "Remote_Control_Fob", pped, "PI_Menu_Sounds", true)
end), type = "action"}
features["sound_troll7"] = {feat = menu.add_feature("Annoy With Remote Close Sound", "action", featureVars.str.id, function(feat)
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "Remote_Control_Close", pped, "PI_Menu_Sounds", true)
end), type = "action"}
features["sound_troll8"] = {feat = menu.add_feature("Annoy With Remote Open Sound", "action", featureVars.str.id, function(feat)
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "Remote_Control_Open", pped, "PI_Menu_Sounds", true)
end), type = "action"}
features["sound_troll9"] = {feat = menu.add_feature("Annoy With Light Toggle Sound", "action", featureVars.str.id, function(feat)
			pped = player.get_player_ped(pid)
			audio.play_sound_from_entity(-1, "Toggle_Lights", pped, "PI_Menu_Sounds", true)
end), type = "action"}
features["sound_troll10"] = {feat = menu.add_feature("Annoy With Water Sounds", "action", featureVars.str.id, function(feat)
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
			if playerFeatures[pid].features["arrow_indicator2"].feat.on then
				playerFeatures[pid].features["arrow_indicator2"].feat.on = false
				system.wait(1000)
			end
			local hash = gameplay.get_hash_key("prop_mk_arrow_flat")
			AttachedCunt[pid+1], AttachedCunt2[pid+1] = spawn_object_onp(hash, pid)
			spawned_cunts[#spawned_cunts + 1] = AttachedCunt[pid+1]
			spawned_cunts[#spawned_cunts + 1] = AttachedCunt2[pid+1]
			system.wait(100)
			playerFeatures[pid].features["arrow_indicator"].feat.hidden = false
			playerFeatures[pid].features["arrow_indicator"].feat.on = true
			return HANDLER_POP
end), type = "action", callback = function()
end}
features["arrowindicator"].feat.hidden = false
features["arrow_indicator"] = {feat = menu.add_feature("Arrow move & Bounce with Player", "toggle", featureVars.tr.id, function(feat)
			playerFeatures[pid].features["arrowindicator"].feat.hidden = true
			if feat.on then
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
			playerFeatures[pid].features["arrowindicator"].feat.hidden = false
			playerFeatures[pid].features["arrow_indicator"].feat.hidden = true
			network.request_control_of_entity(AttachedCunt[pid+1])
			entity.delete_entity(AttachedCunt[pid+1])
			network.request_control_of_entity(AttachedCunt2[pid+1])
			entity.delete_entity(AttachedCunt2[pid+1])
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["arrow_indicator"].feat.on = false
features["arrow_indicator"].feat.hidden = true
features["arrowindicator2"] = {feat = menu.add_feature("Arrow Indicator above Player", "action", featureVars.tr.id, function(feat)
			if playerFeatures[pid].features["arrow_indicator"].feat.on then
				playerFeatures[pid].features["arrow_indicator"].feat.on = false
				system.wait(1000)
			end
			local hash = gameplay.get_hash_key("prop_mk_arrow_flat")
			AttachedCunt[pid+1], AttachedCunt2[pid+1] = spawn_object_onp(hash, pid)
			spawned_cunts[#spawned_cunts + 1] = AttachedCunt[pid+1]
			spawned_cunts[#spawned_cunts + 1] = AttachedCunt2[pid+1]
			system.wait(100)
			playerFeatures[pid].features["arrow_indicator2"].feat.hidden = false
			playerFeatures[pid].features["arrow_indicator2"].feat.on = true
			return HANDLER_POP
end), type = "action", callback = function()
end}
features["arrowindicator2"].feat.hidden = false
features["arrow_indicator2"] = {feat = menu.add_feature("Arrow update move with Player", "toggle", featureVars.tr.id, function(feat)
			playerFeatures[pid].features["arrowindicator2"].feat.hidden = true
			if feat.on then
				local pos, offset
				pos = v3()
				pos = player.get_player_coords(pid)
				offset = v3(0.0,0.0,5.0)
				network.request_control_of_entity(AttachedCunt[pid+1])
				entity.set_entity_coords_no_offset(AttachedCunt[pid+1], pos + offset)
				return HANDLER_CONTINUE
			end
			playerFeatures[pid].features["arrowindicator2"].feat.hidden = false
			playerFeatures[pid].features["arrow_indicator2"].feat.hidden = true
			network.request_control_of_entity(AttachedCunt[pid+1])
			entity.delete_entity(AttachedCunt[pid+1])
			network.request_control_of_entity(AttachedCunt2[pid+1])
			entity.delete_entity(AttachedCunt2[pid+1])
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["arrow_indicator2"].feat.on = false
features["arrow_indicator2"].feat.hidden = true
		
features["LightPOS1way"] = {feat = menu.add_feature("Lights v2 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
			if feat.on then
				local i, y, t = #spawned_cunt, (#spawned_cunt - 1), #spawned_cunt3
				if not entity.is_an_entity(spawned_cunt[i]) or entity.is_an_entity(spawned_cunt[y]) then
					--	playerFeatures[pid].features["LightPOS1way"].feat.on = false
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
			
			playerFeatures[pid].features["LightPOS1way"].feat.hidden = true
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["LightPOS1way"].feat.on = false
features["LightPOS1way"].feat.hidden = true

local Toilet_Cloned, starttime, resettime = false, 0.0, 0.0
local toilet1, clone1, toilet2, clone2
--task_play_anim(Ped ped, string dict, string anim, float speed, float speedMult, int duration, int flag, float playbackRate, bool lockX, bool lockY, bool lockZ) 0.1, 0.01, 999999999, 1, 0.01,
features["ToiletClone"] = {feat = menu.add_feature("ToiletClone", "toggle", featureVars.tr.id, function(feat)
    if feat.on then
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
           -- entity.set_entity_collision(toilet2, false, false, true)
            entity.set_entity_collision(clone1, false, false, true)
           -- entity.set_entity_collision(toilet1, false, false, true)
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
features["ToiletClone"].feat.on = false
features["ToiletClone"].feat.hidden = false


features["LightPOSway"] = {feat = menu.add_feature("Lights v2 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
			if feat.on then
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
			playerFeatures[pid].features["LightPOSway"].feat.hidden = true
			return HANDLER_POP
			
end),  type = "toggle", callback = function()
end}
features["LightPOSway"].feat.on = false
features["LightPOSway"].feat.hidden = true
		--TODO: Light
features["Light_POS1way"] = {feat = menu.add_feature("Lights v1 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
			if feat.on then
				local i = #spawned_cunt
				local y = (#spawned_cunt - 1)
				local t = #spawned_cunt3
				if not entity.is_an_entity(spawned_cunt[i]) or entity.is_an_entity(spawned_cunt[y]) then
					--	features["Light_POS1way"].feat.on = false
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
			
			playerFeatures[pid].features["Light_POS1way"].feat.hidden = true
			return HANDLER_POP
			
end),  type = "toggle", callback = function()
end}
features["Light_POS1way"].feat.on = false
features["Light_POS1way"].feat.hidden = true
features["Light_POSway"] = {feat = menu.add_feature("Lights v1 Move with Player (off=Del)", "toggle", featureVars.tr.id, function(feat)
			if feat.on then
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
			playerFeatures[pid].features["Light_POSway"].feat.hidden = true
			return HANDLER_POP
			
end),  type = "toggle", callback = function()
end}
features["Light_POSway"].feat.on = false
features["Light_POSway"].feat.hidden = true
		
features["Lightway"] = {feat = menu.add_feature("Set Lights around player", "action", featureVars.tr.id, function(feat)
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
			playerFeatures[pid].features["Light_POS1way"].feat.on = true
			playerFeatures[pid].features["Light_POSway"].feat.on = true
			playerFeatures[pid].features["Light_POS1way"].feat.hidden = false
			playerFeatures[pid].features["Light_POSway"].feat.hidden = false
end),  type = "action"}
		
features["Lightway2"] = {feat = menu.add_feature("Set Lights around player v2", "action", featureVars.tr.id, function(feat)
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
			playerFeatures[pid].features["LightPOS1way"].feat.hidden = false
			playerFeatures[pid].features["LightPOS1way"].feat.on = true
			playerFeatures[pid].features["LightPOSway"].feat.on = true
			playerFeatures[pid].features["LightPOSway"].feat.hidden = false
end),  type = "action"}
		
features["RotatingLights"] = {feat = menu.add_feature("Rotating Lights", "value_i", featureVars.tr.id, function(feat)
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
			if feat.on then
				orbit_pid = pid
				Thread2Id[pid + 1] = menu.create_thread(Orbit2, feat.value)
			end
end), type = "toggle", callback = function()
end}
features["RotatingLights"].feat.min = 1
features["RotatingLights"].feat.max = 10
features["RotatingLights"].feat.mod = 1
features["RotatingLights"].feat.value = 1
features["RotatingLights2"] = {feat = menu.add_feature("Rotating Lights", "value_i", featureVars.tr.id, function(feat)
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
			if feat.on then
				orbit_pid = pid
				Thread1Id[pid + 1] = menu.create_thread(Orbit1, feat.value)
			end
end), type = "toggle", callback = function()
end}
features["RotatingLights2"].feat.min = 1
features["RotatingLights2"].feat.max = 20
features["RotatingLights2"].feat.mod = 1
features["RotatingLights2"].feat.value = 6

local phys = true
features["Physics"] = {feat = menu.add_feature("Attach with Physics?(PhysicsGlitch)", "toggle", featureVars.at.id, function(feat)
	if not feat.on then
		 phys = false
		 return HANDLER_POP
	end
 
end), type = "toggle", callback = function()
	 phys = true
	playerFeatures[pid].features["Physics"].feat.on = true
		return HANDLER_POP
end}
features["Physics"].feat.on = true
	
features["Broken_ufo"] = {feat = menu.add_feature("Attach Broken UFO", "action_value_str", featureVars.at.id, function(feat)
			local pos, rot, offset = v3(), v3(0.0,0.0,0.0), v3(0.0,0.0,0.0)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo, isPed
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1
			pos = player.get_player_coords(pid)
			local i = #spawned_cunts + 1
			spawned_cunts[i] = object.create_object(3974683782, pos, true, false)
			system.wait(1)
			if feat.value == 0 then
			bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")	AttachTo = pped
				isPed = true
				bone = 0
				elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
				bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
				AttachTo = plyveh
				isPed = false
				
			end
			if AttachTo ~= nil then
			system.wait(1)
			end
			entity.attach_entity_to_entity(spawned_cunts[i], AttachTo, 0, offset, rot, true, phys, isPed, 0, true)
end),  type = "action_value_str"}
features["Broken_ufo"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})
	
features["Broken_ufo"] = {feat = menu.add_feature("Attach Halloween UFO Above", "action_value_str", featureVars.at.id, function(feat)
			local pos, rot, offset = v3(), v3(0.0,0.0,0.0), v3(0.0,0.0,18.10)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo, isPed
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1
			pos = player.get_player_coords(pid)
			local i = #spawned_cunts + 1
			local hash = gameplay.get_hash_key("imp_prop_ship_01a")
			spawned_cunts[i] = object.create_object(hash, pos, true, false)
			system.wait(1)
			if feat.value == 0 then
			bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")	AttachTo = pped
				isPed = true
				bone = 0
				elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
				bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
				AttachTo = plyveh
				isPed = false
				
			end
			if AttachTo ~= nil then
			system.wait(1)
			end
			entity.attach_entity_to_entity(spawned_cunts[i], AttachTo, 0, offset, rot, true, phys, isPed, 0, true)
end),  type = "action_value_str"}
features["Broken_ufo"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})


--TODO: ATTACHES N SHIT

features["Attacch_building"] = {feat = menu.add_feature("Attach ArenaWar Building", "action_value_str", featureVars.at.id, function(feat)
			local pos, rot, offset = v3(), v3(0.0,0.0,0.0), v3(0.0,0.0,0.0)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo, isPed
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1

			spawned_cunts[i] = object.create_object(2047051359, pos, true, false)
			entity.set_entity_as_mission_entity(spawned_cunts[i], true, false)
			entity.set_entity_collision(spawned_cunts[i], true, phys, true)
			system.wait(25)
			
			bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
			
			system.wait(1)
			if feat.value == 0 then
				AttachTo = pped
				isPed = true
				bone = 0
				elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
				bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
				AttachTo = plyveh
				isPed = false
				
			end
			if AttachTo ~= nil then
			system.wait(15)
			entity.attach_entity_to_entity(spawned_cunts[i], AttachTo, bone, offset, rot, true, phys, isPed, 0, true)
			end

end),  type = "action_value_f"}
features["Attacch_building"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})

features["Attach_build"] = {feat = menu.add_feature("Attach FIB Building", "action_value_str", featureVars.at.id, function(feat)
	
			local pos, rot, offset = v3(), v3(-14.599995613098,-1.7075473124351e-06,0.0), v3(0.0,0.0,0.0)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo, isPed
			local ObjectModel = 3775166597
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1

			spawned_cunts[i] = object.create_world_object(ObjectModel, pos, true, false)
			entity.set_entity_as_mission_entity(spawned_cunts[i], true, false)
			entity.set_entity_collision(spawned_cunts[i], true, phys, true)
			system.wait(25)
			local ObjectModel = 2890098141

			local y = #spawned_cunts + 1
			spawned_cunts[y] = object.create_world_object(ObjectModel, pos, true, false)
			entity.set_entity_as_mission_entity(spawned_cunts[y], true, false)
			entity.set_entity_collision(spawned_cunts[y], true, phys, true)
			system.wait(25)

			
			
			system.wait(1)
			if feat.value == 0 then
				AttachTo = pped
				isPed = true
				bone = 0
				elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
			bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
				AttachTo = plyveh
				isPed = false
				
			end
			if AttachTo ~= nil then
			system.wait(25)
			entity.attach_entity_to_entity(spawned_cunts[i], AttachTo, bone, offset, rot, true, phys, isPed, 0, true)
			entity.attach_entity_to_entity(spawned_cunts[y], AttachTo, bone, offset, rot, true, phys, isPed, 0, true)	
			end
end),  type = "action_value_f"}
features["Attach_build"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})

features["Attach_Sub"] = {feat = menu.add_feature("Attach DoomsDay Sub", "action_value_str", featureVars.at.id, function(feat)
	
			local pos, rot, offset = v3(), v3(0.0,0.0,-260.0), v3(0.0,0.0,10.0)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo, isPed
			local ObjectModel = 1723871309
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1

			spawned_cunts[i] = object.create_world_object(ObjectModel, pos, true, false)
			entity.set_entity_as_mission_entity(spawned_cunts[i], true, false)
			entity.set_entity_collision(spawned_cunts[i], true, phys, true)
			system.wait(25)


			system.wait(1)
			if feat.value == 0 then
				AttachTo = pped
				bone = 0
				isPed = true
				elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
				bone = entity.get_entity_bone_index_by_name(plyveh, "chassis")
				AttachTo = plyveh
				isPed = false
				
			end
			if AttachTo ~= nil then
			system.wait(1)
			entity.attach_entity_to_entity(spawned_cunts[i], AttachTo, bone, offset, rot, true, phys, isPed, 0, true)

			end
			
			
end),  type = "action_value_f"}
features["Attach_Sub"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})

features["BeachFire"] = {feat = menu.add_feature("Attach Beach Fires", "action_value_str", featureVars.at.id, function(feat)
			local bones = {}
			local pos, offset = v3(), v3(0.0,0.0,10.0)
			local plyveh, pped = player.get_player_vehicle(pid), player.get_player_ped(pid)
			local bone, AttachTo
			local pos = get_offset(pid, 10)
			local i = #spawned_cunts + 1

	
			local pos, offset = v3(), v3(0.0,0.0,10.0)
			local bid1, bid2
			phys = false
			if feat.value == 0 then
				AttachTo = pped
			bones[#bones + 1] =  ped.get_ped_bone_index(pped, 31086)
			isPed = true
			spawned_cunts[#spawned_cunts + 1] = object.create_object(3229200997, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], AttachTo,  bones[#bones], pos, offset, true, phys, isPed, 0, false)
			local offset = v3(0.0,0.0,-10.0)
			bones[#bones + 1] =  ped.get_ped_bone_index(pped, 11816)
			spawned_cunts[#spawned_cunts + 1] = object.create_object(3229200997, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], AttachTo,  bones[#bones], pos, offset, true, phys, isPed, 0, false)
			elseif plyveh ~= nil or plyveh ~= 0 and feat.value == 1 then
			AttachTo = plyveh
			isPed = false
				bones = {}
				local bone = {"wheel_rr","wheel_lr","wheel_rf","wheel_lf"}
				for i = 1, #bone do
				bones[#bones + 1] = entity.get_entity_bone_index_by_name(plyveh, bone[i])
				end
				for y = 1, #bones do
					offset = v3(0.0,0.0,0.0)
					spawned_cunts[#spawned_cunts + 1] = object.create_object(3229200997, pos, true, false)
					entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], AttachTo,  bones[y], pos, offset, true, phys, isPed, 0, false)
				end
				for y = 1, #bones do
					offset = v3(0.0,0.0,0.0)
					spawned_cunts[#spawned_cunts + 1] = object.create_object(0x203011a1, pos, true, false)
					entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], AttachTo,  bones[y], pos, offset, true, phys, isPed, 0, false)
				end

				
				
			end

			return HANDLER_POP
			
end), type = "action_value_f"}
features["BeachFire"].feat:set_str_data({"Attach to Ped","Attach to Vehicle"})

features["attach_room"] = {feat = menu.add_feature("Room Attachment", "action", featureVars.at.id, function(feat)
			local pos, rot = v3(), v3()
			pos.z = -0.5
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(879487762, 0, pos, rot, true, pid)
			pos.z = 1.5
			rot.x = 0
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(879487762, 0, pos, rot, true, pid)
			pos.z = 0
			pos.x = 1.5
			rot.x = 0
			rot.y = 90
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(879487762, 0, pos, rot, true, pid)
			pos.x = -1.5
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 0
			spawn_attach(879487762, 0, pos, rot, true, pid)
			pos.x = 0
			pos.y = 1.5
			rot.y = 0
			rot.x = 90
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 270
			spawn_attach(879487762, 0, pos, rot, true, pid)
			pos.y = -1.5
			spawn_attach(879487762, 0, pos, rot, true, pid)
			rot.x = 90
			spawn_attach(879487762, 0, pos, rot, true, pid)
end), type = "action"}
features["attach_room1"] = {feat = menu.add_feature("Room Attachment v2", "action", featureVars.at.id, function(feat)
			local pos, rot = v3(), v3()
			pos.z = -0.5
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			pos.z = 1.5
			rot.x = 0
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			pos.z = 0
			pos.x = 1.5
			rot.x = 0
			rot.y = 90
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			pos.x = -1.5
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 0
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			pos.x = 0
			pos.y = 1.5
			rot.y = 0
			rot.x = 90
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 270
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			pos.y = -1.5
			spawn_attach(1313069551, 0, pos, rot, true, pid)
			rot.x = 90
			spawn_attach(1313069551, 0, pos, rot, true, pid)
end), type = "action"}
features["attach_room2"] = {feat = menu.add_feature("Room Attachment v3", "action", featureVars.at.id, function(feat)
			local pos, rot = v3(), v3()
			pos.z = -0.5
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			pos.z = 1.5
			rot.x = 0
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			pos.z = 0
			pos.x = 1.5
			rot.x = 0
			rot.y = 90
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 180
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			pos.x = -1.5
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 0
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			pos.x = 0
			pos.y = 1.5
			rot.y = 0
			rot.x = 90
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 270
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			pos.y = -1.5
			spawn_attach(3136319403, 0, pos, rot, true, pid)
			rot.x = 90
			spawn_attach(3136319403, 0, pos, rot, true, pid)
end), type = "action"}
features["scramdeer"] = {feat = menu.add_feature("scramjet Deer", "action", featureVars.tr.id, function(feat)
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
--TODO: Lester Ramjet
features["Ram_Jet_cleanup"] = {feat = menu.add_feature("Run Delayed Cleanup?", "toggle", featureVars.gr.id, function(feat)
	features["RamJet_cleanup"].feat.on = true
end),  type = "toggle", callback = function()
features["RamJet_cleanup"].feat.on = false
end}
features["Ram_Jet_cleanup"].feat.on = false
features["RamJet2"] = {feat = menu.add_feature("Lester RamJet Attack Player", "action_value_i", featureVars.gr.id, function(feat)
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
			entity.set_entity_god_mode(#escort, true)
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
features["RamJet2"].feat.max = -10
features["RamJet2"].feat.min = -200
features["RamJet2"].feat.value = -20
features["RamJet3"] = {feat = menu.add_feature("Lester RamJet Impact Player", "action_value_i",featureVars.gr.id, function(feat)
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
features["RamJet3"].feat.max = -10
features["RamJet3"].feat.min = -200
features["RamJet3"].feat.value = -20
features["Ramjet_Attach"] = {feat = menu.add_feature("Attach all RamJets offset", "value_i", featureVars.gr.id, function(feat)
			if feat.on then
				pped = player.get_player_ped(pid)
				local offset = v3()
				offset.x = 0.0
				offset.y = 0.0
				offset.z = 0.0
				local y = tonumber(feat.value)
				offset.x = y
				local rot = v3(0.0,0.0,0.0)
				for i = 1, #escort do
					network.request_control_of_entity(escort[i])
					entity.attach_entity_to_entity(escort[i], pped, 0, offset, rot, true, true, true, 0, true)
				end
				for i = 1, #escortveh do
					network.request_control_of_entity(escortveh[i])
					entity.attach_entity_to_entity(escortveh[i], pped, 0, offset, rot, true, true, false, 0, true)
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
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Ramjet_Attach"].feat.on = false
features["Ramjet_Attach"].feat.max = 50
features["Ramjet_Attach"].feat.min = -50
features["Ramjet_Attach"].feat.value = -1
features["RamJet_cleanup"] = {feat = menu.add_feature("Run Delayed Ramjet Cleanup", "toggle", featureVars.gr.id, function(feat)
			if feat.on then
				system.wait(10000)
				delayed_spawn_cleanup()
				return HANDLER_CONTINUE
			end
end),  type = "toggle", callback = function()
end}
features["RamJet_cleanup"].feat.on = false
features["RamJet_cleanup"].feat.hidden = true
features["sendlesmonster"] = {feat = menu.add_feature("Arenawar Monster Lester", "action_value_str", featureVars.lgr.id, function(feat)
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
					playerFeatures[pid].features["hunter_taskloop"].feat.on = true
					ai.task_vehicle_follow(escort[i], escortveh[y], pped, 220, 262144, 25)
				end
			end
			streaming.set_model_as_no_longer_needed(vehhash)
end), type = "action_value_i"}
features["sendlesmonster"].feat:set_str_data({"Send Wandering","Send to Attack!","Send Stalker"})

PlyImpactPos[pid+1] = v3()
features["weapon_impact"] = {feat = menu.add_feature("Get last Weapon impact POS", "toggle", featureVars.f.id, function(feat)
			if feat.on then
				pped = player.get_player_ped(pid)
				
				
				local success, pos = ped.get_ped_last_weapon_impact(pped, v3())
				if success then
				Print(pos)
				PlyImpactPos[pid+1] = pos
					else
				end
				return HANDLER_CONTINUE
			end
end),  type = "toggle", callback = function()
end}
features["weapon_impact"].feat.on = false
features["weapon_impact"].feat.hidden = false
		--TODO: Weapon strike
		local current_loop_delay
		current_loop_delay = Settings["playerlist_loop"]
features["Give_Airstrike"] = {feat = menu.add_feature("Give WeaponStrike:", "value_str", featureVars.f.id, function(feat)
			playerFeatures[pid].features["weapon_impact"].feat.on = true
			local posm, playerz, zPos, hash
			if feat.on then
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
			--	playerz, zPos = gameplay.get_ground_z(pos)
				--pos_off.z = zPos
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
				-- print(PlyImpactPos[pid+1])
				return HANDLER_CONTINUE
			end
			playerFeatures[pid].features["weapon_impact"].feat.on = false
			notify_sent = false
			Settings["playerlist_loop"] = current_loop_delay
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Give_Airstrike"].feat.on = false
features["Give_Airstrike"].feat:set_str_data(StrikeGive_label)
--TODO: *** **** Sticky Bomb Back **** ***	
features["StickyBack"] = {feat = menu.add_feature("Stickbomb on Back of this cunt!", "action", featureVars.tr.id, function(feat)
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
			if world_dumped then
				local pos = v3()
				pos = player.get_player_coords(pid)
				dump_pickups_onplayer(pid, pos)
			end
			return HANDLER_POP
end), type = "action"}

features["Block Passive"] = {feat = menu.add_feature("Block Passive Mode", "action", featureVars.f.id, function(feat)
			script.trigger_script_event(0x4267b065, pid, {1, 1})
			local scid = player.get_player_scid(pid)
			local name = tostring(player.get_player_name(pid))
			Debug_Out(string.format("Player: " ..name .." [" ..scid .."]" .."Blocked Passive"))
end), type = "action"}
features["Block Passive"].feat.hidden = NewDLC()

features["Unblock Passive"] = {feat = menu.add_feature("Unblock Passive Mode", "action", featureVars.f.id, function(feat)
			script.trigger_script_event(0x4267b065, pid, {2, 0})
			scid = player.get_player_scid(pid)
			name = tostring(player.get_player_name(pid))
			Debug_Out(string.format("Player: " .. name .. " [" .. scid .. "]" .. "Passive Unblocked"))
end), type = "action"}
features["Unblock Passive"].feat.hidden = NewDLC()

		--TODO: Grief
		featureVars.lag = menu.add_feature("Entity Area Lag", "parent", featureVars.g.id)
		menu.add_feature("Value = Spawn Amount", "action", featureVars.lag.id)
		menu.add_feature("Spawns Delete When you Unattach", "action", featureVars.lag.id)

local attack_peds2 = {"u_m_y_juggernaut_01","a_f_y_topless_01","ig_lestercrest_2","ig_lestercrest_3","ig_trafficwarden","mp_f_deadhooker","s_m_m_pilot_01","s_m_m_pilot_02","s_m_y_pilot_01","s_m_y_robber_01","u_m_m_jewelthief","u_m_y_fibmugger_01","a_f_y_juggalo_01","mp_g_m_pros_01",}
features["attacker2"] = {feat = menu.add_feature("Send Attacker", "action_value_str", featureVars.g.id, function(feat)

        local pped = player.get_player_ped(pid)

        local pos = get_offset(pid, -6)

        local model = gameplay.get_hash_key(attack_peds2[feat.value + 1])
        streaming.request_model(model)
        while (not streaming.has_model_loaded(model)) do
            system.wait(10)
        end

        local i = #escort + 1
        escort[i] = ped.create_ped(29, model, pos, player.get_player_heading(pid), true, false)
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
			if feat.on then
				if feat.value == 32 then
					blame = 0
					elseif feat.value ~= 32 then
					blame = player.get_player_ped(feat.value)
				moist_notify("Blame Set: " .. Playerz[feat.value+1])

				end
				system.wait(200)
				return HANDLER_CONTINUE
			end
			blame = 0
			return HANDLER_POP
end), type = "toggle"}
features["blamer"].feat:set_str_data(Playerz)

features["blamedorbital"] = {feat = menu.add_feature("Orbital Player Blaming: ", "action_value_str", featureVars.g.id, function(feat)
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
			gameplay.set_override_weather(3)
			gameplay.clear_cloud_hat()
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
			-- audio.play_sound_from_coord(-1, "BOATS_PLANES_HELIS_BOOM", v3(-910000.00,-10000.0,-19000.00), "MP_LOBBY_SOUNDS", true, 999999, false)
			-- audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, "MP_LOBBY_SOUNDS", true, 99999990, false)
			-- audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon_Standard", pos, 0, true, 1000000, false)
			-- audio.play_sound_from_coord(-1, "BOATS_PLANES_HELIS_BOOM", v3(-910000.00,-10000.0,-19000.00), "MP_LOBBY_SOUNDS", true, 999999, false)
			-- audio.play_sound_from_coord(script.get_global_i(1694982), "DLC_XM_Explosions_Orbital_Cannon", pos, "MP_LOBBY_SOUNDS", true, 99999990, false)
			 audio.play_sound_from_coord(1, "DLC_XM_Explosions_Orbital_Cannon", pos, 0, true, 0, false)
			-- audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, myped, true, 0, false)
			-- audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, 0, true, 0, false)
			graphics.set_next_ptfx_asset("scr_xm_orbital")
			while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
				graphics.request_named_ptfx_asset("scr_xm_orbital")
				system.wait(0)
			end
			gameplay.set_override_weather(3)
			gameplay.clear_cloud_hat()
			fire.add_explosion(pos, 59, false, true, 1.5, myped)
			fire.add_explosion(pos + offset, 60, true, false, 1.8, myped)
			fire.add_explosion(pos + offset, 62, true, false, 2.0, myped)
			fire.add_explosion(pos + v3(100.0,100.0,7000.00), 50, true, false, 1.0, myped)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			fire.add_explosion(pos, 50, true, false, 1.0, myped)
			graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 100.000, false, false, true)
			--  audio.play_sound_from_coord(-1, "BOATS_PLANES_HELIS_BOOM", pos + v3(0.0,0.0,20000), "MP_LOBBY_SOUNDS", true, 0, false)
			-- audio.play_sound_from_coord(-1, "DLC_XM_Explosions_Orbital_Cannon", pos, "o", true, 0, false)
			-- audio.play_sound(-1, "DLC_XM_Explosions_Orbital_Cannon", 0, true, 0,false)
			-- audio.play_sound(-1, "DLC_XM_Explosions_Orbital_Cannon", 0, true, 999999999, false)
			-- audio.play_sound(script.get_global_i(1694982), "DLC_XM_Explosions_Orbital_Cannon", 0, true, 0, false)
			-- audio.play_sound_from_coord(script.get_global_i(1694982), "DLC_XM_Explosions_Orbital_Cannon", pos,  0,  true, 999999999, false)
			-- audio.play_sound_from_coord(-1, "MP_Impact", pos, 0, true, 0, false)
			-- audio.play_sound(-1, "MP_Impact", 0, true, 0, false)

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
		
		
features["Dildo_Dick"] = {feat = menu.add_feature("Dildo Dick The Cunt", "action", featureVars.at.id, function(feat)
			pped = player.get_player_ped(pid)
			local pos = v3()
			local offset = v3()
			offset.x = 0.08
			offset.y = 0.0
			offset.z = 0.0
			local rot = v3()
			rot.x = 40
			rot.y = -83
			rot.z = -134
			local bid = ped.get_ped_bone_index(pped, 65068)
			local hashb = gameplay.get_hash_key("v_res_d_dildo_f")
			spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, true)
			local offset = v3()
			offset.x = 0.0
			offset.y = 0.0
			offset.z = 0.0
			local rot = v3()
			rot.x = 293.0
			rot.y = 28.0
			rot.z = 24.0
			local bid = ped.get_ped_bone_index(pped, 23553)
			spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, true)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, true)
			local bid = ped.get_ped_bone_index(pped, 65068)
			local offset = v3()
			offset.x = 0.010
			offset.y = 0.01
			offset.z = 0.001
			local rot = v3()
			rot.x = 1.0
			rot.y = 1.0
			rot.z = 1.0
			return HANDLER_POP
end), type = "action"}
features["Dildo_Dick"] = {feat = menu.add_feature("Dildo Illuminate Cunt", "action", featureVars.at.id, function(feat)
			pped = player.get_player_ped(pid)
			local pos = v3()
			local offset = v3()
			offset.x = 0.08
			offset.y = 0.0
			offset.z = 0.0
			local rot = v3()
			rot.x = 40
			rot.y = -83
			rot.z = -134
			local bid = ped.get_ped_bone_index(pped, 65068)
			local hashb = gameplay.get_hash_key("v_res_d_dildo_f")
			spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, true)
			local offset = v3()
			offset.x = 0.0
			offset.y = 0.0
			offset.z = 0.0
			local rot = v3()
			rot.x = 293.0
			rot.y = 28.0
			rot.z = 24.0
			local bid = ped.get_ped_bone_index(pped, 23553)
			spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, true)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, true)
			local bid = ped.get_ped_bone_index(pped, 65068)
			local offset = v3()
			offset.x = 0.010
			offset.y = 0.01
			offset.z = 0.001
			local rot = v3()
			rot.x = 1.0
			rot.y = 1.0
			rot.z = 1.0
			local hasha = gameplay.get_hash_key("prop_air_lights_02a")
			spawned_cunts[#spawned_cunts + 1] = object.create_object(hasha, pos, true, true)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bid, offset, rot, true, false, false, 0, false)
			local pos = v3()
			local offset = v3()
			local rot = v3()
			offset.x = 0.12
			offset.y = 0.0
			offset.z = -0.26
			rot.x = -181.0
			rot.y = 0.0
			rot.z = 0.0
			pped = player.get_player_ped(pid)
			local bone = ped.get_ped_bone_index(pped, 18905)
			spawned_cunts[#spawned_cunts + 1] = object.create_object(3324004640, pos, true, false)
			entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone, offset, rot, true, false, true, 0, true)
			return HANDLER_POP
end), type = "action"}

features["Firework_ply"] = {feat = menu.add_feature("Fireworks Around Player Delay: ", "value_i", featureVars.tr.id, function(feat)
			if feat.on then
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
end), type = "toggle"}
features["Firework_ply"].feat.max = 2000
features["Firework_ply"].feat.min = 0
features["Firework_ply"].feat.value = 100
features["Firework_ply"].feat.mod = 10
--TODO: ************** PTFX ********************


features["explodeply"] = {feat = menu.add_feature("Explosions Around Player", "value_i", featureVars.g.id, function(feat)
			if feat.on then
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
end), type = "toggle"}
features["explodeply"].feat.max = 74
features["explodeply"].feat.min = -1
features["explodeply"].feat.value = 0

features["explode_ply"] = {feat = menu.add_feature("Explosions Around Player", "action_value_i", featureVars.g.id, function(feat)
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
features["explode_ply"].feat.max = 74
features["explode_ply"].feat.min = -1
features["explode_ply"].feat.value = 0

local asset = "scr_bike_adversary"
local effect = "scr_adversary_foot_flames"

features["ptfx_annoy"] = {feat = menu.add_feature("PTFX: ", "value_str", featureVars.tr.id, function(feat)
	pped = player.get_player_ped(pid)
	if not feat.on then
	local pos = v3()
	pos = player.get_player_coords(pid)
	graphics.remove_ptfx_from_entity(pped)
		graphics.remove_ptfx_in_range(pos, 200000.00)
	graphics.remove_particle_fx(gameplay.get_hash_key(effect), false)
		graphics.remove_named_ptfx_asset(asset)
	
	return HANDLER_POP
	end
	
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
				--graphics.start_networked_ptfx_looped_at_coord(effect, pos, v3(0.0,0.0,0.0), 2.1, false, false, true)
				--graphics.start_networked_ptfx_non_looped_at_coord(effect, pos, rot, 2.1, false, false, true)
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
	pped = player.get_player_ped(pid)
	if not feat.on then
	local pos = v3()
	pos = player.get_player_coords(pid)
	graphics.remove_ptfx_from_entity(pped)
		graphics.remove_ptfx_in_range(pos, 200000.00)
	graphics.remove_particle_fx(gameplay.get_hash_key(effect2), false)
		graphics.remove_named_ptfx_asset(asset2)
	
	return HANDLER_POP
	end
	
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
				--graphics.start_networked_ptfx_looped_at_coord(effect, pos, v3(0.0,0.0,0.0), 2.1, false, false, true)
				--graphics.start_networked_ptfx_non_looped_at_coord(effect, pos, rot, 2.1, false, false, true)
				if not graphics.does_looped_ptfx_exist(gameplay.get_hash_key(effect2)) then
		graphics.start_networked_ptfx_looped_on_entity(effect2, pped, v3(0.0,0.0,0.0), rot, 1.2)
				end

	system.wait(1)
			return HANDLER_CONTINUE

end), type = "value_str", callback = function()

end}
features["ptfx_annoy2"].feat:set_str_data(ptfx_Label)

features["dildobombs"] = {feat = menu.add_feature("Dildo Bombs From Ass", "action", featureVars.g.id, function(feat)
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
features["HomingFlare"] = {feat = menu.add_feature("Flare assisted Homing", "action", featureVars.g.id, function(feat)
			pped = player.get_player_ped(player.player_id())
			local pos = v3()
			pos = player.get_player_coords(pid)
			pos.z =  pos.z + 50.00
			-- local posz
			-- posz, pos.z = gameplay.get_ground_z(pos)
			local offset = v3()
			offset = get_offset(pid, 55)
			-- offset.z =  offset.z + 20.00
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
			local hash = gameplay.get_hash_key("weapon_heavysniper")
			local pos = v3()
			pos = player.get_player_coords(pid)
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

features["Ped_hate"] = {feat = menu.add_feature("PedsHate & AttackPlayer Weap:", "action_value_str", featureVars.g.id, function(feat)
			local weap = ped_wep[feat.value + 1]
			moist_notify("Peds Attack With:\n" .. Ped_WepL[feat.value +1], "Moist Ped Haters")
			Peds_hateWorld(pid, weap)
end), type = "action_value_i", callback = function()
end}
features["Ped_hate"].feat:set_str_data(Ped_WepL)
features["Ped_hate"].feat.value = 11

features["Peds_eject"] = {feat = menu.add_feature("Task NearbyPeds Bail/Exit Veh", "action_value_i", featureVars.tr.id, function(feat)
			moist_notify("Peds around Target Player\nWill Exit Vehicle or Bail from it", "MoistScript Troll")
			Ped_eject(pid, eject[feat.value])
end), type = "action_value_i", callback = function()
end}
features["Peds_eject"].feat.max = #eject
features["Peds_eject"].feat.min = 1
features["Peds_eject"].feat.value = 6

lester, huntv = {}, {}

features["Send_HunterLester"] = {feat = menu.add_feature("Send Lester Hunt them in savage", "action", featureVars.lgr.id, function(feat)
			playerFeatures[pid].features["hunter_taskloop"].feat.on = true
			local pos = v3(-73.31681060791,-820.26013183594,326.17517089844)
			local vehhash = veh_list[2][2]
			mod = 10
			modvalue = -1
			pped = player.get_player_ped(pid)
			spawn_ped(pid, 0x6E42FD26, pos, true, true)
			system.wait(100)
			local huntv = spawn_veh(pid, vehhash, pos, mod, modvalue, true)
			local blipid = ui.get_blip_from_entity(huntv)
			ui.set_blip_sprite(blipid, 43)
			local p = #escort
			local y = #escortveh
			local curhead = player.get_player_heading(pid)
			entity.set_entity_heading(escortveh[y], curhead)
			ai.task_turn_ped_to_face_entity(escort[p], pped, 999)
			ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
			system.wait(4000)
			ai.task_combat_ped(escort[p], pped, 0, 16)
			system.wait(4000)
			vehicle.control_landing_gear(escortveh[y], 3)
--			entity.set_entity_collision(escortveh[y], false, false, false)
			moist_notify("Lester Savage Hunter\nSent from Maze Tower to Target")
end), type = "action"}

features["Send_HunterLester1"] = {feat = menu.add_feature("Lester Thruster Hunter 2:weap", "action_value_i", featureVars.lgr.id, function(feat)
			local pos = v3(-73.31681060791,-820.26013183594,326.17517089844)
			local vehhash = 0x58CDAF30
			pped = player.get_player_ped(pid)
			lester[#lester+1] = spawn_ped(pid, 0x6E42FD26, pos, true, true)
			system.wait(100)
			local i = feat.value
			local mod, modvalue = 10, -1
			local hunt_v = spawn_veh(pid, vehhash, pos, mod, modvalue, true)
			huntv[#huntv+1] = hunt_v
			
			entity.set_entity_as_mission_entity(huntv[#huntv], true, false)
			if feat.value == 2 then
				local modds = {{10, 1},{4, 0},{11, 3},{12, 2},{16, 4},{18, 1},{20, 0},{22, 0},{48, 23},}
				for i = 1, #modds do
					vehicle.set_vehicle_mod_kit_type(huntv[#huntv], 0)
					vehicle.get_vehicle_mod(huntv[#huntv], modds[i][1])
					vehicle.set_vehicle_mod(huntv[#huntv], modds[i][1], modds[i][2], false)
				end
			end
			entity.set_entity_as_mission_entity(lester[#lester], true, false)
			ped.set_ped_into_vehicle(lester[#lester], huntv[#huntv], -1)

			local blipid = ui.get_blip_from_entity(huntv[#huntv])
			ui.set_blip_sprite(blipid, 597)
			ai.task_combat_ped(lester[#lester], pped, 0, 16)
			system.wait(4000)
			network.request_control_of_entity(huntv[#huntv])
			--entity.set_entity_collision(huntv[#huntv], false, false, false)
			network.request_control_of_entity(huntv[#huntv])
			--entity.set_entity_collision(escortveh[y], false, false, false)
			moist_notify("Thruster Lester\nSent from Maze Tower to Hunt Target", "Lester Griefer")
			
			playerFeatures[pid].features["hunter_loop"].feat.hidden = false

			playerFeatures[pid].features["hunter_loop"].feat.on = true
end), type = "action"}
features["Send_HunterLester1"].feat.max = 2
features["Send_HunterLester1"].feat.min = 1
features["Send_HunterLester1"].feat.value = 1

features["hunter_loop"] = {feat = menu.add_feature("Retask Lester on Death", "toggle", featureVars.lgr.id, function(feat)
				pped = player.get_player_ped(pid)
			if feat.on then
				 if not entity.is_entity_dead(pped) then
					 system.wait(1)
					 return HANDLER_CONTINUE
				 end
				system.wait(5000)
				for i = 1, #lester do
				ai.task_combat_ped(lester[#lester], pped, 0, 6)
				ai.task_combat_ped(lester[#lester], pped, 0, 6)
					if #huntv == nil or 0 then
					goto next
					end
					ped.set_ped_into_vehicle(lester[i], huntv[i], -1)
					::next::
					ai.task_combat_ped(lester[i],  pped, 0, 6)
				end
				return HANDLER_CONTINUE
			end
			for i = 1, #huntv do
				entity.set_entity_as_no_longer_needed(huntv[i])
				entity.delete_entity(huntv[i])
				huntv = {}
			end
			for i = 1, #lester do
				entity.set_entity_as_no_longer_needed(lester[i])
				entity.delete_entity(lester[i])
			end
			playerFeatures[pid].features["hunter_loop"].feat.hidden = true
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["hunter_loop"].feat.on = false
features["hunter_loop"].feat.hidden = true

features["hunter_taskloop"] = {feat = menu.add_feature("Retask Lester on Death", "toggle", featureVars.lgr.id, function(feat)
			if feat.on then
				pped = player.get_player_ped(pid)
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
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["hunter_taskloop"].feat.on = false
features["hunter_taskloop"].feat.hidden = false

		--TODO: World Dump Run Check
features["World_Dump1"] = {feat = menu.add_feature("Dump World on this Cunt!(Frozen)", "action", featureVars.g.id, function(feat)
			if world_dumped then
				local pos = v3()
				pos = player.get_player_coords(pid)
				dumpfreeze_onplayer(pid, pos)
			end
			return HANDLER_POP
end), type = "action"}
features["World_Dump1"] = {feat = menu.add_feature("Dump peds n vehicles on player(Un-Frozen)", "action", featureVars.tr.id, function(feat)
			if world_dumped then
				local pos = v3()
				pos = player.get_player_coords(pid)
				dumpfreeze_ped_onplayer(pid, pos)
			end
			return HANDLER_POP
end), type = "action"}
--TODO: Alkonostlag
features["alkonost_lag"] = {feat = menu.add_feature("Alkonost Lag Area", "action_value_i", featureVars.lag.id, function(feat)
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
features["alkonost_lag"].feat.min = 1
features["alkonost_lag"].feat.max = 100
features["alkonost_lag"].feat.value = 15
features["alkonost_lagattach"] = {feat = menu.add_feature("Attach Alkonost's to player", "toggle", featureVars.lag.id, function(feat)
			if feat.on then
				pped = player.get_player_ped(pid)
				local pos = v3()
				local offset, rot = v3(0.0,0.0,0.0), v3(0.0,0.0,0.0)
				pos = player.get_player_coords(pid)
				for i = 1, #alkonost do
					entity.attach_entity_to_entity(alkonost[i], pped, 0, offset, rot, true, true, false, 0, true)
				end
				return HANDLER_CONTINUE
			end
			for i = 1, #alkonost do
				entity.set_entity_as_no_longer_needed(alkonost[i])
				entity.delete_entity(alkonost[i])
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
--TODO: kosatkalag
features["kosatka_lag"] = {feat = menu.add_feature("kosatka Lag Area", "action_value_i", featureVars.lag.id, function(feat)
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
features["kosatka_lag"].feat.min = 1
features["kosatka_lag"].feat.max = 100
features["kosatka_lag"].feat.value = 15
features["kosatka_lagattach"] = {feat = menu.add_feature("Attach Kosatka's to player", "toggle", featureVars.lag.id, function(feat)
			if feat.on then
				pped = player.get_player_ped(pid)
				local pos = v3()
				local offset = v3(0.0,0.0,0.0)
				local rot = v3(0.0,0.0,0.0)
				pos = player.get_player_coords(pid)
				for i = 1, #kosatka do
					entity.attach_entity_to_entity(kosatka[i], pped, 0, offset, rot, true, true, false, 0, true)
				end
				return HANDLER_CONTINUE
			end
			for i = 1, #kosatka do
				entity.set_entity_as_no_longer_needed(kosatka[i])
				entity.delete_entity(kosatka[i])
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
		--TODO: Kick System
		featureVars.ses = menu.add_feature("Script Event Spam", "parent", featureVars.k.id)
		featureVars.ses.hidden = NewDLC()
		
features["SE_Kick_Crash"] = {feat = menu.add_feature("New Randomised Kick Crash", "toggle", featureVars.k.id, function(feat)
	if feat.on then
	system.yield(1)
	SE_KickCrash(pid)
	system.yield(Settings["ScriptEvent_delay"])
	return HANDLER_CONTINUE
	end
	return HANDLER_POP
	end), type = "toggle", callback = function()
end}
features["SE_Kick_Crash"].feat.on = false	
	
local args_done = false
features["SE_CRASH_DATA1"] = {feat = menu.add_feature("SEKick Custom Arg Count:", "value_i", featureVars.k.id, function(feat)
			local Args = {}
			if feat.on then
			if args_done ~= true then
				Args = build_params(feat.value)
				system.yield(10000)
				args_done = true
				
			end
				-- player.unset_player_as_modder(pid, -1)
				if player.is_player_valid(pid)then
				for i = 1, #data do
					par1 = math.random(-1000, 99999999)
					par2 = math.random(20000, 99999999)
					par3 = math.random(-1, 1)
					par4 = math.random(-1, 9)
					par5 = math.random(-1, 1)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, Args)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par1, par2, par3, par4, par5, par1, par2, par3, par2})
					system.yield(Settings["ScriptEvent_delay"])
					
					system.yield(Settings["ScriptEvent_delay"])
				end
				end
				return HANDLER_CONTINUE
			end
			args_done = false
			return HANDLER_POP
end),
		type = "toggle", callback = function()
end}
features["SE_CRASH_DATA1"].feat.max = 100
features["SE_CRASH_DATA1"].feat.min = 1
features["SE_CRASH_DATA1"].feat.value = 100
features["SE_CRASH_DATA1"].feat.on = false
		
features["Kick1_Type1"] = {feat = menu.add_feature("Kick Data 1 Type 1", "toggle", featureVars.ses.id, function(feat)
			if feat.on then
			if player.is_player_valid(pid)then
				-- player.unset_player_as_modder(pid, -1)
				for i = 1, #data do
					par1 = math.random(-1000, 99999999)
					par2 = math.random(-1, 9)
					par3 = math.random(-1, 1)
					par4 = math.random(-1, 9)
					par5 = math.random(-1, 1)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2})
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})
					system.yield(Settings["ScriptEvent_delay"])
				end
			end
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end),
		type = "toggle", callback = function()
end}
features["Kick1_Type1"].feat.on = false

features["Kick1_Type2"] = {feat = menu.add_feature("Kick Data 1 Type 2", "toggle", featureVars.ses.id, function(feat)
			if feat.on then
				--player.unset_player_as_modder(pid, -1)
				if player.is_player_valid(pid)then
				for i = 1, #data do
					par1 = math.random(-1000, 99999999)
					par2 = math.random(-99999999999999, -9)
					par3 = math.random(46190868, 999999999)
					par4 = math.random(-1, 9)
					par5 = math.random(-99999999999999, -46190868)
					par6 = math.random(9999999999, 9999999899990868)
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1})
					system.yield(Settings["ScriptEvent_delay"])
				end
				end
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}

features["Kick1_Type2"].feat.on = false
features["Kick1_Type3"] = {feat = menu.add_feature("Kick Data 1 Type 3", "toggle", featureVars.ses.id, function(feat)
			if feat.on then
			if player.is_player_valid(pid)then
				for i = 1, #data do
					par1 = kick_param_data[math.random(1, #kick_param_data)]
					par2 = kick_param_data[math.random(1, #kick_param_data)]
					par3 = kick_param_data[math.random(1, #kick_param_data)]
					par4 = kick_param_data[math.random(1, #kick_param_data)]
					par5 = kick_param_data[math.random(1, #kick_param_data)]
					par6 = kick_param_data[math.random(1, #kick_param_data)]
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par6, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par6, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par6})
					system.yield(Settings["ScriptEvent_delay"])
					script.trigger_script_event(data[i], pid, {par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1})
					system.yield(Settings["ScriptEvent_delay"])
				end
			end
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Kick1_Type3"].feat.on = false
		
features["net-kick"] = {feat = menu.add_feature("Network Bail Kick", "action", featureVars.k.id, function(feat)
			player.unset_player_as_modder(pid, -1)
			local scid = player.get_player_scid(pid)
			local name = tostring(player.get_player_name(pid))
			script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
			
			system.yield(Settings["ScriptEvent_delay"])
			script.trigger_script_event(0x493FC6BB, pid, {pid, script.get_global_i(1893548 + (1 + (pid * 600)) + 511)})
			system.yield(Settings["ScriptEvent_delay"])
			Debug_Out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))
end), type = "action", callback = function()
end}
		
features["SE_Crash"] = {feat = menu.add_feature("Script Event Crash", "action", featureVars.k.id, function(feat)

				script.trigger_script_event(0xc50f74ca, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
				system.yield(Settings["ScriptEvent_delay"])
				script.trigger_script_event(0x8638a0ab, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
				system.yield(Settings["ScriptEvent_delay"])
				script.trigger_script_event(0xc50f74ca, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778,  23135423, 827870001, 23135423})
end), type = "action",  callback = function()
end}
		
features["SE1_Crash"] = {feat = menu.add_feature("New Script Event Crash", "toggle", featureVars.k.id, function(feat)
local Params = build_params(120)
if feat.on then
		if player.is_player_valid(pid) then
				for y = 1, #SECrash do
					script.trigger_script_event(SECrash[y], pid, Params)
					system.yield(Settings["ScriptEvent_delay"])
				end
			end
	return HANDLER_CONTINUE
end
return HANDLER_POP
end), type = "toggle",  callback = function()
end}
features["SE1_Crash"].feat.on = false
		
features["SEC-kick"] = {feat = menu.add_feature("Random Script Event Crash", "toggle", featureVars.k.id, function(feat)
			if feat.on then
				par1 = kick_param_data[math.random(1, #kick_param_data)]
				par2 = kick_param_data[math.random(1, #kick_param_data)]
				par3 = kick_param_data[math.random(1, #kick_param_data)]
				par4 = kick_param_data[math.random(1, #kick_param_data)]
				par5 = kick_param_data[math.random(1, #kick_param_data)]
				script.trigger_script_event(data[math.random(1, #data)], pid, {pid, par5, par3, par1, par5, par3, par1, par5, par3, pid, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, pid, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1})
				system.yield(Settings["ScriptEvent_delay"])
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
			
end), type = "toggle",  callback = function()
end}
features["SEC-kick"].feat.on = false
		
features["Apt_Inv_Spam"] = {feat = menu.add_feature("Spam Random Apt Invites", "toggle", featureVars.g.id, function(feat)
			if feat.on then
				Settings["playerlist_loop"] = 0
				par5 = kick_param_data[math.random(1, #kick_param_data)]
				script.trigger_script_event(0x23F74138, pid, {24, 24, 1, 0, par5, 1, 1, 1})
				system.yield(Settings["ScriptEvent_delay"])
				
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
			
end), type = "toggle", callback = function()
end}
features["Apt_Inv_Spam"].feat.on = false
features["Apt_Inv_Spam"].feat.hidden = NewDLC()
		
features["DisableGame"] = {feat = menu.add_feature("Disable Players Game & Give God", "action", featureVars.g.id, function(feat)
			if feat.on then
				script.trigger_script_event(0x23F74138, pid, {24, 24, 1, 0, 115, 1, 1, 1})
				system.yield(Settings["ScriptEvent_delay"])
				
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end), type = "action", callback = function()
end}
features["DisableGame"].feat.hidden = NewDLC()
		
features["AptInv_Spam"] = {feat = menu.add_feature("Spam Random Apt Invites v2", "toggle", featureVars.g.id, function(feat)
			if feat.on then
				Settings["playerlist_loop"] = 0
				par5 = math.ceil(math.random(0, 100))
				script.trigger_script_event(0x23F74138, pid, {24, 24, 1, 0, par5, 1, 1, 1})
				system.yield(6000)
				return HANDLER_CONTINUE
			end
			return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["AptInv_Spam"].feat.on = false
features["AptInv_Spam"].feat.hidden = NewDLC()
		
		playerFeatures[pid] = {feat = featureVars.f, scid = -1, features = features}
		featureVars.f.hidden = false
end
loop_logsent, count, playercount, check, ModderStart = false, 0, 0, 0, {{ismod = {}, start = {},}}

for pid = 0, 31 do
	ModderStart[pid] = {}
	ModderStart[pid].ismod = false
	ModderStart[pid].start = nil
end


loopFeat = menu.add_feature("New Loop Function", "toggle", globalFeatures.moist_tools.id, function(feat)
		if feat.on then
			local Online = network.is_session_started()
			if not Online then
				SessionHost = nil
				ScriptHost = nil
				loop_logsent = false
				Active_menu = nil
			end
			local lpid = player.player_id()
			for pid = 0, 31 do
				playerFeatures[pid].features["blamedorbital"].feat:set_str_data(Playerz)
				pped = player.get_player_ped(pid)
				local tbl = playerFeatures[pid]
				local f = tbl.feat
				local scid = player.get_player_scid(pid)
				SessionPlayers[pid].Scid = scid
				playerFeatures[pid].scid = scid
				if scid ~= 4294967295 then
					if f.hidden then
						f.hidden = false
					end
					Playerz[pid+1] = player.get_player_name(pid)
					local name = player.get_player_name(pid)
					Players[pid].name = name
					local toname = ""
					local isYou = lpid == pid
					local tags, tagz = {}, {}
					if Online then
						if isYou then
							tags[#tags + 1] = "Y"
						end
						if player.is_player_friend(pid) then
							tags[#tags + 1] = "F"
						end
						if player.is_player_host(pid) then
							tags[#tags + 1] = "H"
							toname = tostring(toname .."~h~~b~[H]")
							if SessionHost ~= pid then
								SessionHost = pid
								moist_notify(name, (isYou and "You Are Now The The Session Host!" or "The Session Host is Now"))
								Debug_Out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
							end
						end
						if pid == script.get_host_of_this_script() then
							tags[#tags + 1] = "S"
							toname = tostring(toname .. "~h~~y~[S]")
							if ScriptHost ~= pid then
								ScriptHost = pid
								moist_notify(name, (isYou and "You Are Now The Script Host!"  or  "The Script Host is Now"))
								Debug_Out(string.format("Script Host is Now : " .. (isYou and " you " or name)))
							end
						end
						if player.is_player_playing(pid) and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) then
							tags[#tags + 1] = "G"
						--playerFeatures[pid].features["GodCheck2"].feat.on = true
						playerFeatures[pid].features["GodCheck"].feat.on = true
						elseif player.is_player_playing(pid) and not player.is_player_god(pid) then
					--	playerFeatures[pid].features["GodCheck2"].feat.on = false
						playerFeatures[pid].features["GodCheck"].feat.on = false
					
						end
						if player.is_player_god(pid) and (tracking.playerped_speed1[pid + 1] >= 28) and Players[pid].isint ~= true then
							tagz[#tagz + 1] = "~h~~r~[G]"
							Players[pid].pulse = not Players[pid].pulse
							if not Players[pid].isgod and player.is_player_god(pid) and player.player_id() ~= pid then
								if Settings["GodCheckNotif"] and Settings["GodCheck"] then
									Debug_Out(string.format("Player: " .. name .. " [God Mode Player]"))
									moist_notify("God Mode Player:\n" .. pid .. " : " .. (SessionPlayers[pid].Name), "Modder Detection")
									
									Players[pid].isgod = true
								end
							end
						end
						-- if player.is_player_god(pid) and Players[pid].isint ~= true then
						-- tagz[#tagz + 1] = "~h~~r~[G]"
						-- Players[pid].pulse = not Players[pid].pulse
						-- if not Players[pid].isgod and player.is_player_god(pid) and player.player_id() ~= pid then
						-- if Settings["GodCheckNotif"] and Settings["GodCheck"] then
						-- Debug_Out(string.format("Player: " .. name .. " [God Mode Player]"))
						-- moist_notify("God Mode Player:\n" .. pid .. " : " .. (SessionPlayers[pid].Name), "Modder Detection")
						
						-- Players[pid].isgod = true
						-- end
						-- end
						-- end
						if player.is_player_playing(pid) and player.is_player_vehicle_god(pid) then
							tags[#tags + 1] = "V"
						playerFeatures[pid].features["GodCheck"].feat.on = true
						elseif player.is_player_playing(pid) and not player.is_player_vehicle_god(pid) then
					--	playerFeatures[pid].features["GodCheck2"].feat.on = false
						playerFeatures[pid].features["GodCheck"].feat.on = false
							
						end
						
						if player.is_player_vehicle_god(pid) and (tracking.playerped_speed1[pid + 1] >= 28) then
							tagz[#tagz + 1] = "~h~~o~[V]"
							Players[pid].pulse = not Players[pid].pulse
							if not Players[pid].isvgod and pid ~= player.player_id() then
								Debug_Out(string.format("Player: " .. name .. " [Vehicle Godmode]"))
								
								moist_notify("God Mode Vehicle:\n" .. pid .. " : " .. (name), "Modder Detection")
								Players[pid].isvgod = true
							end
						end
						if Players[pid].isint ~= true then
							if player.is_player_spectating(pid) and player.is_player_playing(pid) then
								tags[#tags + 1] = ".SPEC."
								Players[pid].pulse = not Players[pid].pulse
							end
						end
						if Players[pid].isint == true then
							Players[pid].pulse = false
						end
						if not isYou then
							if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1)then
								tags[#tags + 1] = "O"
								tagz[#tagz + 1] = "~h~~g~[O]"
								--toname = tostring(toname .. "~h~~g~[O]")
								if Settings["OTR_Blips"] and Players[pid].OTRBlipID == nil then
									Players[pid].OTRBlipID = ui.add_blip_for_entity(pped)
									ui.set_blip_colour(Players[pid].OTRBlipID, 2)
								end
							end
							
							if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  0) then
								if Players[pid].OTRBlipID ~= nil then
									ui.remove_blip(Players[pid].OTRBlipID)
									Players[pid].OTRBlipID = ui.get_blip_from_entity(pped)
									ui.remove_blip(Players[pid].OTRBlipID)
									Players[pid].OTRBlipID = nil
								end
							end
						end
						if not player.is_player_modder(pid, -1) then
							if (player.get_player_health(pid) > 100) and not (player.get_player_max_health(pid) > 0) then
								tags[#tags + 1] = "U"
								tagz[#tagz + 1] = "~h~~q~[U]"
								-- toname = tostring(toname .. "~h~~q~[U]")
							end
						end
						if not player.is_player_modder(pid, -1) then
							if (player.get_player_health(pid) == 0) and (player.get_player_max_health(pid) == 0) and (tracking.playerped_speed1[pid + 1] >= 10) then
								tags[#tags + 1] = "U"
								tagz[#tagz + 1] = "~h~~q~[U]"
								-- toname = tostring(toname .. "~h~~q~[U]")
							end
						end
						if Players[pid].bounty then
							tags[#tags + 1] = "[B:" .. Players[pid].bountyvalue .."]"
							tagz[#tagz + 1] = "~h~~p~[B:~h~~w~ " .. Players[pid].bountyvalue .. "~h~~p~]"
							-- toname = tostring(toname .. "~h~~p~[B: " .. Players[pid].bountyvalue .. "]")
						end
						if player.is_player_modder(pid, -1) then
							tags[#tags + 1] = "M"
							tagz[#tagz + 1] = "~r~~h~[~y~~h~M~r~~h~]"
							RAC_OFF(pid)
							modderflag(pid)
							elseif not player.is_player_modder(pid, -1) then
							Modders_DB[pid].ismod = false
						end
						
						if tbl.scid ~= scid then
							for cf_name,cf in pairs(tbl.features) do
								if cf.type == "toggle" and cf.feat.on then
									cf.feat.on = false
								end
							end
							tbl.scid = scid
							if not isYou then
								--TODO: Modder shit
							end
						end
					end
					if player.is_player_host(pid) or pid == script.get_host_of_this_script() then
						SessionPlayers[pid].Name = name .. " " .. toname
						system.wait(100)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. toname .. table.concat(tagz)
						end
						else
						SessionPlayers[pid].Name = name
						system.wait(100)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. table.concat(tagz)
						end
					end
					if #tags > 0 then
						name = name .. " [" .. table.concat(tags) .. "]"
					end
					if f.name ~= name then f.name = name end
					for cf_name,cf in pairs(tbl.features) do
						if (cf.type ~= "toggle" or cf.feat.on) and cf.callback then
							local status, err = pcall(cf.callback)
							if not status then
								moist_notify("Error running feature " .. i .. "\nOn pid: " .. pid, "MoistScript PlayerLoop Error")
								Print(status .. err)
							end
						end
					end
					else
					if not f.hidden then
						f.hidden = true
						for cf_name,cf in pairs(tbl.features) do
							if cf.type == "toggle" and cf.feat.on then
								cf.feat.on = false
							end
						end
					end
					Playerz[pid+1] = string.format("Player " .. pid)
				end
			end
			system.yield(Settings["playerlist_loop"])
			return HANDLER_CONTINUE
		end
		
		for i = 0, 31 do
			playerFeatures[i].feat.hidden = false
		end
		return HANDLER_POP
end)
loopFeat.hidden = false
loopFeat.on = false

loopFeat2 = menu.add_feature("Old Loop Function", "toggle", globalFeatures.moist_tools.id, function(feat)
    if feat.on then
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

            pped = player.get_player_ped(pid)
            tbl = playerFeatures[pid]
            f = tbl.feat
			local scid, name
            scid = player.get_player_scid(pid)
            SessionPlayers[pid].Scid = scid
            playerFeatures[pid].scid = scid
            if scid ~= 4294967295 then
                if f.hidden then
                    f.hidden = false
                end
				Playerz[pid+1] = player.get_player_name(pid)
                name = player.get_player_name(pid)
                Players[pid].name = name
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
                OrbitalStrike_AllEntities:set_str_data(Playerz)
				end
                    if isYou then
                        tags[#tags + 1] = "Y"
                    end
                    if player.is_player_friend(pid) then
                        tags[#tags + 1] = "F"
                    end
                    if player.is_player_host(pid) then
                        tags[#tags + 1] = "H"
                        toname = tostring(toname .."~h~~b~[H]")
                        if SessionHost ~= pid then
                            SessionHost = pid
                            moist_notify((isYou and "You Are Now The The Session Host!" or "The Session Host is Now") .."\n" .. name, nil)
                            Debug_Out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
                        end
                    end
                    if pid == script.get_host_of_this_script() then
                        tags[#tags + 1] = "S"
                        toname = tostring(toname .. "~h~~y~[S]")
                        if ScriptHost ~= pid then
                            ScriptHost = pid
                            moist_notify((isYou and "You Are Now The Script Host!"  or  "The Script Host is Now") .."\n" .. name, nil)
                            Debug_Out(string.format("Script Host is Now : " .. (isYou and " you " or name)))
                        end
                    end
					if entity.is_entity_dead(player.get_player_ped(pid)) then
                        GetKiller(pid)
                        Players[pid].isDead = true
                        Players[pid].PedSpawned = false
                    elseif not entity.is_entity_dead(player.get_player_ped(pid)) then
					Players[pid].isDead = false
					end
                    if player.is_player_playing(pid) and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) then
                        tags[#tags + 1] = "G"
					end
					if Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 1 then
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then 
						playerFeatures[pid].features["GodCheck"].feat.on  = true
						playerFeatures[pid].features["PBPulse"].feat.on  = true
					elseif not player.is_player_god(pid) or not player.is_player_vehicle_god(pid) then
						playerFeatures[pid].features["GodCheck"].feat.on  = false
						playerFeatures[pid].features["PBPulse"].feat.on  = false
                    end
					elseif Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 2 then
					if player.is_player_valid(pid) then
					playerFeatures[pid].features["GodCheck"].feat.on  = true
					playerFeatures[pid].features["PBPulse"].feat.on  = true
					elseif not player.is_player_valid(pid) then
						playerFeatures[pid].features["GodCheck"].feat.on  = false
						playerFeatures[pid].features["PBPulse"].feat.on  = false
					end
					end
					
                    if player.is_player_god(pid) and Players[pid].PlayerGodMode == true and Players[pid].isint ~= true--[[ and Players[pid].PedSpawned == true]]  then
                        tagz[#tagz + 1] = "~h~~r~[G]"
					end
                    if Players[pid].PlayerGodMode then
						tagz[#tagz] = "~h~~y~[~r~G~y~]"
						elseif not player.is_player_god(pid) then
						Players[pid].PlayerGodMode = false
                        end

						if player.is_player_playing(pid) and player.is_player_vehicle_god(pid) then
							tags[#tags + 1] = "V"
						end

                    if player.is_player_vehicle_god(pid) and Players[pid].PlayerVehGodMode == true and Players[pid].isint ~= true--[[ and Players[pid].PedSpawned == true]]  then
					if (tracking.playerped_speed1[pid + 1] >= 28) then
						if Players[pid].pulse == true then
                        tagz[#tagz + 1] = "~h~~o~[V]"
						else
						end
	
				
					
					elseif player.is_player_vehicle_god(pid) and (tracking.playerped_speed1[pid + 1] >= 28) then
					if Players[pid].pulse == true then
					tagz[#tagz + 1] = "~h~~y~[~o~V~y~]"
					end
					
					--playerFeatures[pid].features["GodCheck"].feat.on  = not playerFeatures[pid].features["GodCheck"].feat.on
					elseif Players[pid].PlayerVehGodMode then
					tagz[#tagz + 1] = "~h~~r~[~o~V~r~]"
					end
						
					end
                    if Players[pid].isint ~= true then
                        if player.is_player_spectating(pid) and player.is_player_playing(pid) then
                            tags[#tags + 1] = ".SPEC."
                           --Players[pid].pulse = not Players[pid].pulse
                        end
                    end

							if Players[pid].isTyping then
						    tags[#tags + 1] = "T"
                            tagz[#tagz + 1] = "~h~~q~[~h~~b~T~h~~q~]"
							end
							if player.get_player_armour(pid) > 50 then
						    tags[#tags + 1] = "U"
                            tagz[#tagz + 1] = "~h~~q~[U]"
							if Settings["GodCheckNotif"] and not Players[pid].isgod then
							moist_notify(name .. " Has Excessive Armour ", "Modder Detection")
							Players[pid].isgod = true
							end
						end
					
                    -- if Players[pid].isint == true then
                        -- Players[pid].pulse = false
                    -- end
                    if not isYou then
					if not NewDLC() then
					     if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1)then
                            tags[#tags + 1] = "O"
                            tagz[#tagz + 1] = "~h~~g~[O]"
                            --toname = tostring(toname .. "~h~~g~[O]")
                            if Settings["OTR_Blips"] and Players[pid].OTRBlipID == nil then
                                Players[pid].OTRBlipID = ui.add_blip_for_entity(pped)
								 Debug_Out(string.format("Start Player OTR: " .. name .. "\n"))
                                ui.set_blip_colour(Players[pid].OTRBlipID, 2)
                            end
                        end

                        if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  0) then
                            if Players[pid].OTRBlipID ~= nil then
							 Debug_Out(string.format("Player OTR End: " .. name .. "\n"))
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
                            -- toname = tostring(toname .. "~h~~q~[U]")
                        end
                    end
                    if not player.is_player_modder(pid, -1) then
                        if (player.get_player_health(pid) == 0) and (player.get_player_max_health(pid) == 0) and (tracking.playerped_speed1[pid + 1] >= 10) then
                            tags[#tags + 1] = "U"
                            tagz[#tagz + 1] = "~h~~q~[U]"
                            -- toname = tostring(toname .. "~h~~q~[U]")
                        end
                    end
                    if Players[pid].bounty then
                        tags[#tags + 1] = "[B:" .. Players[pid].bountyvalue .."]"
                        tagz[#tagz + 1] = "~h~~p~[B:~h~~w~ " .. Players[pid].bountyvalue .. "~h~~p~]"
                        -- toname = tostring(toname .. "~h~~p~[B: " .. Players[pid].bountyvalue .. "]")
                    end
                    if player.is_player_modder(pid, -1) then
							tags[#tags + 1] = "M"
							tagz[#tagz + 1] = "~r~~h~[~y~~h~M~r~~h~]"
							RAC_OFF(pid)
							modderflag(pid)
							elseif not player.is_player_modder(pid, -1) then
							Modders_DB[pid].ismod = false
						end
						
						
                    if not player.is_player_modder(pid, -1) then

                        Modders_DB[pid].ismod = false
                    end
					-- if interior.get_interior_from_entity(pped) ~= 0 then
					-- Players[pid].isint = true
					-- end
											
						if tbl.scid ~= scid then
							for cf_name,cf in pairs(tbl.features) do
								if cf.type == "toggle" and cf.feat.on then
									cf.feat.on = false
								end
							end
							tbl.scid = scid
							if not isYou then
								--TODO: Modder shit
							end
						end
					end
					if player.is_player_host(pid) or pid == script.get_host_of_this_script() then
						SessionPlayers[pid].Name = name .. " " .. toname
					--system.wait(0)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. toname .. table.concat(tagz)
						end
						else
						SessionPlayers[pid].Name = name
					--	system.wait(0)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. table.concat(tagz)
						end
					end
					if #tags > 0 then
						name = name .. " [" .. table.concat(tags) .. "]"
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
                    f.hidden = true
                    for cf_name,cf in pairs(tbl.features) do
                        if cf.type == "toggle"  or cf.type == "value_str" or cf.type == "value_i" or cf.type == "value_f" and cf.feat.on then
                            cf.feat.on = false
                        end
                    end
                end
                Playerz[pid+1] = string.format("Player " .. pid)
            end
        end
        system.yield(Settings["playerlist_loop"])
        return HANDLER_CONTINUE
end
    for i = 0, 31 do
        playerFeatures[i].feat.hidden = false
end
    return HANDLER_POP
end)

loopFeat2.hidden = false
loopFeat2.on = true

Modder_Start = {{pid = {},}}
OTR_Start = {{pid = {},}}

loopFeat3 = menu.add_feature("Experimental Loop Function", "toggle", globalFeatures.moist_tools.id, function(feat)
    if feat.on then
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

            pped = player.get_player_ped(pid)
            tbl = playerFeatures[pid]
            f = tbl.feat
			local scid, name
            scid = player.get_player_scid(pid)
            SessionPlayers[pid].Scid = scid
            playerFeatures[pid].scid = scid
            if scid ~= 4294967295 then
                if f.hidden then
                    f.hidden = false
                end
				Playerz[pid+1] = player.get_player_name(pid)
                name = player.get_player_name(pid)
                Players[pid].name = name
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
                OrbitalStrike_AllEntities:set_str_data(Playerz)
				end
                    if isYou then
                        tags[#tags + 1] = "Y"
                    end
                    if player.is_player_friend(pid) then
                        tags[#tags + 1] = "F"
                    end
                    if player.is_player_host(pid) then
                        tags[#tags + 1] = "H"
                        toname = tostring(toname .."~h~~b~[H]")
                        if SessionHost ~= pid then
                            SessionHost = pid
                            moist_notify((isYou and "You Are Now The The Session Host!" or "The Session Host is Now") .."\n" .. name, nil)
                            Debug_Out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
                        end
                    end
                    if pid == script.get_host_of_this_script() then
                        tags[#tags + 1] = "S"
                        toname = tostring(toname .. "~h~~y~[S]")
                        if ScriptHost ~= pid then
                            ScriptHost = pid
                            moist_notify((isYou and "You Are Now The Script Host!"  or  "The Script Host is Now") .."\n" .. name, nil)
                            Debug_Out(string.format("Script Host is Now : " .. (isYou and " you " or name)))
                        end
                    end
					if entity.is_entity_dead(player.get_player_ped(pid)) then
                        GetKiller(pid)
                        Players[pid].isDead = true
                        Players[pid].PedSpawned = false
                    elseif not entity.is_entity_dead(player.get_player_ped(pid)) then
					Players[pid].isDead = false
					end
                    if player.is_player_playing(pid) and player.is_player_god(pid) and not entity.is_entity_dead(player.get_player_ped(pid)) then
                        tags[#tags + 1] = "G"
					end
					if Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 1 then
					if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then 
						playerFeatures[pid].features["GodCheck"].feat.on  = true
						playerFeatures[pid].features["PBPulse"].feat.on  = true
					elseif not player.is_player_god(pid) or not player.is_player_vehicle_god(pid) then
						playerFeatures[pid].features["GodCheck"].feat.on  = false
						playerFeatures[pid].features["PBPulse"].feat.on  = false
                    end
					elseif Settings["GodCheck"] and Settings["PlayerGodCheckVersion"] == 2 then
					if player.is_player_valid(pid) then
					playerFeatures[pid].features["GodCheck"].feat.on  = true
					playerFeatures[pid].features["PBPulse"].feat.on  = true
					elseif not player.is_player_valid(pid) then
						playerFeatures[pid].features["GodCheck"].feat.on  = false
						playerFeatures[pid].features["PBPulse"].feat.on  = false
					end
					end
					
                    if player.is_player_god(pid) and Players[pid].PlayerGodMode == true and Players[pid].isint ~= true--[[ and Players[pid].PedSpawned == true]]  then
                        tagz[#tagz + 1] = "~h~~r~[G]"
					end
                    if Players[pid].PlayerGodMode then
						tagz[#tagz] = "~h~~y~[~r~G~y~]"
						elseif not player.is_player_god(pid) then
						Players[pid].PlayerGodMode = false
                        end

						if player.is_player_playing(pid) and player.is_player_vehicle_god(pid) then
							tags[#tags + 1] = "V"
						end

                    if player.is_player_vehicle_god(pid) and Players[pid].PlayerVehGodMode == true and Players[pid].isint ~= true--[[ and Players[pid].PedSpawned == true]]  then
					if (tracking.playerped_speed1[pid + 1] >= 28) then
						if Players[pid].pulse == true then
                        tagz[#tagz + 1] = "~h~~o~[V]"
						else
						end
	
				
					
					elseif player.is_player_vehicle_god(pid) and (tracking.playerped_speed1[pid + 1] >= 28) then
					if Players[pid].pulse == true then
					tagz[#tagz + 1] = "~h~~y~[~o~V~y~]"
					end
					
					--playerFeatures[pid].features["GodCheck"].feat.on  = not playerFeatures[pid].features["GodCheck"].feat.on
					elseif Players[pid].PlayerVehGodMode then
					tagz[#tagz + 1] = "~h~~r~[~o~V~r~]"
					end
						
					end
                    if Players[pid].isint ~= true then
                        if player.is_player_spectating(pid) and player.is_player_playing(pid) then
                            tags[#tags + 1] = ".SPEC."
                           --Players[pid].pulse = not Players[pid].pulse
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
					
                    -- if Players[pid].isint == true then
                        -- Players[pid].pulse = false
                    -- end
                    if not isYou then
					if not NewDLC() then
					     if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  1)then
                            tags[#tags + 1] = "O"
                            tagz[#tagz + 1] = "~h~~g~[O]"
							if OTR_Start[pid] == nil then
					name = player.get_player_name(pid) 
					OTR_Start[pid] = tonumber(utils.time())
					end
					if OTR_Start[pid] ~= nil then
						if tonumber((utils.time()) - (OTR_Start[pid])) <= 1 then
						if name == name then name = "**OFF THE RADAR**" end
						end
						if tonumber((utils.time()) - (OTR_Start[pid])) >= 2 then
						 if name ~= player.get_player_name(pid) then name = player.get_player_name(pid) end
						 if tonumber((utils.time()) - (OTR_Start[pid])) >= 8 then
						--name = player.get_player_name(pid)
						OTR_Start[pid] = tonumber(utils.time())
						--ModderStart[pid] = nil
						end
					
						end
					end
						-- end
					

                            --toname = tostring(toname .. "~h~~g~[O]")
                            if Settings["OTR_Blips"] and Players[pid].OTRBlipID == nil then
                                Players[pid].OTRBlipID = ui.add_blip_for_entity(pped)
								 Debug_Out(string.format("Start Player OTR: " .. name .. "\n"))
                                ui.set_blip_colour(Players[pid].OTRBlipID, 2)
                            end
                        end

                        if (script.get_global_i(2689156 + (1 + (pid * 453)) + 209) ==  0) then
                            if Players[pid].OTRBlipID ~= nil then
							 Debug_Out(string.format("Player OTR End: " .. name .. "\n"))
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
                            -- toname = tostring(toname .. "~h~~q~[U]")
                        end
                    end
                    if not player.is_player_modder(pid, -1) then
                        if (player.get_player_health(pid) == 0) and (player.get_player_max_health(pid) == 0) and (tracking.playerped_speed1[pid + 1] >= 10) then
                            tags[#tags + 1] = "U"
                            tagz[#tagz + 1] = "~h~~q~[U]"
                            -- toname = tostring(toname .. "~h~~q~[U]")
                        end
                    end
                    if Players[pid].bounty then
                        tags[#tags + 1] = "[B:" .. Players[pid].bountyvalue .."]"
                        tagz[#tagz + 1] = "~h~~p~[B:~h~~w~ " .. Players[pid].bountyvalue .. "~h~~p~]"
                        -- toname = tostring(toname .. "~h~~p~[B: " .. Players[pid].bountyvalue .. "]")
                    end
                   if player.is_player_modder(pid, -1) then
                        tags[#tags + 1] = "M"
                        tagz[#tagz + 1] = "~r~~h~[~y~~h~M~r~~h~]"				   
                        RAC_OFF(pid)
					if Modder_Start[pid] == nil then
					name = player.get_player_name(pid) 
					Modder_Start[pid] = tonumber(utils.time())
					end
					if Modder_Start[pid] ~= nil then
						if tonumber(utils.time() - Modder_Start[pid]) <= 1 then
						if name == name then name = "! M O D D E R !" end
						end
						if tonumber(utils.time() - Modder_Start[pid]) >= 2 then
						 if name ~= player.get_player_name(pid) then name = player.get_player_name(pid) end
						 if tonumber(utils.time() - Modder_Start[pid]) >= 8 then
						--name = player.get_player_name(pid)
						Modder_Start[pid] = tonumber(utils.time())
						--ModderStart[pid] = nil
						end
					end
						end
						if not Settings["Auto_Off_RAC"] then
						--ModderStart[pid] = nil
                        modderflag(pid)
						
						end
						
                    elseif not player.is_player_modder(pid, -1) then
					ModderStart[pid] = nil
                        Modders_DB[pid].ismod = false
                    end
					-- if interior.get_interior_from_entity(pped) ~= 0 then
					-- Players[pid].isint = true
					-- end
											
						if tbl.scid ~= scid then
							for cf_name,cf in pairs(tbl.features) do
								if cf.type == "toggle" and cf.feat.on then
									cf.feat.on = false
								end
							end
							tbl.scid = scid
							if not isYou then
								--TODO: Modder shit
							end
						end
					end
					if player.is_player_host(pid) or pid == script.get_host_of_this_script() then
						SessionPlayers[pid].Name = name .. " " .. toname
					--system.wait(0)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. toname .. table.concat(tagz)
						end
						else
						SessionPlayers[pid].Name = name
					--	system.wait(0)
						if #tagz > 0 then
							SessionPlayers[pid].Name = name .. " " .. table.concat(tagz)
						end
					end
					if #tags > 0 then
						name = name .. " [" .. table.concat(tags) .. "]"
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
                    f.hidden = true
                    for cf_name,cf in pairs(tbl.features) do
                        if cf.type == "toggle"  or cf.type == "value_str" or cf.type == "value_i" or cf.type == "value_f" and cf.feat.on then
                            cf.feat.on = false
                        end
                    end
                end
                Playerz[pid+1] = string.format("Player " .. pid)
            end
        end
        system.yield(Settings["playerlist_loop"])
        return HANDLER_CONTINUE
end
    for i = 0, 31 do
        playerFeatures[i].feat.hidden = false
end
    return HANDLER_POP
end)

loopFeat3.hidden = false
loopFeat3.on = false
end
ScriptLocals["playerlist"]()

function OnlineResetCheck()
	for pid = 0, 31 do
		if player.is_player_valid(pid) ~= false then
			playerRDB(pid)
		end
		
		playergroups[pid + 1]  = player.get_player_group(pid)
		playerpeds[pid + 1] = player.get_player_ped(pid)
		interiorcheckpid(pid, Settings["PlayerCheckVersion"])
		God_Check_pid(pid)
		God_Check1_pid(pid)
		OrbitalProxy(pid)
	
		end
		
end
notify_colour_setting()
Create_Csv()
recentplayerslist()
OnlineResetCheck()
TripletSpawns()

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

if #escort == 0 or nil then return end
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
if #escortveh == 0 or nil then return end
for y = 1, #escortveh do
	network.request_control_of_entity(escortveh[y])
	entity.detach_entity(escortveh[y])
	entity.set_entity_coords_no_offset(escortveh[y], pos)
	entity.set_entity_as_no_longer_needed(escortveh[y])
	entity.delete_entity(escortveh[y])
end
if #boobs == 0 or nil then return end
for i = 1, #boobs do
	network.request_control_of_entity(boobs[i])
	ped.clear_ped_tasks_immediately(boobs[i])
	entity.set_entity_coords_no_offset(boobs[i], pos)
	entity.set_entity_as_no_longer_needed(boobs[i])
	entity.delete_entity(boobs[i])
end
if #boobveh == 0 or nil then return end
for y = 1, #boobveh do
	network.request_control_of_entity(boobveh[y])
	entity.detach_entity(boobveh[y])
	entity.set_entity_coords_no_offset(boobveh[y], pos)
	entity.set_entity_as_no_longer_needed(boobveh[y])
	entity.delete_entity(boobveh[y])
end

if #lester == 0 or nil then return end
for i = 1, #lester do
	network.request_control_of_entity(lester[i])
	ped.clear_ped_tasks_immediately(lester[i])
	entity.set_entity_coords_no_offset(lester[i], pos)
	entity.set_entity_as_no_longer_needed(lester[i])
	entity.delete_entity(lester[i])
end
if #lesveh == 0 or nil then return end
for y = 1, #lesveh do
	network.request_control_of_entity(lesveh[y])
	entity.detach_entity(lesveh[y])
	entity.set_entity_coords_no_offset(lesveh[y], pos)
	entity.set_entity_as_no_longer_needed(lesveh[y])
	entity.delete_entity(lesveh[y])
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
	 event.remove_event_listener("player_join",  Join_Event_Check)
	 event.remove_event_listener("player_join", joining_players_logger)
	 event.remove_event_listener("player_join", Passive_trackerIN)
	 event.remove_event_listener("player_leave", Passive_trackerOUT)
	
	
end)

end
		


local execstate
local exec_errors

function Load_Module(scriptname)
        local file = Paths.Root .. "\\scripts\\" .. scriptname
        local a = assert(loadfile(file))
        return a()
end

 local status, err = pcall(Load_Moist)
execstate = status
exec_errors = tostring(exec_errors) .. tostring(err) .. "\n" or tostring(err) .. "\n"
if not status then
print(tostring(status) .. " Function Error " .. tostring(err))
menu.notify("Load_Moist: Settings check function\nStatus = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error", 5, 0xff0000ff)

end

local status, err = pcall(Moist_Script_Main)
execstate = status
exec_errors = tostring(exec_errors) .. tostring(err) .. "\n" or tostring(err) .. "\n"
if not status then
print(tostring(status) .. " Function Error " .. tostring(err))
menu.notify("Moist_Script_Main: Main Script Body\nStatus = " .. tostring(status) .."\nError = " .. tostring(err), "Script Function Error", 5, 0xff0000ff)

end
local status, err = pcall(scriptloader)

local status, err = pcall(Load_Module, "Moists Modder_Module.lua")
if not status then
print(tostring(status) .. " Function Error " .. tostring(err))
menu.notify("Status = " .. tostring(status) .."\nError = " .. tostring(err), "Modder Module Execution Error", 5, 0xffffff00)
elseif status then
menu.notify("All Modules & MoistScript\nLoaded and any Scripts for Autoload")
end

