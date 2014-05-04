#include <macro.h>
/*
	File: fn_vehicleShop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the vehicle shop.
	CAN"T WAIT TO SCRAP THIS!
*/
private["_display","_vehicles","_veh","_price","_pic","_name","_kill"];
disableSerialization;
_kill = "";
if(!dialog) then
{
	createDialog "Life_vehicle_shop";
	life_veh_shop = _this select 3;
};

_display = findDisplay 2300;
_vehicles = _display displayCtrl 2302;
lbClear _vehicles;
ctrlShow[2303,false];

switch (life_veh_shop) do
{
	case "civ_adac":
	{
		if((["adac"] call life_fnc_permLevel) < 1) exitWith {_kill = "Du hast keine ADAC-Lizenz."};
		ctrlSetText[2301,"ADAC-Fahrzeuge"];
	};

	case "civ_car_1":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_2":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_3":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_4":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_servt_1":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "donator_1":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		if(__GETC__(life_donator) == 0) exitWith {_kill = "Du bist kein Donator!"};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "donator_2":
	{
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist."};
		if(__GETC__(life_donator) == 0) exitWith {_kill = "Du bist kein Donator!"};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "reb_v_1":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};
	
	case "reb_v_2":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};
	
	case "reb_air":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Rebel Air Shop"];
	};
	
	case "reb_ship1":
		{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Rebel Boat Shop"];
	};
	
	case "cop_car_1":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_2":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_3":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_5":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "fed_car":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		if(__GETC__(life_adminlevel) < 1) exitWith {_kill = "Du bist kein Bundesagent!"};
		ctrlSetText[2301,"Secret Service Car Shop"];
		
	};
	
	case "civ_air_1":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "civ_air_2":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "cop_air_1":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "cop_air_2":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "fed_air":
	{
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		if(__GETC__(life_adminlevel) < 1) exitWith {_kill = "Du bist kein Bundesagent!"};
		ctrlSetText[2301,"Secret Service Air Shop"];
	};
	
	case "civ_ship_1":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_ship_2":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_ship_2":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_truck_1":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "civ_truck_2":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "civ_ship_3":
	{
		if(playerSide == west) exitWith {_kill =  "Du bist kein Zivilist."};
		ctrlSetText[2301,"Girna Boat Shop"];
	};
	
	case "cop_ship_1":
	{	
		if(playerSide == civilian) exitWith {_kill =  "Du bist kein Polizist."};
		ctrlSetText[2301,"Cop Boat Shop"];
	};
	
	case "donator_heli":
	{
		if(__GETC__(life_donator) < 1) exitWith {_kill = "Du bist kein Donator!"};
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist.."};
		ctrlSetText[2301,"Donator Air Shop"];
	};
	
	case "donator_car":
	{
		if(__GETC__(life_donator) < 1) exitWith {_kill = "Du bist kein Donator!"};
		if(playerSide == west) exitWith {_kill = "Du bist kein Zivilist.."};
		ctrlSetText[2301,"Donator Car Shop"];
	};

};

if(_kill != "") exitWith {
hint _kill;
closeDialog 0;
};

{
	_veh = _x select 0;
	_price = _x select 1;
	
	//Set price to default value if it's -1
	if(_price == -1) then
	{
		{
			if((_x select 0) == _veh) exitWith
			{
				_price = _x select 2;
			};
		}
		foreach life_vehicle_config_new;
	};
	
	/*if(_veh == "C_Offroad_01_F" && _price == 15000) then
	{
		_name = "ADAC-Truck";
	}
		else
	{*/
		_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
	//};
	_pic = getText(configFile >> "CfgVehicles" >> _veh >> "picture");
	//if(_veh == "B_G_Offroad_01_armed_F" OR _veh == "B_MRAP_01_hmg_F") then
	//{
	//	_vehicles lbAdd format["%1 - $%2 ",_name, [_price] call life_fnc_numberText];
	//}
	//	else
	//{
		_vehicles lbAdd format["%1 - Mieten: $%2 Kaufen: $%3 ",_name, [_price] call life_fnc_numberText, [round(_price * 1.5)] call life_fnc_numberText];
	//};
	
	/*if(_name == "ADAC-Truck") then
	{
		_vehicles lbSetData [(lbSize _vehicles)-1,"serv_truck"];
	}
		else*/
	//{
		_vehicles lbSetData [(lbSize _vehicles)-1,_veh];
	//};
	_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
	_vehicles lbSetValue [(lbSize _vehicles)-1,_price];
} foreach ([life_veh_shop] call life_fnc_vehicleListCfg);