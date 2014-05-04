/*
	File: fn_gatherHeroin.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers heroin?
*/
private["_sum"];
_sum = ["heroinu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	
	//##87
	//player say3D "harvest";
	[player,"harvest"] call life_fnc_globalSound;
	
	titleText["Sammle Heroin ...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"heroinu",1] call life_fnc_handleInv)) then
	{
		titleText["Du hast etwas Heroin gesammelt.","PLAIN"];
	};
};

life_action_inUse = false;