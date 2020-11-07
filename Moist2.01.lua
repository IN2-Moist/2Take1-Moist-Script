local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
utils.make_dir(rootPath .. "\\Blacklist")
utils.make_dir(rootPath .. "\\lualogs")
utils.make_dir(rootPath .. "\\scripts\\MoistsLUA_cfg")

--DATA FILES
local data = {}
local data2 = {}

local scidFile = rootPath .. "\\Blacklist\\scid.list"
local kickdata = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks.data"
local kickdata2 = rootPath .. "\\scripts\\MoistsLUA_cfg\\Moist_Kicks2.data"
local debugfile = rootPath.."\\lualogs\\Moists_debug.log"


--output functions
local Cur_Date_Time
function get_date_time()

	local d = os.date()

	local dtime = string.match(d, "%d%d:%d%d:%d%d")

	local dt = os.date("%d/%m/%y%y")
	Cur_Date_Time = (string.format("["..dt.."]".."["..dtime.."]"))
end

function debug_out(text)
	get_date_time()

	local file = io.open(rootPath.."\\lualogs\\Moists_debug.log", "a")
	io.output(file)
	io.write("\n"..Cur_Date_Time .."\n")
	io.write(text)
	io.close()
end





local dataload = function()
	if not utils.file_exists(kickdata) then	return end
	for line in io.lines(kickdata) do data[#data + 1] = line end
	moist_notify("Moists Kick Data File 1 Loaded\n",  "Kick Type 1 Now Available")
end

local dataload2 = function()
	if not utils.file_exists(kickdata2) then	return end
	for line in io.lines(kickdata2) do data2[#data2 + 1] = line end
	moist_notify("Moists Kick Data File 2 Loaded\n", "Kick Type 2 Now Available")
end


--Get Offset to self POS
local SelfoffsetPos = v3()

local function Self_offsetPos(pos, heading, distance)
	heading = math.rad((heading - 180) * -1)
	return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset2me(dist)
	local pos = player.get_player_coords(player.player_id())
	print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
	SelfoffsetPos = Self_offsetPos(pos, player.get_player_heading(player.player_id()), dist)
	print(string.format("%s, %s, %s", Self_offsetPos.x, Self_offsetPos.y, Self_offsetPos.z))
end



--Script Settings Set & save
local save_ini = rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini"

local toggle_setting = {}
local setting = {}
toggle_setting[#toggle_setting+1] = "MoistsScript"
setting[toggle_setting[#toggle_setting]] = "2.0"
toggle_setting[#toggle_setting+1] = "PlyTracker.track_all"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "PlyTracker.track_all_HP"
setting[toggle_setting[#toggle_setting]] = false
toggle_setting[#toggle_setting+1] = "OSD.modvehgod_osd"
setting[toggle_setting[#toggle_setting]] = true
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
setting[toggle_setting[#toggle_setting]] = 001
toggle_setting[#toggle_setting+1] = "NotifyVarDefault"
setting[toggle_setting[#toggle_setting]] = 1



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

function saveSettings()

	local save_ini = io.open(save_ini, "w")
	io.output(save_ini)
	for i, k in pairs(toggle_setting) do
		io.write(k.."="..tostring(setting[k]).."\n")
	end
	io.close(save_ini)
end






--Arrays of function variables

local OSD = {}
local PlyTracker = {}
local OptionsVar = {}
local tracking = {}
tracking.playerped_posi = {}
tracking.playerped_speed1 = {}
tracking.playerped_speed2 = {}
tracking.playerped_speed3 = {}
tracking.HP_tracker1 = {}
tracking.HP_tracker2 = {}
tracking.HP_tracker3 = {}
tracking.playercurweapon = {}

--Data & Entity Arrays
local escort = {}
local escortveh = {}
local groupIDs = {}
local allpeds = {}
local allveh = {}
local allobj = {}
local allpickups = {}

local scids = {}
local scidN = 0
local RemoveBlacklistFeature
--Function Variables

local pos_bool
local myplygrp
local plygrp
local Cur_Date_Time
local preset_color = setting["NotifyColorDefault"]
local notifytype = setting["NotifyVarDefault"]
local AnonymousBounty = true
local trigger_time = nil
local cleanup_done = true
local kicklogsent = false
local logsent = false
local spawnoptions_loaded = false
local AnonymousBounty = true


--Modder Flag Variables
local mod_flag_1
local mod_flag_2
local mod_flag_3
local mod_flag_4
local mod_flag_5

--Modder Detection Hooks
local hook_id = 0
local hookID = 01
local hookID1 = 02
local hookID2 = 03
local hookID3 = 04
local hookID4 = 05
local hookID5 = 06
local hookID6 = 07


-- local NoWaypoint = v2()
-- NoWaypoint.x = 16000
-- NoWaypoint.y = 16000




--Util functions
local notif = ui.notify_above_map

local function notify_above_map(msg)
	ui.notify_above_map(tostring("<font size='12'>~l~~y~" ..msg),  "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", 175)
end

function moist_notify(msg1, msg2)

	local color = preset_color
	msg1 = msg1 or "na"
	msg2 = msg2 or "na"

	if notifytype == 1 then
		ui.notify_above_map(string.format("<font size='10'>~h~~r~ " ..msg1 .."<font size='8'>~h~~y~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end
	if notifytype == 2 then
		ui.notify_above_map(string.format("<font size='10'>~h~~l~ " ..msg1 .."<font size='8'>~h~~w~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end

	if notifytype == 3 then
		ui.notify_above_map(string.format("<font size='10'>~h~~y~ " ..msg1 .."<font size='8'>~h~~l~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end
	if notifytype == 4 then
		ui.notify_above_map(string.format("<font size='10'>~h~~w~ " .. msg1 .."<font size='8'>~h~~r~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end

	if notifytype == 5 then
		ui.notify_above_map(string.format("<font size='10'>~h~~l~ " ..msg1 .."<font size='8'>~h~~y~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end
	if notifytype == 6 then
		ui.notify_above_map(string.format("<font size='10'>~h~~w~ " ..msg1 .."<font size='8'>~h~~l~ " .. msg2), "~r~~h~Ω MoistsScript 2.0.1\n~l~~h~Private Edition", color)
	end

end


--Modder Flagging
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


--Preset Data Arrays

local presets = {{"beyond_limits", -173663.281250,915722.000000,362299.750000},{"God Mode Death (Kill Barrier)", -1387.175,-618.242,30.362},{"Ocean God Mode Death\n(Outside Limits Deep Ocean)",  -5784.258301,-8289.385742,-136.411270},{"Chiliad", 491.176,5529.808,777.503},{"Lesters House", 1275.544,-1721.774,53.967},{"arena", -264.297,-1877.562,27.756},{"ElysianIslandBridge", -260.923,-2414.139,124.008},{"LSIAFlightTower", -983.292,-2636.995,89.524},{"TerminalCargoShip", 983.303,-2881.645,21.619},{"ElBurroHeights", 1583.022,-2243.034,93.265},{"CypressFlats", 552.672,-2218.876,68.981},{"LaMesa", 1116.815,-1539.787,52.146},{"SupplyStreet", 777.631,-695.813,28.763},{"Noose", 2438.874,-384.409,92.993},{"TatavianMountains", 2576.999,445.654,108.456},{"PowerStation", 2737.046,1526.873,57.494},{"WindFarm", 2099.765,1766.219,102.698},{"Prison", 1693.473,2652.971,61.335},{"SandyShoresRadioTower", 1847.034,3772.019,33.151},{"AlamoSea", 719.878,4100.993,39.154},{"RebelRadioTower", 744.500,2644.334,44.400},{"GreatChaparral", -291.035,2835.124,55.530},{"ZancudoControlTower", -2361.625,3244.962,97.876},{"NorthChumash(Hookies)", -2205.838,4298.805,48.270},{"AltruistCampRadioTower", -1036.141,4832.858,251.595},{"CassidyCreek", -509.942,4425.454,89.828},{"MountChiliad", 462.795,5602.036,781.400},{"PaletoBayFactory", -125.284,6204.561,40.164},{"GreatOceanHwyCafe", 1576.385,6440.662,24.654},{"MountGordoRadioTower", 2784.536,5994.213,354.275},{"MountGordoLighthouse", 3285.519,5153.820,18.527},{"GrapeSeedWaterTower", 1747.518,4814.711,41.666},{"TatavianMountainsDam", 1625.209,-76.936,166.651},{"VinewoodHillsTheater", 671.748,512.226,133.446},{"VinewoodSignRadioTowerTop", 751.179,1245.13,353.832},{"Hawik", 472.588,-96.376,123.705},{"PacificSrandardBank", 195.464,224.341,143.946},{"WestVinewoodCrane", -690.273,219.728,137.518},{"ArcadiasRadioTower", -170.232,-586.307,200.138},{"HookahPalaceSign",-1.414,-1008.324,89.189},{"MarinaAirportRadioTower",-697.010, -1419.530,5.001},{"DelperoFerrisWheel", -1644.193,-1114.271,13.029},{"VespucciCanalsClockTower", -1238.729,-853.861,77.758},{"DelPeroNrMazebankwest", -1310.777,-428.985,103.465},{"pacifficBluffs", -2254.199,326.088,192.606},{"GWC&GolfingSociety", -1292.052,286.209,69.407},{"Burton", -545.979,-196.251,84.733},{"LosSantosMedicalCenter", 431.907,-1348.709,44.673},{"BanhamCanyon", -3085.451,774.426,20.237},{"TongvaHills", -1874.280,2064.565,150.852},{"SanChianskiMountainRange", 2900.166,4325.987,102.101},{"HumaineLabs", 3537.104,3689.238,45.228},{"YouToolStoreSanChianski", 2761.944,3466.951,55.679},{"GalileoObservatory", -422.917,1133.272,325.855},{"GrndSeroraDesertCementwks", 1236.649,1869.214,84.824}}
local scriptEvents = {0x0fb7b2c5,0x1C2C3329,0x1f63a94e,0x4fbc297f,0x5f21fcaa,0x7b505065,0x7d556776,0x8b37581a,0x11fa24fa,0x073c8336,0x75bf07bc,0x75fc2a5e,0x96b17776,0x110b571b,0x222d2dab,0x231d58ee,0x692CC4BB,0x2073b3d7,0x2429d2da,0x8180e34a,0x13216f21,0x55274b5d,0x134771B8,0x6984116e,0x96308401,0xB54CD3F4,0xC2AD5FCE,0xCB79323D,0xF83B520C,0xaec17e3a,0xb513d7bd,0xba4adc62,0xcb14b6c0,0xe5010210,0xebee9424,0xfdb1f516,}
local escort_ped = {{"juggalo_01", 0xDB134533},{"topless_01", 0x9CF26183},{"juggalo_02", 0x91CA3E2C},{"lester crest", 0xB594F5C3},{"cop", 0x9AB35F63},{"mp_agent14", 0x6DBBFC8B},{"ramp_marine", 0x616C97B9},{"trafficwarden", 0xDE2937F3},{"lestercrest_2", 0x6E42FD26},{"lestercrest", 0x4DA6E849},{"agent14", 0xFBF98469},{"m_pros_01", 0x6C9DD7C9},{"waremech_01", 0xF7A74139},{"weapexp_01", 0x36EA5B09},{"weapwork_01", 0x4186506E},{"securoguard_01", 0xDA2C984E},{"armoured_01", 0xCDEF5408},{"armoured_01", 0x95C76ECD},{"armoured_02", 0x63858A4A},{"marine_01", 0xF2DAA2ED},{"marine_02", 0xF0259D83},{"security_01", 0xD768B228},{"snowcop_01", 0x1AE8BB58},{"prisguard_01", 0x56C96FC6},{"pilot_01", 0xE75B4B1C},{"pilot_02", 0xF63DE8E1},{"blackops_01", 0xB3F3EE34},{"blackops_02", 0x7A05FA59},{"blackops_03", 0x5076A73B},{"hwaycop_01", 0x739B1EF5},{"marine_01", 0x65793043},{"marine_02", 0x58D696FE},{"marine_03", 0x72C0CAD2},{"ranger_01", 0xEF7135AE},{"robber_01", 0xC05E1399},{"sheriff_01", 0xB144F9B9},{"pilot_01", 0xAB300C07},{"swat_01", 0x8D8F1B10},{"fibmugger_01", 0x85B9C668},{"juggernaut_01", 0x90EF5134},{"rsranger_01", 0x3C438CD2},}
local veh_list = {{"buzzard", 0x2F03547B, nil, nil},{"savage", 0xFB133A17, nil, nil},{"seasparrow", 0xD4AE63D9, 10, 1},{"valkyrie2", 0x5BFA5C4B, nil, nil},{"valkyrie", 0xA09E15FD, nil, nil},{"boxville5", 0x28AD20E1, nil, nil},{"apc", 0x2189D250, 10, 0},{"oppressor2", 0x7B54A9D3, 10, 1},{"oppressor", 0x34B82784, 10, 0},{"ruiner2", 0x381E10BD, nil, nil},{"scramjet", 0xD9F0503D, 10, 0},{"stromberg", 0x34DBA661},{"tampa3", 0xB7D9F7F1},{"khanjali", 0xAA6F980A, nil, nil},{"insurgent3", 0x8D4B7A8A, nil, nil},{"insurgent", 0x9114EADA, nil, nil},{"limo2", 0xF92AEC4D, nil, nil},{"mower", 0x6A4BD8F6, nil, nil},{"police2", 0x9F05F101, nil, nil},{"police3", 0x71FA16EA, nil, nil},{"police4", 0x8A63C7B9, nil, nil},{"police", 0x79FBB0C5, nil, nil},{"policeb", 0xFDEFAEC3, nil, nil},{"policeold1", 0xA46462F7, nil, nil},{"policeold2", 0x95F4C618, nil, nil},{"policet", 0x1B38E955, nil, nil},{"polmav", 0x1517D4D9, nil, nil},{"sheriff2", 0x72935408, nil, nil},{"sheriff", 0x9BAA707C, nil, nil},{"phantom2", 0x9DAE1398, nil, nil},{"ruiner3", 0x2E5AFD37, nil, nil},}
local ped_wep = {{"unarmed", 0xA2719263},{"weapon_handcuffs", 0xD04C944D},{"stone_hatchet", 0x3813FC08},{"knife", 0x99B507EA},{"bat", 0x958A4A8F},{"weapon_machinepistol", 0xDB1AA450},	{"raypistol", 0xAF3696A1},{"stungun", 0x3656C8C1},{"raycarbine", 0x476BF15},{"combatmg_mk2", 0xDBBD7280},{"rpg", 0xB1CA77B1},{"railgun", 0x6D544C99},{"minigun", 0x42BF8A85},{"rayminigun", 0xB62D1F6},}
local missions = {"Force to Severe Weather","Force to Half Track","Force to Half Track","Force to Night Shark AAT","Force to Night Shark AAT","Force to APC Mission","Force to APC Mission","Force to MOC Mission","Force to MOC Mission","Force to Tampa Mission","Force to Tampa Mission","Force to Opressor Mission1","Force to Opressor Mission1","Force to Opressor Mission2","Force to Opressor Mission2"}
local BountyPresets = {0,1,42,69,420,666,1000,3000,5000,7000,9000,10000}
local colorindex = {000,001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020,021,022,023,024,025,026,027,028,029,030,031,032,033,034,035,036,037,038,039,040,041,042,043,044,045,046,047,048,049,050,051,052,053,054,055,056,057,058,059,060,061,062,063,064,065,066,067,068,069,070,071,072,073,074,075,076,077,078,079,080,081,082,083,084,085,086,087,088,089,090,091,092,093,094,095,096,097,098,099,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215}
local BountyPresets = {0,1,42,69,420,666,1000,3000,5000,7000,9000,10000}


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


--Feature & Variable Arrays
local globalFeatures = {}
local playerFeatures = {}
playerfeatVars = {} 
playerFeat = {}
playerFeatParent = {}
playerFeatParent2 = {}
playerFeat1 = {}
playerFeat2 = {}
playerFeat3 = {}
playerFeat4 = {}

--local Menu Functions
if  Moist == nil then
	globalFeatures.parent = menu.add_feature("Moists Script 2.0", "parent",0).id
	end
if not  Moist == nil then	
	globalFeatures.parent = Moist
end

--TODO: local Feature Parents
playersFeature = menu.add_feature("Online Players", "parent", globalFeatures.parent)
globalFeatures.lobby = menu.add_feature("Online Session", "parent", globalFeatures.parent).id
globalFeatures.protex = menu.add_feature("Online Protection", "parent", globalFeatures.lobby).id
globalFeatures.kick = menu.add_feature("Session Kicks", "parent", globalFeatures.lobby).id
globalFeatures.parentID = menu.add_feature("Blacklist", "parent", globalFeatures.protex).id
globalFeatures.orbital = menu.add_feature("Orbital Room Block", "parent", globalFeatures.protex).id
globalFeatures.self = menu.add_feature("Player Functions", "parent", globalFeatures.parent).id
globalFeatures.cleanup = menu.add_feature("Clean Shit Up!", "parent", globalFeatures.parent).id
globalFeatures.entity_removal = menu.add_feature("World Cleanup", "parent", globalFeatures.cleanup).id
globalFeatures.self_ped = menu.add_feature("Ped Functions", "parent", globalFeatures.self).id
globalFeatures.self_wep = menu.add_feature("Player Weapons", "parent", globalFeatures.self_ped).id
globalFeatures.self_veh = menu.add_feature("Vehicle Functions", "parent", globalFeatures.self).id
globalFeatures.self_options = menu.add_feature("Player Options", "parent", globalFeatures.self).id
globalFeatures.createdmarkers = menu.add_feature("Markers", "parent", globalFeatures.cleanup).id
globalFeatures.moistopt = menu.add_feature("Options", "parent", globalFeatures.parent).id
globalFeatures.moistMkropt = menu.add_feature("Marker options", "parent", globalFeatures.moistopt).id
globalFeatures.notifyParent = menu.add_feature("Notify Custiomisation", "parent", globalFeatures.moistopt).id

--TODO:online Player Feature Parents
local Player_Tools = menu.add_player_feature("Tools", "parent", 0).id
local BountyId = menu.add_player_feature("Bounty Options", "parent", 0).id
playerfeatVars.fm = menu.add_player_feature("Force Player to Mission", "parent", 0).id


--TODO:Notify settings
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

--save settings			
menu.add_feature("Save settings", "action", globalFeatures.moistopt, function()
                 saveSettings()
                 moist_notify("Settings: ",  "saved!")
             end) 

--TODO Online Functions
--online Menu Functions

spawnoptions_loaded = false
--TODO: Show Spawn option
Show_Spawn_Options = menu.add_feature("Show & Load SpawnOptions", "toggle", globalFeatures.moistopt, function(feat)
                                      if not feat.on then
                                      	setting["showSpawns"] = false
                                      	-- spawnoptions_loaded = false
                                      	return HANDLER_POP
                                      end	
                                      setting["showSpawns"] = true
                                      if not spawnoptions_loaded then
                                      	spawn_parent = menu.add_player_feature("Spawn Options", "parent", 0)
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

local mod_off = menu.add_player_feature("Toggle off Modder Mark", "toggle", Player_Tools, function(feat, pid)
                                        while feat.on do
                                        	if player.is_player_modder(pid, -1) == true
                                        		then
                                        			player.unset_player_as_modder(pid, -1)

                                        		end
                                        		return HANDLER_CONTINUE
                                        	end
                                        	return HANDLER_POP
                                        end) 

local friends_donotmod = menu.add_feature("My Friends DO NOT MOD! MarkOFF", "toggle", globalFeatures.protex, function(feat)
                                          if feat.on then
                                          	-- 
                                          	for i = 0, 32 do

                                          		if player.is_player_friend(i) and player.is_player_modder(i, -1) then	
                                          			player.unset_player_as_modder(i, -1)
                                          		end
                                          	end
                                          	return HANDLER_CONTINUE
                                          end
                                          return HANDLER_POP
                                      end)
friends_donotmod.threaded = false
friends_donotmod.on = false



--TODO:Orbital Room Protection
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
	                                       orb2block = object.create_object(561365155, pos1, true, false)
	                                       entity.set_entity_as_mission_entity(orb2block, true, false)
	                                       entity.set_entity_rotation(orb2block, rot1)
	                                       ui.add_blip_for_entity(orb2block)
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
		                                    damagedsub = object.create_object(3544215092, pos5, true, false)
		                                    entity.set_entity_as_mission_entity(damagedsub, true, false)



		                                    entity.set_entity_rotation(damagedsub, rot5)
		                                    ui.add_blip_for_entity(damagedsub)
		                                    screen1 = object.create_object(2895140982, pos1, true, false)
		                                    entity.set_entity_as_mission_entity(screen1, true, false)



		                                    entity.set_entity_rotation(screen1, rot1)
		                                    ui.add_blip_for_entity(screen1)
		                                    screen2 = object.create_object(2895140982, pos2, true, false)
		                                    entity.set_entity_as_mission_entity(screen2, true, false)
		                                    entity.set_entity_rotation(screen2, rot2)


		                                    ui.add_blip_for_entity(screen2)
		                                    screen3 = object.create_object(-1399826314, pos3, true, true)
		                                    entity.set_entity_as_mission_entity(screen3, true, false)
		                                    entity.set_entity_rotation(screen3, rot3)

		                                    ui.add_blip_for_entity(screen3)
		                                    screen4 = object.create_object(2895140982, pos4, true, false)
		                                    entity.set_entity_as_mission_entity(screen4, true, false)



		                                    entity.set_entity_rotation(screen4, rot4)
		                                    ui.add_blip_for_entity(screen4)
		                                    return HANDLER_POP
		                                end)

--TODO: Modder Detection Protection shit
-- -- **BLACK LIST SHIT**
joining_players_logger = event.add_event_listener("player_join", function(e)
                                                  local pid = e.player
                                                  local scid = player.get_player_scid(pid)
                                                  local name = tostring(player.get_player_name(pid))

                                                  local ip = player.get_player_ip(pid)
                                                  local sip = string.format("%i.%i.%i.%i", (ip >> 24) & 0xff, ((ip >> 16) & 0xff), ((ip >> 8) & 0xff), ip & 0xff)
                                                  joined_data("[Player: "..pid .."]: ".."\n[" ..name..":" .."["..scid.."]]" .."\n[IP: "..ip.."]" .."\n[IPv4: "..sip.. "]")

                                                  return
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

local hookID
local hookID1
local hookID2
local hookID3
local hookID4
local hookID5
local hookID6
local script_hook = 09

local netlog_start = false
function log_net()
	if not net_log.on then
		netlog_start = false
		hook.remove_net_event_hook(hookID6)
		return HANDLER_POP
	end
	if not netlog_start then
		hookID6 = hook.register_net_event_hook(log_neteventHook)



	end
	return HANDLER_CONTINUE
end

function netcheck()
	if neteventlogger.on then
		hookID = hook.register_net_event_hook(neteventHook)
	else
		hook.remove_net_event_hook(hookID)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end

function netcheck1()
	if neteventlogger.on then
		hookID1 = hook.register_net_event_hook(neteventHook1)
	else
		hook.remove_net_event_hook(hookID1)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end

function netcheck2()
	if neteventlogger.on then
		hookID2 = hook.register_net_event_hook(neteventHook2)
	else
		hook.remove_net_event_hook(hookID2)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end

function netcheck3()
	if neteventlogger.on then
		hookID3 = hook.register_net_event_hook(neteventHook3)
	else
		hook.remove_net_event_hook(hookID3)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end

function netcheck4()
	if neteventlogger.on then
		hookID4 = hook.register_net_event_hook(neteventHook4)
	else
		hook.remove_net_event_hook(hookID4)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end

function netcheck5()
	if neteventlogger.on then
		hookID5 = hook.register_net_event_hook(neteventHook5)
	else
		hook.remove_net_event_hook(hookID5)
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end


local scriptlog_pid = menu.add_feature("Log player script events", "value_i", 0, function(feat)

                                       script_check_pid(feat.value_i)
                                       system.wait(100)

                                       return HANDLER_POP
                                   end)
scriptlog_pid.on = false
scriptlog_pid.max_i = 32
scriptlog_pid.min_i = 0
scriptlog_pid.value_i = 0


local params = {}
script_event_hook = function(source, target, params, count)


local player_source = player.get_player_name(source)
local scid = player.get_player_scid(source)
local player_target = player.get_player_name(target)
get_date_time()
scriptlog_out(Cur_Date_Time .."\n[" ..player_source .."[" ..scid .."]] Target:[" ..player_target .."]")

local cnt = 0
for k, v in pairs(params) do 
	scriptlog_out("[P: " .. cnt .. "] = " .."[".. k .."] " ..v)
	cnt = cnt + 1
end

-- system.wait(3000)
return false


end


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


local params = {}
script_event_hook_pid = function(source, target, params, count)


local player_source = player.get_player_name(source)
local scid = player.get_player_scid(source)
local player_target = player.get_player_name(target)
get_date_time()
if source == lastpid_hooked then
	scriptlog_out_pid(Cur_Date_Time .."\n[" ..player_source .."[" ..scid .."]] Target:[" ..player_target .."]", player_source)

	local cnt = 0
	for k, v in pairs(params) do 
		scriptlog_out_pid("[P: " .. cnt .. "] = " .."[".. k .."] " ..v, player_source)
		cnt = cnt + 1
	end
	return false
else
end
-- system.wait(3000)

end


local hook_id = 0
script_check  = function()
if script_check_logger.on == true then
	hook_id	= hook.register_script_event_hook(script_event_hook)
	return HANDLER_POP
end

if hook_id ~= 0 then
	hook.remove_script_event_hook(hook_id)
	hook_id	= 0
end
end


function log_neteventHook(source, target, id)
	local player_source = player.get_player_name(source)
	local player_target = player.get_player_name(target)
	get_date_time()
	netlog_out("\n" .. Cur_Date_Time)
	netlog_out(NetEvents[id])
	netlog_out("from: [" .. source .. "] " .. player_source.. "to: [" .. target .. "] " .. player_target)

	return true
end

function scriptlog_out_pid(text, name)
	if not script_check_logger.on then return end
	get_date_time()
	local playerfile = tostring(name..".log")
	local file = io.open(rootPath .."\\lualogs\\" .. playerfile, "a")
	io.output(file)
	io.write("\n" .. text)
	io.close()
end

function scriptlog_out(text)
	if not script_check_logger.on then return end
	get_date_time()
	local file = io.open(rootPath .. "\\lualogs\\scriptevent_logger.log", "a")
	io.output(file)
	io.write("\n" .. text)
	io.close()
end

function netlog_out(text)
	get_date_time()
	local file = io.open(rootPath .. "\\lualogs\\netevent_logger.log", "a")
	io.output(file)
	io.write("\n" .. text)
	io.close()
end

function neteventHook1(source, target, id)
	local player_source = player.get_player_name(source)

	if id == 10 then
		modder_detected1(source, 10)

		return false
	end
end

function neteventHook2(source, target, id)
	local player_source = player.get_player_name(source)
	if id == 12 then
		modder_detected(source, 12)
	else
		return false
	end
end

function neteventHook3(source, target, id)
	local player_source = player.get_player_name(source)
	if id == 13 then
		modder_detected(source, 13)
	else
		return false
	end
end

function neteventHook4(source, target, id)
	local player_source = player.get_player_name(source)
	if id == 14 then
		modder_detected(source, 14)
	else
		return false
	end
end

function neteventHook5(source, target, id)
	local player_source = player.get_player_name(source)
	if id == 43 then
		modder_detected(source, 43)
	else
		return false
	end
end

function neteventHook(source, target, id)
	local player_source = player.get_player_name(source)
	if id == 78 then
		modder_detected(source, 78)
	else
		return false
	end
end

local count = 0

function modder_detected1(pid, net_id)
	if count < 1 then
		count = count + 1
		local player_source = player.get_player_name(pid)
		player.set_player_as_modder(pid, 1)

		debug_out("NetEvent: " .. net_id .. "[ " .. NetEvents[net_id] .. " ]")
		debug_out("from " .. pid .. "[ " .. player_source .. " ]")

		ui.notify_above_map(string.format("NetEvent: " ..NetEvents[net_id] .. "\nFrom : " ..player_source), "Moists Modder Detection", 024)
	end
end

function modder_detected(pid, net_id)
	local player_source = player.get_player_name(pid)
	player.set_player_as_modder(pid, 1)
	debug_out("NetEvent: " .. net_id .. "[ " .. NetEvents[net_id] .. " ]")
	debug_out("from " .. pid .. "[ " .. player_source .. " ]")


	ui.notify_above_map(string.format("NetEvent: " ..NetEvents[net_id] .. "\nFrom : " ..player_source), "Moists Modder Detection", 024)
end
--TODO:Chat Logger
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

--TODO:Blacklist
local function ValidScid(scid)
	return scid ~= -1 and scid ~= 4294967295
end
local function RemoveScid(scid)
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

local function RemoveScidByPid(pid)
	if pid == player.player_id() then
		return
	end
	local scid = player.get_player_scid(pid)
	if ValidScid(scid) then
		RemoveScid(scid)
	end
end

local function RemoveScidByFeature(f)
	menu.create_thread(RemoveScid, f.data)
end

local function AddScid(scid, name)
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

local function AddScidByPid(pid)
	if pid == player.player_id() then
		return
	end
	local scid = player.get_player_scid(pid)
	if ValidScid(scid) then
		AddScid(scid, player.get_player_name(pid))
	end
end

local function LoadBlacklist()
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

local function KickPid(pid)
	if pid == player.player_id() then
		return
	end
	local name = player.get_player_name(pid)
	if network.network_is_host() then
		network.network_session_kick_player(pid)
		debug_out(string.format("Host kicked " .. pid .. " (" .. name .. ")"))
		print("Host kicked " .. pid .. " (" .. name .. ").")
	else
		for i = 1, #scriptEvents do
			player.set_player_as_modder(pid, mod_flag_2)
			script.trigger_script_event(scriptEvents[i], pid, {0, -1, 0})
			script.trigger_script_event(scriptEvents[i], pid, {-1, 0, -1, -1, 0, -1, 0, -1, -10000, 0})
			script.trigger_script_event(scriptEvents[i], pid, {0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1})

		end
		player.set_player_as_modder(pid, mod_flag_2)
		script.trigger_script_event(150902083, pid, {pid, script.get_global_i(1628237 + (1 + (pid * 615)) + 533)})

		debug_out(string.format("Non-Host kicked " .. pid .. " (" .. name .. ")"))
		print("Non-Host kicked " .. pid .. " (" .. name .. ").")
	end
end

local function MarkPidAsModder(pid)
	if pid == player.player_id() then
		return
	end
	local name = player.get_player_name(pid)
	player.set_player_as_modder(pid, mod_flag_4)
	debug_out(string.format("Marked " .. pid .. " (" .. name .. ") as modder"))
	print("Marked " .. pid .. " (" .. name .. ") as modder.")
end

menu.add_feature("Reload blacklist", "action", globalFeatures.parentID, function()
                 LoadBlacklist()
                 ui.notify_above_map("Loaded blacklist. " .. scidN .. " entries.", "Blacklist", 140)
             end)

local MarkAsModderFeature
local KickFeature


local EnabledBlacklistFeature = menu.add_feature("Enable blacklist", "toggle", globalFeatures.parentID, function(feat)
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
                                             end
                                             )
EnabledBlacklistFeature.on = true

MarkAsModderFeature = menu.add_feature("Mark As Modder", "toggle", globalFeatures.parentID)
MarkAsModderFeature.on = true

KickFeature = menu.add_feature("Kick", "toggle", globalFeatures.parentID)
KickFeature.on = true

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

event.add_event_listener("player_join", function(e)
                         if not EnabledBlacklistFeature.on then
                         	return
                         end
                         local pid = e.player
                         local scid = player.get_player_scid(pid)
                         if ValidScid(scid) and scids[scid] then
                         	local name = player.get_player_name(pid)
                         	ui.notify_above_map(string.format("Black List Player Joining:\n" ..name .."\n" ..scid), "Moists Blacklist", 024)
                         	if MarkAsModderFeature.on then
                         		MarkPidAsModder(pid)
                         	end
                         	if KickFeature.on then
                         		KickPid(pid)
                         	end
                         end
                     end)
LoadBlacklist()

script_event_hook = function(source, target, params, count)

local player_source = player.get_player_name(source)
-- local player_target = player.get_player_name(target)

if params[1] == 0xF83B520C then
	ui.notify_above_map("Fucked off vehicle kick From:\n" ..player_source, "Lua SEP", 6)

	--	debug_out("\n[".. source .."]"..": " ..player_source .. player_target .."\n".." <"..params[1]..">: (Vehicle Kick) ".."\n["..Params.."]: "..count)
	return true
end

return false
end





--TODO:Blacklist Main function
function main()

	test = menu.add_feature("Modder Protex Detect", "parent", globalFeatures.protex, cb)	
	Moists_Modder_Alert = menu.add_feature("Custom SEP", "toggle", test.id, sep)
	Moists_Modder_Alert.on = false
	infoip = menu.add_feature("Log IP INFO", "toggle", test.id)
	infoip.on = false

	neteventlogger = menu.add_feature("Netevent Hook", "toggle", test.id, function(feat)
	                                  netcheck()
	                                  netcheck1()
	                                  netcheck2()
	                                  netcheck3()
	                                  netcheck4()
	                                  netcheck5()
	                                  if feat.on then
	                                  	netevent_timer.on = true
	                                  	return HANDLER_CONTINUE
	                                  end
	                                  netevent_timer.on = false
	                                  return HANDLER_POP
	                              end)		
	neteventlogger.on = false

	netevent_timer = menu.add_feature("Weather Timer", "toggle", test.id, function(feat)

	                                  if feat.on then
	                                  	if count > 0 then
	                                  		system.yield(30000)
	                                  		count = 0
	                                  	end
	                                  	return HANDLER_CONTINUE
	                                  end
	                                  return HANDLER_POP
	                              end)		
	netevent_timer.on = false

	logging = menu.add_feature("Logging Shit", "parent", test.id, cb)

	chat_log = menu.add_feature("Log in Game Chat", "toggle", logging.id, log_chat)
	chat_log.on = true

	net_log = menu.add_feature("Log Netevents to File", "toggle", logging.id, log_net)
	net_log.on = false

	scripteventblocker = menu.add_feature("Block Logged Script Events", "toggle", logging.id, nil)
	scripteventblocker.on = false

	script_check_logger = menu.add_feature("Hook Script Events & Log to File", "toggle", logging.id, script_check)
	script_check_logger.on = false
end
main()



--player Features --Griefing

menu.add_player_feature("CEO BAN", "action", 0, function(feat, pid)

                        script.trigger_script_event(0xC2AD5FCE, pid, {0, 1, 5, 0})
                    end)

menu.add_player_feature("CEO DISMISS", "action", 0, function(feat, pid)
                        script.trigger_script_event(0x96308401, pid, {0, 1, 5})
                    end)

menu.add_player_feature("CEO TERMINATE", "action", 0, function(feat, pid)
                        script.trigger_script_event(0x96308401, pid, {1, 1, 6})
                        script.trigger_script_event(0x96308401, pid, {0, 1, 6, 0})
                    end)

for i = 1, #missions do
	local y = #missions - 1
	menu.add_player_feature("Force to Mission" ..missions[i], "action", playerfeatVars.fm, function(feat, pid)

	                        script.trigger_script_event(0x692CC4BB, pid,{y})
	                    end)
end


local function AddBounty(pid, value, anonymous)
	if not network.is_session_started() then return end
	local npc_bit = anonymous and 1 or 0
	for i = 0, 31 do
		if player.get_player_scid(i) ~= 4294967295 then

					script.trigger_script_event(544453591 , i, {69, pid, 1, value, 0, npc_bit, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1650640 + 9), script.get_global_i(1650640 + 10)})
			
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



--Functions

local global_func = {}

function playervehspd(pid, speed)
	local plyveh
	local pedd = player.get_player_ped(pid)
	plyveh = player.get_player_vehicle(pid)
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



--Self Functions

--Self modifiers --Max Health 0:0 1: 2: 3: 4: 5: 6:
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

	                 local chp
	                 ped.set_ped_max_health(me, HP_modifiers[i][2])
	                 chp = tostring(ped.get_ped_max_health(me))
	                 moist_notify(string.format("Max Health %s Set and filled: \n", chp))
	                 ped.set_ped_max_health(me, HP_modifiers[i][2])
	                 ped.set_ped_health(me, HP_modifiers[i][2])
	                 return HANDLER_POP
	             end)
end



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


global_func.mk1boostrefill = menu.add_feature("Boost Recharge v.2 MK1 Opressor (self)", "toggle", globalFeatures.self_veh, function(feat)
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

global_func.mk2boostrefill = menu.add_feature("MK2 Boost Insta-Recharge (self)", "toggle", globalFeatures.self_veh, function(feat)
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

global_func.veh_rapid_fire = menu.add_feature("MK2 Rapid Fire Missiles (self)", "toggle", globalFeatures.self_veh, function(feat)
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

global_func.rapidfire_hotkey1 = menu.add_feature("mk2 rapid fire hotkey", "toggle", globalFeatures.self_options, function(feat)
                                                 setting["global_func.rapidfire_hotkey1"] = true
                                                 if feat.on then
                                                 	local key = MenuKey()
                                                 	key:push_str("LCONTROL")
                                                 	key:push_str("r")
                                                 	if key:is_down() then
                                                 		mk2_rapid_fire.on = not mk2_rapid_fire.on
                                                 		moist_notify("Switching Rapid Fire %s\n%s for your Current Vehicle", mk2_rapid_fire.on and "ON" or "OFF", mk2_rapid_fire.on and "Glitch On" or "Set Repaired")
                                                 		system.wait(1200)
                                                 	end

                                                 	return HANDLER_CONTINUE
                                                 end
                                                 setting["global_func.rapidfire_hotkey1"] = false
                                                 return HANDLER_POP
                                             end)
global_func.rapidfire_hotkey1.on = setting["global_func.rapidfire_hotkey1"]

local cross_hair = menu.add_feature("Show Weapon Recticle", "toggle", globalFeatures.self_options, function(feat)
if feat.on then

ui.show_hud_component_this_frame(14)
return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
cross_hair.on = false



--Better Randomisation for Math functions
math.randomseed(utils.time_ms())


local function set_waypoint(pos)
	pos = pos or player.get_player_coords(player.player_id())
	if pos.x and pos.y then
		local coord = v2()
		coord.x = pos.x
		coord.y = pos.y
		ui.set_new_waypoint(coord)
	end
end



--TODO: offset to player calculation
local Self_offsetPos = v3()
function OffsetCoords(pos, heading, distance)
	heading = math.rad((heading - 180) * -1)
	return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset(pid, dist)
	local pos = player.get_player_coords(pid)
	print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
	Self_offsetPos = OffsetCoords(pos, player.get_player_heading(pid), dist)

	print(string.format("%s, %s, %s", Self_offsetPos.x, Self_offsetPos.y, Self_offsetPos.z))
	return Self_offsetPos	
end

--TODO: local session functions

blockpassiveall = function()

	local me
	
	me	= player.player_id()

	for i=0,32 do
		if i ~= me
		then
            script.trigger_script_event(0x54BAD868, i, {1, 1})
end
end
end

notmarkall = function()
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


local bountyallplayerses = menu.add_feature("set Bounty on Lobby", "action", globalFeatures.lobby, function(feat)

	for playid = 0, 31 do

if player.get_player_scid(playid) ~= -1 or playid ~= player.player_id() then

 for j = 0, 31 do

		script.trigger_script_event(544453591 , j, {69, playid, 1, 10000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1650640 + 9), script.get_global_i(1650640 + 10)})
end
end

end
end)
bountyallplayerses.threaded = false

local pasivall = menu.add_feature("Block all players Passive", "action", globalFeatures.lobby, function(feat)
blockpassiveall()
end)
pasivall.threaded = false


local bounty_all = menu.add_feature("set Bounty on Lobby", "action", globalFeatures.lobby, function(feat)
	for playid = 0, 31 do
		if player.get_player_scid(playid) ~= -1 or playid ~= player.player_id() then
			for j = 0, 31 do
				script.trigger_script_event(544453591 , j, {69, playid, 1, 10000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1650640 + 9), script.get_global_i(1650640 + 10)})
			end
		end
	end
end)
bounty_all.threaded = false

--TODO: Remove from Public
local NetBail_SHF_Kick = menu.add_feature("NetBail ScriptHost Fuckarino", "toggle", globalFeatures.kick, function(feat)
	if feat.on then
		
		local me = player.player_id()
		for i = 0, 32 do
		local fnd = player.is_player_friend(i)
			if i ~= me or fnd then
				script.trigger_script_event(-1153500935, i, {91645, -99683, 1788, 60877, 55085, 72028})
				script.trigger_script_event(150902083, i, {i, script.get_global_i(1628237 + (1 + (i * 615)) + 533)})
			end
		end
	return HANDLER_CONTINUE
	end
		return HANDLER_POP
end)

local netbailkick = menu.add_feature("Network Bail Kick", "toggle", globalFeatures.kick, function(feat)
	if feat.on then
		
		local me = player.player_id()		
		for i = 0, 32 do
		local fnd = player.is_player_friend(i)
			if i ~= me or fnd then
				script.trigger_script_event(150902083, i, {i, script.get_global_i(1628237 + (1 + (i * 615)) + 533)})
			end
		end
	return HANDLER_CONTINUE
	end
	return HANDLER_POP		
end)

local function hostkickall()
	
	local me = player.player_id()
	if network.network_is_host() then
		for i = 0, 32 do
		local fnd = player.is_player_friend(i)
			if i ~= me or fnd then

				network.network_session_kick_player(i)
			end
		end
		else            
		notify_above_map("You are not Session-Host!")
end
end

local hostkick = menu.add_feature("Host Kick All", "toggle", globalFeatures.kick, function(feat)
	if feat.on then
		hostkickall()
		return HANDLER_CONTINUE
	end
	return HANDLER_POP	
end)


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
all_mod.threaded = false
all_mod.on = false





--TODO: World Cleanup stuff
local cleanup_done = true

clear_World_ent = menu.add_feature("Fetched World Entities Move & Delete", "action", globalFeatures.entity_removal, function(feat)
                                   if not cleanup_done == true then return end
                                   cleanup_done = false

                                   moist_notify("Trying to Removal All Cunts in the World\n", "Cleanup Functions\nWill not run until Done!")
                                   get_everything()
                                   system.wait(500)
                                   clear_world()
                                   moist_notify("Cunt Removal End\n", "Your the only Cunt Remaining\nCleanups Enabled")

                               end)

Force_clear_all = menu.add_feature("Force Removal (Missed Anything?)", "action", globalFeatures.entity_removal, function(feat)
                                   if not cleanup_done == true then return end
                                   cleanup_done = false

                                   moist_notify("Force Removal of Remaining Cunts Run 1 Started:", " ")
                                   moist_notify("Cleanup Functions Will not Run until Done!")

                                   force_delete2()

                                   system.wait(250)

                                   moist_notify("Force Removal of\nRemaining Cunts\n Run 2 Started:\n", "Please Be Patient!")

                                   force_delete2()
                                   moist_notify("Cunt Force End\n", "Remiaining Cunts Should be gone\nCleanups Enabled" )


                               end)

local clear_peds = menu.add_feature("Fetch all Peds Move & Delete", "action", globalFeatures.entity_removal, function(feat)
                                    if not cleanup_done == true then return end
                                    cleanup_done = false


                                    moist_notify("Removal of Cunts Started:\n", "Cleanup Functions Will not run\nuntil Done!")



                                    get_allpeds()
                                    system.wait(250)
                                    move_delete_peds()
                                    moist_notify("Cunts Cleared: \n", "Ped Cleanup Complete\nCleanups Enabled Again")
                                end)


local fetch_obj = menu.add_feature("Fetch all objects Move & Delete", "action", globalFeatures.entity_removal, function(feat)
                                   if not cleanup_done == true then return end
                                   cleanup_done = false

                                   moist_notify("Cunt Cleaning Started: \n", "Cleanup Functions\nWill not run until Done!")
                                   get_allobj()
                                   system.wait(250)
                                   move_delete_obj()
                                   moist_notify("Fucked off Cunt Objects: \n", "Cleanup Complete\nCleanups Enabled Again")
                               end)

local fetch_veh = menu.add_feature("Fetch all Vehicles Move & Delete", "action", globalFeatures.entity_removal, function(feat)
                                   if not cleanup_done == true then return end
                                   cleanup_done = false
                                   moist_notify("Cunt Cleanup Started:\n", "Cleanup Functions\nWill not run until Done!")
                                   get_allveh()
                                   system.wait(250)
                                   move_delete_veh()
                                   moist_notify("Cunt Cleanup Done: \n", "Vehicle Cleanup complete\nCleanups Enabled")
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

clear_world = function()
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
		network.request_control_of_entity(allveh[i])
		entity.set_entity_coords_no_offset(allveh[i], pos)
		entity.set_entity_as_no_longer_needed(allveh[i])
		entity.delete_entity(allveh[i])
		system.wait(25)
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
		if not #allveh == nil or 0 then
			network.request_control_of_entity(allveh[i])
			entity.set_entity_coords_no_offset(allveh[i], pos)
			entity.set_entity_as_no_longer_needed(allveh[i])
			entity.delete_entity(allveh[i])
			system.wait(25)
		end
	end
	cleanup_done = true
	return HANDLER_POP

end




force_delete2 = function()
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
			return
		end
		network.request_control_of_entity(allveh[i])
		entity.set_entity_coords_no_offset(allveh[i], pos)
		entity.set_entity_as_no_longer_needed(allveh[i])
		entity.delete_entity(allveh[i])
		system.wait(100)
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
cleanup_done = true
return HANDLER_POP
end



world_force = menu.add_feature("Apply force to world entities", "action", globalFeatures.lobby, function(feat)
                               get_everything()
                               system.wait(100)
                               local vel = v3()
                               vel.x = math.random(1000.0, 10000.0)
                               vel.y = math.random(1000.0, 10000.0)
                               vel.z = math.random(100.0, 750.0)

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
                               		entity.set_entity_velocity(allveh[y], vel)
                               	end
                               end

                               for x = 1, #allobj do
                               	entity.freeze_entity(allobj[x], false)
                               	entity.set_entity_velocity(allobj[x], vel)
                               end
                           end)


dump_onplayer = function(pid, pos)
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
	network.request_control_of_entity(allpickups[i])
	entity.set_entity_coords_no_offset(allpickups[i], pos)
	entity.set_entity_as_no_longer_needed(allpickups[i])
	-- entity.delete_entity(allpickups[i])
end
system.wait(400)
for i = 1, #allobj do
	network.request_control_of_entity(allobj[i])
	entity.set_entity_coords_no_offset(allobj[i], pos)
	entity.set_entity_as_no_longer_needed(allobj[i])
	-- entity.delete_entity(allobj[i])
end
system.wait(400)
for i = 1, #allveh do
	network.request_control_of_entity(allveh[i])
	entity.set_entity_coords_no_offset(allveh[i], pos)
	entity.set_entity_as_no_longer_needed(allveh[i])
	-- entity.delete_entity(allveh[i])
end
system.wait(400)
for i = 1, #allpeds do
	if not ped.is_ped_a_player(allpeds[i]) then
		network.request_control_of_entity(allpeds[i])
		entity.set_entity_coords_no_offset(allpeds[i], pos)
		entity.set_entity_as_no_longer_needed(allpeds[i])
		-- entity.delete_entity(allpeds[i])
	end
	system.wait(400)
end
moist_notify("World Dumped On That Cunt!\n GG <font size='18'>~ex_r*~ ", "\nCarefull Spectating")
end

--TODO: Ped Spawn functions
--Spawn Functions

--spawn variables defaults setup
model = 0xDB134533
vehhash = 788747387
wephash = 0xA2719263
local mod
local modvalue
local pedspawns



local function spawn_ped(pid, pedhash, offdist, attack)
	local hash = pedhash
	plygrp =  player.get_player_group(pid)
	local pedp = player.get_player_ped(pid)
	local pos = player.get_player_coords(pid)
	local offset = v3()
	local offset2 = v3()

	local headtype = math.random(0, 2)

	offset = get_offset(pid, offdist)


	streaming.request_model(hash)
	while not streaming.has_model_loaded(hash) do

		system.wait(10)
	end
	local p = #escort + 1
	print(hash)

	escort[p] = ped.create_ped(26, hash, offset, 0, true, false)
	print(escort[p])		
	entity.set_entity_god_mode(escort[p], true)
	ui.add_blip_for_entity(escort[p])
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
	ped.set_ped_can_switch_weapons(escort[p], true)

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

local function spawn_ped_v2(pid, pedhash, attack)
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
	-- offset = Self_offsetPos
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

	escort[p] = ped.create_ped(26, hash, pos + offset, 0, true, false)
	print(escort[p])		
	entity.set_entity_god_mode(escort[p], true)
	ui.add_blip_for_entity(escort[p])
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


local function spawn_veh(pid, vehhash, offdist, mod, modvalue)
	local hash = vehhash

	local pos = player.get_player_coords(pid)
	pos.x = pos.x + 10
	pos.y = pos.y + 10
	local offset = v3()
	offset = get_offset(pid, -20)

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
	streaming.set_model_as_no_longer_needed(hash)

end

--Spawn Cleanups

ped_cleanup = menu.add_feature("Delete Ped Spawns", "action", globalFeatures.cleanup, function(feat)

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

Freeze_obj = menu.add_feature("Freeze World Objects in place", "action", globalFeatures.cleanup, function(feat)

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
                          --    for i = 1, #allveh do
                          --    	network.request_control_of_entity(allveh[i])
									--entity.freeze_entity(allveh[i], false)
                              --	entity.set_entity_coords_no_offset(allveh[i], pos)
                         --     	entity.freeze_entity(allveh[i], true)
                              	--entity.set_entity_as_no_longer_needed(allveh[i])
                              	-- entity.delete_entity(allveh[i])
                           --   end
                          end)


pedveh_cleanup = menu.add_feature("Delete Ped Spawns + Vehicles", "action", globalFeatures.cleanup, function(feat)
                                  if #escort == 0 or nil then return end
                                  local pos = v3()
                                  pos.x = presets[1][2]
                                  pos.y = presets[1][3]
                                  pos.z = presets[1][4]

                                  for i = 1, #escort do

                                  	ped.clear_ped_tasks_immediately(escort[i])


                                  	entity.set_entity_coords_no_offset(escort[i], pos)

                                  	entity.set_entity_as_no_longer_needed(escort[i])
                                  	entity.delete_entity(escort[i])
                                  end
                                  if #escortveh == 0 or nil then return end
                                  for y = 1, #escortveh do

                                  	ped.clear_ped_tasks_immediately(escortveh[y])
                                  	entity.detach_entity(escortveh[y])

                                  	entity.set_entity_coords_no_offset(escortveh[y], pos)

                                  	entity.set_entity_as_no_longer_needed(escortveh[y])
                                  	entity.delete_entity(escortveh[y])
                                  end

                              end)



dumpfreeze_onplayer = function(pid, pos)
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
	network.request_control_of_entity(allpickups[i])
	entity.freeze_entity(allpickups[i], false)
	entity.set_entity_coords_no_offset(allpickups[i], pos)
	entity.freeze_entity(allpickups[i], true)
	--entity.set_entity_as_no_longer_needed(allpickups[i])
	-- entity.delete_entity(allpickups[i])
end
system.wait(400)
for i = 1, #allobj do
	entity.freeze_entity(allobj[i], false)
	network.request_control_of_entity(allobj[i])
	entity.set_entity_coords_no_offset(allobj[i], pos)
	entity.freeze_entity(allobj[i], true)
	--entity.set_entity_as_no_longer_needed(allobj[i])
	-- entity.delete_entity(allobj[i])
end
system.wait(400)
for i = 1, #allveh do
	network.request_control_of_entity(allveh[i])
	entity.freeze_entity(allveh[i], false)
	entity.set_entity_coords_no_offset(allveh[i], pos)
	entity.freeze_entity(allveh[i], true)
	--entity.set_entity_as_no_longer_needed(allveh[i])
	-- entity.delete_entity(allveh[i])
end
system.wait(400)
for i = 1, #allpeds do
	if not ped.is_ped_a_player(allpeds[i]) then
		entity.freeze_entity(allpeds[i], false)
		network.request_control_of_entity(allpeds[i])
		entity.set_entity_coords_no_offset(allpeds[i], pos)
		entity.freeze_entity(allpeds[i], true)
		--entity.set_entity_as_no_longer_needed(allpeds[i])
		-- entity.delete_entity(allpeds[i])
	end
	system.wait(400)
end
moist_notify("World Dumped On That Cunt!\n GG <font size='18'>~ex_r*~ ", "\nCarefull Spectating")
end




--Option Functions
local entity_control

--[[
21	INPUT_SPRINT	LEFT SHIFT			A
22	INPUT_JUMP		SPACEBAR			X
24	INPUT_ATTACK	LEFT MOUSE BUTTON	RT
25	INPUT_AIM		RIGHT MOUSE BUTTON	LT
]]

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
                                          				moist_notify("RIP CUNT DETONATING REMOTE BOMB!!", "\nFUCK YOU & GG ~ex_r*~")
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


PlyTracker.track_all = menu.add_feature("Track all Players POS", "toggle", globalFeatures.moistopt, function(feat)
                                        setting["PlyTracker.track_all"] = true
                                        if feat.on then

                                        	for i = 0, 32 do
                                        		local y = i + 1
                                        		local offset = v3()

                                        		pos_bool, tracking.playerped_posi[y] = ped.get_ped_bone_coords(player.get_player_ped(i), 31086, offset)
                                        		local ent
                                        		local ent1 = player.get_player_ped(i)	
                                        		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(i))

                                        		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
                                        		local speed = entity.get_entity_speed(ent)
                                        		local speedcalc = speed * 3.6 --kmph
                                        		local speedcalc2 =  speed * 2.236936 --mph
                                        		tracking.playerped_speed1[y] = math.ceil(speedcalc)
                                        		tracking.playerped_speed2[y] = math.ceil(speedcalc2)
                                        		tracking.playerped_speed3[y] = speed
                                        	end
                                        	return HANDLER_CONTINUE
                                        end
                                        setting["PlyTracker.track_all"] = false
                                        return HANDLER_POP
                                    end)
PlyTracker.track_all.on = setting["PlyTracker.track_all"]

PlyTracker.track_all_HP = menu.add_feature("Track all Players HP", "toggle", globalFeatures.moistopt, function(feat)
                                           setting["PlyTracker.track_all_HP"] = true
                                           if feat.on then
                                           	for i = 0, 32 do
                                           		local y = i + 1

                                           		tracking.HP_tracker1[y] = player.get_player_health(i)
                                           		tracking.HP_tracker2[y] = player.get_player_max_health(i)
                                           		tracking.HP_tracker3[y] = player.get_player_armour(i)
                                           		tracking.playercurweapon[y] = ped.get_current_ped_weapon(player.get_player_ped(i))
                                           	end
                                           	return HANDLER_CONTINUE
                                           end
                                           setting["PlyTracker.track_all_HP"] = false
                                           return HANDLER_POP

                                       end)
PlyTracker.track_all_HP.on = setting["PlyTracker.track_all_HP"]

OSD.modvehgod_osd = menu.add_feature("Vehicle God OSD", "toggle", globalFeatures.moistopt, function(feat)
                                     setting["OSD.modvehgod_osd"] = true
                                     if feat.on then
                                     	local pos = v2()
                                     	pos.x = 0.001
                                     	pos.y = .0255

                                     	for i = 0, 32 do
                                     		pos.x = 0.001
                                     		if player.is_player_vehicle_god(i) then
                                     			ui.set_text_scale(0.235)
                                     			ui.set_text_font(0)
                                     			ui.set_text_color(255, 255, 255, 255)
                                     			ui.set_text_centre(false)
                                     			ui.set_text_outline(true)
                                     			ui.draw_text("vehgod: ", pos)

                                     			pos.x = 0.025

                                     			name = player.get_player_name(i)
                                     			ui.set_text_scale(0.235)
                                     			ui.set_text_font(0)
                                     			ui.set_text_color(255, 255, 0, 255)
                                     			ui.set_text_centre(false)
                                     			ui.set_text_outline(true)
                                     			local Plyname = tostring(player.get_player_name(i))
                                     			ui.draw_text(Plyname, pos)
                                     		end
                                     		pos.y = pos.y + 0.040
                                     	end

                                     	return HANDLER_CONTINUE
                                     end
                                     setting["OSD.modvehgod_osd"] = false
                                     return HANDLER_POP
                                 end)
OSD.modvehgod_osd.on = setting["OSD.modvehgod_osd"]

OSD.modvehspeed_osd = menu.add_feature("Modded Vehicle Speed OSD", "toggle", globalFeatures.moistopt, function(feat)
                                       setting["OSD.modvehspeed_osd"] = true
                                       if feat.on then
                                       	local pos = v2()
                                       	pos.x = 0.001
                                       	pos.y = .003

                                       	local name
                                       	for i = 0, 32 do
                                       		if player.get_player_ped(i) ~= 0 then
                                       			pos.x = 0.001

                                       			if tracking.playerped_speed1[i + 1] > 275 then
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

OSD.Player_bar = menu.add_feature("Player Bar OSD", "toggle", globalFeatures.moistopt, function(feat)
                                  setting["OSD.Player_bar"] = true
                                  if feat.on then
                                  	ui.draw_rect(0.001, 0.990, 2.5, 0.065, 0, 0, 0, 255)
                                  	local pos = v2()

                                  	pos.x = 0.001
                                  	pos.y = .960

                                  	for i = 0, 32 do
                                  		if player.get_player_ped(i) ~= 0 then
                                  			local name = player.get_player_name(i)

                                  			local playercolor = {{255, 255, 255}, {255, 0, 0}, {255, 0, 255}, {0, 255, 255}}
                                  			ui.set_text_color(playercolor[1][1], playercolor[1][2], playercolor[1][3], 255)

                                  			if player.is_player_god(i) then
                                  				ui.set_text_color(playercolor[2][1], playercolor[2][2], playercolor[2][3], 255)
                                  			end
                                  			if player.is_player_god(i) and player.is_player_vehicle_god(i) then
                                  				ui.set_text_color(playercolor[4][1], playercolor[4][2], playercolor[4][3], 255)
                                  			end
                                  			if player.is_player_vehicle_god(i) then
                                  				ui.set_text_color(playercolor[3][1], playercolor[3][2], playercolor[3][3], 255)
                                  			end

                                  			if pos.x > 0.90 then
                                  				pos.y = .970
                                  				pos.x = 0.001
                                  			else
                                  			end
                                  			ui.set_text_scale(0.2)
                                  			ui.set_text_font(0)

                                  			ui.set_text_centre(false)
                                  			ui.set_text_outline(true)

                                  			ui.draw_text("< " .. name .. " >", pos)

                                  			pos.x = pos.x + 0.055
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

                                     	local osd_Cur_Date = (string.format(dt))
                                     	pos.x = .50082
                                     	pos.y = .00000025
                                     	ui.set_text_scale(0.4009)
                                     	ui.set_text_font(5)
                                     	ui.set_text_color(0, 0, 0, 255)
                                     	ui.set_text_centre(1)
                                     	ui.set_text_outline(1)
                                     	ui.draw_text(osd_Cur_Date, pos)
                                     	pos.x = .5
                                     	pos.y = .00000025
                                     	ui.set_text_scale(0.4002)
                                     	ui.set_text_font(5)
                                     	ui.set_text_color(255, 255, 255, 255)
                                     	ui.set_text_centre(1)
                                     	ui.set_text_outline(1)
                                     	ui.draw_text(osd_Cur_Date, pos)
                                     	pos.x = .50085
                                     	pos.y = .02

                                     	local d = os.date()

                                     	local dtime = string.match(d, "%d%d:%d%d:%d%d")

                                     	local dt = os.date("%d/%m/%y%y")

                                     	local osd_Cur_Time = (string.format(dtime))
                                     	ui.set_text_scale(0.45)
                                     	ui.set_text_font(0)
                                     	ui.set_text_color(0, 0, 0, 255)
                                     	ui.set_text_centre(1)
                                     	ui.set_text_outline(1)
                                     	ui.draw_text(osd_Cur_Time, pos)
                                     	pos.x = .5
                                     	pos.y = .02

                                     	local d = os.date()

                                     	local dtime = string.match(d, "%d%d:%d%d:%d%d")

                                     	local dt = os.date("%d/%m/%y%y")

                                     	local osd_Cur_Time = (string.format(dtime))
                                     	ui.set_text_scale(0.45)
                                     	ui.set_text_font(0)
                                     	ui.set_text_color(255, 255, 255, 255)
                                     	ui.set_text_centre(1)
                                     	ui.set_text_outline(1)
                                     	ui.draw_text(osd_Cur_Time, pos)

                                     	return HANDLER_CONTINUE
                                     end
                                     setting["osd_date_time"] = false
                                     return HANDLER_POP

                                 end)
OSD.date_time_OSD.on = setting["osd_date_time"]

local function give_weapon()
	for i = 1, #ped_wep do
		menu.add_feature("Weapon: " ..ped_wep[i][1], "action", globalFeatures.self_wep, function(feat)
		                 local pped = player.get_player_ped(player.player_id())
		                 weapon.give_delayed_weapon_to_ped(pped, ped_wep[i][2], 0, 1)
		             end)
	end
end
give_weapon()


--TODO: Markers	
-- **MARKERS**
pid_pos = {}
thread = {}
feat = {}
del_mk = {}
del_mk_done = false
BobUPnDown = true
ROTMRK = true
mkidbool = {}
local size_marker = 1.0
local marker_type = 0
local mk_id
local offsetz_marker = 1.5

function pos_pid(pid)

	pid_pos[pid+1] = player.get_player_coords(pid)
end

local m_id	
m_id = 0

marker_thread = function(context)
while true do
	local pos = v2()
	local size = v2()
	local playerID = pid

	graphics.draw_marker(0, context.coord, v3(), v3(), v3(1.5), 255, 0, 0, 255, BobUPnDown, true, 2, ROTMRK, nil, nil, false)
	system.wait(0)
end
end


local RGB = {255,0}
local changeR = 255
local changeG = 0
local changeB = 0
local changeA = 255
local RGBA_R = 255
local RGBA_G = 255
local RGBA_B = 255
local RGBA_A = 255

changRGB = menu.add_feature("fading red white Marker RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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


chang_RGBA = menu.add_feature("flash red white Marker RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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

changRGBA = menu.add_feature("multi fading colors Marker RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)
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

changeRGB = menu.add_feature("Above Marker RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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


change_RGBA = menu.add_feature("Marker RGB Changer", "toggle", globalFeatures.moistMkropt, function(feat)

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


changeRGBA = menu.add_feature("Ground Marker RGBA Changer", "toggle", globalFeatures.moistMkropt, function(feat)
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

size_marker = 1.0
marker_type = 0
local mk_id
offsetz_marker = 1.5

marker_pos_thread = function(context)
while true do
	local pos = v2()
	local size = v2()
	local offset = v3()
	local pid = context.pid
	local coord = tracking.playerped_posi[pid+1]
	local update = context.CTRL_ID

	if mkidbool[update] == true then
		x = marker_type
		size = size_marker
		offset.x = 0.0
		offset.y = 0.0
		offset.z = offsetz_marker
	else
		size = context.size
		x = context.x
		offset.x = 0.0
		offset.y = 0.0
		offset.z = context.z
	end
	graphics.draw_marker(x, coord + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

	system.wait(0)

end	
end

marker_pos1_thread = function(context)
while true do
	local pos = v2()
	local size = v2()
	local offset = v3()
	local pid = context.pid
	local coord = tracking.playerped_posi[pid+1]		
	local update = context.CTRL_ID

	if mkidbool[update] == true then
		x = marker_type
		size = size_marker
		offset.x = 0.0
		offset.y = 0.0
		offset.z = offsetz_marker
	else
		size = context.size
		x = context.x
		offset.x = 0.0
		offset.y = 0.0
		offset.z = context.z
	end

	graphics.draw_marker(x, coord + offset, v3(), v3(), v3(size), RGBA_R, RGBA_G, RGBA_B, RGBA_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

	system.wait(0)

end
end

RGB_A_A = 255
RGB_A_R = 255
RGB_A_G = 255
RGB_A_B = 255



marker1_pos_thread = function(context)
while true do
	pos = v2()
	size = v2()
	offset = v3()
	pid = context.pid
	coord = tracking.playerped_posi[pid+1]		
	update = context.CTRL_ID

	if mkidbool[update] == true then
		x = marker_type
		size = size_marker
		offset.x = 0.0
		offset.y = 0.0
		offset.z = offsetz_marker
	else
		size = context.size
		x = context.x
		offset.x = 0.0
		offset.y = 0.0
		offset.z = context.z
	end
	graphics.draw_marker(x, coord + offset, v3(), v3(), v3(size), RGB_A_R, RGB_A_G, RGB_A_B, RGB_A_A,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

	system.wait(0)
end
end
runs = 0

local rgb_rand = menu.add_feature("rand rgb on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
                                  if feat.on then		

                                  	RGB_A_G = math.random(0, 255)

                                  	system.wait(feat.value_i)

                                  	RGB_A_R = math.random(0, 255)

                                  	system.wait(feat.value_i)


                                  	RGB_A_B = math.random(0, 255)

                                  	system.wait(feat.value_i)

                                  	return HANDLER_CONTINUE
                                  end
                              end)
rgb_rand.on = false
rgb_rand.max_i = 500
rgb_rand.min_i = 1
rgb_rand.value_i = 5

local rgb_rand1 = menu.add_feature("rand rgb on (delay)", "value_i", globalFeatures.moistMkropt, function(feat)
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


marker1_rgb_thread = function(context)
while true do
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

end

local marker1_pos1_thread = function(context)

	local pos = v2()
	local size = v2()
	local offset = v3()
	local pid = context.pid
	local coord = tracking.playerped_posi[pid+1]		
	local update = context.CTRL_ID
	local size = context.size
	local x = context.x
	offset.x = 0.0
	offset.y = 0.0
	offset.z = context.z

	while true do

		if mkidbool[update] == true then
			x = marker_type
			size = size_marker
			offset.x = 0.0
			offset.y = 0.0
			offset.z = offsetz_marker
		else
			size = context.size
			x = context.x
			offset.x = 0.0
			offset.y = 0.0
			offset.z = context.z

			graphics.draw_marker(x, coord + offset, v3(), v3(), v3(size), changeR, changeG, changeB, changeA,  BobUPnDown, true, 2, ROTMRK, nil, nil, false)

			system.wait(0)

		end
		return
	end
end

local delete_marker = function(feat, data)
	menu.delete_thread(feat.data.thread)
	menu.create_thread(function(id) menu.delete_feature(id) end, feat.id)
end



local function marker1(pid, controlID)
	if del_mk[pid+1] == nil then
		del_mk[pid+1] = menu.add_feature("Markers to Delete", "parent", playerFeatures[pid].feat.id, cb)
	end
	local player_id = pid
	local ctrlID = controlID
	size = size_marker
	offset = offsetz_marker
	mk_id = marker_type
	local name =  player.get_player_name(pid)
	local coord = tracking.playerped_posi[pid+1]
	local y = #thread + 1
	thread[y] = menu.create_thread(marker1_pos1_thread, { pid = player_id, CTRL_ID = ctrlID, size = size, z = offset, x = marker_type } )

	local i = #feat + 1
	feat[i] = menu.add_feature("Delete:".. i .." " ..name, "action",  del_mk[pid+1].id, delete_marker)
	feat[i].data = {thread = thread[y]}
end



local function marker_pos1(pid, controlID)
	if del_mk[pid+1] == nil then
		del_mk[pid+1] = menu.add_feature("Markers to Delete", "parent", playerFeatures[pid].feat.id, cb)
	end
	local player_id = pid
	local ctrlID = controlID
	size = size_marker
	offset = offsetz_marker 
	mk_id = marker_type
	rgb_rand.on = true
	local name =  player.get_player_name(pid)
	local coord = tracking.playerped_posi[pid+1]
	local y = #thread + 1
	thread[y] = menu.create_thread(marker1_pos_thread, { pid = player_id, CTRL_ID = ctrlID, size = size, z = offset, x = marker_type } )
	local i = #feat + 1
	feat[i] = menu.add_feature("Delete:".. i .." " ..name, "action",  del_mk[pid+1].id, delete_marker)
	feat[i].data = {thread = thread[y]}

end


local function marker(pid, controlID)
	local pid1 = pid + 1
	if del_mk[pid+1] == nil then
		del_mk[pid+1] = menu.add_feature("Markers to Delete", "parent", playerFeatures[pid].feat.id, cb)
	end
	local player_id = pid
	local ctrlID = controlID
	size = size_marker
	offset = offsetz_marker
	marker_type = mk_id
	local name =  player.get_player_name(pid)
	local coord = tracking.playerped_posi[pid+1]
	local y = #thread + 1
	thread[y] = menu.create_thread(marker_pos1_thread, { pid = player_id, CTRL_ID = ctrlID, size = size, z = offset, x = marker_type } )

	local i = #feat + 1
	feat[i] = menu.add_feature("Delete:".. i .." " ..name, "action", del_mk[pid+1].id, delete_marker)
	feat[i].data = {thread = thread[y]}

end

local function marker_pos(pid, controlID)
	if del_mk[pid+1] == nil then
		del_mk[pid+1] = menu.add_feature("Markers to Delete", "parent", playerFeatures[pid].feat.id, cb)
	end
	local player_id = pid
	local ctrlID = controlID
	size = size_marker
	offset = offsetz_marker
	marker_type = mk_id
	local name =  player.get_player_name(pid)
	local coord = tracking.playerped_posi[pid+1]
	local y = #thread + 1
	thread[y] = menu.create_thread(marker_pos_thread, { pid = player_id, CTRL_ID = ctrlID, CTRL_ID = ctrlID, size = size, z = offset, x = marker_type } )
	local i = #feat + 1
	feat[i] = menu.add_feature("Delete:".. i .." " ..name, "action", del_mk[pid+1].id, delete_marker)
	feat[i].data = {thread = thread[y]}
end

--TODO: Marks on all
Markers_forall = menu.add_feature("Add Markers for all Size", "action", globalFeatures.lobby, function(feat)

                                  for i = 0, 32 do
                                  	if player.get_player_ped(i) ~= 0 then
                                  		if i ~= player.player_id() then
                                  			mk_id = 0
                                  			offsetz_marker = 1.5
                                  			size_marker = 1.0
                                  			local y = #mkidbool + 1

                                  			marker_pos(i, y)
                                  			-- marker(pid)
                                  			change_RGBA.on = true
                                  			changRGB.on = true
                                  		end
                                  	end
                                  end
                              end)



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

		                        spawn_ped(pid, model, -15, true)

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

		                        spawn_ped(pid, model, 5, false)

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
		                        spawn_ped(pid, model, 10, false)
		                        local groupIDs = {}
		                        local i = #groupIDs + 1
		                        groupIDs[i] = ped.create_group()
		                        local y = #groupIDs + 1
		                        groupIDs[y] = ped.create_group()
		                        ped.set_relationship_between_groups(0, groupIDs[i], groupIDs[y])
		                        ped.set_relationship_between_groups(0, groupIDs[y], groupIDs[i])
		                        system.wait(100)
		                        spawn_veh(pid, vehhash, -20, mod, modvalue)
		                        system.wait(100)
		                        local p = #escort
		                        local y = #escortveh
		                        ped.set_ped_as_group_member(escort[p], groupIDs[i])
		                        ped.set_ped_never_leaves_group(escort[p], true)

		                        ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
		                        local pped = player.get_player_ped(pid)
		                        ai.task_vehicle_follow(escort[p], escortveh[y], pped, 250.00, 262144, 25)

		                        if vehhash == 0x2189D250 then
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 0)
		                        end
		                        if vehhash == 0xF92AEC4D then
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 3)
		                        end
		                        if vehhash == 0xA09E15FD then
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
		                        end
		                        if vehhash == 0x5BFA5C4B then
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)

		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
		                        end
		                        if vehhash == 0x9114EADA then
		                        	spawn_ped(pid, model, 10, false)
		                        	local x = #escort
		                        	ped.set_ped_as_group_member(escort[x], groupIDs[i])
		                        	ped.set_ped_never_leaves_group(escort[x], true)
		                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
		                        end
		                        if vehhash == 0x8D4B7A8A then
		                        	spawn_ped(pid, model, 10, false)
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
	                        spawn_ped(pid, model, 10, true)
	                        system.wait(100)
	                        spawn_veh(pid, vehhash, -20, mod, modvalue)
	                        local p = #escort
	                        local y = #escortveh

	                        ped.set_ped_into_vehicle(escort[p], escortveh[y], -1)
	                        ai.task_combat_ped(escort[p], pped, 0, 16)

	                        if vehhash == 0x2189D250 then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 0)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end
	                        if vehhash == 0xF92AEC4D then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 3)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end
	                        if vehhash == 0xA09E15FD then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end
	                        if vehhash == 0x5BFA5C4B then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 1)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 2)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end
	                        if vehhash == 0x9114EADA then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end
	                        if vehhash == 0x8D4B7A8A then
	                        	spawn_ped(pid, model, 10, true)
	                        	local x = #escort
	                        	ped.set_ped_into_vehicle(escort[x], escortveh[y], 7)
	                        	ai.task_combat_ped(escort[x], pped, 0, 16)
	                        end

	                    end)
end

end

menu.add_feature("Any Friends Online?", "action", globalFeatures.parent, function(feat)
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


-- function friendscheck()
-- for i=0,network.get_friend_count()-1 do

	-- local friendName = network.get_friend_index_name(i)

	-- local friendScid = network.get_friend_scid(friendName)

	-- local friendOnline = network.is_friend_index_online(i)

	-- local friendMplay = network.is_friend_in_multiplayer(friendName)
	-- print(string.format("Friend index %s %s (%s) is %s", i, friendName, friendScid, friendOnline and "online" or "offline"))
	-- if friendOnline then
		-- if friendMplay then
			-- ui.notify_above_map("~h~~u~ Online ~u~Friend : " .. friendName .. "~h~~u~\nis Playing Online", "~u~Network ~u~Presence", 172)
			-- else
			-- ui.notify_above_map("~h~~u~ Online ~u~Friend : " .. friendName , "~u~Network Presence", 47)
			-- end
			-- system.wait(100)
			-- end
			-- end
			-- end


			--Player list


for pid=0,31 do


				local featureVars = {}
				local features = {}

		featureVars.f = menu.add_feature("Player " .. pid, "parent", playersFeature.id, function()
					moist_notify("Current HP info:\n", player.get_player_health(pid) .. " / " ..player.get_player_max_health(pid) .. " || " .. player.get_player_armour(pid).." ||")
					local heldwep = ped.get_current_ped_weapon(player.get_player_ped(pid))
					moist_notify(weapon.get_weapon_name(heldwep), "\n".. heldwep)
						end)	
		featureVars.k = menu.add_feature("Remove Player Options", "parent", featureVars.f.id, function()
				                                 if #data == 0 or nil then
				                                 	dataload()
				                                 end
				                                 features["Kick1_Type1"].feat.max_i = #data
				                                 features["Kick1_Type2"].feat.max_i = #data
				                                 features["Kick1_Type1"].feat.min_i = 1
				                                 features["Kick1_Type2"].feat.min_i = 1

				                                 if #data2 == 0 or nil then
				                                 	dataload2()
				                                 end
				                                 features["Kick2_Type1"].feat.max_i = #data2
				                                 features["Kick2_Type2"].feat.max_i = #data2
				                                 features["Kick2_Type1"].feat.min_i = 1
				                                 features["Kick2_Type2"].feat.min_i = 1
				                             end)

				featureVars.v = menu.add_feature("Vehicle Options", "parent", featureVars.f.id)

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


			features["set_Boost"] = {feat = menu.add_feature("Set Boost & Forward Speed", "action", featureVars.v.id, function(feat)
				local plyveh = player.get_player_vehicle(pid)
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

		features["vehspdslow"] = {feat = menu.add_feature("Input Custom Max Speed", "action", featureVars.v.id, function()

			playervehspd(pid, 5.0)

		end), type = "action"}

		features["vehspdcust"] = {feat = menu.add_feature("Set Max Speed 5", "action", featureVars.v.id, function()
			local r,s = input.get("Enter a Name to Label POS", "1.0", 64, 5)
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

		featureVars.t = menu.add_feature("Teleport Options", "parent", featureVars.f.id)	

		--TODO: Highight Controls
		featureVars.h = menu.add_feature("Highlight Options", "parent", featureVars.f.id, function()
		                                 marker_type = 0
		                                 PlyTracker.track_all.on = true
		                                 features["Mark_Control"].feat.max_i = #mkidbool
		                             end)
		featureVars.ch = menu.add_feature("Custom Options", "parent", featureVars.h.id)



		features["Mark_Control"] = {feat = menu.add_feature("Created Marker ID  to Control", "value_i", featureVars.ch.id, function(feat)
			features["Mark_Control"].feat.max_i = #mkidbool
			for i = 1, #mkidbool do
				mkidbool[i] = false
			end
			if feat.on then
				local i = feat.value_i
				mkidbool[i] = true
				return HANDLER_CONTINUE
			end
			for i = 1, #mkidbool do
				mkidbool[i] = false
			end
			return HANDLER_POP

		end), type = "value_i"}
		features["Mark_Control"].feat.max_i = #mkidbool
		features["Mark_Control"].feat.min_i = 1


		features["RGB_OFF"] = {feat = menu.add_feature("Turn off all RGB Changers", "action", featureVars.h.id, function(feat)
			changeRGBA.on = false
			change_RGBA.on = false
			changeRGB.on = false
			changRGBA.on = false	
			chang_RGBA.on = false	
			changRGB.on = false	

		end), type = "action"}

		features["cprecision"] = {feat = menu.add_feature("Precision Multipliers", "toggle", featureVars.ch.id, function(feat)
			if feat.on then
				features["MarkSize"].feat.value_i = 120
				size_marker = tonumber(120 / 100)
				features["MarkZoff"].feat.value_i = 150
				offsetz_marker = tonumber(150 / 100)
				return HANDLER_POP
			end
			if feat.on then
				return HANDLER_CONTINUE
			end
			features["MarkSize"].feat.value_i = 2
			size_marker = tonumber(3 / 2)
			features["MarkZoff"].feat.value_i = 1
			offsetz_marker = 1.5
			return HANDLER_POP
		end), type = "toggle"}

		features["MarkerID"] = {feat = menu.add_feature("Change Type of Marker", "action_value_i", featureVars.ch.id, function(feat)
			marker_type = tonumber(feat.value_i)
			mk_id = tonumber(feat.value_i)
			if feat.value_i == 1 then
				features["MarkZoff"].feat.value_i = -4
				offsetz_marker = tonumber(-4 / 2)
				if features["cprecision"].feat.on then
					features["MarkZoff"].feat.value_i = -400
					offsetz_marker = tonumber(-400 / 100)
				end
			end


		end), type = "action_value_i"}
		features["MarkerID"].feat.max_i = 44
		features["MarkerID"].feat.min_i = 0
		features["MarkerID"].feat.value_i = 0

		features["MarkSize"] = {feat = menu.add_feature("Marker Size Muliplier", "action_value_i", featureVars.ch.id, function(feat)
			if features["cprecision"].feat.on then
				features["MarkSize"].feat.value_i = 150
				size_marker = tonumber(feat.value_i / 100)
			else
				size_marker = tonumber(feat.value_i / 2)
			end
		end), type = "action_value_i"}
		features["MarkSize"].feat.max_i = 30000
		features["MarkSize"].feat.min_i = 1
		features["MarkSize"].feat.value_i = 2

		features["MarkZoff"] = {feat = menu.add_feature("Marker Z Offset Multiplier", "action_value_i", featureVars.ch.id, function(feat)
			if features["cprecision"].feat.on then
				offsetz_marker = tonumber(feat.value_i / 100)
			else
				offsetz_marker = tonumber(feat.value_i / 2)
			end	
		end), type = "action_value_i"}
		features["MarkZoff"].feat.max_i = 30000
		features["MarkZoff"].feat.min_i = -30000
		features["MarkZoff"].feat.value_i = 1

		features["BOB_Marker"] = {feat = menu.add_feature("Bob Marker Up & Down", "toggle", featureVars.ch.id, function(feat)
			BobUPnDown = true
			if feat.on then
				return HANDLER_CONTINUE
			end BobUPnDown = false
			return HANDLER_POP
		end)}

		features["ROT_Marker"] = {feat = menu.add_feature("Rotate Marker", "toggle", featureVars.ch.id, function(feat) 
			ROTMRK = true
			if feat.on then
				return HANDLER_CONTINUE
			end ROTMRK = false
			return HANDLER_POP
		end)}


		features["Add_Mark1"] = {feat = menu.add_feature("WhiteMarker Around Player", "action", featureVars.h.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			mk_id = 1
			offsetz_marker = -2.0
			size_marker = 1.5
			local i = #mkidbool + 1
			mkidbool[i] = false
			marker(pid, i)
			features["Mark_Control"].feat.max_i = #mkidbool

		end), type = "action"}

		features["Add_Mark2"] = {feat = menu.add_feature("Red Marker Above Player POS", "action", featureVars.h.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			mk_id = 0
			offsetz_marker = 1.5
			size_marker = 1.0
			local i = #mkidbool + 1
			mkidbool[i] = false
			marker_pos(pid, i)
			features["Mark_Control"].feat.max_i = #mkidbool

		end), type = "action"}

		features["Add_Mark3"] = {feat = menu.add_feature("Highlight Player RGB Markers v1", "action", featureVars.ch.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			local i = #mkidbool + 1
			marker_pos(pid, i)
			mkidbool[i] = false
			change_RGBA.on = true

			features["Mark_Control"].feat.max_i = #mkidbool
		end), type = "action"}

		features["Add_Mark4"] = {feat = menu.add_feature("RGB Random Color Markers", "action", featureVars.ch.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			local i = #mkidbool + 1
			marker_pos1(pid, i)
			mkidbool[i] = false
			changRGB.on = true
			features["Mark_Control"].feat.max_i = #mkidbool
		end), type = "action"}

		features["Add_Mark5"] = {feat = menu.add_feature("(Multicolor) Markers v3", "action", featureVars.ch.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			local i = #mkidbool + 1
			marker_pos(pid, i)
			mkidbool[i] = false
			changRGBA.on = true
			features["Mark_Control"].feat.max_i = #mkidbool
		end), type = "action"}

		features["Add_Mark6"] = {feat = menu.add_feature("Above:FlashRedWhiteGround:Fading", "action", featureVars.ch.id, function(feat)
			local pped = player.get_player_ped(pid)
			ui.add_blip_for_entity(pped)
			local i = #mkidbool + 1
			marker_pos(pid, i)
			mkidbool[i] = false
			changRGB.on = true
			features["Mark_Control"].feat.max_i = #mkidbool
		end), type = "action"}


		features["ceo_money1"] = {feat = menu.add_feature("CEO 10k money loop", "toggle", featureVars.f.id, function(feat)
			while feat.on do
				print("Money Trigger loop")
				print(os.date())

				script.trigger_script_event(-601653676, pid, {player.player_id(), 10000, -1292453789, 1, script.get_global_i(1628237 + (1 + (pid * 615)) + 533), script.get_global_i(1650640 + 9), script.get_global_i(1650640 + 10)})
				system.wait(31000)
				print(os.date())
				return HANDLER_CONTINUE
			end
			print("loop end")

			return HANDLER_POP
		end), type = "toggle", callback = function()
	end}
	features["ceo_money1"].feat.on = false

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
		get_offset(player.player_id(), 5)
		local pos = offsetPos

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

features["Block Passive"] = {feat = menu.add_feature("Block Passive Mode", "action", featureVars.f.id, function(feat)
	script.trigger_script_event(1421531240, pid, {1, 1})
	local scid = player.get_player_scid(pid)
	local name = tostring(player.get_player_name(pid))
	debug_out(string.format("Player: " ..name .." [" ..scid .."]" .."Blocked Passive"))
end), type = "action"}

features["Unblock Passive"] = {feat = menu.add_feature("Unblock Passive Mode", "action", featureVars.f.id, function(feat)

	script.trigger_script_event(1421531240, pid, {2, 0})

	scid = player.get_player_scid(pid)
	name = tostring(player.get_player_name(pid))
	debug_out(string.format("Player: " .. name .. " [" .. scid .. "]" .. "Passive Unblocked"))

end), type = "action"}


features["World_Dump"] = {feat = menu.add_feature("Dump World onto this Cunt!", "action", featureVars.f.id, function(feat)
	local pos = v3()
	pos = player.get_player_coords(pid)
	dump_onplayer(pid, pos)
end), type = "action"}



features["World_Dump1"] = {feat = menu.add_feature("Dump World onto this Cunt! & Freeze it", "action", featureVars.f.id, function(feat)
	local pos = v3()
	pos = player.get_player_coords(pid)
	dumpfreeze_onplayer(pid, pos)
end), type = "action"}


features["EventSpam_toggle"] = {feat = menu.add_feature("Spam Them ALL!", "toggle", featureVars.k.id, function(feat)
	if not feat.on then
		features["Kick1_Type1"].feat.on = false
		features["Kick1_Type2"].feat.on = false
		features["Kick2_Type1"].feat.on = false
		features["Kick2_Type2"].feat.on = false
		return HANDLER_POP end
		while feat.on do
			features["Kick1_Type1"].feat.on = true
			features["Kick1_Type2"].feat.on = true
			features["Kick2_Type1"].feat.on = true
			features["Kick2_Type2"].feat.on = true
			return HANDLER_CONTINUE
		end

	end), type = "toggle", callback = function()
end}
features["EventSpam_toggle"].feat.threaded = false
features["EventSpam_toggle"].feat.on = false

features["Kick1_Type1"] = {feat = menu.add_feature("Kick Data 1 Type 1", "value_i", featureVars.k.id, function(feat)
	if feat.on then

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

			script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2})
			print("[" ..i .."] " .. "script.trigger_script_event(" ..data[i] .."," .."[pid:]" .. pid .."," .. "{ ".. par3 ..", " .. par5 ..", " .. par2 ..", " .. par3 ..", " .. par2 .."})")
			-- system.wait(500)
			script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

			print("[" ..i .."] " .. "script.trigger_script_event(" ..data[i] .."," .."[pid:]" .. pid .."," .. "{" .. par3 ..", " .. par5 ..", " .. par2 ..", " .. par3 ..", " .. par2 ..", " .. par1 ..", " .. par3 ..", " .. par1 .."})" )
			-- system.wait(500)

		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end), type = "value_i"}
features["Kick1_Type1"].feat.max_i = #data
features["Kick1_Type1"].feat.min_i = 1
features["Kick1_Type1"].feat.value_i = 1
features["Kick1_Type1"].feat.mod_i = 100
features["Kick1_Type1"].feat.on = false

features["Kick1_Type2"] = {feat = menu.add_feature("Kick Data 1 Type 2", "value_i", featureVars.k.id, function(feat)
	if feat.on then

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
			par6 = math.random(-1000, 99999999)
			script.trigger_script_event(data[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

			print(data[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

			script.trigger_script_event(data[i], pid, {par1, par4, par3, par5, par6, par2, par3, par2, par1, par3, par1})

			print(data[i] .."," .. pid .."," .. par1 ..","  .. par4 .."," .. par3 .."," .. par5 .."," .. par6 ..","  .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP

end), type = "value_i"}
features["Kick1_Type2"].feat.max_i = #data
features["Kick1_Type2"].feat.min_i = 1
features["Kick1_Type2"].feat.value_i = 1
features["Kick1_Type2"].feat.mod_i = 99
features["Kick1_Type2"].feat.on = false

features["Kick2_Type1"] = {feat = menu.add_feature("Kick Data 2 Type 1", "value_i", featureVars.k.id, function(feat)
	if feat.on then	
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

			script.trigger_script_event(data2[i], pid, {par3, par5, par2, par3, par2})
			print(data2[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2)
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP

end), type = "value_i"}
features["Kick2_Type1"].feat.max_i = #data2
features["Kick2_Type1"].feat.min_i = 1
features["Kick2_Type1"].feat.value_i = 1
features["Kick2_Type1"].feat.mod_i = 99	
features["Kick2_Type1"].feat.on = false

features["Kick2_Type2"] = {feat = menu.add_feature("Kick Data 2 Type 2", "value_i", featureVars.k.id, function(feat)
	if feat.on then

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

			script.trigger_script_event(data2[i], pid, {par3, par5, par2, par3, par2, par1, par3, par1})

			print(data2[i] .."," .. pid .."," .. par3 .."," .. par5 .."," .. par2 .."," .. par3 .."," .. par2 .."," .. par1 .."," .. par3 .."," .. par1 )

		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end), type = "value_i"}
features["Kick2_Type2"].feat.max_i = #data2
features["Kick2_Type2"].feat.min_i = 1
features["Kick2_Type2"].feat.value_i = 1
features["Kick2_Type2"].feat.mod_i = 99
features["Kick2_Type2"].feat.on = false

features["net-kick"] = {feat = menu.add_feature("Network Bail Kick", "toggle", featureVars.k.id, function(feat)
	if not feat.on then
		kicklogsent = false
		return HANDLER_POP
	end
	if not logsent then

		local scid = player.get_player_scid(pid)			
		local name = tostring(player.get_player_name(pid))

		script.trigger_script_event(150902083, pid, {pid, script.get_global_i(1628237 + (1 + (pid * 615)) + 533)})
		debug_out(string.format("Player: " ..name .." [" ..scid .."]" .." Network Bail Kicked"))
		kicklogsent = true
	end
	return HANDLER_CONTINUE
end), type = "toggle"}
features["net-kick"].feat.on = false



features["Way-point"] = {feat = menu.add_feature("Set Way point On Player", "toggle", featureVars.f.id, function(feat)
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

playerFeatures[pid] = {feat = featureVars.f, scid = -1, features = features}
featureVars.f.hidden = true

end

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
                                  				if isYou then
                                  					tags[#tags + 1] = "Y"
                                  				end
                                  				if player.is_player_friend(pid) then
                                  					tags[#tags + 1] = "F"
                                  				end
                                  				if player.is_player_vehicle_god(pid) then
                                  					tags[#tags + 1] = ".VG."
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
                                  						moist_notify("Modded Specate Detected from " .. (isYou and "you " or name) .. " ")
                                  						player.set_player_as_modder(pid, mod_flag_3)
                                  					end
                                  				end
                                  				if player.is_player_modder(pid, -1) then
                                  					tags[#tags + 1] = "M"
                                  				end
                                  				if player.is_player_host(pid) then
                                  					tags[#tags + 1] = "H"
                                  					if SessionHost ~= pid then
                                  						SessionHost = pid
                                  						notify_above_map("The session host is now " .. (isYou and " you " or name) .. "  ")
                                  						debug_out(string.format("Session Host is Now : " .. (isYou and " you " or name)))
                                  					end
                                  				end
                                  				if pid == script.get_host_of_this_script() then
                                  					tags[#tags + 1] = "S"
                                  					if ScriptHost ~= pid then
                                  						ScriptHost = pid
                                  						notify_above_map("The script host is now " .. (isYou and " you " or name) .. "  ")
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
loopFeat.threaded = false
loopFeat.on = true
