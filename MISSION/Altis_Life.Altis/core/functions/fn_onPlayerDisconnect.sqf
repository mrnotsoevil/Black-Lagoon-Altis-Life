/*
	File: fn_onPlayerDisconnect.sqf
	Author: Vampire
	(onPlayerDisconnected example by [KH]Jman on BIStudio Forums)
	
	Description:
	Deletes Weapon Holders within 5m of the disconnecting player.
*/
_id = _this select 0; 
_pname = _this select 1; 
_puid  = _this select 2;

call cleanNearItems;

cleanNearItems = {	
	if (_pname != "__SERVER__") then {
		
		_player = objNull;
		{
			if (getPlayerUID _x == _puid) exitWith
			{
				_player = _x;
			};
		} forEach playableUnits; 
		
		if (!(isNull _player)) then {
			// Player body found, now we can run our code
		
			_player removeWeapon (primaryWeapon _player);
			_player removeWeapon (handGunWeapon _player);
			removeAllWeapons _player;
			removeAllAssignedItems _player;
			removeAllItems _player;
			removeBackpack _player;
			removeAllHandgunItems _player;
			removeAllContainers _player;
			
			{
				deleteVehicle _x
			} forEach nearestObjects [_player, ["GroundWeaponHolder"], 5];
			sleep 1; // Wait
			{
				deleteVehicle _x
			} forEach nearestObjects [_player, ["GroundWeaponHolder"], 5];
		};
	};
};


/*
	File: fn_onPlayerDisconnect.sqf
	Author: Vampire
	(onPlayerDisconnected example by [KH]Jman on BIStudio Forums)
	
	Description:
	Deletes Weapon Holders within 5m of the disconnecting player.
*/
/*_id = _this select 0; 
_pname = _this select 1; 
_puid  = _this select 2;

call cleanNearItems;

cleanNearItems = {	
	if (_pname != "__SERVER__") then {
		
		_player = objNull;
		{
			if (getPlayerUID _x == _puid) exitWith
			{
				_player = _x;
			};
		} forEach playableUnits; 
		
		if (!(isNull _player)) then {
			// Player body found, now we can run our code
		
			/*_player removeWeapon (primaryWeapon _player);
			_player removeWeapon (launcherWeapon _player);
			_player removeWeapon (handGunWeapon _player);*/
			
/*			{
				_player removeWeaponGlobal _x;
			}
			foreach weapons player;

			{
				deleteVehicle _x
			} forEach nearestObjects [_player, ["GroundWeaponHolder"], 5];
		};
	};
};*/