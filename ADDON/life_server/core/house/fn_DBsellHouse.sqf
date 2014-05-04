/*

	sells a house
	
	f [ house_name, player, price]

*/

private["_house","_unit","_price","_setarr"];

_house = _this select 0;
_unit = _this select 1;
_price = _this select 2;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to sell house.", getPlayerUID _unit];
};

_setarr = [ ["owned", "'0'"], ["owner", "' '"], ["trustedpersons", "'""[]""'"] ];

["life_fnc_execSellHouse", _house, [_price], _unit, _setarr, format["owned='1' AND buyable='1' AND owner='%1'", getPlayerUID _unit]] call HOUSE_fnc_writeData;