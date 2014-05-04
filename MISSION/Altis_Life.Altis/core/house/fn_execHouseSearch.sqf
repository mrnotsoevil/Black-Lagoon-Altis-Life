private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_player_damage", "_house_inventory", "_item", "_count", "__illegal_value", "__i_item", "__i_value","__idx", "_item_name", "_isillegal"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

//hint _house_data;

/*hint _house_data;
sleep 3;*/

_house_data = call compile format["%1", _house_data]; //compile data

//////////////////Parse data
_exdata = _house_data call life_fnc_houseExtractData;

if (count _exdata == 0) exitWith { hint "Konnte zugehoriges Haus nicht laden."; };

//Set player variable house_current_exdata
missionNameSpace setVariable ["house_current_exdata", _exdata];

_house_name =  [_exdata, "name"] call life_fnc_houseExtractDataVal; //TO BE SAFE

//////////////////TODO
//Check if house belongs to player

diag_log format [ "%1 is trying to access %2 ...", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];

/*hint format ["DEBUG: Haus gehört %1", [_exdata, "owner"] call life_fnc_houseExtractDataVal];
sleep 1;*/

_canview = true;
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call life_fnc_houseExtractDataVal) != getPlayerUID player) then //if player not owner
	{
		_canview = false;
	};
};

if(_canview) exitWith
{
	hint "Du kannst das Haus nicht durchsuchen!";
	diag_log format [ "%1 tried to access to %2, not belonging to player", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];
};

////////////////////////////////////////////////////////////////////////////////////
///////////////////SHOW RESULT DLG
////////////////////////////////////////////////////////////////////////////////////

///Check if in use


if( [_house_name] call life_fnc_houseIsInuse ) exitWith
{
	hint "Jemand anderes greift bereits auf das Haus zu!";
};



////


//Show dialog house_houseSearchDlg
if(dialog) exitWith {hint "Already using a dialog.";};

//Allg. action inuse
if(life_action_inUse) exitWith {hint "Du machst gerade was anderes.";};

if(!createDialog "house_houseSearchDlg") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;


////

_house_inventory = [_exdata, "inventory"] call life_fnc_houseExtractDataVal; //load inventory

//illegal items in life_illegal_items = [ [SHORTNAME, PRICE] ]
__illegal_value = 0;

{
	_item = _x select 0;
	_count = _x select 1;
	_isillegal = false;
	
	if(_count > 0) then //check if count > 0
	{
		//Check if illegal and add illegal value
		{
			__i_item = _x select 0;
			__i_value = _x select 1;
		
			if(__i_item == _item) exitWith //illegal item found
			{
				__illegal_value = __illegal_value + (_count * __i_value); //add to illegal value
				_isillegal = true;
			};
		}
		foreach life_illegal_items;
	
		//add money and item [if illegal] to listbox
		if(_item == "money") then
		{
			__idx = lbAdd [1500, format ["$%1", _count] ];		
		}
		else
		{
			if(_isillegal) then
			{
				_item_name = [_item,0] call life_fnc_varHandle; //long name
				_item_name = [_item_name] call life_fnc_varToStr; //get name
		
				__idx = lbAdd [1500, format ["%1x %2", _count, _item_name] ];	
			};
		};	
	};
}
foreach _house_inventory;

if(__illegal_value == 0) then
{
	//disable impound button
	ctrlEnable [2402, false];
	
	//message
	ctrlSetText [1000, "Keine illegalen Gegenstände gefunden."];
}
else
{
	//disable impound button
	ctrlEnable [2402, true];
	
	//message
	ctrlSetText [1000, format ["Wert: $%1! Besitzer: %2", __illegal_value, [_exdata, "ownername"] call life_fnc_houseExtractDataVal ]];
};

//Set variable illegal value
missionNamespace setVariable ["house_cop_illegal_value", __illegal_value];

//!IMP set use variable
[_house_name, true] call life_fnc_houseSetInuse;

waitUntil{isNull (findDisplay 38400)}; //Wait until done
//!IMP set use variable
[_house_name, false] call life_fnc_houseSetInuse;
