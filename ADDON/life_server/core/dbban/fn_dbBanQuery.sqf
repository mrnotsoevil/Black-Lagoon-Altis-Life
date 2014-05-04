/*

	Query DBBAN status of unit
	f[uid,name]

*/

private["_uid", "_name","_query","_result","_unit"];

_uid = _this select 0;
_name = _this select 1;

_existing = [_uid] call life_fnc_dbBanGet;

diag_log "<<DBBAN>> Querying ...";

//QUERY COND
_query = format ["SELECT banned FROM players WHERE playerid='%1'", _uid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//Compile Cond here
_result = call compile format["%1", _result];
_result = (((_result select 0) select 0) select 0);
_result = _result == "1" || _result == "True";

diag_log format["<<DBBAN>> Result is %1", _result];

if(!_existing && _result) then
{
	diag_log format["<<DBBAN>> Player query has been recognized as BANNED for %1 (%2)", _name, _uid];
	
	[_uid, _name, "DB-QUERY-BAN"] call life_fnc_dbBanBan;
};
