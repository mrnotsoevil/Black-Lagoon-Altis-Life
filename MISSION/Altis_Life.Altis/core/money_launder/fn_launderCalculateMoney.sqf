/*
	
	Calculates money, you get from laundering

*/
private["_money", "_ret"];

_money = [_this, 0, 0] call BIS_fnc_param;

//default value
_ret = 0.95;

switch true do
{
	case (_money < 1500000): { _ret = 0.6; };
	case (_money < 4200000): { _ret = 0.7; };
	case (_money < 10000000): { _ret = 0.8; };
	case (_money < 15000000): { _ret = 0.9; };
};

_ret;