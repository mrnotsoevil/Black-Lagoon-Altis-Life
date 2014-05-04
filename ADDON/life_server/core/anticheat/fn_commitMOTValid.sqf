/*

	Commits player money values to Money Over Time system and says to system that the money, the player will receive is OK
	
	f[money,reason, uid, name]

*/

private["_cash","_bank","_player","_index","_zeromoney","_arr","_deltat","_delta","_old","_new","_oldtime","_time_diff","_money_time_over_full","_money_time_over_mot","_message","_money","_checktresholds","_result","_query","_uid","_pname","_reason"];

_money = _this select 0;
_reason = _this select 1;
_uid = _this select 2;
_pname = [_this, 3, "<NONAME>"] call BIS_fnc_param;

if(typeName _money == "STRING") then { _money = parseNumber _money; };

//Find index
_index = -1;

{
	if((_x select 0) == _uid) exitWith
	{
		_index = _forEachIndex;
	};
}
foreach anticheat_mot_values;

//Add value 
if(_index == -1) then
{
	//         0          1          2         3
	//Schema: uid, money_earned, money_zero, time
	anticheat_mot_values set [count anticheat_mot_values, [_uid, 0, _money, time] ];
	_checktresholds = false;
}
else
{
	_arr = anticheat_mot_values select _index;
	
	_zeromoney = _arr select 2;	
	_oldtime = _arr select 3;
	
	_arr set [2, _zeromoney + _money];
	
	diag_log format["<* ANTICHEAT-MOT *> Player %1 (id: %2) will receive valid money $%3 (Reason: %5). Updated Zero to %4", _pname,_uid, 
	[_money] call life_fnc_numberText, 
	[_zeromoney + _money] call life_fnc_numberText,
	_reason];
};