/*
	File: fn_civLoadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads saved civilian gear, this is limited for a reason and that's balance.
	
	But this balance is shit and is overwritten by default gear functions
*/
private["_allowedItems","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle","_append","__restwp"];

//systemChat "civLoadGear 1";

/*if(isNil("_this")) then
{
	_this = [true];
};

__restwp = [_this, 0, true] call BIS_fnc_param;

if(!__restwp) then
{
	systemChat "Weapons will not be restored";
};*/

_loadout = civ_gear;

if(isNil "_loadout") exitWith {[] call life_fnc_civDefault;}; //Slot data doesn't exist
if(count _loadout == 0) exitWith {[] call life_fnc_civDefault;}; //Slot data doesn't exist

//systemChat format["Loadout: %1", str _loadout];

//systemChat str _this;

//using civ format for compatibility issues
//uniform,backpack,goggles,headgear,assigneditems,uitems,bitems, |primary,launcher,handgun,magazines,primitems,secitems,handgunitems,vitems
//TODO
//civ_gear = [_uniform,_backpack,_goggles,_headgear,_items,_uitems,_bItems,_vest,_primary,_launcher,_handgun,_magazines,_primitems,_secitems,_handgunItems,_vitems];
_uniform = _loadout select 0;
_backpack = _loadout select 1;
_goggles = _loadout select 2;
_headgear = _loadout select 3;
_items = _loadout select 4;
_uitems = _loadout select 5;
_bItems = _loadout select 6;

//new sections
_vest = [_loadout,7,""] call BIS_fnc_param;
_primary = [_loadout,8,""] call BIS_fnc_param;
_launcher = [_loadout,9,""] call BIS_fnc_param;
_handgun = [_loadout,10,""] call BIS_fnc_param;
_magazines = [_loadout,11,[]] call BIS_fnc_param;
_primitems = [_loadout,12,[]] call BIS_fnc_param;
_secitems = [_loadout,13,[]] call BIS_fnc_param;
_handgunitems = [_loadout,14,[]] call BIS_fnc_param;
_vitems = [_loadout,15,[]] call BIS_fnc_param;

/*_primary = _loadout select 0;
_launcher = "";
_handgun = _loadout select 1;
_magazines = _loadout select 2;
_uniform = _loadout select 3;
_vest = _loadout select 4;
_backpack = _loadout select 5;
_items = _loadout select 6;
_primitems = _loadout select 7;
_secitems = _loadout select 8;
_handgunitems = _loadout select 9;
_uitems = _loadout select 10;
_vitems = _loadout select 11;
_bitems = _loadout select 12;*/

//This is to piss off cops :)
//NO, to piss off programmers!!! -.-
//if(!(_primary in _allowedItems)) then {_primary = ""};
//if(!(_handgun in _allowedItems)) then {_handgun = ""};

//Strip the unit down

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
	

//Add the gear
if(_uniform != "") then 
{
	_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};
}
else
{
	//Add default uniform
	_handle = ["U_C_Poloshirt_blue",true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};
	
	{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach ["ItemCompass","ItemMap","ItemRadio","ItemWatch"];
};

if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{
	_handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
	waitUntil {scriptDone _handle};
} foreach _magazines;

if(_primary != "") then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};
if(_launcher != "") then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;};
if(_handgun != "") then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};

//if(__restwp) then
//{
	{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
	{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uitems);
	{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_vitems);
	{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bitems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_primitems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_secitems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_handgunitems);  
//};

if(primaryWeapon player != "") then
{
	player selectWeapon (primaryWeapon player);
};

//Update clothing ##86
[] spawn life_fnc_updateClothing;


/*private["_itemArray","_uniform","_backpack","_goggles","_headgear","_itemArray","_uItems","_bItems","_handle"];
_itemArray = civ_gear;
waitUntil {!(isNull (findDisplay 46))};
if(count _itemArray == 0) exitWith 
{
	if(headGear player != "") then {removeHeadgear player;};
	if(goggles player != "") then {removeGoggles player;};
};

//Strip the unit down
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

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,1,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,2,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,3,"",[""]] call BIS_fnc_param;
_items = [_itemArray,4,[],[[]]] call BIS_fnc_param;
_uItems = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,6,[],[[]]] call BIS_fnc_param;

if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uItems);
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bItems);

//##19
player additem "ItemCompass"; player assignItem "ItemCompass";
player additem "ItemMap"; player assignItem "ItemMap";
player additem "ItemRadio"; player assignItem "ItemRadio";
player additem "ItemWatch"; player assignItem "ItemWatch";*/