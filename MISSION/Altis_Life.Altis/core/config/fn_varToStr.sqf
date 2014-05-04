/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var", "_ret"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Rohöl"};
	case "life_inv_oilp": {"Öl"};
	case "life_inv_heroinu": {"Schlafmohn"};
	case "life_inv_heroinp": {"Heroin"};
	case "life_inv_cannabis": {"Hanf"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Apfel"};
	case "life_inv_rabbit": {"Hasenfleisch"};
	case "life_inv_salema": {"Salema-Fleisch"};
	case "life_inv_ornate": {"Ornate-Fleisch"};
	case "life_inv_mackerel": {"Mackerel-Fleisch"};
	case "life_inv_tuna": {"Thunfisch-Fleisch"};
	case "life_inv_mullet": {"Mullet-Fleisch"};
	case "life_inv_catshark": {"Katzenhai-Fleisch"};
	case "life_inv_turtle": {"Schildkrötenfleisch"};
	case "life_inv_fishingpoles": {"Angelrute"};
	case "life_inv_water": {"Wasserflasche"};
	case "life_inv_coffee": {"Kaffee"};
	case "life_inv_turtlesoup": {"Schildkrötensuppe"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Leerer Benzinkanister"};
	case "life_inv_fuelF": {"Voller Benzinkanister"};
	case "life_inv_pickaxe": {"Spitzhacke"};
	case "life_inv_copperore": {"Kupfererz"};
	case "life_inv_ironore": {"Eisenerz"};
	case "life_inv_ironr": {"Eisenbarren"};
	case "life_inv_copperr": {"Kupferbarren"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Salz"};
	case "life_inv_saltr": {"Kochsalz"};
	case "life_inv_glass": {"Glas"};
	case "life_inv_diamond": {"Rohdiamant"};
	case "life_inv_diamondr": {"Diamant"};
	case "life_inv_tbacon": {"Tactical Bacon"};
	case "life_inv_redgull": {"RedGull"};
	case "life_inv_lockpick": {"Dietrich"};
	case "life_inv_peach": {"Pfirsich"};
	case "life_inv_coke": {"Kokablätter"};
	case "life_inv_cokep": {"Kokain"};
	case "life_inv_spikeStrip": {"Nagelband"};
	case "life_inv_rock": {"Steine"};
	case "life_inv_cement": {"Zementsack"};
	case "life_inv_goldbar": {"Gold Bar"};
	case "life_inv_silver" : {"Silbererz"}; //##10 ##11 ##12
	case "life_inv_silverr" : {"Silber"};
	case "life_inv_gold" : {"Golderz"};
	case "life_inv_goldr" : {"Gold"};
	case "life_inv_coal" : {"Unverarbeitete Kohle"};
	case "life_inv_coalr" : {"Kohle"};	
	
	//Illegal money ##38
	case "life_inv_illegalmoney": {"$ Schmutziges Geld"};
	
	//Vrerpairkit ##49
	case "life_inv_vrepairkit": {"Repairkit (Eingepackt)"};
	
	//VFirstaidkit ##53
	case "life_inv_vfirstaidkit": {"First-Aid Kit (Eingepackt)"};
	
	//##69 BOX
	case "life_inv_box": {"Kiste"};
	
	//License Block
	case "license_civ_driver": {"Führerschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_heroin": {"Fähigkeit: Heroin herstellen"};
	case "license_civ_gang": {"Gangmitgliedschaft"};
	case "license_civ_oil": {"Fähigkeit: Öl herstellen"};
	case "license_civ_dive": {"Taucherschein"};
	case "license_civ_boat": {"Bootschein"};
	case "license_civ_gun": {"Waffenschein"};
	case "license_cop_air": {"Pilotenschein"};
	case "license_cop_swat": {"Swat Lizenz"};
	case "license_cop_cg": {"Küstenwache"};
	case "license_civ_rebel": {"Rebellenmitgliedschaft"};
	case "license_civ_truck": {"LKW-Führerschein"};
	case "license_civ_diamond": {"Fähigkeit: Diamanten schleifen"};
	case "license_civ_copper": {"Fähigkeit: Kupfer schmelzen"};
	case "license_civ_iron": {"Fähigkeit: Eisen schmelzen"};
	case "license_civ_sand": {"Fähigkeit: Glas herstellen"};
	case "license_civ_salt": {"Fähigkeit: Kochsalz herstellen"};
	case "license_civ_coke": {"Fähigkeit: Kokain herstellen"};
	case "license_civ_marijuana": {"Fähigkeit: Marijuana herstellen"};
	case "license_civ_cement": {"Fähigkeit: Zement brennen"};
	
	
	case "license_civ_home": {"Eigentumsurkunde"};
	case "license_cop_home": {"Eigentumsurkunde"};
	case "license_civ_gold": {"Fähigkeit: Goldverarbeitung"}; //##11
	case "license_civ_silver": {"Fähigkeit: Silberverarbeitung"}; //##12
	case "license_civ_coal": {"Fähigkeit: Kohleverarbeitung"}; //##10
	
	case "license_civ_adac": {"ADAC-Lizenz"}; //##33
	
	case "license_cop_sniper": {"Sniper-Lizenz"};//##98
	
	case "license_civ_tazer": {"Tazer-Lizenz"};
	
	case "license_civ_event": {"Teilnahme an Event"}; //EVENT
	case "license_cop_event": {"Teilnahme an Event"}; //EVENT
	
	case "license_civ_viewwanted": {"Einsicht in Wantedliste"}; //WANTED
	
	//Frog Addon
	case "life_inv_frog": {"Frosch"};
	case "life_inv_froglsd": {"LSD"};
	case "life_inv_froglegs": {"Froschschenkel"};
	
	default //##69
	{
		_ret = [_var] call life_fnc_vitem_varToStr;
		
		if(_ret == "") then
		{
			_ret = [_var] call life_fnc_uitem_varToStr;
		};
		
		_ret;
	};
	
	
	
};
