/*

	Buys a house
	
	f [ house_name, player, price]

*/

private["_house","_unit","_price","_setarr"];

_house = _this select 0;
_unit = _this select 1;
_price = _this select 2;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to buy house.", getPlayerUID _unit];
};

_setarr = [ ["owned", "'1'"], ["owner", format["'%1'", getPlayerUID _unit]], ["ownername", format["'%1'", name _unit]], ["trustedpersons", "'""[]""'"] ];

["life_fnc_execBuyHouse", _house, [_price], _unit, _setarr, "owned='0' AND buyable='1'"] call HOUSE_fnc_writeData;