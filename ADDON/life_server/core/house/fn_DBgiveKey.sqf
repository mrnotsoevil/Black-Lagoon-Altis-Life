/*

	Gives Key to player
	
	f [ player, house_name, trustedpersons_array]

*/

private["_house","_unit","_dst_uid","_dst_name"];

_unit = _this select 0;
_house = _this select 1;
_trustedpersons = _this select 2;
_dst_name = _this select 3;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to give key.", getPlayerUID _unit];
};

if(isNil("_trustedpersons")) then
{
  diag_log "Trustedpersons was NIL!";
  _trustedpersons = [];
};

_setarr = [ ["trustedpersons", format["'""%1""'", _trustedpersons] ] ];

["life_fnc_houseExecGiveKey", _house, [_dst_name], _unit, _setarr, "owned='1'"] call HOUSE_fnc_writeData;