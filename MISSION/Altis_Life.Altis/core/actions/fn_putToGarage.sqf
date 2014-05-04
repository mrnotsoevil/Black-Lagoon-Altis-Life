/*
	Garage
*/
//CONST
private["_vehicle","_islocked","_sec"];

if( life_cash < 10000 && life_atmcash < 10000) exitWith 
{	
	hint parseText "<t color='#ff0000'>Du hast nicht das nötige Geld ($10000)</t>";
};


//Action

_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith { hint "Ungültiges Fahrzeug."; };
if(player distance cursorTarget > 10) exitWith { };


//Check if vehicle is opened
_islocked = locked _vehicle;

if((alive _vehicle) && _islocked == 2) exitWith { hint parseText "<t color='#ff0000'>Du musst das Fahrzeug aufschließen, um es abschleppen zu lassen.</t>"; };



if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{	
	
	
	life_action_inUse = true;
	
	
	
	//wait time
	hint "Bleibe in der Nähe des Fahrzeugs.";
	
	_sec = 30 * 10;
	
	for "_i" from 0 to 30 do
	{
		sleep 10;
		
		_sec = _sec - 10;
		
		if(player distance _vehicle > 10) exitWith {hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; life_action_inUse = false;};
		if(!alive player) exitWith {life_action_inUse = false;};
		
		//if( _i % 5 == 0) then
		//{
			hintSilent format["Der Abschleppwagen kommt ... Noch ca. %1 Sekunden\n\nBleibe in der Nähe des Fahrzeugs", _sec];
		//};
	};
	
	if(!life_action_inUse) exitWith { hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; }; //canceled
	
	hint "Der Abschleppwagen ist gleich da ...\n\nBleibe in der Nähe des Fahrzeugs";
	
	sleep 5;	
	
	
	//Last check
	if(player distance _vehicle > 10) exitWith {hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};
	
	//Money
	//Remove money
	if( life_cash >= 10000 ) then
	{
			//Use main
			life_cash = life_cash - 10000;
	}
	else
	{
			//Use ATM
		if(life_atmcash >= 10000) then
		{
			life_atmcash = life_atmcash - 10000;
		};
	};
	
	//Store vehicle
	//[[_vehicle,true,player],"STS_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	
	hint parseText "<t color='#00ff00'>Der Wagen wurde angeschleppt und befindet sich nun wieder in der Garage.</t>";
};


life_action_inUse = false;