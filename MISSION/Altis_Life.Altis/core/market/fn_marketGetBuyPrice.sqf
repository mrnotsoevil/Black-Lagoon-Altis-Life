/*

	Get market price, otherwise returns -1
	
	INT getPrice [SHORTNAME]

*/

private["_shortname","_ret"];

_shortname = _this select 0;
_ret = -1;

{
	if( (_x select 0) == _shortname) then
	{
		_ret = _x select 1;
		_ret = _ret * 2;
	};
}
foreach life_market_prices;

_ret;