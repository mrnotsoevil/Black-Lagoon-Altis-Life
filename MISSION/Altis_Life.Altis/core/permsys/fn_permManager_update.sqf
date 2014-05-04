/*

	Updates the PERM manager (29550)

*/

private["_display", "_permid", "_permindex", "_index", "_valid","_playerlevel"];
disableSerialization;

if(life_permmanager_admin || (call life_adminlevel) < 1) then
{
	ctrlShow [2400, false];
};


_index  = lbCurSel 2100;

if(_index == -1) exitWith
{
	["HIDDEN"] call life_fnc_permManager_uiMode;
};

_permid = lbData [2100, _index];
_permindex = lbValue[2100, _index];

//Reset/Set data
life_permmanager_permid = _permid;
life_permmanager_permindex = _permindex;
life_permmanager_data_receive_time = time;

//Show own data
["HIDDEN"] call life_fnc_permManager_uiMode;

_playerlevel = [_permid] call life_fnc_permLevel;
ctrlSetText[1001, format["Rang %1 (%2)", _playerlevel, [_permid, _playerlevel] call life_fnc_permLevelName]];
ctrlSetText[1200, (([] call life_fnc_perms) select _permindex) select 5];


if( !([_permid, "VIEW"] call life_fnc_permRule) && !life_permmanager_admin) exitWith
{
	systemChat "Du kannst nicht sehen, welche Personen in der Gruppe sind!";
};

//Send to all players: populate list
//Populate list
lbClear 1500; //clear it before using it
lbClear 1500; //clear it before using it

systemChat "Lade Liste ... Bitte warten!";

if(count life_permmanager_player_perms == 0) then
{
	//Cache empty, load from source
	lbClear 1500; //clear it before using it
	
	[player, life_player_perms] call life_fnc_permManager_gotData;
	{
		if(_x != player && (side _x == west || side _x == civilian)) then
		{
			[[player],"life_fnc_permManager_requestData",_x,false] spawn life_fnc_MP;
		};
	}
	foreach playableUnits;
}
else
{
	//Data cached, load from cache
	lbClear 1500; //clear it before using it
	
	//[player, life_player_perms] call life_fnc_permManager_gotData;
	[] spawn life_fnc_permManager_refreshList;
		
	/*{
		if((_x select 0) != player) then
		{			
			[_x select 0, _x select 1] call life_fnc_permManager_gotData;
		};
	}
	foreach life_permmanager_player_perms;*/
};

