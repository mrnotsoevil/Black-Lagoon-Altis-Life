/*
*
* After tired buying a house
*
*/

private ["_house_name", "_return", "_house_args", "_datawritten", "_shortname"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_return = _this select 2;

/*_return = call compile format["%1", _return]; //compile data

//TODO
_datawritten = (((_return select 0) select 0) select 0) == "1";*/

_shortname = _house_args select 0; //for refund

_datawritten = _return;

if(_datawritten) then
{
	hint "Möbel wurden erfolgreich hinzugefügt.";
}
else
{
	hint "Fehler beim Hinzufügen von Möbelstück!";
	
	sleep 2;
	
	hint "Item wird zurückerstattet.";
	
	[true,_shortname,1] call life_fnc_handleInv;
	[] call life_fnc_p_updateMenu;

	//sleep 2;
	[1,false] call life_fnc_sessionHandle; //update money
	
};

life_action_inUse = false;



