/*
* Execs write to DB and calls dst function passing arguments
* RETURNS RESULT IF COND IS MET
*/
private["_cmd", "_house", "_args", "_player", "_result", "_result_2", "_query","_query_update", "_cond", "_setarr", "__col", "__val", "__first"];

_cmd = _this select 0;
_house = _this select 1;
_args = _this select 2;
_player = _this select 3;
_setarr = _this select 4;
_cond = _this select 5;

// ##84 DBBAN
if([getPlayerUID _player] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to access house.", getPlayerUID _player];
	[];
};

//SET PLAYER
_player = owner _player;

//GENERATE QUERY USING SETARR
_query_update = "";
__first = true;

{
	__col = _x select 0;
	__val = _x select 1;
	
	if (!__first) then { _query_update = _query_update + ", "; };
	
	_query_update = format [ "%1 %2=%3", _query_update, __col, __val ];
	
	__first = false;
}
foreach _setarr;

//QUERY COND
_query = format ["SELECT IF( %1, TRUE, FALSE ) FROM homes WHERE name='%2'", _cond, _house];
_result_2 = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

diag_log format ["HOUSE_writeData | Cond-Query: %1, COND-Return: %2", _query, _result_2];

////////////

//Compile Cond here
_result_2 = call compile format["%1", _result_2];
_result_2 = (((_result_2 select 0) select 0) select 0) == "1";

diag_log format ["HOUSE_writeData | COND compiled to %1, type %2", _result_2, typeName _result_2];

////////////


_query = format ["UPDATE homes SET %1 WHERE name='%2' AND %3", _query_update, _house,_cond];
//QUERY CHANGE
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];


diag_log format ["HOUSE_writeData | MAIN-Query: %1", _query];

//SEND TO MISSION
// Sending [_cmd, _house, _args, _sql] to houseExec
[ [_cmd, _house, _args, _result_2] ,"life_fnc_houseExecCommand",_player,false] spawn life_fnc_MP;