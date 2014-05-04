/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP", "_sound"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_sound = "";

_itemInfo = switch (_type) do
{
	case "oil": 
	{
		_sound="processoil"; 
		["oilu","oilp",1200,"Processing Oil"];
	};
	case "diamond":
	{
		_sound="diamondcutting"; 
		["diamond","diamondc",1350,"Schleife Diamant"]
	};
	case "heroin":
	{
		_sound="drugcooking"; 
		["heroinu","heroinp",2100,"Verarbeite Schlafmohn"]
	};
	case "copper":
	{
		_sound="smelting"; 
		["copperore","copper_r",750,"Schmelze Kupfer"]
	};
	case "iron":
	{
		_sound="smelting"; 
		["ironore","iron_r",1120,"Schmelze Eisen"]
	};
	case "sand":
	{
		_sound="smelting";
		["sand","glass",650,"Verarbeite Sand"]
	};
	case "salt":
	{
		_sound="saltprocess"; 
		["salt","salt_r",450,"Verarbeite Salz"]
	};
	case "cocaine":
	{
		_sound="drugcooking"; 
		["cocaine","cocainep",1500,"Verarbeite Kokablätter"]
	};
	case "marijuana":
	{
		_sound="drugcooking"; 
		["cannabis","marijuana",500,"Verarbeite Hanf"]
	};
	case "cement":
	{
		_sound="cementmix"; 
		["rock","cement",350,"Brenne Zement"]
	};
	case "gold":
	{
		_sound="smelting"; 
		["gold","goldr",1350,"Schmelze Gold"]
	}; //##11
	case "silver":
	{
		_sound="smelting"; 
		["silver","silverr",1050,"Schmelze Silber"]
	}; //##12
	case "coal":
	{
		_sound="smelting"; 
		["coal","coalr",350,"Verarbeite Kohle"]
	}; //##10
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	//Trigger sounds here
	if(_sound != "") then { _vendor say3D _sound };

	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Du darfst dich beim herstellen nicht weiter als 10m entfernen."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Du hast %1 %2 hergestellt.",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_cash < _cost) exitWith {hint format["Du benötigt $%1, um etwas ohne Fähigkeit weiterzuverarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	//Trigger sounds here
	if(_sound != "") then { _vendor say3D _sound };
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Du darfst dich beim herstellen nicht weiter als 10m entfernen."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["Du benötigst $%1, um etwas ohne Fähigkeit weiterzuverarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Du hast %1 %2 hergestellt ($%3)",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};	