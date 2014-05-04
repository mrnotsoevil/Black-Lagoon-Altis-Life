/*

	[player] requested Data

*/

private["_unit"];

_unit = _this select 0;

if(isNil("life_session_completed") || !life_session_completed) exitWith
{
};

[[player, life_player_perms],"life_fnc_permManager_gotData",_unit,false] spawn life_fnc_MP;

