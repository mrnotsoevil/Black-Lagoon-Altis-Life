/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
	
	pickaxeUse [BOOL silent]
*/




if(dialog) then { closeDialog 0;};


private["_mine","_itemWeight","_diff","_itemName","_val","_silent","_endsound"];


_silent = [_this,0,false] call BIS_fnc_param; //default to not silent

_endsound = "";

switch (true) do
{
// + ##10 ##11 ##12
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "diamond_2") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1; _endsound="collectoil";};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1; _endsound="collectoil";};
	case (player distance (getMarkerPos "coal_1") < 40) : {_mine = "coal"; _val = 2;};
	case (player distance (getMarkerPos "coal_2") < 40) : {_mine = "coal"; _val = 2;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	case (player distance (getMarkerPos "silver_1") < 50): {_mine = "silver"; _val = 1;};	
	case (player distance (getMarkerPos "gold_1") < 50): {_mine = "gold"; _val = 1;};
	case (player distance (getMarkerPos "gold_2") < 50): {_mine = "gold"; _val = 1;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith 
{
	if(!_silent) then
	{
		hint "Du bist nicht in der Nähe einer Mine!"
	};
};
if(vehicle player != player) exitWith {hint "Du kannst innerhalb von deinem Auto nicht abbauen!";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll."};
life_action_inUse = true;

//player say3D "mining";
[player,"mining"] call life_fnc_globalSound;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %2 %1 abgebaut.",_itemName,_diff],"PLAIN"];
	
	if(_endsound != "") then
	{
		[player,_endsound] call life_fnc_globalSound;
	};
};

life_action_inUse = false;