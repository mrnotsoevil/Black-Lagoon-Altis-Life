/*

	Convert VITEMSHORTNAME to WEIGHT

*/

private["_shortname", "_ret"];

_shortname = _this select 0;
_ret = 0;

{
	if((_x select 0) == _shortname) then
	{
		_ret = _x select 1;
	};
}
foreach life_vitems_weights;

_ret;