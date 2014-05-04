/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time","_longname","_itemcount"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;

//##80
_time = [_this,2,15,[0]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Du wurdest inhaftiert und musst deine Zeit absitzen. Wenn du respawnst oder dich ausloggst, wird die Zeit erhöht!","PLAIN"];
hint "Du hat deine Lizenzen verloren!";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
/*if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_froglsd > 0) then {[false,"froglsd",life_inv_froglsd] call life_fnc_handleInv;};*/
{ //##96
	_longname = [_x, 0] call life_fnc_varHandle;
	_itemcount = missionNamespace getVariable [_longname, 0];
	
	if(_itemcount > 0) then
	{
		[false,_x,_itemcount] call life_fnc_handleInv;
	};
}
foreach life_illegal_item_shortnames;

life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad,_time],"life_fnc_jailSys",false,false] spawn life_fnc_MP; //Give time ##80 to jailSys, if not BAD save time variable in DB, if not, load
[1,false] call life_fnc_sessionHandle;