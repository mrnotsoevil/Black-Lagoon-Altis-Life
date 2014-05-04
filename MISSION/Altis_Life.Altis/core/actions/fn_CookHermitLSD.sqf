/*
	@Author: [KNG]MOGGY , Killernetworkgaming.com
*/
private ["_amount"];
_amount = life_inv_frog;
if (life_inv_frog <= 0) exitWith { hint "Du benötigst Frösche."; };

if (([false, "frog", _amount] call life_fnc_handleInv)) then {
	titleText["Koche LSD aus Fröschen ...", "PLAIN"];
	titleFadeOut 4.5;
	sleep 5;
	if (([true, "froglsd", _amount] call life_fnc_handleInv)) then 
	{
		//player say3D "drugcooking";
		[player,"drugcooking"] call life_fnc_globalSound;
		titleText [format ["Du hast %1 LSD gekocht.", _amount], "PLAIN"];
	};
};