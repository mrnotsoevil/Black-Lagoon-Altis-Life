/*

(level) permManager_set

*/

private["_level","_destination","_adminlevel", "_perm_row", "_permid"];

_level = [_this, 0, -1] call BIS_fnc_param;
_perm_row = [];

//read destination
_destination = (lbData[1500, lbCurSel 1500]);

//look for player
{
	if((getPlayerUID _x) == _destination) exitWith
	{
		_destination = _x;
	};
}
foreach playableUnits;

if(typeName _destination == "STRING") exitWith
{
	hint "Ungültiger Spieler!";
};


//read perm data
_permid = life_permmanager_permid;
_perm_row = (([] call life_fnc_perms) select life_permmanager_permindex);

if((count _perm_row) == 0) exitWith
{
	hint "Invalid perm?";
};


//read level 
if(_level == -1) then
{
	//read level from controls
	_level = ctrlText 1400;
	
	
	if(([_level] call fnc_isnumber)) then
	{
		_level = parseNumber _level;
		_level = round _level;
	}
	else
	{
		_level = -1;
	};
};

//check 
if( _level < 0 || _level > (_perm_row select 2)) exitWith
{
	hint "Ungültiges Level angegeben!";
};

//get admin level 
_adminlevel = 0;
if(life_permmanager_admin) then
{
	_adminlevel = call life_adminlevel;
};


//send
if(_destination == player) then
{
	[player ,_permid, _level, [_permid] call life_fnc_permLevel, _adminlevel] spawn life_fnc_permSetLevel;
}
else
{
	[[player ,_permid, _level, [_permid] call life_fnc_permLevel, _adminlevel],"life_fnc_permSetLevel",_destination,false] spawn life_fnc_MP;
};

life_permmanager_player_perms = []; //Reset cache to make update possible
[] call life_fnc_permManager_update; //update, because sth was changed!

hint format["Level fur %1 der Gruppe %2 auf %3 gesetzt.", name _destination, _perm_row select 1, _level];