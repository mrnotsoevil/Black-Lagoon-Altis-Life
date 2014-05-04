/*
	File: fn_sessionUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the update request to the server to save information in the database.
*/
private["_packet","_inventory"];

_packet = [player,playerSide,life_cash,life_atmcash,getPlayerUID player];
switch (playerSide) do
{
	case west:
	{
		_array = [];
		{
			if(_x select 1 == "cop") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		_packet set[count _packet,_array]; //add licenses
		
		//Save here
		[] call life_fnc_saveGear;
		_gear = cop_gear;
		
		_packet set[count _packet,_gear]; //add gear
	};
	
	case civilian:
	{
		_array = [];
		{
			if(_x select 1 == "civ") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		//[] call life_fnc_civFetchGear; No!
		
		//Save here
		[] call life_fnc_civSaveGear;
		_gear = civ_gear;
		
		_packet set[count _packet,_array];
		_packet set[count _packet,life_is_arrested];
		_packet set[count _packet,civ_gear];
	};
};

_packet set[8,name player];

///Inv packet
_inventory = [] call life_fnc_getInventoryArray;
//String the inventory here
_inventory = format["""%1""", str _inventory];
_packet set[9,_inventory];

//##119 perm
_packet set[10, format["""%1""", str life_player_perms]];


///CIV COP gear setter
/*_gear = cop_gear;
_packet set[10,_gear]; //add gear Cop-Civ-Gear*/


[_packet,"TON_fnc_update",false,false] spawn life_fnc_MP;