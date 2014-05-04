/*

	Opens the ADAC repaint menu

*/

disableSerialization;
private["_display", "_veh", "_name", "_pic", "_index", "_vehtype", "_tokenarray","_condarray","_colorindex","_colorcost"];

createDialog "Life_vehicle_repaint";
_display = findDisplay 2300;

_veh = cursorTarget;
//life_adac_repaint_vehicle = _veh;

if(isNull _veh) exitWith {};
if(!(alive _veh)) exitWith {};

_vehtype = typeOf _veh;

//Initialize list 
_name = getText(configFile >> "CfgVehicles" >> _vehtype >> "displayName");
_pic = getText(configFile >> "CfgVehicles" >> _vehtype >> "picture");

_index = lbAdd [2302, _name];
lbSetPicture [2302, _index, _pic];

//Token array
_tokenarray = ["adac","civ"];

if([false,"uitem_token_donator",1] call life_fnc_handleInv) then { _tokenarray set [count _tokenarray, "donator"]; };
if([false,"uitem_token_rebel",1] call life_fnc_handleInv) then { _tokenarray set [count _tokenarray, "reb"]; };
if([false,"uitem_token_police",1] call life_fnc_handleInv) then { _tokenarray set [count _tokenarray, "cop"]; };

//Initialize color list 
_colorindex = 0;
{
	if( (_x select 0) == _vehtype) then
	{
		_condarray = _x select 1;
		_condarray = _condarray - _tokenarray;
		
		if(count _condarray == 0) then
		{
			_colorcost = _x select 4;
			
			_index = lbAdd [2303, format["%1 (%2 Farbeimer)", _x select 2, _colorcost]];
			lbSetValue[2303, _index, _colorindex];
			lbSetData[2303, _index, [_colorcost] call life_fnc_numberText];
		};
		_colorindex = _colorindex + 1; //add index !!!
	};
}
foreach life_vehicle_colors_new;

if(lbSize 2303 != 0) then
{
	lbSetCurSel [2303, 0];
};

//Show message
hint "Hinweis: Wenn du auch Donatorfarben usw. benutzen willst, musst du ein Token haben (Der Spieler muss dir das geben).";