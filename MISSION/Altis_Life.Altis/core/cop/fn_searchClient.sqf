/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
	
	
	+ ##57 Entfernt illegale Waffen
*/
private["_cop","_inv","_var","_val","_robber","_primary","_launcher","_handgun","_weapons","_policeitems"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_weapons = [];
_robber = false;

_licenses = "";

//Unholster weapons
//Unholster ##112
if(life_n_holstered) then
{
	[false] call life_fnc_holsterWeapons;	
};

//Illegal items
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv set[count _inv,[_x select 0,_val]];
	};
	missionNamespace setVariable[_var,0];
} foreach life_illegal_items;

//Policed items
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_policeitems set[count _policeitems,[_x select 0,_val]];
	};
	missionNamespace setVariable[_var,0];
} foreach life_police_only_items_bounty;

if(_licenses == "") then {_licenses = "Keine Lizenzen und Fähigkeiten<br/>"};



//Illegal weapons block
/*_primary = primaryWeapon player;
_launcher = secondaryWeapon player;
_handgun = handGunWeapon player;

if(_primary in life_illegalweapons) then
{
	_weapons set [count _weapons, _primary];
	player removeWeaponGlobal _primary; 
};
if(_launcher in life_illegalweapons) then
{
	_weapons set [count _weapons, _launcher];
	player removeWeaponGlobal _launcher; 
};
if(_handgun in life_illegalweapons) then
{
	_weapons set [count _weapons, _handgun];
	player removeWeaponGlobal _handgun; 
};*/

{
	if(_x in life_illegalweapons) then
	{
		_weapons set [count _weapons, _x];
	};
}
foreach weapons player;

{
	systemChat format["Waffe entfernt: %1", _x];
	player removeWeapon _x; 
}
foreach _weapons;


//End illegal weapons block


if(!life_use_atm) then 
{
	life_cash = 0;
	_robber = true;
};

[[player,_inv,_robber,_weapons,_policeitems],"life_fnc_copSearch",_cop,false] spawn life_fnc_MP;