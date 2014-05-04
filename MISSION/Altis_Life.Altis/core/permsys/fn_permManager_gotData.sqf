/*

	[PLAYER, life_player_perms] gotData

*/
disableSerialization;
private["_unit", "_perms", "_index", "_currentreceivetime", "_perm_template", "_playerlevel","_existingindex","_display"];

//only populate if opened
_display = findDisplay 29650;
if(isNull _display) exitWith {};

_unit = _this select 0;
_perms = _this select 1;

//if player joined => perms is NIL
if(isNil("_perms")) exitWith
{
};

//Append the data 
_existingindex = -1;

{
	if((_x select 0) == _unit) exitWith
	{
		_existingindex = _forEachIndex;
	};
}
foreach life_permmanager_player_perms;

if(_existingindex == -1) then 
{
	life_permmanager_player_perms set [count life_permmanager_player_perms, [_unit, _perms]];
}
else
{
	life_permmanager_player_perms set [_existingindex, [_unit, _perms]];
};


life_permmanager_data_receive_time = time;
_currentreceivetime = time;

//Get the env
_permid = life_permmanager_permid;
_permindex = life_permmanager_permindex;

if(_permid == "" || _permindex == -1) exitWith
{
	systemChat "Invalid permid/permindex!";
};

//Now wait 1s and check if no new data received
//If no new data, REBUILD player list using data, sorting by RANK

sleep 1;

if(life_permmanager_data_receive_time <= _currentreceivetime) then
{
    [] spawn life_fnc_permManager_refreshList;
};
