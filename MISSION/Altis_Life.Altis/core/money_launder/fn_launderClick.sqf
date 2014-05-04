/*



	launderClick[]
	
	Called by launder menu, calls launder with correct params


*/

private ["_count", "_illegal_money", "_confirm", "_percentage", "_finalmoney"];

if(!dialog) exitWith{};


_count = ctrlText 1400;

if(! ([_count] call fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};

_count = parseNumber _count; //requested number
_count = round _count;

if(_count < 1) then
{
	hint "Ungültige Zahl eingegeben.";
};

//Illegal money
_illegal_money = missionNamespace getVariable "life_inv_illegalmoney";


if(_count > _illegal_money) exitWith
{
	hint "Du hast zu viel Geld angegeben!";
	sleep 2;
	hint format ["Du hast nur $%1",  [_illegal_money] call life_fnc_numberText];
};

////TODO: balancing
_percentage = [_count] call life_fnc_launderCalculateMoney;	
_finalmoney = round(_count * _percentage);

if( (missionNamespace getVariable ["__launder_dlg_confirm", -1]) != _count) then
{
	hint format["Du bekommst $%1 auf dein Konto, wenn du diesen Betrag waschen lässt. Klicke nochmal auf den Waschen-Button, um zu bestätigen.", [_finalmoney] call life_fnc_numberText];
	
	missionNamespace setVariable ["__launder_dlg_confirm", _count];
}
else
{
	missionNamespace setVariable ["__launder_dlg_confirm", -1];

	//Call launder
	[_count] spawn life_fnc_launder;
	
	closeDialog 0;
};


