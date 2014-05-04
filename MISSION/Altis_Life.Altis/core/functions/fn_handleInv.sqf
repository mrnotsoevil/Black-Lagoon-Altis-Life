/*
	File: fn_handleInv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Do I really need one?
	Yes !?
	
	fn_handleInv [ BOOL add/subtract, STRING item_shortname, INT num] returns BOOL successful
*/
private["_math","_item","_num","_return","_var","_weight","_value","_diff"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};

//ITEM = SHORTNAME
_var = [_item,0] call life_fnc_varHandle; //LONGNAME
if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = missionNamespace getVariable _var;

if(_math) then
{
	//Lets add!
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];
		
		if((missionNamespace getVariable _var) > _value) then
		{
			life_carryWeight = life_carryWeight + _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	}
		else
	{
		_return = false;
	};
}
	else
{
	//Lets subtract!
	if((_value - _num) < 0) then
	{
		_return = false;
	}
		else
	{
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
		{
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};

if(_return) then
{
	[] spawn life_fnc_bagSound;
};

_return;