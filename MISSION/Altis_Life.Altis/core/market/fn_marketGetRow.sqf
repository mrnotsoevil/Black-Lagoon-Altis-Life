/*

	[MARKET-ROW] marketGetModifiers [SHORTNAME];

*/

private["_ret","_shortname"];

_shortname = _this select 0;
_ret = [];

{
	if((_x select 0) == _shortname) exitWith
	{
		_ret = _x;
	};
}
foreach life_market_resources;

_ret;