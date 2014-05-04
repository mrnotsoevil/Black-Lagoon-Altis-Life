/*


	Konfig. f�r virtuelle Items


*/

private["_shortname", "_longname", "_price"];

hintSilent "Configuring UITEMS ...";

//Unified Items f�r leichteres Hinzuf�gen neuer Items

///////////////Main Config
life_uitems = [
	
	//Schema: UITEMNAME, Echter Name, Gewicht, <true/false> illegal?, buyprice*, sellprice*, illegaler wert, polizei-item (bool)
	// * -1 = nicht def.	
	//HINWEIS: UITEMNAME (1. Wert) KLEIN schreiben, keine LEERZEICHEN, m�glichst kurz
	
	//Output: life_uinv_NAME ||| uitem_NAME
	
	//M�bel f�r Hauserweiterungssystem
	["furniture_01", "Holzregal", 10, false, 54000, 14000, 0, false],
	["furniture_02", "Schrank", 20, false, 57000, 14000, 0, false],
	["furniture_03", "Korb", 5, false, 51000, 14000, 0, false],
	["furniture_04", "Metallregal", 15, false, 58000, 14000, 0, false],
	["furniture_05", "Schubladen", 15, false, 57000, 14000, 0, false],
	
	//##103
	["handcuffs", "Handschellen", 1, false, 500, 300, 250, true],
	
	//##106
	["bd_mk1_bleachweapon", "BD-MKI 'Fuel Killer'", 25, false, 800000, 600000, true],
	["bd_mk1_ammo", "MKI Polymerpatrone", 2, false, 10500, 8000, true],	
	["bd_mk2_microemp", "BD-MKII 'Electrostatic'", 28, false, 1100000, 700000, true],
	["bd_mk2_ammo", "MKII EMP-Emitter-Patrone", 4, false, 30000, 24000, true],
	
	//##110 
	["bomb", "Bombenweste", 20, true, 1500000, 800000, 500000, false],
	
	//EVENT
	["event_1", "Dildo (Event)", 1, false, 1, 1, 0, false],
	["event_2", "Kondom (Event)", 1, false, 1, 1, 0, false],
	["event_3", "Gleitcreme (Event)", 1, false, 1, 1, 0, false],
	["event_score", "Punkte (Event)", 0, false, 1, 1, 0, false],
	
	//ADAC
	["adac_toolkit", "ADAC-Werkzeugkasten", 15, false, 500, 400, 0, false],
	["adac_tow", "ADAC-Abschleppseil", 2, false, 250, 175, 0, false],
	["adac_paint", "Autolack (ADAC)", 5, false, 2000, 1500, 0, false],
	
	//Tokens für verschiedene Zwecke
	["token_donator", "Donatortoken", 0, false, 200, 150, 0, false],
	["token_rebel", "Rebellentoken", 0, false, 200, 150, 0, false],
	["token_police", "Polizeitoken", 0, false, 200, 150, 50, true],
	
	//Troll items
	["troll_taschentuch", "Tempo(R) Taschentuch", 0, false, 5, 3, 2, true],
	["troll_nuckel", "BornBaby(R) Nuckel", 0, false, 5, 3, 2, true],
	["troll_bitering", "BornBaby(R) Beissring", 0, false, 5, 3, 2, true],
	["troll_money", "$ Spielgeld $", 0, false, 1, 1, 0, false]
];

///////////////Generated Config (WIRD GENERIERT)

life_uitems_weights = []; //[SHORTNAME, WEIGHT] ...
life_uitems_varHandle = [];
life_uitems_varToStr = [];

///////////////Logik
{
	_longname = "life_uinv_" + (_x select 0); //Schema: life_vinv_<VITEMNAME>
	_shortname = "uitem_" + (_x select 0); //Schema: vitem_<VITEMNAME>

	//Create MAIN Items in configuration.sqf
	life_inv_items = life_inv_items + [_longname];
	//Init this var
	missionNamespace setVariable[_longname,0];
	
	//Create weight
	life_uitems_weights set [count life_uitems_weights, [_shortname, _x select 2] ];
	
	//Create varHandle shortname <-> longname
	life_uitems_varHandle set [count life_uitems_varHandle, [_shortname, _longname] ];
	
	//Create varToStr longname <-> Name
	life_uitems_varToStr set [count life_uitems_varToStr, [_longname, _x select 1] ];	
	
	//Add as police item if 
	if(_x select 7) then
	{
		life_police_only_items set [count life_police_only_items, _shortname]; //Police only items
		life_police_only_items_bounty set [count life_police_only_items_bounty, [_shortname, _x select 6]]; //Police only items
	};
	
	//Buy array
	_price = _x select 4;
	if(_price != -1) then
	{
		buy_array set [ count buy_array, [_shortname, _price] ];
	};
	
	//Sell array
	_price = _x select 5;
	if(_price != -1) then
	{
		sell_array set [ count sell_array, [_shortname, _price] ];
	};
	
	//Illegal value stuff
	if(_x select 3) then
	{
		_price = _x select 6;
		life_illegal_items set [count life_illegal_items, [_shortname, _price] ];
		life_illegal_item_shortnames set [ count life_illegal_item_shortnames, _shortname ];
	};
}
foreach life_uitems;

hintSilent "Configuring UITEMS ... DONE";
