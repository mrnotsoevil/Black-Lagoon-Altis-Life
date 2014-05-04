/*

    Update list of players for current selected permID

*/

private["_perm_template","_permindex","_permid","_playerlevel","_index","_rank"];

//Get the env
_permid = life_permmanager_permid;
_permindex = life_permmanager_permindex;

if(_permid == "" || _permindex == -1) exitWith
{
	systemChat "Invalid permid/permindex!";
};

    if(life_permmanager_list_refreshing) exitWith {};
    life_permmanager_list_refreshing = true;
    
	//systemChat "Liste wird aufgebaut ...";
	lbClear 1500; //clear it before using it
	
	_perm_template = (([] call life_fnc_perms) select _permindex); 
	
	//go thru rank 
	for "_rank" from (_perm_template select 2) to 0 step -1 do 
	{
		{
			_playerlevel = [_permid, _x select 1] call life_fnc_permLevel;
			
			if(_rank == _playerlevel) then
			{
				_index = lbAdd [1500, format["(%1) %2   %3", _rank, [_permid, _rank] call life_fnc_permLevelName, name (_x select 0)]];
				lbSetData[1500, _index, getPlayerUID (_x select 0)];
				lbSetValue[1500, _index, _forEachIndex]; //index of data
				
				if(_rank == 0) then
				{
					lbSetColor[1500, _index, [1,1,1,0.5]];
				};
			};
		}
		foreach life_permmanager_player_perms;
	};	
	
	["VIEW"] call life_fnc_permManager_uiMode;
	
	life_permmanager_list_refreshing = false;
