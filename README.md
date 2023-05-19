![NextGen](https://cdn.discordapp.com/attachments/1043788232577523726/1089336753158111313/nglog2o.png)

<hr>

# Next Generation Moist Script

# |-| 3.0.2.4 |-|

# changes:

Updated Mission Protection Automation Switches to Smaller Radar for Missions if you have Expanded Set and switches back after. Fixed issue with it getting stuck in a loop doing nothing

Added OTR for All in Session Griefing

Updated Force Error Kick

Fixed False Positive Excessive OTR Time Notify When not even Over a Ghost Org Duration

Updated Script Event Function should be much faster

Decreased the Time Between Player Orbitals using Framed Session Orbital Strike

Added Ped Spawn Check & Increased Jointime check for God & Damage Proof Detections

Fixed Bounty info in Player Attributes not always showing value

Update Functions are now called as a threaded function (fixes Repoted Issues with errors)

Changed Trust Check to just check & show a warning rather than abort execution

Fixed bug with setting playerbits

All Save Feature Options are now in a Seperate Settings Parent



<hr>

11/5/23

Fixed Issues With File Encoding causing errors

Fixed Ped Sexiness Code Put the variable used on exit into scope

Added Disable Stat Cap (Bypasses the Cap on Things like armour and snacks so instead of max 10/15/20 it can be 100)

Added Session Attributes & Player Attributes Outside of the Moist Script Main Parent in each tab for easy access

Added Bounty Value to attributes

Added Aim Detection Notify for when someone is either aiming at you or your vehicle (this is integrated into the detect aims feature)

Removed Experimental Feature Value Saver & Integrated it into the main Script Settings Features

Improved Lester Savage Escort (Heli Protection) now he will loop being in your/ the player you send him to protects player group so they should not kill the protectee

Added Check into Homing Missiles from any vehicle & Better Vehicle Lockon Missiles v3 the check toggles off the other feature to itsself. Both functions use a Disabled Control input which is specific to some vehicle and cant run at same time due to values needing to be different and the other one trying to turn the disabled controls feature off Help Message will popup explaining this

Added Save Player Coords to File in online player options

Teleport Module Has a Search Feature now if you want to store alot


<hr>


<hr>

8/5/23

>Fixed OTR & No Cops Script Events not working
Added Lester Escort (Heli Protect)
Improved the Lester in Savage & Khanjali
Added Custom Thermal Options
Enable Thermal anytime without equipment being present
adjust thermal see through parameters
Added Terrorbyte Drone Range increase no cooldown extended boost and boost recharge of only seconds and shock has no cooldown & increased damage (1 hit kill with shock)
Drone function works with other drones only it does not remove cooldown on all only terrorbyte
Added Save Players Position to file
Added Search function to teleports
Added Session Attributes shows your transition state connected players & max player counts
Added Mission Checker to Features Testing will notify if session is a mission session
Added Use Game Help Notify
Added Give My Ped Sexiness selectable Sexiness
Updated Script Language Translation File


<hr>

27/4/23

## online player features: (WIP)

### Added Send Lester in Khanjali
### Added Send Lester in Savage

> (Both Lester Griefing options are toggles which will loop some code so when the player dies Lester will go to them and attack again. Toggle off does not remove the Spawned Entities you will need to do so in the Entity Functions & tools in the local part of the script.

#### Added Some Custom Functions into the script.

> These are customised for creating ped vehicles & finding spawn points these will be for more spawn options to come, all peds should not go nuts on each other and should respect each other, so far no issues need to test further multiple spawns being groups have a limit some updating on this will be needed.
> 
## local player features:

### Added  No More One Shot Hits
 
 > Will prevent you taking critical damage that would kill you instantly like in a oneshot/headshot situation. Damage taken will be that of a normal body shot!

### Added Motion Blur

> (This is a Test Feature not sure if it makes any difference to what others see)

### Added Thermal Heat-scale Override <Value Modifier>

> Changes how visible you are when using a thermal helmet or scope. 0.0 will mean you have none at all so essentially invisible on thermal.

## Issues with feature value saver should now be resolved!

> Re-Enabled the Update Check on Script Execution (Still Requires you to goto settings and click the download option should it be outdated)

<hr>

Updated Most of the Function Names to be more understandable for non English people. & to help make anyone translating it life alot easier! Most of the Spelling Mistakes Fixed .

Fixed Bug with Downloading Update & nil file error causing crash.

Update now Downloads needed files & then Removes all script features & executes the script again with the updated files.

Main Script File now has the version number removed from the filename, makes life easier and was part of the cause of download crash.

Updated Vehicle Missiles V3 this will only work on vigilante toreador & Oppressor MK1 & MK2.  This is due to how annoying it is when flying a lazer & use cannons & end up shooting missiles!

Added: Make My Weapon Invisble

<hr>

Update Release

-Fixed : Bug in Experimental Feature Value Saver causing Feature Depth not to go all the way.

-Updated Player History: Removed Index number from name and added it to a hint, updated the history limiter, updated the delete all history.

-Updated Projectile Radar

-Improved  Better Vehicle Missiles v3 to not care if  target is in line of sight before you could get a moment that the weapon would not fire due to this check. updated replacement sound.

-Updated Missiles From Any Vehicle

-Improved Update Check & Download, now checks the files by hash and notify of outdated files, download function will check the same then update those needed files. will remove the extra 0 from the version number on next release as this is no longer needed for the update check

<hr>


## Feature List

### Local Script Features

## Player Features

### Stat Features

```md
Set Stat:

Set Stat With Created Logo:
	Adds a R* Created Logo at the start of the Text you input

Set Stat With Verified Logo:
	Adds a R* Verified Logo at the start of the Text you input

  String Stat Builder
  GB_GANG_NAME :: Combines the 2 stats that makes up your CEO Organisation Name
  GB_OFFICE_NAME :: Combines the 2 stats that makes up your CEO Office
  MC_GANG_NAME :: Combines the 2 stats that makes up Motorcycle Club Name
  YACHT_NAME ::  Combines the 2 stats that makes up Your Yacht Name
  (Completely Bypasses any Profanity Filters and can Accept Special Characters for R* Logos etc)
 
  Auto Nightclub Vault Money Fast Method
  Fast Nightclub Vault Money [Requires 2Take1 VIP License
  Auto Nightclub Vault Money (Slower Method)
 
	Nightclub Earnings Money Method for self,
	go to your nightclub office safe open it stand in the threshold of the doorway,
	turn on and enjoy some fast cash.
	VIP Method does not require you to even be anywhere near your nightclub can be done While other side of the map Killing Noobs.
	Non VIP Version will periodically pause for a moment to allow transactions to clear and transfer the money into your bank!
	I found this to be slower in full sessions solo takes no time at all to clock up a few million!
	Donâ€™t Be retarded with its use!
	Few Million every now and then do some other stuff then you should be ok!
	I have done this for a few weeks got 3 billion in the bank now and no issues
	just be casual with its use!
	
  Dooms Day ACT2 2.5 Million
	Turn on Before launching this finale and Enjoy a Bigger Pay-out,
	just leave the values as they are even if they are not up to 100%.
	
  Sub Guided Missiles (+)Range (-)Cooldown
	Extends the Range of the Submarine Guided Missiles, & Removes Any Cooldown Between Shots.
  
```

## Weapon Related Functions

```md
Weapon Unlimited Ammo Clip <toggle>
 unlimited is like Rapid Fire / No Reload
 Using a Homing Launcher you can lock-on and spam rockets without having to reload at all

Spawn Gun Van Nearby
 Spawns Gun Van Close to your current location

Explosion Multiplier 0.00 -> 20.00
 Modifies The Explosion Radius of your Current Weapon if it has explosive ammo
 ** Fair warning to this ** :  setting it at 200 on a Homing launcher and you create an explosion the size of the city and take out a lot of players in the process !!

Destroy Projectiles(WIP)
  (Work In Progress) this will explode any weapon projectiles I have currently added still needs further testing as not all seem to work, mk2 missile wont get destroyed
  but likes of a ruiner you shoot a missile it goes boom along with you. This will also explode players when they equip homing launcher, RPG firework launcher etc soon
  as they switch to it the missile in the chamber is detected and exploded.

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

## Moist’s Weapon Mods

```
Moist’s Orbital Gun
 Better than the impact orbital strike in Moist Script 2.x.x.x
 Shots are more reliable & all Explosions are Orbital Explosions with Actual Orbital Sound and PTFX

Homing Aim
	Shoot Additional Homing Missile at target your aiming attack
	
Better Vehicle Lock-on Missiles <delay modifier>
	Shoots additional Lock-on Missiles at locked on target, clears target each after each shot to ensure next shot is fired at the correct target
	shots should look more legit 500 delay or more
	
Better Vehicle Lock-on Missiles v2 <delay modifier>
	Enhanced Version this will Lock-on to the driver rather than Vehicle so if they were to eject/bail from vehicle before missile gets their vehicle
	the Enhanced Missile will lock onto their ped for a nice Bail Fail!
	Shoots additional Lock-on Missiles at locked on target, clears target each after each shot to ensure next shot is fired at the correct target
	shots should look more legit 500 delay or more
	
Better Vehicle Lock-on Missiles v3 <delay modifier> (WIP)
	Complete Replacement for the vehicle Missiles, like the other Enhanced Version this will Lock-on to the driver rather than Vehicle so if they were to eject/bail from vehicle before missile gets their vehicle
	the Enhanced Missile will lock onto their ped for a nice Bail Fail!
	Shoots additional Lock-on Missiles at locked on target, clears target each after each shot to ensure next shot is fired at the correct target
	shots should look more legit 500 delay or more

Missiles from any Vehicle (WIP)
	Will shoot missiles from any vehicle you are in.

Vehicle Missiles from my Ass <delay modifier>
	Shoots additional Lock-on Missiles at locked on target, this version Keeps the last Target and shoots missiles locked onto the target even if the target
	is not visible on screen (its behind you for instance) this will cause your missiles to shoot at any direction. Your Vehicle is safe using this as you
	can not damage your vehicle with them.
	
On Foot Lock-on Missiles
	Shoots an additional Ruiner Missile at the target locked onto via your homing launcher.


```

# Portable Defence Sphere
```md

 Set Below Values Manually

  Will Adjust all values below to this one
  if you just activate the option and value has not changed Input box will popup so you can set this manually

 Anti Player Vehicle

 Anti Player Ped

  Improved Since Last Release: Player in any vehicle goes in sphere they get Destroyed WIP needs some tweaking maybe a little over the top
  Anti Player Ped does same as above only they donâ€™t need to be in any vehicle

 Anti Projectile

  Should prevent projectiles and weapons fire in the sphere
  has been said in game that people were unable to use some weapons like Lazer cannons but this also can be effected by zone flag settings below
  
  Waypoint Anti Player Ped

  Same as The Above "Anti Player Ped", only the location of it can be set manually to anywhere on the map you can place a waypoint!

 Zone Flags for: < Self off | Others off | Self on | Others on>
  turns Defence zone flags on / off depending on option for players

 Remove All Air Defence Zone

  This will literally remove any Yacht Defences set
  seems to also partially work for player yachts cant shoot in the area but does not take you out.
```

# Player Ped Features

```md

 Make My Ped Wet! :P
  Drench your ped like its raining heavily or you just come out of water

 Stone Hatchet No Cooldown & Duration Increase
  Removes Cooldown between activations and increases the Duration to a really long Duration.

 Set Myself Ghosted to Other Players
  Sets Ghosting to others this is also in one of the defence sphere options
 
 Set Ped Damage Proof
	Essentially God Mode but without Advertising that fact

 Turn Me into a Cop
  (not outfit related makes your ped like a cop so you get ignored by cops get a cop cone on radar when wanted)

No More One Shot Hits
   Will prevent you taking critical damage that would kill you instantly like in a oneshot/headshot situation. Damage taken will be that of a normal body shot!

Motion Blur (This is a Test Feature not sure if it makes any difference to what others see)

Thermal Heat-scale Override <Value Modifier>
   Changes how visible you are when using a thermal helmet or scope. 0.0 will mean you have none at all so essentially invisible on thermal.

```

# Player Vehicle Features (Sub Features)

## Cargo Bob Mod

```md

Cargo Bob: Hook | Magnet

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
 
```

### Moistâ€™s Train Mod

```md

Enable Train Spawning
 Enables Spawning of Trains and turns on Control Meter and Controller Support to control trains
 Controls are Controller based:

 Left Trigger :: Reduce Cruise Speed or Speed negative (go backwards)

 Right Trigger :: Increase Cruise Speed or Speed Forwards

 Right Top Bumper/Trigger(Handbrake) :: Turns on Stop Train and sets all speeds to 0.0

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

Derail Train
 Does as it says sets the train to a Derailed State while on
 
```

# Player Vehicle Features

## Aircraft Turbulance

```md

Turbulence Modifier
 0.0 (No Turbulence)
 1.0 (Very Turbulent)

Set Air Drag Multiplier:
 Adjust drag on vehicle caused by aircraft

Altitude Level Indicator
 Adjust to bring the Radar Aircraft Height lines on the radar on foot or other vehicles that donâ€™t use these

Disable Plane Aileron
 (extra rudders on the aircraft to control roll yaw and pitch see animations below)

```

### Plane Aileron Animations

![AlieronRoll](https://upload.wikimedia.org/wikipedia/commons/c/cc/Aileron_roll.gif)

<hr>

![AlieronYaw](https://upload.wikimedia.org/wikipedia/commons/9/96/Aileron_yaw.gif)

<hr>

![AlieronPitch](https://upload.wikimedia.org/wikipedia/commons/e/ec/Aileron_pitch.gif)

<hr>


```md

Set Bomb Count
 Enables you to set & Refill your Aircraft Bombs

Modify Vehicle Top Speed
	Change Possible Top Speed of Vehicle

Max Speed Override
	Basically Bypasses Game Speed Restrictions on your Vehicle

Set Vehicle Damage Proof
  Vehicle Becomes Near to God Mode without Detection
  Impossible to Visibly Damage it from impacts explosions etc

Engine Audio:
  Override Current Vehicle Engine Audio
  List Populated from vehlist.ini
  default preset Chernobog

```


## Online Features

```md

Player History
  Requires History Module to be loaded
Session Griefing
 
  Send All to Del Pero : <Beach | Beach Bounty War!>
	Beach Fun & Money Maker for people, this version Respects Script Safe mode & Player Exclusions.
 
  Player Broadcast to Del Pero : <Beach | Beach Bounty War!>
	Instantly Send all to the Beach for Money & Games. ** This Version Will Send All Even You! (Alternate version Should the other Not Send All Players!)
	
  Give All 10k Bounty
	Does as Name States
	
	Mission: <Selectable Job>
		This will Send the entire session to the job screen for the mission you selected

  Treat Troll
	Halloween Jack-O-Lantern treats for all players
	
  Nearby Player Orbital Dist.  <Distance Modifier>
	This is Replacement for the Multidirectional Snipe.
	This will Orbital all Players within selected distance from you this is anonymous kill.

```

## World Features

```md

Set Wind Speed

Lightning Bolt Generator
 Delay Multiplier = 0.01 -> 2.00
 While on will generate Random Lightning no matter the weather
 Actual Delay = (Delay Multiplier * 60)

Atmospheric Lighting
	Atmospheric Lighting Modifiers
		Set Red Value
			Red Brightness / amount (0-255)
		Set Green Value
			Green Brightness / amount (0-255)
		Set Blue Value
			Blue Brightness / amount (0-255)
		Set Range Value
			Distance of Light Effect Range (0.00 - 100000.00)
		Set Shadow Value
			Amount of Shadow Effect (less shadow more brightness
		Set Intensity Value
			How Intense the Light Effect should be
			
	Enable Atmos Light FX <Toggle>
		Bigger Range will make particles and objects glow
		Lower Range will localise the light to you this kind of looks like you have vehicle neonâ€™s on your ped 


	
Set Rain Level

Water Override Strength

Modify Water (toggle)

Modify Water Radius
	When Modify Water is toggled on this adjusts the effect radius of the water modification

Modify Water height
	When Modify Water is toggled on this adjusts the water Height.

Water Ripple Disturbance

Water Ripple Bumpiness

Override Shore Wave Amplitude


Adjust current wind speed

```

## UI Features

```md

Projectile radar
	Options to show Missiles, Grenades, Sticky Bombs / Proxy Mines on the Radar / Map

Mini Map View Mode
 changes states of Mini Map (Does not work at all with expanded radar enabled)
 When online you need to be outside for it to do anything
 Works better in story mode

Player Blip Enhancements
 enables blip cones

Player Blip Enhancements
 enables direction and height indicators

OTR Player Blips
 Adds Blips for OTR Players
 on main big map it also adds their name to the blip
 
```

## Moist Script Settings

```md

Current Settings: Save | Clear

```

### Detections & Protections

```md

Script Event SafeMode
 Prevents Script Events Being Sent to Yourself

Auto Whitelist Friends
 Toggles on the Manual Modder Detection Whitelist option on friends

Player Notification Reset
 Resets Modder Detection Notifies

God Mode Player Notify
 Checks Players and their Vehicle for God Mode not in an interior and some other variables once then recheck after delay, will also
 add a [G] and / or [V] to their name if using the player bar module

Damage Proof Player Notify
 Checks Player and their Vehicle for Damage Proofs and Notifies you, certain situations can cause a false positive like when they are
 in control / driving their kosatka Submarine. 

Enable Sub Missile Detection
 Does as the name states, detects any guided missile launch from kosatka Submarine and adds a blip on radar/map when in range of you

Enable RC Vehicle Detection
 Again Name says it all Detects Activation of RC Tank & RC Bandito also adds [RC] tag to the players name in the player bar
 
 
Blacklist Features
	When Blacklist Module loaded will give you Blacklist options for players SCID and IP
	
		
 
 
```

## Moist Script Settings

```md

Moist Script HOTKEYS
  Options Save Hotkey

Load Moist Script Modules

Custom Lists for Features

Load Ped List

Load Vehicle List

Load Player History Module

Load Player Bar Module

Load Translation Module

Load ESP Module

Load Network Events Module

Load Script Loader Module

Update Script with Translation

Check Script Version is Up To Date

Download Update

Auto Take Script Host
 Delayed Script Host Force

Get Player Killers
 WIP Rework of my old Combat tracker currently only gives a notify of who killed who if it was a player

Log Session Joins
 Outputs a daily Session Player Join CSV with all their info
 
Anti Voice Chat Privacy
	Unlocks Voice Chat: if they have Setting to < no one | Friends | Crew > this will enable you to hear them and them to hear you!

Disable R* Editor Recording
 Fixes Crashes that can happen when activating it while using the menu, Prevents any Recording.

Detect Orbital Users 
  Protects or Notifies Depending on Selection:
    < & Notify | Protect & Notify | & Protect >
  Option with Notify will Notify when Player is Close to the Orbital Room Entrance and again once they are inside!
  Option with Protect if also notify will tell you same as above but will also tell you its activating Orbital Protection on this Player,
  Protect without notify will just turn on orbital Protection without telling you about anything! No Notifies at all!
  Once Protection is turned on this will disable any players ability to use the orbital cannon on you while they are in the orbital room.
  They just will never find you in the player list preventing any orbital!
  One exception that can bypass this Protection is a bounty either way!

  Sub Missile Seek & Destroy
	This Feature does not require the Missile Detection to work this will constantly check for a missile in range and shoot it out the sky
	
  Shoot Down Sub Missiles
	This Requires Sub Missile Detection to be on only looks for a missile when one has been launched
	

```

## Translate Module

### Translate Game Chat

#### Send Translated Chat Options

```md

set a default language
	Value Selectable from language list

Send Translated Chat Hotkey RSHIFT+U
	Enables hotkey Right shift key + U key combination to bring up input box to type chat message to translate. Start of input must have a language code with : directly after so RU:Hello will translate Hello into Russian. FR:Hello will translate into French Hello.

Send Translated Definition in Chat Hotkey RSHIFT+D
	WIP Will send the description/Meaning of a word you enter into the Language you input. Works same as Sending Translated Chat Messageâ€™s
```

### Translate Game Chat

```md

Chat Translation to:
	Selectable Options : <Game Chat | New Notifies | Old Notifys>
	
	Game Chat will send directly into the multiplayer game chat either publicly or via team/organisation chat depending on the setting for this.
	
	New Notifies will display top most over most game states but lacks Unicode so can display some stupid shit instead.
	
	Old Notifies Slightly more elegant looking which displays Unicode text without the shit generated by the new notifies but lacks the ability to show above a lot of the game states and features.

Team [ON] | Public [OFF]
	Selects where to send the translated chat when send translated chat is set to game chat. When toggled on it will send it to a more private chat (Team/Organisation/Motorcycle Club) this will limit it being viewable to you when not on a job or in a MC / CEO, when on jobs or you have others in your MC/CEO this translated chat will also be viewable by them.

Translate Via IP Location
	tries to translate via the players IP Location in attempt to minimise false or bad translations when spelling is bad or using slang / abbreviations.

Log Translated Chat
	Logs to CSV Output all Translated Game Chat, Non Translated Chat & Sent Translated Chat (Both Original and the Translation).
	
	output Example:
	26/10/22, 03:38:37, Tingyuxuan2021, ä½ ä»¬æ˜¯å“ªé‡Œäºº, Where do you come from

Translate to:
	Language Selectable to translate other languages into. This should be your native language or one you understand.
	

```

Adds In game Chat Translation to team chat or public

Hotkey RSHIFT + U will bring up a input box for you to enter chat to translate to ability

selected language in the module features

still need some tweaking but works well



## Online Features -

### Remove Player

```md

Network Bail Kick

Michael Error Kick
 Script Event Kicks player after Michael sends a notification saying ERROR!

Force Error Kick
 Updated & Improved (October 2022) more effective than before

Script Kick
 Most Effective Script Event Kick, but like other methods will be blocked by any half decent menu.

Random Script Event Spam
  Sends Random Script Events from the kicks.ini file with some nice parameters
  
Send Event:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
 uses kicks.ini file event hashes

Send Event v2:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
 uses a set of event hashes to try and remove player

Send Event v3:  Vector Method | Stat Method | Rando Method | Moist Method | Bit Method
 uses a smaller set of event hashes which seem to work well to remove a player

Parachute Model Crash
 you are the crash entity with this so you will teleport in the sky above them and start an automated task of parachuting
 at some point they will crash and most of the session


Lester Cummy Windsock Crash v1
Lester Cummy Windsock Crash v2
 Both versions have potential to crash everyone in your session be warned!
 v1 spawns and executes higher up in the sky above the player
 v2 spawns lower and closer to the player
 May Need to be executed a few times until they crash
 used too many times in a busy session is high chance session will crash with them
 The Game will clean up this shit after its done

Use Ruiner Crash & Bail to Space
 You again are the crash entity, teleports you and puts you into a Ruiner above the player and parachutes crashing them and most of the session.

```

## Player Options

```md

Player Exclusion
 Excluded Player From any Session Wide Script Events, Also will Exclude the player from being Exploded when inside a Defence Sphere.
 

Player Waypoint
 While Toggled on updates the Waypoint to the players location

```

## Player Info

### (Basically some stuff Iâ€™m testing for some future functions)

```md

Latency Test

Get Player Zone Info
 Displays a notify showing you the Zone of the map they are currently in

Get info
 Displays lots of info
 Damage Proofs + Vehicle Health Values +  any interior found at their location

Toggle on Net Stats
 Turns the below function toggles on / off

unAck TX's:

Unreliable Resend Count

Latency (ms):

Packet Loss:
  These Feature Value toggles will update periodically to show the values

Set Mini Map to Players Location
  works properly when not in an interior will make the Radar Mini Map show the area player is located on map

Mini Map Zoom to Players Blip
  use with above function to provide zoom ability needs some fine tuning

Unlock Minimap Zoom
  Toggle enables Zoom and unhides a Value Modifier with manual input when value is not changed and activated a second time

Players Blip Flashes
  flash the players blip needs more work to make flash smoother
  
```

## Player IP Info

```md

Displays IP Info Information
Country, city, region
ISP, Proxy, hosting
 (When using the Script Translation Function will translate this to the Specified Language in the script)
 
```

## Troll & Annoy

```md

Send UFO Lester
 Sends a Big Halloween UFO Attached to Lester on a Jet Pack to Follow & Stalk the Player.
 
Give Treats
 Selectable value defaults to the most common one for 50k bank treat.
 (But be aware these can only be used a limited amount of times per player per session)

Dispatch Cops to Player Location
 (Still testing but I seen undercover cops in the street after using this in a session)

Gangs will Hassle Player
 Nearby Gangs will Hassle Player

Spam Invites
 Spams Apartment & Business Invites Sending the Player Around The Map

Disable Player Interior
 Unloads the interior the player is in
 they should fall through the building or map
 still needs further investigation could be just a local thing rather than working remotely

Island Events:
 < Send to Island v1 | Send to Island v2 | Kick From Island | Island Force Remove >
 
Passive Mode: < Disable Option | Enable Option >
  Disable their Passive Mode Option or Enable it if its been disabled already

Trigger Vehicle Locked On

  Assuming the player is in Range for Detecting their Vehicle,
  if they are using a Weaponised Vehicle or Aircraft this Triggers Missile Lock on Alarm.


```

## Grief This Cunt

```md

Kill with Lock ON Ruiner Missile
  Shoots a High Speed Ruiner Missile Locked on to them (on foot) or their vehicle if in one! Kills them Pretty Fast!

Start Script Fire Near Them
  Starts a Scripted Fire at their Position on the ground, with a high spread rate.

Proximity Surrounded: < Blame Me | Anonymous >
  Surrounds their current location with proximity mines, will either blame you or will be anonymous depending on selection.

surround with snowmen
  Surrounds the player with Snowmen

Kill With: < ALIEN CUNT CANNON | ORBITAL CUNT CANNON >
  Cunt Cannon! kill with alien blast or an orbital cannon blast.

Nearby Vehicles: < Ram | Attack>
 Nearby Vehicles will Ram the player / attack depending on Selection and explode on impact
 Requires you to be close to the player or Spectate them to work effectively

Spawn Nearby Random Attacker
 Spawns a Random Ped from your "pedlist.ini" file & tasks them to attack
 
Send Lester UFO Griefer
	Spawns Lester with a UFO to Hunt Them Down


Gangs will Grief Player
 Spawns Random Gang member nearby to attack

Grief Others (Frame Player)
 Framed Session Orbital Strike
 Now uses actual Orbital Cannon Sounds

Orbital Player:
 Now uses Orbital Cannon Sounds, PTFX and Explosions
 
```

## Script Events

```md

CEO Features >>
 (hidden when they are not in a CEO)

Off The Radar | Ghost Organisation (when they are in a CEO)

Cops Turn a Blind Eye | Bribe the Cops( when they are in a CEO)

```

## Player Pickups

```md

Give Fertilizer Can Pickup
  Need a few drops to get full capacity wont save in their inventory!

Give Armour Pickup
  Gives Armour Pickup standard online if story mode on self gives a Modded Armour.
  
Give Weapon Pickup railgun
  Give New Railgun Pickup this will save in their inventory,
  Until released they can buy ammo via integration menu by selecting buy all ammo.

```


## Online Features Main

```md

Turn Off Damage Proof Vehicle
	Toggle to disable the damage proofs on a vehicle for those that use it

```

### Install location

**%UserProfile%\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\**

![Download the files or installer here:](https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest)

![https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest](https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest)


- File layout:

```md
\2Take1Menu\scripts\MoistFiles\

 json.lua
 kicks.ini
 MoistScript_ESP_Module.lua
 MoistScript_GTA_Natives.lua
 MoistScript_PlayerBar_Module.lua
 MoistScript_PlayerHistory_Module.lua
 MoistScript_ScriptLoader_Module.lua
 MoistScript_Translate_Module.lua
 Moist_InteriorLibs.lua
 Moist_Translate.lua
 PedConfigFlags.lua
 pedlist.ini
 vehlist.ini
 Zones.lua

\2Take1Menu\scripts\

MoistScript_NextGen3009.lua

```

***Notes:***

- Ped list and vehicle list are for your own custom named lists for use in functions to come not required at the moment

- Player bar Module is Load on demand and will save loaded if you wish

- Player bar will not show until in an online session

- To Translate the script simply change the names in the Moist_Translate.lua functions then use Update Script with Translation

- Compatibility Should be better in this version and not conflict with 2.0.x.x versions

- Crash Script events cant be run on yourself as it would crash you everything else will

To Translate:
Ensure to include the Language Short Code in the very first line:

example: **German**

```lua

local Moist_Translate = {lang = "DE"}

```
example: **English**

```lua

local Moist_Translate = {lang = "EN"}

```
example: **French**

```lua

local Moist_Translate = {lang = "FR"}

```

DE will show others & enable the script to recognise its translation as German and will enable the script to use this to translate some other features



simply change the text after: `.name =`
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

```lua

--translated Menu Hints

LocalFeatures["AvengerTeleport"].hint = "Teleportieren Sie sich in Ihren RÃ¤cher, wÃ¤hrend es sich in Ihrer Einrichtung befindet. Bitte beachten Sie, dass die Verwendung von EntitÃ¤ts- / Sitzungsreinigungen dazu fÃ¼hrt, dass dies nicht funktioniert, und Avenger kann nicht mehr in der Einrichtung sein"

FeaturesonlineParent.feats[pid].hint = "Feuchte Drehbuchfunktionen"

```
