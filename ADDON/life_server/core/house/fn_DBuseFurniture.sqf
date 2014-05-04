/*

	Uses furniture in the house
	
	f [ house_name, player, shortname, weighttoadd]

*/

private["_house","_unit","_shortname","_weighttoadd","_setarr","_cond"];

_unit = _this select 0;
_shortname = _this select 1;
_weighttoadd = _this select 2;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to use furniture.", getPlayerUID _unit];
};

//call command
_setarr = [ ["inventory_weight", format["(inventory_weight + %1)",  _weighttoadd]] ];
_cond = format["owner='%1' AND (inventory_weight + %2) <= inventory_maxweight", getPlayerUID _unit, _weighttoadd];
	
//call write to nearest (range = 15)
["life_fnc_execHouseUseFurniture", 15, [_shortname], _unit, _setarr, _cond] call HOUSE_fnc_writeDataToNearest;