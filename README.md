![MoistScript](https://media.discordapp.net/attachments/743938504375140403/830774254273429535/unknown.png)
# 2Take1-Moist-Script (Build 2.0.3.1: Moist Edition)

      Change Log:
      Possible Crash Fix for Playerinfo OSD
      Weapon info and being in a vehicle causing a crash
      Updated Spawn Triplet  vehicles now a submenu full of various vehicles to choose from with spawn vehicle or spawn vehicle with bodyguard
      Audio Annoyances now play through 3 variations Audio from entity Coordinates and Frontend should minimise sounds that wont play
      Orbital explosions updated still experimental

    Last Update Changes:   
************* BUG FIX!! ***************
  Fixed issues with some sounds causing a crash
  Fixed OSD Logic
  Fixed Logic for Info Window causing Crash
***************************************
      Added Option Script Notify Me (Turns off Most Script Functions using Notify)
      Added Active Script item Player info (Player Info OSD when inside Function for online players)
      Added Function Testing Section : (Some stuff im working on)
        Added Test functions: Orbital Explosion with fx still working on audio for this cant get it to play the actual explosion sound as yet
        Added Test Functions 2D+3D OSD Player Distance from self
      Added New Section under Online Session Troll functions Sound Annoyances
      Added 385 Sounds under this section to piss the session off with
      Added Fuck Ability to Play (can put player on perma loading screen)
      Added Passive Player Detection to the PlayerBar Passive is Faded Grey colour
      Fixed some Broken functionality
      Removed Force Host Auto Kick from options (Session Kick version still there for manual use)

  **  DELETE YOUR SAVED SETTINGS IF YOU DO NOT WANT ERRORS!**

      improved event spam kickdata2 type3
      added kickdata2 type 4 mass spam toggle
      improved session kickdata2 kick
      added player ped modifiers (model swap) --needs to be tested further and remove hashes that wont work
      more script event hashes added to data2

    
          Added New player Crash & session crash
      Added Kick Data 2 Type 3 Mass Event Spam with Retarded amount of Parameters and values this is also added to online session kicks
      
        Layout Updated
        Improved Logging output
        Performance update to the Netevent Logger no longer lags and freezes the game so hard.
        Blips has its own section with colour adjustments & Radial Blips for players or their last used vehicle
        default vehicle is set to distance of 3500 which is roughly the submarine guided missile range
    
  **Bug Fix for my search and replace fucking everything XD**


    Bug Fixes where changes had been breaking or causing another function to not receive data making it malfunction 
    Seems latest update had broken alot of smaller functions and detections,
    i was not going to update this version again until i finish doing v 3.0.0.0 (Code Rewrite so its done in a better way using all the stuff i learned making this one)
    **Dont expect a major update or any more bug fixes now until that version is finished!**
    Chat Spam has had some layout changes
    Added Chat spam Presets subfunction to Delete a preset
    Added a new option in Spam Options to rewrite the preset save data so the deletes are permanent.
    Added back Kick spam until spoofer and force host is back
    Added Script Event Kick to the kick command for friends
    Added Networked marker above players (under troll options currently)
    Added v2 HP info checks players HP Shoots sniper bullets in your name with very low damage then rechecks health see if we can apply damage or not
    Added UndeadOTR and OTR Tags in the local script functions playerlist (these will show when player is in interior etc or not also the undead otr when player has no ped (the i tag in the main playerlist))
    God mode notifications and playerbar tagging have to pass through 2 check loops before being applied or notified the notify been sent resets after a few minutes the option to clear this is now default on 
    with the god check options which are both having a savable setting now

    ```
    
  **  DELETE YOUR SAVED SETTINGS IF YOU DO NOT WANT ERRORS!**
  **Dont expect a major update or any more bug fixes now until that version is finished!**

    ```
    

   - Added Recent Players list into the menu stores 1000 players before resets or you restart the game or script
   - Added functions for recent players:
    1. Copy SCID to clipboard for use with scid joiner / timeout blacklist
    2. Add to blacklist to add them to the scripts blacklist
   
  - Added Notifys to Recently joined/Seen players giving you a count in the notify header of amount times seen since script was started
    Fixed few functions not working correctly player list toggles toggle other functions correctly now
    
    Changed Spawn options so heli vehicles if selected will spawn on maze tower and go to and execute tasks
    
      **  DELETE YOUR SAVED SETTINGS IF YOU DO NOT WANT ERRORS!**


    Experiment Abandoned!
    Revert back to the old Player list Loop since some functions would not work without it

    Player Bar improved further
    More checks added so if player is Complete Retarded cunt & going around invisible we now check their speed if they are moving faster than you can run in an interior
    God Tags get applied

    God mode check & notify has been added default off at the moment will add save at a later date

    Added Other Scripts Parent with a list of all scripts in your script folder click to run they will get hidden so you cant load them more than once
    each loaded script is saved in a table so you can use the option at the top of the list (Save loaded scripts) to save them to file and allow them to autoload on start

    Options that are savable can now be done anytime, Hotkey to save Added Hold **`LCTRL+LSHIFT+S`** to save settings

    player names will still change color with their current state tags will only be added to the end of their names if they fail the checks

    [G] = God Mode Player [V] = Vehicle God [O] = Off The Radar (OTR) [G]+[V] = [G] & [V] are both on
    [UO] = Undead OTR basically player has modified their max health like you can in this script to become UnDead and not visible on the radar


 Credits & Thanks to Kektram for help with OTR Code and code Advice

Thanks to haekkzer for his help and advice over time i was a tester for the menu

Big thanks goes Proddy for all his coding help advice and work to get shit done which without him alot of this
script would  not exist! **


### GTAV Script for 2Take1s Lua Engine (by -IN2-Moist-)

## Installation

**Required Files & Folders**:

These must be inside the Folder : **scripts**

- MoistScript.lua (Main Script)

Inside the Scripts Folder you need another Folder called : **MoistsLUA_cfg**

```
- Moist_Kicks.data
- Moist_Kicks2.data
- Moist_kicks3.data
```

**Extras :**

- autoexec.lua

(Script loader this will  Auto load multiple LUA files on start)

- settings.lua

 **This is a Dependent file for Script loader (autoexec.lua) to function** 

`
also in Folder: **MoistsLUA_cfg**
`
- MoistsScript_settings.ini

(This is Default LUA Save to include Main Script when starting)
`

For Better Compatibility with **2take1script**:

```
1. Remove autoexec.lua & settings.lua
2. execute MoistScript.lua first then 2take1script
```

Seems to work so far without errors

The files and folders required are as they should be and should be extracted from the archive as above.

# Function Parents Sub Parents & Functions within

## Local Script Features

### Moists Script ?.?.?.? (Build Number Version being used)
##### Online Players
`List Of Players by name in the session with the below functions inside`
Player Names have tags:

-IN2Moist-[Y]      =  Y = You

-IN2Moist-[F]      =  F = Social Club Friend

-IN2Moist-[V]      =  V = Vehicle God Mode

-IN2Moist-[G]      =  G = Player God Mode

-IN2Moist-[.SPEC.] = .SPEC. Custom Tag by myself just indicating the Player Spectating outside or not in a dectected interior being in a vehicle inside say Arena Workshop triggers this if you spectate with mod

-IN2Moist-[M]      = M = Player is Marked by 2Take1 as a Modder for some Reason Check online Player Info Window for more Details!

-IN2Moist-[O]      = O = Player is Currently using OTR Could be either Lester OTR CEO Ghost Organisation or a menu modded OTR if this has been on for more than 5mins pretty sure this is Modded!

-IN2Moist-[H]      = H = Player is Currently The Session Host

-IN2Moist-[S]      = S = Script Host of the session (Player Currently Hosting the Freemode.c Script fior the session)


##### Online Session
##### Player Functions
##### World Options
##### Chat Spam
##### Options

### Online Player Script Features

#### Spawn Options 
**`This Section is empty until you turn on the Show & Load SpawnOptions
in the Main Options Section under Local Script Features!`**
##### Ped Spawns
- Ped List
##### Ped + Weapon / Ped + Vehicle
- Weapon list / Vehicle list
##### Selected Weapon / Vehicle

#### Ped + Weapon Functions
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

#### SMS Spam 
- SMS Spam Presets (Default Presets & Your Custom Presets)
- Russian Spam Presets (Few Default Russian Translated Presets)

#### Tools
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


** Inside Moist Script Parent **
- Copy IP to Clipboard
- ToggleOFF Modder Mark
- Attach dildo in Skeleton root
- CEO BAN
- CEO DISMISS
- CEO TERMINATE
- Script Host Crash Kick

** Outside of Moist Script Parent **
- Force Player to Island
- Add to blacklist
- Remove from blacklist

## Online Session:

### Online Protection

#### Black list
- Reload blacklist
- Enable blacklist
- Mark As Modder
- Kick
- Manually add scid
- Remove blacklist (list of players on the list)

#### Modder Protex Detect

**Removed** `- Netevent Hook (Experimental NetEvent Modder Detection)`


#### Orbital Room Block

- Teleport to block location?

(Teleport's you directly in front of the orbital entrance you need to be inside your facility
otherwise game kicks you out of the interior)

- New Orbital Block

(Puts a New Moving Wall Across the Wall the Orbital Door is located in)

- Block Orbital Entrance with Wall

`Puts a invisible wall inside the room blocking players ability to go past the doorway`

- Orbital Inactive Screens over Block

'Places the TV Screens you see inside the orbital showing you the Orbital cannons state or activity these show by default Orbital Inactive
RIP ORBITAL WARRIORS!!''

**Online Protection**

- Log Player Script Events (Value Toggle)

`Select a value that matches the player id in the online info window for that player and toggle on
this will log any script events from that selected player only`

- UnMark all Players as Modder

`Turns off all protections that are being blocked from all Players if they are marked as a Modder
(includes any other detection not set by this script)`

- Mark all Players as Modder (toggle)

`Turns on Protections to block everything from all Players on a loop to ensure everyone gets marked on join`

**Online Session:**

## Session Kicks

- NetBail ScriptHost Fuckarino

`Network bail Kick, with a Script host targeted kick which will kick all in session and will force the script host to send kicks
this has a really bad effect on yourself game ui goes flickery due to you being a script host and you getting spammed with those
kicks although 2take1 protects you from being kicked it makes the game harder to play with the ui going crazy so last resort kick!`

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

## Session Troll Functions

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
- Apply force to world entitys (First Applies Upward force then after delay Random Force on each direction)
- Freeze World Vehicles & Objects
- Any Friends Online (Friend online & in Muliplayer Check & Notify)

## Player Functions:

#### Ped Functions
#### Vehicle Functions
#### Player Options
#### Player Stats

##### Ped Functions 

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

##### Combat Functions

- unfair aim damage (multiplier)
- unfair aim/ped headshot (value select weapon type)
- get last weapon impact pos (required for some functions and turns on when needed)
- Air Strike last weapon impact pos (value Selection for Weapon type that Strikes last impact coords)
- 2nd wep last weapon impact strike (value selection weapon type this shoots second Weaponfire from your hand as if its your gun shooting)
- Air Srike Aim Entity (aim @ any world entity and hit Dpad Right to send an airstrike down on it)

**Ped Functions**
- Give Self Glowstick
- Put Handcuffs on Self
- Set Handcuffs Locked Position
- White Team parachute Pack

#####  Vehicle Functions

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

### World Options

#### World Wave Modifiers

- Get Current Wave Intensity (Toggle to show OSD Currrent Intensity)
- Persistant Wave Intensity (Toggle to keep the Intensity Set)
- Change Wave Intensity (value Modifier Change Value Click to set)
- Change step Size (Step size of above options Adjust to value and click to set)
- Reset Intensity (Click to reset Intensity to game Default)

#### Clean Shit Up!

#### - World Clean up

- Fetched World Entities Move & Delete

`Slowly Removes all Entities in Controllable distance`

- Force Removal (Missed Anything?)

`For anything control could not be obtained for and is left does nothing if there is nothing left over`

- Fetch all Peds Move & Delete

`Slowly Removes all Peds in Controllable distance`

- Fetch all objects Move & Delete

`Slowly Removes all Objects in Controllable distance`

- Fetch all Vehicles Move & Delete

`Slowly Removes all Vehicles in Controllable distance Also you if your inside one! Ignores Player Owned Vehicles`

**Clean Shit Up!**

- Delete Spawned Cunts
`Removes Orbital Block, Attaches Spawned on players, and any future or current general spawns`

- Delete Ped Spawns

`Remove Just Peds Spawned via the OnlinePlayer Features`

- Delete Ped Spawns + Vehicles

`Remove Both Spawned Ped & Vehicles Created via the OnlinePlayer Features`


## Online Player functions


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

