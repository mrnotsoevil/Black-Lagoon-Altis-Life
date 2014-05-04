/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Du hast keine Kleidung zum kaufen ausgewählt.","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_cash) exitWith {titleText["Du hast nicht genug Geld um dir die Kleidung kaufen zu können.","PLAIN"];};
life_cash = life_cash - _price;

life_clothesPurchased = true;
closeDialog 0;

//Update clothing ##86
[] spawn life_fnc_updateClothing;