/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1000}; //Drivers License cost
	case "boat": {10000}; //Boating license cost
	case "pilot": {100000}; //Pilot/air license cost
	case "gun": {100000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {20000}; //Cop Pilot License cost
	case "swat": {30000}; //Swat License cost
	case "cg": {5000}; //Coast guard license cost
	case "heroin": {30000}; //Heroin processing license cost
	case "marijuana": {20000}; //Marijuana processing license cost
	case "medmarijuana": {2000}; //Medical Marijuana processing license cost
	case "gang": {15000}; //Gang license cost
	case "rebel": {150000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {50000};
	case "salt": {10000};
	case "cocaine": {50000};
	case "sand": {7500};
	case "iron": {9000};
	case "copper": {8000};
	case "cement": {6000};
	//Home license
	case "home": {500000}; //##7
	case "home_cop": {500000}; //##7
	//res licences
	case "gold": {30000}; //##11
	case "silver": {25000}; //##12
	case "coal": {5000}; //##10
	//adac ##33
	case "adac": {999999999}; //##33 Unkäuflich setzen
	case "tazer": {3000000};
	
	case "event": {1};
	case "cop_event": {1};
	
	case "viewwanted": {999999999};
};