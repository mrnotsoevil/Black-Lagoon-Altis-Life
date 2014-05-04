/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//##89
if(player getVariable ["restrained", false]) exitWith
{
	hintSilent "Du bist gefesselt!";

	_handled = false;
	_handled;
};

if(life_hands_up) exitWith
{
	hintSilent "Du hast deine Hände oben!";

	_handled = false;
	_handled;
};

switch (_code) do
{	
	// Shift + H: holster
	case 35:
	{
		switch(true) do
		{
			case (_shift && !_alt && !_ctrlKey):
			{
				if(!life_action_inUse) then
			    {
			    	life_action_inUse = true;
			    	[] spawn
			    	{
			    		[!life_n_holstered] call life_fnc_holsterWeapons;
			    		
			    		sleep 4;
			    		life_action_inUse = false;
			    	};
			    };
			};
			case (_shift && !_alt && _ctrlKey):
			{
				//Ctrl + Shift + H: hands up			 
			    	if(!life_action_inUse) then
			    	{
			    		[0,0,0,true] spawn life_fnc_putHandsUp;
			    	};	
			};
			case (!_shift && !_alt && !_ctrlKey):
			{
				[] spawn life_fnc_showQuickHelp;
			};
		};		
	};

	//Map Key
	case _mapKey:
	{
		if(playerSide == west && !visibleMap) then {
			[] spawn life_fnc_copMarkers;
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(_restrained) exitWith
		{
			_handled = true;
			_handled;
		};
	
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		
		//cop restrain
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if([false,"uitem_handcuffs",1] call life_fnc_handleInv) then
			{
				[] call life_fnc_restrainAction;
				hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
			}
			else
			{
				hint "Du hast keine Handschellen dabei!";
			};
		}
		else
		{
			if(_shift && playerSide == civilian && (license_civ_rebel || ["RESTRAIN"] call life_fnc_permRuleG) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["Escorting", false]) && !(cursorTarget getVariable ["restrained", false]) && speed cursorTarget < 1 ) then
			{
				if([false,"uitem_handcuffs",1] call life_fnc_handleInv) then
				{
					[] call life_fnc_restrainAction;
					hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
				}
				else
				{
					hint "Du hast keine Handschellen dabei!";
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;}; //##97
		if(_shift /*&& playerSide == civilian*/ && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			//Everybody can open trunk if veh is unlocked
		
			if(vehicle player != player && alive vehicle player) then
			{
				//if((vehicle player) in life_vehicles) then
				//{
					[vehicle player] call life_fnc_openInventory;
				//};
			}
			else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					//if(cursorTarget in life_vehicles) then
					//{
						[cursorTarget] call life_fnc_openInventory;
					//};
				};
			};
		};
	};
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide == west) then 
		{
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F"]) then 
			{
				if(!isNil {vehicle player getVariable "lights"}) then 
				{
					[vehicle player] call life_fnc_sirenLights;
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	//V Key
	case 47:
	{
		if(playerSide != west && (player getVariable "restrained") OR (player getVariable "transporting")) then {_handled = true;};
	};
	//F Key
	case 33:
	{
		if(playerSide == west && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirenen AUS","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirenen AN","PLAIN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
			};
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player == player) then
			{
				_veh = cursorTarget;
			}
				else
			{
				_veh = vehicle player;
			};
			
			_locked = locked _veh;
			
			if(_veh in life_vehicles && player distance _veh < 8) then
			{
				if(_locked == 2) then
				{
					if(local _veh) then
					{
						_veh lock 0;
					}
						else
					{
						[[_veh,0], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					};
					//systemChat "You have unlocked your vehicle.";
					hint composeText [ image "icons\unlock.paa", "  Fahrzeug aufgeschlossen" ];
					
					//play sound
					//_veh say3D "Car_Unlock";
					[player,"Car_Unlock"] call life_fnc_globalSound;
				}
					else
				{
					if(local _veh) then
					{
						_veh lock 2;
					}
						else
					{
						[[_veh,2], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					};
					
					hint composeText [ image "icons\lock.paa", "  Fahrzeug abgeschlossen" ];
					//systemChat "You have locked your vehicle.";
					
					//play sound
					//_veh say3D "Car_Lock";
					[player,"Car_Lock"] call life_fnc_globalSound;
				};
			};
		};
	};
};

_handled;