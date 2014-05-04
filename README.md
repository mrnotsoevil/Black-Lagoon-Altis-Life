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

All thanks to Tonic, the original author of Altis Life RPG and our scripters and contributors, map makers Monstaub, Patricksday, Sysco, DrFootjobber, mrboese and many other people who worked hard to make a good and feature rich server.

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
    + Recoloring vehicles
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
