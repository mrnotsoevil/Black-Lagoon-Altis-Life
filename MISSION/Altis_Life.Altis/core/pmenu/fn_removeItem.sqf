/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts zum entfernen ausgewählt.";};
if(!([_value] call fnc_isnumber)) exitWith {hint "Du hast keine aktuelle Anzahl angegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine aktuelle Anzahl angeben die du entfernen möchtest."};
_ind = [_data,life_illegal_items] call fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Dies ist ein illegales Item, da Polizisten in der Nähe sind kannst du die Beweiße nicht mehr vernichten.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst keine Items entfernen während du im Fahrzeug bist.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Angegebene Anzahl konnte nicht vernichtet werden, möglicherweiße hast du nicht diese Anzahl?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast erfolgreich %1 %2 aus deinem Inventar entfernt.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;