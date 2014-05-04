/*
* execHouseMenu [HOUSE_NAME , ARGS, DATA]
*
*/

private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_house_price", "_house_price_sell", "_isaccessonly","_buyable","_donator"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

//hint _house_data;
hintSilent "Compiling exdata";
_house_data = call compile format["%1", _house_data]; //compile data

//////////////////Parse data
hintSilent "Getting exdata";
_exdata = _house_data call life_fnc_houseExtractData;
hintSilent "Exdata parsed";

if (count _exdata == 0) exitWith { hint "Konnte Haus nicht laden."; };

//Set player variable house_current_exdata
missionNameSpace setVariable ["house_current_exdata", _exdata];

_house_name =  [_exdata, "name"] call life_fnc_houseExtractDataVal; //TO BE SAFE

//////////////////TODO
//Check if house belongs to player

diag_log format [ "%1 is trying to access %2 ...", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];

_canview = true;
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call life_fnc_houseExtractDataVal) != getPlayerUID player) then //if player not owner
	{
		_canview = false;
	};
};


/////////////////////// Access only 
//
_isaccessonly = !(_exdata call life_fnc_houseBelongsToPlayer);

if(_exdata call life_fnc_houseCanAccess) then {_canview = true;}; //if can access, set to true
//
///////////////////////

///////////////////////
//Other vars

_buyable =  [_exdata, "buyable"] call life_fnc_houseExtractDataVal; //TO BE SAFE
_donator = [_exdata, "donator"] call life_fnc_houseExtractDataVal;

////////////////////////


if(!_canview) exitWith
{
	hint "Das Haus gehort dir nicht!";
	diag_log format [ "%1 tried to access to %2, not belonging to player", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];
};

if( [_house_name] call life_fnc_houseIsInuse ) exitWith
{
	hint "Jemand anderes greift bereits auf das Haus zu!";
};



//////////////////Create Dialog
if(!dialog) then
{
	if(!(createDialog "house_houseDialog")) exitWith {};
};
disableSerialization;

_display = findDisplay 38400;
if(isNull _display) exitWith {};


//////////////////Set Dialog entries
//Call db entries
_house_price = ([_exdata, "price"] call life_fnc_houseExtractDataVal);
_house_price_sell = ([_exdata, "price_sell"] call life_fnc_houseExtractDataVal);


//Update UI to state of OWNED
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned => Player is owner! NOT, disable if only access
{
	(_display displayCtrl 2401) ctrlEnable false; //Disable buy
	(_display displayCtrl 2403) ctrlEnable true; //Enable parking
	(_display displayCtrl 2404) ctrlEnable true; //Enable unparking
	(_display displayCtrl 2405) ctrlEnable true; //Enable House Key Menu
	
	if(!_buyable) then
	{
		(_display displayCtrl 2402) ctrlEnable false; //Disable sell
	};
	
	//Set new text
	if(!_isaccessonly) then 
	{ 
		(_display displayCtrl 1101) ctrlSetStructuredText parseText "<t size='1.1'>Willkommen zu Hause!</t>"; 
	}
	else 
	{ 
		(_display displayCtrl 1101) ctrlSetStructuredText parseText format["<t size='1.1'>Willkommen im Haus von %1!</t>", [_exdata, "ownername"] call life_fnc_houseExtractDataVal ]; 
	};
	
	
	
	//Update price
	if(!_buyable) then
	{
		(_display displayCtrl 1102) ctrlSetStructuredText parseText "<t size='2' align='center'>Unverkäuflich</t>";
	}
	else
	{
		(_display displayCtrl 1102) ctrlSetStructuredText parseText format ["<t size='1.6' align='center'>Wert: $%1</t>", [_house_price_sell] call life_fnc_numberText]; //use numbertext here to prevent evil shit
	};
	
	//Set sell button
	if(!_isaccessonly) then 
	{ 
		(_display displayCtrl 2402) buttonSetAction "[] spawn life_fnc_sellHouse; closeDialog 0;"; 
	}
	else
	{
		(_display displayCtrl 2402) ctrlEnable false; //Disable sell
	};
	
	//Set park and unpark
	(_display displayCtrl 2403) buttonSetAction "[] spawn life_fnc_houseGarage_Park; closeDialog 0;";
	(_display displayCtrl 2404) buttonSetAction "[] spawn life_fnc_houseGarage_Open; closeDialog 0;";
	
	//Set open key menu
	(_display displayCtrl 2405) buttonSetAction "[] spawn life_fnc_houseOpenKeyDialog; closeDialog 0;";
	
	//donator stuff
	if(_donator) then
	{
		(_display displayCtrl 2406) ctrlEnable true;
		(_display displayCtrl 2406) buttonSetAction "[] spawn life_fnc_houseAirGarage_Open; closeDialog 0;";
		
		systemChat "Haus ist ein Donator-Haus. Wenn du ein Donator bist, kannst du erweiterte Features nutzen!";
	}
	else
	{
		(_display displayCtrl 2406) ctrlEnable false;
	};
	
}
else
{
	if(!_buyable) then
	{
		(_display displayCtrl 2401) ctrlEnable false; //Disable buy
	};

	(_display displayCtrl 2402) ctrlEnable false; //Disable sell
	(_display displayCtrl 2403) ctrlEnable false; //Disable parking
	(_display displayCtrl 2404) ctrlEnable false; //Disable unparking
	(_display displayCtrl 2405) ctrlEnable true; //Disable House Key Menu
	
	//Set button action
	//(_display displayCtrl 2401) buttonSetAction format ["[""%1"", %2] spawn life_fnc_buyHouse; closeDialog 0;", _house_name];
	(_display displayCtrl 2401) buttonSetAction "[] spawn life_fnc_buyHouse; closeDialog 0;";
	
	//Update price
	if(!_buyable) then
	{
		(_display displayCtrl 1102) ctrlSetStructuredText parseText "<t size='2' align='center'>Unverkäuflich</t>";
	}
	else
	{
		(_display displayCtrl 1102) ctrlSetStructuredText parseText format ["<t size='2' align='center'>Wert: $%1</t>", [_house_price] call life_fnc_numberText];
	};
	
};

/*hint "DEBUG: ENABLE BUY";
(_display displayCtrl 2401) ctrlEnable true; //Disable buy
(_display displayCtrl 2401) buttonSetAction "[] spawn life_fnc_buyHouse; closeDialog 0;";*/

hint format ["Fur Supportzwecke: Haus-Name: %1", _house_name];

/*sleep 20;

hint "Wegen Inaktivitat geschlossen.";
closeDialog 0;*/

//!IMP set use variable
[_house_name, true] call life_fnc_houseSetInuse;

waitUntil{isNull (findDisplay 38400)}; //Wait until done
//!IMP set use variable
[_house_name, false] call life_fnc_houseSetInuse;