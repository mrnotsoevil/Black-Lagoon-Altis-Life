/**
*	addMoney(NUMBER value)
*
*/

private ["_money"];

if((call life_adminlevel) < 1) exitWith {};

_money = _this select 0;

if(_money <= 0) exitWith
{
	hint "Fehlerhafter Geldbetrag fn_adminAddMoney";
};

//Give money
life_cash = life_cash + _money;

//Hint + Infos
hint format["Du hast $%1 ercheatet.", _money];
[[0,format["ADMIN: %1 hat sich $%2 gegeben.",name player, _money]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

//Additional info
sleep 2;

hintSilent format["Aktueller Geldbetrag: $%1", [life_cash] call life_fnc_numberText];

