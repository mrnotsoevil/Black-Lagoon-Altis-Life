========================================
Altis Life RPG
Version 3.1.2
By Tonic
========================================

Because Tonic prohibits renaming his mod, it's still called "Altis Life RPG", BUT it SHOULD be called "Black Lagoon Altis Life RPG" :( 
Not everybody is evil, Tonic!

1. Introduction

This is a complete ARMA III server modification (Addon + Mission), based on Altis Life version 3.1.2, created by Tonic (http://www.altisliferpg.com/).
Check following link for a basic description by the original author: http://forums.bistudio.com/showthread.php?168139-Altis-Life-RPG

2. Acknowledge

All thanks to Tonic, the original author of Altis Life RPG and our scripters and contributors, map makers Monstaub, Patricksday, Sysco, DrFootjobber, VauxhallHH, Padde, Brain, mrboese and many other people who worked hard to make a good and feature rich server.

3. Features

+ Housing system
    + Spawing in house
    + Storing items in house
    + Extend house inventory by buying furniture
    + parking/unparking cars
    + parking/unparking air vehicles (if house is marked as donator)
+ Inventory and gear saving
+ Vehicle trunk saving (except illegal items for balancing reasons)
+ Holster weapons (and more) with Shift+H
+ Put hands up with Ctrl+Shift+H
+ Money laundering, using database (If you sell drugs, youl will get 'Illegal Money' to be laundered)
+ New vehicle skins
+ ADAC/Mechanics faction, being able to ...
    + Impound vehicles using tows
    + Fully repairing vehicles
    + Recoloring vehicles (Consumes paint 'Farbeimer' - set the needed amount in vehicleColorsCentralized)
	+ If a ADAC want to use donator/police/rebel colors, sb. have to give a 'Token' to enable colors
+ Permission system (Cops, ADAC, Event Manager) => Chief can set level of other cops without using database
+ DynPerms Permission System - Add groups by Database
+ 'Pack' weapons/colothing/... into boxes 
+ Wonderful designed map by Monstaub
    + Moved Police headquarter
    + Redesigned market place
    + Exercising place
    + ...
+ Some redesigned dialogs
    + Cellphone
    + Interaction menus
+ Rebels can now restrain everybody (even policemen)
+ Tracer ammo = tazer ammo (Except for old tazer weapon - will stay tazer)
+ 'Bird-Down' weapons for cops to install into helicopters for bringing down other helicopters
+ Self adapting market system, including random events
    + Market system will return to default price after some time (~15min)
    + Market system can change prices of other resources if you sell/buy something (e.g. if you sell coal, copper price will increase)
    + There are random events such as "China builds 'World China Tower'" => iron, glass, cement price will increase
    - Note: It's not using the database => would have impact to performance + quite difficult
+ More drugs
+ Drugs can be consumed
+ Cops can choose jail time (5-60min)
+ New admin menu (Including auth dialog for RCON password)
+ Included many new sounds
+ 'Bird Down MKI/MKII' helicopter weapons
    * Buy the weapon and ammo
    * Put it into the trunk
    * Scroll with mouse wheel and choose weapon
    * MKI => Fuel of target will be 5%, MKII => Target will be destroyed
+ ...

4. Code changes

Some code infrastructure was changed to make it easier to maintain code:

+ Unified Item System (unifieditems/uitemconfig), making it possible to add new items easier
+ Virtual Item System (Interface to 'pack' weapons/etc.)
+ ONE funtion to play a sound global
+ ...


Some misc features

+ Playtime - Writes playtime of player in seconds into database
+ Anticheat-MOT (Not balanced,yet) - Calculates money made in 10min to find cheaters
+ ...

4. Notes

We are a german server, so everything is translated into german; but the code/script style is engish!
The 'homes' table is pulled from our active running server, so you have to run following command, after importing the sql file:

    UPDATE homes SET owner=' ', owned='0', inventory='"[]"', inventory_weight='100', trustedpersons='"[]"'

Disable safety features if necessary!


--- DYNPERMS ---

DynPerms is an extension to Perms (Group Manager), allowing to add dynamically created groups by using the database (Normal perms are in the script).

Schema:

    permid:		Id of the perm (eg. 'user_bloodz')
    permname:		Human readable name of the perm (eg. 'The BloodZ')
    maxrank:		Maximal rank (eg. '7')
    ruleconfig:		Configuration of rules by rank (see permconfiguration.sqf for schema) (eg. '"[[0,[]],[1,["VIEW"]],[2,["VIEW"]],[3,["VIEW"]],[4,["VIEW"]],[5,["VIEW"]],[6,["LEADER","RANKUP","RANKDOWN","VIEW"]],[7,["LEADER","RANKUP","RANKDOWN","VIEW"]]]"')
    member_conditions:	See permconfiguration.sqf
    logo:		eg. 'images\logo_user\bloodz.paa'
    levelnames:		Name for EACH LEVEL (including ZERO!!!) eg. '"["Kein Mitglied","Blood-Praktikant","Blood-Grünschnabel","Blood-Dealer","Blood-Hitman","Blood-Rechte Hand","Blood-CoLeader","Blood-Leader"]"'

--- Perms/'Group' feature for cops ---

You HAVE to set coplevel to 0 if you want to set coplevel by PERMS, because the database will ALWAYS override PERMS, because it's more secure.
    
--- GUIs Folder ---

This folder is NOT important for the server. There are just files, created by the ARMA III GUI Editor. You may load them if you want to change a dialog.
See documentation of GUI Editor for more information.

--- Bugs/Incomplete Features ---

To implement by yourself:
* Admin menu (Incomplete)
* Wanted 'Add' function (not working properly)
* More houses (Learn from existing houses how to do it - technically it's not difficult)
* More

--- May I change file/picture/... xy? ---

YES! It's the same license, Tonic used for his mod - you may change everything, add everything you want, ...
BUT: Usually, you have to do everything yourself - We won't setup your server.

--- I want feature xy. Can you add it? ---

You may add it yourself.