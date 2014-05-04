/*

	Sends new wanted to selected person

*/

private["_index","_name","_uid","_reason","_bounty"];

if( (call life_coplevel) < 1) exitWith
{
	hint "Du bist kein Cop!";
};

_index = lbCurSel 2100;

if(_index < 0) exitWith
{
	hint "Keine Person ausgewählt!";
};

_name = lbText [2100, _index];
_uid = lbData [2100, _index];

//Load reason
_reason = ctrlText 1400;

if(isNil("_reason") || _reason == "") exitWith
{
	hint "Kein Grund angegeben!";
};

//Load bounty
_bounty = ctrlText 1401;

if(! ([_bounty] call fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};

_bounty = parseNumber _bounty; //requested number
_bounty = round _bounty;

if(_bounty < 1) exitWith
{
	hint "Zu kleinen Betrag angegeben!";
};

//Execute
hint format["Der Spieler %1 wird nun wegen %2 gesucht.", _name, _reason];

//Send DB
[[_uid,_name,"",[_reason,_bounty]],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//Clear everything

ctrlSetText [1401, "0"];
ctrlSetText [1400, ""];

