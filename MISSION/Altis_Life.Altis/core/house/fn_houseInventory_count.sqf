/*
*
*	Returns weight of INPUT ARRAY of items
*	HOUSE_INV_ARR := [[item1, COUNT], [item2, COUNT], ...]
*/

private["_arr", "_weight", "_item", "_item_count"];

_arr = _this; //as argument
_weight = 0;

{
	_item = _x select 0;
	_item_count = _x select 1;
	
	_weight = _weight + (([_item] call life_fnc_itemWeight) * _item_count); //mult. weight
}
foreach _arr;

_weight; //return weight
