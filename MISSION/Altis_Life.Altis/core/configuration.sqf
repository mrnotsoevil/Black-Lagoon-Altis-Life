#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 20;
life_has_insurance = false;
life_knockout = false;
life_interrupted = false;
//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

life_n_holstered = false;

life_bagsound_playing = false;

life_adac_repaint_vehicle = objNull;

//##108
life_hands_up = false;

life_house_current_inv = [];
life_house_current_weight = 0;
life_house_current_maxweight = 0;
life_house_current_inv_running = false;

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 64; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 40;
life_eat_Mackerel = 30;
life_eat_Tuna = 100;
life_eat_Mullet = 40;
life_eat_CatShark = 80;
life_eat_Rabbit = 40;
life_eat_Apple = 10;
life_eat_turtlesoup = 80;
life_eat_donuts = 40;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_paycheck_period = 5; //Five minutes
life_cash = 0;
life_impound_car = 5000;
life_impound_boat = 10000;
life_impound_air = 25000;
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 10000; //Starting Bank Money
		life_paycheck = 2500; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 5000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_silver", //##10 ##11 ##12
	"life_inv_silverr",
	"life_inv_gold",
	"life_inv_goldr",
	"life_inv_coal",
	"life_inv_coalr",
	"life_inv_illegalmoney", //##38
	"life_inv_vrepairkit", //##49
	"life_inv_vfirstaidkit", //##53
	"life_inv_box", //##69	
	"life_inv_frog", //LSD
	"life_inv_froglegs", //LSD
	"life_inv_froglsd"	//LSD
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"], //##10 ##11 ##12
	["license_civ_silver","civ"],
	["license_civ_gold","civ"],
	["license_civ_coal","civ"],
	["license_civ_cement","civ"],
	["license_civ_home","civ"],
	["license_cop_home","cop"], //Eigentumsurkunde
	
	["license_civ_adac","civ"], //##33
	
	["license_cop_sniper","cop"], //Sniper lizenz ##98
	
	["license_civ_tazer","civ"], //##33
	
	["license_civ_event","civ"], //EVENT
	["license_cop_event","cop"], //EVENT
	
	["license_civ_viewwanted","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1000],["heroinp",6500],["cocaine",3000],["cocainep",3500],["marijuana",2000],["turtle",10000],["cannabis",2000],["illegalmoney",1],["froglsd",3000]];
life_illegal_item_shortnames = ["heroinu","heroinp","cocaine","cocainep","marijuana","turtle","cannabis","illegalmoney","froglsd"];
//Items, die beim Ausparken aus dem Fahrzeug gelöscht werden
life_illegal_item_cleared = ["heroinu","heroinp","cocaine","cocainep","marijuana","turtle","cannabis","illegalmoney","froglsd"]; 
life_illegal_item_buyedByIllegalMoney = ["heroinu","heroinp","cocaine","cocainep","marijuana","turtle","cannabis","illegalmoney","froglsd"]; //These items can only be buyed by illegal money

life_police_only_items = [];
life_police_only_items_bounty = [];

//##57 illegale Waffen
life_illegalweapons =
[
	"arifle_sdar_F",
	"hgun_P07_snds_F",
	"arifle_MXC_Black_F",
	"hgun_Pistol_heavy_01_F",
	"arifle_MX_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MXM_Black_F",
	"srifle_EBR_F",
	"launch_B_Titan_F",
	"Titan_AA",
	"MiniGrenade",
	"HandGrenade",
	"arifle_Katiba_C_F",
	"arifle_Katiba_F",
	"arifle_Mk20C_F",
	"arifle_Mk20C_plain_F",
	"arifle_Mk20_F",
	"arifle_Mk20_plain_F",
	"srifle_DMR_01_F",
	"SatchelCharge_Remote_Mag"
];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",50],
	["heroinp",7800],
	["salema",50],
	["ornate",40],
	["mackerel",200],
	["tuna",1000],
	["mullet",250],
	["catshark",500],
	["rabbit",70],
	["oilp",4000],
	["turtle",21000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",5700],
	["tbacon",25],
	["lockpick",250],
	["pickaxe",750],
	["redgull",500],
	["peach",60],
	["cocaine",60],
	["cocainep",9800],
	["diamond",30],
	["diamondc",6000],
	["iron_r",20],
	["copper_r",1500],
	["salt_r",2500],
	["glass",2100],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1800],
	["gold",40], //##11 ##12 ##10
	["goldr",4300],
	["silver",10],
	["silverr",3800],
	["coal",5],
	["coalr",750],
	["illegalmoney",1], //##38
	["vrepairkit",260], //##49
	["vfirstaidkit",155], //##53
	["box", 500],
	["foglegs",1200],
	["froglsd",3200] //LSD
];
//__CONST__(sell_array,sell_array);
//##69

buy_array = 
[
	["apple",60],
	["rabbit",80],
	["salema",60],
	["ornate",50],
	["mackerel",250],
	["tuna",1200],
	["mullet",300],
	["catshark",750],
	["water",10],
	["turtle",15000],
	["turtlesoup",1500],
	["donuts",70],
	["coffee",10],
	["tbacon",75],
	["lockpick",500],
	["pickaxe",1200],
	["redgull",1000],
	["fuelF",850],
	["peach",70],
	["spikeStrip",2500],
	["vrepairkit",285], //##49
	["vfirstaidkit",164], //##53
	["box", 750],
	//MARKET BUY SYSTEM abgeschaltet
	////BUY-Einträge werden von MARKET überschrieben!
	["heroinu",1000],
	["heroinp",7800],
	["oilp",4000],
	["marijuana",5700],
	["cocaine",1500],
	["cocainep",9800],
	["diamond",2000],
	["diamondc",6000],
	["iron_r",2400],
	["copper_r",1500],
	["salt_r",2500],
	["glass",2100],
	["cement",1800],
	["gold",1500], //##11 ##12 ##10
	["goldr",4300],
	["silver",1000],
	["silverr",3800],
	["coal",250],
	["coalr",750],
	["froglsd",3200]
];
//__CONST__(buy_array,buy_array);
//##69

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["Binocular",50],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30],
	["B_9x21_Ball",50]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	/*["B_Quadbike_01_F",500],
	["C_Hatchback_01_F",2500],
	["C_Hatchback_01_sport_F",5000],
	["C_Offroad_01_F",7500],
	["B_G_Offroad_01_F",7500],
	["B_G_Offroad_01_armed_F",250000],
	["C_SUV_01_F",7500],
	["C_Van_01_transport_F",7500],
	["C_Van_01_box_F",10000],
	["I_Truck_02_transport_F",10000],
	["I_Truck_02_covered_F",15000],
	["B_Truck_01_transport_F",10000],
	["B_Truck_01_covered_F",15000],
	["O_Truck_03_transport_F",10000],
	["O_Truck_03_covered_F",15000],
	["I_MRAP_03_F",20000],
	["B_MRAP_01_F",10000],
	["O_MRAP_02_F",20000],
	["B_MRAP_01_hmg_F",20000],
	["B_Heli_Light_01_F",10000],
	["O_Heli_Light_02_unarmed_F",20000],
	["I_Heli_Transport_02_F",25000],
	["B_Heli_Transport_01_F",250000],
	["I_Heli_light_03_unarmed_F",2500],
	["I_Heli_light_03_F",5000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",2500],
	["C_Boat_Civil_01_police_F",5000],
	["B_Boat_Armed_01_minigun_F",25000],
	["B_SDV_01_F",30000]*/
];
//__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	/*["B_Quadbike_01_F",1000],
	["C_Hatchback_01_F",3000],
	["C_Hatchback_01_sport_F",7500],
	["C_Offroad_01_F",10000],
	["B_G_Offroad_01_F",15000],
	["B_G_Offroad_01_armed_F",1000000],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",10000],
	["C_Van_01_box_F",10000],
	["I_Truck_02_transport_F",30000],
	["I_Truck_02_covered_F",40000],
	["B_Truck_01_transport_F",50000],
	["B_Truck_01_covered_F",100000],
	["O_Truck_03_transport_F",50000],
	["O_Truck_03_covered_F",100000],
	["I_MRAP_03_F",100000],
	["B_MRAP_01_F",10000],
	["O_MRAP_02_F",100000],
	["B_MRAP_01_hmg_F",100000],
	["B_Heli_Light_01_F",100000],
	["O_Heli_Light_02_unarmed_F",200000],
	["I_Heli_Transport_02_F",300000],
	["B_Heli_Transport_01_F",2500000],
	["I_Heli_light_03_unarmed_F",80000],
	["I_Heli_light_03_F",400000],
	["C_Rubberboat",2000],
	["C_Boat_Civil_01_F",2000],
	["C_Boat_Civil_01_police_F",5000],
	["B_Boat_Armed_01_minigun_F",15000],
	["B_SDV_01_F",10000]*/
];
//__CONST__(life_garage_sell,life_garage_sell);

/////////##69
//Update VITEM CONFIG
[] call life_fnc_vitemconfig;
[] call life_fnc_uitemconfig; //unified item configuration

__CONST__(buy_array,buy_array);
__CONST__(sell_array,sell_array);
//##69

//##73
//[] call life_fnc_marketconfiguration;


//Centralize vehicle config
[] call life_fnc_vehiclesCentralized;

__CONST__(life_garage_prices,life_garage_prices);
__CONST__(life_garage_sell,life_garage_sell);

//for events
[] call life_fnc_eventConfig;

//##19
[] call life_fnc_permconfiguration;

