/*

	Updates UI panels according to selected values (player)

*/

private["_index", "_permid", "_permindex", "_msg","_perm","_perm_index","_perm_level"];

//Get the env
_permid = life_permmanager_permid;
_permindex = life_permmanager_permindex;

if(_permid == "" || _permindex == -1) exitWith
{
	systemChat "Invalid permid/permindex!";
};

//Only leader can show
if( !([_permid, "LEADER"]  call life_fnc_permRule) && !life_permmanager_admin) exitWith
{
	["VIEW"] call life_fnc_permManager_uiMode;
};

_index = lbCurSel 1500;

if(_index == -1) exitWith {};

_perm_index = lbValue [1500, _index];
_perm = life_permmanager_player_perms select _perm_index;
_perm = _perm select 1;


_perm_level = [_permid, _perm] call life_fnc_permLevel;

["LEADER"] call life_fnc_permManager_uiMode; //set uimode to leader mode

ctrlSetText [1400, [_perm_level] call life_fnc_numberText]; //update text