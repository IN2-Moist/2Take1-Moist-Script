
if not MoistScript_NextGen then
	return
end

if MoistScript_ESP_Module == 'loaded' then
	return
end

MoistScript_ESP_Module = "loaded"

local GTA_Natives = require("MoistScript_GTA_Natives")

local function Round(num, dp)
    local mult = 10^(dp or 0)
    return ((num * mult + 0.5) // 1) / mult 
end


Features.ESP_Parent = menu.add_feature("ESP Options", "parent", Features.LocalSettings.id)
Features.ESP_PED_Parent = menu.add_feature("PED ESP Options", "parent", Features.ESP_Parent.id)
Features.ESP_PED_Draw = menu.add_feature("ESP PED Draw Options", "parent", Features.ESP_PED_Parent.id)

Features.ESP_VEH_Parent = menu.add_feature("Vehicle ESP Options", "parent", Features.ESP_Parent.id)
Features.ESP_VEH_Draw = menu.add_feature("ESP Vehicle Draw Options", "parent", Features.ESP_VEH_Parent.id)

local ESP_Parent = Features.ESP_Parent
local ESP_PED_Parent = Features.ESP_PED_Parent
local ESP_VEH_Parent = Features.ESP_VEH_Parent

local ESP_PED_Extension = menu.add_feature("ESP PED Extended", "value_f", ESP_PED_Parent.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end

    while feat["on"] do
		local MyPos = player.get_player_coords(player.player_id())
        local AllPeds = ped.get_all_peds()
        for i=1,#AllPeds do
			local pedinfo
			if not ped.is_ped_a_player(AllPeds[i]) then
				local PedPos = entity.get_entity_coords(AllPeds[i])
				local distance = MyPos:magnitude(PedPos)
				if distance < feat["value"] then
					pedinfo = "Health: " .. tostring(ped.get_ped_health(AllPeds[i])) .. "\nGod: " .. tostring(entity.get_entity_god_mode(AllPeds[i]))
					local pedveh = ped.get_vehicle_ped_is_using(AllPeds[i])
					if pedveh ~= 0 then
						pedinfo = pedinfo .. "\nVehGod: " .. tostring(entity.get_entity_god_mode(ped.get_vehicle_ped_is_using(AllPeds[i])))
					end
					local boolpos, bonepos = ped.get_ped_bone_coords(AllPeds[i], 12844, v3())
					if boolpos then
						
						local success, pos = graphics.project_3d_coord(bonepos + v3(0.0,0.0,0.38))
						if success then
							pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x)
							pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y)
							
							
							--  scriptdraw.draw_text(pedinfo, pos, v2(-0.2,0.10), 0.50, 0xFFFFFFFF, 1 << 1 | 1 << 0 | 1 << 2, nil)
							scriptdraw.draw_text(pedinfo, pos, v2(), 0.50, 0xFFFFFFFF, 1 << 1 | 1 << 0 | 1 << 2, nil)
							
						end
					end
				end
			end
		end
		
        system.yield()
	end
end)
ESP_PED_Extension["max"] = 10000.00
ESP_PED_Extension["min"] = 1.00
ESP_PED_Extension["mod"] = 10.50
ESP_PED_Extension["value"] = 1450.00
ESP_PED_Extension["on"] = false


local DistModifier = menu.add_feature("ESP Step Modifier", "autoaction_value_f", ESP_PED_Parent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	ESP_PED_Extension["mod"] = tonumber(feat["value"])
end)
DistModifier["max"] = 200.00
DistModifier["min"] = 1.50

local ESP_VEH_Extension = menu.add_feature("ESP Vehicle Extended", "value_f", ESP_VEH_Parent.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
    while feat["on"] do
		local MyPos = player.get_player_coords(player.player_id())
        local AllVehicles = vehicle.get_all_vehicles()
        for i=1,#AllVehicles do
            local veh = AllVehicles[i]
			local VehPos = entity.get_entity_coords(veh)
            local distance = MyPos:magnitude(VehPos)
            if distance < feat["value"] then
				local success, pos = graphics.project_3d_coord(entity.get_entity_coords(veh))
				if success then
					pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x)
					pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y)
					
					local speed = entity.get_entity_speed(veh)
					scriptdraw.draw_text(Round(speed * 2.23694, 2) .. " MPH\nVehGod = " .. tostring(entity.get_entity_god_mode(AllVehicles[i])) .. "\nDist = " .. tostring(MyPos:magnitude(VehPos)), pos, v2(), 0.5, 0xFFFFFFFF, 1 << 0 | 1 << 2, nil)
				end
			end
		end
        system.yield()
	end
end)
ESP_VEH_Extension["max"] = 10000.00
ESP_VEH_Extension["min"] = 1.00
ESP_VEH_Extension["mod"] = 10.50
ESP_VEH_Extension["value"] = 1450.00
ESP_VEH_Extension["on"] = false

local vehDistModifier = menu.add_feature("ESP Step Modifier", "autoaction_value_f", ESP_VEH_Parent.id,function(feat)
	if type(feat) == "number" then
		return
	end
	ESP_VEH_Extension["mod"] = tonumber(feat["value"])
end)
vehDistModifier["max"] = 200.00
vehDistModifier["min"] = 1.50
vehDistModifier["value"] = 2.00


	
function OffsetCoords(pos, heading, distance)
    heading = math.rad((heading - 180) * -1)
    return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end

function get_offset(dist, Entity)
	local pos = entity.get_entity_coords(Entity)
	print(string.format("%s, %s, %s", pos.x, pos.y, pos.z))
	offsetPos = OffsetCoords(pos, entity.get_entity_heading(Entity), dist)
	print(string.format("%s, %s, %s", offsetPos.x, offsetPos.y, offsetPos.z))
end


local function Draw_veh(feat)
		if type(feat) == "number" then
		return
	end
	local veh = vehicle.get_all_vehicles()
	for i =1, #veh do
		if entity.is_entity_a_vehicle(veh[i]) then
		local EDim1, EDim2 = entity.get_entity_model_dimensions(veh[i])
			local pos = entity.get_entity_coords(veh[i])
			 local vec1 = entity.get_entity_forward_vector(veh[i]) * -2.0
			 local vec2 = entity.get_entity_forward_vector(veh[i]) * 2.0
			EDim1 = EDim1 + v3(0.0,EDim1.x,-0.25)
			EDim2 = EDim2 + v3(0.0,EDim2.x,700.00)
			if vehicle.get_ped_in_vehicle_seat(veh[i], -1) ~= player.get_player_ped(player.player_id()) then
				GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z, 255, 175, 0, 150)
end
		end
	end
		system.yield()

end

local function Draw_veh2(feat)
		if type(feat) == "number" then
		return
	end
	local veh = vehicle.get_all_vehicles()
	for i =1, #veh do
		if entity.is_entity_a_vehicle(veh[i]) then
		local EDim1, EDim2 = entity.get_entity_model_dimensions(veh[i])
			local pos = entity.get_entity_coords(veh[i])
			-- local rot = entity.get_entity_rotation(veh[i])
			
			-- local vec1 = entity.get_entity_forward_vector(veh[i]) * 0.1
			-- local vec2 = entity.get_entity_forward_vector(veh[i]) * -0.1
			
			
			--EDim1 = (EDim1 + vec2)
			--EDim1 = v3(EDim1.x - EDim2.x, EDim1.y - EDim2.y, EDim1.z)
			--EDim2 = v3(EDim2.x * 2, EDim2.y * 2, EDim2.z)
			--EDim1 = EDim1 + v3(-0.85,-0.85,-0.85)
			--EDim2 = EDim2 + v3(0.85,0.85,0.85)
			
			EDim1 = EDim1 + v3(EDim1.y,0.0,0.0)
			EDim2 = EDim2 + v3(EDim2.y,0.0,0.0)
			
			
			
			--EDim2.x = EDim2.x - EDim2.x
			
			--EDim1 = EDim1 + v3(0.0,EDim1.y,-0.2)
			--EDim2 = EDim2 + v3(EDim2.y,EDim2.x,0.2)
			
			if vehicle.get_ped_in_vehicle_seat(veh[i], -1) ~= player.get_player_ped(player.player_id()) then
				
				GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z,  255, 175, 0, 120)
				
			end
		end
	end
		system.yield()

end

local function Draw_ped(feat)
		if type(feat) == "number" then
		return
	end
	local peds = ped.get_all_peds()
	for i =1, #peds do
		if entity.is_entity_a_ped(peds[i]) then
		if not ped.is_ped_a_player(peds[i]) then
			local EDim1, EDim2 = entity.get_entity_model_dimensions(peds[i])
			local pos = entity.get_entity_coords(peds[i])
			EDim1 = EDim1 + v3(0.0,EDim1.x,-0.25)
			EDim2 = EDim2 + v3(0.0,EDim2.x,700.00)
		--	EDim1 = EDim1 + v3(-0.25,-0.25,-0.25)
		--	EDim2 = EDim2 + v3(0.25,0.25,700.00)
				GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z, 255, 50, 50, 100)
				
			end
		end
	end
		system.yield()

end

local function Draw_ped2(feat)
		if type(feat) == "number" then
		return
	end
	local peds = ped.get_all_peds()
	for i =1, #peds do
		if  entity.is_entity_a_ped(peds[i]) then
		if not ped.is_ped_a_player(peds[i]) then
			local EDim1, EDim2 = entity.get_entity_model_dimensions(peds[i])
			local pos = entity.get_entity_coords(peds[i])

			EDim1 = EDim1 + v3(0.0,EDim1.x,-0.2)
			EDim2 = EDim2 + v3(0.0,EDim2.x,0.2)
				GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z,  255, 50, 50, 100)
				
			end
		end
	end

		system.yield()
end

local function Draw_PlayerPed(feat)
		if type(feat) == "number" then
		return
	end
	local peds = ped.get_all_peds()
	for i = 1, #peds do
		if ped.is_ped_a_player(peds[i]) == true then
			local EDim1, EDim2 = entity.get_entity_model_dimensions(peds[i])
			
			local playerCoord = player.get_player_coords(player.player_id())
			local PedPos = entity.get_entity_coords(peds[i])
		if playerCoord:magnitude(PedPos) <= feat.value then
			local EDim1, EDim2 = entity.get_entity_model_dimensions(peds[i])
			local pos = entity.get_entity_coords(peds[i])

			EDim1 = EDim1 + v3(0.0,EDim1.x,-0.2)
			EDim2 = EDim2 + v3(0.0,EDim2.x,0.2)
			if player.get_player_from_ped(peds[i]) ~= player.player_id() then
			
			pos = pos + (entity.get_entity_forward_vector(peds[i]) * 0.01)
			
				GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z,  255, 255, 255, 100)
				
			end
		end
	end
		end
		system.yield()

end

local function Draw_ObjBox(feat)
	if type(feat) == "number" then return end
	local obj = object.get_all_objects()
	for i =1, #obj do
		if entity.is_entity_an_object(obj[i]) then
			local EDim1, EDim2 = entity.get_entity_model_dimensions(obj[i])
			local pos = entity.get_entity_coords(obj[i])
			local playerCoord = player.get_player_coords(player.player_id())
			if playerCoord:magnitude(pos) >= 25.0 then
			-- local vec1 = entity.get_entity_forward_vector(ped[i]) * 0.1
			-- local vec2 = entity.get_entity_forward_vector(ped[i]) * -0.1
			
			-- local rot = entity.get_entity_rotation(ped[i])
			
			-- EDim1 = (EDim1 + vec2)
			-- EDim2 = (EDim2 + vec1) 
			EDim1 = EDim1 + v3(0.0,EDim1.x,-0.2)
			EDim2 = EDim2 + v3(0.0,EDim2.x,0.2)
			GTA_Natives.DRAW_BOX(pos.x + EDim1.x, pos.y + EDim1.y, pos.z + EDim1.z, pos.x + EDim2.x, pos.y + EDim2.y, pos.z  + EDim2.z,  0, 255, 0, 100)
			end
		end
	end
		system.yield()

end

local BOXESP_v = menu.add_feature("Tall Box Vehicle ESP", "toggle", Features.ESP_VEH_Draw.id, function(feat)
		if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		Draw_veh(feat)
	--	system.yield()
	end
	
end)

local BOXESP_v2 = menu.add_feature("Box Vehicle ESP", "toggle", Features.ESP_VEH_Draw.id, function(feat)
		if type(feat) == "number" then
		return
	end
	while feat["on"] do
		Draw_veh2(feat)
	--	system.yield()
	end
	
end)

local Object_BOX_ESP = menu.add_feature("Box Object ESP", "toggle", ESP_Parent.id, function(feat)
		if type(feat) == "number" then
		return
	end
	while feat.on do
		Draw_ObjBox(feat)
	--	system.yield()
	end
	
end)

local Player_ESP_Box = menu.add_feature("Player_ESP_Box Distance:", "value_f", ESP_Parent.id, function(feat)
		if type(feat) == "number" then
		return
	end
	while feat.on do
		Draw_PlayerPed(feat)
	--	system.yield()
	end
	
end)
Player_ESP_Box.max = 10000.00
Player_ESP_Box.min = 0.00
Player_ESP_Box.mod = 100.25
Player_ESP_Box.value = 5000.00

local BOXESP_p = menu.add_feature("Tall Box PED ESP", "toggle", Features.ESP_PED_Draw.id, function(feat)
		if type(feat) == "number" then
		return HANDLER_POP
	end
	    while feat["on"] do
		Draw_ped(feat)
	--	system.yield()
	end
	
end)

local BOXESP_p2 = menu.add_feature("Box PED ESP", "toggle", Features.ESP_PED_Draw.id, function(feat)
		if type(feat) == "number" then
		return HANDLER_POP
	end
	while feat["on"] do
		Draw_ped2(feat)
	--	system.yield()
	end
	
end)

