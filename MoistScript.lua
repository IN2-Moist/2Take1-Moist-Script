--[[
 Credits & Thanks to Kektram for help with OTR Code and some code Advice
 Thanks to haekkzer for his help and advice over time i was a tester for the menu
 Thanks to Sai for his help and code for the script loader
 
 Big thanks goes Proddy for all his coding help advice and work to get shit done which without him alot of this
 script would  not exist!
 
--]]
local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
utils.make_dir(rootPath .. "\\Blacklist")
utils.make_dir(rootPath .. "\\lualogs")
utils.make_dir(rootPath .. "\\scripts\\MoistsLUA_cfg")


--DATA FILES
local data, data2, data3 = {}, {}, {}
local configfile = rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini"
local scidFile = rootPath .. "\\Blacklist\\scid.list"
local kickdata = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks.data"
local kickdata2 = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks2.data"
local kickdata3 = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks3.data"
local Spamtxt_Data = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moists_Spamset.data"
local debugfile = rootPath.."\\lualogs\\Moists_debug.log"

--output functions
local Cur_Date_Time
function get_date_time()

    local d = os.date()

    local dtime = string.match(d, "%d%d:%d%d:%d%d")

    local dt = os.date("%d/%m/%y%y")
    Cur_Date_Time = (string.format("["..dt.."]".."["..dtime.."]"))
    return (string.format("["..dt.."]".."["..dtime.."]"))
end

function debug_out(text)
    get_date_time()

    local file = io.open(rootPath.."\\lualogs\\Moists_debug.log", "a")
    io.output(file)
    io.write("\n"..Cur_Date_Time .."\n")
    io.write(text)
    io.close()
end

function debug_out_Nodate(text)
    get_date_time()

    local file = io.open(rootPath.."\\lualogs\\Moists_debug.log", "a")
    io.output(file)
    io.write("\n")
    io.write(text)
    io.close()
end

function dataload()
    if not utils.file_exists(kickdata) then	return end
    for line in io.lines(kickdata) do data[#data + 1] = line end
    --moist_notify("Moists Kick Data File 1 Loaded\n",  "Kick Type 1 Now Available")
end
dataload()

function dataload2()
    if not utils.file_exists(kickdata2) then	return end
    for line in io.lines(kickdata2) do data2[#data2 + 1] = line end
    --moist_notify("Moists Kick Data File 2 Loaded\n", "Kick Type 2 Now Available")
end
dataload2()

function dataload3()
    if not utils.file_exists(kickdata3) then	return end
    for line in io.lines(kickdata3) do data3[#data3 + 1] = line end
    --moist_notify("Moists Kick Data File 2 Loaded\n", "Kick Type 2 Now Available")
end
dataload3()

--Get Offset to self POS
local SelfoffsetPos = v3()

function Self_offsetPos(pos, heading, distance)
    heading = math.rad((heading - 180) * -1)
    return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset2me(dist)
    local pos = player.get_player_coords(player.player_id())
    print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
    SelfoffsetPos = Self_offsetPos(pos, player.get_player_heading(player.player_id()), dist)
    print(string.format("%s, %s, %s", SelfoffsetPos.x, SelfoffsetPos.y, SelfoffsetPos.z))
end

--TODO: offset to player calculation

local offsetPos = v3()
function OffsetCoords(pos, heading, distance)
    heading = math.rad((heading - 180) * -1)
    return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset(pid, dist)
    local pos = player.get_player_coords(pid)
    print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
    offsetPos = OffsetCoords(pos, player.get_player_heading(pid), dist)

    print(string.format("%s, %s, %s", offsetPos.x, offsetPos.y, offsetPos.z))
    return offsetPos
end

--TODO: Script Settings Set & save
local save_ini = rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini"

local toggle_setting = {}
local setting = {}
toggle_setting[#toggle_setting+1] = "MoistsScript"
setting[toggle_setting[#toggle_setting]] = "2.0.1.9"
toggle_setting[#toggle_setting+1] = "PlyTracker.track_all"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.otr_plyr_osd"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "OSD.modvehspeed_osd"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.modspec_osd"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.Player_bar"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "aimDetonate_control"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "osd_date_time"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "force_wPara"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "force_wBPH"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "lag_out"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "global_func.mk1boostrefill"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "global_func.mk2boostrefill"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "global_func.veh_rapid_fire"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "global_func.rapidfire_hotkey1"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "showSpawns"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "NotifyColorDefault"
setting[toggle_setting[#toggle_setting]] = 002
toggle_setting[#toggle_setting+1] = "NotifyVarDefault"
setting[toggle_setting[#toggle_setting]] = 4
toggle_setting[#toggle_setting+1] = "Weapon_Recticle"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "no_peds"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "no_traffic"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "net_log"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "chat_log"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "script_check_logger"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "NetEventHook"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "Blacklist_ON"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "Blacklist_Mark"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "Blacklist_kick"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "global_func.thermal_stat_switch_hotkey"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "osd_My_speed1"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "osd_My_speed2"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "RPG_HOTFIRE"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "counter_Hotkey"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "spam_wait"
setting[toggle_setting[#toggle_setting]] = 0

function saveSettings()

    local save_ini = io.open(save_ini, "w")
    io.output(save_ini)
    for i, k in pairs(toggle_setting) do
        io.write(k.."="..tostring(setting[k]).."\n")
    end
    io.close(save_ini)
end

local save_ini_file = io.open(rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini", "a")
toggle = 1

if not utils.file_exists(rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini") then
    io.output(save_ini_file)
    io.write("[MoistsScript]")
    io.close()
end


for line in io.lines(save_ini) do
    local line = string.gsub(line, toggle_setting[toggle] .. "=", "")
    if toggle == 1 and setting["MoistsScript"] ~= line then
    end
    if line == "true" then
        setting[toggle_setting[toggle]] = true
    elseif line == "false" then
        setting[toggle_setting[toggle]] = false
    elseif line ~= "nil" then
        if tonumber(line) ~= nil then
            setting[toggle_setting[toggle]] = tonumber(line)
        else
            setting[toggle_setting[toggle]] = line
        end
    end
    toggle = toggle + 1

end


--TODO: Arrays for function variables
local OSD = {}
local OptionsVar, PlyTracker = {},{}
local tracking = {}
tracking.playerped_posi, tracking.playerped_speed1, tracking.playerped_speed2, tracking.playerped_speed3 = {}, {}, {}, {}

--TODO: Data & Entity Arrays
local escort, escortveh, spawned_cunts = {}, {}, {}
local groupIDs, allpeds, allveh, allobj, allpickups = {}, {}, {}, {}, {}
local scids = {}
local scidN = 0
local RemoveBlacklistFeature

--TODO: Function Arrays
local alkonost, kosatka = {}, {}

--TODO: Function Localisation
local ScriptTR = script.trigger_script_event
math.randomseed(utils.time_ms())

--TODO: Function Variables
local pos_bool
local myplygrp, plygrp
local spam_wait = setting["spam_wait"]
local preset_color = setting["NotifyColorDefault"]
local notifytype = setting["NotifyVarDefault"]
local AnonymousBounty = true
local trigger_time = nil
local cleanup_done = true
local world_dumped = true
local kicklogsent = false
local logsent = false
local spawnoptions_loaded = false

--Modder Flag Variables
local mod_flag_1, mod_flag_2, mod_flag_3, mod_flag_4, mod_flag_5

--Modder Detection Hooks
local hook_id = 0
local hookID = 01
local hookID1 = 02
local hookID2 = 03
local hookID3 = 04
local hookID4 = 05
local hookID5 = 06
local hookID6 = 07

--Util functions
local notif = ui.notify_above_map

local function notify_above_map(msg)
    ui.notify_above_map(tostring("<font size='12'>~l~~y~" ..msg),  "~r~~h~Ω MoistsScript 2.0.1.9\n~p~~h~Moist Edition", 175)
end

function moist_notify(msg1, msg2)

    local color = preset_color
    msg1 = msg1 or " ~h~~o~~ex_r*~"
    msg2 = msg2 or " ~h~~w~~ex_r*~"

    if notifytype == 1 then
        ui.notify_above_map("~h~~r~" ..msg1 .."~y~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~p~~h~Moist Edition", color)
    end
    if notifytype == 2 then
        ui.notify_above_map("~h~" ..msg1 .."~h~~l~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~p~~h~Moist Edition", color)
    end

    if notifytype == 3 then
        ui.notify_above_map("~h~~y~" ..msg1 .."~w~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~p~~h~Moist Edition", color)
    end
    if notifytype == 4 then
        ui.notify_above_map("~h~~b~" .. msg1 .."~y~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~p~~h~Moist Edition", color)
    end

    if notifytype == 5 then
        ui.notify_above_map("~h~~g~" ..msg1 .."~b~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~b~~h~Moist Edition", color)
    end
    if notifytype == 6 then
        ui.notify_above_map(msg1 .."~h~" .. msg2, "~r~~h~Ω MoistsScript 2.0.1.9\n~g~~h~Moist Edition", color)
    end

end


--TODO: Modder Flagging
local int_flags = {65536, 131072, 262144, 524288, 1048576, 2097152, 4194304}
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
        if player.get_modder_flag_text(int_flags[i]) == "netev_modder" then
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
        mod_flag_5 = player.add_modder_flag("netev_modder")
    end
end
modflag_set()


--TODO: Preset Data Arrays
spam_presets = {}
local spamm = {}
spamm.var = {}
local spammRU = {}
spammRU.var = {}

spam_preset = {
  {"Love Me", "Love Me"},
  {"Eat Dick", "EAT D I C K  !"},
  {"Fuck You! MassSpam", "Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!\nFuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!Fuck You!"},
  {"Suck Cum Drip Cunt MassSpam", "SUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \nSUCK MY CUM DRIPPING C U N T ! YOU F U C K ! \n"},
  {"FAGGOT", "F A G G O T"},
  {"Cry", "CRY"},
  {"Suck", "SUCK"},
  {"You Suck MassSpam", "YOU SUCK \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n YOU SUCK  \n "},
  {"Insert Space", " "},
{"Big ! ScreenSpam", string.format("!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			!			!			!			\n!			!			!			")}}
russian_spam = {
  {"Russia sucks", "Россия отстой"},
  {"Death to Russia", "Смерть в Россию"},
  {"Kill all Russians", "Убить всех русских"},
  {"Suck My Dick Russia", "Соси мой член, Россия"},
  {"Suck Dick Russia", "СОСАТЬ ДИК РОССИЯ"},
  {"Pussy", "киска"},
  {"Cunt", "пизда"},
  {"Learn English russian Sucks", "Учите английский! Русский отстой! !"},
  {"I'm going to kill all russians!", "Я собираюсь убить все русские! Пожалуйста Идентифицировать себя! Готовься к смерти"},
}


local heiststat_setup = {
  {"MP0_H3_COMPLETEDPOSIX", -1},
  {"MP0_H3OPT_APPROACH", 1},
  {"MP0_H3_HARD_APPROACH", 3},
  {"MP0_H3OPT_TARGET", 3},
  {"MP0_H3OPT_POI", 1023},
  {"MP0_H3OPT_ACCESSPOINTS", 2047},
  {"MP0_H3OPT_BITSET1", -1},
  {"MP0_H3OPT_CREWWEAP", 1},
  {"MP0_H3OPT_CREWDRIVER", 1},
  {"MP0_H3OPT_CREWHACKER", 5},
  {"MP0_H3OPT_WEAPS", 1},
  {"MP0_H3OPT_VEHS", 3},
  {"MP0_H3OPT_DISRUPTSHIP", 3},
  {"MP0_H3OPT_BODYARMORLVL", 3},
  {"MP0_H3OPT_KEYLEVELS", 2},
  {"MP0_H3OPT_MASKS", math.ceil(math.random(0, 12))},
  {"MP0_H3OPT_BITSET0", -1},
}

local presets = {{"beyond_limits", -173663.281250,915722.000000,362299.750000},{"God Mode Death (Kill Barrier)", -1387.175,-618.242,30.362},{"Ocean God Mode Death\n(Outside Limits Deep Ocean)",  -5784.258301,-8289.385742,-136.411270},{"Chiliad", 491.176,5529.808,777.503},{"Lesters House", 1275.544,-1721.774,53.967},{"arena", -264.297,-1877.562,27.756},{"ElysianIslandBridge", -260.923,-2414.139,124.008},{"LSIAFlightTower", -983.292,-2636.995,89.524},{"TerminalCargoShip", 983.303,-2881.645,21.619},{"ElBurroHeights", 1583.022,-2243.034,93.265},{"CypressFlats", 552.672,-2218.876,68.981},{"LaMesa", 1116.815,-1539.787,52.146},{"SupplyStreet", 777.631,-695.813,28.763},{"Noose", 2438.874,-384.409,92.993},{"TatavianMountains", 2576.999,445.654,108.456},{"PowerStation", 2737.046,1526.873,57.494},{"WindFarm", 2099.765,1766.219,102.698},{"Prison", 1693.473,2652.971,61.335},{"SandyShoresRadioTower", 1847.034,3772.019,33.151},{"AlamoSea", 719.878,4100.993,39.154},{"RebelRadioTower", 744.500,2644.334,44.400},{"GreatChaparral", -291.035,2835.124,55.530},{"ZancudoControlTower", -2361.625,3244.962,97.876},{"NorthChumash(Hookies)", -2205.838,4298.805,48.270},{"AltruistCampRadioTower", -1036.141,4832.858,251.595},{"CassidyCreek", -509.942,4425.454,89.828},{"MountChiliad", 462.795,5602.036,781.400},{"PaletoBayFactory", -125.284,6204.561,40.164},{"GreatOceanHwyCafe", 1576.385,6440.662,24.654},{"MountGordoRadioTower", 2784.536,5994.213,354.275},{"MountGordoLighthouse", 3285.519,5153.820,18.527},{"GrapeSeedWaterTower", 1747.518,4814.711,41.666},{"TatavianMountainsDam", 1625.209,-76.936,166.651},{"VinewoodHillsTheater", 671.748,512.226,133.446},{"VinewoodSignRadioTowerTop", 751.179,1245.13,353.832},{"Hawik", 472.588,-96.376,123.705},{"PacificSrandardBank", 195.464,224.341,143.946},{"WestVinewoodCrane", -690.273,219.728,137.518},{"ArcadiasRadioTower", -170.232,-586.307,200.138},{"HookahPalaceSign",-1.414,-1008.324,89.189},{"MarinaAirportRadioTower",-697.010, -1419.530,5.001},{"DelperoFerrisWheel", -1644.193,-1114.271,13.029},{"VespucciCanalsClockTower", -1238.729,-853.861,77.758},{"DelPeroNrMazebankwest", -1310.777,-428.985,103.465},{"pacifficBluffs", -2254.199,326.088,192.606},{"GWC&GolfingSociety", -1292.052,286.209,69.407},{"Burton", -545.979,-196.251,84.733},{"LosSantosMedicalCenter", 431.907,-1348.709,44.673},{"BanhamCanyon", -3085.451,774.426,20.237},{"TongvaHills", -1874.280,2064.565,150.852},{"SanChianskiMountainRange", 2900.166,4325.987,102.101},{"HumaineLabs", 3537.104,3689.238,45.228},{"YouToolStoreSanChianski", 2761.944,3466.951,55.679},{"GalileoObservatory", -422.917,1133.272,325.855},{"GrndSeroraDesertCementwks", 1236.649,1869.214,84.824}}
-- local scriptEvents = {0x0fb7b2c5,0x1C2C3329,0x1f63a94e,0x4fbc297f,0x5f21fcaa,0x7b505065,0x7d556776,0x8b37581a,0x11fa24fa,0x073c8336,0x75bf07bc,0x75fc2a5e,0x96b17776,0x110b571b,0x222d2dab,0x231d58ee,0x692CC4BB,0x2073b3d7,0x2429d2da,0x8180e34a,0x13216f21,0x55274b5d,0x134771B8,0x6984116e,0x96308401,0xB54CD3F4,0xC2AD5FCE,0xCB79323D,0xF83B520C,0xaec17e3a,0xb513d7bd,0xba4adc62,0xcb14b6c0,0xe5010210,0xebee9424,0xfdb1f516,}

local escort_ped = {{"juggalo_01", 0xDB134533},{"topless_01", 0x9CF26183},{"juggalo_02", 0x91CA3E2C},{"lester crest", 0xB594F5C3},{"cop", 0x9AB35F63},{"mp_agent14", 0x6DBBFC8B},{"ramp_marine", 0x616C97B9},{"trafficwarden", 0xDE2937F3},{"lestercrest_2", 0x6E42FD26},{"lestercrest", 0x4DA6E849},{"agent14", 0xFBF98469},{"m_pros_01", 0x6C9DD7C9},{"waremech_01", 0xF7A74139},{"weapexp_01", 0x36EA5B09},{"weapwork_01", 0x4186506E},{"securoguard_01", 0xDA2C984E},{"armoured_01", 0xCDEF5408},{"armoured_01", 0x95C76ECD},{"armoured_02", 0x63858A4A},{"marine_01", 0xF2DAA2ED},{"marine_02", 0xF0259D83},{"security_01", 0xD768B228},{"snowcop_01", 0x1AE8BB58},{"prisguard_01", 0x56C96FC6},{"pilot_01", 0xE75B4B1C},{"pilot_02", 0xF63DE8E1},{"blackops_01", 0xB3F3EE34},{"blackops_02", 0x7A05FA59},{"blackops_03", 0x5076A73B},{"hwaycop_01", 0x739B1EF5},{"marine_01", 0x65793043},{"marine_02", 0x58D696FE},{"marine_03", 0x72C0CAD2},{"ranger_01", 0xEF7135AE},{"robber_01", 0xC05E1399},{"sheriff_01", 0xB144F9B9},{"pilot_01", 0xAB300C07},{"swat_01", 0x8D8F1B10},{"fibmugger_01", 0x85B9C668},{"juggernaut_01", 0x90EF5134},{"rsranger_01", 0x3C438CD2},}

local veh_list = {{"buzzard", 0x2F03547B, nil, nil},{"savage", 0xFB133A17, nil, nil},{"seasparrow", 0xD4AE63D9, 10, 1},{"valkyrie2", 0x5BFA5C4B, nil, nil},{"valkyrie", 0xA09E15FD, nil, nil},{"boxville5", 0x28AD20E1, nil, nil},{"apc", 0x2189D250, 10, 0},{"oppressor2", 0x7B54A9D3, 10, 1},{"oppressor", 0x34B82784, 10, 0},{"ruiner2", 0x381E10BD, nil, nil},{"scramjet", 0xD9F0503D, 10, 0},{"stromberg", 0x34DBA661},{"tampa3", 0xB7D9F7F1},{"khanjali", 0xAA6F980A, nil, nil},{"insurgent3", 0x8D4B7A8A, nil, nil},{"insurgent", 0x9114EADA, nil, nil},{"limo2", 0xF92AEC4D, nil, nil},{"mower", 0x6A4BD8F6, nil, nil},{"police2", 0x9F05F101, nil, nil},{"police3", 0x71FA16EA, nil, nil},{"police4", 0x8A63C7B9, nil, nil},{"police", 0x79FBB0C5, nil, nil},{"policeb", 0xFDEFAEC3, nil, nil},{"policeold1", 0xA46462F7, nil, nil},{"policeold2", 0x95F4C618, nil, nil},{"policet", 0x1B38E955, nil, nil},{"polmav", 0x1517D4D9, nil, nil},{"sheriff2", 0x72935408, nil, nil},{"sheriff", 0x9BAA707C, nil, nil},{"phantom2", 0x9DAE1398, nil, nil},{"ruiner3", 0x2E5AFD37, nil, nil},{"scorcher", 0xF4E1AA15, nil, nil},{"bmx", 0x43779C54, nil, nil},}


    
local ped_wep = {{"unarmed", 0xA2719263},{"parachute", 0xfbab5776},{"weapon_handcuffs", 0xD04C944D},{"stone_hatchet", 0x3813FC08},{"knife", 0x99B507EA},{"bat", 0x958A4A8F},{"weapon_machinepistol", 0xDB1AA450},	{"raypistol", 0xAF3696A1},{"stungun", 0x3656C8C1},{"weapon_gadgetpistol", 0x57A4368C},{"raycarbine", 0x476BF15},{"combatmg_mk2", 0xDBBD7280},{"Special RPG", 1752584910},{"Standard RPG", 2982836145},{"railgun", 0x6D544C99},{"minigun", 0x42BF8A85},{"rayminigun", 0xB62D1F6},}

local missions = {"Force to Severe Weather","Force to Half Track","Force to Night Shark AAT","Force to APC Mission","Force to MOC Mission","Force to Tampa Mission","Force to Opressor Mission1","Force to Opressor Mission2"}
local BountyPresets = {0,1,42,69,420,666,1000,3000,5000,7000,9000,10000}
local colorindex = {000,001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020,021,022,023,024,025,026,027,028,029,030,031,032,033,034,035,036,037,038,039,040,041,042,043,044,045,046,047,048,049,050,051,052,053,054,055,056,057,058,059,060,061,062,063,064,065,066,067,068,069,070,071,072,073,074,075,076,077,078,079,080,081,082,083,084,085,086,087,088,089,090,091,092,093,094,095,096,097,098,099,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215}
local ssb_wep = {"weapon_sniperrifle","weapon_heavysniper","weapon_remotesniper","weapon_grenadelauncher","vehicle_weapon_player_bullet","vehicle_weapon_player_lazer","weapon_airstrike_rocket","vehicle_weapon_space_rocket","vehicle_weapon_plane_rocket","vehicle_weapon_trailer_missile","vehicle_weapon_akula_missile","vehicle_weapon_akula_barrage","vehicle_weapon_avenger_cannon","weapon_arena_homing_missile","weapon_air_defence_gun",}
local StrikeGive = {"weapon_airstrike_rocket","vehicle_weapon_trailer_dualaa","vehicle_weapon_avenger_cannon","vehicle_weapon_khanjali_cannon_heavy","weapon_grenadelauncher","weapon_air_defence_gun",}

--Event Data Arrays

local NetEvents = {}
NetEvents[0] = "OBJECT_ID_FREED_EVENT"
NetEvents[1] = "OBJECT_ID_REQUEST_EVENT"
NetEvents[2] = "ARRAY_DATA_VERIFY_EVENT"
NetEvents[3] = "SCRIPT_ARRAY_DATA_VERIFY_EVENT"
NetEvents[4] = "REQUEST_CONTROL_EVENT"
NetEvents[5] = "GIVE_CONTROL_EVENT"
NetEvents[6] = "WEAPON_DAMAGE_EVENT"
NetEvents[7] = "REQUEST_PICKUP_EVENT"
NetEvents[8] = "REQUEST_MAP_PICKUP_EVENT"
NetEvents[9] = "GAME_CLOCK_EVENT"
NetEvents[10] = "GAME_WEATHER_EVENT"
NetEvents[11] = "RESPAWN_PLAYER_PED_EVENT"
NetEvents[12] = "GIVE_WEAPON_EVENT"
NetEvents[13] = "REMOVE_WEAPON_EVENT"
NetEvents[14] = "REMOVE_ALL_WEAPONS_EVENT"
NetEvents[15] = "VEHICLE_COMPONENT_CONTROL_EVENT"
NetEvents[16] = "FIRE_EVENT"
NetEvents[17] = "EXPLOSION_EVENT"
NetEvents[18] = "START_PROJECTILE_EVENT"
NetEvents[19] = "UPDATE_PROJECTILE_TARGET_EVENT"
NetEvents[21] = "BREAK_PROJECTILE_TARGET_LOCK_EVENT"
NetEvents[20] = "REMOVE_PROJECTILE_ENTITY_EVENT"
NetEvents[22] = "ALTER_WANTED_LEVEL_EVENT"
NetEvents[23] = "CHANGE_RADIO_STATION_EVENT"
NetEvents[24] = "RAGDOLL_REQUEST_EVENT"
NetEvents[25] = "PLAYER_TAUNT_EVENT"
NetEvents[26] = "PLAYER_CARD_STAT_EVENT"
NetEvents[27] = "DOOR_BREAK_EVENT"
NetEvents[28] = "SCRIPTED_GAME_EVENT"
NetEvents[29] = "REMOTE_SCRIPT_INFO_EVENT"
NetEvents[30] = "REMOTE_SCRIPT_LEAVE_EVENT"
NetEvents[31] = "MARK_AS_NO_LONGER_NEEDED_EVENT"
NetEvents[32] = "CONVERT_TO_SCRIPT_ENTITY_EVENT"
NetEvents[33] = "SCRIPT_WORLD_STATE_EVENT"
NetEvents[40] = "INCIDENT_ENTITY_EVENT"
NetEvents[34] = "CLEAR_AREA_EVENT"
NetEvents[35] = "CLEAR_RECTANGLE_AREA_EVENT"
NetEvents[36] = "NETWORK_REQUEST_SYNCED_SCENE_EVENT"
NetEvents[37] = "NETWORK_START_SYNCED_SCENE_EVENT"
NetEvents[39] = "NETWORK_UPDATE_SYNCED_SCENE_EVENT"
NetEvents[38] = "NETWORK_STOP_SYNCED_SCENE_EVENT"
NetEvents[41] = "GIVE_PED_SCRIPTED_TASK_EVENT"
NetEvents[42] = "GIVE_PED_SEQUENCE_TASK_EVENT"
NetEvents[43] = "NETWORK_CLEAR_PED_TASKS_EVENT"
NetEvents[44] = "NETWORK_START_PED_ARREST_EVENT"
NetEvents[45] = "NETWORK_START_PED_UNCUFF_EVENT"
NetEvents[46] = "NETWORK_SOUND_CAR_HORN_EVENT"
NetEvents[47] = "NETWORK_ENTITY_AREA_STATUS_EVENT"
NetEvents[48] = "NETWORK_GARAGE_OCCUPIED_STATUS_EVENT"
NetEvents[49] = "PED_CONVERSATION_LINE_EVENT"
NetEvents[50] = "SCRIPT_ENTITY_STATE_CHANGE_EVENT"
NetEvents[51] = "NETWORK_PLAY_SOUND_EVENT"
NetEvents[52] = "NETWORK_STOP_SOUND_EVENT"
NetEvents[53] = "NETWORK_PLAY_AIRDEFENSE_FIRE_EVENT"
NetEvents[54] = "NETWORK_BANK_REQUEST_EVENT"
NetEvents[55] = "NETWORK_AUDIO_BARK_EVENT"
NetEvents[56] = "REQUEST_DOOR_EVENT"
NetEvents[58] = "NETWORK_TRAIN_REQUEST_EVENT"
NetEvents[57] = "NETWORK_TRAIN_REPORT_EVENT"
NetEvents[59] = "NETWORK_INCREMENT_STAT_EVENT"
NetEvents[60] = "MODIFY_VEHICLE_LOCK_WORD_STATE_DATA"
NetEvents[61] = "MODIFY_PTFX_WORD_STATE_DATA_SCRIPTED_EVOLVE_EVENT"
NetEvents[62] = "REQUEST_PHONE_EXPLOSION_EVENT"
NetEvents[63] = "REQUEST_DETACHMENT_EVENT"
NetEvents[64] = "KICK_VOTES_EVENT"
NetEvents[65] = "GIVE_PICKUP_REWARDS_EVENT"
NetEvents[66] = "NETWORK_CRC_HASH_CHECK_EVENT"
NetEvents[67] = "BLOW_UP_VEHICLE_EVENT"
NetEvents[68] = "NETWORK_SPECIAL_FIRE_EQUIPPED_WEAPON"
NetEvents[69] = "NETWORK_RESPONDED_TO_THREAT_EVENT"
NetEvents[70] = "NETWORK_SHOUT_TARGET_POSITION"
NetEvents[71] = "VOICE_DRIVEN_MOUTH_MOVEMENT_FINISHED_EVENT"
NetEvents[72] = "PICKUP_DESTROYED_EVENT"
NetEvents[73] = "UPDATE_PLAYER_SCARS_EVENT"
NetEvents[74] = "NETWORK_CHECK_EXE_SIZE_EVENT"
NetEvents[75] = "NETWORK_PTFX_EVENT"
NetEvents[76] = "NETWORK_PED_SEEN_DEAD_PED_EVENT"
NetEvents[77] = "REMOVE_STICKY_BOMB_EVENT"
NetEvents[78] = "NETWORK_CHECK_CODE_CRCS_EVENT"
NetEvents[79] = "INFORM_SILENCED_GUNSHOT_EVENT"
NetEvents[80] = "PED_PLAY_PAIN_EVENT"
NetEvents[81] = "CACHE_PLAYER_HEAD_BLEND_DATA_EVENT"
NetEvents[82] = "REMOVE_PED_FROM_PEDGROUP_EVENT"
NetEvents[83] = "REPORT_MYSELF_EVENT"
NetEvents[84] = "REPORT_CASH_SPAWN_EVENT"
NetEvents[85] = "ACTIVATE_VEHICLE_SPECIAL_ABILITY_EVENT"
NetEvents[86] = "BLOCK_WEAPON_SELECTION"
NetEvents[87] = "NETWORK_CHECK_CATALOG_CRC"


--TODO: Feature & Variable Arrays

local global_func = {}

local globalFeatures = {}
local playerFeatures = {}
local playerfeatVars = {}
playerFeat = {}
playerFeatParent = {}
playerFeatParent2 = {}
playerFeat1 = {}
playerFeat2 = {}
playerFeat3 = {}
playerFeat4 = {}

--local Menu Functions
globalFeatures.parent = menu.add_feature("Moists Script 2.0.1.9", "parent", 0).id

--TODO: Feature Parents
playersFeature = menu.add_feature("Online Players", "parent", globalFeatures.parent)
globalFeatures.lobby = menu.add_feature("Online Session", "parent", globalFeatures.parent).id
globalFeatures.protex = menu.add_feature("Online Protection", "parent", globalFeatures.lobby).id
test = menu.add_feature("Modder Protex Detect", "parent", globalFeatures.protex, cb)
globalFeatures.kick = menu.add_feature("Session Kicks", "parent", globalFeatures.lobby).id
globalFeatures.troll = menu.add_feature("Troll Functions", "parent", globalFeatures.lobby).id
globalFeatures.parentID = menu.add_feature("Blacklist", "parent", globalFeatures.protex).id
globalFeatures.orbital = menu.add_feature("Orbital Room Block", "parent", globalFeatures.protex).id
globalFeatures.self = menu.add_feature("Player Functions", "parent", globalFeatures.parent).id
globalFeatures.World = menu.add_feature("World Options", "parent", globalFeatures.parent).id
globalFeatures.Wave = menu.add_feature("World Wave Modifiers", "parent", globalFeatures.World).id
globalFeatures.cleanup = menu.add_feature("Clean Shit Up!", "parent", globalFeatures.World).id
globalFeatures.entity_removal = menu.add_feature("World Clean-up", "parent", globalFeatures.cleanup).id
globalFeatures.self_ped = menu.add_feature("Ped Functions", "parent", globalFeatures.self).id
globalFeatures.self_wep = menu.add_feature("Player Weapons", "parent", globalFeatures.self_ped).id
globalFeatures.self_veh = menu.add_feature("Vehicle Functions", "parent", globalFeatures.self).id
globalFeatures.self_options = menu.add_feature("Player Options", "parent", globalFeatures.self).id
globalFeatures.self_quickstat = menu.add_feature("Player Stats", "parent", globalFeatures.self).id
globalFeatures.self_statcheck = menu.add_feature("Player Stat Checks", "parent", globalFeatures.self_quickstat).id

globalFeatures.self_statsetup = menu.add_feature("Player Stat Setup", "parent", globalFeatures.self_quickstat, function()
    local stat_hash = gameplay.get_hash_key("MP0_PLAYER_MENTAL_STATE")
    local curval = stats.stat_get_float(stat_hash, 0)
    local valu = math.ceil(curval)
    local value_set = tonumber(valu)

    mental_statset.value_i = value_set
end).id

globalFeatures.quick_stats = menu.add_feature("Quick Stat Setups", "parent", globalFeatures.self_quickstat, function(feat)
    moist_notify("for casino heist quick stat setup\n", "ensure to pay for heist setup first")
    moist_notify("cooldown can be removed running the setup first\n", "ensure to reapply after paying for it")

end).id

globalFeatures.Moist_Spam = menu.add_feature("Chat Spam", "parent", globalFeatures.parent).id
globalFeatures.Preset_Chat = menu.add_feature("Chat Spam Presets", "parent", globalFeatures.Moist_Spam).id
globalFeatures.Preset_RUS = menu.add_feature("Russian Spam Presets", "parent", globalFeatures.Preset_Chat).id

globalFeatures.Spam_Options = menu.add_feature("Spam Options", "parent", globalFeatures.Moist_Spam).id
globalFeatures.moistopt = menu.add_feature("Options", "parent", globalFeatures.parent).id
globalFeatures.moistMkropt = menu.add_feature("Marker options", "parent", globalFeatures.moistopt).id
globalFeatures.notifyParent = menu.add_feature("Notify Customisation", "parent", globalFeatures.moistopt).id
playerfeatVars.parent = menu.add_player_feature("Moists Script 2.0.1.9", "parent", 0).id
playerfeatVars.spam_sms = menu.add_player_feature("SMS Spam", "parent", playerfeatVars.parent).id
playerfeatVars.Preset_sms = menu.add_player_feature("SMS Spam Presets", "parent", playerfeatVars.spam_sms).id
playerfeatVars.Preset_RUS = menu.add_player_feature("Russian Spam Presets", "parent", playerfeatVars.Preset_sms).id


function load_SpamData()
    if not utils.file_exists(Spamtxt_Data) then	return end
    for line in io.lines(Spamtxt_Data) do
        spam_presets[#spam_presets + 1] = {line:sub(1,12),line}
    end
end
load_SpamData()

for i = 1, #russian_spam do
    menu.add_player_feature("sms: " .. russian_spam[i][1], "toggle", playerfeatVars.Preset_RUS, function(feat, pid)
        if feat.on then
            local text = tostring(russian_spam[i][2])

            player.send_player_sms(pid, text)


            return HANDLER_CONTINUE
        end
    end)
end


for i = 1, #russian_spam do
    
  spammRU.var[i] =  menu.add_feature(i..": " .. russian_spam[i][1], "value_i", globalFeatures.Preset_RUS, function(feat)
        if feat.on then
            local text = tostring(russian_spam[i][2])

            network.send_chat_message(text, false)
            system.wait(feat.value_i)
            return HANDLER_CONTINUE
        end
    end)
spammRU.var[i].max_i = 1000
spammRU.var[i].min_i = 0
spammRU.var[i].value_i = setting["spam_wait"]

end

for i = 1, #spam_preset do
    menu.add_player_feature("sms: " .. spam_preset[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
        if feat.on then
            local text = tostring(spam_preset[i][2])

            player.send_player_sms(pid, text)


            return HANDLER_CONTINUE
        end
    end)
end


for i = 1, #spam_preset do
    
   spamm.var[i] =  menu.add_feature(i..": " .. spam_preset[i][1], "value_i", globalFeatures.Preset_Chat, function(feat)
        if feat.on then
            local text = tostring(spam_preset[i][2])

            network.send_chat_message(text, false)
            system.wait(feat.value_i)
            return HANDLER_CONTINUE
        end
    end)
    spamm.var[i].max_i = 1000
    spamm.var[i].min_i = 0
    spamm.var[i].value_i = setting["spam_wait"]

end

for i = 1, #spam_presets do
    menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
        if feat.on then
            local text = tostring(spam_presets[i][2])

            player.send_player_sms(pid, text)


            return HANDLER_CONTINUE
        end
    end)
end



for i = 1, #spam_presets do

    spamm.var[i] = menu.add_feature(i..": ".. spam_presets[i][1], "value_i", globalFeatures.Preset_Chat, function(feat)
        if feat.on then
            local text = tostring(spam_presets[i][2])

            network.send_chat_message(text, false)
            system.wait(feat.value_i)
            return HANDLER_CONTINUE
        end
    end)
    spamm.var[i].max_i = 1000
    spamm.var[i].min_i = 0
    spamm.var[i].value_i = setting["spam_wait"]

end


menu.add_feature("no text spam", "toggle", globalFeatures.Moist_Spam, function(feat)
    if feat.on then
        network.send_chat_message(" ", false)

        return HANDLER_CONTINUE
    end
end)


spam_delay = menu.add_feature("Set Delay in ms", "action_value_i", globalFeatures.Spam_Options, function(feat)
  
  setting["spam_wait"] = feat.value_i
    
end)
spam_delay.max_i = 1000
spam_delay.min_i = 0
spam_delay.value_i = setting["spam_wait"]


menu.add_feature("Add Custom Preset", "action", globalFeatures.Spam_Options, function(feat)

        local r,s = input.get("Input Spam Preset Text 96 characters max", "", 96, 0)
        if r == 1 then
            return HANDLER_CONTINUE
        end
        if r == 2 then
            return HANDLER_POP
        end

        local text = tostring(s .."\n")
        system.wait(1)
        local file = io.open(rootPath .. "\\scripts\\MoistsLUA_cfg\\Moists_Spamset.data", "a")
        system.wait(1)
        io.output(file)

        io.write(text)
        io.close()
        spam_presets[#spam_presets + 1] = {text:sub(1,12),text}

        local i = #spam_presets
        menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
            if feat.on then
                local text = tostring(spam_presets[i][2])

                player.send_player_sms(pid, text)


                return HANDLER_CONTINUE
            end
        end)
    local spamm = {}
   spamm.var = {}
    spamm.var[i] = menu.add_feature(i ..": " .. spam_presets[i][1], "value_i", globalFeatures.Preset_Chat, function(feat)
            if feat.on then
                local text = tostring(spam_presets[i][2])

                network.send_chat_message(text, false)
                system.wait(feat.value_i)
                return HANDLER_CONTINUE
            end
        end)
         spamm.var[i].max_i = 1000
         spamm.var[i].min_i = 0
         spamm.var[i].value_i = setting["spam_wait"]
         


end)

local custom_count = 0
local text = {}
local text2

spam_cus_long = menu.add_feature("Add Custom Long Preset", "action_value_i", globalFeatures.Spam_Options, function(feat)

        while custom_count < feat.value_i do

            local r,s = input.get("Input Spam Preset Text 96 characters max", "", 96, 0)
            if r == 1 then
                return HANDLER_CONTINUE
            end
            if r == 2 then
                return HANDLER_POP
            end

            custom_count = custom_count + 1
            text[#text + 1] = string.format(s .." ")
            system.wait(1)

        end
        custom_count = 0
        if feat.value_i == 2 then
        text[3] = " "
        end
        local text2 = string.format(text[1] .." " .. text[2] .." " ..text[3] .."\n")
        local file = io.open(rootPath .. "\\scripts\\MoistsLUA_cfg\\Moists_Spamset.data", "a")

        io.output(file)

        io.write(text2)
        io.close()
        spam_presets[#spam_presets + 1] = {text2:sub(1,12),text2}

        local i = #spam_presets
        menu.add_player_feature("sms: " .. spam_presets[i][1], "toggle", playerfeatVars.spam_sms, function(feat, pid)
            if feat.on then
                local text2 = tostring(spam_presets[i][2])

                player.send_player_sms(pid, text2)


                return HANDLER_CONTINUE
            end
        end)

        menu.add_feature("Chat: " .. spam_presets[i][1], "toggle", globalFeatures.Preset_Chat, function(feat)
            if feat.on then
                local text2 = tostring(spam_presets[i][2])

                network.send_chat_message(text2, false)
                system.wait(0)
                return HANDLER_CONTINUE
            end
        end)

end)
spam_cus_long.max_i = 3
spam_cus_long.min_i = 2


--TODO: Online Player Feature Parents
local Player_Tools = menu.add_player_feature("Tools", "parent", playerfeatVars.parent).id
local BountyId = menu.add_player_feature("Bounty Options", "parent", playerfeatVars.parent).id
playerfeatVars.fm = menu.add_player_feature("Force Player to Mission", "parent", playerfeatVars.parent).id

menu.add_player_feature("Save Players Current POS to file", "action", Player_Tools, function(feat, pid)

        local pos = v3()

        local Poslabel

        local posout

        local ped

        local posfile = io.open(rootPath.."\\lualogs\\saveposoutput.md", "a")

        local size = posfile:seek("end")
        print(string.format(size))

        local offset = v3()
        pos = player.get_player_coords(player.player_id(pid))

        local pped = player.get_player_ped(pid)
        --pos = entity.get_entity_coords(pped)

        local name = player.get_player_name(pid)

        local r,s = input.get("Enter a Name to Label POS", "Pos from : "..name, 64, 0)
        if r == 1 then
            return HANDLER_CONTINUE
        end
        if r == 2 then
            return HANDLER_POP
        end
        ui.notify_above_map(string.format("%f, %f, %f", pos.x, pos.y, pos.z), "Players Position", 213)

        savepos(string.format("\nPosition Saved From Player: "..name.."\n"..s..",	".."{"..pos.x ..", "..pos.y ..", "..pos.z.."}"))
        return HANDLER_POP
end)


savepos = function(text)

    local file = io.open(rootPath.."\\lualogs\\saveposoutput.md", "a")
    io.output(file)
    io.write(text)
    io.close()
end

--TODO: Notify settings
globalFeatures.nottyp = menu.add_feature("Set Notify Variant", "autoaction_value_i", globalFeatures.notifyParent, function(feat)

        notifytype = feat.value_i
        setting["NotifyVarDefault"] = feat.value_i
        notifytype = feat.value_i
        moist_notify("Test Variant Set:\n", feat.value_i)
        return HANDLER_POP
end)
globalFeatures.nottyp.max_i = 6
globalFeatures.nottyp.min_i = 1
globalFeatures.nottyp.value_i = setting["NotifyVarDefault"]

globalFeatures.notify = menu.add_feature("Set Default Notify Color", "autoaction_value_i", globalFeatures.notifyParent, function(feat)
    setting["NotifyColorDefault"] = feat.value_i

    preset_color = feat.value_i
    moist_notify("Test Color:\n", feat.value_i)
    return HANDLER_POP
end)
globalFeatures.notify.max_i = #colorindex
globalFeatures.notify.min_i = 1
globalFeatures.notify.value_i = setting["NotifyColorDefault"]

--TODO: save settings
menu.add_feature("Save settings", "action", globalFeatures.moistopt, function(feat)
    saveSettings()
    moist_notify("Settings: ",  "saved!")
end)

--TODO: Online Functions

menu.add_player_feature("Force Player to Island", "action", 0, function(feat, pid)

        ScriptTR(0x4d8b1e65, pid, {1300962917})

        return HANDLER_POP
end)

--TODO: Show Spawn option

local spawnoptions_loaded = false

local Show_Spawn_Options = menu.add_feature("Show & Load SpawnOptions", "toggle", globalFeatures.moistopt, function(feat)
    if not feat.on then
        setting["showSpawns"] = false
        -- spawnoptions_loaded = false
        return HANDLER_POP
    end
    setting["showSpawns"] = true
    if not spawnoptions_loaded then
        spawn_parent = menu.add_player_feature("Spawn Options", "parent", playerfeatVars.parent)
        playerfeatVars.b = menu.add_player_feature("Ped Spawns", "parent", spawn_parent.id).id
        load_spawn_options()
        spawnoptions_loaded = true
        return HANDLER_CONTINUE
    end
end)
Show_Spawn_Options.on = setting["showSpawns"]

local ip_clip = menu.add_player_feature("Copy IP to Clipboard", "action", 0, function(feat, pid)
    local ip = player.get_player_ip(pid)
    local sip = string.format("%i.%i.%i.%i", (ip >> 24) & 0xff, ((ip >> 16) & 0xff), ((ip >> 8) & 0xff), ip & 0xff)
    utils.to_clipboard(sip)

end)
ip_clip.threaded = false

local mod_off = menu.add_player_feature("Toggle off Modder Mark", "toggle", playerfeatVars.parent, function(feat, pid)
    while feat.on do
        if player.is_player_modder(pid, -1) == true
        then
            player.unset_player_as_modder(pid, -1)

        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)

--TODO: Orbital Room Protection
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
local block_orbital = menu.add_feature("New Block Orbital", "action", globalFeatures.orbital, function(feat)

        local pos = v3()
        pos.x = 342.69586181641
        pos.y = 4832.3774414062
        pos.z = -61.000000
        local rot = v3()
        rot.x = 0.0
        rot.y = 0.0
        rot.z = 60.000003814697

        spawned_cunts[#spawned_cunts+1] = object.create_object(472547144, pos, true, false)
        entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])


        local pos = v3()

        pos.x = 343.01234960938
        pos.y = 4833.3774414062
        pos.z = -58.619457244873
        local rot = v3()
        pos.x = 350.26750854492
        pos.y = 4828.8745117188
        pos.z = -58.487403869629
        rot.x = -25.000011444092
        rot.y = -0.0
        rot.z = 150.0
        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982 , pos, true, false)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)

        pos.x = 347.04141235352
        pos.y = 4830.7163085938
        pos.z = -58.487403869629
        rot.x = -25.000011444092
        rot.y = -0.0
        rot.z = 150.0

        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982 , pos, true, false)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)

        pos.x = 343.0749206543
        pos.y = 4832.9965820312
        pos.z = -58.487403869629
        rot.x = -25.000011444092
        rot.y = -0.0
        rot.z = 150.0

        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982 , pos, true, false)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)

        pos.x = 339.48446655273
        pos.y = 4835.1568554686
        pos.z = -58.487403869629
        rot.x = -25.000011444092
        rot.y = -0.0
        rot.z = 150.0


        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982 , pos, true, false)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)

        pos.x = 335.99624633789
        pos.y = 4837.0795898438
        pos.z = -58.487403869629
        rot.x = -25.000011444092
        rot.y =-0.0
        rot.z = 150.000

        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982 , pos, true, false)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot)

        return HANDLER_POP
end)

local blockplaces03 = menu.add_feature("Block Orbital Entrance with Wall", "action", globalFeatures.orbital, function(feat)

        local pos = v3()

        local rot = v3()

        local pos1 = v3()

        local rot1 = v3()
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
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        return HANDLER_POP
end)
--Inactive Orbital Screens over blocked doorway

--dmaged sub 3544215092
local orbscreens = menu.add_feature("Orbital Inactive Screens over Block", "action", globalFeatures.orbital, function(feat)

        local pos1 = v3()

        local pos2 = v3()

        local pos3 = v3()

        local pos4 = v3()

        local pos5 = v3()

        local rot1 = v3()

        local rot2 = v3()

        local rot3 = v3()

        local rot4 = v3()

        local rot5 = v3()
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
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos1, true, false)
        entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)



        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot1)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos2, true, false)
        entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot2)


        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-1399826314, pos3, true, true)
        entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)
        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot3)

        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        spawned_cunts[#spawned_cunts + 1] = object.create_object(2895140982, pos4, true, false)
        entity.set_entity_as_mission_entity(spawned_cunts[#spawned_cunts], true, false)



        entity.set_entity_rotation(spawned_cunts[#spawned_cunts], rot4)
        ui.add_blip_for_entity(spawned_cunts[#spawned_cunts])
        return HANDLER_POP
end)

local delete_cunt = menu.add_feature("Delete Spawned Cunts", "action", globalFeatures.cleanup, function(feat)

        for i = 1, #spawned_cunts do
            network.request_control_of_entity(i)
            entity.delete_entity(spawned_cunts[i])
        end

end)

--TODO: Modder Detection Protection shit

-- -- **BLACK LIST SHIT**

function blacklist_shit()

local joining_players_logger = event.add_event_listener("player_join", function(e)
    
    

    local pid = e.player
   
    
    local scid = player.get_player_scid(pid)
    local schx = string.format("%x", scid)
    local name = tostring(player.get_player_name(pid))

    local ip = player.get_player_ip(pid)
    local sip = string.format("%i.%i.%i.%i", (ip >> 24) & 0xff, ((ip >> 16) & 0xff), ((ip >> 8) & 0xff), ip & 0xff)
    
    joined_data(name..":"..schx.."\n" ..name.." : |" ..pid .."| " .."["..scid.."]" .."\n["..ip.."]" .."[IPv4: "..sip.. "]\n")

    return
    blacklist_check(pid)
end)

function joined_data(text)
    local d = os.date()
    local dtime = string.match(d, "%d%d:%d%d:%d%d")
    local dt = os.date("%d/%m/%y%y")
    local CurDateTime = (string.format("[" .. dt .. "]" .. "[" .. dtime .. "]"))
    local file = io.open(rootPath .. "\\lualogs\\PlayerJoins.md", "a")
    io.output(file)
    io.write("\n[" .. CurDateTime .. "]")
    io.write("\n" .. text)
    io.close()
end

function Joined_players(text)
    local file = io.open(rootPath .. "\\lualogs\\PlayerJoins.md", "a")
    io.output(file)
    io.write(text)
    io.close()
end

local hookID, hookID1, hookID2, hookID3, hookID4, hookID5, hookID05, hookID6
local script_hook = 09

--TODO: Netlog
-- local netlog_start = false
-- function log_net()
    -- if not net_log.on then
        -- netlog_start = false
        -- hook.remove_net_event_hook(hookID6)
        -- return HANDLER_POP
    -- end
    -- if not netlog_start then
        -- hookID6 = hook.register_net_event_hook(log_neteventHook)



    -- end
    -- return HANDLER_CONTINUE
-- end


local Cur_Date_Time
function get_datetime()

    local d = os.date()

    local dtime = string.match(d, "%d%d:%d%d:%d%d")

    local dt = os.date("%d/%m/%y%y")
    Cur_Date_Time = (string.format("["..dt.."]".."["..dtime.."]"))
end

--TODO: ScriptHook Check Player
local scriptlog_pid = menu.add_feature("Log player script events", "value_i", globalFeatures.protex, function(feat)

        script_check_pid(feat.value_i)
        system.wait(100)

        return HANDLER_POP
end)
scriptlog_pid.on = false
scriptlog_pid.max_i = 32
scriptlog_pid.min_i = 0
scriptlog_pid.value_i = 0


local hook_pid = 0
local lastpid_hooked = 0
script_check_pid  = function(pid)
    if scriptlog_pid.on == true then
        hook_pid = hook.register_script_event_hook(script_event_hook_pid)
        lastpid_hooked = pid
        return HANDLER_POP
    end

    if hook_pid ~= 0 then
        hook.remove_script_event_hook(hook_pid)
        hook_pid = 0
    end
end



local paramspid = {}
script_event_hook_pid = function(source, target, paramspid, count)


    local player_source = player.get_player_name(source)
    local scid = player.get_player_scid(source)
    local player_target = player.get_player_name(target)
    get_datetime()
    if source == lastpid_hooked then
        scriptlog_out_pid(Cur_Date_Time .."\n[" ..player_source .."[" ..scid .."]] Target:[" ..player_target .."]", player_source)

        local cnt = 0
        for k, v in pairs(paramspid) do
            if k == 1 then
                t = string.format("%x", v)
                c = tostring("  0x"..t)
                p = string.format(v .."	" .. c)
            else
                p = v
            end

            scriptlog_out_pid("\n[P: " .. cnt .. "]	= " .."[".. k .."]		" .. p, player_source)
            cnt = cnt + 1
        end
        return false
    else
    end
    -- system.wait(3000)

end

--TODO: ScriptHook Check
local hook_id = 0
local script_check  = function(feat)
    if feat.on then
        hook_id	= hook.register_script_event_hook(script_event_hook)
        return HANDLER_POP
    end

    if hook_id ~= 0 then
        hook.remove_script_event_hook(hook_id)
        hook_id	= 0
    end
end


local params = {}
script_event_hook = function(source, target, params, count)


    local player_source = player.get_player_name(source)
    local scid = player.get_player_scid(source)
    local player_target = player.get_player_name(target)
    get_datetime()
    scriptlog_out("\n\n[" ..Cur_Date_Time .."\n[" ..player_source .."[" ..scid .."]] Target:[" ..player_target .."]")
    local t
    local c
    local p

    local cnt = 0
    for k, v in pairs(params) do
        if k == 1 then

            t = string.format("%x", v)
            c = tostring("0x"..t)
            p = string.format(v .."	" .. c)
            if scriptevent_log.on then
                hashlogger("\n" .. c)
            end
        else
            p = v
        end

        scriptlog_out("\n[P: " .. cnt .. "]	= " .."[".. k .."]		" .. p )
        print(string.format(("\n[P: " .. cnt .. "]	= " .."[".. k .."]		" .. p )))
        cnt = cnt + 1
    end

    -- system.wait(3000)
    return false


end

--TODO: Logging output
-- --TODO: netlog
-- log_neteventHook = function(source, target, id)
    -- local player_source = player.get_player_name(source)
    -- local player_target = player.get_player_name(target)
    -- get_datetime()
    -- netlog_out("\n" .. Cur_Date_Time)
    -- netlog_out(NetEvents[id])
    -- netlog_out("from: [" .. source .. "] ||" .. player_source.. "|| to: [" .. target .. "] || " .. player_target .." ||")

    -- return false
-- end

function scriptlog_out_pid(text, name)
    if not scriptlog_pid.on then return end
    get_datetime()
    local playerfile = tostring(name..".log")
    local filepid = io.open(rootPath .."\\lualogs\\" .. playerfile, "a")
    io.output(filepid)
    io.write("\n" .. text)
    io.close(filepid)
end

function scriptlog_out(text)
    local RootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
    if not checkscript.on then return end
    get_datetime()
    local file = io.open(RootPath .. "\\lualogs\\scriptevent_logger.log", "a")
    io.output(file)
    io.write(text)
    io.close(file)
end

function hashlogger(text)
    local RootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
    local file = io.open(RootPath .. "\\lualogs\\hashlogger.log", "a")
    io.output(file)
    io.write(text)
    io.close(file)
end

function netlog_out(text)
    if not net_log.on then return end
    get_date_time()
    local file = io.open(rootPath .. "\\lualogs\\netevent_logger.log", "a")
    io.output(file)
    io.write("\n" .. text)
    io.close()
end

--TODO: Chat Logger
function chat(name, text)
    local d = os.date()
    local t = string.match(d, "%d%d:%d%d:%d%d")
    local dt = os.date("%d/%m/%y%y")

    local file = io.open(rootPath .. "\\lualogs\\chat.md", "a")

    io.output(file)
    io.write("[" .. dt .. " " .. t .. "]" .. " [" .. name .. "]")
    io.write("\n" .. text .. "\n")
    io.close()
end

local ChatEventID = event.add_event_listener("chat", function(e)
    if player.get_player_ped(e.player) == 0 then
        return
    end
    local sender = player.get_player_name(e.player)
    chat(sender, e.body)
end)

event.add_event_listener("exit", function()
    event.remove_event_listener("chat", ChatEventID)
end)

--TODO: Blacklist
function ValidScid(scid)
    return scid ~= -1 and scid ~= 4294967295
end

function RemoveScid(scid)
    if scids[scid] then
        scids[scid] = nil
        local file = io.open(scidFile, "w+")
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
        debug_out(string.format("Removed " .. scid .. " from blacklist."))
        print("Removed " .. scid .. " from blacklist.")
    end
end

function RemoveScidByPid(pid)
    if pid == player.player_id() then
        return
    end
    local scid = player.get_player_scid(pid)
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
    local file = io.open(scidFile, "a")

    io.output(file)
    io.write(scid .. "|" .. name .. "\n")
    io.close()
    scidN = scidN + 1
    menu.add_feature(scid .. " (" .. name .. ")", "action", RemoveBlacklistFeature.id, RemoveScidByFeature).data = scid
    debug_out(string.format("Added " .. scid .. " (" .. name .. ")" .. "to blacklist"))
    print("Added " .. scid .. " (" .. name .. ") to blacklist.")
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
    if not utils.file_exists(scidFile) then
        return
    end
    for line in io.lines(scidFile) do
        local scid, name = line:match("(%x+)|?(.-)$")
        name = name or "Unknown"
        if scid then
            local scid = tonumber(scid) or tonumber(scid, 16)
            if scid then
                scids[scid] = name
                menu.add_feature(scid .. " (" .. name .. ")", "action", RemoveBlacklistFeature.id, RemoveScidByFeature).data =
                    scid
                scidN = scidN + 1
            end
        end
    end
    print("Loaded blacklist with " .. scidN .. " entries.")
end

--TODO: Blacklist kick
function KickPid(pid)
    if pid == player.player_id() then
        return
    end
    local name = player.get_player_name(pid)
    if network.network_is_host() then
        network.network_session_kick_player(pid)
        debug_out(string.format("Black List: Host kicked " .. pid .. " (" .. name .. ")"))
        print("Black List: Host kicked " .. pid .. " (" .. name .. ").")
    else
        -- for i = 1, #scriptEvents do
        --player.set_player_as_modder(pid, mod_flag_2)
        ScriptTR(-2120750352, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
        ScriptTR(0xE6116600, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})

        toggle_kicks(pid)
    end
    ScriptTR(-2120750352, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
    ScriptTR(0xE6116600, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})

    toggle_kicks(pid)
    debug_out(string.format("Black List: Non-Host kicked " .. pid .. " (" .. name .. ")"))
    print("Non-Host kicked " .. pid .. " (" .. name .. ").")

end

function MarkPidAsModder(pid)
    if pid == player.player_id() then
        return
    end
    local name = player.get_player_name(pid)
    player.set_player_as_modder(pid, mod_flag_4)
    debug_out(string.format("Black List: Marked " .. pid .. " (" .. name .. ") as modder"))
    print("Marked " .. pid .. " (" .. name .. ") as modder.")
end

menu.add_feature("Reload blacklist", "action", globalFeatures.parentID, function()
    LoadBlacklist()
    ui.notify_above_map("Loaded blacklist. " .. scidN .. " entries.", "Blacklist", 140)
end)

local MarkAsModderFeature
local KickFeature


local EnabledBlacklistFeature = menu.add_feature("Enable blacklist", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        setting["Blacklist_ON"] = false
        return HANDLER_POP
    end

    setting["Blacklist_ON"] = true
    if feat.on then
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
    end


end)
EnabledBlacklistFeature.on = setting["Blacklist_ON"]


local MarkAsModderFeature = menu.add_feature("Mark As Modder", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        setting["Blacklist_Mark"] = false
        return HANDLER_POP
    end
    setting["Blacklist_Mark"] = true
    return HANDLER_POP
end)
MarkAsModderFeature.on = setting["Blacklist_Mark"]

local KickFeature = menu.add_feature("Kick", "toggle", globalFeatures.parentID, function(feat)
    if not feat.on then
        setting["Blacklist_kick"] = false
        return HANDLER_POP
    end
    setting["Blacklist_kick"] = true
    return HANDLER_POP
end)
KickFeature.on = setting["Blacklist_kick"]

menu.add_feature("Manually add scid", "action", globalFeatures.parentID, function(feat)
    local r, s = input.get("Enter SCID to add", "", 64, 3)
    if r == 1 then
        return HANDLER_CONTINUE
    end

    if r == 2 then
        return HANDLER_POP
    end

    AddScid(tonumber(s), "Manual add")
    ui.notify_above_map("Added " .. s .. " to blacklist.", "Blacklist", 140)
end)

RemoveBlacklistFeature = menu.add_feature("Remove blacklist", "parent", globalFeatures.parentID)

menu.add_player_feature("Add to blacklist", "action", 0, function(feat, pid)
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

menu.add_player_feature("Remove from blacklist", "action", 0, function(feat, pid)
    RemoveScidByPid(pid)
    player.unset_player_as_modder(pid, mod_flag_4)
end)

--TODO: Blacklist Player Join

function blacklist_check(pid)
    if not EnabledBlacklistFeature.on then
        return
    end

    local scid = player.get_player_scid(pid)
    if ValidScid(scid) and scids[scid] then
        local name = player.get_player_name(pid)
        ui.notify_above_map(string.format("Black List Player Joining:\n" ..name .."\n" ..scid), "~h~Ω MoistsScript 2.0.1.9\nBlack List", 024)
        if MarkAsModderFeature.on then
            MarkPidAsModder(pid)
        end
        if KickFeature.on then
            KickPid(pid)
        end
    end
end
LoadBlacklist()

--TODO: Blacklist Main function

--TODO: Logging shit
local logging = menu.add_feature("Logging Shit", "parent", test.id, cb)

local chat_log = menu.add_feature("Log in Game Chat", "toggle", logging.id, log_chat)
chat_log.on = setting["chat_log"]

net_log = menu.add_feature("Log Netevents to File", "toggle", logging.id, log_net)
net_log.on = setting["net_log"]

checkscript = menu.add_feature("Hook Script Events & Log to File", "toggle", logging.id, script_check)
checkscript.on = setting["script_check_logger"]

scriptevent_log = menu.add_feature("log event hash only", "toggle", logging.id, nil)
scriptevent_log.on = false

end
blacklist_shit()

--TODO: player Features --Griefing

menu.add_player_feature("Attach dildo in Skeleton root", "action", playerfeatVars.parent, function(feat, pid)

        local pedd = player.get_player_ped(pid)

        local pos = v3()

        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, 0, pos, pos, true, true, false, 0, false)
end)

menu.add_player_feature("Script Host Crash Kick", "action", 0, function(feat, pid)

        local pos = v3()
        pos = player.get_player_coords(pid)
        pos.x = math.floor(pos.x)
        pos.y = math.floor(pos.y)
        pos.z = math.floor(pos.z)
        -- ScriptTR(-1975590661, pid, {pid, pos.x, pos.y, pos.z, 0, 0, 2147483647, 0, script.get_global_i(1590682 + (pid * 883) + 99 + 28), 1})
        ScriptTR(-1975590661, pid, {pid, pos.x, pos.y, pos.z, 0, 0, 1000, 0, script.get_global_i(1590682 + (pid * 883) + 99 + 28), 1})

end)

menu.add_player_feature("CEO BAN", "action", playerfeatVars.parent, function(feat, pid)

        ScriptTR(0xD3FE818F, pid, {0, 1, 5, 0})
end)

menu.add_player_feature("CEO DISMISS", "action", playerfeatVars.parent, function(feat, pid)
    ScriptTR(0x9DB77399, pid, {0, 1, 5})
end)

menu.add_player_feature("CEO TERMINATE", "action", playerfeatVars.parent, function(feat, pid)
    ScriptTR(0x9DB77399, pid, {1, 1, 6})
    ScriptTR(0x9DB77399, pid, {0, 1, 6, 0})
end)

for i = 1, #missions do
    local y = #missions - 1
    menu.add_player_feature("Force to Mission" ..missions[i], "action", playerfeatVars.fm, function(feat, pid)

            ScriptTR(0xdf7de926, pid,{y})
            ScriptTR(1115000764, pid,{y})
            ScriptTR(-545396442, pid,{y})

    end)

end

local function AddBounty(pid, value, anonymous)
    if not network.is_session_started() then return end
    local npc_bit = anonymous and 1 or 0
    for i = 0, 31 do
        if player.get_player_scid(i) ~= 4294967295 then

            ScriptTR(0xF90CC891, i, {-1, pid, 1, value, 0, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1652336 + 9), script.get_global_i(1652336 + 10)})
            ScriptTR(4178364561, i, {-1, pid, 1, value, 0, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1652336 + 9), script.get_global_i(1652336 + 10)})

        end
    end
end

menu.add_player_feature("Anonymous Bounty", "toggle", BountyId, function(feat, pid)
    if feat.on ~= AnonymousBounty then
        AnonymousBounty = feat.on
        local pf = menu.get_player_feature(feat.id)
        for i=1,#pf.feats do
            if pf.feats[i].on ~= AnonymousBounty then
                pf.feats[i].on = AnonymousBounty
            end
        end
    end
    return HANDLER_POP
end).threaded = false

menu.add_player_feature("Custom Value", "action", BountyId, function(feat, pid)
    local r,s = input.get("Custom Bounty Value", "", 64, 3)
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
    notify_above_map("I've placed a $" .. value .. " bounty on " .. (pid == player.player_id() and "your" or player.get_player_name(pid) .. "'s") ..  " head.")
end).threaded = false

for i = 1, #BountyPresets do
    menu.add_player_feature("$" .. BountyPresets[i], "action", BountyId, function(feat, pid)
        AddBounty(pid, BountyPresets[i], AnonymousBounty)
        --notify_above_map("I've placed a $" .. BountyPresets[i] .. " bounty on " .. (pid == player.player_id() and "your" or player.get_player_name(pid) .. "'s") ..  " head.")
    end).threaded = false
end

--TODO: Functions
function playervehspd(pid, speed)
    local plyveh
    local pedd = player.get_player_ped(pid)
    local plyveh = player.get_player_vehicle(pid)
    network.request_control_of_entity(plyveh)
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
    setting["lag_out"] = true
    if feat.on then
        local key = MenuKey()
        key:push_str("LCONTROL")
        key:push_str("LSHIFT")
        key:push_str("l")
        if key:is_down() then
            local time = utils.time_ms() + 8500
            while time > utils.time_ms() do end
            system.wait(1200)
        end
        return HANDLER_CONTINUE
    end
    setting["lag_out"] = false
    return HANDLER_POP
end)
global_func.lag_out.on = setting["lag_out"]


--TODO: World Functions
global_func.no_traffic = menu.add_feature("No World Traffic", "toggle", globalFeatures.moistopt, function(feat)

        setting["no_traffic"] = true
        if feat.on then
            vehicle.set_vehicle_density_multipliers_this_frame(0)

            return HANDLER_CONTINUE
        end
        setting["no_traffic"] = false
        return HANDLER_POP
end)
global_func.no_traffic.on = setting["no_traffic"]

global_func.no_peds = menu.add_feature("No World Peds", "toggle", globalFeatures.moistopt, function(feat)

        setting["no_peds"] = true
        if feat.on then
            ped.set_ped_density_multiplier_this_frame(0)
            return HANDLER_CONTINUE
        end
        setting["no_peds"] = false
        return HANDLER_POP
end)
global_func.no_peds.on = setting["no_peds"]

--TODO: Self Functions

-- Self modifiers --Max Health 0:0 1: 2: 3: 4: 5: 6:
local HP_modifiers = {
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

for i = 1, #HP_modifiers do

    menu.add_feature("set: " ..HP_modifiers[i][1], "action", globalFeatures.self_ped_modify, function(feat)

            local me = player.get_player_ped(player.player_id())
            local chp0
            chp0 = ped.get_ped_max_health(me)
            ped.set_ped_max_health(me, HP_modifiers[i][2])
            local chp1
            chp1 = ped.get_ped_max_health(me)
            if chp1 ~= 0 then
                ped.set_ped_health(me, HP_modifiers[i][2])
            else
            end
            moist_notify(string.format("Max Health Now:~y~~h~ " ..chp1 .."~r~\n From:~y~~h~ "..chp0 ,chp0))

            return HANDLER_POP
    end)
end


--TODO: Combat Functions
globalFeatures.self_ped_combat = menu.add_feature("Combat Functions", "parent", globalFeatures.self_ped).id

local damage = 2000
local dam_multi = menu.add_feature("unfair aim Damage", "autoaction_value_i", globalFeatures.self_ped_combat, function(feat)
    damage = tonumber(feat.value_i)
    print(damage)
end)
dam_multi.max_i = 100000
dam_multi.min_i = 100
dam_multi.value_i = 2000
dam_multi.mod_i = 10

local a, ImpactPos = ped.get_ped_last_weapon_impact(player.get_player_ped(player.player_id()),v3())if a then print(ImpactPos) return ImpactPos else print("No found")end

local notify_sent = false
local aimhash
local unfair_aimbot = menu.add_feature("unfair aim/Ped Head shot", "value_i", globalFeatures.self_ped_combat, function(feat)
    if not feat.on then
        notify_sent = false
        return HANDLER_POP
    end

    local pped = player.get_player_ped(player.player_id())

    if not notify_sent then
        moist_notify("Weapon Projectile Selected:\n", ssb_wep[feat.value_i])
        notify_sent = true
    end

    if ped.is_ped_shooting(pped) then
        local offset = v3()
        aimhash = gameplay.get_hash_key(ssb_wep[feat.value_i])
        local aimd = player.get_entity_player_is_aiming_at(player.player_id())
        if entity.is_entity_a_ped(aimd) then
            -- ped.get_ped_bone_index(aimd, 31086)
            local bonebool
            local pos = v3()
            local bonebool2
            local pos2 = v3()
            bonebool, pos = ped.get_ped_bone_coords(pped, 57005, offset)
            bonebool2, pos2 = ped.get_ped_bone_coords(aimd, 12844, offset)
            -- print(pos)
            -- print(pos2)

            gameplay.shoot_single_bullet_between_coords(pos, pos2, damage, aimhash, pped, true, false, 10000.00)


        end

    end
    return HANDLER_CONTINUE


end)
unfair_aimbot.max_i = #ssb_wep
unfair_aimbot.min_i = 1
unfair_aimbot.value_i = 1

local pos = v3()
local ImpactPos = v3()

local weapon_impact_pos = menu.add_feature("Get last Weapon impact POS", "toggle", globalFeatures.self_ped_combat, function(feat)
    if feat.on then
        local success, pos = ped.get_ped_last_weapon_impact(player.get_player_ped(player.player_id()), v3())
        if success then
            ImpactPos = pos
        else

        end
        return HANDLER_CONTINUE
    end
end)
weapon_impact_pos.on = false

local impact_strike = menu.add_feature("Air strike last Weapon impact POS", "value_i", globalFeatures.self_ped_combat, function(feat)

        if feat.on then
            weapon_impact_pos.on = true
            local pedd = player.get_player_ped(player.player_id())
            if not ped.is_ped_shooting(pedd) then
                return HANDLER_CONTINUE end
            -- system.wait(10)

            local posm = v3()
            posm = entity.get_entity_coords(pedd)
            posm.z = posm.z + 100

            local hash = gameplay.get_hash_key(ssb_wep[feat.value_i])
            pos_off = v3()
            pos_off.x = pos.x + math.random(1, 5)
            pos_off.y = pos.y + math.random(1, 8)

            local playerz, zPos = gameplay.get_ground_z(pos)
            pos_off.z = zPos
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 1000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            ImpactPos.x = ImpactPos.x + 5
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            ImpactPos.y = ImpactPos.y - 5
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            ImpactPos.x = ImpactPos.x - 10
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            ImpactPos.y = ImpactPos.y + 10
            gameplay.shoot_single_bullet_between_coords(posm, ImpactPos, 10000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            return HANDLER_CONTINUE

        end
        weapon_impact_pos.on = false
        return HANDLER_POP
end)
impact_strike.max_i = #ssb_wep
impact_strike.min_i = 1
impact_strike.on = false

local impact_strike2 = menu.add_feature("2nd wep last Weapon impact Pos", "value_i", globalFeatures.self_ped_combat, function(feat)
    if feat.on then
        weapon_impact_pos.on = true
        local hash = gameplay.get_hash_key(ssb_wep[feat.value_i])
        local pedd = player.get_player_ped(player.player_id())
        if not ped.is_ped_shooting(pedd) then return HANDLER_CONTINUE end
        local bonebool
        local pos = v3()
        bonebool, pos = ped.get_ped_bone_coords(pedd, 57005, offset)

        gameplay.shoot_single_bullet_between_coords(pos, ImpactPos, 10000.00, hash, pedd, true, false, 10000.0)
        system.wait(100)
        return HANDLER_CONTINUE

    end
    weapon_impact_pos.on = false
    return HANDLER_POP
end)
impact_strike2.max_i = #ssb_wep
impact_strike2.min_i = 1
impact_strike2.on = false

local aim_strike = menu.add_feature("Air strike aim entity (D pad R)", "toggle", globalFeatures.self_ped_combat, function(feat)
    if feat.on then
        if controls.is_control_pressed(6,54) then

            local pedd = player.get_player_ped(player.player_id())

            local target = player.get_entity_player_is_aiming_at(player.player_id())

            local pos = v3()
            pos = entity.get_entity_coords(target)

            local posz
            posz, pos.z = gameplay.get_ground_z(pos)

            local posm = v3()
            posm = entity.get_entity_coords(pedd)
            posm.z = posm.z + 100

            local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
            pos_off = v3()
            pos_off.x = pos.x + math.random(1, 5)
            pos_off.y = pos.y + math.random(1, 8)

            local playerz, zPos = gameplay.get_ground_z(pos)
            pos_off.z = zPos
            gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            pos.x = pos.x + 5
            gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            pos.y = pos.y - 5
            gameplay.shoot_single_bullet_between_coords(posm, pos, 1000.00, hash, pedd, true, false, 10000.0)
            system.wait(100)
            return HANDLER_CONTINUE
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)
aim_strike.on = false

--TODO: Ragdoll Control


function MoistsRagdollControl()

local Ragdoll_Sel = 0

local ragdolltyp = {{"Normal ragdoll", 0},{"Falls with stiff legs/body", 1},{"Narrow leg stumble(may not fall)", 2},{"Wide leg stumble(may not fall)", 3}}

local Ragdoll_Control = menu.add_feature("Moists RagDoll Control", "parent", globalFeatures.self_ped)


Ragdoll_set = menu.add_feature("Set Ragdoll Type", "action_value_i", Ragdoll_Control.id, function(feat)

        Ragdoll_Sel = ragdolltyp[feat.value_i][2]

        ui.notify_above_map("Ragdoll Type Set to: " .. ragdolltyp[feat.value_i][2].."\n("..ragdolltyp[feat.value_i][1]..")", "Moists Ragdoll Control", 140)
end)
Ragdoll_set.max_i = #ragdolltyp
Ragdoll_set.min_i = 1
Ragdoll_set.value_i = 1



function Ragdoll0_3(feat)

    local Number1 = 1900

    local Number2 = 2000

    local Number3 = 2000

    local Number4 = 3000

    local Number5 = 99999

    local PlayerP = player.player_id()

    local pedd = player.get_player_ped(PlayerP)
    ped.set_ped_to_ragdoll(pedd, Number1, Number5, 0)
    ped.set_ped_to_ragdoll(pedd, Number5, Number5, Ragdoll_Sel)
    entity.apply_force_to_entity(pedd, 1, 12, 20, 10.5, 31, 12.1, 10.3, true, true)
end

function RagdollButton(feat)

-- while(feat.on)
    -- do

    local Number1 = 1900

    local Number2 = 2000

    local Number3 = 2000

    local Number4 = 3000

    local PlayerP = player.player_id()

    local pedd = player.get_player_ped(PlayerP)
    -- if ped.can_ped_ragdoll(pedd) ==false then
    -- ped.set_ped_can_ragdoll(pedd, true)
    -- else
    entity.apply_force_to_entity(pedd, 4, 10.0, 0.0, 10.0, 3.0, 0.0, 10.3, true, true)
    ped.set_ped_to_ragdoll(pedd, Number1, Number2, 0)
    entity.apply_force_to_entity(pedd, 4, 2,0, 0.8, 3, 2.1, 10.3, false, true)
    ped.set_ped_to_ragdoll(pedd, Number3, Number4, Ragdoll_Sel)
    -- end
    return HANDLER_POP
end

function RagdollButtontoggle(feat)
    while(feat.on)
    do

        local Number1 = 1900

        local Number2 = 2000

        local Number3 = 2000

        local Number4 = 3000

        local PlayerP = player.player_id()

        local pedd = player.get_player_ped(PlayerP)
        -- if ped.can_ped_ragdoll(pedd) == false then
        -- ped.set_ped_can_ragdoll(pedd, true)
        -- else
        ped.set_ped_to_ragdoll(pedd, Number1, Number2, 3)
        entity.apply_force_to_entity(pedd, 5, 2, 2, 5.8, 3, 2.1, 10.3, true, true)
        ped.set_ped_to_ragdoll(pedd, Number3, Number4, Ragdoll_Sel)
        -- end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end

function Ragdolltoggle(feat)
    while(feat.on)
    do

        local Number1 = 1900

        local Number2 = 2000

        local Number3 = 2000

        local Number4 = 3000

        local Number5 = 99999

        local PlayerP = player.player_id()

        local pedd = player.get_player_ped(PlayerP)
        -- if ped.can_ped_ragdoll(pedd) == false then
        -- ped.set_ped_can_ragdoll(pedd, true)
        -- else
        ped.set_ped_to_ragdoll(pedd, Number1, Number2, Ragdoll_Sel)
        system.wait(100)
        entity.apply_force_to_entity(pedd, 1, 2,0, 0.8, 3, 2.1, 10.3, true, false)
        system.wait(100)
        ped.set_ped_to_ragdoll(pedd, Number3, Number4, Ragdoll_Sel)
        system.wait(100)
        entity.apply_force_to_entity(pedd, 1, 2,0, 0.8, 3, 2.1, 10.3, true, false)
        system.wait(100)
        ped.set_ped_to_ragdoll(pedd, Number4, Number5, Ragdoll_Sel)
        system.wait(100)
        -- end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end

function Ragdolltoggle1(feat)
    while(feat.on)
    do

        local Number1 = 1900

        local Number2 = 2000

        local Number3 = 2000

        local Number4 = 3000

        local Number5 = 99999

        local PlayerP = player.player_id()

        local pedd = player.get_player_ped(PlayerP)
        -- if ped.can_ped_ragdoll(pedd) == false then
        -- ped.set_ped_can_ragdoll(pedd, true)
        -- else
        ped.set_ped_to_ragdoll(pedd, Number1, Number2, Ragdoll_Sel)
        --system.wait(100)
        --entity.apply_force_to_entity(pedd, 4, 2,0, 0.8, 3, 2.1, 10.3, true, false)
        --system.wait(100)
        ped.set_ped_to_ragdoll(pedd, Number3, Number4, Ragdoll_Sel)
        --system.wait(100)
        --entity.apply_force_to_entity(pedd, 4, 2,0, 0.8, 3, 2.1, 10.3, true, false)
        --system.wait(100)
        ped.set_ped_to_ragdoll(pedd, Number4, Number5, Ragdoll_Sel)
        --system.wait(100)
        -- end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end


ragdoll_key = menu.add_feature("Ragdoll HotKey", "toggle", Ragdoll_Control.id, function(feat)
    if feat.on then

        local key = MenuKey()
        key:push_str("LCONTROL")
        key:push_str("x")
        if key:is_down() then
            rag_self.on = not rag_self.on
            ui.notify_above_map(string.format("Switching %s\n%s Ragdoll on your ped", rag_self.on and "ON" or "OFF", rag_self.on and "Setting" or "Ending"), "Moists Ragdoll Control", 140)
            system.wait(1200)
        end
    end
    return HANDLER_CONTINUE
end)
ragdoll_key.on = true



local set_rag_self = menu.add_feature("Set Self to Ragdoll", "action", Ragdoll_Control.id, RagdollButton)

local tw2rag_self = menu.add_feature("Set Ragdoll", "toggle", Ragdoll_Control.id, Ragdolltoggle1)

local force_rag_self = menu.add_feature("Set Ragdoll Apply force", "action", Ragdoll_Control.id, Ragdoll0_3)

local twrag_self = menu.add_feature("Twitching Ragdoll", "toggle", Ragdoll_Control.id, RagdollButtontoggle)

local tw1rag_self = menu.add_feature("Twitching Ragdoll v1", "toggle", Ragdoll_Control.id, Ragdolltoggle)

rag_self = menu.add_feature("Lifeless Ragdoll(Hotkey Preset)", "toggle", Ragdoll_Control.id, function(feat)
    if feat.on then

        local Number1 = 1900

        local Number2 = 2000

        local Number3 = 2000

        local Number4 = 3000

        local PlayerP = player.player_id()

        local pedd = player.get_player_ped(PlayerP)
        ped.set_ped_to_ragdoll(pedd, Number1, Number2, 0)
        entity.apply_force_to_entity(pedd, 4, 2,0, 0.8, 3, 2.1, 10.3, false, true)
        ped.set_ped_to_ragdoll(pedd, Number3, Number4, 4)
    end
    return HANDLER_CONTINUE
end)
rag_self.on = false

end
MoistsRagdollControl()


-- TODO: player ped options

menu.add_feature("give self glowstick", "action", globalFeatures.self_ped, function(feat)
    local pos = v3()
    local offset = v3()
    local rot = v3()
    offset.x = 0.12
    offset.y = 0.0
    offset.z = -0.26
    rot.x = -181.0
    rot.y = 0.0
    rot.z = 0.0

    local pped = player.get_player_ped(player.player_id())
    local bone = ped.get_ped_bone_index(pped, 18905)
    spawned_cunts[#spawned_cunts+1] = object.create_object(3324004640, pos, true, false)

    entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone, offset, rot, true, false, true, 0, true)

end)

global_func.self = menu.add_feature("Put Handcuffs on Self", "action", globalFeatures.self_ped, function(feat)
    local pped = player.get_player_ped(player.player_id())
    if ped.get_ped_drawable_variation(pped, 7) == 25 then
        ped.set_ped_component_variation(pped, 7, 0, 0, 0)
    else
        ped.set_ped_component_variation(pped, 7, 25, 0, 0)
    end
end)

global_func.self = menu.add_feature("Set Handcuffs Locked Position", "action", globalFeatures.self_ped, function(feat)
    local pped = player.get_player_ped(player.player_id())
    ped.set_ped_component_variation(pped, 7, 25, 0, 0)
    weapon.give_delayed_weapon_to_ped(pped, ped_wep[2][2], 0, 1)
end)

global_func.self = menu.add_feature("White Team parachute Pack", "action", globalFeatures.self_ped, function(feat)

        local pped = player.get_player_ped(player.player_id())
        ped.get_ped_drawable_variation(pped, 5)
        ped.set_ped_component_variation(pped, 5, 58, 8, 0)

end)

global_func.force_wPara = menu.add_feature("Force White parachute On", "toggle", globalFeatures.self_options, function(feat)
    setting["force_wPara"] = true
    if feat.on then
        local pped = player.get_player_ped(player.player_id())

        if ped.get_ped_drawable_variation(pped, 5) ~= 58 then
            ped.set_ped_component_variation(pped, 5, 58, 8, 0)
        end
        system.wait(600)
        return HANDLER_CONTINUE
    end
    setting["force_wPara"] = false
    return HANDLER_POP

end)
global_func.force_wPara.on = setting["force_wPara"]

global_func.force_wBPH = menu.add_feature("Force White BPH On", "toggle", globalFeatures.self_options, function(feat)
    setting["force_wBPH"] = true
    if feat.on then
        local pped = player.get_player_ped(player.player_id())

        if ped.get_ped_prop_index(pped, 0) ~= 59 then
            ped.set_ped_prop_index(pped, 0, 59, 8, 0)
        end
        system.wait(600)
        return HANDLER_CONTINUE
    end
    setting["force_wBPH"] = false
    return HANDLER_POP

end)
global_func.force_wBPH.on = setting["force_wBPH"]


--TODO: Self Options

--TODO: Hydra Triplets
local hydrafun = menu.add_feature("Spawn Hydra Triples offset", "action", globalFeatures.self, function(feat)

    local pedd = player.get_player_ped(player.player_id())
    local bid = ped.get_ped_bone_index(pedd, 17916)
    local rot = v3(0.0,0.0,0.0)
    local offset = v3(15.0,0.0,0.0)
    local pos = entity.get_entity_coords(pedd)
    pos.x =  pos.x + 10.0
    local i = #spawned_cunts + 1
    
    streaming.request_model(970385471)
    while (not streaming.has_model_loaded(970385471)) do
        system.wait(0)
    end
    
    spawned_cunts[i] =  vehicle.create_vehicle(970385471, pos, pos.z, true, false)
    local attacha = spawned_cunts[i]
    local i = #spawned_cunts + 1
    spawned_cunts[i] =  vehicle.create_vehicle(970385471, pos, pos.z, true, false)
    entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
    vehicle.control_landing_gear(spawned_cunts[i], 3)
    local attachb = spawned_cunts[i]
    local offset = v3(-15.0,0.0,0.0)
    local i = #spawned_cunts + 1
    spawned_cunts[i] =  vehicle.create_vehicle(970385471, pos, pos.z, true, false)
    entity.attach_entity_to_entity(spawned_cunts[i], attacha, bid, offset, rot, true, true, false, 0, true)
    vehicle.control_landing_gear(spawned_cunts[i], 3)
end)


--TODO: Countermeasure Hotkey

local Counter_key = menu.add_feature("Flare Countermeasures", "value_i", globalFeatures.self_veh, function(feat)
    
    setting["counter_Hotkey"] = true
    
    if feat.on then

        local key = MenuKey()
        key:push_str("LCONTROL")
        --key:push_str("RCONTROL")
        if key:is_down() then


            local pedd = player.get_player_ped(player.player_id())

            local pos = v3()
            pos = entity.get_entity_coords(pedd)
            pos.z =  pos.z + 15

            -- local posz
            -- posz, pos.z = gameplay.get_ground_z(pos)

            local offset = v3()
            offset.x = 5.0
            offset.y = -5.0
            offset.z = -5.0

            local speed = feat.value_i

            local hash = gameplay.get_hash_key("WEAPON_FLAREGUN")
            gameplay.shoot_single_bullet_between_coords(pos, pos + offset, 10000.00, hash, pedd, false, true, speed)
            system.wait(10)

        end
    return HANDLER_CONTINUE
    end
       setting["counter_Hotkey"] = false
       return HANDLER_POP
end)
Counter_key.on = setting["counter_Hotkey"]
Counter_key.max_i = 10000
Counter_key.min_i = 20
Counter_key.value_i = 1550
Counter_key.mod_i = 75



global_func.Veh_no_col = menu.add_feature("Vehicle has no collision)", "toggle", globalFeatures.self_veh, function(feat)
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

        return HANDLER_POP

end)

global_func.mk1boostrefill = menu.add_feature("VolticBoost Delayed Refill(MK1)", "toggle", globalFeatures.self_veh, function(feat)
    setting["global_func.mk1boostrefill"] = true
    if feat.on then
        local myped = player.get_player_ped(player.player_id())
        if ped.is_ped_in_any_vehicle(myped) == true then
            local Curveh = ped.get_vehicle_ped_is_using(myped)
            if vehicle.is_vehicle_rocket_boost_active(Curveh) == false then
                return HANDLER_CONTINUE
            end
            system.wait(2000)
            vehicle.set_vehicle_rocket_boost_percentage(Curveh, 100.00)
        end
        return HANDLER_CONTINUE
    end
    setting["global_func.mk1boostrefill"] = false
    return HANDLER_POP

end)
global_func.mk1boostrefill.on = setting["global_func.mk1boostrefill"]

global_func.mk2boostrefill = menu.add_feature("VolticBoost Instant Recharge(MK2)", "toggle", globalFeatures.self_veh, function(feat)
    setting["global_func.mk2boostrefill"] = true

    if feat.on then
        local myped = player.get_player_ped(player.player_id())
        if ped.is_ped_in_any_vehicle(myped) == true then
            local Curveh = ped.get_vehicle_ped_is_using(myped)
            vehicle.set_vehicle_rocket_boost_refill_time(Curveh, 0.000001)
        end
        return HANDLER_CONTINUE
    end
    setting["global_func.mk2boostrefill"] = false
    return HANDLER_POP

end)
global_func.mk2boostrefill.on = setting["global_func.mk2boostrefill"]

global_func.veh_rapid_fire = menu.add_feature("RapidFire RepairLoop Glitch", "toggle", globalFeatures.self_veh, function(feat)
    setting["global_func.veh_rapid_fire"] = true
    if feat.on then
        local myped = player.get_player_ped(player.player_id())
        if ped.is_ped_in_any_vehicle(myped) == true then
            local Curveh = ped.get_vehicle_ped_is_using(myped)
            vehicle.set_vehicle_fixed(Curveh)
            vehicle.set_vehicle_deformation_fixed(Curveh)
        end
        return HANDLER_CONTINUE
    end
    setting["global_func.veh_rapid_fire"] = false
    return HANDLER_POP
end)
global_func.veh_rapid_fire.on = setting["global_func.veh_rapid_fire"]

global_func.rapidfire_hotkey1 = menu.add_feature("RapidFire RepairLoop Hotkey", "toggle", globalFeatures.self_options, function(feat)
    setting["global_func.rapidfire_hotkey1"] = true
    if feat.on then
        local key = MenuKey()
        key:push_str("LCONTROL")
        key:push_str("r")
        if key:is_down() then
            global_func.veh_rapid_fire.on = not global_func.veh_rapid_fire.on
            moist_notify("Switching Rapid Fire for your Current Vehicle", global_func.veh_rapid_fire.on and "ON" or "OFF", global_func.veh_rapid_fire.on and "Glitch On" or "Set Repaired")
            system.wait(1200)
        end

        return HANDLER_CONTINUE
    end
    setting["global_func.rapidfire_hotkey1"] = false
    return HANDLER_POP
end)
global_func.rapidfire_hotkey1.on = setting["global_func.rapidfire_hotkey1"]

--TODO: Self Stat Hotkey Switches

global_func.thermal_stat_switch_hotkey = menu.add_feature("Switch Thermal/NV Hotkey", "toggle", globalFeatures.self_options, function(feat)
        setting["global_func.thermal_stat_switch_hotkey"] = true
            local thermalstat_hash = gameplay.get_hash_key("MP0_HAS_DEACTIVATE_NIGHTVISION")
        if feat.on then
            local key = MenuKey()
            key:push_str("LCONTROL")
            key:push_str("F11")
            if key:is_down() then

            local state = stats.stat_get_bool(thermalstat_hash, 0)
                local setstate = not state
                stats.stat_set_bool(thermalstat_hash, setstate, true)
                moist_notify("Thermal/Nightvision State:\n", "Switched")
            system.wait(1200)
        end
        return HANDLER_CONTINUE
    end
    setting["global_func.thermal_stat_switch_hotkey"] = false
    return HANDLER_POP
end)
global_func.thermal_stat_switch_hotkey.on = setting["global_func.thermal_stat_switch_hotkey"]

local cross_hair = menu.add_feature("Show Weapon Recticle", "toggle", globalFeatures.self_options, function(feat)
    setting["Weapon_Recticle"] = true
    if feat.on then
        ui.show_hud_component_this_frame(14)
        return HANDLER_CONTINUE
    end
    setting["Weapon_Recticle"] = false
    return HANDLER_POP
end)
cross_hair.on = setting["Weapon_Recticle"]

local function set_waypoint(pos)
    pos = pos or player.get_player_coords(player.player_id())
    if pos.x and pos.y then
        local coord = v2()
        coord.x = pos.x
        coord.y = pos.y
        ui.set_new_waypoint(coord)
    end
end

--TODO: Player stats

local mental_stat = menu.add_feature("Get Mental State", "action", globalFeatures.self_statcheck, function(feat)
    local stat_hash = gameplay.get_hash_key("MP0_PLAYER_MENTAL_STATE")

    local stat_result = stats.stat_get_float(stat_hash, 0)
    moist_notify("Current Mental State:\n", stat_result)
end)

local thermal = menu.add_feature("Check Thermal/NV State", "action", globalFeatures.self_statcheck, function(feat)
    local stat_hash = gameplay.get_hash_key("MP0_HAS_DEACTIVATE_NIGHTVISION")

    local stat_result = stats.stat_get_bool(stat_hash, 0)
    local state
    if stat_result == true then
        state = "OFF"
    else
        state = "ON"
    end
    moist_notify("Thermal/Nightvision State:\n", state)
end)

local helmet_visor = menu.add_feature("Helmet Visor State", "action", globalFeatures.self_statcheck, function(feat)
    local stat_hash = gameplay.get_hash_key("MP0_IS_VISOR_UP")

    local stat_result = stats.stat_get_bool(stat_hash, 0)
    if stat_result == true then
        state = "UP"
    else
        state = "DOWN"
    end
    moist_notify("Helmet Visor State:\n", state)
end)

--TODO: Force Mental State
mental_statset = menu.add_feature("Set Mental State", "action_value_i", globalFeatures.self_statsetup, function(feat)
    local stat_hash = gameplay.get_hash_key("MP0_PLAYER_MENTAL_STATE")
    local i = tonumber(feat.value_i)
    local stat_result1 = stats.stat_get_float(stat_hash, 0)
    stats.stat_set_float(stat_hash, i, true)
    local stat_result2 = stats.stat_get_float(stat_hash, 0)
    moist_notify("Previous Mental State: ".. stat_result1, "\nNow: ".. stat_result2)
    moist_notify("Will now try to Force Mental State Change: ", "\nBy Creating & Killing a Ped on Chilliad in your name")
    local pped = player.get_player_ped(player.player_id())
    local model = 0xDB134533
    streaming.request_model(model)
    while not streaming.has_model_loaded(model) do

        system.wait(10)
    end
    local spawnpos = v3(491.176,5529.808,777.503)
    local stat_force = ped.create_ped(26, model, spawnpos, 0, true, false)
    local stat_force = ped.create_ped(26, model, spawnpos, 0, true, false)

    local bonebool2
    local pos2 = v3()
    bonebool2, pos2 = ped.get_ped_bone_coords(stat_force, 12844, offset)
    local pos = v3()
    pos = pos2
    pos.x = pos.x - 30
    pos.z = pos.z + 100

    gameplay.shoot_single_bullet_between_coords(pos, pos2, 10000, 1752584910, pped, true, false, 10000.00)
    gameplay.shoot_single_bullet_between_coords(pos, pos2, 10000, 1752584910, pped, true, false, 10000.00)

    system.wait(100)
    streaming.set_model_as_no_longer_needed(model)
    moist_notify("Force Mental State Finished", "\nNow your mental state should be visible in this session")


end)
mental_statset.max_i = 100
mental_statset.min_i = 0
mental_statset.value_i = 0

local thermal_set = menu.add_feature("Switch Helmet Visor State", "action", globalFeatures.self_statsetup, function(feat)

        local stat_hash = gameplay.get_hash_key("MP0_IS_VISOR_UP")
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

        moist_notify("Switch Helmet Visor State:\n", statenow)

end)

local helmet_visor_set = menu.add_feature("Switch Thermal/NV State", "action", globalFeatures.self_statsetup, function(feat)

        local stat_hash = gameplay.get_hash_key("MP0_HAS_DEACTIVATE_NIGHTVISION")
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

        moist_notify("Thermal / Nightvision State:\n", statenow)

end)

--TODO: Quick Stat Setups

local em_rec = {}

local setup_casinostats = menu.add_feature("Setup Casino Heist Stealth Diamonds", "action", globalFeatures.quick_stats, function(feat)

        for i = 1, #heiststat_setup do
            local stat_hash = gameplay.get_hash_key(heiststat_setup[i][1])
            em_rec[#em_rec + 1] = stats.stat_get_int(stat_hash, 0)

            stats.stat_set_int(stat_hash, heiststat_setup[i][2], true)
        end
        moist_notify("Stats Setup", "\nFinished")
        moist_notify("Now Creating Stat Recovery Script\n", "Saved in scripts folder")
        Create_stat_RecoveryScript()
        moist_notify("Stats Recovery Script", "\ndone")

end)

function write_recScript(text)
    local file = io.open(rootPath .. "\\scripts\\Moists_statrecovery.lua", "a")
    io.output(file)
    io.write(text)
    io.close()
end

function Create_stat_RecoveryScript()

    for i = 1, #heiststat_setup do
        local stat_hash = gameplay.get_hash_key(heiststat_setup[i][1])

    end
    local statdate = get_date_time()
    write_recScript('menu.add_feature("Stat Recovery'.. statdate..'", "action", 0, function(feat)\n\n')
    for i = 1, #em_rec do
        local stat = heiststat_setup[i][2]
        local statval = em_rec[i]
        write_recScript('stats.stat_set_int('..stat..', '..statval..', '..'true)\n')
    end
    write_recScript('end)\n\n')
    em_rec = {}

end

--TODO: local session functions

local blockpassiveall = function()

    local me

    me	= player.player_id()

    for i=0,32 do
        if i ~= me
        then
            ScriptTR(0xC9CC4F80, i, {1, 1})
            ScriptTR(3385610112, i, {1, 1})

        end
    end
end

local notmarkall = function()
    local me

    me = player.player_id()

    for i = 0, 32 do
        if i ~= me then

        end
        player.unset_player_as_modder(i, -1)
    end
end

local notallmod = menu.add_feature("UnMark all Players as Modder", "action", globalFeatures.protex, function(feat)
    notmarkall()
end)
notallmod.threaded = false

--TODO: Session Kicks

local NetBail_SHF_Kick = menu.add_feature("ScriptHost Fuckarino", "toggle", globalFeatures.kick, function(feat)
    if feat.on then

        local me = player.player_id()
        for i = 0, 32 do
            local fnd = player.is_player_friend(i)
            if i ~= me or fnd then
                ScriptTR(-2122716210, i, {91645, -99683, 1788, 60877, 55085, 72028})
                ScriptTR(-2120750352, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(0xE6116600, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-977515445, i, {-1, 500000, 849451549, -1, -1})
                ScriptTR(767605081, i, {-1, 500000, 849451549, -1, -1})
                ScriptTR(-1949011582, i, {-1139568479, -1, 1, 100099})
                ScriptTR(-2122716210, i, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
                ScriptTR(-922075519, i, {-1, -1, -1, -1, -1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
                ScriptTR(-1975590661, i, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)

--TODO: Force host

local hostnow

HostForce = menu.add_feature("Kick Host until Session host", "toggle", globalFeatures.kick,	function(feat)

        if feat.on then
            -- HostForce_togglecheck.on = true
            hostnow = player.get_host()
            if not network.network_is_host() then

                player.unset_player_as_modder(hostnow, -1)
                ScriptTR(-2120750352, hostnow, {hostnow, script.get_global_i(1630317 + (1 + (hostnow * 595)) + 506)})
                ScriptTR(0xE6116600, hostnow, {hostnow, script.get_global_i(1630317 + (1 + (hostnow * 595)) + 506)})

                system.wait(200)
                toggle_kicks(hostnow)
            end

            if network.network_is_host() then
                -- HostForce_togglecheck.on = false
                moist_notify("Stolen Host by Force!", "\nSuccess")
                HostForce.on = false

            end


            return HANDLER_CONTINUE

        end


        return HANDLER_POP
end)
HostForce.on = false

local netbailkick = menu.add_feature("Network Bail Kick", "toggle", globalFeatures.kick, function(feat)
    if feat.on then

        local me = player.player_id()
        for i = 0, 32 do
            local fnd = player.is_player_friend(i)
            if i ~= me or fnd then

                ScriptTR(-81613951, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-1292453789, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(1623637790, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-1905128202, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(1160415507, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-2120750352, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(0xE6116600, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})


            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)

local testkick = menu.add_feature("Test Kick", "toggle", globalFeatures.kick, function(feat)
    if feat.on then

        local me = player.player_id()
        for i = 0, 32 do
            local fnd = player.is_player_friend(i)
            if i ~= me or fnd then

                ScriptTR(-81613951, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-1292453789, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(1623637790, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(-1905128202, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                ScriptTR(1160415507, i, {i, script.get_global_i(1630317 + (1 + (i * 595)) + 506)})
                --	ScriptTR(150902083, i, {i, script.get_global_i(1628237 + (1 + (i * 615)) + 533)})

            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)

local hostnotify = false
function hostkickall(pid)

    network.network_session_kick_player(pid)

end

local hostkick = menu.add_feature("Host Kick All", "toggle", globalFeatures.kick, function(feat)
    if not feat.on then
        hostnotify = false
        return HANDLER_POP
    end
    local me = player.player_id()
    if network.network_is_host() then
        for i = 0, 32 do
            local fnd = player.is_player_friend(i)
            if i ~= me or fnd then

                hostkickall(i)

            end
        end
        return HANDLER_POP
    end
    if not hostnotify then
        notify_above_map("You are not Session-Host!")
        hostnotify = true
    end
    return HANDLER_CONTINUE

end)

function toggle_kicks(pid)
    playerFeatures[pid].features["EventSpam_toggle"].feat.on = true
end

local all_mod = menu.add_feature("Mark all Players as Modder", "toggle", globalFeatures.protex, function(feat)
    if feat.on then

        local me
        me = player.player_id()
        for i = 0, 32 do
            local fnd = player.is_player_friend(i)
            if i ~= me or fnd then
                player.set_player_as_modder(i, 1)
                player.set_player_as_modder(i, mod_flag_1)
                player.set_player_as_modder(i, mod_flag_2)
            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP

end)
all_mod.on = false

--TODO: World stuff
-- **WATER WAVE MODIFIERS (local)**

local Moists_WaveMod = function()
local Moist_WaveMod = function()

    local wave_int_cur = tostring("~q~~h~"..water.get_waves_intensity())
    CurrentIntensity = tostring(wave_int_cur)
   -- ui.notify_above_map("~w~~h~Current Wave Intensity is:".." " ..wave_int_cur.." ", "Moists Wave Mod", 212)
end

wave_int_osd = menu.add_feature("Get Current Wave Intensity", "toggle", globalFeatures.Wave, function(feat)
    
        if feat.on then

            local wave_int_cur = water.get_waves_intensity()
            local pos = v2()
            pos.x = .305
            pos.y = .0001
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


local waveintmodifiers = menu.add_feature("Persistant Wave Intensity", "value_i", globalFeatures.Wave, function(feat)
    
    if feat.on then
        local x = feat.value_i / 10
        water.set_waves_intensity(x)
        Moist_WaveMod()
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)
waveintmodifiers.max_i = 500000
waveintmodifiers.min_i = -200
waveintmodifiers.mod_i = 1

local waveintmodifiers = menu.add_feature("Change Wave Intensity", "action_value_i", globalFeatures.Wave, function(feat)

        local x = feat.value_i / 10
        water.set_waves_intensity(x)
        Moist_WaveMod()
end)
waveintmodifiers.max_i = 500000
waveintmodifiers.min_i = -200
waveintmodifiers.mod_i = 1

menu.add_feature("Change step Size", "autoaction_i",  globalFeatures.Wave, function(feat)
    waveintmodifiers.mod_i = f.value_i
end)

local wavemodifiers = menu.add_feature("Reset Intensity", "action", globalFeatures.Wave, function(feat)
    water.reset_waves_intensity()
end)
end
Moists_WaveMod()

local World_Clean = function()
local cleanup_done = true
local clear_World_ent = menu.add_feature("Fetched World Entities Move & Delete", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false

    moist_notify("Trying to Removal All\nCunts in the World\n", " Cleanups Disabled until Done!")
    get_everything()
    system.wait(500)
    clear_world()
    moist_notify("Cunts Removed only Cunt Left: ", "~y~is you!~y~\nCleanups Enabled")

end)

local Force_clear_all = menu.add_feature("Force Removal (Missed Anything?)", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false

    moist_notify("Forcing Removal of Cunts\nLeft Over", "~y~ Run ~g~1 ~w~Started")
    moist_notify("Cleanups Disabled until Done!")

    force_delete2()

    system.wait(250)

    moist_notify("Now Cunts who wont\nFuck off~y~ Run ~b~2", " Please Be Patient!")

    force_delete2()
    moist_notify("Remiaining Cunts Should be gone ", "Cleanups Enabled")


end)

local clear_peds = menu.add_feature("Fetch all Peds Move & Delete", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false


    moist_notify("Ped Clearing Started\n",  " Cleanups Disabled until Done!")



    get_allpeds()
    system.wait(250)
    move_delete_peds()
    moist_notify("Only Peds left are Cunts\n", " Cleanups Enabled")
end)

local fetch_obj = menu.add_feature("Fetch all objects Move & Delete", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false

    moist_notify("Cunt Cleaning Started: \n", " Cleanups Disabled until Done!")
    get_allobj()
    system.wait(250)
    move_delete_obj()
    moist_notify("Cuntish Objects Removed\n",  " Cleanups Enabled")
end)

local fetch_obj = menu.add_feature("Fetch all Heist Cameras Move & Delete", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false
    local Hashes = {2151061176,3234250744,548760764}


    moist_notify("Removing Cunts Ability to Spy on us: \n", " Cleanups Disabled until Done!")
    get_allobj()
    system.wait(250)

    local cams = {}

    for i = 1, #allobj do
        if entity.get_entity_model_hash(allobj[i]) == 2151061176 or 3234250744 or 548760764 then

            local pos = v3()
            pos.x = -5784.258301
            pos.y = -8289.385742
            pos.z = -136.411270
            network.request_control_of_entity(allobj[i])
            entity.set_entity_coords_no_offset(allobj[i], pos)
            entity.set_entity_as_no_longer_needed(allobj[i])
            entity.delete_entity(allobj[i])
            system.wait(25)
        end
    end

    system.wait(25)
    cleanup_done = true

    moist_notify("Cunts Hunt us Now Cam's Removed\n",  " Cleanups Enabled")

    return HANDLER_POP

end)

local fetch_veh = menu.add_feature("Fetch all Vehicles Move & Delete", "action", globalFeatures.entity_removal, function(feat)
    if not cleanup_done == true then return end
    cleanup_done = false
    moist_notify("Cunt Cleanup Started\n", " Cleanups Disabled until Done!")
    get_allveh()
    system.wait(250)
    move_delete_veh()
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
    if not (#allpickups) == nil or 0 then
        for i = 1, #allpickups do
            network.request_control_of_entity(allpickups[i])
            entity.set_entity_coords_no_offset(allpickups[i], pos)
            entity.set_entity_as_no_longer_needed(allpickups[i])
            entity.delete_entity(allpickups[i])
            system.wait(10)
        end
    end
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
    if not (#allobj) == nil or 0 then
        for i = 1, #allobj do
            network.request_control_of_entity(allobj[i])
            entity.set_entity_coords_no_offset(allobj[i], pos)
            entity.set_entity_as_no_longer_needed(allobj[i])
            entity.delete_entity(allobj[i])
            system.wait(25)
        end
    end
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
    cleanup_done = true
    return HANDLER_POP

end

function force_delete2()
    cleanup_done = true
    local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270

    if not (#allpickups) == nil or 0 then
        for i = 1, #allpickups do
            if not entity.is_an_entity(allpickups[i]) then
                return
            end
            network.request_control_of_entity(allpickups[i])
            entity.set_entity_coords_no_offset(allpickups[i], pos)
            entity.set_entity_as_no_longer_needed(allpickups[i])
            entity.delete_entity(allpickups[i])
            system.wait(5)
        end
    end

    if not (#allobj) == nil or 0 then
        for i = 1, #allobj do
            if not entity.is_an_entity(allobj[i]) then
                return
            end
            network.request_control_of_entity(allobj[i])
            entity.set_entity_coords_no_offset(allobj[i], pos)
            entity.set_entity_as_no_longer_needed(allobj[i])
            entity.delete_entity(allobj[i])
            system.wait(10)
        end
    end

    if not (#allveh) == nil or 0 then
        for i = 1, #allveh do
            if not entity.is_an_entity(allveh[i]) then
                return end
            if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then

                network.request_control_of_entity(allveh[i])
                entity.set_entity_coords_no_offset(allveh[i], pos)
                entity.set_entity_as_no_longer_needed(allveh[i])
                entity.delete_entity(allveh[i])
                system.wait(100)
            end
        end
    end
    if not (#allpeds) == nil or 0 then
        for i = 1, #allpeds do
            if not entity.is_an_entity(allpeds[i]) then
                return
            end
            if not ped.is_ped_a_player(allpeds[i]) then
                network.request_control_of_entity(allpeds[i])
                entity.set_entity_coords_no_offset(allpeds[i], pos)
                entity.set_entity_as_no_longer_needed(allpeds[i])
                entity.delete_entity(allpeds[i])
                system.wait(100)
            end
        end
    end

    return HANDLER_POP

end
end
World_Clean()

--TODO: Session Troll

local heart_beat = menu.add_feature("Heart Beat", "toggle", globalFeatures.troll, function(feat)
    if (feat.on) then
        system.wait(400)
        fire.add_explosion(v3(0,-1500,100), 58, true, false, 0, 0)
        system.wait(200)
        fire.add_explosion(v3(0,-1500,100), 58, true, false, 0, 0)
        return HANDLER_CONTINUE
    end
end)

local delay_beat = 0

local heart_beat2 = menu.add_feature("Random Exp", "value_i", globalFeatures.troll, function(feat)

        if feat.on then

            pos.x = math.random(-2700, 2700)
            pos.y = math.random(-3300, 7500)
            pos.z = math.random(30, 90)

            fire.add_explosion(pos, feat.value_i, true, false, 0, 0)
            system.wait(delay_beat)
            return HANDLER_CONTINUE
        end

end)
heart_beat2.max_i = 74
heart_beat2.min_i = 0
heart_beat2.value_i = 0

local hb_delay = menu.add_feature("Exp delay", "value_i", globalFeatures.troll, function(feat)
    delay_beat = tonumber(feat.value_i)
end)
hb_delay.max_i = 1000
hb_delay.min_i = 0
hb_delay.value_i = 0

local bountyallplayerses = menu.add_feature("set Bounty on Lobby", "action", globalFeatures.troll, function(feat)

        for playid = 0, 31 do

            if player.get_player_scid(playid) ~= -1 then

                for j = 0, 31 do
                    ScriptTR(0xF90CC891, j, {-1, playid, 1, 10000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1652336 + 9), script.get_global_i(1652336 + 10)})
                    ScriptTR(4178364561, j, {-1, playid, 1, 10000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1652336 + 9), script.get_global_i(1652336 + 10)})
                end
            end

        end
end)

local pasivall = menu.add_feature("Block all players Passive", "action", globalFeatures.troll, function(feat)
    blockpassiveall()
end)

local session_soundRape = function()
local sndrape_00 = menu.add_feature("all Water Splashes", "action", globalFeatures.troll, function(feat)

        local pos = v3()
        for i = 0, 31 do
            plyped = player.get_player_ped(i)
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then

                audio.play_sound_from_entity(-1, "FallingInWaterSmall", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
                system.wait(120)
                audio.play_sound_from_entity(-1, "FallingInWaterMedium", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
                system.wait(120)
                audio.play_sound_from_entity(-1, "FallingInWaterHeavy", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
                system.wait(120)
                audio.play_sound_from_entity(-1, "DiveInWater", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
                system.wait(120)

            end
        end
end)

local sndrape_01 = menu.add_feature("all Horn", "action", globalFeatures.troll, function(feat)

        local pos = v3()
        for i = 0, 31 do
            plyped = player.get_player_ped(i)
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))


                audio.play_sound_from_entity(-1,  "HORN", plyped, "DLC_Apt_Yacht_Ambient_Soundset", true)
                audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 1000000, false)

            end
        end
end)

local sndrape_02 = menu.add_feature("all Air Drop", "action", globalFeatures.troll, function(feat)

        local pos = v3()
        for i = 0, 31 do
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))
                plyped = player.get_player_ped(i)

                audio.play_sound_from_entity(-1, "Air_Drop_Package", plyped, "DLC_SM_Generic_Mission_Sounds", true)


            end
        end
end)

local sndrape_3 = menu.add_feature("all Explosion Countdown", "action", globalFeatures.troll, function(feat)

        local pos = v3()
        for i = 0, 31 do
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))
                plyped = player.get_player_ped(i)
                audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 1000, false)
                audio.play_sound_from_entity(-1, "Explosion_Countdown", plyped, "GTAO_FM_Events_Soundset", true)


            end
        end
end)

local sndrape_4 = menu.add_feature("Annoying sound! CANT BE UNDONE!", "action", globalFeatures.troll, function(feat)

        local pos = v3()
        for i = 0, 31 do
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))

                local plyped = player.get_player_ped(i)
                audio.play_sound_from_coord(-1, "Frontend_Beast_Frozen_Screen_Loop", pos, "FM_Events_Sasquatch_Sounds", true, 1000, false)
            end
        end
end)


local sndrape_1 = menu.add_feature("allBomb Armed", "value_i", globalFeatures.troll, function(feat)
    if feat.on then

        local delaytime = feat.value_i

        local pos = v3()
        for i = 0, 31 do
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))

                local plyped = player.get_player_ped(i)

                audio.play_sound_from_entity(-1, "Bomb_Armed", plyped, "GTAO_Speed_Convoy_Soundset", true)
                system.wait(delaytime)
            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)
sndrape_1.max_i = 1000
sndrape_1.min_i = 0
sndrape_1.mod_i = 5

local sndrape_2 = menu.add_feature("all Bomb Disarmed", "value_i", globalFeatures.troll, function(feat)
    if feat.on then

        local delaytime = feat.value_i

        local pos = v3()
        for i = 0, 31 do
            if (player.get_player_scid(i) ~= -1 and i ~= player.player_id()) then
                pos = entity.get_entity_coords(player.get_player_ped(i))

                local plyped = player.get_player_ped(i)


                audio.play_sound_from_entity(-1, "Bomb_Disarmed", plyped, "GTAO_Speed_Convoy_Soundset", true)
                system.wait(delaytime)
            end
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end)
sndrape_2.max_i = 1000
sndrape_2.min_i = 0
sndrape_2.mod_i = 5

end
session_soundRape()

menu.add_feature("Illuminate Everyone", "action", globalFeatures.troll, function(feat)

        for i = 0, 32 do

            local pedd = player.get_player_ped(i)
            if pedd ~= 0 then


                local pos = v3()

                local offset = v3()
                offset.x = 1.0
                offset.y = 0.1
                offset.z = -0.1

                local rot = v3()
                rot.x = 1.0
                rot.y = 1.0
                rot.z = 1.0


                local bid = ped.get_ped_bone_index(pedd, 65068)

                local hash = gameplay.get_hash_key("prop_dummy_light")
                spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, false)
                entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, false, false, false, 0, false)
                local offset = v3()
                offset.x = 0.010
                offset.y = 0.01
                offset.z = 0.001

                local rot = v3()
                rot.x = 1.0
                rot.y = 1.0
                rot.z = 1.0
                local hash = gameplay.get_hash_key("prop_air_lights_02a")
                spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, true)
                entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, false)

            end
        end
        return HANDLER_POP
end)

menu.add_feature("Everyone is a Dick Head!", "action", globalFeatures.troll, function(feat)

        for i = 0, 32 do

            local pedd = player.get_player_ped(i)
            if pedd ~= 0 then


                local pos = v3()

                local offset = v3()
                offset.x = 0.08
                offset.y = 0.0
                offset.z = 0.0

                local rot = v3()
                rot.x = 40
                rot.y = -83
                rot.z = -134


                local bid = ped.get_ped_bone_index(pedd, 65068)

                local hash = gameplay.get_hash_key("v_res_d_dildo_f")
                spawned_cunts[#spawned_cunts + 1]  = object.create_object(hash, pos, true, false)
                entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, true)
            end
        end
        return HANDLER_POP
end)


menu.add_feature("Give all Dildo Dicks", "action", globalFeatures.troll, function(feat)

        for i = 0, 32 do

            local pedd = player.get_player_ped(i)
            if pedd ~= 0 then

                local pos = v3()

                local offset = v3()
                offset.x = 0.0
                offset.y = 0.0
                offset.z = 0.0

                local rot = v3()
                rot.x = 293.0
                rot.y = 28.0
                rot.z = 24.0


                local bid = ped.get_ped_bone_index(pedd, 23553)

                local hash = gameplay.get_hash_key("v_res_d_dildo_f")
                spawned_cunts[#spawned_cunts + 1] = object.create_object(hash, pos, true, true)
                entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, true)
            end
        end
        return HANDLER_POP
end)

local world_force = menu.add_feature("Apply force to world entities", "action", globalFeatures.lobby, function(feat)
    get_everything()
    system.wait(100)
    local vel = v3()
    local velo = v3()
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

--TODO: Spawn Functions

--spawn variables defaults
model = 0xDB134533
vehhash = 788747387
wephash = 0xA2719263
local mod
local modvalue
local pedspawns

--TODO: Ped Spawn functions

function spawn_ped(pid, pedhash, offdist, attack, Posoff)
    local hash = pedhash
    plygrp =  player.get_player_group(pid)
    local pedp = player.get_player_ped(pid)
    local offset = v3()
    local OffSet = offdist

    if not Posoff then
        local pos = player.get_player_coords(pid)
        local heading = player.get_player_heading(pid)
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
    print(hash)
    local blipid
    escort[p] = ped.create_ped(26, hash, offset, 0, true, false)
    print(escort[p])
    entity.set_entity_god_mode(escort[p], true)
    blipid = ui.add_blip_for_entity(escort[p])
    ui.set_blip_as_mission_creator_blip(blipid, true)

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
        pedgroup = ped.get_ped_group(escort[p])
        ped.set_ped_as_group_member(escort[p], plygrp)
        pedgroup = ped.get_ped_group(escort[p])
        ped.set_ped_never_leaves_group(escort[p], true)

    else
    end
   -- streaming.set_model_as_no_longer_needed(hash)
end

function spawn_ped_v2(pid, pedhash, attack)
    local hash = pedhash
    plygrp =  player.get_player_group(pid)
    local pedp = player.get_player_ped(pid)
    local parachute = 0xfbab5776
    local pos = player.get_player_coords(pid)
    pos.x = pos.x + 10
    pos.y = pos.y + 20

    local offset = v3()
    local offset2 = v3()
    local rot = v3()

    local offset_z = math.random(10, 40)
    offset.z = offset_z
    local headtype = math.random(0, 2)


    rot = entity.get_entity_rotation(pedp)
    streaming.request_model(hash)
    while not streaming.has_model_loaded(hash) do

        system.wait(10)
    end
    local p = #escort + 1
    print(hash)
    local blipid

    escort[p] = ped.create_ped(26, hash, pos + offset, 0, true, false)
    print(escort[p])

    entity.set_entity_god_mode(escort[p], true)
    blipid = ui.add_blip_for_entity(escort[p])
    ui.set_blip_as_mission_creator_blip(blipid, true)
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
    local hash = vehhash
    local pid = pid
    local offset = v3()
    local OffSet = offdist

    if not Posoff then
        local pos = player.get_player_coords(pid)
        local heading = player.get_player_heading(pid)
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
    escortveh[y] = vehicle.create_vehicle(hash, offset, player.get_player_heading(pid), true, false)

    print(escortveh[y])
    vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
    vehicle.get_vehicle_mod(escortveh[y], mod)
    vehicle.set_vehicle_mod(escortveh[y], mod, modvalue, false)
    ui.add_blip_for_entity(escortveh[y])
    vehicle.set_vehicle_on_ground_properly(escortveh[y])
    entity.set_entity_god_mode(escortveh[y], true)
    vehicle.set_vehicle_doors_locked(escortveh[y], 5)

    network.request_control_of_entity(escortveh[y])
   -- streaming.set_model_as_no_longer_needed(hash)
    return escortveh[y]

end

--TODO: Spawn Cleanups

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

local Freeze_obj = menu.add_feature("Freeze World Vehicles & Objects", "action", globalFeatures.lobby, function(feat)

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

--TODO: CUNT DUMP

local dump_onplayer = function(pid, pos)
world_dumped = false
moist_notify("Ensure you are ~h~ ~r~ NOT!~o~ \nSpectating Player", "!")
moist_notify("~h~~w~ 3 Seconds\n", "Until ~r~~h~Cunt Dump ~g~~h~Starts")

system.wait(1000)
moist_notify("Cunt Dump Starts in: ", "~y~~h~2 ~r~Seconds")
system.wait(1000)

moist_notify("Cunt Dump Starts in: ", "~y~~h~1 ~r~Second")
system.wait(1000)
moist_notify("Cunt Dump Initiated", "\nSpectating now could crash you")
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
    entity.set_entity_coords_no_offset(allpickups[i], pos)
    entity.set_entity_as_no_longer_needed(allpickups[i])
  end
end
system.wait(200)
for i = 1, #allobj do
  if entity.is_an_entity(allobj[i]) then
    network.request_control_of_entity(allobj[i])
    entity.set_entity_coords_no_offset(allobj[i], pos)
    entity.set_entity_as_no_longer_needed(allobj[i])
  end
end
system.wait(200)
for i = 1, #allveh do
  if entity.is_an_entity(allveh[i]) then
    if not decorator.decor_exists_on(allveh[i], "Player_Vehicle") then
      network.request_control_of_entity(allveh[i])
      entity.set_entity_coords_no_offset(allveh[i], pos)
      entity.set_entity_as_no_longer_needed(allveh[i])
    end
  end
end
system.wait(200)
for i = 1, #allpeds do
  if entity.is_an_entity(allpeds[i]) then
    if not ped.is_ped_a_player(allpeds[i]) then
      network.request_control_of_entity(allpeds[i])
      entity.set_entity_coords_no_offset(allpeds[i], pos)
      entity.set_entity_as_no_longer_needed(allpeds[i])
    end
  end
  system.wait(200)
end
moist_notify("World Dumped On That Cunt!\n GG <font size='12'>~ex_r*~ ", "\nCarefull Spectating")
world_dumped = true
end

local dump_pickups_onplayer = function(pid, pos)
world_dumped = false
moist_notify("Going to Fetch all~h~ ~r~ Pickups!~o~ \nWill dump on target", "!")
moist_notify("~h~~w~ 3 Seconds\n", "Until ~r~~h~Pickup Cunt Dump ~g~~h~Starts")

system.wait(1000)
moist_notify("Pickup Cunt Dump Starts in: ", "~y~~h~2 ~r~Seconds")
system.wait(1000)

moist_notify("Pickup Cunt Dump Starts in: ", "~y~~h~1 ~r~Second")
system.wait(1000)
moist_notify("Pickup Cunt Dump Initiated", "\nFeel the Cunt & Pick it up Enjoy")

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
moist_notify("World Pickups have been Cunt Dumped!\n GG <font size='12'>~ex_r*~ ", "\nEnjoy The Moisture inside")
world_dumped = true
end

local dumpfreeze_onplayer = function(pid, pos)
world_dumped = false
moist_notify("Ensure you are ~h~ ~r~ NOT!~o~ \nSpectating Player", "!")
moist_notify("~h~~w~ 3 Seconds\n", "Until ~r~~h~Cunt Dump ~g~~h~Starts")

system.wait(1000)
moist_notify("Cunt Dump Starts in: ", "~y~~h~2 ~r~Seconds")
system.wait(1000)

moist_notify("Cunt Dump Starts in: ", "~y~~h~1 ~r~Second")
system.wait(1000)
moist_notify("Cunt Dump Initiated", "\n Spectating now could crash you")
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
moist_notify("WorldDumped On That Cunt!\n GG <font size='12'> ~ex_r*~ ", "\nCarefull Spectating")
world_dumped = true
end

--TODO: Option Functions
--[[
21	INPUT_SPRINT	LEFT SHIFT			A
22	INPUT_JUMP		SPACEBAR			X
24	INPUT_ATTACK	LEFT MOUSE BUTTON	RT
25	INPUT_AIM		RIGHT MOUSE BUTTON	LT
]]

local entity_control

OptionsVar.aim_control = menu.add_feature("DetonateVehicle Aiming@(LShift or PS:X XBC:A)", "toggle", globalFeatures.moistopt, function(feat)
setting["aimDetonate_control"] = true
if feat.on then


  if player.is_player_free_aiming(player.player_id()) and controls.is_control_pressed(1,21) then


    entity_control = player.get_entity_player_is_aiming_at(player.player_id())

    if entity.is_entity_a_ped(entity_control) then
      if entity.is_entity_dead(entity_control) then
        moist_notify("Entity is a Dead Ped", "\nResurrecting Ped Now!")
        network.request_control_of_entity(entity_control)
        ped.resurrect_ped(entity_control)
        network.request_control_of_entity(entity_control)
        ped.set_ped_max_health(entity_control, 400)
        network.request_control_of_entity(entity_control)
        ped.set_ped_health(entity_control, 300)
        local pedhp1 = ped.get_ped_health(entity_control)
        local pedhp2 = ped.get_ped_max_health(entity_control)

        moist_notify("Current Health: "..pedhp1, "\nMax Health: " ..pedhp2)
        ped.clear_ped_tasks_immediately(entity_control)


      end
      if entity.get_entity_god_mode(entity_control) then
        moist_notify("Entity God Mode!!", "\nDisabling God Mode")
        network.request_control_of_entity(entity_control)
        entity.set_entity_god_mode(entity_control, false)
      end
      if entity.is_entity_attached(entity_control) then
        entity_control = entity.get_entity_attached_to(entity_control)
      end
      network.request_control_of_entity(entity_control)
    end
    if entity.get_entity_god_mode(entity_control) then
      moist_notify("Attached Entity is God Mode!!", "\nDisabling God Mode")
      network.request_control_of_entity(entity_control)
      entity.set_entity_god_mode(entity_control, false)
    end
    if entity.is_entity_a_vehicle(entity_control) then
      network.request_control_of_entity(entity_control)
      moist_notify("Vehicle God Mode!! Removing it from this CUNT!", "\nNow Giving it a Remote Bomb!!")
      vehicle.add_vehicle_phone_explosive_device(entity_control)
      system.wait(25)
    end

    network.request_control_of_entity(entity_control)
    if vehicle.has_vehicle_phone_explosive_device() then
      moist_notify("RIP CUNT! DETONATING BOMB!!", "\nFUCK YOU\nGG ~ex_r*~")
      vehicle.detonate_vehicle_phone_explosive_device()
    end
    return HANDLER_CONTINUE
  end
  return HANDLER_CONTINUE
end

setting["aimDetonate_control"] = false
return HANDLER_POP

end)
OptionsVar.aim_control.on = setting["aimDetonate_control"]

--TODO: Player Tracking
PlyTracker.track_all = menu.add_feature("Track all Players Speed", "toggle", globalFeatures.moistopt, function(feat)
setting["PlyTracker.track_all"] = true
if feat.on then

  for i = 0, 32 do
    local y = i + 1

    local ent
    local ent1 = player.get_player_ped(i)
    local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(i))

    if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
    local speed = entity.get_entity_speed(ent)
    local speedcalc = speed * 3.6 --kmph
    -- local speedcalc =  speed * 2.236936 --mph
    tracking.playerped_speed1[y] = math.ceil(speedcalc)

  end
  return HANDLER_CONTINUE
end
setting["PlyTracker.track_all"] = false
return HANDLER_POP
end)
PlyTracker.track_all.on = setting["PlyTracker.track_all"]

--TODO: OSD STUFF
OSD.modvehspeed_osd = menu.add_feature("High Player Speed OSD", "toggle", globalFeatures.moistopt, function(feat)
    setting["OSD.modvehspeed_osd"] = true
    if feat.on then
        local pos = v2()
        pos.x = 0.001
        pos.y = .0300

        local name
        for i = 0, 32 do
            if player.get_player_ped(i) ~= 0 then
                pos.x = 0.001

                if tracking.playerped_speed1[i + 1] > 350 then
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
    setting["OSD.modvehspeed_osd"] = false
    return HANDLER_POP

end)
OSD.modvehspeed_osd.on = setting["OSD.modvehspeed_osd"]


otr_plyr_osd = menu.add_feature("OTR Player OSD", "toggle", globalFeatures.moistopt, function(feat)
    if not feat.on then
        setting["OSD.otr_plyr_osd"] = false

        return HANDLER_POP
    end
    setting["OSD.otr_plyr_osd"] = true
    return HANDLER_POP
end)
otr_plyr_osd.on = setting["OSD.otr_plyr_osd"]

--TODO: OTR OSD

function otr_player(pid)
    if not otr_plyr_osd.on then return end
    while (script.get_global_i(2425869 + (1 + (pid * 443)) + 204) == 1) do
        local pos = v2()
        local txtoffset = pid / 100
        pos.x = 0.001
        pos.y = tonumber(0.03005 + txtoffset)

        ui.set_text_scale(0.230)
        ui.set_text_font(0)
        ui.set_text_color(255, 255, 255, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(true)
        ui.draw_text("OTR: ", pos)

        pos.x = 0.025
        ui.set_text_scale(0.230)
        ui.set_text_font(0)
        ui.set_text_color(255, 255, 0, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(true)
        local Plyname = tostring(player.get_player_name(pid))
        ui.draw_text(Plyname, pos)

        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end

OSD.modspec_osd = menu.add_feature("Spectate OSD", "toggle", globalFeatures.moistopt, function(feat)
    setting["OSD.modspec_osd"] = true
    if feat.on then
        local pos = v2()
        pos.x = 0.01
        pos.y = .03

        for i = 0, 32 do
            if
                player.is_player_spectating(i) and player.is_player_playing(i) and
                interior.get_interior_from_entity(player.get_player_ped(i)) == 0
            then
                local name = player.get_player_name(i)
                pos.y = pos.y + 0.08
                ui.set_text_scale(0.3)
                ui.set_text_font(0)
                ui.set_text_color(0, 255, 255, 255)
                ui.set_text_centre(false)
                ui.set_text_outline(true)
                ui.draw_text("Modded Spectate: " .. name, pos)
            end
        end
        return HANDLER_CONTINUE
    end
    setting["OSD.modspec_osd"] = false
    return HANDLER_POP

end)
OSD.modspec_osd.on = setting["OSD.modspec_osd"]
--TODO: PlayerBar
OSD.Player_bar = menu.add_feature("Player Bar OSD", "toggle", globalFeatures.moistopt, function(feat)
    setting["OSD.Player_bar"] = true
    if feat.on then

        ui.draw_rect(0.001, 0.001, 2.5, 0.065, 0, 0, 0, 180)
        local pos = v2()

        pos.x = 0.0001
        pos.y = 0.000001

        for i = 0, 32 do
            if player.get_player_ped(i) ~= 0 then
                local name = player.get_player_name(i)

                local playercolor = {{255, 255, 255}, {255, 0, 0}, {255, 0, 255}, {0, 255, 255}}
                ui.set_text_color(playercolor[1][1], playercolor[1][2], playercolor[1][3], 255)

                if player.is_player_god(i) and not player.is_player_vehicle_god(i) then
                    ui.set_text_color(playercolor[2][1], playercolor[2][2], playercolor[2][3], 255)
                end
                if player.is_player_god(i) and player.is_player_vehicle_god(i) then
                    ui.set_text_color(playercolor[3][1], playercolor[3][2], playercolor[3][3], 255)

                end
                if player.is_player_vehicle_god(i) and not player.is_player_god(i) then
                    ui.set_text_color(255, 170, 0, 255)
                end

                if pos.x > 0.95 then
                    pos.y = .015
                    pos.x = 0.0001
                else
                end
                ui.set_text_scale(0.18)
                ui.set_text_font(0)

                ui.set_text_centre(false)
                ui.set_text_outline(true)

                ui.draw_text(" " .. name .. " ", pos)

                pos.x = pos.x + 0.065
            end
        end

        return HANDLER_CONTINUE
    end
    setting["OSD.Player_bar"] = false
    return HANDLER_POP
end)
OSD.Player_bar.on = setting["OSD.Player_bar"]

OSD.date_time_OSD = menu.add_feature("Date & Time OSD", "toggle", globalFeatures.moistopt, function(feat)
    setting["osd_date_time"] = true
    while feat.on do

        local pos = v2()

        local d = os.date()

        local dtime = string.match(d, "%d%d:%d%d:%d%d")

        local dt = os.date("%d/%m/%y%y")

        pos.x = .975
        pos.y =  0.000001

        local d = os.date()

        local dtime = string.match(d, "%d%d:%d%d:%d%d")

        local dt = os.date("%d/%m/%y%y")

        local osd_Cur_Time = (string.format(dtime))
        ui.set_text_scale(0.32)
        ui.set_text_font(0)
        ui.set_text_color(0, 0, 0, 255)
        ui.set_text_centre(true)
        ui.set_text_outline(1)
        ui.draw_text(osd_Cur_Time, pos)
        pos.x = .977
        pos.y =  0.000002

        local d = os.date()

        local dtime = string.match(d, "%d%d:%d%d:%d%d")

        local dt = os.date("%d/%m/%y%y")

        local osd_Cur_Time = (string.format(dtime))
        ui.set_text_scale(0.32)
        ui.set_text_font(0)
        ui.set_text_color(255, 255, 255, 255)
        ui.set_text_centre(true)
        ui.set_text_outline(1)
        ui.draw_text(osd_Cur_Time, pos)

        return HANDLER_CONTINUE
    end
    setting["osd_date_time"] = false
    return HANDLER_POP

end)
OSD.date_time_OSD.on = setting["osd_date_time"]

OSD.osd_My_speed1 = menu.add_feature("Show My Speed in Kmph", "toggle", globalFeatures.moistopt, function(feat)
    setting["osd_My_speed1"] = true
    while feat.on do

        local pos = v2()
        pos.x = .970
        pos.y =  0.0600001

        local ent
        local ent1 = player.get_player_ped(player.player_id())
        local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))

        if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
        local speed = entity.get_entity_speed(ent)
        local speedcalc = speed * 3.6 --kmph
        local speedcalcm =  speed * 2.236936 --mph
        myspeed1 = math.ceil(speedcalc)
        myspeed2 = math.ceil(speedcalcm)

        ui.set_text_scale(0.22)
        ui.set_text_font(0)
        ui.set_text_color(0, 0, 0, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(1)
        ui.draw_text(myspeed1 .." kmph" , pos)
        pos.x = .971
        pos.y =  0.060002

        ui.set_text_scale(0.22)
        ui.set_text_font(0)
        ui.set_text_color(255, 255, 255, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(1)
        ui.draw_text(myspeed1 .." kmph", pos)

        return HANDLER_CONTINUE
    end
    setting["osd_My_speed1"] = false
    return HANDLER_POP

end)
OSD.osd_My_speed1.on = setting["osd_My_speed1"]

OSD.osd_My_speed2 = menu.add_feature("Show My Speed in Mph", "toggle", globalFeatures.moistopt, function(feat)
    setting["osd_My_speed2"] = true
    while feat.on do

        local pos = v2()
        pos.x = .970
        pos.y =  0.0600001

        local ent
        local ent1 = player.get_player_ped(player.player_id())
        local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))

        if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
        local speed = entity.get_entity_speed(ent)
        local speedcalc = speed * 3.6 --kmph
        local speedcalcm =  speed * 2.236936 --mph
        myspeed1 = math.ceil(speedcalc)
        myspeed2 = math.ceil(speedcalcm)

        ui.set_text_scale(0.22)
        ui.set_text_font(0)
        ui.set_text_color(0, 0, 0, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(1)
        ui.draw_text(myspeed2 .." mph", pos)
        pos.x = .971
        pos.y =  0.0600002

        ui.set_text_scale(0.22)
        ui.set_text_font(0)
        ui.set_text_color(255, 255, 255, 255)
        ui.set_text_centre(false)
        ui.set_text_outline(1)
        ui.draw_text(myspeed2 .." mph", pos)

        return HANDLER_CONTINUE
    end
    setting["osd_My_speed2"] = false
    return HANDLER_POP

end)
OSD.osd_My_speed2.on = setting["osd_My_speed2"]

--TODO: Player Ped Weapons
local function give_weapon()
    for i = 1, #ped_wep do
        menu.add_feature("Weapon: " ..ped_wep[i][1], "action", globalFeatures.self_wep, function(feat)
            local pped = player.get_player_ped(player.player_id())
            weapon.give_delayed_weapon_to_ped(pped, ped_wep[i][2], 0, 1)
        end)
    end
end
give_weapon()

--TODO: RPG save-setting
local wephash
local RPG_HOTFIRE = menu.add_feature("Rapid RPG Switch", "toggle", globalFeatures.self_options, function(feat)
    setting["RPG_HOTFIRE"] = true
    if feat.on then
        weapon_hash = {1752584910,2982836145}
        pped = player.get_player_ped(player.player_id())

        if ped.is_ped_shooting(pped) then
        if ped.get_current_ped_weapon(pped) == 0xB1CA77B1 or 0xA2719263 then
            wephash = weapon_hash[2]
            weapon.give_delayed_weapon_to_ped(pped, wephash, 0, 1)
         --   system.wait(0)
            weapon.give_delayed_weapon_to_ped(pped, 0xA2719263, 0, 1)
          --  system.wait(0)

            wephash = weapon_hash[1]
            weapon.give_delayed_weapon_to_ped(pped, wephash, 0, 1)
        end
        return HANDLER_CONTINUE
    end
    setting["RPG_HOTFIRE"] = false
    return HANDLER_POP
    end
end)
RPG_HOTFIRE.on = setting["RPG_HOTFIRE"]

--TODO: Markers
local markID = {}
markID.z = {}
markID.s = {}
markID.BOB = {}
markID.ROT = {}
highlight_set = {}
BobUPnDown = true
ROTMRK = true

local size_marker = 1.0
local marker_type = 0
local mk_id
local offsetz_marker = 1.5

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

local changRGB = menu.add_feature("fading red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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

local chang_RGBA = menu.add_feature("flash red white Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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

local changRGBA = menu.add_feature("multi fading colors Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)
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
        system.wait(5)
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
        system.wait(5)
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

        system.wait(5)
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
        system.wait(5)
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

local changeRGB = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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

local change_RGBA = menu.add_feature("Marker 1 2 5 RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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

local changeRGBA = menu.add_feature("Marker3 RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)
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
        system.wait(5)
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
        system.wait(5)
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

        system.wait(5)
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
        system.wait(5)
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

local rgb_rand = menu.add_feature("rand rgb 3 on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
    if feat.on then

        RGBA_G = math.random(0, 255)

        system.wait(feat.value_i)

        RGBA_R = math.random(0, 255)

        system.wait(feat.value_i)


        RGBA_B = math.random(0, 255)

        system.wait(feat.value_i)

        return HANDLER_CONTINUE
    end
end)
rgb_rand.on = false
rgb_rand.max_i = 500
rgb_rand.min_i = 1
rgb_rand.value_i = 5

local rgb_rand1 = menu.add_feature("rand rgb 4 on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
    if feat.on then

        RGB_A_A = math.random(0, 255)

        system.wait(feat.value_i / 2)

        RGB_A_G = math.random(0, 255)

        system.wait(feat.value_i)

        RGB_A_R = math.random(0, 255)

        system.wait(feat.value_i)


        RGB_A_B = math.random(0, 255)

        system.wait(feat.value_i)

        return HANDLER_CONTINUE
    end
end)
rgb_rand1.on = false
rgb_rand1.max_i = 500
rgb_rand1.min_i = 1
rgb_rand1.value_i = 15


local marker1_rgbd = menu.add_feature("rgb 4 on", "toggle", globalFeatures.moistMkropt, function(feat)
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
        system.wait(5)
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
        system.wait(5)
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
        system.wait(5)
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
        system.wait(5)
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

--TODO: Online Player Spawn Features
--TODO: Player Features

function load_spawn_options()

    for i = 1, #escort_ped do
        playerFeat1[i] = menu.add_player_feature("Ped: " .. escort_ped[i][1], "parent", playerfeatVars.b, function()
            model = escort_ped[i][2]
        end).id

    end

    for i = 1, #playerFeat1 do

        playerFeatParent[#playerFeatParent+1] = menu.add_player_feature("Ped + Weapon", "parent", playerFeat1[i]).id
    end

    for i = 1, #playerFeat1 do
        playerFeatParent2[#playerFeatParent2+1] = menu.add_player_feature("Ped + Vehicle", "parent", playerFeat1[i]).id
    end

    for i = 1, #playerFeatParent do
        for y = 1, #ped_wep do

            playerFeat2[#playerFeat2+1] = menu.add_player_feature("Wep: " .. ped_wep[y][1], "parent", playerFeatParent[i], function()
                wephash = ped_wep[y][2]

            end).id
        end
    end


    for i = 1, #playerFeat2 do
        menu.add_player_feature("Send Attacker via Parachute", "action", playerFeat2[i], function(feat, pid)

                local pped = player.get_player_ped(pid)

                spawn_ped_v2(pid, model, true)

                system.wait(100)
                local i = #escort
                local pos = player.get_player_coords(pid)
                ai.task_parachute_to_target(escort[i], pos)

                system.wait(12000)
                weapon.give_delayed_weapon_to_ped(escort[i], wephash, 0, 1)

                ai.task_combat_ped(escort[i], pped, 0, 16)
        end).threaded = false
    end


    for i = 1, #playerFeat2 do
        menu.add_player_feature("Spawn Attacker & Task", "action", playerFeat2[i], function(feat, pid)

                local pped = player.get_player_ped(pid)

                spawn_ped(pid, model, -15, true, nil)

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
                ped.set_ped_can_switch_weapons(escort[i], true)
                ai.task_combat_ped(escort[i], pped, 0, 16)


        end)
    end

    for i = 1, #playerFeat2 do
        menu.add_player_feature("Spawn Support Ped", "action", playerFeat2[i], function(feat, pid)

                local pped = player.get_player_ped(pid)

                spawn_ped(pid, model, 5, false, nil)

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
                ped.set_ped_can_switch_weapons(escort[i], true)

        end)
    end

    for i = 1, #playerFeatParent2 do
        for y = 1, #veh_list do

            playerFeat3[#playerFeat3+1]  = menu.add_player_feature("Veh: " .. veh_list[y][1], "parent", playerFeatParent2[i], function()
                vehhash = veh_list[y][2]
                if veh_list[y][3] == nil then
                    mod = 10
                    modvalue = -1
                else
                    mod = veh_list[y][3]
                    modvalue = veh_list[y][4]

                end

            end).id
        end
    end

    for i = 1, #playerFeat3 do
        menu.add_player_feature("Spawn as Escort & Task", "action", playerFeat3[i], function(feat, pid)
            spawn_ped(pid, model, -10, false, nil)
            local groupIDs = {}
            local i = #groupIDs + 1
            groupIDs[i] = ped.create_group()
            local y = #groupIDs + 1
            groupIDs[y] = ped.create_group()
            ped.set_relationship_between_groups(0, groupIDs[i], groupIDs[y])
            ped.set_relationship_between_groups(0, groupIDs[y], groupIDs[i])
            system.wait(100)
            spawn_veh(pid, vehhash, -10, mod, modvalue)
            system.wait(100)
            local p = #escort
            local y = #escortveh
            ped.set_ped_as_group_member(escort[p], groupIDs[i])
            ped.set_ped_never_leaves_group(escort[p], true)

            ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
            local pped = player.get_player_ped(pid)
            ai.task_vehicle_follow(escort[p], escortveh[y], pped, 250.00, 262144, 25)

            if vehhash == 0x2189D250 then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 0)
            end
            if vehhash == 0xF92AEC4D then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 3)
            end
            if vehhash == 0xA09E15FD then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
            end
            if vehhash == 0x5BFA5C4B then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)

                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
            end
            if vehhash == 0x9114EADA then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
            end
            if vehhash == 0x8D4B7A8A then
                spawn_ped(pid, model, 10, false, nil)
                local x = #escort
                ped.set_ped_as_group_member(escort[x], groupIDs[i])
                ped.set_ped_never_leaves_group(escort[x], true)
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
            end

        end)
    end

    for i = 1, #playerFeat3 do
        menu.add_player_feature("Spawn as Attacker & Task", "action", playerFeat3[i], function(feat, pid)
            local pped = player.get_player_ped(pid)
            spawn_ped(pid, model, 10, true, nil)
            system.wait(100)
            spawn_veh(pid, vehhash, -10, mod, modvalue)
            local p = #escort
            local y = #escortveh

            ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
            ai.task_combat_ped(escort[p], pped, 0, 16)

            if vehhash == 0x2189D250 then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 0)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end
            if vehhash == 0xF92AEC4D then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 3)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end
            if vehhash == 0xA09E15FD then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
                ai.task_combat_ped(escort[x], pped, 0, 16)
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end
            if vehhash == 0x5BFA5C4B then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
                ai.task_combat_ped(escort[x], pped, 0, 16)
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end
            if vehhash == 0x9114EADA then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end
            if vehhash == 0x8D4B7A8A then
                spawn_ped(pid, model, 10, true, nil)
                local x = #escort
                ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
                ai.task_combat_ped(escort[x], pped, 0, 16)
            end

        end)
    end

end

menu.add_feature("Any Friends Online?", "action", globalFeatures.lobby, function(feat)
    for i=0,network.get_friend_count()-1 do

        local friendName = network.get_friend_index_name(i)

        local friendScid = network.get_friend_scid(friendName)

        local friendOnline = network.is_friend_index_online(i)

        local friendMplay = network.is_friend_in_multiplayer(friendName)
        print(string.format("Friend index %s %s (%s) is %s", i, friendName, friendScid, friendOnline and "online" or "offline"))
        if friendOnline then
            if friendMplay then
                ui.notify_above_map("~h~~u~ Online ~u~Friend : " .. friendName .. "~h~~u~\nis Playing Online", "~u~Network ~u~Presence", 172)
            else
                ui.notify_above_map("~h~~u~ Online ~u~Friend : " .. friendName , "~u~Network Presence", 47)
            end
            system.wait(100)
        end
    end
end)

--TODO: Orbitor Functions
local EntityHash = {}
EntityHash.pid = {}
local EntityHash2 = {}
EntityHash2.pid = {}
local MainEntityHash
local Thread2Id = {}
local Thread1Id = {}
local Degree = 0
local orbit_pid

function Orbit2(Distance)
    local Hash = 2906806882


    while not streaming.has_model_loaded(Hash) do
        streaming.request_model(Hash)
        system.wait(1)
    end

    local RootPos = player.get_player_coords(orbit_pid)
    RootPos.z = RootPos.z + 3.500
    EntityHash.pid[#EntityHash.pid + 1] = object.create_object(Hash, RootPos + Distance, true, false)

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

        --entity.set_entity_coords_no_offset(EntityHash.pid[#EntityHash.pid], v3(x + 1.0, y + 1.0, RootPos.z + 0.5))
        entity.set_entity_coords_no_offset(EntityHash.pid[#EntityHash.pid], v3(x, y, RootPos.z))
        entity.set_entity_rotation(EntityHash.pid[#EntityHash.pid], v3(x, y, zz))



        system.wait(1)
    end
end

function Orbit1(Distance)
    local Hash = 2906806882


    while not streaming.has_model_loaded(Hash) do
        streaming.request_model(Hash)
        system.wait(1)
    end

    local RootPos = player.get_player_coords(orbit_pid)
    RootPos.z = RootPos.z + 3.500
    EntityHash2.pid[#EntityHash2.pid + 1] = object.create_object(Hash, RootPos + Distance, true, false)

    entity.set_entity_gravity(EntityHash2.pid[#EntityHash2.pid], 0)
    entity.freeze_entity(EntityHash2.pid[#EntityHash2.pid], false)
    while true do
        Degree = Degree + 3.75
        if Degree > 360 then Degree = -360 end
        local rad = math.rad(Degree)
        RootPos = player.get_player_coords(orbit_pid)
        local x = Distance*math.cos(rad) + RootPos.x
        local y = Distance*math.sin(rad) + RootPos.y
        local zz = Distance*math.sin(rad) + RootPos.z

        entity.set_entity_coords_no_offset(EntityHash2.pid[#EntityHash2.pid], v3(x + 1.0, y + 1.0, RootPos.z + 0.5))
        --entity.set_entity_coords_no_offset(EntityHash.pid[#EntityHash.pid], v3(x, y, RootPos.z))
        entity.set_entity_rotation(EntityHash2.pid[#EntityHash2.pid], v3(x, y, zz))



        system.wait(1)
    end
end

function spawn_attach(hash, bone, pos, rot, col, pid)

    local ent

    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end

    local i = #spawned_cunts + 1
    spawned_cunts[i] = object.create_object(hash, pos, true, false)

    local pped = player.get_player_ped(pid)
    entity.attach_entity_to_entity(spawned_cunts[i], pped, bone, pos, rot, true, col, false, 0, true)
end

--TODO: Player list

local PlayerPed
local playerlist = function()
for pid = 0, 31 do
local featureVars = {}

featureVars.f = menu.add_feature("Player " .. pid, "parent", playersFeature.id)
featureVars.k = menu.add_feature("Remove Player Options", "parent", featureVars.f.id)
featureVars.v = menu.add_feature("Vehicle Options", "parent", featureVars.f.id)
featureVars.t = menu.add_feature("Teleport Options", "parent", featureVars.f.id)

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
featureVars.tr = menu.add_feature("Troll Options", "parent", featureVars.f.id)
featureVars.str = menu.add_feature("Sound Functions", "parent", featureVars.tr.id)
featureVars.g = menu.add_feature("Griefing Options", "parent", featureVars.f.id)
featureVars.gr = menu.add_feature("Lester Ramjet", "parent", featureVars.g.id)
featureVars.n = menu.add_feature("Info Options", "parent", featureVars.f.id)

local features = {}
--TODO: Vehicle Options
features["godvehon"] = {feat = menu.add_feature("ToggleON Player Vehicle God Mode", "toggle", featureVars.v.id, function(feat)
    if feat.on then

        local plyped = player.get_player_ped(pid)

        local plyveh = player.get_player_vehicle(pid)

        network.request_control_of_entity(plyveh)
        entity.set_entity_god_mode(plyveh, true)
        return HANDLER_CONTINUE
    end

end),  type = "toggle", callback = function()
end}
features["godvehon"].feat.on = false

features["godvehoff"] = {feat = menu.add_feature("ToggleOFF Player Vehicle God Mode", "toggle", featureVars.v.id, function(feat)
    if feat.on then

        local plyped = player.get_player_ped(pid)

        local plyveh = player.get_player_vehicle(pid)
        network.request_control_of_entity(ped.get_vehicle_ped_is_using(plyped))
        network.request_control_of_entity(plyveh)
        entity.set_entity_god_mode(plyveh, false)
    end
    return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["godvehoff"].feat.on = false

features["set_Boost"] = {feat = menu.add_feature("Set Boost & Forward Speed", "action", featureVars.v.id, function(feat)
    local plyveh = player.get_player_vehicle(pid)
    if plyveh ~= nil then
        network.request_control_of_entity(plyveh)
        vehicle.set_vehicle_rocket_boost_active(plyveh, true)
        vehicle.set_vehicle_forward_speed(plyveh, 200000.00)

    end

    network.request_control_of_entity(plyveh)
    vehicle.set_vehicle_rocket_boost_active(plyveh, true)
    vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end), type = "action"}

features["vehicleexplode1"] = {feat = menu.add_feature("Vehicle Explode OnImpact", "toggle", featureVars.v.id, function(feat)
    if feat.on then

        local plyped = player.get_player_ped(pid)

        local plyveh = player.get_player_vehicle(pid)
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

features["vehspdslow"] = {feat = menu.add_feature("Set Max Speed 5", "action", featureVars.v.id, function()

        playervehspd(pid, 5.0)

end), type = "action"}

features["vehspdcust"] = {feat = menu.add_feature("Input Custom Max Speed", "action", featureVars.v.id, function()
    local r,s = input.get("Enter a Speed value:", "0.0001", 64, 5)
    if r == 1 then
        return HANDLER_CONTINUE
    end
    if r == 2 then
        return HANDLER_POP
    end
    playervehspd(pid, s)
end), type = "action"}

features["vehspdfast"] = {feat = menu.add_feature("Reset Max Speed", "action", featureVars.v.id, function()
    playervehspd(pid, 10000.0)
end), type = "action"}

features["vehaddexpl"] = {feat = menu.add_feature("Add Explosive Device", "action", featureVars.v.id, function(feat)

        local plyveh = player.get_player_vehicle(pid)
        if plyveh == 0 or nil then return end
        network.request_control_of_entity(plyveh)
        vehicle.add_vehicle_phone_explosive_device(plyveh)

end), type = "action"}

features["vehdetonate"] = {feat = menu.add_feature("Detonate Explosive Device (named)", "action", featureVars.v.id, function()

        local plyveh = player.get_player_vehicle(pid)
        network.request_control_of_entity(plyveh)
        print(vehicle.has_vehicle_phone_explosive_device())
        if vehicle.has_vehicle_phone_explosive_device() then
            vehicle.detonate_vehicle_phone_explosive_device()

        end
end), type = "action"}

features["timedexp"] = {feat = menu.add_feature("Set Vehicle Timed Explosion", "action", featureVars.v.id, function(feat)

        local pos = v3()
        pos = player.get_player_coords(pid)

        local plyveh

        local pedd = player.get_player_ped(pid)
        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
            network.request_control_of_entity(plyveh)
            vehicle.add_vehicle_phone_explosive_device(plyveh)
            vehicle.set_vehicle_timed_explosion(plyveh, pedd, true)
            system.wait(200)
            audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 10000, false)
        end
end), type = "action"}
features["timedexp"].feat.threaded = false

features["boostlag"] = {feat = menu.add_feature("Lag Vehicle Boost Refill", "action", featureVars.v.id, function(feat)

        local plyveh = player.get_player_vehicle(pid)
        network.request_control_of_entity(plyveh)
        vehicle.set_vehicle_rocket_boost_active(plyveh, true)
        vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 999999.999999999999)
end), type = "action"}
features["boostlag"].feat.threaded = false
features["boostrefill"] = {feat = menu.add_feature("Fast Vehicle Boost Refill", "action", featureVars.v.id, function(feat)

        local plyveh = player.get_player_vehicle(pid)
        network.request_control_of_entity(plyveh)
        vehicle.set_vehicle_rocket_boost_refill_time(plyveh, 0.0000010)
end), type = "action"}
features["boostrefill"].feat.threaded = false

features["nomissmk2"] = {feat = menu.add_feature("Set MK2 Machineguns Only", "action", featureVars.v.id, function(feat)

        local plyped = player.get_player_ped(pid)

        local plyveh = player.get_player_vehicle(pid)
        if plyveh ~= nil then
            network.request_control_of_entity(plyveh)
        end
        network.request_control_of_entity(plyveh)
        vehicle.set_vehicle_mod_kit_type(plyveh, 0)
        vehicle.get_vehicle_mod(plyveh, 10)
        vehicle.set_vehicle_mod(plyveh, 10, -1, false)
end), type = "action"}
features["nomissmk2"].feat.threaded = false
features["rapidmk2"] = {feat = menu.add_feature("MK2 Rapid fire", "toggle", featureVars.v.id, function(feat)
    if feat.on then

        local plyped = player.get_player_ped(pid)

        local plyveh = player.get_player_vehicle(pid)
        if plyveh ~= nil then
            network.request_control_of_entity(plyveh)
        end
        vehicle.set_vehicle_fixed(plyveh)
        vehicle.set_vehicle_deformation_fixed(plyveh)
    end
    return HANDLER_CONTINUE
end),  type = "toggle", callback = function()
end}
features["rapidmk2"].feat.threaded = false

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


        actM = feat.value_i + pid + 2
        return HANDLER_CONTINUE
    end
end), type = "toggle"}
features["Mark_Control"].feat.on = false
features["Mark_Control"].feat.max_i = 6
features["Mark_Control"].feat.min_i = 0

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
    if features["cprecision"].feat.on then

        size_marker = tonumber(feat.value_i / 100)
        markID.s[actM] = size_marker
    else
        size_marker = tonumber(feat.value_i / 2)
        markID.s[actM] = size_marker
    end
end), type = "action_value_i"}
features["MarkSize"].feat.max_i = 30000
features["MarkSize"].feat.min_i = 1
features["MarkSize"].feat.value_i = 2

features["MarkZoff"] = {feat = menu.add_feature("Marker Z Offset Multiplier", "action_value_i", featureVars.ch.id, function(feat)
    if features["cprecision"].feat.on then
        offsetz_marker = tonumber(feat.value_i / 100)
        markID.z[actM] = offsetz_marker
    else
        offsetz_marker = tonumber(feat.value_i / 2)
        markID.z[actM] = offsetz_marker
    end
end), type = "action_value_i"}
features["MarkZoff"].feat.max_i = 30000
features["MarkZoff"].feat.min_i = -30000
features["MarkZoff"].feat.value_i = 1

features["BOB_Marker"] = {feat = menu.add_feature("Bob Marker Up & Down", "toggle", featureVars.ch.id, function(feat)
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

        ROTMRK = true
        local i = actM
        markID.ROT[i] = ROTMRK
        if feat.on then
            return HANDLER_CONTINUE
        end ROTMRK = false
        markID.ROT[i] = ROTMRK
        return HANDLER_POP
end)}


features["Blip"] = {feat =  menu.add_feature("Add Radar Blip", "action", featureVars.h.id, function(feat)

        local pped = player.get_player_ped(pid)
        ui.add_blip_for_entity(pped)
end), type = "action"}

features["marker_active1"] = {feat =  menu.add_feature("Marker 1 Type:", "value_i", featureVars.h.id, function(feat)

        if feat.on then

            local offset = v3()
            offset.z = markID.z[pid+2]
            local size = markID.s[pid+2]
            local pos = v3()
            local posbool
            posbool, pos = ped.get_ped_bone_coords(player.get_player_ped(pid), 31086, offset)


            graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

            return HANDLER_CONTINUE
        end
end), type = "value_i"}
features["marker_active1"].feat.max_i = 44
features["marker_active1"].feat.min_i = 0
features["marker_active1"].feat.value_i = 1
features["marker_active1"].feat.on = false


features["marker_active2"] = {feat =  menu.add_feature("Marker 2 Type:", "value_i", featureVars.h.id, function(feat)

        if feat.on then

            local offset = v3()
            offset.z = markID.z[pid+3]
            local size = markID.s[pid+3]
            local pos = v3()
            local posbool
            posbool, pos = ped.get_ped_bone_coords(player.get_player_ped(pid), 31086, offset)

            graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

            return HANDLER_CONTINUE
        end
end), type = "value_i"}
features["marker_active2"].feat.max_i = 44
features["marker_active2"].feat.min_i = 0
features["marker_active2"].feat.value_i = 43
features["marker_active2"].feat.on = false


features["marker_active3"] = {feat =  menu.add_feature("Marker 3 Type:", "value_i", featureVars.h.id, function(feat)

        if feat.on then

            local offset = v3()
            offset.z = markID.z[pid+4]
            local size = markID.s[pid+4]
            local pos = v3()
            local posbool
            posbool, pos = ped.get_ped_bone_coords(player.get_player_ped(pid), 31086, offset)


            graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), RGBA_R, RGBA_G, RGBA_B, RGBA_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

            return HANDLER_CONTINUE
        end
end), type = "value_i"}
features["marker_active3"].feat.max_i = 44
features["marker_active3"].feat.min_i = 0
features["marker_active3"].feat.value_i = 0
features["marker_active3"].feat.on = false


features["marker_active4"] = {feat =  menu.add_feature("Marker 4 Type:", "value_i", featureVars.h.id, function(feat)

        if feat.on then

            local offset = v3()
            offset.z = markID.z[pid+5]
            local size = markID.s[pid+5]
            local pos = v3()
            local posbool
            posbool, pos = ped.get_ped_bone_coords(player.get_player_ped(pid), 31086, offset)

            graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), RGB_A_R, RGB_A_G, RGB_A_B, RGB_A_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

            return HANDLER_CONTINUE
        end
end), type = "value_i"}
features["marker_active4"].feat.max_i = 44
features["marker_active4"].feat.min_i = 0
features["marker_active4"].feat.value_i = 29
features["marker_active4"].feat.on = false


features["marker_active5"] = {feat =  menu.add_feature("Marker 5 (Drawn on Entity) Type:", "value_i", featureVars.h.id, function(feat)

        if feat.on then

            local offset = v3()
            offset.z = markID.z[pid+6]
            local size = markID.s[pid+6]
            local pos = v3()
            local posbool
            posbool, pos = ped.get_ped_bone_coords(player.get_player_ped(pid), 31086, offset)


            -- graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

            graphics.draw_marker(feat.value_i, pos + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, true)

            return HANDLER_CONTINUE
        end
end), type = "value_i"}
features["marker_active5"].feat.max_i = 44
features["marker_active5"].feat.min_i = 0
features["marker_active5"].feat.value_i = 28
features["marker_active5"].feat.on = false

--TODO: CEO Money

features["ceo_money1"] = {feat = menu.add_feature("CEO 10k money loop", "toggle", featureVars.f.id, function(feat)
    while feat.on do
        print("Money Trigger loop")
        print(os.date())

        ScriptTR(-2029779863, pid, {player.player_id(), 10000, -1292453789, 0, script.get_global_i(1630317 + (1 + (pid * 595)) + 506), script.get_global_i(1652336 + 9), script.get_global_i(1652336 + 10)})
        system.wait(31000)
        print(os.date())
        return HANDLER_CONTINUE
    end
    print("loop end")

    return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_money1"].feat.on = false

features["ceo_otr"] = {feat = menu.add_feature("OTR", "action", featureVars.f.id, function(feat)
  
        ScriptTR(575518757, pid, {pid, utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1630317 + (1 + (595 * pid)) + 506)})
        

    return HANDLER_POP
end), type = "toggle", callback = function()
end}
features["ceo_otr"].feat.on = false


features["give_nocops"] = {feat = menu.add_feature("Give Long Cop Bribe", "action", featureVars.f.id, function(feat)


        ScriptTR(392501634, pid, {pid, utils.time() - 60, utils.time(), script.get_global_i(2540384 + 4624), 1, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})


        return HANDLER_POP
end), type = "action", callback = function()
end}

features["TeleportPlayernext2me"] = {feat = menu.add_feature("Teleport Next 2 Me(old Version)", "toggle", featureVars.t.id, function(feat)
    if feat.on then
        local plyveh

        local pedd = player.get_player_ped(pid)

        local pos = v3()
        pos = entity.get_entity_coords(player.get_player_ped(player.player_id()))
        pos.x = pos.x + 3
        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
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
        local plyveh

        local pedd = player.get_player_ped(pid)
        get_offset2me(player.player_id(), 3)
        local pos = SelfoffsetPos

        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
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
        local plyveh
        local pos = v3()
        pos.x = presets[1][2]
        pos.y = presets[1][3]
        pos.z = presets[1][4]

        local pedd = player.get_player_ped(pid)
        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
            network.request_control_of_entity(plyveh)
            entity.set_entity_coords_no_offset(plyveh, pos)
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["TeleportPlayerBeyondLimits"].feat.on = false

features["Teleport_God-mode_Death"] = {feat = menu.add_feature("Teleport to Death (Ocean Out of World Limits)", "toggle", featureVars.t.id, function(feat)
    if feat.on then
        local plyveh
        local pos = v3()
        pos.x = presets[3][2]
        pos.y = presets[3][3]
        pos.z = presets[3][4]

        local pedd = player.get_player_ped(pid)
        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
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
        local plyveh
        local pos = v3()

        pos.x = presets[2][2]
        pos.y = presets[2][3]
        pos.z = presets[2][4]

        local pedd = player.get_player_ped(pid)
        if ped.is_ped_in_any_vehicle(pedd) then
            plyveh = ped.get_vehicle_ped_is_using(pedd)
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

        local plyped = player.get_player_ped(pid)
        audio.play_sound_from_entity(-1, "Air_Drop_Package", plyped, "DLC_SM_Generic_Mission_Sounds", true)
end), type = "action"}
features["sound_troll1"].feat.threaded = false

features["sound_troll2"] = {feat = menu.add_feature("Annoy With Countdown sound", "action", featureVars.str.id, function(feat)

        local pos = v3()
        pos = entity.get_entity_coords(player.get_player_ped(pid))

        local plyped = player.get_player_ped(pid)
        audio.play_sound_from_coord(-1, "Explosion_Countdown", pos, "GTAO_FM_Events_Soundset", true, 1000, false)
        audio.play_sound_from_entity(-1, "Explosion_Countdown", plyped, "GTAO_FM_Events_Soundset", true)

end), type = "action"}
features["sound_troll2"].feat.threaded = false

features["sound_troll3"] = {feat = menu.add_feature("Annoy With Yacht Horn Sound", "action", featureVars.str.id, function(feat)

        local pos = v3()
        pos = entity.get_entity_coords(player.get_player_ped(pid))

        local plyped = player.get_player_ped(pid)

        audio.play_sound_from_entity(-1,  "HORN", plyped, "DLC_Apt_Yacht_Ambient_Soundset", true)

        audio.play_sound_from_coord(-1, "HORN", pos, "DLC_Apt_Yacht_Ambient_Soundset", true, 1000000, false)

end), type = "action"}
features["sound_troll3"].feat.threaded = false

features["sound_troll4"] = {feat = menu.add_feature("Annoy With Chaff Sound", "action", featureVars.str.id, function(feat)

        local pos = v3()
        pos = entity.get_entity_coords(player.get_player_ped(pid))

        local plyped = player.get_player_ped(pid)

        audio.play_sound_from_entity(-1, "chaff_released", plyped, "DLC_SM_Countermeasures_Sounds", true)

end), type = "action"}
features["sound_troll4"].feat.threaded = false

features["sound_troll5"] = {feat = menu.add_feature("Annoy With Flare sound", "action", featureVars.str.id, function(feat)

        local pos = v3()
        pos = entity.get_entity_coords(player.get_player_ped(pid))

        local plyped = player.get_player_ped(pid)

        audio.play_sound_from_entity(-1, "flares_released", plyped, "DLC_SM_Countermeasures_Sounds", true)


end), type = "action"}
features["sound_troll5"].feat.threaded = false



features["sound_troll6"] = {feat = menu.add_feature("Annoy With Remote KeyFob Sound", "action", featureVars.str.id, function(feat)


        local plyped = player.get_player_ped(pid)


        audio.play_sound_from_entity(-1, "Remote_Control_Fob", plyped, "PI_Menu_Sounds", true)


end), type = "action"}
features["sound_troll6"].feat.threaded = false


features["sound_troll7"] = {feat = menu.add_feature("Annoy With Remote Close Sound", "action", featureVars.str.id, function(feat)


        local plyped = player.get_player_ped(pid)


        audio.play_sound_from_entity(-1, "Remote_Control_Close", plyped, "PI_Menu_Sounds", true)

end), type = "action"}
features["sound_troll7"].feat.threaded = false


features["sound_troll8"] = {feat = menu.add_feature("Annoy With Remote Open Sound", "action", featureVars.str.id, function(feat)


        local plyped = player.get_player_ped(pid)


        audio.play_sound_from_entity(-1, "Remote_Control_Open", plyped, "PI_Menu_Sounds", true)

end), type = "action"}
features["sound_troll8"].feat.threaded = false

features["sound_troll9"] = {feat = menu.add_feature("Annoy With Light Toggle Sound", "action", featureVars.str.id, function(feat)


        local plyped = player.get_player_ped(pid)


        audio.play_sound_from_entity(-1, "Toggle_Lights", plyped, "PI_Menu_Sounds", true)

end), type = "action"}
features["sound_troll9"].feat.threaded = false


features["sound_troll10"] = {feat = menu.add_feature("Annoy With Water Sounds", "action", featureVars.str.id, function(feat)


        local plyped = player.get_player_ped(pid)

        audio.play_sound_from_entity(-1, "FallingInWaterSmall", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
        system.wait(120)
        audio.play_sound_from_entity(-1, "FallingInWaterMedium", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
        system.wait(120)
        audio.play_sound_from_entity(-1, "FallingInWaterHeavy", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
        system.wait(120)
        audio.play_sound_from_entity(-1, "DiveInWater", plyped, "GTAO_Hot_Tub_PED_INSIDE_WATER", true)
        system.wait(120)


end), type = "action"}
features["sound_troll10"].feat.threaded = false

local spawned_cunt1 = {}
local spawned_cunt2 = {}
local spawned_cunt3 = {}
local spawned_cunt = {}

features["LightPOS1way"] = {feat = menu.add_feature("Update Lights POS(move with Player)", "toggle", featureVars.tr.id, function(feat)
    if feat.on then
        local i = #spawned_cunt
        local y = (#spawned_cunt - 1)
        local t = #spawned_cunt3
        if not entity.is_an_entity(spawned_cunt[i]) or entity.is_an_entity(spawned_cunt[y]) then
            features["LightPOSway"].feat.on = false
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
end),  type = "toggle", callback = function()
end}
features["LightPOS1way"].feat.on = false
features["LightPOS1way"].feat.hidden = true


features["LightPOSway"] = {feat = menu.add_feature("Update Lights POS(move with Player)", "toggle", featureVars.tr.id, function(feat)
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
end),  type = "toggle", callback = function()
end}

features["LightPOSway"].feat.on = false
features["LightPOSway"].feat.hidden = true
            --TODO: Lights

features["Lightway"] = {feat = menu.add_feature("Set Lights around player", "action", featureVars.tr.id, function(feat)

        local offset = v3()
        local pos = v3()
        pos = player.get_player_coords(pid)

        spawned_cunt1[#spawned_cunt1 + 1]  = object.create_object(2906806882, pos, true, true)
        entity.set_entity_as_mission_entity(spawned_cunt1[#spawned_cunt1], true, true)

        spawned_cunt2[#spawned_cunt2 + 1]  = object.create_object(2906806882, pos, true, true)
        entity.set_entity_as_mission_entity(spawned_cunt2[#spawned_cunt2], true, true)

        spawned_cunt3[#spawned_cunt3 + 1]  = object.create_object(2906806882, pos, true, true)
        entity.set_entity_as_mission_entity(spawned_cunt3[#spawned_cunt3], true, true)

        spawned_cunt[#spawned_cunt + 1]  = object.create_object(2906806882, pos, true, true)
        entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, true)

        spawned_cunt[#spawned_cunt + 1]  = object.create_object(2906806882, pos, true, true)
        entity.set_entity_as_mission_entity(spawned_cunt[#spawned_cunt], true, true)
        features["LightPOS1way"].feat.on = true

        features["LightPOSway"].feat.on = true
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
            Thread2Id[pid + 1] = menu.create_thread(Orbit2, feat.value_i)
        end
end), type = "toggle", callback = function()
end}
features["RotatingLights"].feat.min_i = 1
features["RotatingLights"].feat.max_i = 10
features["RotatingLights"].feat.mod_i = 1
features["RotatingLights"].feat.value_i = 1

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
            Thread1Id[pid + 1] = menu.create_thread(Orbit1, feat.value_i)
        end
end), type = "toggle", callback = function()
end}
features["RotatingLights2"].feat.min_i = 1
features["RotatingLights2"].feat.max_i = 20
features["RotatingLights2"].feat.mod_i = 1
features["RotatingLights2"].feat.value_i = 6


features["Broken_ufo"] = {feat = menu.add_feature("Attach Broken ufo", "action", featureVars.tr.id, function(feat)

    local pos = v3()
    local rot = v3(0.0,0.0,0.0)
    local offset = v3(0.0,0.0,0.0)
    local pped = player.get_player_ped(pid)

    pos = player.get_player_coords(pid)
    local i = #spawned_cunts + 1
    spawned_cunts[i] = object.create_object(3974683782, pos, true, false)
    system.wait(25)

    entity.attach_entity_to_entity(spawned_cunts[i], pped, 0, offset, rot, true, false, false, 0, true)

end),  type = "action"}

features["Attacch_building"] = {feat = menu.add_feature("Attach Building Physics? 0|1", "action_value_i", featureVars.tr.id, function(feat)

    local pos = v3()
    local rot = v3(0.0,0.0,0.0)
    local offset = v3(0.0,0.0,0.0)
    local pped = player.get_player_ped(pid)

    pos = player.get_player_coords(pid)
    local i = #spawned_cunts + 1
    spawned_cunts[i] = object.create_object(2047051359, pos, true, false)
    system.wait(25)
    if feat.value_i == 1 then
    phys = true
    end
    entity.attach_entity_to_entity(spawned_cunts[i], pped, 0, offset, rot, true, phys, false, 0, true)

end),  type = "action"}
features["Attacch_building"].feat.max_i = 1
features["Attacch_building"].feat.min_i = 0
features["Attacch_building"].feat.value_i = 0


features["attach_room"] = {feat = menu.add_feature("Room Attachment", "action", featureVars.tr.id, function(feat)

        local pos = v3()
        pos.z = -0.5

        local rot = v3()
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
features["attach_room"].feat.threaded = false


features["attach_room1"] = {feat = menu.add_feature("Room Attachment v2", "action", featureVars.tr.id, function(feat)

        local pos = v3()
        pos.z = -0.5

        local rot = v3()
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
features["attach_room1"].feat.threaded = false

features["attach_room2"] = {feat = menu.add_feature("Room Attachment v3", "action", featureVars.tr.id, function(feat)

        local pos = v3()
        pos.z = -0.5

        local rot = v3()
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
features["attach_room2"].feat.threaded = false


features["scramdeer"] = {feat = menu.add_feature("scramjet Deer", "action", featureVars.tr.id, function(feat)

        local pedp = player.get_player_ped(pid)
        local heading = player.get_player_heading(pid)
        local pos = v3()
        pos = player.get_player_coords(pid)
        local distance = -5
        heading = math.rad((heading - 180) * -1)
        local pose = v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
        local model = 0xD86B5A95
        streaming.request_model(model)
        while (not streaming.has_model_loaded(model)) do
            system.wait(10)
        end

        local i = #escort + 1
        escort[i] = ped.create_ped(6, model, pose, heading, true, false)

        entity.set_entity_god_mode(escort[i], true)
        streaming.set_model_as_no_longer_needed(model)

        local vehhash = gameplay.get_hash_key("scramjet")
        streaming.request_model(vehhash)
        while (not streaming.has_model_loaded(vehhash)) do
            system.wait(10)
        end

        local y = #escortveh + 1
        escortveh[y] = vehicle.create_vehicle(vehhash, pose, heading, true, false)
        vehicle.set_vehicle_mod_kit_type(escortveh[y], 0)
        vehicle.get_vehicle_mod(escortveh[y], 10)
        vehicle.set_vehicle_mod(escortveh[y], 10, 0, false)
        ui.add_blip_for_entity(escortveh[y])

        local blipid = ui.get_blip_from_entity(escortveh[y])
        ui.set_blip_sprite(blipid, 634)
        vehicle.set_vehicle_on_ground_properly(escortveh[y])
        entity.set_entity_god_mode(escortveh[y], true)
        vehicle.set_vehicle_doors_locked(escortveh[y], 5)
        network.request_control_of_entity(escortveh[y])

        ped.set_ped_into_vehicle(escort[i], escortveh[y], -1)
        if ai.task_vehicle_drive_wander(escort[i], escortveh[y], 180, 262144) then
            system.wait(10)
        end
        vehicle.set_vehicle_doors_locked(escortveh[y], 6)
        vehicle.set_vehicle_doors_locked(escortveh[y], 2)
        entity.set_entity_coords_no_offset(escortveh[y], pose)
        ai.task_vehicle_follow(escort[i], escortveh[y], pedp, 220, 262144, 25)
        streaming.set_model_as_no_longer_needed(vehhash)
end), type = "action"}
features["scramdeer"].feat.threaded = false

            --TODO: Lester Ramjet

features["Ram_Jet_cleanup"] = {feat = menu.add_feature("Run Delayed Cleanup?", "toggle", featureVars.gr.id, function(feat)

        features["RamJet_cleanup"].feat.on = true

end),  type = "toggle", callback = function()
    features["RamJet_cleanup"].feat.on = false
end}
features["Ram_Jet_cleanup"].feat.on = false

features["RamJet2"] = {feat = menu.add_feature("Lester RamJet Attack Player", "action_value_i", featureVars.gr.id, function(feat)

        local pedp = player.get_player_ped(pid)
        local pos = v3()
        pos = entity.get_entity_coords(pedp)
        local heading = player.get_player_heading(pid)
        local heading2 = player.get_player_heading(pid)


        local distance = tonumber(feat.value_i)
        heading = math.rad((heading - 180) * -1)
        local pose = v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
        local model = 0x6E42FD26
        streaming.request_model(model)
        while (not streaming.has_model_loaded(model)) do
            system.wait(10)
        end

        local i = #escort + 1
        escort[i] = ped.create_ped(29, model, pos, heading2, true, false)

        entity.set_entity_god_mode(escort[i], true)
        ped.set_ped_can_switch_weapons(escort[i], true)
        ped.set_ped_combat_attributes(escort[i], 46, true)
        ped.set_ped_combat_attributes(escort[i], 52, true)
        ped.set_ped_combat_attributes(escort[i], 1, true)
        ped.set_ped_combat_attributes(escort[i], 2, true)
        ped.set_ped_combat_range(escort[i], 2)
        ped.set_ped_combat_ability(escort[i], 2)
        ped.set_ped_combat_movement(escort[i], 2)
        ai.task_combat_ped(escort[i], pedp, 0, 16)
        streaming.set_model_as_no_longer_needed(model)

        local vehhash = gameplay.get_hash_key("scramjet")
        streaming.request_model(vehhash)
        while (not streaming.has_model_loaded(vehhash)) do
            system.wait(10)
        end

        escortveh[#escortveh + 1] = vehicle.create_vehicle(vehhash, pose, heading2, true, false)
        network.request_control_of_entity(escortveh[#escortveh])
        entity.set_entity_god_mode(escortveh[#escortveh], true)
        network.request_control_of_entity(escortveh[#escortveh])
        vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 5)
        ped.set_ped_into_vehicle(escort[i], escortveh[#escortveh], -1)
        vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 6)
        vehicle.set_vehicle_doors_locked(escortveh[#escortveh], 2)
        vehicle.set_vehicle_mod_kit_type(escortveh[#escortveh], 0)
        vehicle.get_vehicle_mod(escortveh[#escortveh], 10)
        vehicle.set_vehicle_mod(escortveh[#escortveh], 10, 0, false)
        ui.add_blip_for_entity(escortveh[#escortveh])
        local blipid = ui.get_blip_from_entity(escortveh[#escortveh])
        ui.set_blip_sprite(blipid, 634)
        ai.task_vehicle_aim_at_ped(escort[i], pedp)
        ai.task_combat_ped(escort[i], pedp, 0, 16)
        vehicle.set_vehicle_rocket_boost_active(escortveh[#escortveh], true)

        return HANDLER_POP
end), type = "action"}
features["RamJet2"].feat.threaded = false
features["RamJet2"].feat.max_i = -10
features["RamJet2"].feat.min_i = -200
features["RamJet2"].feat.value_i = -20

features["RamJet3"] = {feat = menu.add_feature("Lester RamJet Impact Player", "action_value_i",featureVars.gr.id, function(feat)

        local pedp = player.get_player_ped(pid)
        local pos = v3()
        pos = entity.get_entity_coords(pedp)
        local heading = player.get_player_heading(pid)
        local heading2 = player.get_player_heading(pid)


        local distance = tonumber(feat.value_i)
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
        ai.task_combat_ped(escort[i], pedp, 0, 16)
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
        ui.add_blip_for_entity(escortveh[#escortveh])
        local blipid = ui.get_blip_from_entity(escortveh[#escortveh])
        ui.set_blip_sprite(blipid, 634)
        ai.task_vehicle_aim_at_ped(escort[i], pedp)
        ai.task_combat_ped(escort[i], pedp, 0, 16)
        vehicle.set_vehicle_out_of_control(escortveh[#escortveh], true, true)
        vehicle.set_vehicle_rocket_boost_active(escortveh[#escortveh], true)

        return HANDLER_POP
end), type = "action"}
features["RamJet3"].feat.threaded = false
features["RamJet3"].feat.max_i = -10
features["RamJet3"].feat.min_i = -200
features["RamJet3"].feat.value_i = -20

features["Ramjet_Attach"] = {feat = menu.add_feature("Attach all RamJets offset", "value_i", featureVars.gr.id, function(feat)
    if feat.on then
        local pedp = player.get_player_ped(pid)


        local offset = v3()
        offset.x = 0.0
        offset.y = 0.0
        offset.z = 0.0
        local y = tonumber(feat.value_i)
        offset.x = y
        local rot = v3(0.0,0.0,0.0)

        for i = 1, #escort do
            network.request_control_of_entity(escort[i])
            entity.attach_entity_to_entity(escort[i], pedp, 0, offset, rot, true, true, true, 0, true)
        end

        for i = 1, #escortveh do
            network.request_control_of_entity(escortveh[i])
            entity.attach_entity_to_entity(escortveh[i], pedp, 0, offset, rot, true, true, false, 0, true)
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
features["Ramjet_Attach"].feat.max_i = 50
features["Ramjet_Attach"].feat.min_i = 0


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

    local pos = v3()
    local PlyImpactPos = v3()
    local offset = v3()

features["weapon_impact"] = {feat = menu.add_feature("Get last Weapon impact POS", "toggle", featureVars.f.id, function(feat)
    if feat.on then
        pedd = player.get_player_ped(pid)
        local success, pos = ped.get_ped_last_weapon_impact(pedd, v3())
        if success then
            PlyImpactPos = pos
        else

        end
        return HANDLER_CONTINUE
    end
end),  type = "toggle", callback = function()
end}
features["weapon_impact"].feat.on = false
features["weapon_impact"].feat.hidden = true

features["Give_Airstrike"] = {feat = menu.add_feature("Give last Weapon Impact Strike", "value_i", featureVars.f.id, function(feat)

        features["weapon_impact"].feat.on = true
        if feat.on then

            if not notify_sent then
                moist_notify("Weapon Projectile Selected:\n", StrikeGive[feat.value_i])
                notify_sent = true
            end


            pedd = player.get_player_ped(pid)
            if not ped.is_ped_shooting(pedd) then
                return HANDLER_CONTINUE end
            print("ped Shooting")
            --system.wait(10)

            local posm = v3()
            posm = player.get_player_coords(pid)

            if feat.value_i == 5 then
                posm.z = posm.z + 10
            else
                posm.z = posm.z + 100
            end

            local hash = gameplay.get_hash_key(StrikeGive[feat.value_i])
            pos_off = v3()
            pos_off.x = pos.x + math.random(1, 5)
            pos_off.y = pos.y + math.random(1, 8)

            local playerz, zPos = gameplay.get_ground_z(pos)
            pos_off.z = zPos
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 1000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.x = PlyImpactPos.x + 5
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.y = PlyImpactPos.y - 5
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.x = PlyImpactPos.x - 6
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.y = PlyImpactPos.y + 6
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 1000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.x = PlyImpactPos.x + 5
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.y = PlyImpactPos.y - 5
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.x = PlyImpactPos.x - 4
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)
            PlyImpactPos.y = PlyImpactPos.y + 4
            gameplay.shoot_single_bullet_between_coords(posm, PlyImpactPos, 10000.00, hash, 0, true, false, 100000.0)
            system.wait(50)

            print(PlyImpactPos)
            return HANDLER_CONTINUE
        end

        features["weapon_impact"].feat.on = false
        notify_sent = false
        return HANDLER_POP


end),  type = "toggle", callback = function()
end}

features["Give_Airstrike"].feat.on = false
features["Give_Airstrike"].feat.max_i = #StrikeGive
features["Give_Airstrike"].feat.min_i = 1

features["World_PickupDump"] = {feat = menu.add_feature("Dump World Pickups on this Cunt!", "action", featureVars.f.id, function(feat)
    if world_dumped then
        local pos = v3()
        pos = player.get_player_coords(pid)
        dump_pickups_onplayer(pid, pos)
    end
    return HANDLER_POP
end), type = "action"}

features["Block Passive"] = {feat = menu.add_feature("Block Passive Mode", "action", featureVars.f.id, function(feat)

        ScriptTR(0xC9CC4F80, pid, {1, 1})
        ScriptTR(3385610112, pid, {1, 1})
        local scid = player.get_player_scid(pid)
        local name = tostring(player.get_player_name(pid))
        debug_out(string.format("Player: " ..name .." [" ..scid .."]" .."Blocked Passive"))
end), type = "action"}

features["Unblock Passive"] = {feat = menu.add_feature("Unblock Passive Mode", "action", featureVars.f.id, function(feat)

        ScriptTR(0xC9CC4F80, pid, {2, 0})
        ScriptTR(3385610112, pid, {2, 0})
        scid = player.get_player_scid(pid)
        name = tostring(player.get_player_name(pid))
        debug_out(string.format("Player: " .. name .. " [" .. scid .. "]" .. "Passive Unblocked"))

end), type = "action"}
--TODO: Grief

local blame = 0

features["blamer"] = {feat = menu.add_feature("Own The Blame For this shit?", "toggle", featureVars.g.id, function(feat)
    if not feat.on then
        blame = 0
        return HANDLER_POP
    end
    if not blame == o or nil then
        blame = PlayerPed

    end
    return HANDLER_CONTINUE
end), type = "toggle"}

features["Dildo_Dick"] = {feat = menu.add_feature("Dildo Illuminate Cunt", "action", featureVars.tr.id, function(feat)

        local pedd = player.get_player_ped(pid)
        local pos = v3()
        local offset = v3()
        offset.x = 0.08
        offset.y = 0.0
        offset.z = 0.0
        local rot = v3()
        rot.x = 40
        rot.y = -83
        rot.z = -134
        local bid = ped.get_ped_bone_index(pedd, 65068)
        local hashb = gameplay.get_hash_key("v_res_d_dildo_f")
        spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, true)
        local offset = v3()
        offset.x = 0.0
        offset.y = 0.0
        offset.z = 0.0
        local rot = v3()
        rot.x = 293.0
        rot.y = 28.0
        rot.z = 24.0
        local bid = ped.get_ped_bone_index(pedd, 23553)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(hashb, pos, true, true)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, true)
        local bid = ped.get_ped_bone_index(pedd, 65068)
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
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pedd, bid, offset, rot, true, false, false, 0, false)
        local pos = v3()
        local offset = v3()
        local rot = v3()
        offset.x = 0.12
        offset.y = 0.0
        offset.z = -0.26
        rot.x = -181.0
        rot.y = 0.0
        rot.z = 0.0

        local pped = player.get_player_ped(pid)
        local bone = ped.get_ped_bone_index(pped, 18905)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(3324004640, pos, true, false)

        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], pped, bone, offset, rot, true, false, true, 0, true)

        return HANDLER_POP
end), type = "action"}

features["dildobombs"] = {feat = menu.add_feature("Dildo Bombs From Ass", "action", featureVars.g.id, function(feat)

        local pedd = player.get_player_ped(pid)
        ped.get_ped_bone_coords(pedd, 0, offset)
        local pedbool
        local pos = v3()
        local offset = v3()
        offset.x = 0.0
        offset.y = -0.001
        offset.z = 0.0

        pedbool, pos = ped.get_ped_bone_coords(pedd, 0, offset)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)

        entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, 100, 0, 0, 0, true, true)
        pedbool, pos = ped.get_ped_bone_coords(pedd, 0, offset)
        offset.y = offset.y + -0.001
        system.wait(10)

        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)

        entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, -100, -2, 0, 0, true, true)
        pedbool, pos = ped.get_ped_bone_coords(pedd, 0, offset)
        system.wait(10)
        offset.y = offset.y + -0.001

        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)

        entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 3, 0, 0, 100, 1, 0, 0, true, true)
        system.wait(10)
        pedbool, pos = ped.get_ped_bone_coords(pedd, 0, offset)
        offset.y = offset.y + -0.001

        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, true)
        system.wait(10)
        entity.apply_force_to_entity(spawned_cunts[#spawned_cunts], 5, 0, 0, -100, 0, 0, 0, true, true)

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


            system.wait(100)
            entity.set_entity_as_no_longer_needed(spawned_cunts[i])
            entity.delete_entity(spawned_cunts[i])

        end

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

features["BeachFire"] = {feat = menu.add_feature("Attach Beach Fires", "action", featureVars.g.id, function(feat)

        local pedd = player.get_player_ped(pid)
        local pos = v3()
        local offset = v3(0.0,0.0,10.0)
        local bid1 =  ped.get_ped_bone_index(pedd, 31086)
        local bid2 =  ped.get_ped_bone_index(pedd, 11816)
        
            spawned_cunts[#spawned_cunts + 1] = object.create_object(3229200997, pos, true, false)
            entity.attach_entity_to_entity( spawned_cunts[#spawned_cunts], pedd,  bid1, pos, offset, true, true, false, 0, false)
            local offset = v3(0.0,0.0,-10.0)
            spawned_cunts[#spawned_cunts + 1] = object.create_object(3229200997, pos, true, false)
            entity.attach_entity_to_entity( spawned_cunts[#spawned_cunts], pedd,  bid2, pos, offset, true, true, false, 0, false)
            

    return HANDLER_POP
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

        gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 1000.00, hash, blame, true, false, 10000.0)
        offset.x = -10.0
        offset.y = 0.0
        offset.z = 0.0
        gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 1000.00, hash, blame, true, false, 10000.0)
        offset.x = 0.0
        offset.y = 10.0
        offset.z = 0.0
        gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 1000.00, hash, blame, true, false, 10000.0)
        offset.x = 0.0
        offset.y = -10.0
        offset.z = 0.0
        gameplay.shoot_single_bullet_between_coords(pos + offset, bonepos, 1000.00, hash, blame, true, false, 10000.0)

end), type = "action"}

features["Send_HunterLester"] = {feat = menu.add_feature("Send Lester Hunt them in savage", "action", featureVars.g.id, function(feat)

        features["hunter_taskloop"].feat.on = true
        local pos = v3(-73.31681060791,-820.26013183594,326.17517089844)

        local vehhash = veh_list[2][2]
        mod = 10
        modvalue = -1
        local pped = player.get_player_ped(pid)
        spawn_ped(pid, 0x6E42FD26, pos, true, true)
        system.wait(100)
        local huntv = spawn_veh(pid, vehhash, pos, mod, modvalue, true)


        local blipid = ui.get_blip_from_entity(huntv)
        ui.set_blip_sprite(blipid, 43)

        local p = #escort
        local y = #escortveh

        ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
        ai.task_combat_ped(escort[p], pped, 0, 16)
        system.wait(4000)
        vehicle.control_landing_gear(escortveh[y], 3)
        system.wait(4000)
        entity.set_entity_collision(escortveh[y], false, false, false)

        moist_notify("Lester Savage Hunter", "\nSent from Maze Tower to Target")


end), type = "action"}


features["Send_HunterLester1"] = {feat = menu.add_feature("Lester Thruster Hunter 2:weap", "action_value_i", featureVars.g.id, function(feat)
        features["hunter_taskloop"].feat.on = true
        local pos = v3(-73.31681060791,-820.26013183594,326.17517089844)

        local vehhash = 0x58CDAF30

        local pped = player.get_player_ped(pid)
        spawn_ped(pid, 0x6E42FD26, pos, true, true)
        system.wait(100)
        local i = feat.value_i
        local mod, modvalue = 10, -1
        local huntv = spawn_veh(pid, vehhash, pos, mod, modvalue, true)
        entity.set_entity_as_mission_entity(huntv, true, false)

        if feat.value_i == 2 then
        local modds = {{10, 1},{4, 0},{11, 3},{12, 2},{16, 4},{18, 1},{20, 0},{22, 0},{48, 23},}
        
        for i = 1, #modds do
        
        vehicle.set_vehicle_mod_kit_type(huntv, 0)
        vehicle.get_vehicle_mod(huntv, modds[i][1])
        vehicle.set_vehicle_mod(huntv, modds[i][1], modds[i][2], false)
        end
        end
        


        local p = #escort
        local y = #escortveh
        entity.set_entity_as_mission_entity(escort[p], true, false)
        ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
        local blipid = ui.get_blip_from_entity(escortveh[y])
        ui.set_blip_sprite(blipid, 597)
        ai.task_combat_ped(escort[p], pped, 0, 16)
        system.wait(4000)
        network.request_control_of_entity(huntv)
        entity.set_entity_collision(huntv, false, false, false)

         network.request_control_of_entity(escortveh[y])
        entity.set_entity_collision(escortveh[y], false, false, false)
        moist_notify("Thruster Lester Hunter", "\nSent from Maze Tower to Target")

end), type = "action"}
features["Send_HunterLester1"].feat.max_i = 2
features["Send_HunterLester1"].feat.min_i = 1
features["Send_HunterLester1"].feat.value_i = 1

features["hunter_taskloop"] = {feat = menu.add_feature("Retask Lester on Death", "toggle", featureVars.g.id, function(feat)
    if feat.on then
        local pped = player.get_player_ped(pid)
        if not entity.is_entity_dead(pped) then return HANDLER_CONTINUE end
        system.wait(4000)
        for i = 1, #escort do

            -- if #escortveh == nil or 0 then
              -- goto next
            -- end
            -- ped.set_ped_into_vehicle(escort[i], escortveh[i], -1)
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

features["World_Dump1"] = {feat = menu.add_feature("Dump World onto this Cunt! & Freeze it", "action", featureVars.g.id, function(feat)
    if world_dumped then
        local pos = v3()
        pos = player.get_player_coords(pid)
        dumpfreeze_onplayer(pid, pos)
    end
    return HANDLER_POP
end), type = "action"}

--TODO: Alkonostlag

features["alkonost_lag"] = {feat = menu.add_feature("alkonost AIO Spot Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 3929093893
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        alkonost[#alkonost + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        --entity.set_entity_as_no_longer_needed(alkonost[#alkonost])
    end
    streaming.set_model_as_no_longer_needed(hash)


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["alkonost_lag"].feat.min_i = 1
features["alkonost_lag"].feat.max_i = 100
features["alkonost_lag"].feat.value_i = 15

features["alkonost_lag"] = {feat = menu.add_feature("alkonost V1 POS Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 3929093893
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        pos.y = pos.y + 1.0
        pos.z = pos.z + 0.5
        alkonost[#alkonost + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
    end
    streaming.set_model_as_no_longer_needed(hash)
    -- for a = 1, #alkonost do
    -- entity.set_entity_as_no_longer_needed(alkonost1[a])
    -- end


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["alkonost_lag"].feat.min_i = 1
features["alkonost_lag"].feat.max_i = 100
features["alkonost_lag"].feat.value_i = 15

features["alkonost_lag"] = {feat = menu.add_feature("alkonost V2 OFFSET Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    local offset = v3(0.0,0.0,0.0)
    local rot = v3(0.0,0.0,0.0)
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 3929093893
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        pos.x = pos.x + 1.0
        alkonost[#alkonost + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
    end
    streaming.set_model_as_no_longer_needed(hash)


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["alkonost_lag"].feat.min_i = 1
features["alkonost_lag"].feat.max_i = 100
features["alkonost_lag"].feat.value_i = 15

features["alkonost_lagattach"] = {feat = menu.add_feature("Attach all alkonost lag", "toggle", featureVars.g.id, function(feat)
    if feat.on then
        local pedp = player.get_player_ped(pid)

        local pos = v3()
        local offset = v3(0.0,0.0,0.0)
        local rot = v3(0.0,0.0,0.0)
        pos = entity.get_entity_coords(pedp)

        for i = 1, #alkonost do
            entity.attach_entity_to_entity(alkonost[i], pedp, 0, offset, rot, true, true, false, 0, true)
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

features["kosatka_lag"] = {feat = menu.add_feature("kosatka AIO Spot Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 1336872304
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], kosatka[#kosatka], 0, pos, pos, true, true, false, 0, false)
        --entity.set_entity_as_no_longer_needed(kosatka[#kosatka])
    end
    streaming.set_model_as_no_longer_needed(hash)


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["kosatka_lag"].feat.min_i = 1
features["kosatka_lag"].feat.max_i = 100
features["kosatka_lag"].feat.value_i = 15

features["kosatka_lag"] = {feat = menu.add_feature("kosatka V1 POS Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 1336872304
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        pos.y = pos.y + 1.0
        pos.z = pos.z + 0.5
        kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], kosatka[#kosatka], 0, pos, pos, true, true, false, 0, false)
    end
    streaming.set_model_as_no_longer_needed(hash)
    -- for a = 1, #kosatka do
    -- entity.set_entity_as_no_longer_needed(kosatka1[a])
    -- end


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["kosatka_lag"].feat.min_i = 1
features["kosatka_lag"].feat.max_i = 100
features["kosatka_lag"].feat.value_i = 15

features["kosatka_lag"] = {feat = menu.add_feature("kosatka V2 OFFSET Lag", "action_value_i", featureVars.g.id, function(feat)
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    local offset = v3(0.0,0.0,0.0)
    local rot = v3(0.0,0.0,0.0)
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i
    local hash = 1336872304
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    for y = 1, feat.value_i do
        pos.x = pos.x + 1.0
        kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        spawned_cunts[#spawned_cunts + 1] = object.create_object(-422877666, pos, true, false)
        entity.attach_entity_to_entity(spawned_cunts[#spawned_cunts], kosatka[#kosatka], 0, pos, pos, true, true, false, 0, false)
    end
    streaming.set_model_as_no_longer_needed(hash)


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["kosatka_lag"].feat.min_i = 1
features["kosatka_lag"].feat.max_i = 100
features["kosatka_lag"].feat.value_i = 15

features["kosatka_crash"] = {feat = menu.add_feature("kosatka Crash Test", "action_value_i", featureVars.g.id, function(feat)
    local kosatka_main = {}
    local main
    local kosatka_kids = {}
    local pedp = player.get_player_ped(pid)
    local heading = player.get_player_heading(pid)
    local pos = v3()
    local offset = v3(0.0,0.0,0.0)
    local rot = v3(0.0,0.0,0.0)
    pos = entity.get_entity_coords(pedp)
    local i = feat.value_i

    local hash1 = 0x7B54A9D3
    streaming.request_model(hash1)
    while (not streaming.has_model_loaded(hash1)) do
        system.wait(10)
    end

    main = vehicle.create_vehicle(hash1, pos, heading, true, false)
    kosatka_main[#kosatka_main + 1] = vehicle.create_vehicle(hash1, pos, heading, true, false)
    --vehicle.set_vehicle_can_be_visibly_damaged(kosatka_main[#kosatka_main], false)
    entity.attach_entity_to_entity(kosatka_main[#kosatka_main], main, 0, offset + 2.0, rot, true, true, false, 2, false)

    local hash = 1336872304
    streaming.request_model(hash)
    while (not streaming.has_model_loaded(hash)) do
        system.wait(10)
    end
    pos.x = pos.x + 1.0

    for y = 1, feat.value_i do

        kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        kosatka_kids[#kosatka_kids + 1] = kosatka[#kosatka]
        kosatka[#kosatka + 1] = vehicle.create_vehicle(hash, pos, heading, true, false)
        kosatka_kids[#kosatka_kids + 1] = kosatka[#kosatka]
        for i = 1, #kosatka_kids do
            offset.x = offset.x + 0.10
            offset.y = offset.y + 0.05
            offset.z = 50
            rot.x = rot.x + 10.0
            rot.y = rot.y + 20.0
            rot.z = rot.z + 12.5
            entity.set_entity_collision(kosatka_main[#kosatka_main], true, true, false)
            entity.attach_entity_to_entity(kosatka_kids[i], kosatka_main[#kosatka_main], 0, offset, rot, false, true, false, 0, false)
            vehicle.set_vehicle_can_be_visibly_damaged(kosatka_kids[i], false)
            entity.set_entity_collision(kosatka_kids[i], true, true, false)
        end
    end
    streaming.set_model_as_no_longer_needed(hash)

    streaming.set_model_as_no_longer_needed(hash1)


    return HANDLER_POP
end),  type = "action_value_i", callback = function()
end}
features["kosatka_crash"].feat.min_i = 1
features["kosatka_crash"].feat.max_i = 100
features["kosatka_crash"].feat.value_i = 15

features["kosatka_lagattach"] = {feat = menu.add_feature("Attach all kosatka lag", "toggle", featureVars.g.id, function(feat)
    if feat.on then
        local pedp = player.get_player_ped(pid)

        local pos = v3()
        local offset = v3(0.0,0.0,0.0)
        local rot = v3(0.0,0.0,0.0)
        pos = entity.get_entity_coords(pedp)

        for i = 1, #kosatka do
            entity.attach_entity_to_entity(kosatka[i], pedp, 0, offset, rot, true, true, false, 0, true)
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

features["check_HPWP"] = {feat = menu.add_feature("Check Players HP Stats & Weapon", "action", featureVars.n.id, function(feat)
    local pped = player.get_player_ped(pid)
    moist_notify("Current HP info:\n", player.get_player_health(pid) .. " / " ..player.get_player_max_health(pid) .. " || " .. player.get_player_armour(pid).." ||")
    debug_out(string.format("\nCurrent HP info: " ..  player.get_player_name(pid) ..": ||" .. player.get_player_health(pid) .. " / " ..player.get_player_max_health(pid) .. " || " .. player.get_player_armour(pid).." ||"))
    if not ped.is_ped_in_any_vehicle(pped) then
        local heldwep = ped.get_current_ped_weapon(pped)
        moist_notify(weapon.get_weapon_name(heldwep), "\n".. heldwep)
        debug_out(string.format("Current Held Weapon: " ..weapon.get_weapon_name(heldwep).. ' ('.. heldwep ..')'))
    end
    return HANDLER_POP
end), type = "action"  }

features["Way-point"] = {feat = menu.add_feature("Set Way point On Player", "toggle", featureVars.n.id, function(feat)
    if feat.on then
        for i=0,31 do
            if i ~= pid and playerFeatures[i].features["Way-point"].feat then
                playerFeatures[i].features["Way-point"].feat.on = false
            end
        end
    else
        set_waypoint(nil)
    end
    return HANDLER_POP
end), type = "toggle", callback = function()
    set_waypoint(player.get_player_coords(pid))
end}
features["Way-point"].feat.threaded = false

--TODO: Kick System
features["EventSpam_toggle"] = {feat = menu.add_feature("Spam Them ALL!", "toggle", featureVars.k.id, function(feat)
    if not feat.on then

        playerFeatures[pid].features["Kick1_Type1"].feat.on = false
        playerFeatures[pid].features["Kick1_Type2"].feat.on = false
        playerFeatures[pid].features["Kick2_Type1"].feat.on = false
        playerFeatures[pid].features["Kick2_Type2"].feat.on = false
        playerFeatures[pid].features["Kick3_Type1"].feat.on = false
        playerFeatures[pid].features["Kick3_Type2"].feat.on = false
        return HANDLER_CONTINUE
    end

end),  type = "toggle", callback = function()
    playerFeatures[pid].features["Kick1_Type1"].feat.on = true
    playerFeatures[pid].features["Kick1_Type2"].feat.on = true
    playerFeatures[pid].features["Kick2_Type1"].feat.on = true
    playerFeatures[pid].features["Kick2_Type2"].feat.on = true
    playerFeatures[pid].features["Kick3_Type1"].feat.on = true
    playerFeatures[pid].features["Kick3_Type2"].feat.on = true
    return HANDLER_POP

end}
features["EventSpam_toggle"].feat.on = false

features["Kick1_Type1"] = {feat = menu.add_feature("Kick Data 1 Type 1", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data then b = #data end
        print(b .. ", "..a)

        for i = a, b do
            par1 = math.random(-1000, 99999999)
            par2 = math.random(-1, 9)
            par3 = math.random(-1, 1)
            par4 = math.random(-1, 9)
            par5 = math.random(-1, 1)

            ScriptTR(data[i], pid, {par3, par5, par2, par3, par2})
            print("[" ..i .."] " .. "ScriptTR(" ..data[i] .."," .."[pid:]" .. pid .."," .. "{ ".. par3 ..", " .. par5 ..", " .. par2 ..", " .. par3 ..", " .. par2 .."})")
            -- system.wait(500)
            ScriptTR(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

            print("[" ..i .."] " .. "ScriptTR(" ..data[i] .."," .."[pid:]" .. pid .."," .. "{" .. par3 ..", " .. par5 ..", " .. par2 ..", " .. par3 ..", " .. par2 ..", " .. par1 ..", " .. par3 ..", " .. par1 .."})" )
            -- system.wait(500)

        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Kick1_Type1"].feat.max_i = #data
features["Kick1_Type1"].feat.min_i = 1
features["Kick1_Type1"].feat.value_i = 584
features["Kick1_Type1"].feat.mod_i = 100
features["Kick1_Type1"].feat.on = false

features["Kick1_Type2"] = {feat = menu.add_feature("Kick Data 1 Type 2", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data then b = #data end
        print(b .. ", "..a)

        for i = a, b do

            par1 = math.random(-1000, 99999999)
            par2 = math.random(-99999999999999, -9)
            par3 = math.random(46190868, 999999999)
            par4 = math.random(-1, 9)
            par5 = math.random(-99999999999999, -46190868)
            par6 = math.random(9999999999, 9999999899990868)
            ScriptTR(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

            print(data[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

            ScriptTR(data[i], pid, {par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1})

            print(data[i] .."," .. pid .."," .. par1 ..","  .. par4 .."," .. par3 .."," .. par5 .."," .. par6 ..","  .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP

end),  type = "toggle", callback = function()
end}
features["Kick1_Type2"].feat.max_i = #data
features["Kick1_Type2"].feat.min_i = 1
features["Kick1_Type2"].feat.value_i = 199
features["Kick1_Type2"].feat.mod_i = 99
features["Kick1_Type2"].feat.on = false

features["Kick2_Type1"] = {feat = menu.add_feature("Kick Data 2 Type 1", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data2 then b = #data2 end
        print(b .. ", "..a)

        for i = a, b do

            par1 = math.random(-1000, 99999999)
            par2 = math.random(-1, 9)
            par3 = math.random(-1, 1)
            par4 = math.random(-1, 9)
            par5 = math.random(-1, 1)

            ScriptTR(data2[i], pid, {par3, par5, par2, par3, par2})
            print(data2[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2)
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP

end),  type = "toggle", callback = function()
end}
features["Kick2_Type1"].feat.max_i = #data2
features["Kick2_Type1"].feat.min_i = 1
features["Kick2_Type1"].feat.value_i = 397
features["Kick2_Type1"].feat.mod_i = 99
features["Kick2_Type1"].feat.on = false

features["Kick2_Type2"] = {feat = menu.add_feature("Kick Data 2 Type 2", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data2 then b = #data2 end
        print(b .. ", "..a)

        for i = a, b do

            par1 = math.random(-1000, 99999999)
            par2 = math.random(-99999999999999, -9)
            par3 = math.random(46190868, 999999999)
            par4 = math.random(-1, 9)
            par5 = math.random(-99999999999999, -46190868)

            ScriptTR(data2[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

            print(data2[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Kick2_Type2"].feat.max_i = #data2
features["Kick2_Type2"].feat.min_i = 1
features["Kick2_Type2"].feat.value_i = 584
features["Kick2_Type2"].feat.mod_i = 99
features["Kick2_Type2"].feat.on = false

features["Kick3_Type1"] = {feat = menu.add_feature("Kick Data 3 Type 1", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data3 then b = #data3 end
        print(b .. ", "..a)

        for i = a, b do

            par1 = math.random(-1000, 99999999)
            par2 = math.random(-1, 9999999999)
            par3 = math.random(4904904, 100000000000)
            par4 = math.random(4000, 9999999)
            par5 = math.random(-1, 1)

            ScriptTR(data3[i], pid, {par3, par5, par2, par3, par2})
            print(data3[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2)
        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP

end),  type = "toggle", callback = function()
end}
features["Kick3_Type1"].feat.max_i = #data3
features["Kick3_Type1"].feat.min_i = 1
features["Kick3_Type1"].feat.value_i = 485
features["Kick3_Type1"].feat.mod_i = 99
features["Kick3_Type1"].feat.on = false

features["Kick3_Type2"] = {feat = menu.add_feature("Kick Data 3 Type 2", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)
        local a = feat.value_i
        if a < 1 then a = 1 end

        local b = a + 99
        if b > #data3 then b = #data3 end
        print(b .. ", "..a)

        for i = a, b do

            par1 = math.random(-1000, 99999999)
            par2 = math.random(-99999999999999, -9)
            par3 = math.random(46190868, 999999999)
            par4 = math.random(-1, 9)
            par5 = math.random(-99999999999999, -46190868)

            ScriptTR(data3[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

            print(data3[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

        end
        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Kick3_Type2"].feat.max_i = #data3
features["Kick3_Type2"].feat.min_i = 1
features["Kick3_Type2"].feat.value_i = 1
features["Kick3_Type2"].feat.mod_i = 99
features["Kick3_Type2"].feat.on = false

features["Kick3_Type3"] = {feat = menu.add_feature("Kick Data 3 Type 3", "value_i", featureVars.k.id, function(feat)
    if feat.on then
        --player.unset_player_as_modder(pid, -1)

        local i = feat.value_i

        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)

        ScriptTR(data3[i], pid, {-1, par3, par5, par2, par3, -1, par2, par1, par3, par1})

        print(data3[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )


        return HANDLER_CONTINUE
    end
    return HANDLER_POP
end),  type = "toggle", callback = function()
end}
features["Kick3_Type3"].feat.max_i = #data3
features["Kick3_Type3"].feat.min_i = 1
features["Kick3_Type3"].feat.value_i = 1
features["Kick3_Type3"].feat.mod_i = 1
features["Kick3_Type3"].feat.on = false

features["net-kick"] = {feat = menu.add_feature("Network Bail Kick", "action", featureVars.k.id, function(feat)
    --player.unset_player_as_modder(pid, -1)
    local scid = player.get_player_scid(pid)
    local name = tostring(player.get_player_name(pid))

    ScriptTR(-2120750352, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
    ScriptTR(0xE6116600, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})

    debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))

end), type = "action"}

features["net-kick2"] = {feat = menu.add_feature("Network Bail Kick ScriptFuck", "action", featureVars.k.id, function(feat)
 
    ScriptTR(-922075519, pid, {pid, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1})
    ScriptTR(-1975590661, pid, {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450})
    
    local pos = v3()
	pos = player.get_player_coords(pid)
    pos.x = math.floor(pos.x)
    pos.y = math.floor(pos.y)
    pos.z = math.floor(pos.z)
    local scid = player.get_player_scid(pid)
    local name = tostring(player.get_player_name(pid))
    ScriptTR(-1975590661, pid, {pid, pos.x, pos.y, pos.z, 0, 0, 2147483647, 0, script.get_global_i(1590682 + (pid * 883) + 99 + 28), 1})
    ScriptTR(-1975590661, pid, {pid, pos.x, pos.y, pos.z, 0, 0, 1000, 0, script.get_global_i(1590682 + (pid * 883) + 99 + 28), 1})
   
    ScriptTR(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
    ScriptTR(-2120750352, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
    ScriptTR(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
    ScriptTR(0xE6116600, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})

    debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))

end), type = "action"}

features["SE-kick"] = {feat = menu.add_feature("SE Kick", "action", featureVars.k.id, function(feat)

        --player.unset_player_as_modder(pid, -1)
        local scid = player.get_player_scid(pid)
        ScriptTR(0xB0886E20, pid, {0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        ScriptTR(0xB0886E20, pid, {0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        ScriptTR(0x9DB77399, pid, {50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 999999999999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        ScriptTR(0x9DB77399, pid, {50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 999999999999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        local name = tostring(player.get_player_name(pid))
        ScriptTR(0xB0886E20, pid, {-1, 0, 0, 0})
        ScriptTR(0xB0886E20, pid, {0, -1, -1, 0})
        ScriptTR(0x9DB77399, pid, {-1, 0, -1, 0})
        debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))

end), type = "action"}

features["SPE-kick"] = {feat = menu.add_feature("SPECIAL KICK", "action", featureVars.k.id, function(feat)

        --player.unset_player_as_modder(pid, -1)
        local scid = player.get_player_scid(pid)
        ScriptTR(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        ScriptTR(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        ScriptTR(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        ScriptTR(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        local name = tostring(player.get_player_name(pid))
        debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Special SE Kicked"))

end), type = "action"}

features["SPE-kick"] = {feat = menu.add_feature("Script Event Crash", "action", featureVars.k.id, function(feat)

        --player.unset_player_as_modder(pid, -1)
        local scid = player.get_player_scid(pid)
        ScriptTR(0xc5bc4c4b, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        ScriptTR(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        ScriptTR(-2120750352, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
        ScriptTR(0xE6116600, pid, {pid, script.get_global_i(1630317 + (1 + (pid * 595)) + 506)})
        ScriptTR(-977515445, pid, {-1, 500000, 849451549, -1, -1})
        ScriptTR(767605081, pid, {-1, 500000, 849451549, -1, -1})
        ScriptTR(-1949011582, pid, {-1139568479, -1, 1, 100099})
        ScriptTR(-2122716210, pid, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
        ScriptTR(-922075519, pid, {-1, -1, -1, -1, -1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})
        ScriptTR(-1975590661, pid, {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028})


        local name = tostring(player.get_player_name(pid))
        debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Crash SE"))

end), type = "action"}

playerFeatures[pid] = {feat = featureVars.f, scid = -1, features = features}
featureVars.f.hidden = true
end
end
playerlist()

function main()
    --Main loop
local SessionHost = nil
local ScriptHost = nil
local loop_logsent = false

local loopFeat = menu.add_feature("Loop", "toggle", 0, function(feat)
        if feat.on then
            local Online = network.is_session_started()
            if not Online then

                SessionHost = nil
                ScriptHost = nil
                PlayerPed = 0
                loop_logsent = false
            end
            local lpid = player.player_id()
            for pid=0,31 do
                local tbl = playerFeatures[pid]
                local f = tbl.feat
                local scid = player.get_player_scid(pid)

                if scid ~= 4294967295 then
                    if f.hidden then f.hidden = false end
                    local name = player.get_player_name(pid)
                    local isYou = lpid == pid
                    local tags = {}
                    if Online then
                        if not PlayerPed == 0 or nil then
                            PlayerPed =	player.get_player_ped(player.player_id())
                        end
                        if isYou then
                            tags[#tags + 1] = "Y"
                        end
                        if player.is_player_friend(pid) then
                            tags[#tags + 1] = "F"
                        end
                        if player.is_player_vehicle_god(pid) then
                            tags[#tags + 1] = "V"
                            if not logsent then
                                debug_out(string.format("Player: " ..name .." [Vehicle Godmode]"))
                                logsent = true
                            end
                        end
                        if player.is_player_god(pid) then
                            tags[#tags + 1] = "G"
                        end
                        if  not player.is_player_modder(pid, -1) then
                            if player.is_player_spectating(pid) and player.is_player_playing(pid) and interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
                                tags[#tags + 1] = ".SPEC."
                                player.set_player_as_modder(pid, mod_flag_3)
                            end
                        end
                        if player.is_player_modder(pid, -1) then
                            tags[#tags + 1] = "M"
                        end
                        if script.get_global_i(2425869 + (1 + (pid * 443)) + 204) == 1 then
                            otr_player(pid)
                            tags[#tags + 1] = "O"

                        end
                        if player.is_player_host(pid) then
                            tags[#tags + 1] = "H"
                            if SessionHost ~= pid then
                                SessionHost = pid
                                moist_notify("The session host is now:\n", (isYou and " you " or name) .. "  ")
                                debug_out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
                            end
                        end
                        if pid == script.get_host_of_this_script() then
                            tags[#tags + 1] = "S"
                            if ScriptHost ~= pid then
                                ScriptHost = pid
                                moist_notify("The script host is now:\n", (isYou and " you " or name) .. "  ")
                                debug_out(string.format("Script Host is Now : " .. (isYou and " you " or name)))
                            end
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
                    if #tags > 0 then
                        name = name .. " [" .. table.concat(tags) .. "]"
                    end
                    if f.name ~= name then f.name = name end
                    for cf_name,cf in pairs(tbl.features) do
                        if (cf.type ~= "toggle" or cf.feat.on) and cf.callback then
                            local status, err = pcall(cf.callback)
                            if not status then
                                moist_notify("Error running feature " .. i .. " on pid " .. pid)
                                print(err)
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
                end
            end
            return HANDLER_CONTINUE
        end
        return HANDLER_POP
    end)
    loopFeat.hidden = true
    loopFeat.on = true
    loopFeat.threaded = false
end
main()
