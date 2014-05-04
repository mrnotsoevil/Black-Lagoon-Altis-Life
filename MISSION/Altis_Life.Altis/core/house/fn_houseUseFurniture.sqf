/*

	Uses a furniture item and tries to add it to a house

*/

private["_shortname","_setarr","_weighttoadd", "_cond"];

_shortname = _this select 0;
_weighttoadd = 10;

if( !(_shortname in ["uitem_furniture_01", "uitem_furniture_02", "uitem_furniture_03", "uitem_furniture_04", "uitem_furniture_05"]) ) exitWith {};
if(life_action_inUse) exitWith {};

hint "Bitte warten ...";

life_action_inUse = true;


switch (true) do 
{
	case (_shortname == "uitem_furniture_01"): { _weighttoadd = 80; };
	case (_shortname == "uitem_furniture_02"): { _weighttoadd = 110; };
	case (_shortname == "uitem_furniture_03"): { _weighttoadd = 65; };
	case (_shortname == "uitem_furniture_04"): { _weighttoadd = 150; };
	case (_shortname == "uitem_furniture_05"): { _weighttoadd = 130; };
};

if([false, _shortname, 1] call life_fnc_handleInv) then
{
	[] call life_fnc_p_updateMenu;

	//call command
	[ [player, _shortname, _weighttoadd] , "HOUSE_fnc_DBuseFurniture" ,false, false] call life_fnc_MP;
	
	[1,false] call life_fnc_sessionHandle; //To save everything
}
else
{
	hint "Konnte Item nicht aus Inventar nehmen!";
	life_action_inUse = false;
};
