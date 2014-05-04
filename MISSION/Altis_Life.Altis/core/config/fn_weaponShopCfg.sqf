#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	//////////////////////Gas shop
	case "gas":
	{
		["Tankstelle",
			[
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["Itemwatch",nil,100],
				["ItemCompass",nil,50],
				["ItemMap",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	////////////////////// Medikit-Shop
	case "medical":
	{
		["Medizinische Ausrüstung",
			[				
				["FirstAidKit",nil,150]/*,
				["Medikit",nil,2000]*/
			]
		];
	};
	
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","SDAR",10000],
						["30Rnd_556x45_Stanag_Tracer_Red","SDAR Gummigeschoss 556x45",180],
						//["30Rnd_556x45_Stanag","SDAR Magazin 556x45",250],
						["hgun_P07_snds_F","Taser Pistole",5000],
						["16Rnd_9x21_Mag","Taser Magazin 9x21",50], 						
						["hgun_P07_F",nil,2500],
						["16Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemMap",nil,50],
						["ItemGPS",nil,200],
						["ToolKit",nil,250],
						/*["FirstAidKit",nil,150],
						["Medikit",nil,1000],*/
						["NVGoggles",nil,2000],
						["B_UAV_01_F",nil,100000],
						["B_UAV_01_backpack_F",nil,50000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Cop!"};
			case (__GETC__(life_coplevel) < 3): {"Du hast nicht den benötigten Rang!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						//SDAR with UW ammo
						["arifle_sdar_F","SDAR",10000],
						["30Rnd_556x45_Stanag","SDAR Magazin 556x45",250], //SDAR scharfe Muni
						["20Rnd_556x45_UW_mag","Underwater SDAR Magazin 556x45",200],
						["arifle_MXC_Black_F",nil,10000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer","65x39 Gummigeschoss",500],
						["SMG_02_F",nil,7500],
						["muzzle_snds_L",nil,2500],
						["30Rnd_9x21_Mag",nil,250],
						["SMG_01_F",nil,7500],
						["muzzle_snds_acp",nil,2500],
						["30Rnd_45ACP_Mag_SMG_01",nil,250],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 Gummigeschoss",250],
						["hgun_PDW2000_F",nil,7500],
						["muzzle_snds_L",nil,2500],
						["30Rnd_9x21_Mag",nil,250],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["MiniGrenade",nil,2500]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Cop!"};
			case (__GETC__(life_coplevel) < 5): {"Du hast nicht den benötigten Rang!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["hgun_Pistol_heavy_01_F",nil,5000],
						["muzzle_snds_acp",nil,2500],
						["11Rnd_45ACP_Mag",nil,200],
						["optic_MRD",nil,2000],
						["arifle_MX_Black_F",nil,15000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer","65x39 Gummigeschoss",500],
						["arifle_MX_SW_Black_F",nil,75000],
						["muzzle_snds_H_MG",nil,5000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["100Rnd_65x39_caseless_mag_Tracer","65x39 Gummigeschoss",2000],
						["arifle_MXM_Black_F",nil,60000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer","65x39 Gummigeschoss",500],
						["srifle_EBR_F",nil,50000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,2500],
						["launch_B_Titan_F",nil,85000],
						["Titan_AA",nil,10000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000],
						["MiniGrenade",nil,2500],
						["HandGrenade",nil,5000]						
					]
				];
			};
		};
	};
	
	//##98
	case "cop_sniper":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Cop!"};
			case (!license_cop_sniper): {"Du bist kein Sniper!"};
			default
			{
				["Altis Sniper Shop",
					[
						["srifle_LRR_F",nil,80000],
						["7Rnd_408_Mag",nil,2000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000]					
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Cop!"};
			case (!license_civ_rebel): {"Du hast keine Rebellentlizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["hgun_Pistol_heavy_02_F",nil,5000],
						["optic_Yorris",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,250],
						["hgun_PDW2000_F",nil,10000],
						["30Rnd_9x21_Mag",nil,500],
						["SMG_01_F",nil,10000],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["SMG_02_F",nil,10000],
						["30Rnd_9x21_Mag",nil,500],
						["arifle_SDAR_F",nil,50000],
						["30Rnd_556x45_Stanag",nil,1000],
						["20Rnd_556x45_UW_mag",nil,1000],
						["arifle_Katiba_C_F",nil,70000],
						["arifle_Katiba_F",nil,80000],
						["30Rnd_65x39_caseless_green",nil,1000],
						["arifle_Mk20C_F",nil,70000],
						["arifle_Mk20C_plain_F",nil,70000],
						["arifle_Mk20_F",nil,80000],
						["arifle_Mk20_plain_F",nil,80000],
						["30Rnd_556x45_Stanag",nil,1000],
						["srifle_DMR_01_F",nil,100000],
						["10Rnd_762x51_Mag",nil,1000],
						["srifle_EBR_F",nil,120000],
						["20Rnd_762x51_Mag",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["optic_Aco",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco_smg",nil,2500],
						["optic_ACO_grn_smg",nil,2500],
						["optic_Holosight",nil,3000],
						["optic_Holosight_smg",nil,3000],
						["optic_Hamr",nil,5000],
						["optic_MRCO",nil,6000],
						["optic_Arco",nil,8000],
						["optic_DMS",nil,10000],
						["MiniGrenade",nil,20000],
						["HandGrenade",nil,25000],
						["SatchelCharge_Remote_Mag",nil,1500000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Cop!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Pistol_heavy_02_F",nil,28000],
						["optic_Yorris",nil,2500],
						["6Rnd_45ACP_Cylinder",nil,250],
						["hgun_P07_F",nil,20000],
						["16Rnd_9x21_Mag",nil,250],
						["30Rnd_9x21_Mag",nil,500],
						["hgun_Rook40_F",nil,10000],
						["16Rnd_9x21_Mag",nil,250],
						["30Rnd_9x21_Mag",nil,500],
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,250],
						["hgun_PDW2000_F",nil,40000],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F",nil,40000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["SMG_02_F",nil,40000],
						["30Rnd_9x21_Mag",nil,1000],
						["optic_Aco",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco_smg",nil,2500],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,5000]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			case (__GETC__(life_donator) >= 1):
			{
				["Black Lagoon Donator Shop",
					[
						["hgun_Pistol_heavy_02_F",nil,4000],
						["optic_Yorris",nil,5000],
						["6Rnd_45ACP_Cylinder",nil,100],
						["hgun_PDW2000_F",nil,8000],
						["30Rnd_9x21_Mag",nil,250],
						["SMG_01_F",nil,8000],
						["30Rnd_45ACP_Mag_SMG_01",nil,250],
						["SMG_02_F",nil,8000],
						["30Rnd_9x21_Mag",nil,250],
						["arifle_SDAR_F",nil,40000],
						["30Rnd_556x45_Stanag",nil,500],
						["20Rnd_556x45_UW_mag",nil,500],
						["arifle_Katiba_C_F",nil,60000],
						["arifle_Katiba_F",nil,70000],
						["30Rnd_65x39_caseless_green",nil,500],
						["arifle_Mk20C_F",nil,60000],
						["arifle_Mk20C_plain_F",nil,60000],
						["arifle_Mk20_F",nil,70000],
						["arifle_Mk20_plain_F",nil,70000],
						["30Rnd_556x45_Stanag",nil,500],
						["srifle_DMR_01_F",nil,90000],
						["10Rnd_762x51_Mag",nil,500],
						["srifle_EBR_F",nil,100000],
						["20Rnd_762x51_Mag",nil,500],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Aco_smg",nil,2000],
						["optic_ACO_grn_smg",nil,2000],
						["optic_Holosight",nil,2500],
						["optic_Holosight_smg",nil,2500],
						["optic_Hamr",nil,3000],
						["optic_MRCO",nil,4000],
						["optic_Arco",nil,5000],
						["optic_DMS",nil,9000],
						["MiniGrenade",nil,15000],
						["HandGrenade",nil,20000],
						["SatchelCharge_Remote_Mag",nil,1400000]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,200],
				["Rangefinder",nil,5000],
				["ItemGPS",nil,250],
				["ToolKit",nil,500],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	case "event":
	{
		if( [] call life_fnc_playerInEvent ) then
		{
			["*** Event ***",
					[						
						["hgun_P07_snds_F","Taser Pistole",1],
						["16Rnd_9x21_Mag","Taser Magazin 9x21",1]
						/*["hgun_P07_F",nil,2500],
						["16Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemMap",nil,50],
						["ItemGPS",nil,200],
						["ToolKit",nil,250],						
						["NVGoggles",nil,2000],
						["B_UAV_01_F",nil,100000],
						["B_UAV_01_backpack_F",nil,50000]*/
					]
				];
		}
		else
		{
			hint "Du bist kein Teilnehmer des Events!";
			[];
		};
	};
};
