/*
	File: fn_gangBrowser.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fills out the gang 'browser' menu with gangs.
*/
private["_gangs","_dialog","_gang","_locked"];
disableSerialization;

waitUntil {!isNull (findDisplay 2520)};
_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;

{
	_gang = _x;
	if(!isNull (_gang select 1)) then
	{
		if((_gang select 2)) then
		{
			_locked = "Gesperrt";
		}
			else
		{
			_locked = "Offen";
		};
		
		_gangs lbAdd format["%1 [Mitglieder: %2] - %3",_gang select 0,count (units(_gang select 1)),_locked];
		_gangs lbSetData [(lbSize _gangs)-1,_gang select 0];
	};
} foreach (life_gang_list);

if(((lbSize _gangs)-1) == -1) then
{
	_gangs lbAdd "Keine Gangs.";
	ctrlShow[2522,false];
};