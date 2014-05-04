/*

	Get if banned for uid

*/

private ["_uid"];

false;

_uid = _this select 0;

if(isNil("life_dbban_bannedids")) then
{
	life_dbban_bannedids = [];
	diag_log "Created bannedids array!";
};

(_uid in life_dbban_bannedids);