local Moist_Translate = {lang = "EN"}

function Moist_Translate.localmenu(feat)
	
	Features.LocalParent.name = "Moist Script NG Trans"
	Features["ParentLabel"].name = "Next Generation Moist Script 3.0.0.0 Translated!"
	LocalFeatures.Self_Parent.name = "Self Features"
	LocalFeatures.Stats.name = "Stat Features"
	LocalFeatures["stringstatset"].name = "Set Stat: "
	LocalFeatures.Self_WeaponStuff.name = "Weapon Related Functions"
	LocalFeatures.UlWeClip.name = "Weapon Clip: "
	LocalFeatures.UlWeClip:set_str_data({"Unlimited","Standard"})
	LocalFeatures.WeapExpRad.name = "Explosion Multiplier"
	LocalFeatures.Projectiles.name = "Destroy Projectiles(WIP)"
	LocalFeatures.AirDefense.name = "Portable Defenses Anti Player Vehicle"
	LocalFeatures.AirDefense2.name = "Portable Defenses Anti Player Ped"
	LocalFeatures.RemAllAirDef.name = "Remove All Air Defense Zone"
	LocalFeatures.Self_Ped.name = "Player Ped Features"
	Features.LocalModules.name = "Load MoistScript Modules"
	LocalFeatures.wetnessframe.name = "Make My Ped Wet! :P"
	LocalFeatures.IAMACOP.name = "Turn Me into a Cop (Cops Act like you are!)"
	LocalFeatures.Self_Veh.name = "Player Vehicle Features"
	LocalFeatures.Turbulance.name = "AirCraft Turbulance"
	LocalFeatures.Aileron.name = "Disable Plane Aileron"
	LocalFeatures.VehDamageProof.name = "Set Vehicle Damage Proof"
	LocalFeatures.VehEngAudioMod.name = "Engine Audio: "
	LocalFeatures.CargoBobMod.name = "CargoBob Mod"
	LocalFeatures.CbobMagnet.name = "CargoBob: "
	LocalFeatures.CbobMagnet:set_str_data({"Hook","Magnet"})
	LocalFeatures.CbobMagMod1.name = "Magnet Pickup Strength: "
	LocalFeatures.CbobMagMod2.name = "Magnet Effect Radius: "
	LocalFeatures.CbobMagMod3.name = "Magnet Pull Rope Length: "
	LocalFeatures.CbobMagMod4.name = "Magnet Rope Length: "
	LocalFeatures.CbobMagMod5.name = "Magnet Pull Strength: "
	LocalFeatures.World_Parent.name = "World Features"
	LocalFeatures.Lightning.name = "LightningBolt Generator: "
	Features.LocalSettings.name = "MoistScript Settings"
	LocalFeatures["save_settings"].name = "Current Settings: "
	LocalFeatures["HotKeyParent"].name = "MoistScript HOTKEYS"
	LocalFeatures["SaveOptions_Hotkey"].name = "Options Save HotKey"
	Features.Modulelists.name = "Custom Lists for Features"
	Features.Modules_PlayerBar.name = "Load PlayerBar Module"
	Features.Modules_NetEvents.name = "Load Network Events Module"
	Features.Modules_ESP.name = "Load ESP Module"
	Features.Modules_Pedlist.name = "Load Ped List"
	Features.Modules_Vehlist.name = "Load Vehicle List"
	LocalFeatures.Aileron.name = "Disable Plane Aileron"
	LocalFeatures.AirDrag.name = "Set Air Drag Multiplier: "
	LocalFeatures.RiotMode.name = "Turn ON Riot Mode!"
	LocalFeatures.RadarZoom.name = "Set Radar Zoom: "
	LocalFeatures.RainLvl.name = "Set Rain Level:  "
	LocalFeatures.WaterOverStg.name = "Water Override Strength:  "
	LocalFeatures.WaterMod.name = "Modify Water Radius:  "
	LocalFeatures.RippleDis.name = "Water Ripple Disturbance:  "
	LocalFeatures.RippleBump.name = "Water Ripple Bumpiness:  "
	LocalFeatures.ShoreWaveAmp.name = "Override ShoreWave Amplitude:  "
	LocalFeatures.AirDrag.name = "Set Air Drag Multiplier: "
	LocalFeatures.NoRsEditorRec.name = "Disable R*Editor Recording"
	
	
end


function Moist_Translate.onlinemenu(feat)
	
	for pid = 0, 31 do
	Features.OnlineParent.feats[pid].name = "Moist Script NG trans"
	Features.RemovePlayer.feats[pid].name = "Remove Player"
	Features.PlayerInfo.feats[pid].name = "Player Info"
	Features.Troll.feats[pid].name = "Troll & Annoy"
	Features.GriefThisCunt.feats[pid].name = "Grief This Cunt ! !"
	Features.FramePlayer.feats[pid].name = "Grief Others (Frame Player)"
	Features.ScriptEvents.feats[pid].name = "Script Events"
	Features["CEO"].feats[pid].name = "CEO Features"
	OnlineFeats["FramedSessionOrbital"].feats[pid].name = "Framed Session Orbital Strike"
	OnlineFeats["FramedOrbital"].feats[pid].name = "Orbital Player: "
	OnlineFeatures["CuntCannon"].feats[pid].name = "Cunt Cannon!"
	OnlineFeats["GetZoneInfo"].feats[pid].name = "Get Player Zone Info"
	OnlineFeats["GetInteriorInfo"].feats[pid].name = "Get Interior from Collision"
	OnlineFeats["NetworkBail"].feats[pid].name = "Network Bail Kick"
	OnlineFeatures["CEOMoney"].feats[pid].name = "Loop Payment: "
	OnlineFeatures["OTR"].feats[pid].name = "Off The Radar"
	OnlineFeatures["NOCOPS"].feats[pid].name = "Cops Turn a Blind Eye"
	OnlineFeatures["SE_Crash"].feats[pid].name = "Send Event: "
	OnlineFeatures["VehSyncCrash"].feats[pid].name = "Lester Cummy WindSock Crash"
	OnlineFeatures["VehSyncCrash2"].feats[pid].name = "Use Ruiner Crash & Bail to Space"
	OnlineFeatures["REM_CEO"].feats[pid].name = "Remove CEO: "
	OnlineFeatures["SendCops"].feats[pid].name = "Dispatch Cops to Player Location"
	Features.OnlineParent.feats[pid].name = "Moist Script NG"
	OnlineFeatures["CuntCannon"].feats[pid].name = "Kill with: "
	OnlineFeatures["CuntCannon"].feats[pid]:set_str_data({"ALIEN CUNT CANNON","ORBITAL CUNT CANNON"})
	OnlineFeatures["CEOMoney"]:set_str_data({"10k CEO Money","15k CEO Money","20k CEO Money","30k CEO Money"})
	OnlineFeatures["SE_Crash"].feats[pid]:set_str_data({"Vector Crash","Stat Crash","Rando Crash","Moist Crash"})
	OnlineFeatures["REM_CEO"].feats[pid]:set_str_data({"Terminate","Dismiss","BAN"})
	OnlineFeatures["Force_to_Island"].feats[pid].name = "Force Player to Island"
	OnlineFeats["SetPlayerBlipFlash"].feats[pid].name = "Players Blip Flashes"
	OnlineFeatures["GangHarrasment"].feats[pid].name = "Gangs will Hassle Player"
	OnlineFeats["SetPlayerBlipFlash"].feats[pid].name = "Players Blip Flashes"
	OnlineFeats["SetMiniMap2PlayerBlip"].feats[pid].name = "Minimap Zoom to Players Blip"
	OnlineFeats["SetMiniMap2Player"].feats[pid].name = "Set Minimap to Players Location"
	OnlineFeats["ACKS"].feats[pid].name = "unAck TX's: "
	OnlineFeats["AVERAGE_LATENCY"].feats[pid].name = "Latency Test"
	Features.PlayerIPInfo.feats[pid]	.name = "Player IP Info"
	
	end
end

return Moist_Translate

