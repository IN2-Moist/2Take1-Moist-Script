# 2Take1-Moist-Script
### GTAV Script for 2Take1's lua Engine by -IN2-Moist-

## Installation

**Required Files & Folders**:

These must be inside the Folder :

**-** scripts

- `autoexec.lua`
- `MoistScript2.0.lua`
- `settings.lua`


Inside the Scripts Folder you need another Folder called : 

**-** MoistsLUA_cfg

- `loader autoload.ini`
- `Moist_Kicks.data`
- `Moist_Kicks2.data`

The files and folders required are as they should be and should be extracted from the archive as above.


## Script Basic Layout

### Moists Script

##### Online Players
##### Online Session
##### Player Functions
##### Clean Shit Up!
##### Options


### Online Session:

##### Online Protection
##### Orbital Room Block

### Player Functions:

##### Player Ped Functions
##### Player Vehicle Functions

### Clean Shit Up!

#### Markers *(list of markers to delete made to highlight players)*
		
#### World Cleanup




## Local Script Features

### Moists Script

#### Online Player Script Features


#### Spawn Options 
#####  Ped Spawns

- `Delete Ped Spawns`
- `Delete Ped Spawns + Vehicles`

######  Ped Spawns

> - `Ped List` 

###### Ped + Weapon / Ped + Vehicle

> - `Weapon list / Vehicle list`

###### Selected Weapon / Vehicle

> `Ped + Weapon Functions`

- `Send Attacker via Parachute`
(Spawns in the air above Player Parachutes down to kill the player with selected weapon)

- `Spawn Attacker & Task`
(Spawns nearby onfoot with Weapon & Attacks Player)

- `Spawn Support Ped`
 (Can sometimes attack player but should attack enemy players/peds)

> `Ped + Selected Vehicle Options`

- `Spawn as Escort & Task`
(Spawns Ped in Selected Vehicle Behind Player & follows, will attack player sometimes if they fire weapons.  Certain Vehicles have Multiple Peds)

- `Spawn as Attacker & Task`
(Spawns Ped in Selected Vehicle Behind Player & Attacks, will follow player until they are dead Ped's may attack each other if too many are spawned and they shoot in each other direction)


````
--TODO: Update and adjust

##### Vehicle Options
		`ToggleOFF Player Vehicle God Mode
		`Set Boost & Forward Speed
		`Vehicle Explode OnImpact
		`Set Max Speed 5
		`Reset Max Speed
		`Add Explosive Device

##### Highlight Options
		`Turn off all RGB Changers
		`White Marker Around Player POS
		`Red Marker Above Player POS
		`Highlight Player RGB Markers v1
		`Highlight Player RGB Markers v2
		`Red & White Above: Flash Ground: Fading

##### Teleport Options
		`Teleport in front of Me
		`Teleport Beyond World Limits


`CEO 10k money loop
`Block Passive Mode
`Unblock Passive Mode

##### Remove Player Options
			`Kick Data 1 Type 1
			`Kick Data 1 Type 2
			`Kick Data 2 Type 1
			`Kick Data 2 Type 2
			`Network Bail Kick






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


		`Player Vehicle Functions
							`mk2 rapid fire hotkey

		
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
						




