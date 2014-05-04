/*

	Convert VITEMSHORTNAME <=> VITEMLONGNAME
	
	Mode 0 (=>)
	Mode 1 (<=)

*/

private["_input", "_ret", "_mode"];

_input = _this select 0;
_mode = _this select 1;


_ret = "";

if (_mode == 0) then //shortname => longname
{
	{
		if((_x select 0) == _input) exitWith
		{
			_ret = _x select 1;
		};
	}
	foreach life_vitems_varHandle;
}
else //longname => shortname
{
	{
    	if((_x select 1) == _input) exitWith
    	{
    		_ret = _x select 0;
    	};
    }
    foreach life_vitems_varHandle;
};

/*if(_ret == "") then
{
	systemChat format ["Invalid VITEM_VARHANDLE: %1", _input];
};*/

_ret;