# 2Take1-Moist-Script
### GTAV Script for 2Take1's lua Engine by -IN2-Moist-

## Installation

**Required Files & Folders**:

These must be inside the Folder :

**-** scripts

- `MoistScript2.0.1.lua` (Main Script)

Optionally Include :

- `autoexec.lua` (Script loader Autoload with this if you like)
- `settings.lua` (**This is a Dependent file for Script loader to function)


Inside the Scripts Folder you need another Folder called : 

**-** MoistsLUA_cfg

- `Moist_Kicks.data`
- `Moist_Kicks2.data`

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

`*** This Section is empty until you turn on the Show & Load SpawnOptions
in the Main Options Section under Local Script Features! ***`


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

`Spawns nearby onfoot with Weapon & Attacks Player`

- Spawn Support Ped

`Can sometimes attack player, but should attack enemy players/peds`

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



### Online Session:

#### Online Protection

##### Orbital Room Block

- Teleport to block location?
`Teleports you directly in front of the orbital entrance you need to be inside your facility
otherwise game kicks you out of the interior`

- Block Orbital Entrance with Wall

`Puts a invisible wall inside the room blocking players ability to go past the doorway`

- Orbital Inactive Screens over Block

`Places the TV Screens you see inside the orbital showing you the Orbital cannons state or activity these show by default Orbital Inactive
RIP ORBITAL WARRIORS!!`

## Player Functions:

#### - Ped Functions
#### - Vehicle Functions
#### - Player Options

##### Ped Functions 

###### - Player Weapons

- Small list of weapons

##### - Health Modifiers

- Set Max Health 0 (UnDead OTR)
- Set Health to 500
- Set Health to 10000
- Set Health Free mode Beast 2500
- Set Health Ballistic Armour 2600
- Set Health to 10000
- Set Health to 90000
- Set Health to 328 (lvl 120)



##### Ped Functions

- Put Handcuffs on Self
- Set Handcuffs Locked Position
- White Team parachute Pack


##### Player Options


- Force White parachute On
- Force White BPH On
- Mk2 Rapid Fire Hot key



### Clean Shit Up!

#### - World Cleanup

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

`Set their Vehicle's Max Possible Speed to a Value you can input`

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
		`Turn off all RGB Changers
		`White Marker Around Player POS
		`Red Marker Above Player POS
		`Highlight Player RGB Markers v1
		`Highlight Player RGB Markers v2
		`Red & White Above: Flash Ground: Fading

##### Teleport Options

**Teleport Instructions**

`For all Teleport Functions to work Player must be in a vehicle!
Requires you to be in range of their vehicle if the online player
info window shows them as in a vehicle then they are in range.
When not in Range you can try to force it by turning on a
Teleport toggle then go to online player and Spectate them until
you see them next to you then toggle off spectate. T
hey should then be next to you.`


- Teleport Next2me (old Version)

`Teleports the player next to you.`

- Teleport in front of Me

`Teleports them directly in front of you`


- Teleport Beyond World Limits

`Teleports them outside the world boundary limits of the GTA Map`


`CEO 10k money loop`

`Block Passive Mode
`Unblock Passive Mode

##### Remove Player Options

`Various ways to try and force remove the player from your session`

- Kick Data 1 Type 1
- Kick Data 1 Type 2
- Kick Data 2 Type 1
- Kick Data 2 Type 2
- Network Bail Kick




`Online Session
			`Online Protection
							`Orbital Room Block
									`Block Orbital Entrance with Wall
									`Orbital Inactive Screens over Block
				
					`Mark all Players as Modder
					`Mark all Players as Modder
					`UnMark all Players as Modder
					`My Friends DO NOT MOD! MarkOFF

				
	`set Bounty on Lobby
	`NetBail ScriptHost Fuckarino
	`Network Bail Kick
	`Host Kick All

`Player Functions
		`Player Ped Functions
				`Put Handcuffs on Self
				`White Team parachute Pack
				
						`Ped Combat Options
									`unfair aim Damage
									`shoot Offset Distance
									`shoot Z_Offset modifier
									`unfair aim Speed
									`Shoot offset ahead of self
									`Shoot offset ahead of self v2
									`unfair aim Entity
									`unfair aim/Ped Headshot fire
									`Get last Weapon impact Pos
									`Strike last Weapon impact Area

		
`
		`Markers (list of markers to delete made to highlight players)
		
		`World Cleanup
				`Fetch all World Entities
				`Fetched World Entities Move & Delete
Force Removal (Missed Anything?)",				
Fetch all Peds Move & Delete
Fetch all objects Move & Delete
Fetch all Vehicles Move & Delete

				`Force Removal
				`Fetch all Peds into Table
				`Move & Delete Peds
				`Fetch all objects into Table
				`Move & Delete Objects
				`Move & Delete Pickups
				`Fetch all Vehicles into Table
				`Move & Delete Vehicles


`Options
`Hide or Show Script loader`

`Lag Self out of session

`Track all Players POS
`Vehicle God OSD
`Spectate OSD

`fading red white Marker RGBA Changer
`flash red white Marker RGBA Changer
`multi fading colors Marker RGB Changer
`Above Marker RGBA Changer
`Marker RGB Changer
`Ground Marker RGBA Changer

`Date & Time OSD


`Blacklist
	`Reload blacklist
	`Enable blacklist
	`Mark As Modder
	`Kick
	`Manually add scid
	`Remove blacklist (list of players on the list)

`Modder Protex Detect
			`Custom SEP
			`Netevent Hook
			`Weather Timer
					`Logging Shit
						`Log in Game Chat
						`Log Netevents to File
						`Block Logged Script Events
						`Hook Script Events & Log to File
						




