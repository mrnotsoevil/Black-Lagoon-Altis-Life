/*
*
* Open house inventory, executed by PIPELINE
* ARGS: [INT illegalvalue] //calculated + money
*/

private ["_house_name", "_display", "_return", "_house_args", "_exdata", "_canview", "_house_price", "_house_price_sell",
"_house_current_inv", "_item", "_count", "_datawritten","_impoundMoney","_illegal_value"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_return = _this select 2;


_illegal_value = _house_args select 0; //if enable impound money

//Check for response of action
/*_return = call compile format["%1", _return]; //compile data
_datawritten = (((_return select 0) select 0) select 0) == "1";*/

_datawritten = _return;

if(_datawritten) then
{	
	life_atmcash = life_atmcash + _illegal_value;
	
	hint format [ "Du hast $%1 Lohn bekommen.", _illegal_value ];
	
	///Write
	sleep 10;
	[1,false] call life_fnc_sessionHandle; //update money
}
else
{
	hint "Items konnten nicht beschlagnahmt werden!";
};



