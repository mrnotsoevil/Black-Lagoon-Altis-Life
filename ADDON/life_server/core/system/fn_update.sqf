/*
	File: fn_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function, it is sort of a 
	lazy blockage and adding untainable functions for the client to not take.
*/
private["_unit","_side","_uid","_money","_bank","_uid","_misc","_licenses","_civGear","_name","_inventory","_civ_cop_gear","_perms"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_money = [_this,2,0,[0]] call BIS_fnc_param;
_bank = [_this,3,2500,[0]] call BIS_fnc_param;
_uid = [_this,4,"",[""]] call BIS_fnc_param;
_civGear = [_this,7,[],[[]]] call BIS_fnc_param;
_name = [_this,8,"",[""]] call BIS_fnc_param;
_inventory = [_this,9,"""[ ]""",[""]] call BIS_fnc_param;
_perms = [_this,10,"""[ ]""",[""]] call BIS_fnc_param;
//_civ_cop_gear = [_this,10,[],[[]]] call BIS_fnc_param;


_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Error check
if(isNull _unit OR _uid == "") exitWith {if(_uid == "" && !isNull _unit) then {diag_log format["%1 hat eine ungültige UID.",name _unit];};};

_licenses = [_this,5,[],[[]]] call BIS_fnc_param;

switch (_side) do
{
	case west: {_misc = [_this,6,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,6,false,[false]] call BIS_fnc_param;};
};

[[_uid,_name,_side,_money,_bank,_licenses,_misc,_civGear,_inventory,_perms]] call DB_fnc_addQueue;