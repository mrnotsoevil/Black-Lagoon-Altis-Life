/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item","_ret"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {5};
	case "heroinu": {4};
	case "heroinp": {3};
	case "cannabis": {3};
	case "marijuana": {2};
	case "apple": {1};
	case "peach": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {3};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {5};
	case "salt_r": {3};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};	
	case "coal": {4};
	case "coalr": {2};	
	case "cocaine": {3};
	case "cocainep": {2};
	case "silver": {5};
	case "silverr": {3};
	case "gold": {5};
	case "goldr": {3};	
	case "frog": {2};
	case "foglegs": {2};
	case "froglsd": {2};
	case "illegalmoney": {0};
	case "vrepairkit": {15}; //##49
	case "vfirstaidkit": {12}; //##53
	case "box": {4}; //##69
	case "frog": {3}; //LSD
	case "foglegs": {2};
	case "froglsd": {2};
	default 
	{ 
		_ret = [_item] call life_fnc_vitem_itemWeight;
		
		if(_ret == 0) then
		{
			_ret = [_item] call life_fnc_uitem_itemWeight;
		};
		
		if( isNil "_ret") then
		{
			_ret = 0;
		};
		
		_ret;
	};
};
