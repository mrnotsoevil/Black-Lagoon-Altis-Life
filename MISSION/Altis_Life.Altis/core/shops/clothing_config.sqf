/*
	File: fn_clothingConfig.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for clothing shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Poloshirt_blue","Poloshirt Blau",250],
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",250],
			["U_C_Poloshirt_redwhite","Poloshirt Rot/Weiss",250],
			["U_C_Poloshirt_salmon","Poloshirt Salmon",250],
			["U_C_Poloshirt_stripped","Poloshirt Gestreift",250],
			["U_C_Poloshirt_tricolour","Poloshirt Dreifarbig",250],
			["U_IG_Guerilla2_2","Gruenes Hemd & weisse Hose",750],
			["U_IG_Guerilla2_1","Schwarzes Hemd & beche Hose",750],
			["U_IG_Guerilla3_1","Braune Jacke & Jeans",750],
			["U_IG_Guerilla2_3","Graues Hemd & gruene Hose",750],
			["U_C_HunterBody_grn","Beche Jacke & Jeans",1000],
			["U_OrestesBody","Gay Outfit",1100],
			["U_C_WorkerCoveralls","Mechaniker Outfit",1250]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",100],
			["H_Bandanna_surfer","Surfer Bandanna",100],
			["H_Bandanna_gry","Graues Bandanna",100],
			["H_Bandanna_cbr","Braunes Bandanna",100],
			["H_Bandanna_khk","Khaki Bandanna",100],
			["H_Bandanna_sgg","Sage Bandanna",100],
			["H_StrawHat",nil,150],
			["H_BandMask_blk",nil,200],
			["H_Booniehat_tan",nil,200],
			["H_Hat_blue",nil,300],
			["H_Hat_brown",nil,300],
			["H_Hat_checker",nil,300],
			["H_Hat_grey",nil,300],
			["H_Hat_tan",nil,300],
			["H_Cap_blu",nil,400],
			["H_Cap_grn",nil,400],
			["H_Cap_grn_BI",nil,400],
			["H_Cap_oli",nil,400],
			["H_Cap_red",nil,400],
			["H_Cap_tan",nil,400]
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
			["B_Carryall_khk",nil,5000]
		];
	};
};