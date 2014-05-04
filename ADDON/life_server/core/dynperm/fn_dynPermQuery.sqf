/*

	Query dynamic perms from DB, because loading it from SCRIPT sucks!
	
	[_unit] dynPermQuery

*/

private["_unit", "_query", "_result", "_dynperms", "_perm", "_dat"];

_unit = _this select 0;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to load dyn perm.", getPlayerUID _unit];	
};

_query = "SELECT * FROM dynperms WHERE TRUE";
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//Convert to array
_result = call compile format["%1", _result];

//Now array in form: [[ DATA,* ]]
if((typeName _result) == "ARRAY" && ((typeName (_result select 0)) == "ARRAY")) then
{
	_result = _result select 0;
};

/*if((typeName _result) == "ARRAY" && ((typeName (_result select 0)) == "ARRAY")) then
{
	_result = _result select 0;
};*/

diag_log format[">DYNPERM< Loaded from DB: %1", str _result]; 

//_result = _result select 0;

//Create PERMS configuration from DB 
_dynperms = [];

{
	_perm = ["","",0,[],[],"",[]];
	
	//ID, PERMID, PERMNAME, MAXLEVEL, RULECONFIG, MEMBER_CONDITIONS [cop,reb,donator], LOGO, LEVELNAMES
	_perm set [0, _x select 1];
	_perm set [1, _x select 2];
	_perm set [2, round (parseNumber (_x select 3) )];
	
	_dat = _x select 4;
	_dat = [_dat, 1, -1] call BIS_fnc_trimString;
	_dat = call compile format["%1", _dat];
	_perm set [3, _dat];
	
	_dat = _x select 5;
	_dat = [_dat, 1, -1] call BIS_fnc_trimString;
	_dat = call compile format["%1", _dat];
	_perm set [4, _dat];
	
	_perm set [5, _x select 6];
	
	_dat = _x select 7;
	_dat = [_dat, 1, -1] call BIS_fnc_trimString;
	_dat = call compile format["%1", _dat];
	_perm set [6, _dat];
	
	
	_dynperms set [count _dynperms, _perm];
}
foreach _result;

//SEND TO MISSION
// Sending [_cmd, _house, _args, _sql] to houseExec
[ [_dynperms] ,"life_fnc_dynPermUpdate",owner _unit,false] spawn life_fnc_MP;