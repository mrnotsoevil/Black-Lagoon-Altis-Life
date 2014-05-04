/*

	Rounded random
	
	INT roundRandom [min, max];


*/

private["_min", "_max", "_ret"];

_min = _this select 0;
_max = _this select 1;

_ret = _min + random (_max - _min);
_ret = round _ret;

_ret;