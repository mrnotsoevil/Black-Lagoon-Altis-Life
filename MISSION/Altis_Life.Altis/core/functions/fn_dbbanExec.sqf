private["_uid","_name","_time","_reason","_msg"];

_uid = _this select 0;
_name = _this select 1;
_time = _this select 2;
_reason = _this select 3;

if((getPlayerUID player) != _uid) exitWith
{
	[[0,format["DBBAN >>> Etwas versuchte Spieler '%1' zu bannen! Hack! <<<", name player]],"life_fnc_broadcast" ] call life_fnc_MP;
};

_msg = format["Du wurdest von diesem Server gebannt (Grund: %1)! Bei Beschwerden TS: 62.104.20.197:10023", _reason];

[[0,format["DBBAN >>> Spieler %1 wurde gebannt (%2). <<<", name player, _reason]],"life_fnc_broadcast" ] call life_fnc_MP;

while { true } do 
{
	life_action_inUse = true;
	disableUserInput true;
	
	
	cutText[_msg,"BLACK FADED"];0 cutFadeOut 9999999;

	sleep 4;
};