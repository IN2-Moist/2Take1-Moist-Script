
if not MoistScript_NextGen then
	return HANDLER_POP
end

if MoistScript_ESP_Module == 'loaded' then
	return HANDLER_POP
end

MoistScript_ESP_Module = "loaded"


local function Round(num, dp)
    local mult = 10^(dp or 0)
    return ((num * mult + 0.5) // 1) / mult 
end


Features.ESP_Parent = menu.add_feature("ESP Options", "parent", Features.LocalSettings.id)
Features.ESP_PED_Parent = menu.add_feature("PED ESP Options", "parent", Features.ESP_Parent.id)
Features.ESP_VEH_Parent = menu.add_feature("Vehicle ESP Options", "parent", Features.ESP_Parent.id)

local ESP_Parent = Features.ESP_Parent
local ESP_PED_Parent = Features.ESP_PED_Parent
local ESP_VEH_Parent = Features.ESP_VEH_Parent

local ESP_PED_Extension = menu.add_feature("ESP PED Extended", "value_f", ESP_PED_Parent.id, function(feat)
	
	
	
    while feat.on do
	 local MyPos = player.get_player_coords(player.player_id())
        local AllPeds = ped.get_all_peds()
        for i=1,#AllPeds do
		local pedinfo
		if not ped.is_ped_a_player(AllPeds[i]) then
		local PedPos = entity.get_entity_coords(AllPeds[i])
            local distance = MyPos:magnitude(PedPos)
            if distance < feat.value then
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
		
        system.yield(0)
    end
end)
ESP_PED_Extension.max = 10000.00
ESP_PED_Extension.min = 1.00
ESP_PED_Extension.mod = 10.50
ESP_PED_Extension.value = 1450.00
ESP_PED_Extension.on = false


local DistModifier = menu.add_feature("ESP Step Modifier", "autoaction_value_f", ESP_PED_Parent.id, function(feat)
	ESP_PED_Extension.mod = tonumber(feat.value)
end)
DistModifier.max = 200.00
DistModifier.min = 1.50

local ESP_VEH_Extension = menu.add_feature("ESP Vehicle Extended", "value_f", ESP_VEH_Parent.id, function(feat)
    while feat.on do
	 local MyPos = player.get_player_coords(player.player_id())
        local AllVehicles = vehicle.get_all_vehicles()
        for i=1,#AllVehicles do
            local veh = AllVehicles[i]
			local VehPos = entity.get_entity_coords(veh)
            local distance = MyPos:magnitude(VehPos)
            if distance < feat.value then
            local success, pos = graphics.project_3d_coord(entity.get_entity_coords(veh))
            if success then
                pos.x = scriptdraw.pos_pixel_to_rel_x(pos.x)
                pos.y = scriptdraw.pos_pixel_to_rel_y(pos.y)
                
                local speed = entity.get_entity_speed(veh)
                scriptdraw.draw_text(Round(speed * 2.23694, 2) .. " MPH\nVehGod = " .. tostring(entity.get_entity_god_mode(AllVehicles[i])) .. "\nDist = " .. tostring(MyPos:magnitude(VehPos)), pos, v2(), 0.5, 0xFFFFFFFF, 1 << 0 | 1 << 2, nil)
            end
        end
		end
        system.yield(0)
    end
end)
ESP_VEH_Extension.max = 10000.00
ESP_VEH_Extension.min = 1.00
ESP_VEH_Extension.mod = 10.50
ESP_VEH_Extension.value = 1450.00
ESP_VEH_Extension.on = false

local vehDistModifier = menu.add_feature("ESP Step Modifier", "autoaction_value_f", ESP_VEH_Parent.id, function(feat)
	ESP_VEH_Extension.mod = tonumber(feat.value)
end)
vehDistModifier.max = 200.00
vehDistModifier.min = 1.50
vehDistModifier.value = 2.00
