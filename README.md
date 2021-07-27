![MoistScript](https://media.discordapp.net/attachments/743938504375140403/830774254273429535/unknown.png)
# 2Take1-Moist-Script (Build 2.0.4.5: Moist Edition)

 Credits & Thanks to Kektram for help with OTR Code and code Advice

Thanks to haekkzer for his help and advice over time i was a tester for the menu

Big thanks goes Proddy for all his coding help advice and work to get shit done which without him alot of this
script would  not exist!

** Recent Updates & Changes **

Removed Script loader due to issues with some scripts breaking this script loading them
updated Event hashes kicks etc
Removed some kick Features Updated remaining
Removed the need for Kick data 2+3 files no longer needed
Added back Bounty options both session wide 10k and player feature Method
Bounty indicator on playerbar once set will most likely stick until reset state as i have not had chance to look into the new event hash as yet
Removed CEO Money not had time to look at the new game scripts in depth to work this one out yet
Give Weapon Strike updated to show Named Weapon Strike Values
Updated interior location lua with some new interiors

### GTAV Script for 2Take1s Lua Engine (by -IN2-Moist-)

## Installation

**Required Files & Folders**:

These must be inside the Folder : **scripts**

### **\AppData\Roaming\PopstarDevs\2Take1Menu\scripts**

- **MoistScript.lua** (Main Script)


Inside the Scripts Folder you need another Folder called : **MoistsLUA_cfg**

### **\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg**

- interiors.lua
- Moist_KickParam.ini
- Moist_Kicks.ini
- vehicle-hashes.lua

**Extras :**
These must be inside the Folder : **scripts**

### **\AppData\Roaming\PopstarDevs\2Take1Menu\scripts**

- **autoexec.lua** (Basic Autoload for my script)


**So Folder Structure for Script to Work as Intendended:** Should look like below
```
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\interiors.lua
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\Moist_KickParam.ini
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\Moist_Kicks.ini
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\Moist_Kicks2.ini
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\Moist_Kicks3.ini
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistsLUA_cfg\vehicle-hashes.lua
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\autoexec.lua
\AppData\Roaming\PopstarDevs\2Take1Menu\scripts\MoistScript.lua
```
# Function Parents Sub Parents & Functions within

## Local Script Features

### Moists Script ?.?.?.? (Build Number Version being used)
#### Online Features


##### Online Players
`List Of Players by name in the session with the below functions inside`
Player Names have tags:

(**`*p`** = Also used on the Player Bar Feature)

-IN2Moist-[Y]                    =  Y = You

-IN2Moist-[F]                    =  F = Social Club Friend

-IN2Moist-[G]                    =  G = Player God Mode **`*p`**

-IN2Moist-[V]                    =  V = Vehicle God Mode **`*p`**

-IN2Moist-[U]                    =  U = Undead OTR (player health 0/0 or <=328/0) **`*p`**

-IN2Moist-[**B:** `somevalue`]   =  B = Bounty: Value of Bounty **`*p`**

-IN2Moist-[.SPEC.]               = .SPEC. = Spectating

-IN2Moist-[M]                    = M = Player is Marked as a Modder! See online Player Info Window for more Details!

-IN2Moist-[O]                    = O = Player is OTR Could be either Lester OTR CEO Ghost Organisation or Modded **`*p`**

-IN2Moist-[H]                    = H = Player is Currently The Session Host **`*p`**

-IN2Moist-[S]                    = S = Script Host (Freemode.c) **`*p`**


##### Online Features
##### Player Features
##### Combat Features
##### Other Scripts
##### Options

### Online Player Script Features
** Inside Moist Script Parent **
#### Spawn Options 
**`This Section is empty until you turn on the Show & Load SpawnOptions
in the Main Options Section under Local Script Features!`**
##### Ped Spawns
- Ped List
##### Ped + Weapon / Ped + Vehicle
- Weapon list / Vehicle list
##### Selected Weapon / Vehicle

#### Ped + Weapon Features
- Send Attacker via Parachute
`Spawns in the air above Player Parachutes down
to kill the player with selected weapon`
- Spawn Attacker & Task
`Spawns nearby on foot with Weapon & Attacks Player`
- Spawn Support Ped
Can sometimes attack player, but should attack enemy players/peds

#### Ped + Selected Vehicle Options
- Spawn as Escort & Task
`Spawns Ped in Selected Vehicle Behind Player & follows,
will attack player sometimes if they fire weapons.
Certain Vehicles have Multiple Peds`

- Spawn as Attacker & Task
`Spawns Ped in Selected Vehicle Behind Player & Attacks,
will follow player until they are dead.
Ped's may attack each other if too many
are spawned and they shoot in each others direction`

#### Player Tools
Save Players Current POS to file (Output is compatible for copy & Paste to your Config for menu use) `C:\Users\IN2Moist\AppData\Roaming\PopstarDevs\2Take1Menu\cfg\tele.cfg`

#### Bounty Options 
Anonymous Bounty (Anonomous (ON) = NPC Bounty (OFF) Bounty = By You)
Custom Value `Enter any Value Between 0 & 10,000`

`List Preset Values`

#### Force Player to Mission
- Force to Severe Weather
- Force to Half Track
- Force to Night Shark AAT
- Force to APC Mission
- Force to MOC Mission
- Force to Tampa Mission
- Force to Opressor Mission1
- Force to Opressor Mission2
- 
#### SMS Spam 
- SMS Spam Presets (Default Presets & Your Custom Presets)
- Russian Spam Presets (Few Default Russian Translated Presets)

- ToggleOFF Modder Mark
- Attach Big Dildo on every bone
- Attach dildo on every bone
- Attach dildo in Skeleton root
- CEO BAN
- CEO DISMISS
- CEO TERMINATE

** Outside of Moist Script Parent **
- Force Player to Island
- Copy IP to Clipboard
- Add to blacklist
- Remove from blacklist
- Script Host Crash Kick
  

## Online Features:

### Online Players

- List of online players see Player Features below for info of functions inside each player

### Recent players

- List of Recently Encountered Players
- Copy SCID
- Add to Blacklist
- Temp BlacklistPlayer:
   ** By IP, SCID or Players Name **

### Online Session

#### Troll Features
#### Sound Annoyances

- list of sounds

**Troll Features**

- Heart Beat
`Timed Explosion like a Beating Heart`

- Random Exp
`(Explosion Type)`

- Exp delay
`Delay Between Random Exp`

- set Bounty on Lobby
`10 k Bounty for all including yourself!`

- Block all Players Passive
`Prevent any player from being able to use passive mode`

**Play Game Sounds from all players ped + Coords**
- all Horn
- all Air Drop
- all Explosion Countdown
- all Water Splashes
- Annoying sound! CANT BE UNDONE! (YOU NEED TO LEAVE THE SESSION TO STOP IT)
- allBomb Armed (Value Toggle the value is a delay between each loop)  		**Offset Delays for these and play a kinda tune**
- all Bomb Disarmed (Value Toggle the value is a delay between each loop)	**These combined Delay's offset from the other to Make Music**
- Illuminate Everyone (Light Hat + Little Strobe Light Attaches on all) 
- Everyone is a Dick Head! (Big Ass Black Dildo on everyones Forehead)
- Give all Dildo Dicks (Big Ass Black Dildo between everyones legs)

**Online Session**
- Give Everyone OTR
- Give Everyone Cop Bribe
- Give Everyone Enemy Blips
- Apply force to world entitys (First Applies Upward force then after delay Random Force on each direction)
- Freeze World Vehicles & Objects
- Any Friends Online (Friend online & in Muliplayer Check & Notify)


### Online Protection

#### Black list
- Reload blacklist
- Enable blacklist
- Mark As Modder
- Kick
- Manually add scid
- Remove blacklist (list of players on the list)


#### Orbital Room Block

- Teleport to block location?

(Teleport's you directly in front of the orbital entrance you need to be inside your facility
otherwise game kicks you out of the interior)

- New Orbital Block Blast Door

(Puts a Blast Door in place of the orbital room door)

- Moving Wall Orbital Block

(Puts a New Moving Wall Across the Wall the Orbital Door is located in)

- Block Orbital Entrance with Wall

`Puts a invisible wall inside the room blocking players ability to go past the doorway`

- Orbital Inactive Screens over Block

'Places the TV Screens you see inside the orbital showing you the Orbital cannons state or activity these show by default Orbital Inactive
RIP ORBITAL WARRIORS!!''

#### Block Glitch Spots

- Various Glitch Spots like Casino God Mode Glitch are in here

- Log Player Script Events (Value Toggle)

`Select a value that matches the player id in the online info window for that player and toggle on
this will log any script events from that selected player only`

- UnMark all Players as Modder

`Turns off all protections that are being blocked from all Players if they are marked as a Modder
(includes any other detection not set by this script)`

- Mark all Players as Modder (toggle)

`Turns on Protections to block everything from all Players on a loop to ensure everyone gets marked on join`


### Session Kicks

- NetBail ScriptHost Fuckarino

`Network bail Kick, with a Script host targeted kick which will kick all in session and will force the script host to send kicks
this has a really bad effect on yourself game ui goes flickery due to you being a script host and you getting spammed with those
kicks although 2take1 protects you from being kicked it makes the game harder to play with the ui going crazy so last resort kick!`

- Session Kick Data2 Type2
  
  `Kicks session using all data2 kicks`

- Script Event Crash Session
  
- Kick Host until Session host

`Fast kick all hosts until you are host`

- Network Bail Kick

`Network kick using globals to force the player to bail from the session very effective against most Modder's but most good menus 
would be protected against this! if it is going to work and kick them it would instantly remove them with no delay`

- Test Kick

` Experimental Script Event Kick`

- Host Kick All

`Only works while you are the current session host, but will kick all players with a Players have voted you out of session message
preventing them joining again. Does not effect you or friends just all others`

### Clean Shit Up!

#### World Clean-up

- Fetch World Entities Move & Delete
- Fetch all Peds Move & Delete
- Fetch all objects Move & Delete
- Fetch all Vehicles Move & Delete
- Fetch all Pickups Move & Delete

`Clean up entities we can get control of and removes them from the map and deletes this excludes any player owned vehicles`

- Delete Spawned Cunts
- Delete Blips Added
- Delete Alkonost Lag Spawns
- Delete Ped Spawns
- Delete Ped Spawns + Vehicles

### World Options

#### Weather Overide

- Reset Overide weather
- Clear Cloud Hat
- list of weathers
  
#### World Wave Modifiers

- Get Current Wave Intensity
- Persistant Wave Intensity toggle Value Modifier
- Change Wave Intensity Value Modifier
- Reset Intensity

### Chat Spam

- Preset Spam 
 `list of preset spam`
- Your Custom Spam
  `list of your own saved presets`
- Russian Spam
  `list of preset russian spam`
- Spam Options
  `Add Presets and set delay options here`

- no text spam
  `very fast blank spam`
- Send Clipboard Contents
  `Sends text in clipboard`
- String Char Randomised spam
  `fast random ascii character spam`
- String Char Randomised Delayspam
  `Delayed random ascii character spam`

## Player Features:

#### Ped Features
#### Vehicle Features
#### Player Options
#### Player Stats

##### Ped Features 

##### Player Weapons

- Small list of weapons

##### Health Modifiers

- Set Max Health 0 (UnDead OTR)
- Set Health to 500
- Set Health to 10000
- Set Health Free mode Beast 2500
- Set Health Ballistic Armour 2600
- Set Health to 10000
- Set Health to 90000
- Set Health to 328 (level 120)

##### Combat Features

- unfair aim damage (multiplier)
- unfair aim/ped headshot (value select weapon type)
- get last weapon impact pos (required for some functions and turns on when needed)
- Air Strike last weapon impact pos (value Selection for Weapon type that Strikes last impact coords)
- 2nd wep last weapon impact strike (value selection weapon type this shoots second Weaponfire from your hand as if its your gun shooting)
- Air Srike Aim Entity (aim @ any world entity and hit Dpad Right to send an airstrike down on it)

**Ped Features**
- Give Self Glowstick
- Put Handcuffs on Self
- Set Handcuffs Locked Position
- White Team parachute Pack

#####  Vehicle Features

- Flare Countermeasures (Hotkey = "CTRL" Value = Speed of Flare Projectile)
- Voltic Boost Delayed Refill (Designed for MK1 Opressor Refills instantly after short delay no need to be on ground)
- Voltic Boost Instant Recharge (Designed for MK2 Opressor release the acceleration for a moment to instant refill boost)
- RapidFire RepairLoop Glitch (Forces Vehicle Fixed on a fast loop causing the weapons to become Rapidfiring weapons works on missiles & guns)

##### Player Options

- Force White parachute On
- Force White BPH On
- RapidFire RepairLoop Hotkey
- Switch Thermal/NV Hoykey (Switch on or off Thermal or nightvision goggles on any helmet purcased or not)
- Show Weapon Recticle
- Rapid RPG Switch (switches RPG to remove reload while shooting)

##### Player Stats 

`Work in progress & experimental`

###### Player Stat Checks

- Get mental State
- Check Thermal/NV State
- Helmet Visor State

###### Player Stat Setup

- Set Mental State (Updates the value with current mental state entering this section)
- Switch Helmet Visor State (Switches current state of Helmet Visor (Up or Down))
- Switch Thermal/NV State (Switch current state of Thermal or nightvision (ON or OFF))

###### Quick Stat Setups

- Setup Casino Heist Stealth Diamonds

`Requires you to first goto the heist board and pay for setup then it is a 1 click setup
masks are chosen at random, this will also make a stat recovery script which can be loaded
to reset the changed stats should you need to`

## Online Player Features


##### Remove Player Options

**Various ways to try and force remove the player from your session**

- Spam Then All! (toggles on : **)
- Kick Data 1 Type 1 **
- Kick Data 1 Type 2 **
- Kick Data 2 Type 1 **
- Kick Data 2 Type 2 **
- Kick Data 3 Type 1 **
- Kick Data 3 Type 2 **
- Kick Data 3 Type 3 (individual Kick event via selection not Batch like above)

- Network Bail Kick

- Network Bail Kick ScriptFuck (fucks ScriptHost)
- SE Kick
- SPECIAL KICK
- Script Event Crash (Improved with version 2.0.1.9)

##### Vehicle Options

- Player Vehicle God Mode ON
- Player Vehicle God Mode OFF


`Turns on/off players vehicle God Mode if it is on. Requires you to be in range of their vehicle`

- Vehicle Targetable
- Vehicle Not Targetable

`Turns on / off other Players Ability to Missile Lock on to vehicle`

- Set Boost & Forward Speed

`For Voltic Boost Enabled Vehicles this will Trigger the Boost then Force the Vehicle Forward at high speed,
Sets the forward speed to a stupid number! Requires you to be in range of their vehicle`

- Vehicle Explode OnImpact

`Sets the vehicle to explode on impact and will Trigger the Boost if it has one then Force the Vehicle Forward at high speed,
Requires you to be in range of their vehicle vehicle should fly forward fast hit something and explode sending it flying!
Range and Ability to gain control determines success or not`


- Input Custom Max Speed

`Set their Vehicle's Max Possible Speed to a Value you can input`

- Set Max Speed 5

`Sets their Vehicle to a slow speed looks weird on aircraft going that slow in the air XD`

- Reset Max Speed

`Sets Max Possible Speed over Normal values to ensure speed is not restricted any more does not mean they can go that fast!`

- Add Explosive Device

`Adds an Explosive Device to the players vehicle
(this is like the LSC Remote Bomb added to their vehicle but its Registered with your name)
So unless you want your name over their Death when you detonate it probably not an idea to add it XD`

- Detonate Explosive Device

`Explodes the Explosive Device you installed in the Previous Function  (Named or Blamed Explosion)`


##### Teleport Options

**Teleport Instructions**

`For all Teleport Functions to work Player must be in a vehicle!
Requires you to be in range of their vehicle if the Online player
info window shows them as in a vehicle then they are in range.
When not in Range you can try to force it by turning on a
Teleport toggle then go to Online player and Spectate them until
you see them next to you then toggle off Spectate. T
hey should then be next to you.`

- Teleport Next2me (old Version)

`Teleport's the player next to you.`

- Teleport in front of Me

`Teleport's them directly in front of you`


- Teleport Beyond World Limits

`Teleport's them outside the world boundary limits of the GTA Map`

--TODO: update for new Highlight controls

##### Highlight Options
```
Turn off all RGB Changers
White Marker Around Player POS
Red Marker Above Player POS
Highlight Player RGB Markers v1
Highlight Player RGB Markers v2
Red & White Above: Flash Ground: Fading
```
#### Troll Options
 - Sound Functions
 `List of Various Sounds`
 - Update Lights POS(move with Player)
- Update Lights POS(move with Player)
- Set Lights around player
- Rotating Lights
- Rotating Lights
- Attach Broken ufo
`Attaches Broken Smoking UFO on Target`

#### Attachment Options

###### **Experiments**
- Room Attachment
**Experimental** `Bullet Proof Glass Attaches around Player (V.1 Object)`
- Room Attachment v2
**Experimental** `Bullet Proof Glass Attaches around Player (V.2 Object)`
``

``
- Room Attachment v3 `Dark Orb around Player (Cant See in or out)`

- scramjet Deer `Pet Deer Follow Target like a lost puppy (Deer has No Combat ability hates noone) the Deer is esentially Harmless`

#### Griefing Options

#### Lester Ramjet

- Run Delayed Cleanup?
`Time Delayed Removal of Scramjets`
- Lester RamJet Attack Player
`Value is Spawn Offset From Player: "-" (Negative Values = Behind Player)
Spawns Lester in a Scramjet Tasks Him to Attack Player: Shoots Missiles @ Target as He Voltic Boosts into them`
- Lester RamJet Impact Player
`Value is Spawn Offset From Player: "-" (Negative Values = Behind Player)
Spawns Lester in a Scramjet Voltic Boosts into Target Scramjet will Explode on any Impact`

- Attach all RamJets offset
`Value is attach Offset From Attached Bone of Target
Toggle off Will Delete All` 

- Get last Weapon impact POS
- Give last Weapon Impact Strike
- Dump World Pickups on this Cunt!
- Dump World onto this Cunt! & Freeze it
- Block Passive Mode
- Unblock Passive Mode

** Griefing Options ** 
- Own The Blame For this shit?
`if the Player gets Killed from these Functions This will Give you the Kill add your name to their death`

- Dildo Illuminate Cunt
- Dildo Bombs From Ass
- Airstrike player
- Snipe for all Directions
- Send Lester Hunt them in savage
`Spawns Lester in a Savage on the Mission Row Police Helipad & Hunts them down & Destroys their ass!`
- Note:
** Lester Fails to do anything if this is done while target player is in a submarine interior maybe other interiors so ensure player is outside **
** Spawn one at a time ensure he has left the helipad before doing it again otherwise you will end up with a Heli Cluster Fuck in that area **

**Experimental Note**
`Lester Might Fuck up and start Falling through the map`
** **Currently i am testing this out with no collision to prevent lights signs & poles being an issue when Lester is Flying @ Street Level** **

- retask **Now a Task and Delete Function**
`Turns on When you Send Lester to hunt Target Player.
Makes Lester Attack the Player again after Death until Lester is Deleted or Player is No Longer in Session.
or should you toggle this off the Spawns should Delete assuming we can get control over them
Time Delay set for longest Respawn`

- alkonost AIO Spot Lag
- alkonost V1 POS Lag
- alkonost V2 OFFSET Lag
`Value for these are Amount **Be Sure to Keep an eye on your network Entity Pools** Exceeding the max value will Crash your Game`

- Attach all alkonost lag
`All Spawned Alkonost's Will Be Attached To The Target Player
Toggle off Will Delete All` 

- kosatka AIO Spot Lag
- kosatka V1 POS Lag
- kosatka V2 OFFSET Lag
`Value for these are Amount **Be Sure to Keep an eye on your network Entity Pools** Exceeding the max value will Crash your Game`

- kosatka Crash Test `Experimenting with this may not crash at all`

- Attach all kosatka lag
`All Spawned kosatka's Will Be Attached To The Target Player
Toggle off Will Delete All`   
  
#### Info Options
- Check Players HP Stats & Weapon
`Notify of Players Health & Armour Values & Currently Held Weapon`
- Set WayPoint on Player

- CEO 10 k money loop
- Give Long Cop Bribe
- Block Passive Mode
- Unblock Passive Mode

### Options 

#### Marker Options

#### Notify Customisation

#### Logging Shit


- Save Settings (Saves all Set options Currently Coded for Save including anything outside the options section)

- Show & Load Spawn Options

- MultiAim Tool (LShift or PS:X / XBC:A)

- Lag Self out of session

- Track all Players POS

- OTR OSD
` Text down the left side of the screen Indicating Off the Radar Players
 **   "OTR : Players Name"  **

- High Player Speed OSD

- Spectate OSD

- Player Bar OSD

`Black Bar across the top of the screen with all current session players displayed and Colour Coded to their Current State`

- Red       Player is God Mode
- Orange    Vehicle is God Mode
- Pink      Player & Vehicle is God Mode

- Date & Time OSD

`Small Clock added to the Right hand side of the player bar`



**Marker Options**

`These toggle on depending on what you have selected or turned on to highlight a player in the local script Functions under any player`

- fading red white Marker RGBA Changer
- flash red white Marker RGBA Changer
- multi fading colours Marker RGB Changer
- Above Marker RGBA Changer
- Marker RGB Changer
- Ground Marker RGBA Changer

**Logging Shit**
- Log in Game Chat


- Hook Script Events & Log to File (Output and Log Script Events to a log file)
- Log event hash only (Hash logger)

