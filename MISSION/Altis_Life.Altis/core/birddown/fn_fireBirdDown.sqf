/*

	Fires a "Bird Down" bullet

	fireBirdDown(0,1,2, TYPE);

*/

private["_type","_inventory","_veh","_hasweapon","_ammocount","__shrt","__count","_target","_nearest","_target_distance","_targettime","_target_locked", "_crewlist","_maxdistance","_alt_veh","_alt_target","_alt_diff"];

_type = _this select 3; //type
_veh = vehicle player;

if( !(_veh isKindOf "Air")) exitWith {systemChat "ERR: Not in aircraft";};

//Check if player is gunner or driver
if( ((gunner _veh) != player) && ((driver _veh) != player)) exitWith {hint "Kann nur ein Schütze oder ein Pilot ausführen!";}; 

/////////////////////////////////// PHASE 0: Ammo/Check for existance
//Get veh inventory
_inventory = _veh getVariable ["Trunk",[]];

if(count _inventory != 2) exitWith { hint "Fahrzeug hat kein Inventar!"; };
_inventory = _inventory select 0;
_inventory = + _inventory; //copy the array and work in copy

//Only one can be used in time
if( _veh getVariable["bird_down_inuse", false] ) exitWith { hint "Waffensystem arbeitet bereits!"; };
_veh setVariable["bird_down_inuse", true];

//Check if the module is in the vehicle
_hasweapon = false;
_ammocount = 0;
_maxdistance = 1;

switch(_type) do 
{
	case "BDMK1":
	{
        //set maxdistance here
        _maxdistance = 600;
        
		{
			__shrt = _x select 0;
			__count = _x select 1;
			
			if(__shrt == "uitem_bd_mk1_bleachweapon" && __count >= 1) then
			{
				_hasweapon = true;
			};
			if(__shrt == "uitem_bd_mk1_ammo") then
			{
				_ammocount = __count;
				
				//Remove one ammo!
				if(_ammocount > 0) then
				{
					_inventory set [_forEachIndex, ["uitem_bd_mk1_ammo", _ammocount - 1] ];
				};
			};
		}
		foreach _inventory;
	};
	case "BDMK2":
	{
         //set maxdistance here
        _maxdistance = 400;
        
		{
			__shrt = _x select 0;
			__count = _x select 1;
			
			if(__shrt == "uitem_bd_mk2_microemp" && __count >= 1) then
			{
				_hasweapon = true;
			};
			if(__shrt == "uitem_bd_mk2_ammo") then
			{
				_ammocount = __count;
				
				//Remove one ammo!
				if(_ammocount > 0) then
				{
					_inventory set [_forEachIndex, ["uitem_bd_mk2_ammo", _ammocount - 1] ];
				};
			};
		}
		foreach _inventory;
	};
	default
	{
		_hasweapon = false;
		
		if(true) exitWith { _veh setVariable["bird_down_inuse", false]; hint "ERR: WRONG WEAPON!"; };
	};
};

if(!_hasweapon) exitWith { hint "Du hast nicht die benötigte Waffe!"; _veh setVariable["bird_down_inuse", false];};
if(_ammocount < 1) exitWith { hint "Du hast keine Munition!"; _veh setVariable["bird_down_inuse", false];};
if(!(alive _veh)) exitWith { hint "Fahrzeug ist zerstört!"; _veh setVariable["bird_down_inuse", false];};

/////////////////////////////////// PHASE 1: Finding target
//Find the target
_nearest = nearestObjects[_veh, ["Air"], _maxdistance];
_target_distance = 99999;

{
	if((_x != _veh) && ((_veh distance _x) < _target_distance)) then
	{
		//Check if target is under or same level of vehicle 
		_alt_veh = (getPosASL _veh) select 2;
		_alt_target = (getPosASL _x) select 2;
		_alt_diff = _alt_veh - _alt_target;
		_alt_diff = _alt_diff;
		
		if(_alt_diff >= -5) then
		{	
			_target = _x;
		};
	};
}
foreach _nearest;

/*if(count _nearest > 1) then
{
	_target = _nearest select 1;
};*/

if(isNil("_target")) exitWith { hint "Kein Ziel gefunden!"; _veh setVariable["bird_down_inuse", false];};

hint parseText format["<img size='2' image='icons\schiessplatz.paa'/>Waffensystem zielt auf %1.", typeOf _target];
[player,"target_beep"] call life_fnc_globalSound;
playSound "target_beep";

sleep 3;
 
 ////////////////////////////////////////////////////////////
 //PHASE 2: Targeting
 _targettime = -1;
 
 switch(_type) do 
{
	case "BDMK1":
	{
		_targettime = 8; //x2
	};
	case "BDMK2":
	{
		_targettime = 16; //x2
	};
};

if(_targettime == -1) exitWith { hint "ERR: targetTime is -1???"; };

//Lock target 
_target_locked = true; //assume everything is correct

for "_i" from 0 to _targettime do 
{	
	[player,"target_beep"] call life_fnc_globalSound;
	 playSound "target_beep";
	
	//Check distance 
	_target_distance = (_veh distance _target);	
	
	//List the crew as info
	_crewlist = "";
	
	{
		_crewlist = _crewlist + name _x + "<br/>";
	}
	foreach crew _target;
	
	//Check if target is under or same level of vehicle 
	_alt_veh = (getPosASL _veh) select 2;
	_alt_target = (getPosASL _target) select 2;
	_alt_diff = _alt_veh - _alt_target; //if negative => cancel

	hintSilent parseText format["<img size='2' image='icons\schiessplatz.paa'/>Ziel<br/>%1<br/><br/>Crew<br/>%3<br/>Distanz<br/><t size='1.2'>%2m / %4m</t><br/><br/>Höhendifferenz<br/><t size='1.2'>%5m</t>", 
	typeOf _target, 
	[round _target_distance] call life_fnc_numberText,
	_crewlist, 
	[_maxdistance] call life_fnc_numberText,
	[round _alt_diff] call life_fnc_numberText];	
	
	if((_veh != (vehicle player)) || !(alive _veh) || _target_distance > _maxdistance  ||  _alt_diff < -5) exitWith { _target_locked = false; sleep 2;}; //5m room
	
	sleep 2;
};

if(!_target_locked) exitWith { hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Zielvorgang abgebrochen!"; _veh setVariable["bird_down_inuse", false];};


 ////////////////////////////////////////////////////////////
 //PHASE 3: Actual Shoot 
  hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Zielvorgang abgeschlossen!";
 [player,"target_shoot"] call life_fnc_globalSound;
 playSound "target_shoot";
 sleep 1;
 hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Waffe wurde abgeschossen!";
 
//Save stuff to vehicle
 _veh setVariable ["Trunk",[_inventory,0]]; 
 [_veh] call life_fnc_vehicleUpdateTrunkWeight;
 [[_veh,true,player],"TON_fnc_vehicleSaveInventory",false,false] spawn life_fnc_MP;
 
 //Shoot the target 
switch(_type) do 
{
	case "BDMK1":
	{
		if(!local _target) then
		{
			[[player, _target, _type, _veh],"life_fnc_birdDownShot",_target,false] spawn life_fnc_MP;
		}
		else
		{
			_target setFuel 0.05;
		};
	};
	case "BDMK2":
	{
		if(!local _target) then
		{
			[[player, _target, _type, _veh],"life_fnc_birdDownShot",_target,false] spawn life_fnc_MP;
		}
		else
		{
            _target setFuel 0;
			_target setDamage 0.95;
		};
	};
};

//Reenable weapon
_veh setVariable["bird_down_inuse", false];