/*
	File: fn_gatherPeaches.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["peach",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Sammle Pfirsiche...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"peach",_sum] call life_fnc_handleInv)) then
	{
		//player say3D "take"; //##87
		[player,"take"] call life_fnc_globalSound;
		titleText[format["Du hast %1 Pfirsiche gesammelt.",_sum],"PLAIN"];
	};
}
	else
{
	hint "Inventar voll.";
};

life_action_inUse = false;