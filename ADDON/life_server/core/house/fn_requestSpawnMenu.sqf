/**
*
*	Sends house data [[NAME, MARKER], ...] to spawn menu to enable player spawning at home
*
*/
private["_unit","_ret", "_query"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

// ##84 DBBAN
if([getPlayerUID _unit] call life_fnc_dbBanGet) exitWith
{
	diag_log format["<<DBBAN>> Banned player %1 tried to access house.", getPlayerUID _unit];
	[];
};

//Ask for all home civ spawns of player
//QUERY COND
_query = format ["SELECT marker_spawn FROM homes WHERE owner='%1' ", getPlayerUID _unit];
_ret = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];


//[[1,"SpawnMenu requested. Called!"],"life_fnc_broadcast",(owner _unit),false] spawn life_fnc_MP;
//Call spawn
[_ret,"life_fnc_spawnMenu",(owner _unit),false] spawn life_fnc_MP;
