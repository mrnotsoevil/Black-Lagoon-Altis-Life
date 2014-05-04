/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_illegalitems","__iname","__icount"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[]]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_illegalitems = [_this,5,[],[[]]] call BIS_fnc_param; //##56 ##55 Illegal item shortnames
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "" OR count _sp == 0) exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use set[count serv_sv_use,_vid];

_vInfo = [_vid,_pid] call DB_fnc_queryVehicle;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == "False") exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format["Entschuldigung aber %1 wurde als zerstörtes Fahrzeug klassifiziert und wurde zum Schrottplatz geschafft.",_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 6) == "True") exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format["Entschuldigung aber %1 ist irgendwo aktiv und kann nicht gespawnt werden.",_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,{life_atmcash = life_atmcash + _this;}],"BIS_fnc_spawn",_unit,false] spawn life_fnc_MP;
	[[1,"There is a vehicle on the spawn point. You will be refunded the cost of getting it out."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

//main sql
_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

//Vehicle inventory
_query = format["SELECT inventory FROM vehicles WHERE pid='%1' AND id='%2'",_pid,_vid];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

_sql = call compile format["%1", _sql];
_sql = ((_sql select 0) select 0) select 0;

diag_log format["VEH-SPAWN: Input string: << %1 >> type %2", _sql, typeName _sql];
_sql = [_sql,1,-1] call BIS_fnc_trimString; //convert to useable array
diag_log format["VEH-SPAWN: Trimmed string: << %1 >> type %2", _sql, typeName _sql];
_sql = call compile format["%1", _sql];

if(isNil ("_sql")) then
{
	diag_log "_sql is NIL - setting to default.";
	_sql = [[], 0];
};

/////////##56 illegal item cleanup
{
	__iname = _x select 0;
	
	if(__iname in _illegalitems) then
	{
		_x set [1,0]; //set to zero
		diag_log format["VEH-SPAWN: Cleaned of item %1", __iname];
	};
}
foreach (_sql select 0);

_vehicle = _vInfo select 2 createVehicle (_sp);
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),(call compile format["%1", _vInfo select 7])]];

//##54
_vehicle setVariable["Trunk", _sql, true];

_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle lock 2;


//Send keys over the network.
[[_vehicle],"TON_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;

//Reskin the vehicle 
[[_vehicle,(call compile format["%1",_vInfo select 8])],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && (call compile format["%1",_vInfo select 8]) != 13) then
{
	[_vehicle,"civ_littlebird",true] call life_fnc_vehicleAnimate;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[_vehicle,"cop_offroad",true] call life_fnc_vehicleAnimate;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["B_MRAP_01_F","C_SUV_01_F"]) then {
	_vehicle setVariable["lights",false,true];
};

serv_sv_use = serv_sv_use - [_vid];