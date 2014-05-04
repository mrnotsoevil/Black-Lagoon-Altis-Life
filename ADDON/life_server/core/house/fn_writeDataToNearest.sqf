/*
* Finds nearest house and execs WRITEDATA to it
* RETURNS RESULT IF COND IS MET
*/
private["_cmd", "_maxrange", "_args", "_player", "_result", "_query","_query_update", "_cond", "_setarr", "_marker", "_house"];

_cmd = _this select 0;
_maxrange = _this select 1;
_args = _this select 2;
_player = _this select 3;
_setarr = _this select 4;
_cond = _this select 5;

// ##84 DBBAN
if([getPlayerUID _player] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to access house.", getPlayerUID _player];
	[];
};

//QUERY All player houses
_query = format ["SELECT name, marker_spawn FROM homes WHERE owner='%1'", getPlayerUID _player];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

_result = call compile format["%1", _result]; //compile data

diag_log format["House WriteToNearest exec returned %1", _result];

_house = "";

//Search for house in range
{		
		_marker = _x select 1;
		
		if( _player distance (getMarkerPos _marker) < _maxrange) exitWith
		{
			diag_log format["House WriteToNearest found house %1, sending to writeData!", _x select 0];
			//Send to writeData
			_house = _x select 0;
		};
}
foreach (_result select 0) select 0;

if(_house == "") then
{
	//SEND TO MISSION
	// Sending [_cmd, _house, _args, _sql] to houseExec
	[ [_cmd, _house, _args, false] ,"life_fnc_houseExecCommand",owner _player,false] spawn life_fnc_MP;
}
else
{
	[_cmd, _house, _args, _player, _setarr, _cond] call HOUSE_fnc_writeData;
};

