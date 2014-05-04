/*

	Convert VITEMLONGNAME to READABLE NAME

*/

private["_longname", "_ret"];

_longname = _this select 0;
_ret = "";

{
	if((_x select 0) == _longname) then
	{
		_ret = _x select 1;
	};
}
foreach life_vitems_varToStr;

_ret;