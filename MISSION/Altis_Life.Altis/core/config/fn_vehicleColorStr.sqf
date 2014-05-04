/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index","_currentindex","_currveh"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

_currentindex = 0;
_color = "NULL?";

{
	_currveh = (_x select 0);

	if(_currveh == _vehicle) then
	{
		if(_currentindex == _index) then //nested exitWith not working ???
		{
			_color = (_x select 2);
		};
		
		_currentindex = _currentindex + 1;
	};
}
foreach life_vehicle_colors_new;


_color;


/*switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Gelb";};
			case 2: {_color = "Weiß";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkelrot";};
			case 5: {_color = "Blau / Weiß"};
			case 6: {_color = "Polizei"};
			case 7: {_color = "Taxi"};
			case 8: {_color = "Unicorn"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Bech";};
			case 1: {_color = "Grün";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkelblau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiß"};
			case 6: {_color = "Grau"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Bech";};
			case 1: {_color = "Grün";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkelblau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiß"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Polizei"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkelrot";};
			case 1: {_color = "Silber";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Polizei";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiß"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiß"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Braun"};
			case 1: {_color = "Digi Wüste"};
			case 2: {_color = "Schwarz"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiß"};
			case 6: {_color = "Digi Grün"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebell Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Grün / Braun"};
			case 1: {_color = "Blau"};
			case 2: {_color = "Rot"};
			case 3: {_color = "Digi Grün"};
			case 4: {_color = "Blaulinie"};
			case 5: {_color = "Elyptisch"};
			case 6: {_color = "Furious"};
			case 7: {_color = "Jeans Blau"};
			case 8: {_color = "Rotlinie"};
			case 9: {_color = "Sonne"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Wellenblau"};
			case 12: {_color = "Rebell Digi"};
			case 13: {_color = "Polizei"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blau / Weiß"};
			case 1: {_color = "Digi Grün"};
			case 2: {_color = "Rebell"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "I_Heli_light_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "B_MRAP_01_gmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
};

_color;*/