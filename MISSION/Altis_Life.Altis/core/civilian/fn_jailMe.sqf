/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte Admin melden: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		//sleep (10 * 60);
		//50% of time
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//sleep (5 * 60);
		//20% of time
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 Minuten",round(round(_time - time) / 60)]} else {format["%1 Sekunden",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Verbleibende Zeit:\n %1\n\nDu darfst die Kaution bezahlen\nKaution: $%2",_countDown,[life_bail_amount] call life_fnc_numberText];
		}
		else
		{
			hintSilent format["Verbleibende Zeit:\n %1\n",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint "Du hast die Kaution bezahlt und bist nun frei.";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[1,false] call life_fnc_sessionHandle;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint "Du bist aus dem Gefängnis ausgebrochen. Dies ist eine weitere Straftat!";
		[[0,format["%1 ist aus dem Gefängnis ausgebrochen!",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,name player,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint "Du hast deine Zeit abgesessen und bist nun frei.";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};
};