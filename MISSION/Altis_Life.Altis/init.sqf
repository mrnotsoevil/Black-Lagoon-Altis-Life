//R3F
//execVM "R3F_ARTY_AND_LOG\init.sqf"
//END R3F

enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
/*
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
*/
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.2";
/*
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
*/
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

//Create vehicles here
//##105
[] call life_fnc_vehicleColorsCentralized;

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
	
	//run event config 
	diag_log "Initializing event stuff ...";
	[] call life_fnc_eventServerInit;
	diag_log "... done";
	
	//Start server fsm	
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

if(!StartProgress) then
{
	[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;

