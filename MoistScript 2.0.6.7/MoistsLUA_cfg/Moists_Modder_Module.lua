

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




Modder_threads = {}


local notifyspawn = menu.add_feature("spawn nofify", "toggle", 0, nil)
notifyspawn.on = false
notifyspawn.hidden = true
function notifyspawns(pid)
    if notifyspawn.on then
        moist_notify(pid .. " : " .. tostring(player.get_player_name(pid)) .. "\nSpawned")
    end
end

God_Check_pid_thread = function(pid)
    while true do
            local pped, plyveh, name
    pped = player.get_player_ped(pid)
    name = player.get_player_name(pid)
    plyveh = player.get_player_vehicle(pid)

            if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                system.wait(8000)
                    if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and not entity.is_entity_dead(pped) then
                        if ai.is_task_active(pped, 4) or  ai.is_task_active(pped, 290) or  ai.is_task_active(pped, 298) or  ai.is_task_active(pped, 422) then
                            
                            if Settings["GodCheckNotif"] and not Players[pid].isgod then
                                Entity = "Player God mode"

                                Players[pid].isgod = true
                                moist_notify(pid .. " : " .. name .. "\nPlayer God: " .. tostring(player.is_player_god(pid)) .. "\nVehicle God: " .. tostring(player.is_player_vehicle_god(pid)), "God Mode Player Detected\nMoists Modder Module")
                        end
                        end
                       
                    elseif player.is_player_god(pid) or player.is_player_vehicle_god(pid) and  not entity.is_entity_dead(pped) then
                    if ai.is_task_active(pped, 200) or  ai.is_task_active(pped, 295) and  ai.is_task_active(pped, 199) then
                                if Settings["GodCheckNotif"] and not Players[pid].isvgod then
                                    Entity = "Player Vehicle God mode"
                                    Players[pid].isvgod = true
                                    moist_notify(Entity .. "\n" .. pid .. " : " .. tostring(name), "Player Vehicle God Mode Detected\nMoists Modder Module")
                                    ModderAudio_notify()
                                end
                            end
                        end
                
            end

        system.wait(2)
    end
    system.wait(2)
end


local spawn_feat
local spawnwait = 0
NetEventHookID1 = 0

function SpawnNetEvent()

function spawn_net()
        if NetEventHookID1 == 0 then
            NetEventHookID1 = hook.register_net_event_hook(PlayerSpawnNetHook)
            return HANDLER_POP
        end
        if NetEventHookID1 ~= 0 then
            hook.remove_net_event_hook(NetEventHookID1)
            NetEventHookID1 = 0
        end
end
PlayerSpawnNetHook = function(source, target, NetEventID)
        if NetEventID == 11 then
            local e, f
            e = player.get_player_name(source)
            f = player.get_player_name(target)
            notifyspawns(source)

            Players[source].PedSpawned = true
            return false
        end
        if NetEventID == 71 then
            Players[source].isTalking = true
            
        return false
        
        end
          Players[source].isTalking = false
        if NetEventID == 43 or NetEventID == 12 or NetEventID == 13 or NetEventID == 14 then
            local e, f
            e = player.get_player_name(source)
            f = player.get_player_name(target)
        moist_notify("Blocked: NetEvent[" .. tostring(NetEventID) .. "] " .. tostring(NetEvents[NetEventID]) .. "\n" .. tostring(source) .. " : " .. tostring(e) .. " ->:-> " .. tostring(target) .. " | " .. tostring(f) .. "\n", "Moists Modder Module")
        player.set_player_as_modder(source, 67108864)
       
        return true
    end
    return false
end
    spawn_net()
    
    moist_notify("Modder Module Loaded")
end

local players = function()
    if not Settings["GodCheck"] then return end
    for pid = 0, 32 do
        Modder_threads[#Modder_threads + 1] = menu.create_thread(God_Check_pid_thread, pid)
    end
end


event.add_event_listener("exit", function()
    hook.remove_net_event_hook(NetEventHookID1)
    for i = 1, #Modder_threads do
        menu.delete_thread(Modder_threads[i])
    end
end)
--players()
Modder_threads[#Modder_threads + 1] = menu.create_thread(SpawnNetEvent, spawn_feat)
