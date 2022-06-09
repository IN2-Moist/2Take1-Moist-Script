local Moist_Translate = {lang = "EN"}

function Moist_Translate.localmenu(feat)
	
	Features.LocalParent.name = "Moist Script NG Trans"
	
	Features["ParentLabel"].name = "Next Generation Moist Script 3.0.0.0 Translated!"
	
	LocalFeatures.Self_Parent.name = "Self Features"
	
	LocalFeatures.Self_WeaponStuff.name = "Weapon Related Functions"
	
	LocalFeatures.Self_Ped.name = "Player Ped Features"
	
	Features.LocalSettings.name = "MoistScript Settings"
	
	LocalFeatures["save_settings"].name = "Current Settings: "
	
	LocalFeatures["HotKeyParent"].name = "MoistScript HOTKEYS"
	
	Features.LocalModules.name = "Load MoistScript Modules"
	
	LocalFeatures.IAMACOP.name = "Turn Me into a Cop (Cops Act like you are!)"
	
	LocalFeatures.UlWeClip.name = "Weapon Clip: "
	
	Features.Modulelists.name = "Custom Lists for Features"
	
	Features.Modules_PlayerBar.name = "Load PlayerBar Module"
	
	Features.Modules_Pedlist.name = "Load Ped List"
	
	Features.Modules_Vehlist.name = "Load Vehicle List"
	
	LocalFeatures["SaveOptions_Hotkey"].name = "Options Save HotKey"
	
	
end


function Moist_Translate.onlinemenu(feat)
	
	for pid = 0, 31 do
		
		Features.OnlineParent.feats[pid].name = "Moist Script NG trans"
		
		Features["OnlineParentLabel"].feats[pid].name = "Next Generation Moist Script 3.0.0.0 Translated!"
		
		Features.RemovePlayer.feats[pid].name = "Remove Player"
		
		Features.Troll.feats[pid].name = "Troll & Annoy"
		
		Features.GriefThisCunt.feats[pid].name = "Grief This Cunt ! !"
		
		Features.FramePlayer.feats[pid].name = "Grief Others (Frame Player)"
		
		Features.ScriptEvents.feats[pid].name = "Script Events"
		
		Features["CEO"].feats[pid].name = "CEO Features"
		
		
		OnlineFeats["FramedSessionOrbital"].feats[pid].name = "Framed Session Orbital Strike"
		
		OnlineFeats["FramedOrbital"].feats[pid].name = "Orbital Player: "
		
		OnlineFeatures["CuntCannon"].feats[pid].name = "Cunt Cannon!"
		
		OnlineFeats["NetworkBail"].feats[pid].name = "Network Bail Kick"
		
		OnlineFeatures["CEOMoney"].feats[pid].name = "Loop Payment: "
		
		OnlineFeatures["OTR"].feats[pid].name = "Off The Radar"
		
		OnlineFeatures["NOCOPS"].feats[pid].name = "Cops Turn a Blind Eye"
		
		OnlineFeatures["SE_Crash"].feats[pid].name = "Send Event: "
		
		OnlineFeatures["VehSyncCrash"].feats[pid].name = "Lester Cummy WindSock Crash"
		
		OnlineFeatures["VehSyncCrash2"].feats[pid].name = "Use Ruiner Crash & Bail to Space"
		
		OnlineFeatures["REM_CEO"].feats[pid].name = "Remove CEO: "
		
		OnlineFeatures["SendCops"].feats[pid].name = "Dispatch Cops to Player Location"
	end
	
end

return Moist_Translate

