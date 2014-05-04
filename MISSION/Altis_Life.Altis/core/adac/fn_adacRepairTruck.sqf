/*
	ADAC repair
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName", "_damage"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((["adac"] call life_fnc_permLevel) < 1) exitWith
{
	hint "Du bist kein ADAC-Mitglied!";
};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if(([false,"uitem_adac_toolkit",1] call life_fnc_handleInv)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repariere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es reparieren zu können!","PLAIN"];};
	
		_veh setDamage 0;
		[1,false] call life_fnc_sessionHandle;
		titleText["Fahrzeug repariert.","PLAIN"];
	};
};