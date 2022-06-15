
![NextGen](https://cdn.discordapp.com/attachments/869989558018781194/984253676443017246/cooltext412726820733010.png)
<hr>

![Moist Script 2.x.x.x Backup available here:](https://github.com/IN2-Moist/MoistScript--2.0.6.7/releases/tag/2.0.6.7)


# Next Generation Moist Script
## 3.0.0.0 |-| BETA TEST |-|

### Feaure List:

#### Local Script Features

```
    Self Features
		Stat Features
			Set Stat:
				String Stat Builder
				GB_GANG_NAME :: Combines the 2 stats that makes up your CEO Organisation Name
				GB_OFFICE_NAME :: Combines the 2 stats that makes up your CEO Office
				MC_GANG_NAME :: Combines the 2 stats that makes up Motorcycle Club Name
				YACHT_NAME ::  Combines the 2 stats that makes up Your Yacht Name
				(Completely Bypasses any Profanity Filters and can Accept Special Characters for R* Logos etc)
				       
        Weapon Related Functions
            Weapon Clip: Unlimtied | Normal (unlimited is like fast no reload, stand there with a homing launcher u can lockon and spam rockets without having to reload at all)

        Player Ped Features
            Make My Ped Wet! :P (Drench your ped like its raining heavily or you just come out of water)
            Turn Me into a Cop (not outfit related makes your ped like a cop so you get ignored by cops get a cop cone on radar when wanted)
			
		Player Vehicle Features
		
			AirCraft Turbulance
				Turbulance Modifier
					0.0 (No Turbulance)
					1.0 (Very Turbulant)
				
				Set Vehicle Damage Proof
						Vehicle Becomes Near to God Mode without Detection
						Impossible to Visibly Damage it from impacts explosions etc
				
				Engine Audio:
				Overide Current Vehicle Engine Audio
				List Populated from vehlist.ini
				default preset chernobog
			
			CargoBob Mod
				CargoBob: Hook | Magnet
			
			Magnet Pickup Strength:
				modifier Value
			Magnet Effect Radius:
				modifier Value
				Magnet Pull Rope Length:
					modifier Value
				Magnet Rope Length:
					modifier Value
				Magnet Pull Strength:
					modifier Value

    MoistScript Settings
        Current Settings: Save | Clear
        MoistScript HOTKEYS
            Options Save HotKey
        Load MoistScript Modules
            Custom Lists for Features
                Load Ped List
                Load Vehicle List
                Load PlayerBar Module
				Load ESP Module
        Update Script with Translation

```


#### Online Features

```
	Remove Player
		Network Bail Kick
		Send Event:  Vector Crash | Stat Crash | Rando Crash | Moist Crash
		Lester Cummy WindSock Crash (May Need to be executed a few times they will crash to many times you will likely crash the session game will clean up this shit)
		Use Ruiner Crash & Bail to Space

	Troll & Annoy
		Dispatch Cops to Player Location (Still testing but i seen undercover cops in the street after using this in a session)
		Force Player to Island

	Grief This Cunt ! !
		Cunt Cannon!

	Grief Others (Frame Player)
		Framed Session Orbital Strike
		Orbital Player: 

	Script Events
		CEO Features (hidden when they are not in a ceo)
			Remove CEO: Terminate | Dismiss | BAN
			Loop Payment: 10k | 15k | 20k | 30k
		Off The Radar | Ghost Organisation (when they are in a ceo)
		Cops Turn a Blind Eye | Bribe the Cops( when they are in a ceo)
```

### Install location

 ** %UserProfile%\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\ **


Download the files or installer here: https://github.com/IN2-Moist/2Take1-Moist-Script/releases/tag/NG(3.0.0.0)

* File layout:


```
\2Take1Menu\scripts\

    scripts\MoistFiles\
        Moist_Translate.lua
        MoistScript_PlayerBar_Module.lua
		MoistScript_ESP_Module.lua
		Natives.lua		
        pedlist.ini
        vehlist.ini
MoistScript_NextGen3000.lua
```

***Notes:***


- Ped list and vehicle list are for your own custom named lists for use in functions to come not required at the moment

- Playerbar Module is Load on demand and will save loaded if you wish

- Playerbar will not show until in an online session

- To Translate the script simply change the names in the Moist_Translate.lua functions then use Update Script with Translation

- Compatibility Should be better in this version and not conflict with 2.0.x.x versions

- Crash Script events cant be run on yourself as it would crash you everything else will

To Translate: 
simply change the text after: `.name = ` 
ensure to put it in quotes 
like so: **`"my translated text"`**

example:
```lua
--original
OnlineFeatures["SendCops"].feats[pid].name = "Dispatch Cops to Player Location"
```
```lua
--translated
OnlineFeatures["SendCops"].feats[pid].name = "Schicke Polizisten zum Spielerstandort"
```
