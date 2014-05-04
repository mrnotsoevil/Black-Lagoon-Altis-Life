/*
* Queries data from db
*
*/
private["_cmd", "_house", "_args", "_player", "_query", "_result"];

_cmd = _this select 0;
_house = _this select 1;
_args = _this select 2;
_player = _this select 3;
_query = _this select 4;

// ##84 DBBAN
if([getPlayerUID _player] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to access house.", getPlayerUID _player];
	[];
};

//SET PLAYER
_player = owner _player;

//QUERY CUSTOMIZED BY MISSION
//_query = format["SELECT * FROM houses WHERE name='%1' ",_pid,_side,_type];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
//_result = call compile format["%1", _result];
//COMPILE RESULT IN TARGET

//SEND TO MISSION
// Sending [_cmd, _house, _args, _sql] to houseExec
[ [_cmd, _house, _args, _result] ,"life_fnc_houseExecCommand",_player,false] spawn life_fnc_MP;