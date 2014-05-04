/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Du hast bereits die Synchronisationsoption genutzt, du kannst diese nur aller 5 Minuten benutzen.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Weil einige Cheater das BIS MP Framework manipulieren, haben sie dich dabei gestoppt Atlis Life zu genießen.\n\nDu kannst es in einer Minute nochmal versuchen, falls du denkst es ist ein Fehler.";};

[] call life_fnc_sessionUpdate;
hint "Synchronisiere Spielerdaten.\n\nBitte warte 20 Sekunden bevor du die Verbindung trennst.";
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
	