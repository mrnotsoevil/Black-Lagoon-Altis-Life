/*

	Set banned status for UID
	
	f[UID, BANNED]

*/

private["_uid", "_banned", "_existing"];

_uid = _this select 0;
_banned = _this select 1;

_existing = [_uid] call life_fnc_dbBanGet;

if(/*_existing != _banned*/ !(_existing && _banned)) then //FUCK YOU BI!!! CANNOT COMPARE BOOLEANS EVERY FUCKING LANGUAGE FROM '80s CAN DO THIS
{
	if(_banned) then
	{
		diag_log format["!!! <<DBBAN>> Player %1 known as banned", _uid];
		
		life_dbban_bannedids set [count life_dbban_bannedids, _uid]; //ban
	}
	else
	{
		diag_log format["<<DBBAN>> Player %1 known as NOT BANNED", _uid];
		life_dbban_bannedids = life_dbban_bannedids - [_uid]; //unban
	};
}
