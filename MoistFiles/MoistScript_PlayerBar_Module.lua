Session_PB_Players = {
	{
		Name = {},
		NameLabel = {},
		scid = {},
		tags = {},
		isHost = {},
		isScHost = {},
		speed = {},
		isOTR = {},
		OTRTNotify = {},
		OTR_Start = {},
		Notified = {},
		interior = {},
		isTalking = {},
		PedSpawned = {},
		isPaused = {},
		RCveh = {}, 
		
	}
}

--function PlayerBarMain(feat)
if not MoistScript_NextGen then
	return
end

if MoistScript_PlayerBar_Module == 'loaded' then
	return
end

MoistScript_PlayerBar_Module = "loaded"
local ScriptConfig = _G.ScriptConfig
local Features = _G.Features
local Session_Players = GlobalPlayers
local PlayerBarFeats = {}
_G.PlayerBarFeats = PlayerBarFeats
local PCR, PCG, PCB, PCA
local PCR1, PCG1, PCB1, PCA1 = 255, 255, 255, 255
local PCR2, PCG2, PCB2, PCA2 = 0, 0, 0, 255
local FPSOSD, MySpeed, CurTime, BarAlpha = "", "", "", _G.ScriptConfig["PlayerBarAlphaValue"]
local Root =  utils.get_appdata_path("PopstarDevs", "2Take1Menu")

if not (package.path):find(Root .. "\\scripts\\MoistFiles\\?.lua", 1, true) then
	package.path = Root .. "\\scripts\\MoistFiles\\?.lua;" .. package.path
end

GTA_Natives = require("MoistScript_GTA_Natives")

function RoundNum(num, dot)
	local mult = 10^(dot or 0)
	return ((num * mult + 0.05) // 1) / mult 
end

PlayerBarFeats.PlayerbarParent = menu.add_feature("PlayerBar Options", "parent", Features["LocalSettings"].id)
-- local Session_PB_Players = {
	-- {
		-- Name = {},
		-- NameLabel = {},
		-- scid = {},
		-- tags = {},
		-- isHost = {},
		-- isScHost = {},
		-- speed = {},
		-- isOTR = {},
		-- OTRTNotify = {},
		-- OTR_Start = {},
		-- Notified = {},
		-- interior = {},
		-- isTalking = {},
		-- PedSpawned = {},
		-- isPaused = {},
	-- }
-- }

function Player_add(pid)
	Session_PB_Players[pid] = {}
Session_PB_Players[pid].Name = GTA_Natives.GET_PLAYER_NAME(pid)
Session_PB_Players[pid].NameLabel = GTA_Natives.GET_PLAYER_NAME(pid)
	Session_PB_Players[pid].scid = player.get_player_scid(pid)
	Session_PB_Players[pid].tags = nil
	Session_PB_Players[pid].speed = 0.0
	Session_PB_Players[pid].isOTR = false
	Session_PB_Players[pid].OTRTNotify = false
	Session_PB_Players[pid].OTR_Start = nil
	Session_PB_Players[pid].Notified = false
	Session_PB_Players[pid].interior = _G.Session_Players[pid].InInterior
	Session_PB_Players[pid].isTalking = false
	Session_PB_Players[pid].PedSpawned = false
	Session_PB_Players[pid].RCveh = false
	
end

_G.Session_PB_Players = Session_PB_Players

for pid = 0, 31 do
	Player_add(pid)
end


local joined = event.add_event_listener("player_join", function(e)

	Player_add(e["player"])
	return
end)

local left = event.add_event_listener("player_leave", function(e)

	Player_add(e["player"])
	
	return
end)


local NetEventHookID1, PlayerTaghook_id, Event_Listener, NetEvents = 0, 0, 0, {}
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

NetEventsHook = function(source, target, NetEventID)
	local pid = source
	if NetEventID == 11 then
		Session_PB_Players[pid].PedSpawned = true
		return false
	end
	if NetEventID == 71 then
		Session_PB_Players[pid].isTalking = true
		return false
	end
	Session_PB_Players[pid].isTalking = false
	if NetEventID == 43 or NetEventID == 12 or NetEventID == 13 or NetEventID == 14 then
		local e, f
		e = GTA_Natives.GET_PLAYER_NAME(source)
		f = GTA_Natives.GET_PLAYER_NAME(target)
        _G.MoistNotify("Blocked: " .. tostring(NetEventID) ..  "\n" .. tostring(source) .. " : " .. tostring(e) .. " ->:-> " .. tostring(target) .. " | " .. tostring(f) .. "\nMarking As Modder", "MoistScript NG 3.0.0.6\nModder Detection")
		
        return true
	end
    return false
end


PlayerTag_event_Hook = function(source, target, params, count)
local pid = source
local player_source = GTA_Natives.GET_PLAYER_NAME(source)
if type(params) ~= 'table' then
	return HANDLER_POP
end
--Print(player_source) Print(params)
if params[1] == 0xb521a553  then
	Session_PB_Players[pid].isPaused = true
	return false	
	elseif params[1] == 0x1d6e7298 then
	Session_PB_Players[pid].isPaused = false
	return false
end
return false
end
local PlaybarParent = _G.PlayerBarFeats.PlayerbarParent.id or _G.Features.LocalSettings.id

ScriptEvent_Hook = menu.add_feature("Player Bar State Tags 1", "toggle", PlaybarParent, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
if feat["on"] and PlayerTaghook_id == 0 then
_G.ScriptConfig["PB_State_Tags"] = true
	
	PlayerTaghook_id = hook.register_script_event_hook(PlayerTag_event_Hook)
	return 
elseif not feat["on"] and PlayerTaghook_id ~= 0 then
_G.ScriptConfig["PB_State_Tags"] = false
	hook.remove_script_event_hook(PlayerTaghook_id)
	PlayerTaghook_id = 0
	return
end
end)
ScriptEvent_Hook["on"] = _G.ScriptConfig["PB_State_Tags"]


NetEvent_Hook = menu.add_feature("Player Bar State Tags 2", "toggle", PlaybarParent, function(feat)
	if feat["on"] and  NetEventHookID1 == 0 then
	_G.ScriptConfig["PB_State_Tags"] = true
		NetEventHookID1 = hook.register_net_event_hook(NetEventsHook)
		return
	elseif not feat["on"] and NetEventHookID1 ~= 0 then
	_G.ScriptConfig["PB_State_Tags"] = false
		hook.remove_net_event_hook(NetEventHookID1)
		NetEventHookID1 = 0
		return
	end
	return 
end)
NetEvent_Hook["on"] = _G.ScriptConfig["PB_State_Tags"]

--TODO: **********  PLAYER BAR ***************

PlayerBarFeats["PlayerBarAlpha"] = menu.add_feature("PlayerBar Background Alpha", "autoaction_value_i", PlayerBarFeats.PlayerbarParent.id, function(feat)
	if type(feat) == "number" then
		return
	end
	BarAlpha = feat.value
	_G.ScriptConfig["PlayerBarAlphaValue"] = feat.value
	return
	
end)
PlayerBarFeats["PlayerBarAlpha"]["max"] = 255
PlayerBarFeats["PlayerBarAlpha"]["min"] = 0
PlayerBarFeats["PlayerBarAlpha"]["value"] = _G.ScriptConfig["PlayerBarAlphaValue"]



PlayerBarFeats["ResetNotif"] = menu.add_feature("Reset Notified", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	if type(feat) == "number" then
		return
	end
	local notiftimes = {}
	while feat["on"] do
	system.yield()
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				if Session_PB_Players[pid].Notified == true and notiftimes[pid+1] == nil then
					notiftimes[pid+1] = os.clock()
				end
				if notiftimes[pid+1] ~= nil then
					if (os.clock() - notiftimes[pid+1]) >= 60 then
						Session_PB_Players[pid].Notified = false
						--Session_PB_Players[pid].isTalking = false
					end
				end
				
	--Session_PB_Players[pid].isTalking = false
				system.yield(10)
			end
			system.yield(10)
		end

	end
	return
end)
PlayerBarFeats["ResetNotif"]["on"] =true
PlayerBarFeats["ResetNotif"]["hidden"] = true

PlayerBarFeats["speedTracker"] = menu.add_feature("Track all Players speed", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	while feat["on"] do
	system.yield()
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				
				local ent
				local ent1 = player.get_player_ped(pid)
				local ent2 = ped.get_vehicle_ped_is_using(ent1)
				if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
				--Session_PB_Players[pid].interior = 0 and not true or not false
				local test = interior.get_interior_at_coords_with_type(entity.get_entity_coords(ent), "") 
				if test ~= 0 then
					Session_PB_Players[pid]["interior"] = true
					elseif test == 0 then
					Session_PB_Players[pid]["interior"] = false
				end
				local speed = entity.get_entity_speed(ent)
				local speedcalc = speed * 3.6 --kmph
				local speedcalc2 =  speed * 2.236936 --mph
				Session_PB_Players[pid].speed = math.ceil(speedcalc2)
				--Session_PB_Players.speed[y] = math.ceil(speedcalc)
			end
			system.yield(10)
		end
	end
	return
end)
PlayerBarFeats["speedTracker"]["on"] =_G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["speedTracker"]["hidden"] = true


PlayerBarFeats["My_speed"] = menu.add_feature("Show My Speed in Playerbar", "value_str", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	 _G.ScriptConfig["My_PB_Speed"] = true
	 _G.ScriptConfig["PB_Speed_Type"] = feat.value
	while feat["on"] do
		local pos = v2(0.9255, 0.0272)
		local ent, estmax, vehmax, speed, speedcalc,speedcalcm, valuetype
		vehmax = RoundNum(0.00, 1)
		local ent1 = player.get_player_ped(player.player_id())
		local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
		speed = entity.get_entity_speed(ent)
		if feat.value == 0 then
		speedcalc = speed * 3.6 --kmph
		myspeed2 = RoundNum(speedcalc, 1)
		valuetype = " Kmph"
		elseif feat.value == 1 then
		speedcalcm =  speed * 2.236936 --mph
		myspeed2 = RoundNum(speedcalcm, 1)
		valuetype = " Mph"
		end

		if player.is_player_in_any_vehicle(player.player_id()) then
			estmax = vehicle.get_vehicle_estimated_max_speed(player.get_player_vehicle(player.player_id()))
			vehmax = RoundNum(estmax * 2.236936, 1)
		end		

		MySpeed = "~b~~h~" .. tostring(myspeed2) .. " / " ..  tostring(vehmax) .. valuetype
		
		system.yield()
	end
	MySpeed = ""
	 _G.ScriptConfig["My_PB_Speed"] = false
	 _G.ScriptConfig["PB_Speed_Type"] = feat.value
	return
end)
PlayerBarFeats["My_speed"]["on"] =_G.ScriptConfig["My_PB_Speed"]
PlayerBarFeats["My_speed"]:set_str_data({"Kmph","Mph"})
PlayerBarFeats["My_speed"]["value"] =_G.ScriptConfig["PB_Speed_Type"]

PlayerBarFeats["Player_BarLoop"] = menu.add_feature("Player Loop Function", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	while feat["on"] do
		for pid = 0, 31 do
			if not player.is_player_valid(pid) then
				Player_add(pid)
			end
			if player.is_player_valid(pid) and Session_PB_Players.name == 'nil' then
				Player_add(pid)
				system.yield(200)
				elseif player.is_player_valid(pid) then
				if script.get_global_i(2689224 + 1 + (pid * 451) + 242 ) ~= 0 then
				Session_PB_Players.interior = true
				elseif script.get_global_i(2689224 + 1 + (pid * 451) + 242 ) == 0 then
				Session_PB_Players.interior = false
				end
			end
			end

		system.yield(200)
	end
	
	return
end)
PlayerBarFeats["Player_BarLoop"]["on"] =_G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["Player_BarLoop"]["hidden"] = true

PlayerBarFeats["Player_bar"] = menu.add_feature("Player Bar OSD", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	PlayerBarFeats["Player_BarLoop"]["on"] =true
	PlayerBarFeats["speedTracker"]["on"] =true
	PlayerBarFeats["ResetNotif"]["on"] = true
	_G.ScriptConfig["PlayerBar_ON"] = true
	local pos = v2()
	local Player_Name1, Player_Name
	local hosttag, SHost_tag, OTR_tagA, OTR_tagB, MOD_tag, Bounty_tag, Typing_tag, Voice_tag, Paused_tag, RC_tag = "~b~~h~[H]","~y~~h~[S]","~g~~h~[O:","~g~~h~]","~y~~h~[~r~M~y~~h~]","~b~~h~[~q~~h~B~b~~h~]","~q~[~b~~h~T~q~]","~y~[~g~~h~VC~y~]","~h~~o~[~y~~h~P~o~~h~]","~w~~h~[~g~~h~RC~h~~w~]"
	
	while feat["on"] do

		if network.is_session_started() then
		ui.draw_rect(0.001, 0.001, 2.5, 0.088, 0, 0, 0, BarAlpha)
		pos.x = 0.0001
		pos.y = 0.0001
			local ScriptHost, SessionHost = script.get_host_of_this_script(), player.get_host()
			for pid = 0, 31 do
				if player.is_player_valid(pid) and Session_PB_Players[pid].Name ~= nil then
				Player_Name = GTA_Natives.GET_PLAYER_NAME(pid)
					local pped = player.get_player_ped(pid)
					GTA_Natives.SET_TEXT_DROPSHADOW(160, 255, 255, 255, 255)
					PCR, PCG, PCB, PCA = 255, 255, 255, 255
					if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~q~" .. tostring(Player_Name) 
						PCR, PCG, PCB, PCA = 255, 0, 255, 185
						
					end
					if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~q~~h~" .. tostring(Player_Name) 
						PCR, PCG, PCB, PCA = 255, 0, 255, 200
						GTA_Natives.SET_TEXT_DROPSHADOW(255, 255, 0, 0, 255)
					end
					if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~o~" .. tostring(Player_Name) 
					end
					if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~o~~h~" .. tostring(Player_Name)
					GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 255, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 0, 0, 255)
					
					end
					if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~r~" .. tostring(Player_Name) 
					end
					if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~r~~h~" .. tostring(Player_Name) 
					GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 255, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 0, 0, 255)
					end
					
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Session_PB_Players[pid].interior == true and player.is_player_god(pid) then
						
						PCR, PCG, PCB, PCA = 255, 0, 0, 200
						elseif (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Session_PB_Players[pid].interior == false and player.is_player_god(pid) then
						local val = 255 and true or 0 and false
						PCR, PCG, PCB, PCA = tonumber(val == not val), tonumber(val == not val), 0, 255
					end
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) and Session_PB_Players[pid].interior == false then
						PCR, PCG, PCB, PCA = 255, 255, 255, 255
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
					
					ui.set_text_scale(0.180)
					ui.set_text_color(190,190,190,255)
					ui.set_text_font(0)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					
					ui.draw_text(tostring(Player_Name) .. " ", pos + v2(-0.0002,0.0002))
					if pid == SessionHost then
						Player_Name = Player_Name .. hosttag
					GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 0, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 255, 0, 255)
					end
					if pid == ScriptHost then
						Player_Name =  Player_Name .. SHost_tag
										GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 0, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 255, 0, 255)
					end
					if (script.get_global_i(2689235 + (1 + (pid * 453)) + 208) ==  1) then
					Player_Name =  Player_Name .. OTR_tagA .. "~r~~h~" .. tostring(_G.Session_Players[pid].OTR_TimerM) .. OTR_tagB
											GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 0, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 255, 0, 255)
					end
					if Session_PB_Players[pid].RCveh then
						Player_Name =  Player_Name .. RC_tag
											GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 0, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 255, 0, 255)
					end
					if (script.get_global_i(1835502 + (1 + (pid * 3)) + 4) == 1) then
						Player_Name =  Player_Name .. Bounty_tag
					end
					if (script.get_global_i(1648034 + (2 + (pid * 1) + (241 + 136)))& 1 << 16 ~= 0)  then
						Player_Name =  Player_Name .. Typing_tag
					end
					if Session_PB_Players[pid].isTalking then
						Player_Name =  Player_Name .. Voice_tag
					end			
					if player.is_player_modder(pid, -1) then
						Player_Name =  Player_Name .. MOD_tag
					end
					
					if Session_PB_Players[pid].isPaused then
					Player_Name =  Player_Name .. Paused_tag
					end
					
					if _G.Session_Players[pid].isGodmode and player.is_player_god(pid) then
					Player_Name = Player_Name .. "~y~[~h~~r~G~y~]"
					elseif _G.Session_Players[pid].isGodmode and not player.is_player_god(pid) then
					Player_Name = Player_Name
					end
					if _G.Session_Players[pid].VehGodmode and  player.is_player_vehicle_god(pid) then
						Player_Name = Player_Name .. "~r~[~h~~o~V~r~]"
					elseif _G.Session_Players[pid].VehGodmode and  not player.is_player_vehicle_god(pid) then
					Player_Name = Player_Name
					end

					ui.set_text_scale(0.178)
					ui.set_text_color(PCR, PCG, PCB, PCA)
					ui.set_text_font(0)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					GTA_Natives.SET_TEXT_DROP_SHADOW()
					GTA_Natives.SET_TEXT_DROPSHADOW(2, 0, 0, 0, 255)
					GTA_Natives.SET_TEXT_EDGE(3, 255, 255, 0, 255)
					ui.draw_text(tostring(Player_Name).. " ", pos)
					pos.x = pos.x + 0.090
				end
				
			end
			
		end
		system.yield()
	end
	PlayerBarFeats["Player_BarLoop"]["on"] =false
	PlayerBarFeats["speedTracker"]["on"] =false
	PlayerBarFeats["ResetNotif"]["on"] = false
	_G.ScriptConfig["PlayerBar_ON"] = false
	return
end)
PlayerBarFeats["Player_bar"]["on"] =_G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["Player_bar"]["hidden"] = false

PlayerBarFeats["DrawOSD"] = menu.add_feature("Draw OSD", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	_G.ScriptConfig["Draw_OSD"] = true
	while feat["on"] do
	local Alpha = 255 - BarAlpha
	if Alpha > 10 then
		ui.draw_rect(.85225, 0.0360, 0.1425, 0.01555, 0, 0, 0, (BarAlpha + 10))
	elseif Alpha < 10 then
			ui.draw_rect(.85225, 0.0360, 0.1425, 0.01555, 0, 0, 0, 255)
	end
		local pos = v2(0.855,0.0278)
		local DateTime = os.date("%a %d %b %H:%M:%S")
		ui.set_text_scale(0.2)
		ui.set_text_font(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_centre(true)
		ui.set_text_outline(1)
		local text = tostring(CurTime) .. " " .. tostring(FPSOSD) .. "   " .. tostring(MySpeed)
		 GTA_Natives.SET_TEXT_DROP_SHADOW()
		ui.draw_text(text, pos)
		system.yield()
	end
	_G.ScriptConfig["Draw_OSD"] = false
	return
end)
PlayerBarFeats["DrawOSD"]["on"] =_G.ScriptConfig["Draw_OSD"]
PlayerBarFeats["DrawOSD"]["hidden"] = true

PlayerBarFeats["DateTimeOSD"] = menu.add_feature("Date & Time OSD", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	_G.ScriptConfig["DateTimeONScrn"] = true
	while feat["on"] do
	PlayerBarFeats["DrawOSD"]["on"] = true
	local DateTime = os.date("%a %d %b %H:%M:%S")
		CurTime = "~h~" .. DateTime
		system.yield()
	end
	CurTime = ""
	PlayerBarFeats["DrawOSD"]["on"] = false
	_G.ScriptConfig["DateTimeONScrn"] = false
	return
end)
PlayerBarFeats["DateTimeOSD"]["on"] =_G.ScriptConfig["DateTimeONScrn"]

PlayerBarFeats["FPS"] = menu.add_feature("FPS", "toggle", PlayerBarFeats.PlayerbarParent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	_G.ScriptConfig["FPSONScrn"] = true
	while feat["on"] do
	PlayerBarFeats["DrawOSD"]["on"] = true
		FPSOSD = " ~y~~h~FPS: " .. tostring(math.ceil(1 / gameplay.get_frame_time()))

		system.yield(300)
	end
	FPSOSD = ""
	_G.ScriptConfig["FPSONScrn"] = false
	PlayerBarFeats["DrawOSD"]["on"] = false
	return
end)
PlayerBarFeats["FPS"]["on"] =_G.ScriptConfig["FPSONScrn"]





_G.MoistNotify("Player Bar Module Loaded", "")
--end
--local PlayerBarThread = menu.create_thread(PlayerBarMain, feat)

event.add_event_listener("exit", function()
	--clean up shit
	--menu.delete_thread(PlayerBarThread)
end)

