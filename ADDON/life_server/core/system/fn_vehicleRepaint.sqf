/*
	Recolors a vehicle
*/
private["_uid","_type","_classname","_color","_plate","_vInfo"];

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = [_this,1,-1,[0]] call BIS_fnc_param;

//Error checks
if(isNull _vehicle) exitWith {diag_log "Tried to repaint null vehicle. Canceled.";};
if(!alive _vehicle) exitWith {diag_log "Tried to repaint non alive vehicle. Canceled.";};

_vInfo = _vehicle getVariable["dbInfo",[]];

if(count _vInfo == 0) exitWith
{
	diag_log "Tried to repaint a non persistent vehicle. Canceled.";
};

_plate = _vInfo select 1;
_uid = _vInfo select 0;

diag_log "Vehicle repainted.";

[_uid,_plate,_color] call DB_fnc_repaintVehicle;
