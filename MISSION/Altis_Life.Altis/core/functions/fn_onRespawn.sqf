/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!isNull _corpse) then{deleteVehicle _corpse;};

hideBody _corpse;
deleteVehicle _corpse;
//_handle = [] spawn life_fnc_setupActions;
//waitUntil {scriptDone _handle};

switch(playerSide) do
{
	case west: 
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		[] spawn life_fnc_loadGear;
	};
	
	case civilian:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		/*if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};*/
		//[false] spawn life_fnc_civLoadGear;
		[] call life_fnc_civLoadGear; //update civ gear 
	};
};

if(life_is_arrested) then
{
	hint "Du hast versucht im Gefängnis ein Suizid zu begehen, du wirst nun eine längere Zeit hinter Gittern bleiben müssen.";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
}
	else
{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	//[] call life_fnc_spawnMenu;
	//HOUSE RESPAWN
	[[player], "HOUSE_fnc_requestSpawnMenu", false, false] spawn life_fnc_MP;
	
	hint "Frage Datenbank an ...";
	
	waitUntil{!isNull (findDisplay 38500)}; //ADDED: HOUSE_RESPAWN
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	
	hint "Spieler gespawnt!";
};

_unit addRating 100000;

[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];


[1,true] call life_fnc_sessionHandle; //Update session