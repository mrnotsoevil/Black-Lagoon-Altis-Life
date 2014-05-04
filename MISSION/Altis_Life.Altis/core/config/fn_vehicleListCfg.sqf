#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];

// ************************************
//
//NOTE: Preis auf -1 setzen, um Standardpreis von vehiclesCentralized zu nehmen
//
// ************************************


switch (_shop) do
{
	//##33 ADAC
	case "civ_adac":
	{
		_return = 
		[
			["C_Offroad_01_F",40000],
			["B_Truck_01_transport_F",340000]
		];
	}; 
	
	case "civ_adac_air":
	{
		_return = 
		[
			["B_Heli_Light_01_F",500000]
		];
	}; 
	
	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",40000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",70000]
		];
	}; 
	
	case "civ_car_2":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",40000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",70000]
		];
	}; 
	
	case "civ_car_3":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",40000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",70000]
		];
	}; 
	
	case "civ_car_4":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",40000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",70000]
		];
	}; 
	
	case "donator_1":
	{
		_return =
		[
			["B_Quadbike_01_F",2000],
			["C_Offroad_01_F",20000],		
			["C_Hatchback_01_sport_F",30000],
			["C_SUV_01_F",40000],
			["C_Van_01_transport_F",40000],
			["O_MRAP_02_F",1000000],
			["B_Truck_01_covered_F",3600000],
			["O_Truck_03_covered_F",4000000],
			["B_Heli_Light_01_F",500000],
			["O_Heli_Light_02_unarmed_F",1500000],
			["I_Heli_Transport_02_F",3500000],
			["B_Heli_Transport_01_F",15000000]
		];

		/*if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["B_Quadbike_01_F",2500]];
			_return set[count _return,["C_Offroad_01_F",30000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["C_SUV_01_F",40000]];
			_return set[count _return,["C_Van_01_transport_F",50000]];
			_return set[count _return,["B_Truck_01_covered_F",750000]];
			_return set[count _return,["O_Truck_03_covered_F",850000]];
			_return set[count _return,["B_Heli_Light_01_F",700000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",2000000]];
			_return set[count _return,["I_Heli_Transport_02_F",5000000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["B_Quadbike_01_F",2500]];
			_return set[count _return,["C_Offroad_01_F",30000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["C_SUV_01_F",40000]];
			_return set[count _return,["C_Van_01_transport_F",50000]];
			_return set[count _return,["B_Truck_01_covered_F",750000]];
			_return set[count _return,["O_Truck_03_covered_F",850000]];
			_return set[count _return,["B_Heli_Light_01_F",700000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",2000000]];
			_return set[count _return,["I_Heli_Transport_02_F",5000000]];
		};*/
	};
	
	case "donator_2":
	{
		_return =
		[
			["B_Quadbike_01_F",2000],
			["C_Offroad_01_F",20000],
			["C_Hatchback_01_sport_F",30000],
			["C_SUV_01_F",40000],
			["C_Van_01_transport_F",40000],
			["O_MRAP_02_F",1000000],
			["B_Truck_01_covered_F",3600000],
			["O_Truck_03_covered_F",4000000],
			["B_Heli_Light_01_F",500000],
			["O_Heli_Light_02_unarmed_F",1500000],
			["I_Heli_Transport_02_F",3500000],
			["B_Heli_Transport_01_F",15000000]
			
		];

		/*if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["B_Quadbike_01_F",2500]];
			_return set[count _return,["C_Offroad_01_F",30000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["C_SUV_01_F",40000]];
			_return set[count _return,["C_Van_01_transport_F",50000]];
			_return set[count _return,["B_Truck_01_covered_F",750000]];
			_return set[count _return,["O_Truck_03_covered_F",850000]];
			_return set[count _return,["B_Heli_Light_01_F",700000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",2000000]];
			_return set[count _return,["I_Heli_Transport_02_F",5000000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["B_Quadbike_01_F",2500]];
			_return set[count _return,["C_Offroad_01_F",30000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["C_SUV_01_F",40000]];
			_return set[count _return,["C_Van_01_transport_F",50000]];
			_return set[count _return,["B_Truck_01_covered_F",750000]];
			_return set[count _return,["O_Truck_03_covered_F",850000]];
			_return set[count _return,["B_Heli_Light_01_F",700000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",2000000]];
			_return set[count _return,["I_Heli_Transport_02_F",5000000]];
		};*/
	};
			
	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",60000] //Service Truck
		];
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_box_F",100000],
			["I_Truck_02_transport_F",130000],
			["I_Truck_02_covered_F",170000],
			["B_Truck_01_transport_F",340000],
			["B_Truck_01_covered_F",4500000]
		];	
	};
	
	case "civ_truck_2":
	{
		_return =
		[
			["C_Van_01_box_F",100000],
			["I_Truck_02_transport_F",130000],
			["I_Truck_02_covered_F",170000],
			["B_Truck_01_transport_F",340000],
			["B_Truck_01_covered_F",4500000]
		];	
	};
	
	case "reb_v_1":
	{
		if(license_civ_rebel) then
		{
			_return =
			[
				["B_Quadbike_01_F",3000],
				["B_G_Offroad_01_F",50000],
				["O_Truck_03_transport_F",400000],
				["I_MRAP_03_F",1000000],
				["B_Heli_Light_01_F",600000],
				["O_Heli_Light_02_unarmed_F",1800000],
				["B_G_Offroad_01_armed_F",4000000],
				["O_Heli_Light_02_F",12000000]
				//["B_Heli_Transport_01_F",5000000],
			];
		
		
			/*_return set[count _return,
			["B_G_Offroad_01_armed_F",4000000]];
			_return set[count _return,
			["B_Heli_Transport_01_camo_F",5000000]];*/
		};
	};
	
	case "reb_v_2":
	{
		if(license_civ_rebel) then
		{
			_return =
			[
				["B_Quadbike_01_F",3000],
				["B_G_Offroad_01_F",50000],
				["O_Truck_03_transport_F",400000],
				["I_MRAP_03_F",1000000],
				["B_Heli_Light_01_F",600000],
				["O_Heli_Light_02_unarmed_F",1800000],
				["B_G_Offroad_01_armed_F",4000000],
				["O_Heli_Light_02_F",12000000]
				//["B_Heli_Transport_01_F",5000000],
			];
		
		
			/*_return set[count _return,
			["B_G_Offroad_01_armed_F",4000000]];
			_return set[count _return,
			["B_Heli_Transport_01_camo_F",5000000]];*/
		};
	};
	
	case "reb_car":
	{
		if(license_civ_rebel) then
		{
		_return set[count _return,
		["B_Quadbike_01_F",3000]];
		_return set[count _return,
		["B_G_Offroad_01_F",50000]];
		_return set[count _return,
		["O_Truck_03_transport_F",400000]];
		_return set[count _return,
		["I_MRAP_03_F",1000000]];
		}
	};
	
	case "reb_car2":
	{
		if(license_civ_rebel) then
		{
		_return set[count _return,
		["B_Quadbike_01_F",3000]];
		_return set[count _return,
		["B_G_Offroad_01_F",50000]];
		_return set[count _return,
		["O_Truck_03_transport_F",400000]];
		_return set[count _return,
		["I_MRAP_03_F",1000000]];
		}
	};
	
	case "reb_air":
	{
		if(license_civ_rebel) then
		{
		_return set[count _return,
		["B_Heli_Light_01_F",600000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",1800000]];
		//_return set[count _return,
		//["B_Heli_Transport_01_F",5000000]];
		}
	};
	
	case "cop_car_1":
	{
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
		};
	};
	
	case "cop_car_2":
	{
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
		};
	};
	
	case "cop_car_3":
	{
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
		};
	};
	
	case "cop_car_5":
	{
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
		};
	};
	
	case "cop_car_telos":
	{
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
		};
	};
	
	case "fed_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",0]];
		_return set[count _return,
		["C_Offroad_01_F",0]];
		_return set[count _return,
		["B_MRAP_01_F",0]];
		_return set[count _return,
		["I_MRAP_03_F",0]];
		_return set[count _return,
		["I_Truck_02_covered_F",0]];
		_return set[count _return,
		["I_Truck_02_transport_F",0]];
		_return set[count _return,
		["B_Truck_01_covered_F",0]];
		_return set[count _return,
		["B_Truck_01_transport_F",0]];
	};
	
	/*case "fed_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",0]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",0]];
		_return set[count _return,
		["B_Heli_Transport_01_F",0]];
		_return set[count _return,
		["I_Heli_Transport_02_F",0]];
	};*/
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",800000],
			["O_Heli_Light_02_unarmed_F",3600000],
			["I_Heli_Transport_02_F",18000000]
		];
	};
	
	case "civ_air_2":
	{
		_return =
		[
			["B_Heli_Light_01_F",800000],
			["O_Heli_Light_02_unarmed_F",3600000],
			["I_Heli_Transport_02_F",18000000]
		];
	};
	
	case "civ_air_3":
	{
		_return =
		[
			["B_Heli_Light_01_F",800000],
			["O_Heli_Light_02_unarmed_F",3600000],
			["I_Heli_Transport_02_F",18000000]
		];
	};
	
	case "cop_air_1":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",70000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",200000]];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_return set[count _return,
			["I_Heli_light_03_F",1000000]];
		};
		
		
		
	};
	
	case "cop_air_2":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",70000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",200000]];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_return set[count _return,
			["I_Heli_light_03_F",1000000]];
		};
		
		
		
	};
	
	case "cop_air_3":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",70000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",200000]];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_return set[count _return,
			["I_Heli_light_03_F",1000000]];
		};
		
		
		
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",20000]
		];
	};
	
	case "civ_ship_2":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",20000]
		];
	};
	
	case "civ_ship_3":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",20000]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",5000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",100000],
			["B_SDV_01_F",150000]
		];
	};
	
	case "donator_heli":
	{
		_return =
		[
			["B_Heli_Light_01_F",640000],
			["O_Heli_Light_02_unarmed_F",2880000],
			["I_Heli_Transport_02_F",14400000],
			["B_Heli_Transport_01_F",8000000]
		];
	};
	
	case "donator_car":
	{
		_return =
		[
				["B_Quadbike_01_F",3000],
				["C_Offroad_01_F",30000],
				["C_Hatchback_01_sport_F",40000],
				["C_SUV_01_F",50000],
				["C_Van_01_transport_F",60000],
				["B_Truck_01_covered_F",3600000],
				["O_Truck_03_covered_F",4000000]
		];
	};
	
	case "donator_all":
	{
		_return =
		[
			["B_Quadbike_01_F",2000],
			["C_Offroad_01_F",30000],
			["C_Hatchback_01_sport_F",40000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",60000],
			["O_MRAP_02_F",1000000],
			["B_Truck_01_covered_F",3600000],
			["O_Truck_03_covered_F",4000000],
			["B_Heli_Light_01_F",640000],
			["O_Heli_Light_02_unarmed_F",2880000],
			["B_Heli_Transport_01_F",8000000],
			["I_Heli_Transport_02_F",14400000],
			["O_Heli_Light_02_F",10000000]
		];
	};
};

_return;
