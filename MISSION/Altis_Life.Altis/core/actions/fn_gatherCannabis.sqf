/*
	File: fn_gatherCannabis.sqf
	
	Description:
	Gathers cannabis?
*/
private["_sum"];
_sum = ["cannabis",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	
	//##87
	//player say3D "harvest";
	[player,"harvest"] call life_fnc_globalSound;
	
	titleText["Sammle Hanf...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"cannabis",1] call life_fnc_handleInv)) then
	{
		titleText["Du hast etwas Hanf gesammelt.","PLAIN"];
	};
};

life_action_inUse = false;