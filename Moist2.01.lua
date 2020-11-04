local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
utils.make_dir(rootPath .. "\\lualogs")


--Script Settings Set & save
local save_ini = rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini"

local toggle_setting = {}
local setting = {}
toggle_setting[#toggle_setting+1] = "MoistsScript"
setting[toggle_setting[#toggle_setting]] = "2.0"
toggle_setting[#toggle_setting+1] = "PlyTracker.track_all"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "PlyTracker.track_all_HP"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.modvehgod_osd"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.modvehspeed_osd"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.modspec_osd"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "showfriends"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "OSD.Player_bar"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "aimDetonate_control"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "osd_date_time"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "force_wPara"
setting[toggle_setting[#toggle_setting]] = true
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "lag_out"
setting[toggle_setting[#toggle_setting]] = true
toggle_setting[#toggle_setting+1] = "force_wBPH"



local save_ini_file = io.open(rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini", "a")
toggle = 1
if not utils.file_exists(rootPath .. "\\scripts\\MoistsLUA_cfg\\MoistsScript_settings.ini") then
	io.output(save_ini_file)
	io.write("[MoistsScript]")
	  io.close()
end

for line in io.lines(save_ini) do
				local line = string.gsub(line, toggle_setting[toggle] .."=", "")
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

	



--function variables

local tracking = {}
tracking.playerped_posi = {}
tracking.playerped_speed1 = {}
tracking.playerped_speed2 = {}
tracking.playerped_speed3 = {}
tracking.HP_tracker1 = {}
tracking.HP_tracker2 = {}
tracking.HP_tracker3 = {}
local OSD = {}
local PlyTracker = {}
local OptionsVar = {}

local allpeds = {}
local allveh = {}
local allobj = {}
local allpickups = {}

local escort = {}
local escortveh = {}
local groupIDs = {}

-- local NoWaypoint = v2()

-- NoWaypoint.x = 16000
-- NoWaypoint.y = 16000

--Arrays

local presets = {{"beyond_limits", -173663.281250,915722.000000,362299.750000},{"God Mode Death (Kill Barrier)", -1387.175,-618.242,30.362},{"Ocean God Mode Death\n(Outside Limits Deep Ocean)",  -5784.258301,-8289.385742,-136.411270},{"Chiliad", 491.176,5529.808,777.503},{"Lesters House", 1275.544,-1721.774,53.967},{"arena", -264.297,-1877.562,27.756},{"ElysianIslandBridge", -260.923,-2414.139,124.008},{"LSIAFlightTower", -983.292,-2636.995,89.524},{"TerminalCargoShip", 983.303,-2881.645,21.619},{"ElBurroHeights", 1583.022,-2243.034,93.265},{"CypressFlats", 552.672,-2218.876,68.981},{"LaMesa", 1116.815,-1539.787,52.146},{"SupplyStreet", 777.631,-695.813,28.763},{"Noose", 2438.874,-384.409,92.993},{"TatavianMountains", 2576.999,445.654,108.456},{"PowerStation", 2737.046,1526.873,57.494},{"WindFarm", 2099.765,1766.219,102.698},{"Prison", 1693.473,2652.971,61.335},{"SandyShoresRadioTower", 1847.034,3772.019,33.151},{"AlamoSea", 719.878,4100.993,39.154},{"RebelRadioTower", 744.500,2644.334,44.400},{"GreatChaparral", -291.035,2835.124,55.530},{"ZancudoControlTower", -2361.625,3244.962,97.876},{"NorthChumash(Hookies)", -2205.838,4298.805,48.270},{"AltruistCampRadioTower", -1036.141,4832.858,251.595},{"CassidyCreek", -509.942,4425.454,89.828},{"MountChiliad", 462.795,5602.036,781.400},{"PaletoBayFactory", -125.284,6204.561,40.164},{"GreatOceanHwyCafe", 1576.385,6440.662,24.654},{"MountGordoRadioTower", 2784.536,5994.213,354.275},{"MountGordoLighthouse", 3285.519,5153.820,18.527},{"GrapeSeedWaterTower", 1747.518,4814.711,41.666},{"TatavianMountainsDam", 1625.209,-76.936,166.651},{"VinewoodHillsTheater", 671.748,512.226,133.446},{"VinewoodSignRadioTowerTop", 751.179,1245.13,353.832},{"Hawik", 472.588,-96.376,123.705},{"PacificSrandardBank", 195.464,224.341,143.946},{"WestVinewoodCrane", -690.273,219.728,137.518},{"ArcadiasRadioTower", -170.232,-586.307,200.138},{"HookahPalaceSign",-1.414,-1008.324,89.189},{"MarinaAirportRadioTower",-697.010, -1419.530,5.001},{"DelperoFerrisWheel", -1644.193,-1114.271,13.029},{"VespucciCanalsClockTower", -1238.729,-853.861,77.758},{"DelPeroNrMazebankwest", -1310.777,-428.985,103.465},{"pacifficBluffs", -2254.199,326.088,192.606},{"GWC&GolfingSociety", -1292.052,286.209,69.407},{"Burton", -545.979,-196.251,84.733},{"LosSantosMedicalCenter", 431.907,-1348.709,44.673},{"BanhamCanyon", -3085.451,774.426,20.237},{"TongvaHills", -1874.280,2064.565,150.852},{"SanChianskiMountainRange", 2900.166,4325.987,102.101},{"HumaineLabs", 3537.104,3689.238,45.228},{"YouToolStoreSanChianski", 2761.944,3466.951,55.679},{"GalileoObservatory", -422.917,1133.272,325.855},{"GrndSeroraDesertCementwks", 1236.649,1869.214,84.824}}

local escort_ped = {{"juggalo_01", 0xDB134533},{"topless_01", 0x9CF26183},{"lestercrest_2", 0x6E42FD26},}

local escort_ped = {{"juggalo_01", 0xDB134533},{"topless_01", 0x9CF26183},{"juggalo_02", 0x91CA3E2C},{"lester crest", 0xB594F5C3},{"cop", 0x9AB35F63},{"mp_agent14", 0x6DBBFC8B},{"ramp_marine", 0x616C97B9},{"trafficwarden", 0xDE2937F3},{"lestercrest_2", 0x6E42FD26},{"lestercrest", 0x4DA6E849},{"agent14", 0xFBF98469},{"m_pros_01", 0x6C9DD7C9},{"waremech_01", 0xF7A74139},{"weapexp_01", 0x36EA5B09},{"weapwork_01", 0x4186506E},{"securoguard_01", 0xDA2C984E},{"armoured_01", 0xCDEF5408},{"armoured_01", 0x95C76ECD},{"armoured_02", 0x63858A4A},{"marine_01", 0xF2DAA2ED},{"marine_02", 0xF0259D83},{"security_01", 0xD768B228},{"snowcop_01", 0x1AE8BB58},{"prisguard_01", 0x56C96FC6},{"pilot_01", 0xE75B4B1C},{"pilot_02", 0xF63DE8E1},{"blackops_01", 0xB3F3EE34},{"blackops_02", 0x7A05FA59},{"blackops_03", 0x5076A73B},{"hwaycop_01", 0x739B1EF5},{"marine_01", 0x65793043},{"marine_02", 0x58D696FE},{"marine_03", 0x72C0CAD2},{"ranger_01", 0xEF7135AE},{"robber_01", 0xC05E1399},{"sheriff_01", 0xB144F9B9},{"pilot_01", 0xAB300C07},{"swat_01", 0x8D8F1B10},{"fibmugger_01", 0x85B9C668},{"juggernaut_01", 0x90EF5134},{"rsranger_01", 0x3C438CD2},}

local veh_list = {{"buzzard", 0x2F03547B, nil, nil},{"savage", 0xFB133A17, nil, nil},{"seasparrow", 0xD4AE63D9, 10, 1},{"valkyrie2", 0x5BFA5C4B, nil, nil},{"valkyrie", 0xA09E15FD, nil, nil},{"boxville5", 0x28AD20E1, nil, nil},{"apc", 0x2189D250, 10, 0},{"oppressor2", 0x7B54A9D3, 10, 1},{"oppressor", 0x34B82784, 10, 0},{"ruiner2", 0x381E10BD, nil, nil},{"scramjet", 0xD9F0503D, 10, 0},{"stromberg", 0x34DBA661},{"tampa3", 0xB7D9F7F1},{"khanjali", 0xAA6F980A, nil, nil},{"insurgent3", 0x8D4B7A8A, nil, nil},{"insurgent", 0x9114EADA, nil, nil},{"limo2", 0xF92AEC4D, nil, nil},{"mower", 0x6A4BD8F6, nil, nil},{"police2", 0x9F05F101, nil, nil},{"police3", 0x71FA16EA, nil, nil},{"police4", 0x8A63C7B9, nil, nil},{"police", 0x79FBB0C5, nil, nil},{"policeb", 0xFDEFAEC3, nil, nil},{"policeold1", 0xA46462F7, nil, nil},{"policeold2", 0x95F4C618, nil, nil},{"policet", 0x1B38E955, nil, nil},{"polmav", 0x1517D4D9, nil, nil},{"sheriff2", 0x72935408, nil, nil},{"sheriff", 0x9BAA707C, nil, nil},{"phantom2", 0x9DAE1398, nil, nil},{"ruiner3", 0x2E5AFD37, nil, nil},}

local ped_wep = {{"unarmed", 0xA2719263},{"weapon_handcuffs", 0xD04C944D},{"stone_hatchet", 0x3813FC08},{"knife", 0x99B507EA},{"bat", 0x958A4A8F},{"weapon_machinepistol", 0xDB1AA450},	{"raypistol", 0xAF3696A1},{"stungun", 0x3656C8C1},{"raycarbine", 0x476BF15},{"combatmg_mk2", 0xDBBD7280},{"rpg", 0xB1CA77B1},{"railgun", 0x6D544C99},{"minigun", 0x42BF8A85},{"rayminigun", 0xB62D1F6},}

local missions = {"Force to Severe Weather","Force to Half Track","Force to Half Track","Force to Night Shark AAT","Force to Night Shark AAT","Force to APC Mission","Force to APC Mission","Force to MOC Mission","Force to MOC Mission","Force to Tampa Mission","Force to Tampa Mission","Force to Opressor Mission1","Force to Opressor Mission1","Force to Opressor Mission2","Force to Opressor Mission2"}

local globalFeatures = {}

globalFeatures.parent = menu.add_feature("Moists Script 2.0", "parent", 0).id

local playerFeatures = {}

playersFeature = menu.add_feature("Online Players", "parent", globalFeatures.parent, function()
		if showfriends.on then
		if not friendsshown then
		friendscheck() end
		friendsshown = true
		else end
end)

playerfeatVars = {} 
playerFeat = {}
playerFeatParent = {}
playerFeatParent2 = {}

playerFeat1 = {}
playerFeat2 = {}
playerFeat3 = {}
playerFeat4 = {}
playerfeatVars.f = menu.add_player_feature("Spawn Options", "parent", 0).id
playerfeatVars.b = menu.add_player_feature("Ped Spawns", "parent", playerfeatVars.f).id 
playerfeatVars.fm = menu.add_player_feature("Force Player to Mission", "parent", 0).id


globalFeatures.lobby = menu.add_feature("Online Session", "parent", globalFeatures.parent).id
-- globalFeatures.protex = menu.add_feature("Online Protection", "parent", globalFeatures.lobby).id
-- globalFeatures.kick = menu.add_feature("Session Kicks", "parent", globalFeatures.lobby).id
-- globalFeatures.orbital = menu.add_feature("Orbital Room Block", "parent", globalFeatures.protex).id
globalFeatures.self = menu.add_feature("Player Functions", "parent", globalFeatures.parent).id
globalFeatures.cleanup = menu.add_feature("Clean Shit Up!", "parent", globalFeatures.parent).id
globalFeatures.self_ped = menu.add_feature("Player Ped Functions", "parent", globalFeatures.self).id
globalFeatures.self_wep = menu.add_feature("Player Ped Weapons", "parent", globalFeatures.self_ped).id
-- globalFeatures.self_veh = menu.add_feature("Player Vehicle Functions", "parent", globalFeatures.self).id
globalFeatures.createdmarkers = menu.add_feature("Markers", "parent", globalFeatures.cleanup).id
globalFeatures.moistopt = menu.add_feature("Options", "parent", globalFeatures.parent).id
-- globalFeatures.moist_test = menu.add_feature("Test", "parent", 0)
-- globalFeatures.moist_test.hidden = false
-- globalFeatures.parentID = menu.add_feature("Blacklist", "parent", globalFeatures.protex).id




--player Features

--Grief

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


--Functions

local global_func = {}

function playervehspd(pid, speed)
	local plyveh 
	local pedd = player.get_player_ped(pid)
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	entity.set_entity_max_speed(plyveh, speed)
end




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
	
global_func.force_wPara = menu.add_feature("Force White parachute On", "toggle", globalFeatures.self_ped, function(feat)
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
	
global_func.force_wBPH = menu.add_feature("Force White BPH On", "toggle", globalFeatures.self_ped, function(feat)
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


--Util functions
local notif = ui.notify_above_map
local function notify_above_map(msg)
	ui.notify_above_map(tostring(msg), "Moists Script 2.0\nPrivate Edition", 140)
end

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



--offset to player calculation
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


--spawn variables defaults set
model = 0xDB134533
vehhash = 788747387
wephash = 0xA2719263
local mod
local modvalue
local pedspawns


--Spawn Functions

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
	-- offset = offsetPos
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

--Spawn Cleanups

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



ped_cleanup = menu.add_player_feature("Delete Ped Spawns", "action", playerfeatVars.f, function(feat)
	
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

pedveh_cleanup = menu.add_player_feature("Delete Ped Spawns + Vehicles", "action", playerfeatVars.f, function(feat)
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

--OSD Functions


OptionsVar.aim_control = menu.add_feature("Detonate Vehicle Aiming at(DPAD-R)", "toggle", globalFeatures.moistopt, function(feat)
	setting["aimDetonate_control"] = true
		if feat.on then
		if not controls.is_control_pressed(6,54) then
			return HANDLER_CONTINUE
		end
	entity_control = player.get_entity_player_is_aiming_at(player.player_id())
	
	if entity.is_entity_a_ped(entity_control) then
	--ped.clear_ped_tasks_immediately(entity_control)
	if entity.get_entity_god_mode(entity_control) then entity.set_entity_god_mode(entity_control, false)
	end
	if entity.is_entity_attached(entity_control) then
	entity_control = entity.get_entity_attached_to(entity_control)
	end
	end
	if entity.get_entity_god_mode(entity_control) then entity.set_entity_god_mode(entity_control, false)
	end
	if entity.is_entity_a_vehicle(entity_control) then
		network.request_control_of_entity(entity_control)
		vehicle.add_vehicle_phone_explosive_device(entity_control)
	system.wait(25)
	end
	
	network.request_control_of_entity(entity_control)
	if vehicle.has_vehicle_phone_explosive_device() then
	vehicle.detonate_vehicle_phone_explosive_device()
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
load_spawn_options()

		-- menu.add_player_feature("Spawn This Vehicle Behind Player", "action", playerfeatVars.featvvar.id, function(feat, pid)
			
			-- spawn_veh(pid, vehhash, -8, mod, modvalue)
			-- local y = #escortveh
			-- entity.set_entity_god_mode(escortveh[y], false)
		-- end)
	-- end
-- end

friendsshown = false

showfriends = menu.add_feature("Show Friends Notify", "toggle", globalFeatures.moistopt, function(feat)
	setting["showfriends"] = true
	
	while feat.on do
		system.wait(1000)
	return HANDLER_CONTINUE
	end
	setting["showfriends"] = false
	friendsshown = false
	return HANDLER_POP
end)
showfriends.on = setting["showfriends"]

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


function friendscheck()
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
end



--save settings
			
menu.add_feature("Save settings", "action", globalFeatures.moistopt, function()
	saveSettings()
	notif("Settings saved!", "", 212)
end) 
	


function saveSettings()

			local save_ini = io.open(save_ini, "w")
			io.output(save_ini)
			for i, k in pairs(toggle_setting) do
				io.write(k.."="..tostring(setting[k]).."\n")
			end
			io.close(save_ini)
end



--Player list


for pid=0,31 do
	
	
	local featureVars = {}

		
	featureVars.f = menu.add_feature("Player " .. pid, "parent", playersFeature.id)	
	
	local features = {}
	
	
	features["Waypoint"] = {feat = menu.add_feature("Set Waypoint On Player", "toggle", featureVars.f.id, function(feat)
		if feat.on then
			for i=0,31 do
				if i ~= pid and playerFeatures[i].features["Waypoint"].feat then
					playerFeatures[i].features["Waypoint"].feat.on = false
				end
			end
			else
			set_waypoint(nil)
		end
		return HANDLER_POP
	end), type = "toggle", callback = function()
	set_waypoint(player.get_player_coords(pid))
	end}
	features["Waypoint"].feat.threaded = false
	
	playerFeatures[pid] = {feat = featureVars.f, scid = -1, features = features}
	featureVars.f.hidden = true
end

--Main loop
local SessionHost = nil
local ScriptHost = nil
local loopFeat = menu.add_feature("Loop", "toggle", 0, function(feat)
	if feat.on then
		local Online = network.is_session_started()
		if not Online then
			SessionHost = nil
			ScriptHost = nil
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
					if player.is_player_modder(pid, -1) then
						tags[#tags + 1] = "M"
					end
					if player.is_player_host(pid) then
						tags[#tags + 1] = "H"
						if SessionHost ~= pid then
							SessionHost = pid
							notify_above_map("The session host is now " .. (isYou and "you" or name) .. ".")
						end
					end
					if pid == script.get_host_of_this_script() then
						tags[#tags + 1] = "S"
						if ScriptHost ~= pid then
							ScriptHost = pid
							notify_above_map("The script host is now " .. (isYou and "you" or name) .. ".")
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
							notify_above_map("Error running feature " .. i .. " on pid " .. pid)
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