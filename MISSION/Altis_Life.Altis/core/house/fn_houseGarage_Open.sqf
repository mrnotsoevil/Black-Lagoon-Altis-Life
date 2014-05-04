/*
*
* houseGarage_Open [player]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy", "_car_spawn"];

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call life_fnc_houseExtractDataVal;
_car_spawn = [_exdata, "marker_car_spawn"] call life_fnc_houseExtractDataVal;

hint "Öffne Garage ...";
sleep 1;


//Call vehicle Garage
[[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
life_garage_type = "Car";
createDialog "Life_impound_menu_free";
disableSerialization;
ctrlSetText[2802,"Lade Fahrzeuge ..."];
life_garage_sp = _car_spawn;


