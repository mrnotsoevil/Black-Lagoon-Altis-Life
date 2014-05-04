/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private["_uid","_side","_sql","_query","_old"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,civilian,[civilian]] call BIS_fnc_param;

//Error checks
if(_uid == "") exitWith {"Invalid UID"};

switch (_side) do
{
	case west:
	{
		/*
			When add new additional licenses, positions, etc to the cop side please add the rows to the database and add those rows in here and adjust the client-side receivers,
			If you do not adjust both server-side & client side receivers your new added in content will be broken and a waste of time.
		*/
		_query = format["SELECT playerid, name, cash, bankacc, coplevel, cop_licenses, cop_gear, adminlevel, blacklist, donatorlvl, inventory, banned, playtime, perms FROM players WHERE playerid='%1'",_uid];
	};
	
	case civilian:
	{
		/*
			The same applies from the above statement!
		*/
		_query = format["SELECT playerid, name, cash, bankacc, civ_licenses, arrested, adminlevel, donatorlvl, civ_gear, inventory, banned, playtime, perms FROM players WHERE playerid='%1'",_uid];
	};
};
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
_sql = call compile format["%1", _sql];
if(isNil {((_sql select 0) select 0)}) then
{
	[];
}
	else
{
	_ret = ((_sql select 0) select 0);
	if(count _ret == 0) exitWith {[]};
	switch(_side) do
	{
		case west:
		{
			_new = [(_ret select 6)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[6,_new];
			_new = [(_ret select 5)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[5,_new];
			
			//Convert tinyint to boolean
			_old = _ret select 5;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			_ret set[5,_old];
			
			//Convert inventory to INV ARRAY using BIS_fnc_trim and compile ##43
			_old = _ret select 10;
			_new = [_old,1,-1] call BIS_fnc_trimString;
			//_new = call compile format["%1", _old];
			_ret set[10, _new];
			
			
			
			/////////////////////////////////////////
			//ANTICHEAT
			_new = (_ret select 11) == "True";
			_ret set [11, _new];
			
			//##84
			[_uid, _new] call life_fnc_dbBanSet;
			
			//Convert tinyint to boolean for BANNED			
			/////ANTICHEAT: If banned, set money and other stuff to zero
			if(_ret select 11) then
			{
				diag_log format ["<<<DBBAN>>> Banned player %1 joined as COP! Setting everything to ZERO.", _ret select 1];
			
				_ret set [2,"0"];
				_ret set [3,"0"];
				_ret set [4,"0"];
				_ret set [5,[]];
				_ret set [6,[]];
				_ret set [7,"0"];
				_ret set [9,"0"];
				_ret set [10,[]];
			};
			
			
			///Playtime
			_old = _ret select 12;
			_new = _old;
			if(typeName _old == "STRING") then
			{
				_new = parseNumber _old;
			};
			
			[_uid, _new] call ANTICHEAT_fnc_setPlayTime;
			
			//##119 perms
			_old = _ret select 13;
			
			if(_old == "") then
			{
				_old = """[]""";
			};
			
			_new = [_old,1,-1] call BIS_fnc_trimString;			
			_ret set[13, _new];
		};
		
		case civilian:
		{
			diag_log format ["query civ-gear: str >> %1 <<", _ret select 8];
		
			_new = [(_ret select 8)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			
			diag_log format ["query civ-gear: str-cmp >> %1 << TYPE %2", _new, typeName _new];
			_ret set[8,_new];
			
			_new = [(_ret select 4)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[4,_new];
			
			//Convert tinyint to boolean
			_old = _ret select 4;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			
			_ret set[4,_old];
			
			//Convert inventory to INV ARRAY using BIS_fnc_trim and compile ##43
			_old = _ret select 9;
			_new = [_old,1,-1] call BIS_fnc_trimString;
			//_new = call compile format["%1", _old];
			_ret set[9, _new];
			
			
			//Load civ cop gear
			/*_new = [(_ret select 10)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[10,_new];*/
			
			/////////////////////////////////////////
			//ANTICHEAT			
			/////ANTICHEAT: If banned, set money and other stuff to zero
			_new = (_ret select 10) == "True";
			_ret set [10, _new];
			
			//##84
			[_uid, _new] call life_fnc_dbBanSet;
			
			if(_ret select 10) then
			{
				diag_log format ["<<<DBBAN>>> Banned player %1 joined as CIV! Setting everything to ZERO.", _ret select 1];
			
				_ret set [2,"0"];
				_ret set [3,"0"];
				_ret set [4,"0"];
				_ret set [5,"True"];
				_ret set [6,"0"];
				_ret set [7,"0"];
				_ret set [8,[]];
				_ret set [9,[]];
			};
			
			///Playtime
			_old = _ret select 11;
			_new = _old;
			if(typeName _old == "STRING") then
			{
				_new = parseNumber _old;
			};
			
			[_uid, _new] call ANTICHEAT_fnc_setPlayTime;
			
			//##119 perms
			_old = _ret select 12;
			
			if(_old == "") then
			{
				_old = """[]""";
			};
			
			_new = [_old,1,-1] call BIS_fnc_trimString;			
			_ret set[12, _new];
		};
	};
	
	//ANTICHEAT-MOT
	[_ret select 2, _ret select 3, _uid] call ANTICHEAT_fnc_commitMOT;
	
	_ret;
};