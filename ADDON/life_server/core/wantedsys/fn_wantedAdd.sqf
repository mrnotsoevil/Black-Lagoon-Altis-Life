/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,["Crime", 100]] call BIS_fnc_param;
if(_uid == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Mord/Totschlag durch Fahrzeug",16500]};
	case "187": {_type = ["Mord/Totschlag",18500]};
	case "901": {_type = ["Aus Gefängnis ausgebrochen",14500]};
	case "261": {_type = ["Vergewaltigung",15000]};
	case "261A": {_type = ["Versuchte Vergewaltigung",13000]};
	case "215": {_type = ["Versuchter Autodiebstahl",12000]};
	case "213": {_type = ["Benutzung illegaler Sprengstoffe",110000]};
	case "211": {_type = ["Bankraub",101000]};
	case "207": {_type = ["Verschleppung",13500]};
	case "207A": {_type = ["Versuchte Verschleppung",12000]};
	case "487": {_type = ["Diebstahl (hoher Sachschaden)",11500]};
	case "488": {_type = ["Diebstahl (Geringer Sachschaden)",1700]};
	case "480": {_type = ["Versuchter Mord/Totschlag",11300]};
	case "481": {_type = ["Drogenbesitz",11000]};
	case "482": {_type = ["Intent to distribute",15000]};
	case "483": {_type = ["Drug Trafficking",19500]};
	case "weapon": {_type = ["Besitz illegaler Waffen",4000]};
	case "policeitems": {_type = ["Besitz von Polizeigegenständen",5000]};
	default {_type = [];};
};

///if(count _type == 0) exitWith {}; //Not our information being passed... <== yes and EXIT here ?!
//Is there a custom bounty being sent? Set that as the pricing. Unfortunately it wont be checked!!!! (Don't use drugs, TONIC!)
//if(_customBounty != -1) then {_type set[1,_customBounty];}; 

//no!!!!! allow custom types TONIC smoked sth!
if((count _type) == 0) then
{
	_type = _customBounty; //Custom bounty
};

diag_log format["#WANTED ADD: %1 $%2", _type select 0, _type select 1];

//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};