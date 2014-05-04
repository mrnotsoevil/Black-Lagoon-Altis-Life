/*

	I Update table of player
	[II Check for remainingtime <= 0
	III delete and return money value]

*/
private["_player", "_playeruid", "_query", "_result", "_injail"];

_player = _this select 0;
_playeruid = _this select 1;

//SET PLAYER
_player = owner _player;



////I
_query = format["UPDATE players SET jail_time=(jail_time - 1) WHERE playerid='%1'", _playeruid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

////II
_query = format["SELECT IF( remainingtime <= '0', TRUE, FALSE ) FROM players WHERE playerid='%1'", _playeruid];
_money_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//SEND TO MISSION
//Compile

[ [_injail] ,"life_fnc_execJailTimer",_player,false] spawn life_fnc_MP; //send the string