/*
	ADAC REPAINT action
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName", "_damage", "_index", "_color_index", "_color_paint_buckets"];

_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitWith { hint "Kein Fahrzeug gefunden!"; };
if((["adac"] call life_fnc_permLevel) < 1) exitWith
{
	hint "Du bist kein ADAC-Mitglied!";
};

//Load all data 
_index = lbCurSel 2303;

if(_index == -1) exitWith {hint "Keine Farbe ausgewahlt.";};

_color_index = lbValue [2303, _index];
_color_paint_buckets = round (parseNumber lbData[2303, _index]);

closeDialog 0;

if(_color_index < 0 || _color_paint_buckets < 1) exitWith { hint "Invalid data!";};

//Takes time ...
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if(([false,"uitem_adac_paint",_color_paint_buckets] call life_fnc_handleInv)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Lackiere %1",_displayName];
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
			sleep 0.29;
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
		if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","PLAIN"];};
	
		/////////////////////
		
		//Send toDB
		[[_veh,_color_index],"TON_fnc_vehicleRepaint",false,false] spawn life_fnc_MP;
		
		//Color vehicle locally
		[[_veh,_color_index],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
		
		[1,false] call life_fnc_sessionHandle;
		/////////////////////
		titleText["Fahrzeug lackiert.","PLAIN"];
	}
	else
	{
		hint "Du hat nicht genug Lack, um das Fahrzeug zu farben.";
	};
};