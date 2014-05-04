/*

	Sets jail values for player

*/
private["_player", "_playeruid", "_query", "_result", "_time"];

_player = _this select 0;
_playeruid = _this select 1;
_time = _this select 2;

_time = ceil _time; //to be sure

//SET PLAYER
_player = owner _player;



////I
_query = format["UPDATE players SET jail_time='%1' WHERE playerid='%2'", _time, _playeruid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];


//SEND TO MISSION
//Compile

//[ [_injail] ,"life_fnc_execJailTimer",_player,false] spawn life_fnc_MP; //send the string