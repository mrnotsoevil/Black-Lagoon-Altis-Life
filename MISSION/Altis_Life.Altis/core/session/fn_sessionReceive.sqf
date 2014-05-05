#include <macro.h>
/*
	File: fn_sessionReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Received information from the server and sorts information and
	initializes the player, if no data is found it starts the session
	creation process.
*/
private["_session", "_isbanned", "_coplevel", "_perm_coplevel"];
_session = _this;
diag_log format["CLIENT: %1 :: %2", typeName _session,_session];
life_session_tries = life_session_tries + 1;
if(life_session_tries > 3) exitWith {cutText["Verbindung zum Server kann nicht hergestellt werden. Du hast die maximale Anzahl von 3 Versuchen erreicht. Verbinde bitte neu!","BLACK FADED"];0 cutFadeOut 9999999;};
cutText["Erhalte Informationen von Server...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling types
if(isNil "_session") exitWith {[] spawn life_fnc_sessionCreate;};
if(typeName _session == "STRING") exitWith {cutText[format["%1",_session],"BLACK FADED"];0 cutFadeOut 9999999;};
if(count _session == 0) exitWith {[] spawn life_fnc_sessionCreate;};
if(_session select 0 == "Error") exitWith {[] spawn life_fnc_sessionCreate;};

/*
	All data passed from the server is a string, you will need to format 
	it accordingly when adding additional stuff, if it is a number/scalar
	you will use parseNumber and everything else you need to compile.
	
	*	SCALAR/NUMBER: parseNumber(_session select index)
	* 	STRING: (_session select index)
	*	ARRAY: (_session select index)
	*	ALL OTHER: call compile format["%1",(_session select index)];
*/


_isbanned = false;

switch (playerSide) do
{
	case west:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_cash = parseNumber(_session select 2);
		life_atmcash = parseNumber(_session select 3);
		//__CONST__(life_coplevel,parseNumber(_session select 4)); //overridden by PERM coplevel
		if(count (_session select 5) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 5);
		};
		cop_gear = (_session select 6);
		__CONST__(life_adminlevel,parseNumber(_session select 7));
		life_blacklisted = call compile format["%1",(_session select 8)];
		[] spawn life_fnc_loadGear;
		//if(life_adminlevel > 0) then {[] execVM "core\client\aconfig.sqf";};
		__CONST__(life_donator,parseNumber(_session select 9));
		
		//Initialize inventory stuff ##43
		life__inventory = (_session select 10);
		
		life__inventory = call compile format["%1", life__inventory];
		
		_isbanned = (_session select 11);
		
		//##119 perms
		life_player_perms = (_session select 13);					
		life_player_perms = call compile format["%1", life_player_perms];
		
		//PERM coplevel
		_coplevel = parseNumber(_session select 4); //this is the MORE important DATABASE coplevel  - it ALWAYS overrides the PERM coplevel
		_perm_coplevel = ["cop"] call life_fnc_permLevel;
		
		if(_coplevel > 0) then
		{
			//use DB coplevel
			__CONST__(life_coplevel,_coplevel);
			systemChat "CopLevel loaded from DB";
		}
		else
		{
			//use PERM coplevel
			__CONST__(life_coplevel,_perm_coplevel);
			
			systemChat "CopLevel loaded from PERM";
		};
	};
	
	case civilian:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_cash = parseNumber(_session select 2);
		life_atmcash = parseNumber(_session select 3);
		if(count (_session select 4) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 4);
		};
		life_is_arrested = call compile format["%1",(_session select 5)];
		__CONST__(life_adminlevel,parseNumber(_session select 6));
		__CONST__(life_donator,parseNumber(_session select 7));
		civ_gear = (_session select 8);
		
		//systemChat format ["SESSION CIV-GEAR: %1", str (_session select 8)];
		
		[] spawn life_fnc_civLoadGear;
		__CONST__(life_coplevel,0);
		
		//Initialize inventory stuff ##43
		life__inventory = (_session select 9);					
		life__inventory = call compile format["%1", life__inventory];
		
		
		/////Load Cop-Civ-Gear from QUERY 10
		/*cop_gear = (_session select 10);
		[] spawn life_fnc_loadGear;*/
		_isbanned = (_session select 10);
		
		//##119 perms
		life_player_perms = (_session select 12);					
		life_player_perms = call compile format["%1", life_player_perms];
	};
};

if(_isbanned) exitWith 
{
	life__inventory = [];
	civ_gear = [];
	cop_gear = [];
	[[0,format["DBBAN >>> Gebannter Spieler '%1' wollte joinen <<<", name player]],"life_fnc_broadcast" /*,west,FALSE*/] call life_fnc_MP;
	cutText["Du wurdest von diesem Server gebannt! Bei Beschwerden TS: 62.104.20.197:10023","BLACK FADED"];0 cutFadeOut 9999999;
};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 750;};
	case 2: {life_paycheck = life_paycheck + 1500;};
	case 3: {life_paycheck = life_paycheck + 2000;};
};

if(isNil("life__inventory")) then
{
	hint "Inventar war leer!";
	sleep 2;
	life__inventory = [];
};

[] spawn life_fnc_appendInventory; //OK, spawn

//Check out all perms 
[true] call life_fnc_dynPermCheckout;

if((getPlayerUID player) != (_session select 0)) exitWith {[] spawn life_fnc_sessionCreate;}; //Since it didn't match create the session again?
cutText["Erhalte Informationen von Server und prüfe sie, du bist fast fertig.","BLACK FADED"];
0 cutFadeOut 9999999;
life_session_completed = true;