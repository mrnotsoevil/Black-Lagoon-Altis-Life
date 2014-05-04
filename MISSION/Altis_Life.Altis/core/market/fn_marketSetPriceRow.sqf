/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];

*/

private["_shortname","_price","_send"];

_shortname = _this select 0;
_price = _this select 1;
_send = [_this,2,true] call BIS_fnc_param;

{
	if((_x select 0) == _shortname) exitWith
	{
		life_market_prices set [_forEachIndex, _price];
	};
}
foreach life_market_prices;

if(_send) then {publicVariable "life_market_prices";};