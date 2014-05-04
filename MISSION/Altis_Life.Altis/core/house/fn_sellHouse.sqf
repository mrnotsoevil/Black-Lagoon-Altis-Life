/*
*
* buyHouse [house_name]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy"];

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call life_fnc_houseExtractDataVal;
_price = [_exdata, "price_sell"] call life_fnc_houseExtractDataVal; //USE PRICE_SELL



if(([_exdata, "owner"] call life_fnc_houseExtractDataVal) == getPlayerUID player) then
{
	hint "Frage Datenbank an ... Haus verkaufen";

	//call command
	[ [_name, player, _price] , "HOUSE_fnc_DBsellHouse" ,false, false] call life_fnc_MP;

	//Remove money
	life_atmcash = life_atmcash + _price;

	[1,false] call life_fnc_sessionHandle; //update money
}
else
{
	hint "Dir gehört das Haus nicht!";
};
