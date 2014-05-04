private["_unit"];
_unit = lbData[1500,lbCurSel (1500)];
//_unit = call compile format["%1", _unit];

if(isNil "_unit") exitWith {};
//if(isNull _unit) exitWith {};

hint "kick menu";
hint _unit;

//[[_unit,player],"TON_fnc_getID",false,false] spawn life_fnc_MP;


hint "Noch nicht möglich."
