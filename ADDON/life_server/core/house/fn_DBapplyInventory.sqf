/*

	Buys a house
	
	f [ house_name, player, inventory]

*/

private["_house","_unit","_inventory","_setarr"];

_house = _this select 0;
_unit = _this select 1;
_inventory = _this select 2;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to set house inventory.", getPlayerUID _unit];
};

//GENERATE STRING from array
_inventory_str = format["'""%1""'", str _inventory];

//WRITE TO DB using house name from exdata*
//call command
_setarr = [ ["inventory", _inventory_str] ]; //todo

["life_fnc_execHouseInventory_apply", _house, [], _unit, _setarr, format["owned='1' AND owner='%1'", getPlayerUID _unit]] call HOUSE_fnc_writeData;