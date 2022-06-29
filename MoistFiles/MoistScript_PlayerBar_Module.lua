
function PlayerBarMain(feat)
if not MoistScript_NextGen then
	return HANDLER_POP
end

if MoistScript_PlayerBar_Module == 'loaded' then
	return HANDLER_POP
end

MoistScript_PlayerBar_Module = "loaded"
local ScriptConfig = _G.ScriptConfig
local PlayerBarFeats = {}
local PCR, PCG, PCB, PCA
local PCR1, PCG1, PCB1, PCA1 = 255, 255, 255, 255
local PCR2, PCG2, PCB2, PCA2 = 0, 0, 0, 255
local Root =  utils.get_appdata_path("PopstarDevs", "2Take1Menu")

if not (package.path):find(Root .. "\\scripts\\MoistFiles\\?.lua", 1, true) then
	package.path = Root .. "\\scripts\\MoistFiles\\?.lua;" .. package.path
end

local natives = require("Natives")


PlayerBarFeats.PlayerbarParent = menu.add_feature("PlayerBar Options", "parent", Features.LocalSettings.id)
local Session_PB_Players = {
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
	}
}

local function Player_add(pid)
	Session_PB_Players[pid] = {}
	Session_PB_Players[pid].Name = tostring(player.get_player_name(pid))
	Session_PB_Players[pid].NameLabel = tostring(player.get_player_name(pid))
	Session_PB_Players[pid].scid = player.get_player_scid(pid)
	Session_PB_Players[pid].tags = nil
	Session_PB_Players[pid].speed = 0.0
	Session_PB_Players[pid].isOTR = false
	Session_PB_Players[pid].OTRTNotify = false
	Session_PB_Players[pid].OTR_Start = nil
	Session_PB_Players[pid].Notified = false
	Session_PB_Players[pid].interior = false
	Session_PB_Players[pid].isTalking = false
	Session_PB_Players[pid].PedSpawned = false
	
end

_G.Session_PB_Players = Session_PB_Players

for pid = 0, 31 do
	Player_add(pid)
end


local joined = event.add_event_listener("player_join", function(e)

	Player_add(e.player)
	return
end)

local left = event.add_event_listener("player_leave", function(e)

	Player_add(e.player)
	
	return
end)


local function GetFlagText(pid)
	local flagtext = ""
	local texts <const> = {}
	local flags = player.get_player_modder_flags(pid)
	for i = 0, 63 do
		texts[#texts + 1] = flags & 1 << i == 1 << i  and player.get_modder_flag_text(1 << i) or nil
	end
	for i = 1, #texts do
		flagtext = flagtext .. " | " .. tostring(texts[i])
	end
	return flagtext
end

local Modder_EventLog = event.add_event_listener("modder", function(e)
    if e.player ~= nil then
        local pid = e.player
		local name = player.get_player_name(pid)
		local flagtext = GetFlagText(pid)
        if not Session_PB_Players[pid].Notified then
            MoistNotify("[Modder Detected] " .. tostring(pid) .. " : " .. tostring(name).. " | " .. flagtext, "", 0xff0000ff)
            --Debug_Out(string.format("[Modder]: " .. tostring(name).. " [Modder Flags]: " .. flagtext))
            Session_PB_Players[pid].Notified = true
		end
	end
    return
end)

--TODO: **********  PLAYER BAR ***************
--[[
PlayerBarFeats["ResetNotif"] = menu.add_feature("Reset Notified", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	local notiftimes = {}
	if PlayerBarFeats["ResetNotif"].on then
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				if Session_PB_Players[pid].Notified == true and notiftimes[pid+1] == nil then
					notiftimes[pid+1] = os.clock()
				end
				if notiftimes[pid+1] ~= nil then
					if (os.clock() - notiftimes[pid+1]) >= 60 then
						Session_PB_Players[pid].Notified = false
					end
				end
			end
		end
		return HANDLER_CONTINUE
	end
end)
PlayerBarFeats["ResetNotif"].on = true
PlayerBarFeats["ResetNotif"].hidden = true
]]
PlayerBarFeats["ResetNotif"] = menu.add_feature("Reset Notified", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	local notiftimes = {}
	if feat.on then
		for pid = 0, 31 do
			if player.is_player_valid(pid) then
				if Session_PB_Players[pid].Notified == true and notiftimes[pid+1] == nil then
					notiftimes[pid+1] = os.clock()
				end
				if notiftimes[pid+1] ~= nil then
					if (os.clock() - notiftimes[pid+1]) >= 60 then
						Session_PB_Players[pid].Notified = false
					end
				end
				system.yield(10)
			end
			system.yield(10)
		end
		return HANDLER_CONTINUE
	end
end)
PlayerBarFeats["ResetNotif"].on = true
PlayerBarFeats["ResetNotif"].hidden = true



PlayerBarFeats["speedTracker"] = menu.add_feature("Track all Players speed", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	if feat.on then
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
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
PlayerBarFeats["speedTracker"].on = _G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["speedTracker"].hidden = true

PlayerBarFeats["Player_BarLoop"] = menu.add_feature("Player Loop Function", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	while feat.on do
		for pid = 0, 31 do
			if not player.is_player_valid(pid) then
				Player_add(pid)
			end
			if player.is_player_valid(pid) then
				Player_add(pid)
				system.yield(200)
			end
		end
		system.yield(200)
	end
	
	return HANDLER_POP
end)
PlayerBarFeats["Player_BarLoop"].on = _G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["Player_BarLoop"].hidden = true

PlayerBarFeats["Player_bar"] = menu.add_feature("Player Bar OSD", "toggle", PlayerBarFeats.PlayerbarParent.id, function(feat)
	PlayerBarFeats["Player_BarLoop"].on = true
	PlayerBarFeats["speedTracker"].on = true
	PlayerBarFeats["ResetNotif"].on  = true
	_G.ScriptConfig["PlayerBar_ON"] = true
	local pos = v2()
	local Player_Name1, Player_Name
	local hosttag, SHost_tag, OTR_tag, MOD_tag, Bounty_tag, Typing_tag, Voice_tag = "~b~[H]","~y~[S]","~g~[O]","~y~[~r~M~y~]","~b~[~q~B~b~]","~q~[~b~T~q~]","~q~[~y~VC~q~]"
	
	if PlayerBarFeats["Player_bar"].on then

		if network.is_session_started() then
		ui.draw_rect(0.001, 0.001, 2.5, 0.085, 0, 0, 0, 240)
		pos.x = 0.0001
		pos.y = 0.0001
			local ScriptHost, SessionHost = script.get_host_of_this_script(), player.get_host()
			for pid = 0, 31 do
				if player.is_player_valid(pid) and Session_PB_Players[pid].Name ~= nil then
					Player_Name = tostring(Session_PB_Players[pid].Name)
					local pped = player.get_player_ped(pid)
					
					PCR, PCG, PCB, PCA = 255, 255, 255, 255
					if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~q~" .. tostring(Player_Name) 
						PCR, PCG, PCB, PCA = 255, 0, 255, 185
						
					end
					if player.is_player_god(pid) and player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~q~~h~" .. tostring(Player_Name) 
						PCR, PCG, PCB, PCA = 255, 0, 255, 200
					end
					if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~o~" .. tostring(Player_Name) 
					end
					if player.is_player_vehicle_god(pid) and not player.is_player_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~o~~h~" .. tostring(Player_Name) 
					end
					if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == true then
						Player_Name = "~r~" .. tostring(Player_Name) 
					end
					if player.is_player_god(pid) and not player.is_player_vehicle_god(pid) and Session_PB_Players[pid].interior == false then
						Player_Name = "~r~~h~" .. tostring(Player_Name) 
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
					end
					if pid == ScriptHost then
						Player_Name =  Player_Name .. SHost_tag
					end
					if (script.get_global_i(2689224 + (1 + (pid * 451)) + 207) ==  1) then
						Player_Name =  Player_Name .. OTR_tag
					end
					if (script.get_global_i(1835502 + (1 + (pid * 3)) + 4) == 1) then
						Player_Name =  Player_Name .. Bounty_tag
					end
					if (script.get_global_i(1644218 + (2 + (pid * 1) + (241 + 136)))& 1 << 16 ~= 0)  then
						Player_Name =  Player_Name .. Typing_tag
					end
					if Session_PB_Players[pid].isTalking then
						Player_Name =  Player_Name .. Voice_tag
					end			
					if player.is_player_modder(pid, -1) then
						Player_Name =  Player_Name .. MOD_tag
					end
					ui.set_text_scale(0.178)
					ui.set_text_color(PCR, PCG, PCB, PCA)
					ui.set_text_font(0)
					ui.set_text_centre(false)
					ui.set_text_outline(true)
					ui.draw_text(tostring(Player_Name).. " ", pos)
					pos.x = pos.x + 0.090
				end
				
			end
			
		end
		return HANDLER_CONTINUE
	end
	PlayerBarFeats["Player_BarLoop"].on = false
	PlayerBarFeats["speedTracker"].on = false
	PlayerBarFeats["ResetNotif"].on  = false
	_G.ScriptConfig["PlayerBar_ON"] = false
	return HANDLER_POP
end)
PlayerBarFeats["Player_bar"].on = _G.ScriptConfig["PlayerBar_ON"]
PlayerBarFeats["Player_bar"].hidden = false


_G.MoistNotify("Player Bar Module Loaded", "")
end
local PlayerBarThread = menu.create_thread(PlayerBarMain, feat)

event.add_event_listener("exit", function()
	--clean up shit
	menu.delete_thread(PlayerBarThread)
end)

