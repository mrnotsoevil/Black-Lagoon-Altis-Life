/*
	File: fn_CatchFrogAction.sqf
	Author: [KNG]MOGGY , Killernetworkgaming.com
	
	Description:
	Gathers frogs!!!
*/
private["_sum","_count"];

if(life_action_in_use) exitWith {};

_count = [1,5] call life_fnc_randomRound;
_sum = ["frog",_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Sammle Frösche ...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"frog",_sum] call life_fnc_handleInv)) then
	{
		//player say3D "catchfrog";
		[player,"catchfrog"] call life_fnc_globalSound;
		titleText[format["Du hast %1 Frösche gefangen.",_sum],"PLAIN"];		
	};
}
	else
{
	hint "Inventar voll.";
};

life_action_in_use = false;