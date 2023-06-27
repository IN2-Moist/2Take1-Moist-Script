local Moist_Translate = {lang = "EN"}
Moist_is_Translated = true
ScriptConfig.MyLang = Moist_Translate.lang
MoistScript_NG_Translation_Version = "3.0.2.5"
if MoistScript_NextGen ~= MoistScript_NG_Translation_Version then
	menu.notify("MoistScript_NG Version & Translation Version are not The Same ! ! !", "", 30, 0xff0000ff)
return
end
--[[From Version 3.0.2.5 This Translation layout will be updated indicating the changes / additions inside each function Below
	
start of new Build features will be commented like so:]]
--[[---------------------- Example Build Indicators ----------------------]]

--[[INFO:[3.0.2.9]				(start of new stuff)

start:]]

--[[INFO:[3.0.3.0][Removed]
	
										(Stuff within the start and finish here will have been removed)
					(Failure to remove them after an update will cause the game to crash so this is important)
	
	
start:]]

--[[INFO:[3.0.3.0][Changed]				(Features that have changed name or details maybe even functionality completely
	
	
start:]]



--[[							(to indicate end of new / removed stuff)
end:]]

--[[--------------------------------- END ---------------------------------]]



function Moist_Translate.localmenu()	
--[[
INFO:

[---------------------- Local Features @ Start of Translation Versioning ----------------------]													
			|| MoistScript_NG_Translation_Version || Moist Script NG || 3.0.2.5 ||
[-----------------------------------------------------------------------------------------]	

start:]]
	
	
	Features.LocalParent.name = "Moist Script NG 3.0.2.5"
	LocalFeatures.Self_Parent.name = "Player Features"
	LocalFeatures.Self_Teleports.name = "Teleport Features"
	LocalFeatures.Online_Parent.name = "Online Features"
	LocalFeatures.Online_Data.name = "Moists Session Attributes"
	LocalFeatures.Online_ChatParent.name = "Chat Features"
	LocalFeatures.Online_ChatOptions.name = "Chat Options"
	LocalFeatures.History.name = "Player History"
	LocalFeatures.Session_Griefing.name = "Session Griefing"
	LocalFeatures.Session_Kicks.name = "Session Kick Functions"
	LocalFeatures.World_Parent.name = "World Features"
	LocalFeatures.UI_Parent.name = "Game UI Enhancements"
	LocalFeatures.Radar_Parent.name = "Radar Enhancements"
	LocalFeatures.ProjectileRadar_Parent.name = "Projectile Radar"
	Features.Tests.name = "Features Testing"
	LocalFeatures.Self_WeaponStuff.name = "Weapon Related Functions"
	LocalFeatures.PortableDefences.name = "Portable Defence Spheres"
	LocalFeatures.Self_Ped.name = "Player Ped Features"
	LocalFeatures.Self_Veh.name = "Player Vehicle Features"
	LocalFeatures.CargoBobMod.name = "Cargo Bob Mod"
	LocalFeatures.TrainControl.name = "Moist's Train Mod"
	LocalFeatures.EntityTools.name = "Entity Functions & Tools"
	LocalFeatures.ScriptLoader.name = "Moist Script Loader"
	LocalFeatures.LocalSettings.name = "Moist Script Settings"
	Features.AltSaveParent.name = "Save Settings Options"
	LocalFeatures.save_settings.name = "Current Settings: "
	LocalFeatures.AutoLoadExpSettings.name = "Auto Load Values"
	LocalFeatures.Protections.name = "Detections & Protections"
	LocalFeatures.ModderRelated.name = "Modder Flagging"
	LocalFeatures.Blacklist.name = "Blacklist Module"
	LocalFeatures.OrbitalProtex.name = "Detect Orbital Users "
	LocalFeatures.ThisScript.name = "Script = "
	LocalFeatures.MyGlobalState.name = "Global State = "
	LocalFeatures.Connected.name = "Connected Players = "
	LocalFeatures.SessMax.name = "Max Players = "
	LocalFeatures.EventCountA.name = "AI Events Q:"
	LocalFeatures.EventCountB.name = "Net Events Q:"
	LocalFeatures.HotKeyParent.name = "Moist Script HOTKEYS"
	LocalFeatures.SaveOptions_Hotkey.name = "Options Save Hotkey"
	LocalFeatures.MissionSetup_Hotkey.name = "Mission Protection Settings Hotkey"
	LocalFeatures.LocalModules.name = "Load Moist Script Modules"
	LocalFeatures.ChatSpamDelay.name = "Set Delay Between Sends"
	LocalFeatures.ChatSpamData.name = "Load Chat Data: "
	LocalFeatures.chatSpamLoop.name = "Spam Loop: "
	LocalFeatures.chatSpamOneShot.name = "Spam Once: "
	LocalFeatures.chatclipboard.name = "Send Clipboard Contents"
	LocalFeatures.Bounty_All.name = "Give All 10k Bounty"
	LocalFeatures.OTRALL.name = "Give All OTR"
	LocalFeatures.OrbitalNearbyPlayers.name = "Nearby Player Orbital Dist. "
	LocalFeatures.TakeHost.name = "Remove Host Queue until Host"
	LocalFeatures.SessionKick.name = "Session: "
	LocalFeatures.SessionSyncCrash.name = "Spawn Self Ruiner with Parachute Crash"
	LocalFeatures.SH_Helper.name = "Script Host Helper"
	LocalFeatures.Helper.name = "Helper"
	Cam_Main.name = "Camera Functions"
	LocalFeatures.AvengerTeleport.name = "teleport to avenger"
	FreeCamRX.name = "Cam X rot"
	FreeCamRY.name = "Cam Y rot"
	FreeCamRZ.name = "Cam Z rot"
	FreeCamMod.name = "Modifier Value"
	FreeCamInt.name = "Cam POS + ROT"
	LocalFeatures.CamReset.name = "Hard Reset Camera"
	FreeCamUpdate.name = "Update Cam"
	LocalFeatures.MissileCam.name = "Attach Cam to Nearest Projectile"
	LocalFeatures.GarbageTools.name = "Script Garbage Count"
	LocalFeatures.stringstatset.name = "Set Stat: "
	LocalFeatures.stringstatset.name = "Set Stat with Created logo: "
	LocalFeatures.stringstatset.name = "Set Stat with Verified logo: "

	LocalFeatures.ClubMoneyF.name = "Auto Nightclub Vault Money Fast Method"
	LocalFeatures.ClubMoneyFO.name = "Fast Nightclub Vault Money [VIP]"
	LocalFeatures.ClubMoneyS.name = "Auto Nightclub Vault Money (Slower Method)"
		LocalFeatures.SubGM_ExtRange_NoCD.name = "Sub Guided Missiles (+)Range (-)Cool-down"
	LocalFeatures.Drone_RangeNoCD.name = "TB Drone(+)Range+Speed (-)cool-down+recharge"
	LocalFeatures.CEO_Veh_CD.name = "CEO Vehicle Request No Cooldown"
	LocalFeatures.wetnessframe.name = "Make My Ped Wet! :P"
	LocalFeatures.MySexiness.name = "Give My Ped Sexiness:P"
	LocalFeatures.StoneHatchetMode.name = "Stone Hatchet No Cooldown & Duration Increase"
	LocalFeatures.GhostMyself.name = "Set Myself Ghosted to Other Players"
	LocalFeatures.Turbulance.name = "Aircraft Turbulence"
	LocalFeatures.AirDrag.name = "Set Air Drag Multiplier: "
	LocalFeatures.AltLvl.name = "Altitude Level Indication: "
	LocalFeatures.WindSpeed.name = "Set Wind Speed: "
	LocalFeatures.Aileron.name = "Disable Plane Aileron"
	LocalFeatures.CMeasures.name = "Set Counter Measures:"
	LocalFeatures.Bombs.name = "Set Bomb Count:"
	LocalFeatures.VehWepDam.name = "Vehicle Weapon Damage Multiplier: "
	LocalFeatures.StrongVeh.name = "Set Vehicle Strong (Less Damage)"
	LocalFeatures.TopSpeedOveride.name = "Modify Vehicle Top Speed: "
	LocalFeatures.SpeedOveride.name = "Max Speed Override: "
	LocalFeatures.VehPara.name = "Give My Vehicle A Parachute"
	LocalFeatures.CHAFFDURATION.name = "Set CHAFF DURATION"
	LocalFeatures.VolicBoost.name = "Voltic Boost Recharge Modifier: "
	LocalFeatures.PedDamageProof.name = "Set Ped Damage Proof"
	LocalFeatures.VehDamageProof.name = "Set Vehicle Damage Proof"
	LocalFeatures.VehEngAudioMod.name = "Engine Audio: "
	LocalFeatures.Enable_Trains2.name = "Enable Train Spawning"
	LocalFeatures.Track_Switch.name = "Track Switch"
	LocalFeatures.Train_Direction.name = "Switch Train Spawn Direction"
	LocalFeatures.Train_Spawn.name = "Spawn Train Variation: "
	LocalFeatures.Train_Cruise.name = "Train Cruise: "
	LocalFeatures.Train_speed.name = "Train Speed: "
	LocalFeatures.Train_stop.name = "Stop Train"
	Train_Control_Meter1.name = "Control Speed(Instant Insane Speed)"
	Train_Control_Meter2.name = "Control Input Cruise Speed"
	Train_Control_Meter3.name = "Control Meter"
	Train_Control_Brake.name = "Control Input Handbrake"
	Train_Derailed.name = "DeRail Train"
	LocalFeatures.CbobMagnet.name = "Cargo Bob: "
	LocalFeatures.CbobMagMod1.name = "Magnet Pickup Strength: "
	LocalFeatures.CbobMagMod2.name = "Magnet Effect Radius: "
	LocalFeatures.CbobMagMod3.name = "Magnet Pull Rope Length: "
	LocalFeatures.CbobMagMod4.name = "Magnet Rope Length: "
	LocalFeatures.CbobMagMod5.name = "Magnet Pull Strength: "
	LocalFeatures.IAMACOP.name = "Turn Me into a Cop (Cops Act like you are!)"
	LocalFeatures.NoMoreOneShot.name = "No More One Shot Hits"
	LocalFeatures.ThermalAnywhere.name = "Thermal Vision Anywhere!"
	LocalFeatures.ThermalOverride.name = "Thermal Heat-scale Override)"
	LocalFeatures.ThermalDistStart.name = "Thermal Fade Start: "
	LocalFeatures.ThermalDistEnd.name = "Thermal Fade End: "
	LocalFeatures.UlWeClip.name = "Weapon Unlimited Ammo Clip: "
	LocalFeatures.GunVan.name = "Spawn Gun Van Nearby"
	LocalFeatures.WeapExpRad.name = "Explosion Area of Effect"
	LocalFeatures.MoistWeaponMods.name = "Moist's Weapon Mods"
	LocalFeatures.MoistAimedWeaponMods.name = "Moist's Weapon Mod Modifiers"
	LocalFeatures.Speedarg.name = "Speed of Missiles: "
	LocalFeatures.OrbitalStrike.name = "Moist's Orbital Gun"
	LocalFeatures.invisiweap.name = "Make My Weapon Invisible"
	LocalFeatures.HomingAimAmmo.name = "Select Type: "
	LocalFeatures.HeadshotAimd.name = "Aim Snipe Headshot:"
	LocalFeatures.HomingAim.name = "Homing Aim"
	LocalFeatures.VehHoming03.name = "Better Vehicle Lock-on Missiles v3: "
	LocalFeatures.VehHoming04.name = "Missiles from any Vehicle"
	LocalFeatures.VehHoming006.name = "Any Vehicle Lockon Missiles (Players)"
	LocalFeatures.VehHoming.name = "Vehicle Missiles from my Ass"
	LocalFeatures.OnFootHoming.name = "On Foot Lock-on Missile: "
	LocalFeatures.AtmosLight.name = "Atmospheric Lighting"
	LocalFeatures.Weather.name = "Weather Functions"
	LocalFeatures.Alarms.name = "Alarm Zones (Local Only)"
	LocalFeatures.AlarmReset.name = "Stop All Alarms"
	LocalFeatures.ZancudoAlarm.name = "Start Alarm on Zancudo Base"
	LocalFeatures.PrisonAlarm.name = "Start Prison Alarm"
	LocalFeatures.AlarmSTR.name = "Start Alarm: "
	LocalFeatures.ResetWeather.name = "Reset Override Weather"
	LocalFeatures.Clear_Clouds.name = "Clear Cloud Hat"
	LocalFeatures.WeatherOverride.name = "Override Weather: "
	LocalFeatures.AtmosLighting.name = "Atmospheric Lighting Modifiers"
	LocalFeatures.Lightfx.name = "Enable Atmospheric Light FX"
	LocalFeatures.AtmosRED.name = "Set Red Value: "
	LocalFeatures.AtmosGREEN.name = "Set Green Value: "
	LocalFeatures.AtmosBLUE.name = "Set Blue Value: "
	LocalFeatures.AtmosRANGE.name = "Set Range Value: "
	LocalFeatures.AtmosSHADOW.name = "Set Shadow Value: "
	LocalFeatures.AtmosINTENSITY.name = "Set Intensity Value: "
	LocalFeatures.Lightning.name = "Lightning Bolt Generator: "
	LocalFeatures.RainLvl.name = "Set Rain Level:  "
	LocalFeatures.WaterOverStg.name = "Water Override Strength:  "
	LocalFeatures.Water_Modifier.name = "Modify Water"
	LocalFeatures.Water_Refresh.name = "Refresh Water Shoreline"
	LocalFeatures.WaterMod.name = "Modify Water Radius:  "
	LocalFeatures.Water_Mod.name = "Modify Water Height: "
	LocalFeatures.RippleDis.name = "Water Ripple Disturbance:  "
	LocalFeatures.RippleBump.name = "Water Ripple Bumpiness:  "
	LocalFeatures.ShoreWaveAmp.name = "Override ShoreWave Amplitude:  "
	LocalFeatures.RiotMode.name = "Turn ON Riot Mode!"
	LocalFeatures.WorldChaos.name = "World Chaos Mode!"
	LocalFeatures.Projectiles.name = "Destroy Projectiles (WIP)"
	LocalFeatures.ProjectilesV2.name = "Remove Projectiles"
	LocalFeatures.DefenceManualRAD.name = "Set Below Values Manually"
	LocalFeatures.AirDefence.name = "Anti Player Vehicle"
	LocalFeatures.AirDefence2.name = "Anti Player Ped"
	LocalFeatures.AirDefence3.name = "Anti Projectile"
	LocalFeatures.AirDefence4.name = "WayPoint Anti Player Ped"
	LocalFeatures.setDefenceZone.name = "Zone Flags for: "
	LocalFeatures.BlipScale.name = "Set Blip Size: "
	LocalFeatures.BlipRange.name = "Set Blip Range: "
	LocalFeatures.ProjBlipRemoval.name = "Remove Blip Missiles"
	LocalFeatures.findmissilesA.name = "Find Homing Missiles"
	LocalFeatures.findmissilesBA.name = "Find Grenades"
	LocalFeatures.findmissilesF.name = "Find Vehicle Missiles"
	LocalFeatures.findmissilesD.name = "Find Aircraft Bombs"
	LocalFeatures.findmissilesC.name = "Find Mines & Bombs"
	LocalFeatures.findPeds.name = "Nearby NPC Blips"
	LocalFeatures.BigMapMod.name = "Minimap View Mode: "
	LocalFeatures.SetTimeScale.name = "Set Time Scale"
	LocalFeatures.SetTimeRate.name = "Set Time Rate"
	LocalFeatures.IslandMapMod.name = "Set Island Map View ON|OFF:"
	LocalFeatures.VehicleHealth.name = "Set Ability Bar as Vehicle Health"
	LocalFeatures.WayPointBlock.name = "Block/Unlock Set Waypoint"
	LocalFeatures.MiniMapFull.name = "Mini Map: "
	LocalFeatures.MainMapFull.name = "Set Main Map View ON|OFF"
	LocalFeatures.ShowUIPart.name = "Show: "
	LocalFeatures.PlayerBlipEnhanced.name = "Blip Enhancements Cone & Heading"
	LocalFeatures.PlayerBlipEnhanced2.name = "Blip Enhancements Height"
	LocalFeatures.PlayerBlipRC.name = "RC Player Blips"
	LocalFeatures.PlayerBlipOTR.name = "OTR Player Blips"
	LocalFeatures.PlayerBlipSOTR.name = "Stealth Vehicle OTR Player Blips"
	LocalFeatures.blip_all.name = "Give All Blip & Name"
	LocalFeatures.PlyDistBlip.name = "Player Animated Radius Blip dist: "
	LocalFeatures.RemAllAirDef.name = "Remove All Air Defence Zone"
	LocalFeatures.RadarAsInterior.name = "Set Radar As Interior"
	LocalFeatures.RadarZoomPrec.name = "Precision Radar Zoom: "
	LocalFeatures.RadarZoom.name = "Radar Zoom Level: "
	LocalFeatures.RadarZoomMod.name = "Radar Zoom(s) Step Modifier"
	LocalFeatures.MouseCursor.name = "Change Mouse Cursor & Show"
	LocalFeatures.ScriptCleanup.name = "Try to Clean-up Script Spawns & blips"
	LocalFeatures.ScriptBlipCleanup.name = "Try to Force Remove Radar & Map Blips"
	LocalFeatures.GameCleanup.name = "Cleanup Session World"
	LocalFeatures.GameCleanup2.name = "Session Clean-up Radius: "
	LocalFeatures.UpdateOptions.name = "Script Update Options"
	LocalFeatures.Auto_Update.name = "Auto Update Script"
	LocalFeatures.Online_Version_Check.name = "Update Script (Check Only)"
	LocalFeatures.DownloadUpdate.name = "Update Script (Download Files)"
	LocalFeatures.ScriptSafe.name = "Script Event Safe Mode"
	LocalFeatures.AutoScriptHost.name = "Auto Take Script Host"
	LocalFeatures.PlayerKiller.name = "Get Player Killers"
	LocalFeatures.FriendWhitelist.name = "Auto Whitelist Friends"
	LocalFeatures.NotifiedReset.name = "Player Notification Reset"
	LocalFeatures.DevCheatCheck.name = "Dev Cheat Detection"
	LocalFeatures.GodPlayerHUD.name = "God Mode HUD Above Players in God"
	LocalFeatures.GodPlayerNotif.name = "God Mode Player Notify"
	LocalFeatures.DamageProofPlayerNotif.name = "Damage Proof Player Notify"
	LocalFeatures.ModderDetection.name = "Player Flagging"
	LocalFeatures.MissileDetection.name = "Enable Sub Missile Detection"
	LocalFeatures.DetectPlayerRC.name = "Enable RC Vehicle Detection"
	LocalFeatures.Aim_Counter.name = "Aim Counter Attack"
	LocalFeatures.JoinQue.name = "Join Log Que"
	LocalFeatures.JoinQueThreadDel.name = "Join Que Thread Removal"
	LocalFeatures.SessionLog.name = "Log Session Joins"
	LocalFeatures.ChatLogging.name = "Log Session Chat"
	LocalFeatures.ChatSpamDetect.name = "Chat Spammer Detection & Removal"
	LocalFeatures.ScriptNotifys.name = "Show Script Notifications"
	LocalFeatures.ScriptSubs.name = "Use Subtitle Text info & Notify"
	LocalFeatures.ScriptHelpNotify.name = "Use Game Help Notify"
	LocalFeatures.SpectateDetect.name = "Detect Spectates"
	LocalFeatures.DetectAims.name = "Detect Player Aims"
	LocalFeatures.AntiVoiceChatPrivacy.name = "Anti Voice Chat Privacy"
	LocalFeatures.MissionProtectionOFF.name = "Disable Protections for Mission"
	FeaturesModulelists.name = "Custom Lists for Features"
	Features.Modules.PlayerHistory.name = "Load PlayerHistory Module"
	Features.Modules.PlayerBar.name = "Load PlayerBar Module"
	Features.Modules.Translate.name = "Load Translation Module"
	Features.Modules.ESP.name = "Load ESP Module"
	Features.Modules.LuaLoader.name = "Load Script Loader Module"
	Features.Modules.Teleports.name = "Load Teleport Module"
	Features.Modules.Blacklist.name = "Load Blacklist Module"
	Features.Modules.Pedlist.name = "Load Ped List"
	Features.Modules.Vehlist.name = "Load Vehicle List"
	LocalFeatures.NoRsEditorRec.name = "Disable R*Editor Recording"
	LocalFeatures.PassiveTracker.name = "Passive Tracker"
	LocalFeatures.NewMissileTracker.name = "Sub Missile Seek & Destroy"
	LocalFeatures.MissileCounter.name = "Shoot Down Sub Missiles"
	LocalFeatures.CounterMissileAttack.name = "Sub Missile Counter Attack"
	LocalFeatures.WeaponControlDisable.name = "Disable Weapon Select Keys"
	LocalFeatures.LockonAnyVehExclude.name = "Lockon for any vehicle Exclude Aircraft"
	LocalFeatures.Translate.name = "Update Script with Translation"
	LocalFeatures.ChatSpamData.name = "Load Set: "

--[[INFO:[3.0.2.6][Changed]
start:]]

--[[Changed features Moved Below commented and details replacments not commented below it.
	
	LocalFeatures.Stats.name = "Stat Features"
	
		Changed to Money Stats & Globals Below
		
	Set CHAFF COOLDOWN
		
		Changed to : Set Chaff/Flare Cooldown
	]]
				
	LocalFeatures.Stats.name = "Money Stats & Globals"
	
	
	LocalFeatures.CHAFFCOOLDOWN.name = "Set Chaff/Flare Cooldown"  
	
--[[
end:]]

--[[INFO:[3.0.2.6][Removed]
start:]]

--[[
	LocalFeatures.GlobalState.name = "State = "
	LocalFeatures.DisableCap.name = "Disable Stat Cap"
	LocalFeatures.SendAll_To_Beach.name = "Player Broadcast to Del Pero : 2"
	LocalFeatures.MissionEvents.name = "Mission: "
	LocalFeatures.LobbyTreatTroll.name = "Treat Troll: "
	LocalFeatures.DoomsDay2A2.name = "Dooms Day ACT2 2xPlayer Finale"
	LocalFeatures.DoomsDayA2.name = "Dooms Day ACT2 4xPlayer Finale"
	LocalFeatures.CasinoHeist2P.name = "Casino Heist 2xPlayer Finale Payout"
	LocalFeatures.CasinoHeist4P.name = "Casino Heist 4xPlayer Finale Payout"
]]
--[[
end:]]
--[[INFO:[3.0.2.7][Removed]
start:]]

--[[

	LocalFeatures.VehStats.name = "Get My Veh Stats"
	LocalFeatures.Veh_Stats.name = "Set My Veh Stats"
	LocalFeatures.VehStat.name = "Get Veh Stat in Slot: "
]]
--[[
end:]]

end

--Online Features
function Moist_Translate.onlinemenu()
	for pid = 0, 31 do
	
--[[
INFO:

[---------------------- Online Features @ Start of Translation Versioning ----------------------]													
			|| MoistScript_NG_Translation_Version || Moist Script NG || 3.0.2.5 ||
[-----------------------------------------------------------------------------------------------]	

start:]]

		FeaturesonlineParent.feats[pid].name = "Moist Script NG 3.0.2.5"
		Features.RemovePlayer.feats[pid].name = "Remove Player"
		Features.PlayerOptions.feats[pid].name = "Player Options"
		Features.TeleportOptions.feats[pid].name = "Teleport Options"
		Features.PlayerVehicle.feats[pid].name = "Player Vehicle Options"
		OnlineFeats.PlayerExclusion.feats[pid].name = "Player Exclusion"
		OnlineFeats.SpectateEnhance.feats[pid].name = "Enable Spectate Interior Rendering"
		OnlineFeats.SaveCoords.feats[pid].name = "Save Players Current POS to file"
		OnlineFeats.PlayerPrivChat.feats[pid].name = "Player Private Chat"
		OnlineFeats.PlayerWaypoint.feats[pid].name = "Player Waypoint"
		OnlineFeats.PlayerGhosting.feats[pid].name = "Ghost Myself To Player"
		OnlineFeats.TeamChatA.feats[pid].name = "Set Team Chat ID"
		OnlineFeats.OrgChat.feats[pid].name = "Set Org Chat"
		OnlineFeats.Targetable.feats[pid].name = "Set Player Targetable"
		Features.PlayerInfo.feats[pid].name = "Player Info"
		Features.PlayerIPInfo.feats[pid].name = "Player IP Info"
		Features.PlayerInfoData.feats[pid].name = "Player Attributes"
		Features.Troll.feats[pid].name = "Troll & Annoy"
		Features.GriefThisCunt.feats[pid].name = "Grief This Cunt"
		Features.FramePlayer.feats[pid].name = "Grief Others (Frame Player)"
		Features.ScriptEvents.feats[pid].name = "Script Events"

		OnlineFeatures.Get_SE_PID.feats[pid].name = "Get This Players Script Events"
		OnlineFeatures.LastAimedAt.feats[pid].name = "Last Aimed at: "
		Features.PlayerVehicleDecorators.feats[pid].name = "Decorators"
		Features.VehicleDecorators_Check.feats[pid].name = "Check: "
		Features.VehicleDecorators_Remove.feats[pid].name = "Remove: "
		Features.VehicleDecorators_INT.feats[pid].name = "INT: "
		Features.VehicleDecorators_Bool.feats[pid].name = "Bool: "
		Features.VehicleDecorators_Float.feats[pid].name = "Float: "
		Features.VehicleDecorators_Time.feats[pid].name = "Time: "
		OnlineFeats.FramedSessionOrbital.feats[pid].name = "Framed Session Orbital Strike!"
		OnlineFeats.FramedOrbital.feats[pid].name = "Orbital Player: "
		OnlineFeatures.PickupParent.feats[pid].name = "Player Pickups"
		OnlineFeats.RP3.feats[pid].name = "RP Collectable Pickups"
		OnlineFeatures.GunVanHelper.feats[pid].name = "Gun Van Helper"
		OnlineFeatures.WeapPickup1.feats[pid].name = "Give Weapon Pickup railgun"
		OnlineFeats.WeapPickup_Fertil.feats[pid].name = "Give Fertilizer Can Pickup"
		OnlineFeats.ArmourPickup.feats[pid].name = "Give Armour Pickup"
		OnlineFeatures.VehDamageProofOFF.feats[pid].name = "Damage Proof & God Mode OFF!"
		OnlineFeatures.Targetable.feats[pid].name = "Set Vehicle Targetable"
		OnlineFeatures.LockOn_Cunt.feats[pid].name = "Kill with Lock ON Ruiner Missile"
		OnlineFeatures.ScriptFire.feats[pid].name = "Start Script Fire Near Them"
		OnlineFeatures.NearbyPeds.feats[pid].name = "Find Nearby Peds"
		OnlineFeatures.ProximitySurrounded.feats[pid].name = "Proximity Surrounded: "
		OnlineFeatures.SnowmanSurrounded.feats[pid].name = "surround with snowmen"
		OnlineFeatures.CuntCannon.feats[pid].name = "Kill with: "
		OnlineFeatures.NBV_RAM2.feats[pid].name = "Nearby Vehicles: "
		OnlineFeatures.RandomAttacker.feats[pid].name = "Spawn Nearby Random Attacker"
		OnlineFeatures.SelectAttacker.feats[pid].name = "Send Attacker: "
		OnlineFeatures.Lester_Khanjli.feats[pid].name = "Send Lester Khanjali Griefer"
		OnlineFeatures.Lester_Savage.feats[pid].name = "Send Lester Savage Griefer"
		OnlineFeatures.Lester_Savage_Escort.feats[pid].name = "Send Lester Escort in Savage"
		OnlineFeatures.Ufo_Griefer_Lester.feats[pid].name = "Send Lester UFO Griefer"
		OnlineFeatures.Heli_Task.feats[pid].name = "Lester go to in Heli Attack & Crash"
		OnlineFeatures.Ufo_Lester.feats[pid].name = "Send UFO Lester"
		OnlineFeats.Find_Missiles.feats[pid].name = "Find Missiles"
		OnlineFeats.OTR_Timer.feats[pid].name = "OTR_Timer"
		OnlineFeats.MissileCheck.feats[pid].name = "Check Missiles"
		OnlineFeats.GetZoneInfo.feats[pid].name = "Get Player Zone Info"
		OnlineFeats.GetInfo.feats[pid].name = "Get Info"
		OnlineFeats.PlayerGlobalState.feats[pid].name = "Player Global State: "
		OnlineFeats.Toggle_NetStats.feats[pid].name = "Toggle On Net Stats"
		OnlineFeats.ACKS.feats[pid].name = "unAck TX's: "
		OnlineFeats.UnrelResend.feats[pid].name = "Unreliable Resend Count: "
		OnlineFeats.Latency.feats[pid].name = "Latency (Ms): "
		OnlineFeats.PacketLoss.feats[pid].name = "Packet Loss : "
		OnlineFeats.SetMiniMap2Player.feats[pid].name = "Set Minimap to Players Location"
		OnlineFeats.SetMiniMap2PlayerBlip.feats[pid].name = "Minimap Zoom to Players Blip"
		OnlineFeats.UnlockMinimapZoom.feats[pid].name = "Unlock Minimap Zoom"
		OnlineFeats.SetPlayerBlipFlash.feats[pid].name = "Players Blip Flashes"
		OnlineFeats.SetPlayerBlipPulse.feats[pid].name = "Players Blip Priority Long-range"
		OnlineFeats.SetPlayerBlipFlash2.feats[pid].name = "Players Blip Flashes v2"
		OnlineFeats.GiveTreats.feats[pid].name = "Give Treats"
		OnlineFeatures.FuelLeak.feats[pid].name = "Players Vehicle Leaks Fuel"
		OnlineFeatures.SendCops.feats[pid].name = "Dispatch Cops to Player Location"
		OnlineFeatures.GodGamerTag.feats[pid].name = "Enable Gamer TAG God"
		OnlineFeatures.GamerTagON.feats[pid].name = "Enable Gamer TAG"
		OnlineFeatures.GangHarrasment.feats[pid].name = "Gangs will Hassle Player"
		OnlineFeatures.InvSpam.feats[pid].name = "Spam Apt Invites"
		OnlineFeatures.GangGrief.feats[pid].name = "Gangs will Grief Player"
		OnlineFeatures.DisablePlayerInterior.feats[pid].name = "Disable Player Interior"
		OnlineFeatures.OTR.feats[pid].name = "Off The Radar"
		OnlineFeatures.NOCOPS.feats[pid].name = "Cops Turn a Blind Eye"
		OnlineFeats.NetworkBail.feats[pid].name = "Network Bail Kick"
		OnlineFeats.ErrorKick.feats[pid].name = "Micheal Error Kick"

		OnlineFeats.ScriptKick.feats[pid].name = "Script Kick"
		OnlineFeats.RandScriptKick.feats[pid].name = "Random Script Event Spam"
		OnlineFeats.ScriptKick.feats[pid].name = "Script Event: "
		OnlineFeatures.SE_Crash.feats[pid].name = "Send Event: "
		OnlineFeatures.SE_CrashV2.feats[pid].name = "Send Event V.2: "
		OnlineFeatures.SE_CrashV3.feats[pid].name = "Send Event V.3: "
		OnlineFeatures.ChuteModelCrash.feats[pid].name = "Parachute Model Crash!"
		OnlineFeatures.VehSyncCrash.feats[pid].name = "Lester Cummy Windsock Crash v1"
		OnlineFeatures.VehSyncCrashV2.feats[pid].name = "Lester Cummy Windsock Crash v2"
		OnlineFeatures.VehSyncCrash2.feats[pid].name = "Use Ruiner Crash & Bail to Space"
		OnlineFeatures.TestCrash.feats[pid].name = "Test Crash"
		OnlineFeatures.LockedOnTroll.feats[pid].name = "Trigger Vehicle Locked On"
		OnlineFeatures.TeleportPlayernext2me.feats[pid].name = "Teleport Next To Me"
		OnlineFeatures.TeleportPlayerinfront.feats[pid].name = "Teleport in front of Me"
		OnlineFeatures.TeleportPlayerBeyondLimits.feats[pid].name = "Teleport Beyond World Boundaries"
		OnlineFeatures.Teleport_God_mode_Death.feats[pid].name = "Teleport to Death (Ocean Out of World Limits)"
		OnlineFeatures.Teleport_God_mode_Death_2.feats[pid].name = "Teleport to Death (Kill Barrier)"
		OnlineFeatures.FakePlayer.feats[pid].name = "Fake Player Clone (WIP)"
		OnlineFeats.PlayerObliteration.feats[pid].name = "Player Obliteration Kills"
--[[
end:]]

--[[INFO:[3.0.2.6][Removed]
start:]]


	--[[
		OnlineFeatures.NoGod4u.feats[pid].name = "Try To Remove GOD Mode!"
		OnlineFeatures.Island_Events.feats[pid].name = "Island Events: "
		OnlineFeatures.MissionEvents.feats[pid].name = "Mission: "
		OnlineFeatures.Passive_Events.feats[pid].name = "Passive Mode: "
		OnlineFeats.ForceErrorKick.feats[pid].name = "Force Error Kick"
		]]
--[[
end:]]

--[[INFO:[3.0.2.6][Removed]
start:]]
--[[

		OnlineFeatures.DisableGame.feats[pid].name = "Disable Players Game"
		OnlineFeatures.BlackScreenOfDeath.feats[pid].name = "Black screen?"
]]
--[[
end:]]

			
	end
end


--hints


function Moist_Translate.localmenu_hints()

	LocalFeatures.Online_Data.hint = "Various Info on the Current Session"
	LocalFeatures.Online_ChatOptions.hint = "Add Custom Spam to Custom Save File, Remove from Custom Save File. Adjust Send Delay, Switch Chat Type"
	LocalFeatures.SaveOptions_Hotkey.hint = "<LCTRL>+<LSHIFT>+<S> \nHold Left Control + Left Shift Down then Press S Key and release to save"
	LocalFeatures.MissionSetup_Hotkey.hint = "<LCTRL>+<LSHIFT>+<M> \nHold Left Control + Left Shift Down and Press M Key \nto switch Mission Protection Settings on/off\ntThis will only turn the feature on and off the feature will do the rest when a mission is detected"
	LocalFeatures.SessionSyncCrash.hint = "Spawns a Ruiner 2000 with a parachute that can crash most if not all of the session when used!"
	LocalFeatures.SH_Helper.hint = "2Take1 VIP Subscription Required\nThis will switch script host between players that are in god mode, to help others that could be either stuck loading or not loaded into session fully"
	LocalFeatures.AvengerTeleport.hint = "Teleports you into Your Avenger While it is inside your Facility. Please Be Aware use of Entity / session Clean-ups will cause this to not work and avenger no longer to be inside Facility"
	LocalFeatures.CamReset.hint = "Resets & Destroys Scripted Cam Created"
	LocalFeatures.ClubMoneyF.hint = "Fast Nightclub Earnings Money Method for self, go to your nightclub office safe open it stand in the threshold of the doorway, turn on and enjoy some fast cash, periodically this will pause for a moment to allow transactions to clear and transfer the money into your bank! I found this to be slower in full sessions solo takes no time at all to clock up a few million! Dont Be retarded with its use! Few Million every now and then do some other stuff then you should be ok! I have done this for a few weeks got 3 billion in the bank now and no issues just be casual with its use!"
	LocalFeatures.ClubMoneyFO.hint = "VIP Required!!\nFast Nightclub Earnings Money Method for self, No Need to be in your nightclub for this method, turn on and enjoy some fast cash, Don't Be retarded with its use! Few Million every now and then do some other stuff then you should be ok! i have done this for a few weeks got 3 billion in the bank now and no issues just be casual with its use!"
	LocalFeatures.ClubMoneyS.hint = "Slower Rate Nightclub Earnings Money Method for self, will wait longer and check transactions are not pending and wait until they are clear! **  go to your nightclub office safe open it stand in the threshold of the doorway, turn on and enjoy some fast cash, periodically this will pause for a moment to allow transactions to clear and transfer the money into your bank! I found this to be slower in full sessions solo takes no time at all to clock up a few million! Don't Be retarded with its use! Few Million every now and then do some other stuff then you should be ok! I have done this for a few weeks got 3 billion in the bank now and no issues just be casual with its use!**"
	LocalFeatures.SubGM_ExtRange_NoCD.hint = "Extends the Range of the kosatka Guided Missiles & Removes the Cool Down"
	LocalFeatures.Drone_RangeNoCD.hint = "Improves the TerrorByte Drone:\nRemoves Cooldown between uses\nRemoves Shock Recharge Time\nIncreases Forward Speed\nIncreases Distance Range & Height Range" 
	LocalFeatures.CEO_Veh_CD.hint = "Ceo Vehicle Cooldown Removal Toggle on to Never have a cool down or off to restore the default" 
	LocalFeatures.VehPara.hint = "Gives your Current Vehicle a Parachute if it does not already have one"
	LocalFeatures.NoMoreOneShot.hint = "Sets your Ped to not take critical hits! \n No More One Shot Hits if shot in head the damage would be similar to that of a body shot"
	LocalFeatures.ThermalAnywhere.hint = "Enable Thermal Vision Anywhere without scope or helmet"
	LocalFeatures.ThermalOverride.hint = "Sets Heat-scale Override value for your Ped"
	LocalFeatures.ThermalDistStart.hint = "Override Distance Thermal starts to fade"
	LocalFeatures.ThermalDistEnd.hint = "Override the Distance Thermal Fades Completely"
	LocalFeatures.MoistAimedWeaponMods.hint = "Moist's Weapon Mods, Feature Variables. Change Speed of Missiles, adjust some unknown variables on the Native used in these features."
	LocalFeatures.HomingAimAmmo.hint = "Homing Functions Below this, Can be set to Different Projectile types that can lock-on to a player or vehicle. This Setting Affects all Below except the Headshot Aim Snipe."
	LocalFeatures.HeadshotAimd.hint = "**Feature Damage/Kill in Your Name!(Blamed). Turn on the value modifier is the amount of Damage applied with each shot! so once set just Aim at a Ped or Player, or a vehicle with either inside it, this will then shoot a heavy sniper bullet in addition to your own, only this one is targeted to hit the Skull (Head Shot). Works nicely aiming at a vehicle driving directly at you, not so much from behind but you will hit the vehicle, from the side is hit and miss depending on the vehicle/ ped velocity"
	LocalFeatures.HomingAim.hint = "This will shoot a Locked On Ruiner 2000 Class Missile at the Ped/Vehicle you aim and shoot at"
	LocalFeatures.VehHoming03.hint = "Enhanced Version this will Lock-on to the driver rather than Vehicle so if they were to eject/bail from vehicle before missile gets their vehicle the Enhanced Missile will lock onto their ped for a nice Bail Fail!\n Using your Weaponised Vehicle Missile Lock-on this will shoot Better Missiles after a delay (set by the value of this feature) 500 Delay, is not far from a legitimate looking missile fire from a distance. lower values will increase the fire rate to a point you will have rapid fire. These missile are that of the ruiner 2000 with the circling around them tracking and rarely miss a target if they do not impact something else first. Patches the R* Nerf for MK2 Opressors Making them OP once more & Enables less Retardedness Mk2 Air Combat"
	LocalFeatures.VehHoming04.hint = "This Feature Gives you Missiles from any Vehicle unlike the other Missile Features this does not lock-on to anything and will just shoot straight ahead of you much like the Weaponised Tampa"
	LocalFeatures.VehHoming006.hint = "Please Check the Sub Menu there is a option to disable lock on to friends in session!\nAlso you can set any player with the script player exclusion feature for the targeting function to ignore these players. This Feature Gives Any Vehicle Lockon Missiles that specifically Targets Players even on foot Players as long as they are visible from your point of view and within distance of 500 units Missiles will lockon & destroy them once the Fire Input is Pressed (This is a Replacement so will completely disable your ability to use the normal fire input should it be the same as this (top left trigger or whatever you shoot with a mk2). If no player is within range it will fall back to whatever the vehicle lockon system has if it has one or just shoot Missiles Straight Ahead no lockon"
	LocalFeatures.VehHoming.hint = "Using your Weaponised Vehicle Missile Lock-on this will shoot Better Missiles after a delay & Keep the target even after the last one is behind u or destroyed this will make your missiles shoot out the ass of your vehicle as well (set by the value of this feature) 500 Delay, is not far from a legitimate looking missile fire from a distance. lower values will increase the fire rate to a point you will have rapid fire. These missile are that of the ruiner 2000 with the circling around them tracking and rarely miss a target if they do not impact something else first. Patches the R* Nerf for MK2 Opressors Making them OP once more & Enables less Retardedness Mk2 Air Combat"
	LocalFeatures.OnFootHoming.hint = "Equip your Homing Launcher, Aim and wait for the Lock-on Square to turn Red (when using unlimited ammo clip lock-on can be a bright white) at this point shoot a missile and see another shoot along side it Destroying your Target or looping back around to hit them, Ruiner 2000 Class Missiiles better Tracking of targets Improves the homing launcher to the point a MK2 Opressor Can be taken out with ease on Foot!"
	LocalFeatures.WaterMod.hint = "When Modify Water is Enabled this Adjusts the Water Radius"
	LocalFeatures.Water_Mod.hint = "When Modify Water is Enabled this Adjusts the Water Height"
	LocalFeatures.SetTimeScale.hint = " Slow Motion 1: 0.6 \n Slow Motion 2: 0.4 \n Slow Motion 3: 0.2 \n Normal: 1.0"
	LocalFeatures.SetTimeRate.hint = "Set Game Time in Minutes to Realtime Milliseconds"
	LocalFeatures.WayPointBlock.hint = "Enables you to Block Being able to Set any Waypoint on Map, or unlock it where its normally disabled like inside an interior"
	LocalFeatures.MiniMapFull.hint = "Set Mini map Locked to Current Coords or unlock it should it be locked by game"
	LocalFeatures.RadarZoomPrec.hint = "PRECISE Zoom Level for Radar / MiniMap"
	LocalFeatures.Auto_Update.hint = "At Script Start Checks for outdated Files will be done if any are found script will Automatically Download required files to keep the Script up to date"
	LocalFeatures.Online_Version_Check.hint = "Check Script Version is Up To Date Without Downloading anything"
	LocalFeatures.DownloadUpdate.hint = "Download Latest Files Based on their Hash From GitHub anything not up-to-date will be replaced with Latest"
	LocalFeatures.ScriptSafe.hint = "Protects yourself against your own Script events used in Most Moist script Functions"
	LocalFeatures.GodPlayerHUD.hint = "Adds Heads Up Display Above god mode players Saying GOD & CUNT CrewTag"
	LocalFeatures.ModderDetection.hint = "Mark Players as Modder with Cheat or Dev Bit Set on"
	LocalFeatures.Aim_Counter.hint = "Spawns an attacker to kill them and removes them once dead"
	LocalFeatures.ScriptNotifys.hint = "Use Menu Notifys to display information from Script Functions. Turning This OFF will Disable Most if not all Notifys from Moist Script"
	LocalFeatures.ScriptSubs.hint = "Uses Game Subtitle/Mission Help to Render Information & Notifications for some script functions. God Mode Detection will display Player Name With God Status info Below. PlayerHistory more than 700 will show text to tell you to clear it for optimal performance."
	LocalFeatures.ScriptHelpNotify.hint = "Uses Game On Screen Mission Help/Floating Help Boxes at top left of screen to Show Notifications for some script functions. Submissile Launches use this and gives you an audiable Ding Sound when Triggered, Outdated Files Triggered By Update Check will also do this."
	LocalFeatures.SpectateDetect.hint = "Detect when someone is spectating someone in session with a mod"
	LocalFeatures.DetectAims.hint = "Detect when someone is Aiming at someone else and add that info to the Player Attributes Section\nAlso Notifies you when you are being aimed at"
	LocalFeatures.CounterMissileAttack.hint = "Once a Sub Missile is detected and Marked a Counter Missile Attack is Launched Locked Onto the Sub Missile to take it out the sky and Destroy it!"
	LocalFeatures.LockonAnyVehExclude.hint = 'Specifically made for the "Any Vehicle Lockon Missiles (Players)" function, this will prevent the targeting Features from turning off shooting Control and finding lockon targets. Specifically this is for all aircraft Heli or Plane/Jet So you dont turn off a turning control and shoot instead of turn. Functionality Restored when in another vehicle'
--[[INFO:[3.0.2.6][Additions]
start:]]
	LocalFeatures["Stats"].hint = "Features using Stats & Globals\nCool Down Removal, Money Methods, Customise Stats"
--[[
end:]]

--[[INFO:[3.0.2.6][Removed]
start:]]
--[[
	LocalFeatures.MissionEvents.hint = "Forces all Players to a Job / Mission Screen"
	LocalFeatures.LobbyTreatTroll.hint = "Halloween Jack-O-Lantern treats for all players"
	LocalFeatures.DisableCap.hint = "Disable Stat Cap for modifiying stats like your armour and snacks beyond the 15/20 max" 
	LocalFeatures.DoomsDay2A2.hint = "turn on before starting the finale leave all pay-outs as they are set and just launch the job all will get 2.5m each"
	LocalFeatures.DoomsDayA2.hint = "if only 2 are playing use the 2xplayer otherwise its going to look odd if you do it for randoms\nother than that it dont matter which option payouts all the same!. \nturn on before starting the finale leave all pay-outs as they are set and just launch the job all will get 2.5m each"
	LocalFeatures.CasinoHeist2P.hint = "if only 2 are playing use the 2xplayer otherwise its going to look odd if you do it for randoms\nother than that it dont matter which option payouts all the same!. \nturn on before starting the finale leave all pay-outs as they are set and just launch the job all will get 3.5m each"
	LocalFeatures.CasinoHeist4P.hint = "turn on before starting the finale leave all pay-outs as they are set and just launch the job all will get 3.5m each"
]]
--[[
end:]]


end


function Moist_Translate.onlinemenu_hints()
	for pid = 0, 31 do
		FeaturesonlineParent.feats[pid].hint = "Moist Script Features"
		Features.RemovePlayer.feats[pid].hint = "Various Ways to Remove or Crash a Player"
		Features.PlayerOptions.feats[pid].hint = "Useful Player Options, Exclude, Ghost to them, Change team ID. Add Waypoint on Their Location"
		Features.TeleportOptions.feats[pid].hint = "(Player Must Be in a Vehicle for these to work!)\n Try to Teleport the Player to various locations"
		Features.PlayerVehicle.feats[pid].hint = "Useful Options to Modify a Players Vehicle, From God Removal to Enabling Lock-on & the Decorators used to assign Bit Data to them"
		OnlineFeats.PlayerExclusion.feats[pid].hint = "Exclude this player, from receiving Script Events Sent by Moist Script & Triggering Explosions in a Portable Defence Sphere"
		OnlineFeats.SaveCoords.feats[pid].hint = "save players location to file"
		OnlineFeats.TeamChatA.feats[pid].hint = "-1 = default setting in free mode, anything else is a team and ID gives different colour for other players everyone in that team will be able to see each others team chat"
		OnlineFeats.OrgChat.feats[pid].hint = "locally sets you into their current ORG or MC, enabling you to see their private organisation chat. This is a WIP so be warned it could potentially break your session or your game!"
		Features.GriefThisCunt.feats[pid].hint = "Various Ways To Grief & Kill them if they are Killable"
		Features.FramePlayer.feats[pid].hint = "Frame This Player & Grief Others in their name!"
		OnlineFeatures.Has_Spawned_Net.feats[pid].hint = "Shows if you Received the Ped Spawned Network Event from this Player"
		OnlineFeatures.Is_Passive.feats[pid].hint = "Shows if Player is currently Passive (Pussy Mode Activated!) R* Anti Griefing Protection"
		OnlineFeatures.BountyValue.feats[pid].hint = "Shows the players bounty value if we managed to get that data"
		OnlineFeatures.SessionKD.feats[pid].hint = "Shows this Players K/D Ratio for Combat in the Current Session Since you joined"
		OnlineFeatures.Has_Ghosted_Me.feats[pid].hint = "Shows When Someone Hit The Ghost To You or Your CEO/MC\nR* Anti Griefing Protection To Bypass this you need to Set a bounty on them!\nThis will also be set true when player is in passive mode"
		OnlineFeats.FramedSessionOrbital.feats[pid].hint = "Air Raid Sirens Sound, then one by one each Player Gets Orbital Cannon Exploded"
		OnlineFeats.FramedOrbital.feats[pid].hint = "Orbital Player as The Current Player of this Feature"
		OnlineFeatures.VehDamageProofOFF.feats[pid].hint = "Turns Off Damage Proofs on their current Vehicle & God Mode if its on"
		OnlineFeatures.Targetable.feats[pid].hint = "Turns Off Missile Lock-on Blocking"
		OnlineFeatures.NBV_RAM2.feats[pid].hint = "Need to Spectate or Be Close to the player for this to work, Nearby NPC's in Vehicles will either Ram the Player or Attack Driving over them"
		OnlineFeatures.Lester_Khanjli.feats[pid].hint = "Send 2x Lesters in a Khanjali Tank to grief them"
		OnlineFeatures.Lester_Savage.feats[pid].hint = "Send Lester in a Savage Heli to grief them"
		OnlineFeatures.Lester_Savage_Escort.feats[pid].hint = "Send Lester in a Savage Heli to Protect them"
		OnlineFeats.PlayerGlobalState.feats[pid].hint = "-1 : not joined or Dead\n0 : Loading\n9 : Probably Respawning\n99 : Fully joined the Session"
	OnlineFeatures.LockedOnTroll.feats[pid].hint = "Triggers Vehicle being locked onto audio alert for that player"
		OnlineFeats.PlayerObliteration.feats[pid].hint = "Enables Orbital Kills for player with any type of kill"
--[[
end:]]

--[[INFO:[3.0.2.6][Removed]
start:]]
--[[
	
		OnlineFeatures.NoGod4u.feats[pid].hint = "Either removes god or breaks the players game"
		Features.Troll.feats[pid].hint = "Be An Annoying Troll & Send them around all apartments & Onto Missions Screens"
		OnlineFeatures.MissionEvents.feats[pid].hint = "Forces Player to a Job / Mission"
		OnlineFeatures.Passive_Events.feats[pid].hint = "Disables the Option for them to enter Passive Mode or Enables it again Depending on selection. This will make them a key player in an event preventing any passive mode use"
	
]]
	end
end


--local str data

--[[ Edit Example:
	
	LocalFeatures.save_settings:set_str_data({"Save","Reset"})
	
	LocalFeatures.save_settings:set_str_data({"EDIT-A","EDIT-B"})
]]

function Moist_Translate.Set_StrData()
--[[
INFO:

[---------------------- Str Data @ Start of Translation Versioning ----------------------]													
			|| MoistScript_NG_Translation_Version || Moist Script NG || 3.0.2.5 ||
[----------------------------------------------------------------------------------------]	

start:]]
	
	LocalFeatures.save_settings:set_str_data({"Save","Reset"})
	LocalFeatures.OrbitalProtex:set_str_data({"& Notify","Protect & Notify","& Protect"})
	LocalFeatures.chatclipboard:set_str_data({"Public Chat Once", "Team Chat Once","Public Chat Repeat", "Team Chat Repeat"})
	FreeCamInt:set_str_data({"Initialise","Reset"})
	LocalFeatures.MySexiness:set_str_data({"JEER_AT_HOT_PED","HURRIEDFEMALES_SEXY","HOT_PERSON"})
	LocalFeatures.CbobMagnet:set_str_data({"Hook","Magnet"})
	LocalFeatures.HomingAimAmmo:set_str_data({"RUINER_ROCKET","DELUXO_MISSILE"}))
	LocalFeatures.setDefenceZone:set_str_data({"Self off","Others off","Self On","Others On"})
	LocalFeatures.MiniMapFull:set_str_data({"Current POS Lock!","Unlock Mini map"})
	LocalFeatures.ShowUIPart:set_str_data({"Show Ammo","Display Sniper Scope","Display Area Name","Render Race Track","Unload MP Map Data Load SP","Load MP Map Data"})
--[[
end:]]

--[[INFO:[3.0.2.7][Changed]
start:]]
--[[
	LocalFeatures["SessionKick"]:set_str_data({"Bail Kick","Host Kick"})

	LocalFeatures.WeatherOverride:set_str_data({"Extra Sunny","Clear","Clouds","Smog","Fog","Clouds","Rain","Thunder","Clearing","Neutral","Snow","Blizzard","Snow Light","Xmas","Halloween"}
]]
--[[
end:]]

--[[INFO:[3.0.2.7][Removed]
start:]]
--[[	
	LocalFeatures.SendAll_To_Beach:set_str_data({"Beach","Beach Bounty War!"})
	LocalFeatures.MissionEvents:set_str_data({"Force to Severe Weather", "Force to Half Track", "Force to Night Shark AAT", "Force to APC Mission", "Force to MOC Mission", "Force to Tampa Mission", "Force to Opressor Mission1", "Force to Opressor Mission2"})
	LocalFeatures.GarbageTools:set_str_data({"count","collect","stop","restart","isrunning"})
	LocalFeatures.GarbageTools:set_str_data({"count","collect","stop","restart","CollectV2"})
]]
--[[
end:]]
	



end
--online str data

function Moist_Translate.Set_Online_StrData()
	for pid = 0, 31 do
--[[
INFO:

[---------------------- Str Data @ Start of Translation Versioning ----------------------]													
			|| MoistScript_NG_Translation_Version || Moist Script NG || 3.0.2.5 ||
[----------------------------------------------------------------------------------------]	

start:]]
		OnlineFeatures.ProximitySurrounded.feats[pid]:set_str_data({"Blame Me","Anonymous"})
		OnlineFeatures.CuntCannon.feats[pid]:set_str_data({"ALIEN CUNT CANNON","ORBITAL CUNT CANNON"})
		OnlineFeatures.NBV_RAM2.feats[pid]:set_str_data({"Ram","Attack"})
		OnlineFeatures.SE_Crash.feats[pid]:set_str_data({"Vector Method","Stat Method","Moist Method","Bit Method"})
		OnlineFeatures.SE_CrashV2.feats[pid]:set_str_data({"Vector Method","Stat Method","Moist Method","Bit Method"})
		OnlineFeatures.SE_CrashV3.feats[pid]:set_str_data({"Vector Method","Stat Method","Moist Method","Bit Method"})

--[[
end:]]
--[[INFO:[3.0.2.7][Removed]
start:]]
--[[
		OnlineFeatures.Island_Events.feats[pid]:set_str_data({"SendToIsland v1","SendToIsland v2","Kick From Island","IslandForceRemove","test Method"})
		OnlineFeatures.MissionEvents.feats[pid]:set_str_data({"Force to Severe Weather","Force to Half Track","Force to Night Shark AAT","Force to APC Mission","Force to MOC Mission","Force to Tampa Mission","Force to Opressor Mission1","Force to Opressor Mission2"})
		OnlineFeatures.Passive_Events.feats[pid]:set_str_data({"Disable Option","Enable Option"}
]]
--[[
end:]]

	end
end

return Moist_Translate