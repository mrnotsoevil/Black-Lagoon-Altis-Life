/*
*
*	BOOL life_fnc_houseBelongsToPlayer [EXDATA ...]
*
*/

private ["_exdata", "_return"];
_exdata = _this;

if((count _exdata) == 1) then
{
	_exdata = _exdata select 0;
};

_return = false;
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call life_fnc_houseExtractDataVal) == getPlayerUID player) then //if player not owner
	{
		_return = true;
	};
};

_return;