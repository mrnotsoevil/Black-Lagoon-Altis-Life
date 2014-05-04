/*
*	[ID, OWNER, PRICE, GROUP, NAME, MARKER_SPAWN, MARKER_CAR_SPAWN, INVENTORY, OWNED] houseExtractData ( STRING _data)
*
*/

private ["_id","_owner","_price","_group","_name","_marker_spawn","_marker_car_spawn","_inventory","_owned","_price_sell","_data","_arr","_inventory_weight", "_ret", "_ownername","_safe_upgrade","_inventory_maxweight","_safe_inventory","_trustedpersons","_buyable","_donator"];

_data = _this select 0;
_arr = _data select 0;

if(count _arr <= 1) exitWith
{
	hint "Daten konnten nicht analysiert werden.";
	[];
};

//Set data
_id = parseNumber (_arr select 0);
_owner = _arr select 1;
_price = parseNumber (_arr select 2);
_group = _arr select 3;
_name = _arr select 4;

_marker_spawn = _arr select 5;
_marker_car_spawn = _arr select 6;

//_inventory = []; //BACKUP
_inventory = [(_arr select 7), 1, -1] call BIS_fnc_trimString;
_inventory = call compile format["%1", _inventory]; //compile to string



//Check with NIL
if(isNil "_inventory") then { _inventory = []; hint "Inventar konnte nicht geladen werden."; sleep 2;}; //Pech gehabt!

diag_log format ["0 Done compiling string %1 to array %2", (_arr select 7), _inventory ];


if(((_arr select 8)) == "True" || (_arr select 8) == "1") then
{
	_owned = true;
}
else
{
	_owned = false;
};


_price_sell = parseNumber (_arr select 9);
_inventory_weight = parseNumber (_arr select 10);
//hint _name; 

//owner name
_ownername = _arr select 11;

_inventory_maxweight = parseNumber (_arr select 12);

///Safe-INVENTORY/UPGRADE
_safe_upgrade = (_arr select 13) == "True" || (_arr select 13) == "1";

_safe_inventory = [(_arr select 14), 1, -1] call BIS_fnc_trimString;
_safe_inventory = call compile format["%1", _safe_inventory]; //compile to string
if(isNil "_safe_inventory") then { _safe_inventory = []; hint "Safe konnte nicht geladen werden."; sleep 2;}; //Pech gehabt!


///Trusted Persons
_trustedpersons = [(_arr select 15), 1, -1] call BIS_fnc_trimString;
_trustedpersons = call compile format["%1", _trustedpersons]; //compile to string

if(isNil("_trustedpersons")) then
{
  _trustedpersons = [];
};

//Buyable
_buyable = (((_arr select 16)) == "True" || (_arr select 16) == "1");

//donator
_donator = (((_arr select 17)) == "True" || (_arr select 17) == "1");

_ret = [_id,_owner,_price,_group,_name,_marker_spawn,_marker_car_spawn,_inventory,_owned,_price_sell,_inventory_weight,_ownername,_inventory_maxweight,_safe_upgrade,_safe_inventory,_trustedpersons,_buyable,_donator];

diag_log format ["Done extracting house data : ARR %1", str _ret];

_ret;


