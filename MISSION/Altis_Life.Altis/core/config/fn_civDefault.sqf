/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default civ configuration.
*/
//Strip the player down
systemChat "Loading civilian default gear.";

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);


//Load player with default cop gear.
/*player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addWeapon "hgun_P07_snds_F";*/
player addUniform "U_C_Poloshirt_blue";

player additem "ItemCompass"; 
player assignItem "ItemCompass";
player additem "ItemMap"; 
player assignItem "ItemMap";
player additem "ItemRadio"; 
player assignItem "ItemRadio";
player additem "ItemWatch"; 
player assignItem "ItemWatch";

hintC "default gear opened";

[] call life_fnc_civSaveGear; //save gear into file