/*

	Parks vehicle
	
	[_target,_caller,id,MARKER] parkVehicle
	
	this addAction[""Fahrzeug einparken"", life_fnc_parkVehicle,"""",0,false,false,"""",'!life_garage_store'];

*/

private["_spawn","_nearVehicle","_target"];

_target = _this select 0;
//_spawn = _this select 3;

//////

if(life_garage_store) exitWith {};

if(player distance _target > 20) exitWith
{
	hint "Du bist zu weit weg!";
};

//////

_nearVehicle = nearestObjects[(getPos (_this select 0)),["Car","Ship","Air"],35] select 0;
if(isNil "_nearVehicle") exitWith 
{
	hint "Es gibt kein Fahrzeug in der Nähe.";
};

[[_nearVehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
hint "Speichere Fahrzeuge ...";
life_garage_store = true;
  