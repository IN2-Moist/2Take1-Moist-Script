
if not MoistScript_NextGen then
	return HANDLER_POP
end

if MoistScript_NetEvent_Module == 'loaded' then
	return HANDLER_POP
end

MoistScript_NetEvent_Module = "loaded"
local GTA_Natives = require("MoistScript_GTA_Natives")
local FolderPaths = {}

FolderPaths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
FolderPaths.Logs = FolderPaths.Root .. "\\Moist-Logs"

local Get_Date_Time = function()
	local datedm, datetm, dateDMY
	datedm = os.date()
	datetm = string.match(d, "%d%d:%d%d:%d%d")
	dateDMY = os.date("%d/%m/%y")
	return (string.format(dateDMY .. " | " .. datetm))
end

local File_Writer = function(OutputText, inc_date, Outputfile)
	local file, TextOutput
	if Outputfile == nil then
		file = io.open(FolderPaths.Logs .."\\debugout.txt" , "a")
		else
		file = io.open(FolderPaths.Logs .."\\" .. Outputfile, "a")
	end
	io.output(file)
	if inc_date == true or inc_date == nil then
		local curdate_time = tostring(Get_Date_Time())
		TextOutput = string.format(curdate_time .. OutputText .. "\n")
		elseif inc_date == false then
		TextOutput = OutputText .. "\n"
	end
	file:write(TextOutput)
	file:close()
end



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

local NetEventsHook = function(source, target, NetEventID)
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
		e = player.get_player_name(source)
		f = player.get_player_name(target)
        _G.MoistNotify("Blocked: NetEvent[" .. tostring(NetEventID) .. "] " .. tostring(NetEvents[NetEventID]) .. "\n" .. tostring(source) .. " : " .. tostring(e) .. " ->:-> " .. tostring(target) .. " | " .. tostring(f) .. "\n", "Moists Modder Module")
		
        return true
	end
    return false
end


PlayerTag_event_Hook = function(source, target, params, count)
local pid = source
local player_source = tostring(player.get_player_name(source))
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
	return HANDLER_POP
elseif not feat["on"] and PlayerTaghook_id ~= 0 then
_G.ScriptConfig["PB_State_Tags"] = false
	hook.remove_script_event_hook(PlayerTaghook_id)
	PlayerTaghook_id = 0
	return HANDLER_POP
end
end)
ScriptEvent_Hook["on"] = _G.ScriptConfig["PB_State_Tags"]


NetEvent_Hook = menu.add_feature("Player Bar State Tags 2", "toggle", PlaybarParent, function(feat)
	if feat["on"] and  NetEventHookID1 == 0 then
	_G.ScriptConfig["PB_State_Tags"] = true
		NetEventHookID1 = hook.register_net_event_hook(NetEventsHook)
		return HANDLER_POP
	elseif not feat["on"] and NetEventHookID1 ~= 0 then
	_G.ScriptConfig["PB_State_Tags"] = false
		hook.remove_net_event_hook(NetEventHookID1)
		NetEventHookID1 = 0
		return HANDLER_POP
	end
	return HANDLER_POP
end)
NetEvent_Hook["on"] = _G.ScriptConfig["PB_State_Tags"]


_G.MoistNotify("Net Events Module Loaded", "")

-- event.add_event_listener("exit", function()
	-- if NetEventHookID1 ~= 0 then
		-- hook.remove_net_event_hook(NetEventHookID1)
	-- end
	-- if PlayerTaghook_id ~= 0 then
	-- hook.remove_script_event_hook(PlayerTaghook_id)
	-- end
	-- --event.remove_event_listener(Event_Listener)

-- end)



