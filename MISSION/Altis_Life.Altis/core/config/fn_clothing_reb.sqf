/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_resistanceLeader_F",nil,6000],
			["U_O_SpecopsUniform_ocamo",nil,10000],
			["U_O_CombatUniform_oucamo",nil,10000],
			["U_O_PilotCoveralls",nil,12000],
			["U_B_PilotCoveralls",nil,12000],
			["U_IG_leader","Guerilla Leader",15000],
			["U_I_OfficerUniform",nil,18000],
			["U_O_OfficerUniform_ocamo",nil,18000],
			["U_O_GhillieSuit",nil,50000],
			["U_B_GhillieSuit",nil,50000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Booniehat_dgtl",nil,2500],
			["H_MilCap_ocamo",nil,3000],
			["H_MilCap_mcamo",nil,3000],
			["H_Shemag_tan",nil,5000],
			["H_Shemag_olive",nil,5000],
			["H_ShemagOpen_khk",nil,5000],
			["H_Shemag_olive_hs",nil,5200],
			["H_HelmetIA",nil,10000],
			["H_HelmetIA_net",nil,10000],
			["H_HelmetLeaderO_ocamo",nil,10000],
			["H_HelmetLeaderO_oucamo",nil,10000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,25],
			["G_Sport_Blackred",nil,30],
			["G_Sport_Checkered",nil,30],
			["G_Sport_Blackyellow",nil,30],
			["G_Sport_BlackWhite",nil,30],
			["G_Squares",nil,40],
			["G_Aviator",nil,50],
			["G_Lowprofile",nil,50],
			["G_Combat",nil,100]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_khk",nil,2500],
			["V_BandollierB_cbr",nil,2500],
			["V_BandollierB_rgr",nil,2500],
			["V_BandollierB_blk",nil,2500],
			["V_Chestrig_khk",nil,5000],
			["V_Chestrig_rgr",nil,5000],
			["V_Chestrig_blk",nil,5000],
			["V_TacVest_khk",nil,10000],
			["V_TacVest_brn",nil,10000],
			["V_TacVest_oli",nil,10000],
			["V_TacVest_blk",nil,10000],
			["V_HarnessO_brn",nil,15000],
			["V_HarnessOGL_brn",nil,15000],
			["V_PlateCarrierIA1_dgtl",nil,20000],
			["V_PlateCarrierIAGL_dgtl",nil,25000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Kitbag_mcamo",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000],
			["B_Parachute",nil,10000]
		];
	};
};