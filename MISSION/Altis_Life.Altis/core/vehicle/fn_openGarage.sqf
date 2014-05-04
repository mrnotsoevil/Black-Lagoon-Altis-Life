/*

	Opens garage for marker
	[target,caller,id,[SPAWN,TYPE] ] openGarage
	
	this addAction[""Garage"",  life_fnc_openGarage, [""cop_car_2"",""Car""]];

*/

private["_spawn", "_type"];

_spawn = (_this select 3) select 0; //marker spawn
_type = (_this select 3) select 1; //Air,Car,Ship

//////

if(player distance (getMarkerPos _spawn) > 30) exitWith
{
	hint "Du bist zu weit weg vom Garagenpunkt!";
};

//////

[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
life_garage_type = _type;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Lade Fahrzeuge ..."];
life_garage_sp = _spawn;