/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_safeObj) exitWith {};
if((life_safeObj getVariable["safe",-1]) < 1) exitWith {hint "Der Safe ist leer!";};
if((life_safeObj getVariable["inUse",false])) exitWith {hint "Jemand greift schon auf den Safe zu..."};
if(!createDialog "Federal_Safe") exitWith {"Dialog konnte nicht erstellt werden, melde es bei Admin."};
disableSerialization;
ctrlSetText[3501,"Safe Inventory"];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj setVariable["inUse",true,true];
[life_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};