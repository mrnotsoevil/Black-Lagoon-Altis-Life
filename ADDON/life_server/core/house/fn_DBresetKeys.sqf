/*

	Gives Key to player
	
	f [ player, house_name]

*/

private["_house","_unit","_dst_uid","_dst_name"];

_unit = _this select 0;
_house = _this select 1;



// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to reset house keys.", getPlayerUID _unit];
};

_setarr = [ ["trustedpersons","'""[]""'" ] ];

["life_fnc_houseExecResetKeys", _house, [_house], _unit, _setarr, format["owned='1' AND owner='%1'", getPlayerUID _unit] ] call HOUSE_fnc_writeData;