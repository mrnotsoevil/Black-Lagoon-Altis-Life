/*

	[PERMID, RULE, (level)] permRule ... returns if player has rule

*/

private["_permid", "_ruleid", "_level", "_fullfilled", "_ruleset"];

_permid = _this select 0;
_ruleid = _this select 1;

_level = [_this, 2, [_permid] call life_fnc_permLevel] call BIS_fnc_param;

//go thru perms and search ruleset
_fullfilled = false;
_ruleset = [];

{
	if(_permid == (_x select 0)) exitWith
	{
		_ruleset = _x select 3;
	};
}
foreach ([] call life_fnc_perms);

//look if fulfilled
{
	if((_x select 0) == _level) exitWith
	{
		_fullfilled = _ruleid in (_x select 1);
	};
}
foreach _ruleset;

_fullfilled;