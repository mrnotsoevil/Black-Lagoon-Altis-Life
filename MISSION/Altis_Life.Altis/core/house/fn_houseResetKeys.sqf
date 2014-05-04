/*

	Gives selected player key

*/
private["_index", "_uid","_name", "_setarr", "_exdata", "_existing", "_tparr", "_housename"];

if( isNull (findDisplay 38700)) exitWith {};
if(life_action_inUse) exitWith {};

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_housename = [_exdata, "name"] call life_fnc_houseExtractDataVal;

//////////////////////


life_action_inUse = true;

//Call database
hint "Frage Datenbank an ...";

//call command
[ [player ,_housename] , "HOUSE_fnc_DBresetKeys" ,false, false] call life_fnc_MP;