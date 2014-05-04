/*


	Show vehicle interaction menu


*/


private["_display","_curTarget","_bRepair","_bPutToGarage","_bRegister","_bRepaint","_pRepaint","_bPullOut","_bImpound"];
if(!dialog) then {
	createDialog "vInteraction_Civ"; //Use pInteraction_Menu with more buttons
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_bRepair = _display displayCtrl 2401;
_bPutToGarage = _display displayCtrl 2402;
_bRepaint = _display displayCtrl 2404;
_pRepaint = _display displayCtrl 1207;
/*_bRegister = _display displayCtrl 2403;
_bPullOut = _display displayCtrl 2405;
_bImpound = _display displayCtrl 2406;*/

life_vInact_curTarget = _curTarget;

//Set Repair Action
_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};

//ADAC Repair 
if(["adac"] call life_fnc_permLevel > 0) then
{
	if(life_uinv_adac_toolkit > 0) then
	{
		_bRepair ctrlSetTooltip "Reparieren (ADAC-Toolkit)";
		_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_adacRepairTruck;";
		_bRepair ctrlEnable true;
	};
};


/*_bRegister ctrlSetTooltip localize "STR_vInAct_Registration";
_bRegister buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
_bSearch ctrlSetTooltip localize "STR_vInAct_SearchVehicle";
_bSearch buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
_bPullOut ctrlSetTooltip localize "STR_vInAct_PullOut";
_bPullOut buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
if(count crew _curTarget == 0) then {_bPullOut ctrlEnable false;};
	
_bImpound ctrlSetTooltip localize "STR_vInAct_Impound";
_bImpound buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";*/
	
//#2
/*_bPutToGarage ctrlSetTooltip localize "STR_vInAct_putToGarage";
_bPutToGarage buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_putToGarage;";*/

//ADAC Impound 
if(["adac"] call life_fnc_permLevel > 0) then
{
	_bPutToGarage ctrlEnable true;
	_bPutToGarage ctrlSetTooltip "Abschleppen (ADAC)";
	_bPutToGarage buttonSetAction "closeDialog 0; [] spawn life_fnc_adacImpound;";
}
else
{
	_bPutToGarage ctrlEnable false;
};

//ADAC Repaint 
if(["adac"] call life_fnc_permLevel > 0) then
{
	_bRepaint ctrlSetTooltip "Umlackieren (ADAC)";
	_bRepaint buttonSetAction "closeDialog 0; [] spawn life_fnc_adacRepaintMenu;";
}
else
{
	_bRepaint ctrlShow false;
	_pRepaint ctrlShow false;
};