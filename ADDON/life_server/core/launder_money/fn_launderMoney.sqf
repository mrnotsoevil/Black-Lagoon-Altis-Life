/*
* Queries data from db
*
*/
private["_player", "_query", "_result"];

_player = _this select 0;
_query = _this select 1;

//SET PLAYER
_player = owner _player;

//QUERY CUSTOMIZED BY MISSION
//_query = format["SELECT * FROM houses WHERE name='%1' ",_pid,_side,_type];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
//_result = call compile format["%1", _result];
//COMPILE RESULT IN TARGET

//SEND TO MISSION
// Sending [_cmd, _house, _args, _sql] to houseExec
[ [_result] ,"life_fnc_execLaunderMoney",_player,false] spawn life_fnc_MP;