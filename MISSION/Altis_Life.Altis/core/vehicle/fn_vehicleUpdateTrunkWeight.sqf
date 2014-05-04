/*

	Because of crazy behavior by tonic, update vehicle trunk weight here!


*/

private ["_vehicle", "_trunk", "_weight","_shortname","_count"];
_vehicle = _this select 0;

_trunk = _vehicle getVariable ["Trunk", []];

if(count _trunk == 0) then
{
	_trunk = [[],0];
};

///Go through trunk and recount weight
_weight = 0;

{
	_shortname = _x select 0;
	_count = _x select 1;
	
	_weight = _weight + ( [_shortname] call life_fnc_itemWeight ) * _count;
}
foreach (_trunk select 0);

//update trunk array
_trunk set [1,_weight];

//set vehicle var
_vehicle setVariable ["Trunk", _trunk, true];