/*
	File: fn_update.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Update the players information in the MySQL Database
*/
private["_uid","_name","_side","_money","_bank","_licenses","_misc","_query","_result","_array","_civGear","_inventory","_civ_cop_gear","_playtime","_mot_message","_perms"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,civilian,[civilian]] call BIS_fnc_param;
_money = [_this,3,"0",[""]] call BIS_fnc_param;
_bank = [_this,4,"2500",[""]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_civGear = [_this,7,[],[[]]] call BIS_fnc_param;
_inventory = [_this,8,"""[]"""] call BIS_fnc_param;
_perms = [_this,9,"""[]"""] call BIS_fnc_param;
//_civ_cop_gear = [_this,9,[],[[]]] call BIS_fnc_param;

//ANTICHEAT-MOT
_mot_message = [_money, _bank, _uid, _name] call ANTICHEAT_fnc_commitMOT;

if(isNil("_mot_message")) then
{
	_mot_message = "Nil?";
};

//PLAYTIME
_playtime = [_uid] call ANTICHEAT_fnc_getPlayTime;
_playtime = [_playtime] call life_fnc_numberText;

switch (_side) do
{
	case west: {_misc = [_this,6,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,6,false,[false]] call BIS_fnc_param;};
};

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "MySQL: Query Request - Error uid or name is empty.";};

_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.

// ##84 DBBAN
if([_uid] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to sync with:", _uid];
	diag_log format["          Cash : %1", _money];
	diag_log format["          Bank : %1", _bank];
	diag_log format["          Inventory : %1", _inventory];
};

///Make _inventory db-ready ##43
//_inventory = format["""%1""", str _inventory];

switch (_side) do
{
	case west:
	{
		private["_air","_cg"];
		
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses = [_licenses] call DB_fnc_mresArray;
		_misc = [_misc] call DB_fnc_mresArray;
		_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', inventory='%7', playtime='%8', anticheat_mot='%9', perms='%10' WHERE playerid='%6'",_name,_money,_bank,_misc,_licenses,_uid,_inventory,_playtime, _mot_message,_perms];
	};
	
	case civilian:
	{
		private["_car","_boat","_dive","_air","_oil","_truck","_gang","_gun","_reb","_d_h","_weed","_weed_med"];
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses = [_licenses] call DB_fnc_mresArray;
		if(typeName _misc == "BOOL") then {_misc = [_misc] call DB_fnc_bool;};
		
		_civGear = [_civGear] call DB_fnc_mresArray;
		
		//_civ_cop_gear = [_civ_cop_gear] call DB_fnc_mresArray;
		
		_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', inventory='%8', playtime='%9', anticheat_mot='%10', perms='%11' WHERE playerid='%5'",
		_name,_money,_bank,_licenses,_uid,_civGear,_misc,_inventory,_playtime,_mot_message,_perms];
	};
};

//Execute SQL Statement
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//Update DBBan entry
[_uid, _name] call life_fnc_dbBanQuery;