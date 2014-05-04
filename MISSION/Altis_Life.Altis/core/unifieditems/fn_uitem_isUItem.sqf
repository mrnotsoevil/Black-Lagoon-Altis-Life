/*

	BOOLEAN returns if LONGNAME or SHORTNAME is VITEM

*/

private["_val", "_ret", "_shortname", "_longname"];

_val = _this select 0;
_ret = false;

{
	_shortname = _x select 0;
	_longname = _x select 1;

	if(_shortname == _val) then
	{
		_ret = true;
	};
	if(_longname == _val) then
	{
		_ret = true;
	};
}
foreach life_uitems_varHandle; //use varhandle

_ret;