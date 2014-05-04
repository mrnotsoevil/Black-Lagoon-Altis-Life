/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


if( (side player == west)  && (isNil "_unit" || isNull _unit || !isPlayer _unit || side _unit != civilian)) exitWith {};
if( (side player == civilian)  && (isNil "_unit" || isNull _unit || !isPlayer _unit || !license_civ_rebel)) exitWith {};
	
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;