/*

	I Update table of player
	[II Check for remainingtime <= 0
	III delete and return money value]

*/
private["_player", "_playeruid", "_query", "_result", "_money_result","_money"];

_player = _this select 0;
_playeruid = _this select 1;


diag_log format["<LAUNDER> Executed launder timer for player %1, TIME=%2", name _player, time];

////I
_query = format["UPDATE money_laundering SET remainingtime=(remainingtime - 1) WHERE player='%1'", _playeruid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

////II
_query = format["SELECT COALESCE(SUM(value),0) FROM money_laundering WHERE player='%1' AND remainingtime <= '0'", _playeruid];
_money_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

////III
_query = format["DELETE FROM money_laundering WHERE player='%1' AND remainingtime <= '0'", _playeruid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//SEND TO MISSION
//Compile
_money  = 0;

if([_money_result] call fnc_isnumber) then
{
	_money = parseNumber _money_result;
}
else
{
	_money = call compile format ["%1", _money_result];
	_money = ((_money select 0) select 0) select 0;
	
	if([_money] call fnc_isnumber) then
	{
		_money = parseNumber _money;
	}
	else
	{
		diag_log "<LAUNDER-TIMER> strange format!";
		_money = 0;
	};
};

if(_money > 0) then
{
	[_money, "Launder", _playeruid, name _player] call ANTICHEAT_fnc_commitMOTValid;
	[ [_money] ,"life_fnc_execLaunderTimer",owner _player,false] spawn life_fnc_MP; //send the string
};

