/*

	set usage variable of house
	
	houseSetInuse [STRING house, BOOL use]

*/

private["_house", "_use","_varname"];

_house = [_this,0,""] call BIS_fnc_param;
_use = [_this,1,false] call BIS_fnc_param;

//set mission namespace variable
_varname = format["life_house__%1", _house];
missionNamespace setVariable[_varname , _use];
publicVariable _varname;