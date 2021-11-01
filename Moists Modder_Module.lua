Modder_threads = {}



God_Check_pid_thread = function(pid)
    while true do
        if player.is_player_valid(pid) ~= false and pid ~= player.player_id()then
            local pped, plyveh, name
            if player.is_player_god(pid) or player.is_player_vehicle_god(pid) then
                system.wait(2000)
                local Entity = ""
                pped = player.get_player_ped(pid)
                name = player.get_player_name(pid)
                if pped ~= nil or pped ~= 0 then
                    local pos = v3()
                    plyveh = player.get_player_vehicle(pid)
                    if Players[pid].isint then return end
                    if not Players[pid].PedSpawned then return end
                    if player.is_player_god(pid) or player.is_player_vehicle_god(pid) and player.is_player_playing(pid) and not entity.is_entity_dead(pped) then
                        system.wait(2000)
                        if not Players[pid].isint and player.is_player_playing(pid) and not entity.is_entity_dead(pped) and player.is_player_god(pid) then

                            --if tracking.playerped_speed1[pid + 1] >= 21 then
                            if Settings["GodCheckNotif"] and not Players[pid].isgod then
                                Entity = "Player God mode"

                                Players[pid].isgod = true

                                moist_notify(Entity .. "\n" .. pid .. " : " .. tostring(name), "God Mode Player Detected\nMoists Modder Module")
                                ModderAudio_notify()

                            end
                            --end
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
                                    moist_notify(Entity .. "\n" .. pid .. " : " .. tostring(name), "Player Vehicle God Mode Detected\nMoists Modder Module")
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
    PlayerSpawnNetHook = function(b, c, d)
        if d == 11 then
            local e, f
            e = player.get_player_name(b)
            f = player.get_player_name(c)
            --  Print("\nNetEvent[" .. d .. "]" .. " | " .. b .. " : " .. e .. " : " .. c .. " | " .. f .. "\n")

            Players[b].PedSpawned = true
            return false
        elseif d ~= 11 then
            return false
        end
    end
    spawn_net()
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
players()
Modder_threads[#Modder_threads + 1] = menu.create_thread(SpawnNetEvent, spawn_feat)
