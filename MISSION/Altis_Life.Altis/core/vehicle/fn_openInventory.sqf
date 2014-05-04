/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship")) exitWith {systemChat "Bad Vehicle";}; //Either a null or invalid vehicle type.

//check if locked LOL TONIC!!!
if(locked _vehicle == 2) exitWith
{
	hint "Fahrzeug ist abgesperrt. Benutze U, um es aufzusperren.";
};

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "Der Fahrzeugkofferraum wird im Moment von Jemand anderem benutzt."};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[3501,format["Vehicle Trunk - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];


////Update weight here
[_vehicle] call life_fnc_vehicleUpdateTrunkWeight; //To ensure everything is ok

_veh_data = [_vehicle] call life_fnc_vehicleWeight;
if(_veh_data select 0 == -1) exitWith {closeDialog 0};

ctrlSetText[3504,format["Gewicht: %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

[_vehicle] spawn
{
	//(_this select 0) say3D "trunk_open";
	[_this select 0,"trunk_open"] call life_fnc_globalSound;

	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["trunk_in_use",false,true];
	//(_this select 0) say3D "trunk_close";
	[_this select 0,"trunk_close"] call life_fnc_globalSound;
	
	//Call player sync because vehicle can save things to prevent cheating
	[1,false] call life_fnc_sessionHandle;
	hintSilent "Hinweis: Illegale Sachen werdén nicht gespeichert, wenn du es in die Garage einparkst.";
	
	sleep 5;
	
	[[_this select 0,true,player],"TON_fnc_vehicleSaveInventory",false,false] spawn life_fnc_MP;
};


