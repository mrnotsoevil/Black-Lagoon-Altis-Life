#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "Du musst ein Item auswählen!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];

//Error checks
if(!([_num] call fnc_isnumber)) exitWith {hint "Falsches Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst nichts unter 1 eingeben!";};
if(_ctrl != "goldbar") exitWith {hint "Du kannst nichts in dem Safe lagern außer Goldbarren."};
if(_num > _safeInfo) exitWith {hint format["Da sind nicht %1 Goldbarren im Safe!",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Dein Inventar ist voll."};


//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Konnte nicht zu deinem Inventar hinzugefügt werden.";};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;