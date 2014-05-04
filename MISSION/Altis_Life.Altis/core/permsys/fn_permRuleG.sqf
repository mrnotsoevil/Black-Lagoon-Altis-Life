/*

	[RULE] permRuleG ... returns if player has rule in general (not specific to PERMID)

*/

private["_permid", "_ruleid", "_level", "_fullfilled", "_ruleset"];


_ruleid = _this select 0;

//go thru perms and search ruleset
_fullfilled = false;
_ruleset = [];

{
	_ruleset = _x select 3;
	_level = [_x select 0] call life_fnc_permLevel;
				
	{
	    if((_x select 0) == _level) exitWith
	    {
		
		if(!_fullfilled) then
		{
		    _fullfilled = _ruleid in (_x select 1);
		};
		
	    };
	}
	foreach _ruleset;
	
	if(_fullfilled) exitWith
	{
	    _fullfilled;
	}
}
foreach ([] call life_fnc_perms);


_fullfilled;