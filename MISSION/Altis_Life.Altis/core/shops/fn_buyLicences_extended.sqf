/*
	[ ["diamond","car", ...] ] life_fnc_buyLicences_extended;
	
	Action: 
	this addAction["Lizenzen und Fähigkeiten",life_fnc_buyLicences_extended,["cair","swat","cg","gun"],0,false,false,"",' playerSide == west '];
*/
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];

_buyables = _this select 3; //called from action => select 3rd argument

hint format ["Der Händer verkauft %1 Lizenzen/Fähigkeiten.", count _buyables];

if(!dialog) then
{
	if(!(createDialog "license_extended_dlg")) exitWith {};
};
disableSerialization;

_display = findDisplay 2900;
if(isNull _display) exitWith {};

_listbox = _display displayCtrl 1500;

/**
*_license = [_license_short,0] call life_fnc_licenseType;
	_price = [_license_acc] call life_fnc_licensePrice;
	_hasLicense = missionNamespace getVariable (([_license_acc,0] call life_fnc_licenseType) select 0);
	_name = [_license] call life_fnc_varToStr;
	*/

	
//Load list with given Licences, set data to LONGNAME, set label to READABLENAME

//If click buy => call buyLicense with longname
{
	_shortname = _x;
	
	_longname = ([_shortname, 0] call life_fnc_licenseType) select 0;
	_displayname = ([_shortname, 0] call life_fnc_licenseType) select 1;
	_price = [_shortname] call life_fnc_licensePrice;
	_hasLicense = missionNamespace getVariable _longname;
	
	if(!_hasLicense) then
	{
		_listbox lbAdd format["%1 ($%2)", _displayname, _price];
		_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
	}
	else
	{
		_listbox lbAdd format["%1 (Bereits bekannt)", _displayname];
		_listbox lbSetData [(lbSize _listbox) - 1, ""];
	};
}
foreach _buyables;