/*


	execLaunderTimer [ INT money]

	Gives player money by laundering, executed by db

*/

private ["_money"];

//_money = [_this,0,"[[[""0""]]]"] call BIS_fnc_param;
_money = [_this,0,0] call BIS_fnc_param;


/*_money = call compile format["%1", _money];
_money = parseNumber (((_money select 0) select 0) select 0);*/

//if( isNil ("_money") ) then { _money = "0"; };

//try to compile everything
/*if([_money] call fnc_isnumber) then
{
	_money = parseNumber _money;
}
else
{
	_money = call compile format ["%1", _money];
	_money = ((_money select 0) select 0) select 0;
	
	if([_money] call fnc_isnumber) then
	{
		_money = parseNumber _money;
	}
	else
	{
		hint "execLaunder: strange format!";
		_money = 0;
	};
};*/

if(_money > 0) then
{
	life_atmcash = life_atmcash + _money;	
	[1,false] call life_fnc_sessionHandle;
	
	hint "Dein Geld wurde gewaschen!";
	sleep 5;
	hint format["Du hast $%1 auf dein Bankkonto bekommen.", [_money] call life_fnc_numberText];
};