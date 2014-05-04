/*

	return if house is in use
	
	BOOL houseSetInuse [STRING house]

*/

private["_house", "_varname"];

_house = [_this,0,""] call BIS_fnc_param;

//return mission namespace variable
_varname = format["life_house__%1", _house];

missionNamespace getVariable [_varname, false];