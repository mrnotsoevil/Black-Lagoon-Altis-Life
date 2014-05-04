/*
*
* Open house inventory, executed by PIPELINE
*
*/

private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_house_price", "_house_price_sell",
"_house_current_inv", "_item", "_count", "_index"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

//hint _house_data;

_house_data = call compile format["%1", _house_data]; //compile data

//////////////////Parse data
_exdata = _house_data call life_fnc_houseExtractData;

if (count _exdata == 0) exitWith { hint "Konnte Haus nicht laden."; };

//Set player variable house_current_exdata
missionNamespace setVariable ["house_current_exdata", _exdata];

_house_current_inv = [_exdata, "inventory"] call life_fnc_houseExtractDataVal ;
//player setVariable ["house_current_inventory",  _house_current_inv]; //Add CURRENT house INVENTORY to player inv

_house_name =  [_exdata, "name"] call life_fnc_houseExtractDataVal; //TO BE SAFE


//////////////////TODO
//Check if house belongs to player

diag_log format [ "%1 is trying to access %2 ...", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];

/*_canview = true;
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call life_fnc_houseExtractDataVal) != name player) then //if player not owner
	{
		_canview = false;
	};
};*/

_canview = _exdata call life_fnc_houseCanAccess; //replaced by life_fnc_houseCanAccess

if(!_canview) exitWith
{
	hint "Das Haus gehort dir nicht!";
	diag_log format [ "%1 tried to access to %2, not belonging to player", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];
};

if( [_house_name] call life_fnc_houseIsInuse ) exitWith
{
	hint "Jemand anderes greift bereits auf das Inventar zu!";
};

/////////////////MAIN INVENTORY METHOD
///////////////////////////////////////////////////

if(dialog) exitWith {hint "Already using a dialog.";};

//Allg. action inuse
if(life_action_inUse) exitWith {hint "Du machst gerade was anderes.";};

life_action_inUse = true;

//Wenn Hausschlüssel HIER CHECK FÜR IN USE!!!

if(!createDialog "houseInventory") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

life_house_current_inv = _house_current_inv;
life_house_current_weight = 0;
life_house_current_maxweight = [_exdata, "inventory_weight"] call life_fnc_houseExtractDataVal;
life_house_current_inv_running = false;

//refresh it
[] spawn life_fnc_houseInventory_refresh;

//!IMP set use variable
[_house_name, true] call life_fnc_houseSetInuse;

//Wait for dialog to show
 waitUntil{!isNull (findDisplay 3500)};

//Wait for dialog to close
 waitUntil{isNull (findDisplay 3500)};
 
//!IMP set use variable
[_house_name, false] call life_fnc_houseSetInuse;

// APPLY ALL CHANGES
[] call life_fnc_houseInventory_apply;


//Final
/////////life_action_inUse = false; MOVE IT TO EXECUTION STEP!!!!!!