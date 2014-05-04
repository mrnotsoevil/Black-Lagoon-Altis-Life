/*

	Returms LEVEL for perm
	
	permLevel[PERMID, (perms)]

*/

private["_permid", "_perms", "_level"];

_permid = _this select 0;
_perms = [_this, 1, life_player_perms] call BIS_fnc_param;

_level = 0;

{
	if ( (_x select 0) == _permid) exitWith
	{
		_level = (_x select 1);
	};
}
foreach _perms;

_level;