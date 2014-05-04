/*

	Returms LEVEL NAME for perm
	
	permLevel[PERMID, LEVEL]

*/

private["_permid", "_perms", "_level", "_name", "_row"];

_permid = _this select 0;
_level = _this select 1;


_row = [];
_name = "Kein Mitglied";

{
	if ( (_x select 0) == _permid) exitWith
	{
		_row = _x;
	};
}
foreach ([] call life_fnc_perms);

if((count _row) == 0) exitWith { _name; };

_row = _row select 6;

if(_level >= count _row) exitWith { _name; };


(_row select _level);