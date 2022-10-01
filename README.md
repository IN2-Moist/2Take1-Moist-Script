
![NextGen](https://cdn.discordapp.com/attachments/688897307609268231/1021158338429464757/NERW.png)
<hr>
# Next Generation Moist Script

##  |-| 3.0.0.4 |-|

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
			
			Explosion Multiplier 0.00 -> 20.00 (Modifies The Explosion Radius of your Current Weapon)
				** Fair warning to this ** :  setting it at 200 on a Homing launcher and you create an explosion the size of the city and take out alot of players in the process !!
			
			Destroy Projectiles(WIP)
				(Work.In.Progress) this will explode any weapon projectiles i have currently added still needs further testing as not all seem to work, mk2 missile wont get destroyed
				but likes of a ruiner you shoot a missile it goes boom along with you. This will also explode players when they equip homing launcher, rpg firework launcher etc soon
				as they switch to it the missile in the chamber is detected and exploded.

```			

		Current Projectiles Added:


		"WEAPON_GRENADE","WEAPON_STICKYBOMB","VEHICLE_WEAPON_TANK","VEHICLE_WEAPON_SPACE_ROCKET","WEAPON_RPG",
		"VEHICLE_WEAPON_PLANE_ROCKET","VEHICLE_WEAPON_PLAYER_LASER","VEHICLE_WEAPON_PLAYER_BULLET","WEAPON_HOMINGLAUNCHER","WEAPON_STINGER",
		"WEAPON_PROXMINE","WEAPON_FIREWORK","WEAPON_FLAREGUN","VEHICLE_WEAPON_RUINER_ROCKET","VEHICLE_WEAPON_HUNTER_MISSILE",
		"VEHICLE_WEAPON_HUNTER_BARRAGE","VEHICLE_WEAPON_DOGFIGHTER_MISSILE","VEHICLE_WEAPON_ROGUE_MISSILE","VEHICLE_WEAPON_VIGILANTE_MISSILE",
		"VEHICLE_WEAPON_APC_CANNON","VEHICLE_WEAPON_APC_MISSILE","VEHICLE_WEAPON_TRAILER_MISSILE","VEHICLE_WEAPON_TRAILER_DUALAA",
		"VEHICLE_WEAPON_OPPRESSOR_MISSILE","VEHICLE_WEAPON_MOBILEOPS_CANNON","VEHICLE_WEAPON_AVENGER_CANNON","VEHICLE_WEAPON_CHERNO_MISSILE",
		"VEHICLE_WEAPON_AKULA_MISSILE","VEHICLE_WEAPON_DELUXO_MISSILE","VEHICLE_WEAPON_SUBCAR_MISSILE","VEHICLE_WEAPON_SUBCAR_TORPEDO",
		"VEHICLE_WEAPON_THRUSTER_MISSILE","WEAPON_GRENADELAUNCHER","WEAPON_AIRSTRIKE_ROCKET","WEAPON_PASSENGER_ROCKET","WEAPON_VEHICLE_ROCKET"


				
```			
		Portable Defence Sphere
			Set Below Values Manually
				Will Adjust all values below to this one
				if you just activate the option and value has not changed Input box will popup so you can set this manually
				
			Portable Defenses Anti Player Vehicle
			Portable Defenses Anti Player Ped
				Improved Since Last Release: Player in any vehicle goes in sphere they get Destroyed WIP needs some tweaking maybe a little over the top
				Anti Player Ped does same as above only they dont need to be in any vehicle
			Portable Defences Anti Projectile
				Should prevent projectiles and weapons fire in the sphere
				has been said in game that people were unable to use some weapons like lazer cannons but this also can be effected by zone flag settings below
			
			Zone Flags for: < Self off | Others off | Self on | Others on>
				turns zone flags on / off depending on option for players
			
			Remove All Air Defense Zone
					This will literallly remove any Yacht Defences set, seems to also partially work for player yachts cant shoot in the area but does not take you out.

		Player Ped Features
			Make My Ped Wet! :P
				Drench your ped like its raining heavily or you just come out of water
			
			StoneHatchet NoCoolDown & Duration Increase
				Removes Cooldown between activations and increases the Duration to a really long Duration.
				
			Set Myself Ghosted to Other Players
				Sets Ghosting to others this is also in one of the defense sphere options

			Turn Me into a Cop (not outfit related makes your ped like a cop so you get ignored by cops get a cop cone on radar when wanted)
			
		Player Vehicle Features
		
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
			
			Moists Train Mod
				Enable Train Spawning
					Enables Spawning of Trains and turns on Control Meter and Controller Support to control trains
					Controls are Controller based:
					
					Left Trigger :: Reduce Cruise Speed or Speed negative (go backwards)
					
					Right Trigger :: Increase Cruise Speed or Speed Forwards
					
					Right Top Bumper/Trigger(HandBrake) :: Turns on Stop Train and sets all speeds to 0.0
									
				Track Switch
					Sets Trains enabled on other tracks (WIP) still figuring this one out
							
				Train Control < Stop Train Enable Access | Enter Nearest Train as Driver>
					option 1 will try to stop train and low you to enter (WIP not working fully yet)
					option 2 Enter nearest train if one found nearby
				
				Switch Train Spawn Direction
					changes the direction spawned train is facing
				
				Spawn Train Variation
					23 variants can be spawned
				
				Train Cruise
					Sets Train Cruise Speed When on
					train will increase speed until it hits set speed
					
				Train Speed
					Sets Train Speed Immediately
				
				Stop Train
					used with controller control tries to stop train
				
				Control Speed(Instant Insane Speed)
					use this with Train Speed on to use controller input to set the speed
					very sensitive so speeds are insane
				
				DeRail Train
					Does as it says sets the train to a Derailed State while on
					
				
			AirCraft Turbulance
				Turbulance Modifier
					0.0 (No Turbulance)
					1.0 (Very Turbulant)
					
			Disable Plane Aileron
				(extra rudders on the aircraft to contol roll yaw and pitch see animations below)
				
			Set Air Drag Multiplier:
				Adjust drag on vehicle caused by aircraft
				

```
	 
![AlieronRoll](https://upload.wikimedia.org/wikipedia/commons/c/cc/Aileron_roll.gif)

<hr>

![AlieronYaw](https://upload.wikimedia.org/wikipedia/commons/9/96/Aileron_yaw.gif)

<hr>

![AlieronPitch](https://upload.wikimedia.org/wikipedia/commons/e/ec/Aileron_pitch.gif)

<hr>


```
		Set Vehicle Damage Proof
			Vehicle Becomes Near to God Mode without Detection
			Impossible to Visibly Damage it from impacts explosions etc

		Engine Audio:
			Overide Current Vehicle Engine Audio
			List Populated from vehlist.ini
			default preset chernobog
	
	Online Features
		Player Histroy
			Requires Histroy Module to be loaded
		Session Griefing
			Send All to Del Pero : <Beach | Beach Bounty War!>
			MultiDirectional Player Snipe : <Distance value Modifier>
		
	World Features
	
		LightningBolt Generator: Delay Multiplier = 0.01 -> 2.00
			While on will generate Random Lightning no matter the weather Actual Delay = (Delay Multiplier * 60)
			Set Rain Level
			Water Override Strength
			Modify Water Radius
			Water Ripple Disturbance
			Water Ripple Bumpiness
			Override ShoreWave Amplitude
			Set Wind Speed
				Adjust current wind speed
	
	UI Features
		MiniMap View Mode
			changes states of minimap
		Player Blip Enhancements
			enables blip cones
		Player Blip Enhancments
			enables direction and height indicators
		OTR Player Blips
			Adds Blips for OTR Players
			on main big map it also adds their name to the blip
			
	MoistScript Settings
		Current Settings: Save | Clear
	
		MoistScript HOTKEYS
			Options Save HotKey
	
		Load MoistScript Modules
		Custom Lists for Features
		Load Ped List
		Load Vehicle List
		Load Player Histroy Module
		Load PlayerBar Module
		Load Translation Module
		Load ESP Module
		Load Network Events Module
		Load Script Loader Module

	Update Script with Translation

	ScriptEvent SafeMode
		Prevents Script Events Being Sent to Yourself
	
	Auto Take Script Host
		Delayed Script Host Force
	
	Get Player Killers
		WIP Rework of my old Combat tracker currently only gives a notifty of who killed who if it was a player
	
	Auto Whitelist Friends
		Toggles on the Manual Modder Detection Whitelist option on friends
		
	Player Notification Reset
		Resets Modder Detection Notifies
	
	God Mode Player Notify
		Checks Players and their Vehicle for God Mode not in an interior and some other variables once then recheck after delay
	
	Damage Proof Player Notify
		Checks Player and their Vehicle for Damage Proofs and Notifies you
	
	Enable Sub Missile Detection
		Does as the name states, detects any missile launch and adds a blip on radar/map when in range of you
		
	Enable RC Vehicle Detection
		Again Name says it all Detects Activation of RC Tank & RC Bandito also adds [RC] tag to the players name in the player bar
	
	Log Session Joins
		Outputs a daily Session Player Join CSV with all their info
	
	Disable R* Editor Recording
		Fixes Crashes that can happen when activating it while using the menu
	
	Anti Orbital Protection
		No Function Yet this is built into the main script for now and will disable any players ability to use the orbital cannon on you
		while they are in the orbital room. They just will never find you in the player list preventing any orbital.

```

#### Tanslate Module

	Adds Ingame Chat Translation to team chat or public
	Hotkey RSHIFT + U will bring up a input box for you to enter chat to translate to ability
	selected language in the module features
	still need some tweaking but works well


### Online Features


```
	Remove Player
		Network Bail Kick
		Micheal Error Kick
			Script Event Kicks player after Micheal sends a notification saying ERROR!
		Force Error Kick
		Send Event:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
			uses kicks.ini file event hashes
		Send Event v2:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
			uses a set of event hashes to try and remove player
		Send Event v3:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
			uses a smaller set of event hashes which seem to work well to remove a player
		Lester Cummy WindSock Crash (May Need to be executed a few times they will crash to many times you will likely crash the session game will clean up this shit)
		Use Ruiner Crash & Bail to Space
	
	Player Options
		Player Exclusion
			Excluded Player From any Session Wide Script Events
		Player Waypoint
			While Toggled on updates the Waypoint to the players location
		
	Player Info  (Basically some stuff im testing for some future functions)
	
		Latency Test

```

<hr>

```		

		unAck TX's:
		Latency (ms):
		PacketLoss:
			these Feature Value toggles will update periodically to show the values

```

<hr>

```
	
		Set Minimap to Players Location
			works properly when not in an interor will make the Radar MiniMap show the area player is located on map
				
		Minimap Zoom to Players Blip
			use with above function to provide zoom ability needs some fine tuning
		
		Unlock Minimap Zoom
			Toggle enables Zoom and unhides a Value Modifier with manual input when value is not changed and activated a second time
		
		Players Blip Flashes
			flash the players blip needs more work to make flash smoother
	

	Player IP Info
		Give Treats
			Selectable value defaults to the most common one for 50k bank treat.
			(But be aware these can only be used a limited amount of times per player per session)
			
		IP Info Section from players IP Address

	Troll & Annoy
		Dispatch Cops to Player Location (Still testing but i seen undercover cops in the street after using this in a session)
		
		Gangs will Hassle Player
			Nearby Gangs will Hassle Player
			
		Disable Player Shooting (untested)
			Prevents the player from shooting each frame
		
		Spam Invites
			Spams Apartment & Buisness Invites Sending the Player Around The Map
		
		Disable Player Interior
			Unloads the interior the player is in and they fall through the building or map still needs further testing but seems to put them outside XD
		
		Island Events:
			< SendToIsland v1 | SendToIsland v2 | Kick From Island | IslandForceRemove >

	Grief This Cunt ! !
		Cunt Cannon!

		Nearby Vehicles: < Ram | Attack>
			Nearby Vehicles will Ram the player / attack depending on Selection and explode on impact
	
		Gangs will Grief Player
			Spawns Random Gangmember nearby to attack

	Grief Others (Frame Player)
		Framed Session Orbital Strike
			Now uses actual Orbital Cannon Sounds
		Orbital Player: 
			Now uses Orbital Cannon Sounds, PTFX and Explosions

	Script Events
		Remove GOD Mode!
			Script event to attempt removal of god mode
		CEO Features (hidden when they are not in a ceo)
			Remove CEO: Terminate | Dismiss | BAN
			Loop Payment: 10k | 15k | 20k | 30k
		Off The Radar | Ghost Organisation (when they are in a ceo)
		Cops Turn a Blind Eye | Bribe the Cops( when they are in a ceo)
```

### Install location

 ** %UserProfile%\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\ **


![Download the files or installer here:](https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest)

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
MoistScript_NextGen3004.lua
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
