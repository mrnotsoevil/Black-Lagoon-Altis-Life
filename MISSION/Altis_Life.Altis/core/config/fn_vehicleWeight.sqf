/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used","_vehicletype","__vehtype"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

_vehicletype = typeOf _vehicle;

//New, centralized system
{
	__vehtype = _x select 0;
	if(__vehtype == _vehicletype) exitWith
	{
		_weight = _x select 1;
	};
}
foreach life_vehicle_config_new;

/*switch ((typeOf _vehicle)) do
{
	case "B_Quadbike_01_F": {_weight = 50;};
	case "C_Hatchback_01_F": {_weight = 75;};
	case "C_Hatchback_01_sport_F": {_weight = 75;};
	case "C_Offroad_01_F": {_weight = 150;};
	case "B_G_Offroad_01_F": {_weight = 150;};
	case "C_SUV_01_F": {_weight = 100;};
	case "C_Van_01_transport_F": {_weight = 200;};
	case "C_Van_01_box_F": {_weight = 250;};
	case "I_Truck_02_transport_F": {_weight = 300;};
	case "I_Truck_02_covered_F": {_weight = 350;};
	case "B_Truck_01_transport_F": {_weight = 400;};
	case "O_Truck_03_transport_F": {_weight = 400;};
	case "B_Truck_01_covered_F": {_weight = 600;};
	case "O_Truck_03_covered_F": {_weight = 600;};
	case "I_MRAP_03_F": {_weight = 100;};
	case "B_MRAP_01_F": {_weight = 100;};
	case "O_MRAP_02_F": {_weight = 100;};
	case "B_MRAP_01_hmg_F": {_weight = 100;};
	case "C_Rubberboat": {_weight = 50;};
	case "C_Boat_Civil_01_F": {_weight = 100;};
	case "B_Boat_Transport_01_F": {_weight = 50;};
	case "C_Boat_Civil_01_police_F": {_weight = 100;};
	case "B_Boat_Armed_01_minigun_F": {_weight = 150;};
	case "B_Heli_Light_01_F": {_weight = 100;};
	case "O_Heli_Light_02_unarmed_F": {_weight = 250;};
	case "O_Heli_Light_02_F": {_weight = 250;};
	case "I_Heli_Transport_02_F": {_weight = 400;};
	case "I_Heli_light_03_unarmed_F": {_weight = 250;};
	case "I_Heli_light_03_F": {_weight = 250;};
	case "B_G_Offroad_01_armed_F": {_weight = 100;};
	case "B_Heli_Transport_01_F": {_weight = 150;};
	//case "B_Heli_Transport_01_camo_F": {_weight = 150;};
};*/

if(isNil "_used") then {_used = 0};
[_weight,_used];