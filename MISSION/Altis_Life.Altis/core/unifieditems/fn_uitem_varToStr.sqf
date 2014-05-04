/*

	Convert VITEMLONGNAME to READABLE NAME

*/

private["_longname", "_ret"];

_longname = _this select 0;
_ret = "NULL";

{
	if((_x select 0) == _longname) then
	{
		_ret = _x select 1;
	};
}
foreach life_uitems_varToStr;

_ret;