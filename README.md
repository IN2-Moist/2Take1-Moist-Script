# 2Take1-Moist-Script (Build 2.0.0.1)

### GTAV Script for 2Take1s Lua Engine (by -IN2-Moist-)

## Installation

**Required Files & Folders**:

These must be inside the Folder :

**-** scripts

- `MoistScript2.01.lua` (Main Script)

Inside the Scripts Folder you need another Folder called : 

**-** MoistsLUA_cfg

`
- Moist_Kicks.data
- Moist_Kicks2.data
`




Optional Extras :
`
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
> 
For Better Compatibility with **2take1script**:

```
1. Remove autoexec.lua & settings.lua
2. execute Moist2.10.lua first then 2take1script
```

Seems to work so far without errors



The files and folders required are as they should be and should be extracted from the archive as above.
TODO -

## Script Basic Layout

### Moists Script

##### Online Players
##### Online Session
##### Player Functions
##### Clean Shit Up!
##### Options

## Local Script Features

### Moists Script

#### Online Player Script Features


#### Spawn Options 

**`This Section is empty until you turn on the Show & Load SpawnOptions
in the Main Options Section under Local Script Features!`**


##### Ped Spawns

- Ped List


##### Ped + Weapon / Ped + Vehicle

- Weapon list / Vehicle list


##### Selected Weapon / Vehicle

##### Ped + Weapon Functions

- Send Attacker via Parachute

`Spawns in the air above Player Parachutes down
to kill the player with selected weapon`

- Spawn Attacker & Task

`Spawns nearby on foot with Weapon & Attacks Player`

- Spawn Support Ped

Can sometimes attack player, but should attack enemy players/peds

#### Ped + Selected Vehicle Options

- Spawn as Escort & Task

Spawns Ped in Selected Vehicle Behind Player & follows,
will attack player sometimes if they fire weapons.
Certain Vehicles have Multiple Peds

- Spawn as Attacker & Task


Spawns Ped in Selected Vehicle Behind Player & Attacks,
will follow player until they are dead.
Ped`s may attack each other if too many
are spawned and they shoot in each others direction




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
- Custom SEP
- Netevent Hook
- Weather Timer
- Logging Shit
- Log in Game Chat
- Log Netevents to File
- Block Logged Script Events
- Hook Script Events & Log to File
								

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
				
- Mark all Players as Modder

`Turns on Protections to block everything from all Players`

- Mark all Players as Modder (toggle)

`Turns on Protections to block everything from all Players on a loop to ensure everyone gets marked on join`

- UnMark all Players as Modder

`Turns off all protections that are being blocked from all Players if they are marked as a Modder
(includes any other detection not set by this script)`

- My Friends DO NOT MOD! MarkOFF

`For those that find it a issue playing with friends or your friends being able to join and do stuff in your session 
with out getting stuck on long loading screens due to a RAC Detection or something false only effects people in session
currently on your friends list`


**Online Session:**

- set Bounty on Lobby

`10 k Bounty for all including yourself!`


## Session Kicks

- NetBail ScriptHost Fuckarino

`Network bail Kick, with a Script host targeted kick which will kick all in session and will force the script host to send kicks
this has a really bad effect on yourself game ui goes flickery due to you being a script host and you getting spammed with those
kicks although 2take1 protects you from being kicked it makes the game harder to play with the ui going crazy so last resort kick!`

- Kick Host until Session host

`Fast kick all hosts until you are host`

- Network Bail Kick

`Network kick using globals to force the player to bail from the session very effective against most Modder`s but most good menus 
would be protected against this! if it is going to work and kick them it would instantly remove them with no delay`

- Host Kick All

`Only works while you are the current session host, but will kick all players with a Players have voted you out of session message
preventing them joining again. Does not effect you or friends just all others`



## Player Functions:

#### Ped Functions
#### Vehicle Functions
#### Player Options

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



##### Ped Functions

- Put Handcuffs on Self
- Set Handcuffs Locked Position
- White Team parachute Pack


##### Player Options


- Force White parachute On
- Force White BPH On
- Mk2 Rapid Fire Hot key



### Clean Shit Up!

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

`Slowly Removes all Vehicles in Controllable distance Also you if your inside one!`


- Delete Ped Spawns

`Remove Just Peds Spawned via the OnlinePlayer Features`

- Delete Ped Spawns + Vehicles

`Remove Both Spawned Ped & Vehicles Created via the OnlinePlayer Features`



--TODO: Update and adjust

##### Vehicle Options

- ToggleOFF Player Vehicle God Mode

`Turns off players vehicle God Mode if it is on. Requires you to be in range of their vehicle`

- Set Boost & Forward Speed

`For Voltic Boost Enabled Vehicles this will Trigger the Boost then Force the Vehicle Forward at high speed,
Sets the forward speed to a stupid number! Requires you to be in range of their vehicle`

- Vehicle Explode OnImpact

`Sets the vehicle to explode on impact and will Trigger the Boost if it has one then Force the Vehicle Forward at high speed,
Requires you to be in range of their vehicle vehicle should fly forward fast hit something and explode sending it flying!
Range and Ability to gain control determines success or not`


- Input Custom Max Speed

`Set their Vehicle`s Max Possible Speed to a Value you can input`

- Set Max Speed 5

`Sets their Vehicle to a slow speed looks weird on aircraft going that slow in the air XD`

- Reset Max Speed

`Sets Max Possible Speed over Normal values to ensure speed is not restricted any more does not mean they can go that fast!`

- Add Explosive Device

`Adds an Explosive Device to the players vehicle
(this is like the LSC Remote Bomb added to their vehicle but its Registered with your name)
So unless you want your name over their Death when you detonate it probably not an idea to add it XD

- Detonate Explosive Device

`Explodes the Explosive Device you installed in the Previous Function  (Named or Blamed Explosion)`

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

`Teleport`s the player next to you.`

- Teleport in front of Me

`Teleport`s them directly in front of you`


- Teleport Beyond World Limits

`Teleport`s them outside the world boundary limits of the GTA Map`


`CEO 10 k money loop`

`Block Passive Mode
`Unblock Passive Mode

##### Remove Player Options ####

**Various ways to try and force remove the player from your session**

- Kick Data 1 Type 1
- Kick Data 1 Type 2
- Kick Data 2 Type 1
- Kick Data 2 Type 2
- Network Bail Kick



### Options 
**- Marker Options**
**- Notify Customisation**
 
- Save Settings

- Show & Load Spawn Options

- Show HUD Component (Experimental)

- MultiAim Tool (LShift or PS:X / XBC:A)

- Lag Self out of session

- Track all Players POS

- Track all Players HP

- Vehicle God OSD

- Modded Vehicle Speed OSD

- Spectate OSD

- Player Bar OSD

- Date & Time OSD

**Marker Options
`fading red white Marker RGBA Changer
`flash red white Marker RGBA Changer
`multi fading colors Marker RGB Changer
`Above Marker RGBA Changer
`Marker RGB Changer
`Ground Marker RGBA Changer







