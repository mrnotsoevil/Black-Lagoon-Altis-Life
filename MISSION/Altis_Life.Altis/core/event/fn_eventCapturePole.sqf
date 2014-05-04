/*

	Player wants to collect points from pole
	
	1: 2min Cap = 200Punkte        30sec cd
	2: 4min Cap = 400punkte        60sec cd
	3: 6min Cap = 600Punkte        90sec cd

*/

private["_pole_marker", "_pole", "_distance", "_cooldown", "_canown", "_time_at_pole", "_tazed", "_distance"];

_pole_marker = _this select 3;

_pole = -1;

switch(_pole_marker) do 
{
	case "event_pole_1_marker": {_pole = 1;};
	case "event_pole_2_marker": {_pole = 2;};
	case "event_pole_3_marker": {_pole = 3;};
};

if(_pole == -1) exitWith {};

//check if player can own the pole 
_canown = true;

switch(_pole) do 
{
	case 1: {_canown = (life_event_pole1_owner != "");};
	case 2: {_canown = (life_event_pole2_owner != "");};
	case 3: {_canown = (life_event_pole3_owner != "");};
};

if(!_canown) exitWith { hint "Die Flagge wird gerade eingenommen!";};

//check if timeout
switch(_pole) do 
{
	case 1: {_canown = (time >= life_event_pole1_timeoutuntil);};
	case 2: {_canown = (time >= life_event_pole2_timeoutuntil);};
	case 3: {_canown = (time >= life_event_pole3_timeoutuntil);};
};

if(!_canown) exitWith { hint "Cooldown der Flagge ist noch nicht abgelaufen!";};

//own the pole 
 [[0,format["** EVENT ** %1 nimmt gerade eine Flagge ein!", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

 switch(_pole) do 
{
	case 1: 
	{
		life_event_pole1_owner = getPlayerUID player;
		publicVariable "life_event_pole1_owner";
	};
	case 2: 
	{
		life_event_pole2_owner = getPlayerUID player;
		publicVariable "life_event_pole2_owner";
	};
	case 1: 
	{
		life_event_pole3_owner = getPlayerUID player;
		publicVariable "life_event_pole3_owner";
	};
};

//now run the time ...
_time_at_pole = 0;
_cooldown = 0;
_tazed = false;

for "_i" from 0 to 360 do 
{
	_time_at_pole = _time_at_pole + 1;
	sleep 1;
	
	//check distance to pole 
	_distance = player distance (getMarkerPos _pole_marker);
	
	if(_distance > 20) exitWith
	{
		hint "Du bist zu weit weg! Abgebrochen!";
	}
	else
	{
		hintSilent format["Distanz zur Flagge: %1m", round _distance];
	};
	
	//check if tazed => cancel
	if( player getVariable ["tazed", false] ) exitWith
	{		
		_tazed = true;
	};
};

//reward player 
switch(true) do 
{
	case (_tazed):
	{
		hint "Du wurdest getazert und hast keine Punkte bekommen!";
		_cooldown = 10;
	};
	case (_time_at_pole < 120):
	{
		hint "Keine Punkte bekommen!";
		_cooldown = 10;
	};
	case (_time_at_pole < 240):
	{
		[200] call life_fnc_playerEventAddScore;
		_cooldown = 30;
	};
	case (_time_at_pole < 360):
	{
		[400] call life_fnc_playerEventAddScore;
		_cooldown = 60;
	};
	default
	{
		[600] call life_fnc_playerEventAddScore;
		_cooldown = 90;
	};
};

//add cooldown
switch(_pole) do 
{
	case 1: {life_event_pole1_timeoutuntil = time + _cooldown; publicVariable "life_event_pole1_timeoutuntil";};
	case 1: {life_event_pole2_timeoutuntil = time + _cooldown; publicVariable "life_event_pole2_timeoutuntil";};
	case 1: {life_event_pole3_timeoutuntil = time + _cooldown; publicVariable "life_event_pole3_timeoutuntil";};
};