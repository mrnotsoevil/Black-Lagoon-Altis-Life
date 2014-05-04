/*
*
* houseGarage_Park [player]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy"];

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call life_fnc_houseExtractDataVal;


//
hint "Parke Fahrzeuge in der Nähe ...";
sleep 1;

//Call vehicle store
[player, player] spawn life_fnc_storeVehicle;

