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