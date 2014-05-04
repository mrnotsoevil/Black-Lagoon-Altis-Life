/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_impact","_istazer"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then 
{
	if(_source != _unit) then 
	{
		_curWep = currentWeapon _source;
		
		/*if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};*/
				
		_istazer = false; //Default
		_impact = 0; //How long?
		_distance = 0; //Max Distance?
		
		if(side _source == west || [] call life_fnc_playerInEvent) then //Police only OR in event
		{
			switch(true) do
			{
				case (_curWep == "hgun_P07_snds_F" && _projectile == "B_9x21_Ball"):
				{
					_istazer = true;
					_distance = 35;
					_impact = 15;
				};				
				case (_projectile in ["B_65x39_Caseless","B_556x45_Ball_Tracer_Red"]):  //List of projectile types
				//30Rnd_65x39_caseless_mag_Tracer, 30Rnd_45ACP_Mag_SMG_01_tracer_green, 100Rnd_65x39_caseless_mag_Tracer, 
				{
					_istazer = true;
					_distance = 2000;
					_impact = 40;
				};
			};
		};		
		
		//Prevent civilians from tazing cops
		if(side _source == civilian && playerSide == west) then
		{
			_istazer =false; 
		};
		
		if(_istazer) then
		{
			_isVehicle = if(vehicle player != player) then {true} else {false};
			_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
			
			_damage = 0; //SET TO ZERO
			if(_unit distance _source < _distance) then 
			{
				if(!life_istazed && !(_unit getVariable["restrained",false])) then 
				{
					if(_isVehicle && _isQuad) then 
					{
						//sort out some vehicles
						switch(typeOf (vehicle player)) do 
						{
							//List of sorted out
							case "B_MRAP_01_gmg_F": {};
							case "B_MRAP_01_F": {};
							case "B_Truck_01_transport_F": {};
							case "B_Truck_01_covered_F": {};
							case "O_Heli_Attack_02_F": {};
							case "O_Heli_Attack_02_black_F": {};
							case "I_Heli_Transport_02_F": {};
							case "I_MRAP_03_F": {};
							case "I_MRAP_03_hmg_F": {};
							
							
							//Taze here
							default 
							{
								player action ["Eject",vehicle player];
								[_unit,_source,_impact] spawn life_fnc_tazed;
							};
						};
					} 
					else 
					{
							[_unit,_source,_impact] spawn life_fnc_tazed;
					};
					//////////////////////////^^^^^^^^^^ Will taze anyway
						
				};
			};
		};
		
		/*if(_projectile in ["B_9x21_Ball","B_762x51_Ball"] && _curWep in ["hgun_P07_snds_F","srifle_EBR_F"]) then {
			if(side _source == west ) then {
				private["_distance","_isVehicle","_isQuad"];
				_impact = 0;
				_distance = 0;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				///Set values
				switch(_projectile) do 
				{
					case "B_9x21_Ball": 
					{ 
						_distance = 35;
						_impact = 15;
					};
					case "B_762x51_Ball": 
					{ 
						_distance = 2000;
						_impact = 35;
					};
					default 
					{ 
						systemChat "Tazer: invalid ammo!"; 
						_distance = 0;
					};
				};
				
				_damage = 0; //SET TO ZERO
				if(_unit distance _source < _distance) then 
				{
					if(!life_istazed && !(_unit getVariable["restrained",false])) then 
					{
						if(_isVehicle && _isQuad) then 
						{
							player action ["Eject",vehicle player];
							[_unit,_source,_impact] spawn life_fnc_tazed;
						} 
						else 
						{
							[_unit,_source,_impact] spawn life_fnc_tazed;
						};
						//////////////////////////^^^^^^^^^^ Will taze anyway
						
					};
				};
			};*/
			
			//Temp fix for super tasers on cops.
			//Causes cops healing to 100%
			//if(playerSide == west && side _source == west) then {
			//	_damage = false;
			//};
		//};
	};
};

[] call life_fnc_hudUpdate;
_damage;