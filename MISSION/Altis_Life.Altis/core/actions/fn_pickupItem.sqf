/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_impoundmoney"];
if((time - life_action_delay) < 2) exitWith {hint "Keine Tasten spammen!"};
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_illegal = [_itemInfo select 0,life_illegal_items] call fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	_impoundmoney = 0;
	
	//illegal money switch
	if(((life_illegal_items select _illegal) select 1) == "illegalmoney") then
	{
		_impoundmoney = (_itemInfo select 1);
	}
	else
	{
		_impoundmoney = (life_illegal_items select _illegal) select 1;
	};

	titleText[format["%1 ist ein illegales Item! Du bekommst $%2 as a Belohnung.",_itemName,[_impoundmoney] call life_fnc_numberText],"PLAIN"];
	life_atmcash = life_atmcash + _impoundmoney;
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	life_action_delay = time;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint "Du hast keinen Stauraum mehr."};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		titleText[format["Du hast %1 %2 aufgehoben.",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		titleText[format["Du hast %1 %2 aufgehoben.",_diff,_itemName],"PLAIN"];
	};
};