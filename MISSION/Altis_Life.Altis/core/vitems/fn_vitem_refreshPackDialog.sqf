/*

	Refreshes current dialog

*/

private["_display", "_classnamearray", "_itemtypearray","_val", "_lbindex"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39400;

if(isNull _display) exitWith {hint "Dialog not open!"; };

////Refresh boxes
ctrlSetText [1000, format ["%1 Kisten", (missionNamespace getVariable "life_inv_box") ] ];

////////////////////////////////////////////////clear and fill listbox
lbClear 1500;

/*lbAdd [1500, str (primaryWeapon player) ];
lbAdd [1500, str (secondaryWeapon player) ];
lbAdd [1500, str (handgunWeapon player) ];*/
_classnamearray = [];
_itemtypearray = []; //Holds item types 0: weapon, 1: <=, 2: <=, 3:item, 4: uniform, 5: vest, 6:magazines, 7:backpack, 8:goggles, 9:headgear

///////PRIMARY
/*_val = (primaryWeapon player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 0];
};

///////SECONDARY
_val = (secondaryWeapon player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 1];
};

///////HANDGUN
_val = (handgunWeapon player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 2];
};*/

///////WEAPONS
{
	_classnamearray set [count _classnamearray, _x];
	_itemtypearray set [count _itemtypearray, 0];
}
foreach weapons player;

///////ITEMS IN BACKPACK
{
	_classnamearray set [count _classnamearray, _x];
	_itemtypearray set [count _itemtypearray, 3];
}
foreach items player;

///////UNIFORM
_val = (uniform player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 4];
};

///////VEST
_val = (vest player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 5];
};

///////MAGAZINES
{
	_classnamearray set [count _classnamearray, _x];
	_itemtypearray set [count _itemtypearray, 6];
}
foreach magazines player;

///////BACKPACK
_val = (backpack player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 7];
};

///////goggles
_val = ( goggles player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 8];
};

///////HEADGEAR
_val = (headgear player);
if(_val != "") then
{	
	_classnamearray set [count _classnamearray, _val];
	_itemtypearray set [count _itemtypearray, 9];
};

////////////////////////////////////////////////Fill Listbox

{
	//Only show if valid
	if(_x in life_vitems_validClassNames) then
	{
		_lbindex = lbAdd [1500, ([_x] call life_fnc_fetchCfgDetails) select 1 ];
		lbSetData [1500, _lbindex, _x];
		lbSetValue [1500, _lbindex, _itemtypearray select _forEachIndex];
	};
}
foreach _classnamearray;