# Moist Script NG 3.0.2.9 Read Me

> This is [The MoistScript NG Wiki Content](https://github.com/IN2-Moist/2Take1-Moist-Script/wiki)

![aa](https://user-images.githubusercontent.com/4621091/258976694-7be8bc3b-b62a-48c2-8e2b-4a798d577352.png)

Layout of the Script Within the Menu

Local Features

Moist Script NG 3.0.x.x

```
Player Features

Weapon Features

Moist Weapon Mods

 Moist Weapon Mods Options

 Portable Defence Sphere

Weapon Related Functions


Teleport Features


Player Ped Features


Player Vehicle Features

Cargo Bob Mod

Moist's Train Mod


Online Features

Player History

Session Griefing

Session Kick Functions



Money Stats & Globals <- here <- Nightclub Vault money Methods

Moists Session Attributes

Chat Features

Chat Options


World Features

Atmospheric Lighting

Atmospheric Lighting Modifiers

Weather Functions

Alarm Zones (Local Only)


Game UI Enhancements

Radar Enhancements

Projectile Radar


Features Testing

Camera Functions

Entity Functions & Tools

Moist Script Loader

Moist Script Settings

Save Settings Options

Script Update Options

Moist Script HOTKEYS

Detections & Protections

Blacklist Module

Modder Flagging


Load Moist Script Modules
Custom Lists for Features
```

___

Online Features

```
Moist Script NG 3.0.x.x

Remove Player

Player Options

Spawn Options

Teleport Options

Player Vehicle Options

Decorators

Player Info

Player IP Info

Troll & Annoy

Grief This Cunt

Grief Others (Frame Player)

Script Events

Player Pickups

Player Attributes
```


<hr>

<hr>

# MoistScript NG Installation


<hr>


### Install location

> %UserProfile%\\AppData\\Roaming\\PopstarDevs\\2Take1Menu\\scripts\\

[Download Latest Files Here](https://github.com/IN2-Moist/2Take1-Moist-Script/releases/latest)

### File layout:

#### \\2Take1Menu\\scripts\\MoistFiles\\

-   json.lua
-   kicks.ini
-   MoistScript\_Blacklist\_Module.lua
-   MoistScript\_ESP\_Module.lua
-   MoistScript\_FeatureValue\_Saver.lua
-   MoistScript\_GTA\_Natives.lua
-   MoistScript\_MoistBasics\_Module.lua
-   MoistScript\_PlayerBar\_Module.lua
-   MoistScript\_PlayerHistory\_Module.lua
-   MoistScript\_ScriptLoader\_Module.lua
-   MoistScript\_Translate\_Module.lua
-   MoistScript\_Teleport\_Module.lua
-   Moist\_InteriorLibs.lua
-   MoistScript\_ScriptTranslation.lua
-   PedConfigFlags.lua
-   pedlist.ini
-   Recent\_Spam\_Chat\_Text.txt
-   vehlist.ini
-   Zones.lua
-   target.png

> \\2Take1Menu\\scripts\\

MoistScript\_NextGen.luac

#### Before Starting the Script

Ensure to Enable Trust Modes For:

-   HTTP
-   Globals
-   Natives

<hr>

<hr>

![NextGen](https://camo.githubusercontent.com/8a8aaaa21155ab6f7f8e85ce135e2139c3209eb57ebb9617775ad086b4c9cf42/68747470733a2f2f6d656469612e646973636f72646170702e6e65742f6174746163686d656e74732f313034333738383233323537373532333732362f313039343237373830363338363539333832322f52737461722e706e67)

___

# MoistScript NG Script Features (Local)

<hr>

___

#### NG: (Next Generation)

___

## Local Script Features

## Player Features

## Teleport Features

> Requires The Teleport Module to be loaded

___

## Player Ped Features

-   ### Make My Ped Wet ! ! _:P_
    

> Drench your ped like its raining heavily or you just come out of water

-   ### Give My Ped Sexiness
    

> Random Function I found might cause different types of reactions towards you from NPC's around the map

-   ### Set Myself Ghosted to Other Players
    

> Sets Ghosting to others this is also in one of the defence sphere options

-   ### Set Ped Damage Proof
    

> Essentially God Mode but without Advertising that fact

-   ### Turn Me into a Cop
    

> (not outfit related makes your ped like a cop so you get ignored by cops get a cop cone on radar when wanted)

___

## Player Vehicle Features

___

## Player Vehicle Features `(Sub Features)`

### Cargo Bob Mod

-   ### Cargo Bob: Hook | Magnet
    

> Select the Type of Pickup for your Cargo Bob

-   ### Magnet Pickup Strength: `modifier Value`
    

> Strength of the magnet when picking things up, stronger should mean it can pickup heavier stuff

-   ### Magnet Effect Radius: `modifier Value`
    

> Radius around the Magnet the Magnetism will effect (Area the Magnet Pulls Stuff Towards the magnet) Big Area means More Stuff is going to be attracted to the magnet, Small Area means its going to be more precise, more local to the magnet itself so should avoid attracting a shit ton of stuff!

-   ### Magnet Pull Rope Length: `modifier Value`
    

> Adjusts The Rope Pull Amount: so if you pick something heavy up it would pull or stretch the rope or pull it out a bit, this sets how much it can pull out when lifting

-   ### Magnet Rope Length: `modifier Value`
    

> Actual Length of the rope from which the magnet hangs down Below\`\*\*

-   ### Magnet Pull Strength: `modifier Value`
    

> This can cause shit to slam into you! this is the Strength Pulling you down towards the item being attracted.

## Moist’s Train Mod

-   ### Enable Train Spawning
    

> Enables Spawning of Trains and turns on Control Meter and Controller Support to control trains
> 
> > Controls are Controller based:
> > 
> > > Left Trigger :: Reduce Cruise Speed or Speed negative (go backwards)

> > > Right Trigger :: Increase Cruise Speed or Speed Forwards

> > > > Right Top Bumper/Trigger(Handbrake) :: Turns on Stop Train and sets all speeds to 0.0

-   ### Track Switch
    

> Sets Trains enabled on other tracks (WIP) still figuring this one out

-   ### Train Control `< Stop Train Enable Access | Enter Nearest Train as Driver>`
    

> option 1 will try to stop train and low you to enter (WIP not working fully yet)
> 
> > option 2 Enter nearest train if one found nearby

-   ### Switch Train Spawn Direction
    

> changes the direction spawned train is facing

-   ### Spawn Train Variation
    

> 23 variants can be spawned
> 
> > Freight and Metro, Most of them are Freight Trains with Various Amount of Carriages.

-   ### Train Cruise `Controlled With Controller / Key for Acceleration`
    

> Sets Train Cruise Speed When on, train will slowly increase speed until it hits set speed

-   ### Train Speed
    

> Sets Train Speed Immediately

-   ### Stop Train `Controlled With Controller / Key for Handbrake`
    

> used with controller control tries to stop train

-   ### Control Speed(Instant Insane Speed)
    

> use this with Train Speed on to use controller input to set the speed
> 
> > **`Be Warned:`**
> > 
> > > This Control is Extremely sensitive so speeds are insane Slightest control movement and you are going 100x faster than any jet

-   ### Derail Train
    

> Does as it says sets the train to a Derailed State while on

-   ### Turbulence Modifier
    

> 0.0 (No Turbulence)
> 
> > 1.0 (Very Turbulent)

-   ### Set Air Drag Multiplier:
    

> Adjust drag on vehicle caused by aircraft

-   ### Altitude Level Indicator
    

> Adjust to bring the Radar Aircraft Height lines on the radar on foot or other vehicles that don’t use these

-   ### Disable Plane Aileron
    

> (extra rudders on the aircraft to control roll yaw and pitch see animations below)

### Plane Aileron Animations

![AlieronRoll](https://camo.githubusercontent.com/868eefea9b85de55da1ab11db74c70a3bbe5a88253874f210e9cdff660ce656e/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f632f63632f41696c65726f6e5f726f6c6c2e676966)

___

![AlieronYaw](https://camo.githubusercontent.com/9626df4eca5fcaab4929da92449b70b822fe1659e026b974b55b72ced243da28/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f392f39362f41696c65726f6e5f7961772e676966)

___

![AlieronPitch](https://camo.githubusercontent.com/fd12e9962851d7af12c42041a12a78b9c7fbd4094bc54e905cf390159320d822/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f652f65632f41696c65726f6e5f70697463682e676966)

___

### Player Vehicle Features: `Continued`

-   ### Set Bomb Count
    

> Enables you to set & Refill your Aircraft Bombs

-   ### Modify Vehicle Top Speed
    

> Change Possible Top Speed of Vehicle

-   ### Max Speed Override
    

> Basically Bypasses Game Speed Restrictions on your Vehicle

-   ### Set Vehicle Damage Proof
    

> Vehicle Becomes Near to God Mode without Detection Impossible to Visibly Damage it from impacts explosions etc

-   ### Engine Audio:
    

> Override Current Vehicle Engine Audio List Populated from vehlist.ini default preset Chernobog

### Money Stats & Global’s:

___

-   Set Stat With Created Logo:

> Adds a R\* Created Logo at the start of the Text you input

-   Set Stat With Verified Logo:

> Adds a R\* Verified Logo at the start of the Text you input

___

-   String Stat Builder

> GB\_GANG\_NAME :: Combines the 2 stats that makes up your CEO Organisation Name GB\_OFFICE\_NAME :: Combines the 2 stats that makes up your CEO Office MC\_GANG\_NAME :: Combines the 2 stats that makes up Motorcycle Club Name YACHT\_NAME :: Combines the 2 stats that makes up Your Yacht Name (Completely Bypasses any Profanity Filters and can Accept Special Characters for R\* Logos etc)

___

___

### Nightclub Money Methods

___

___

-   ### Auto Nightclub Vault Money Fast Method **`See Info Below`**
    
-   ### Fast Nightclub Vault Money \[Requires 2Take1 VIP License\] **`See Info Below`**
    
-   ### Auto Nightclub Vault Money (Slower Method) **`See Info Below`**
    

**`Info:`**

> `Nightclub Earnings Money Method for self`
> 
> > go to your nightclub office safe open it stand in the threshold of the doorway, turn on and enjoy some fast cash. VIP Method does not require you to even be anywhere near your nightclub can be done While other side of the map Killing Noobs. Non VIP Version will periodically pause for a moment to allow transactions to clear and transfer the money into your bank! I found this to be slower in full sessions solo takes no time at all to clock up a few million! Don’t Be retarded with its use! Few Million every now and then do some other stuff then you should be ok! I have done this for a few weeks got 3 bil in the bank now and no issues just be casual with its use!

___

___

## Moist's Weapon Mods

___

### Moist's Weapon Mod Options

___

-   ### Don’t Lock-on to my Friends
    

> This is Part of : **`Any Vehicle Lock-on Missiles (Players)`** Since My Targeting System Does not really care about who people are and locks on to the nearest player visible on screen or in line of sight, this will stop it Making a target of any friends or players with the script exclusion set on. This will also not target God Mode Players since it would locking to them if they were loading in and not spawned yet.

-   ### Lock-on for any vehicle Exclude Aircraft
    

> Another Part of : **`Any Vehicle Lock-on Missiles (Players)`** This will stop the weapons of an aircraft being taken over by the script Feature, since this disables the vehicle attack input and uses it to execute the features weapon can be annoying if u trying to shoot a player with Lazer cannons, this will disable it for these kinds of vehicle.

-   ### Speed of Missiles:
    

> Like it states sets the actual speed the missiles in `Moist’s Weapon Mods` travel, each feature adds additional speed to the missiles taking consideration of the speed you are traveling so as not to shoot and end up being faster than the missile and colliding with it.

-   ### Bypass Raiju Only & Allow Other Vehicles
    

> Specifically made for the new Raiju Cannons Upgrade feature, enabling this will allow this feature to work for some other select Aircraft. Currently i have added support for B11 Strikeforce, P-996 Lazer and the rouge. As with the Raiju it will increase and improve the default explosive miniguns on these aircraft assuming your current vehicle weapon is cannons and Missile or Bombs.

___

### Weapon Related Functions

___

___

-   ### Sub Guided Missiles (+)Range (-)Cooldown
    

> Extends the Range of the Submarine Guided Missiles, & Removes Any Cooldown Between Shots.

___

-   ### TB Drone(+)Range+Speed (-)cool-down+recharge
    

> **`Improves the Remote Control Drone:`**
> 
> > **`Terrorbyte Drone Only:`**
> > 
> > > Removes Cooldown between uses

> > **`All Other Drones:`**
> > 
> > > Removes Shock Recharge Time, Increases Forward Speed, Increases Range (Distance it can go without Exploding), Increases its Height Range. Do note that this feature has been known to Fuck The Sub Missiles making them explode on launch, most likely due to a game hash collision so avoid using this if you intend on using your sub missile launcher in the current session.

___

-   ### Stone Hatchet No Cooldown & Duration Increase
    

> Removes Cooldown between activations and increases the Duration to a really long Duration.

-   ### Weapon Unlimited Ammo Clip
    

> unlimited is like Rapid Fire / No Reload Using a Homing Launcher you can lock-on and spam rockets without having to reload at all

-   ### Spawn Gun Van nearby & Enable Railgun
    

> Spawns the Gunvan you find around the map randomly close to your current location and adds the now missing and unpurchasable Railgun to the cans inventory, please note this van seems to only visible in your game remote players see nothing!.

-   ### Explosion Area of Effect **`| See Warning Below |`**
    

> **Value Multiplier** `< 0.00 | 20.00 >`
> 
> > Modifies The Explosion Radius of your Current Weapon if it has explosive ammo

### **`|| Warning: ||`**

> > setting this at 200 on a Homing launcher and you create an explosion the size of the city and take out a lot of players in the process !! Once this is set on a specific weapon its effect will stay on that weapon until you switch too it and set the area of effect back to at least 1.0

-   ### Destroy Projectiles
    

> this will explode any weapon projectiles I have currently added still needs further testing as not all seem to work, mk2 missile wont get destroyed but likes of a Ruiner you shoot a missile it goes boom along with you. This will also explode players when they equip homing launcher, rpg firework launcher etc soon as they switch to it the missile in the chamber is detected and exploded.
> 
> > **`Current Projectiles Added:`**
> > 
> > > "WEAPON\_GRENADE","WEAPON\_STICKYBOMB","VEHICLE\_WEAPON\_TANK","VEHICLE\_WEAPON\_SPACE\_ROCKET","WEAPON\_RPG", "VEHICLE\_WEAPON\_PLANE\_ROCKET","VEHICLE\_WEAPON\_PLAYER\_LASER","VEHICLE\_WEAPON\_PLAYER\_BULLET","WEAPON\_HOMINGLAUNCHER","WEAPON\_STINGER", "WEAPON\_PROXMINE","WEAPON\_FIREWORK","WEAPON\_FLAREGUN","VEHICLE\_WEAPON\_RUINER\_ROCKET","VEHICLE\_WEAPON\_HUNTER\_MISSILE", "VEHICLE\_WEAPON\_HUNTER\_BARRAGE","VEHICLE\_WEAPON\_DOGFIGHTER\_MISSILE","VEHICLE\_WEAPON\_ROGUE\_MISSILE","VEHICLE\_WEAPON\_VIGILANTE\_MISSILE", "VEHICLE\_WEAPON\_APC\_CANNON","VEHICLE\_WEAPON\_APC\_MISSILE","VEHICLE\_WEAPON\_TRAILER\_MISSILE","VEHICLE\_WEAPON\_TRAILER\_DUALAA", "VEHICLE\_WEAPON\_OPPRESSOR\_MISSILE","VEHICLE\_WEAPON\_MOBILEOPS\_CANNON","VEHICLE\_WEAPON\_AVENGER\_CANNON","VEHICLE\_WEAPON\_CHERNO\_MISSILE", "VEHICLE\_WEAPON\_AKULA\_MISSILE","VEHICLE\_WEAPON\_DELUXO\_MISSILE","VEHICLE\_WEAPON\_SUBCAR\_MISSILE","VEHICLE\_WEAPON\_SUBCAR\_TORPEDO", "VEHICLE\_WEAPON\_THRUSTER\_MISSILE","WEAPON\_GRENADELAUNCHER","WEAPON\_AIRSTRIKE\_ROCKET","WEAPON\_PASSENGER\_ROCKET","WEAPON\_VEHICLE\_ROCKET"

___

## Moist’s Weapon Mods

___

-   ### Moist’s Orbital Gun
    

> Better than the impact orbital strike in MoistScript 2.x.x.x Shots are more reliable & all Explosions are Orbital Explosions with Actual Orbital Sound and PTFX All Kills using this is like using the orbital cannon itself, players get Obliterated by you!

-   ### Homing Aim
    

> Shoot Additional Homing Missile at target your aiming at

-   ### Better Vehicle Lock-on Missiles v3 **`This Feature disables fire input control for your vehicle`**
    

> Version Successor from the previous versions of this function. This will Replace the current weaponised vehicle lock-on missiles & replace them with Ruiner class missiles which have better tracking. This will also lock-on to the driver rather than Vehicle so if they were to eject/bail from vehicle before missile gets their vehicle they Bail Fail! and get killed! shots should look more legit 800 delay or more.

-   ### Missiles from any vehicle
    

> Shoots a missile in a static forward direction without target lock-on from the front of any vehicle

-   ### Replace F-160 Raiju Cannons:
    

> Selectable Weapon you would like to use in addition to the Raiju Default

-   ### F-160 Raiju Explosive Cannons Upgrade
    

> Designed to make the Raiju Explosive MG Like the Original Lazer Cannons, this feature makes this jet Over Powered and a Number One Griefing Tool! Stealth Attacks are quick and easy with this enabled! Only Works with the Raiju Jet!

-   ### F-160 Raiju Weapon Damage Modifier
    

> Adjustable Modifier Value to increase the damage caused by the Cannons Upgrade Feature.

-   ### F-160 Raiju Stealth Mode Bombs `[ Standard | Cluster | Incendiary | Gas ]`
    

> Selectable Bomb Types, this feature only works while your Raiju is in stealth Mode! uses the same fire control as the Jet Cannons

-   ### Any Vehicle Lock-on Missiles (Players)
    

> Custom Missile System Designed by myself for Player lock on Targeting for missiles in any vehicle. For vehicles already equipped with lock-on missiles it will utilise both my targeting and the vehicle targeting to find a target, if no nearby player is targetable it will use the vehicle lock on targeting to give you another target useful for the need to kill NPC’s. This Feature is designed to target players even on foot as long as they are in front of you they get a lock on.

-   ### Vehicle Missiles from my Ass `<delay modifier>`
    

> Shoots additional Lock-on Missiles at locked on target, this version Keeps the last Target and shoots missiles locked onto the target even if the target is not visible on screen (its behind you for instance) this will cause your missiles to shoot at any direction. Your Vehicle is safe using this as you can not damage your vehicle with them.

-   ### On Foot Lock-on Missiles
    

> Shoots an additional Ruiner Missile at the target locked onto via your homing launcher.

___

## Portable Defence Spheres

___

-   ### Set Below Values Manually
    

> Will Adjust all values below to this one if you just activate the option and value has not changed Input box will popup so you can set this manually

-   ### Anti Player Vehicle
    

> Specifically Targets Player Vehicles, do note that if you make a defence sphere and go too far away from it the vehicle detected will probably get missed due to long distance vehicles not detected far away the actual position of the player detected would be incorrect.

-   ### Anti Player Ped
    

> Improved Since Last Release: Player in any vehicle goes in sphere they get Destroyed WIP needs some tweaking maybe a little over the top Anti Player Ped does same as above only they don’t need to be in any vehicle

-   ### Anti Projectile
    

> Should prevent projectiles and weapons fire in the sphere has been said in game that people were unable to use some weapons like Lazer cannons but this also can be effected by zone flag settings below

-   ### Waypoint Anti Player Ped
    

> Same as The Above "Anti Player Ped", only the location of it can be set manually to anywhere on the map you can place a waypoint!

-   ### Zone Flags for:
    

> **`< Self off | Others off | Self on | Others on>`**
> 
> > turns Defence zone flags on / off depending on option for players

-   ### Remove All Air Defence Zones
    

> This will literally remove any Yacht Defences set seems to also partially work for player yachts cant shoot in the area but does not take you out Updated this to a loop function so defence sphere does not get re-enabled.




<hr>

<hr>


# MoistScript NG Script Features(Online)

<hr>


## MoistScript NG Online Player Features

___

## Integerated Features into Online -> Lobby

#### Moists Force Script Host (Non VIP Version)

> This is a little work around for forcing script host without the need for having a VIP Subscription. Might not be as instant as the menus version but its a fairly good work around to do same thing.

___

# MoistScript NG Online Player Features

<hr>

## Integerated Features into Online -> Lobby

#### Moists Force Script Host (Non VIP Version)

> This is a little work around for forcing script host without the need for having a VIP Subscription. Might not be as instant as the menus version but its a fairly good work around to do same thing.

<hr>


# Online Features

### Remove Player


- Micheal Error Kick
- Script Kick
- Random Script event spam
- Script Event <value> (Modifier value and amount useable is dependable on your kicks.ini
- Script Event < Vector Method | Stat Method | Moist Method | Bit Method > 
- Script Event v2.0 < Vector Method | Stat Method | Moist Method | Bit Method > 
- Script Event v3.0 < Vector Method | Stat Method | Moist Method | Bit Method > 
- Parachute Model Crash
- Lester Cummy WindSock Crash (This will almost Certainly Kill The Entire Session!)
- Use Ruiner Crash
- Test Crash (Teleports Player to Kill Barrier and trys force their character to Control Their Veichle with crashy values)


-- WIP MORE FEATURES TODO


<hr>

<hr>


# MoistScript NG Script Features(Screenshots)


<hr>


# Screenshots of the Features & Sections within the script!



## WIP Images need to be organised!



![alarm-zones](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/c8301579-f0d7-4b8a-885e-aa2e9f6e2c40)

![atmos lighting](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/fc200a1d-da48-48e6-a456-7d2b22497159)

![atmos lightingModifiers](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/a0fc87f2-1c91-4c98-8000-6e01cdd69ecd)

![Capture](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/c08cd9c1-a3d7-4b0c-964a-bb0c257d61a6)

![Capture PNGplayerbaroptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/60a401dd-d923-43a4-8f3c-026683908c1f)

![cargobobmod](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/b1aa3efe-8089-4fed-ba5b-e78ad6470468)

![chatfeatureoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/ece46a0f-37d5-4c0e-9e50-efe537f3974f)

![chatfeatures](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/b28b168a-3ddb-4edf-80f6-c39cf5ad4a51)

![custom lists](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/0e41d2ad-6315-4267-a84e-b2940b01c567)

![detections+protections](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/dc548099-ea92-4946-9f88-42e422ff6bff)

![entityfunctions+tools](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/cde37002-b295-4c09-9cb4-3d1c9274e573)

![espmoduleoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/f514ba13-6a0e-4419-8795-3d3cc506b8b6)

![esppeddrawoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/833f36a1-c76c-4f3e-985a-58e47ecf5042)

![espvehicledrawoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/5e9a339f-3bfc-407f-8a2f-7456ec0a678c)

![loadmoistmodules](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/45e0ffbd-4076-41f3-b112-375dab905902)

![moneystats+globals](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/14c5cc04-963f-40ee-b437-fcaa0419d115)

![onlinefeatures](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/39bf897f-1934-4979-8f19-6ff95260e251)

![online-playerfeatures-list](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/2ef482f8-2fca-4801-95b9-63700fd9b9db)

![pedespoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/55c629a2-4cda-4e98-96a0-052d55b36db6)

![player history](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/d5085bb9-e632-4e00-aa1a-e4d02c496c30)

![playerbar v2 options](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/5800144a-c071-4140-91cb-28bd1f557840)

![playerhistory-historyplayer-features](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/d29571e3-6836-40bb-bf13-ade71c4677fb)

![playerhistory-historyplayer-featuresBlacklist](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/a1f1ba4a-361a-43a7-ad25-f35a4ec79566)

![playerhistoryoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/a2afd274-26de-463a-a3b7-499561d4d22a)

![playerped](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/b62364ba-4cdc-4419-9d7b-ee91e2776dad)

![playervehicle](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/5eed52ba-c7a5-4bab-965a-fac346ac2434)

![portabledefences](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/c3dceac5-c2a2-4170-a18b-2dddc57fc353)

![projectile radar](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/67d7b397-b28b-4f7d-9c69-925293e023c1)

![radar enhancments](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/92e26082-0e26-4847-87f4-5d2eb3f19992)

![scriptloader](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/b90d8b90-f5ca-44e6-8f71-ba509895234b)

![script-translation-options](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/5a20b257-00b3-4b3e-bdb7-6705ec342ef5)

![scriptupdate](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/99364a4f-ed38-42d5-960c-757c854f1e9d)

![sendtranslatedchatoptionsd](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/eb799ca3-856c-4a8f-bb3a-498121674cb7)

![session attributes](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/182ce90c-cd11-4a11-93e1-50d1480d3f4b)

![session griefing](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/7d38bec1-bcd2-43f9-9dfc-73923f1d4765)

![session kick functions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/72ca1696-f05e-4b38-9684-79b841cc855a)

![settingsmain](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/0fb2b776-5522-4adc-a326-bc59c8956cdb)

![teleport features example-when presets added](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/94ab3343-d67c-4ed7-8556-418d51e5b32d)

![trainmod](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/2c7a57b6-d03d-493c-9e23-998178407ca8)

![translategamechatoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/05517241-3b04-4fce-b79f-fc2cada73906)

![uienhancments](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/af578e77-c09f-402c-bd36-cfb33aad96cf)

![vehicleespoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/622a01af-a800-478b-aae4-7589369a9943)

![weaponmodoptions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/6484cf6e-0888-4dbf-8b04-bc56cf2e1313)

![weaponmods](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/85f47b6d-b821-4773-bd46-5a0a57e423c8)

![weaponrelated](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/81ae98ca-282c-461f-af26-fdb5af4bff40)

![weather functions](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/c37b570b-3e19-4773-9685-57330295f191)

![worldfgeatures](https://github.com/IN2-Moist/2Take1-Moist-Script/assets/4621091/a34da9c0-e118-4707-910a-abd695389e38)



<hr>

<hr>


# MoistScript NG Script Modules (Extra Features)


<hr>



## More Features in MoistScript When Loading The Other Modules!!

> ## MoistScript Settings -> Load Moist Script Modules

> > Custom Lists for Features
> > 
> > > -   Ped List
> > > -   Vehicle List Load PlayerHistory Module
> > 
> > Load PlayerBar Module
> > 
> > Load Translation Module
> > 
> > Load ESP Module
> > 
> > Load Script Loader Module
> > 
> > Load Teleport Module
> > 
> > Load Blacklist Module

## Module Descriptions

## Custom Lists for Features

### Ped List

> This is a custom list of peds (NPC's) with a few as a default example. This list you can add your own prefer or favorite character Peds in game so the features that support it can use these to spawn those peds to do the task a feature might do with them.

### Vehicle List

> Like the Ped list this can be used for adding a select set of vehicles you use or like for features enabled for these

## Load PlayerHistory Module

> Player History similar to what the menu has now but with more features.
> 
> > Scid Selection can clicked to copy SCID to clipboard
> > 
> > Auto Stalk their SCID (Auto join them when not in your session until toggle off)
> > 
> > IP Info click to update the feature selection to show all the ip info and copy the IPv4 Address to Clipboard
> > 
> > Add & Remove them from the Blacklist Module (See Below)
> > 
> > Temporary Blacklist Them via SCID IP or Name this works only while they have this toggled on until you restart or reset state

## Load PlayerBar Module

> Adds a Custom Bar Across the very top of the game screen with Players Names that are in session with Information via: Tags & Colours
> 
> > There are 2 versions now, normal game ui rendering version or V2 Playerbar which is scriptdraw and will render on top of any game component pause menu and even loading screens.
> > 
> > Version 2 Playerbar the bar can be colour designed by yourself using the feature options and have it fade from corner to corner with a different colour. I Recommend having some transparency to it (alpha) as like i explained above it draws on top of everything so it can cover parts of social club overlay (Home Key Drop Down) see image below

![PlayerBar V2](https://camo.githubusercontent.com/e003353feb853decafd34548fe6c7f92dffc2a33f2b51b10602dc439ae0da677/68747470733a2f2f6d656469612e646973636f72646170702e6e65742f6174746163686d656e74732f313130393532353733373131323837303935342f313132353636323639353833323638323537362f696d6167652e706e67)

## Load Translation Module

## Load ESP Module

## Load Script Loader Module

## Load Teleport Module

## Load Blacklist Module


<hr>

<hr>

# MoistScript NG Translating The Script

<hr>


## Translating MoistScript NG To Another Language

As of 3.0.2.8 the translation feature has been completely re-written.

## Create translation files

in Moistscript Settings you will find a section called Moistscript Translation options enter this section and click create translation files.  
**`(Screenshot at bottom of this page)`**

Should translation files already exist they will be loaded and an updated file created with any added features since your file was created.

Translation Files are located in the MoistFiles folder within the scripts folder:

-   **TranslationFeatures.ini**
-   **TranslationHints.ini**

`Features Example`

```
GetInfo=Get Info
countryCode=Country Code: 
SaveCoords=Save Players Current POS to file
FuelLeak=Players Vehicle Leaks Fuel
```

`Hint Example`

```
LockedOnTroll=Triggers Vehicle being locked onto audio alert for that player
Lester_Khanjli=Send 2x Lesters in a Khanjali Tank to grief them
Has_Spawned_Net=Shows if you Received the Ped Spawned Network Event from this Player
```

### When Editing the file:

___

> **1 Line = 1 Feature / 1 Hint**

___

> Break the line up as Below:

___

**`Part A` = `Part B`**

___

## What to Edit?

`Part B`

> This part as indicated above which is the text to the right of the equals **`=`** sign is the part to edit change this text to your translation.

## `Part A` This Text Must not Be Changed!

## This is the variable used within the script which tells the translation feature what its going to translate! Changing it would Break your Translation!

> Checks have been put in place to avoid trying to change stuff that dont exist to prevent crashing yourself so anything with Part A that is not Exactly the same as written in the script code will be completely ignored.

___

## What to do when My Translation File is Finished?

-   **Ensure it is saved and in the MoistFiles directory within your scripts folder!**
-   **Open the script settings and enter the script translation options section**
-   **Simply click load translation to update the script with the translation** (Screenshot Below)

___

![script-translation-options](https://user-images.githubusercontent.com/4621091/258998286-ba2d1b72-4608-4d6b-8e59-0fe2015e800d.PNG)
