#include <macro.h>
/*	
	Description:
	Opens the Wanted add menu
*/

if( (call life_coplevel) < 1) exitWith
{
	hint "Du bist kein Cop!";
};

private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_add";

_display = findDisplay 2450;

lbClear 2100;

//fill list with online players
{
	if(_x != player /*&& (side _x) != west*/) then
	{		
		lbAdd [2100, name _x];
		lbSetData [(lbSize 2100)-1,getPlayerUID _x];
	};
} foreach playableUnits;

