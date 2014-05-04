/*

	Open keychain dialog

*/

private["_exdata","_display","_name","_near_units", "_index"];


_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call life_fnc_houseExtractDataVal;

if(!(_exdata call life_fnc_houseCanAccess)) exitWith
{
	hint "Kein Zugriff!";
};


//////////////////// Open dialog
//if(!dialog) then
//{
if(!(createDialog "house_keyDialog")) exitWith {};
//};
disableSerialization;

_display = findDisplay 38700;
if(isNull _display) exitWith {};

//hintC "Feature noch nicht fertig!";

//Near players
_near_units = [];
{ if(player distance _x < 15) then {_near_units set [count _near_units,_x];};} foreach playableUnits;

{
	if(!isNull _x && alive _x && player distance _x < 15 && _x != player) then
	{
		_index = lbAdd [2100, name _x];
		lbSetData [2100, _index, getPlayerUID _x];
	};
} foreach _near_units;

//Dont allow non-owner to reset keys
if ( !( _exdata call life_fnc_houseBelongsToPlayer) ) then
{
	ctrlEnable [2402, false];
};










