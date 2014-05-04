/*


	Packs the selected item


*/
private["_display", "_index", "_classname", "_itemtype", "_shortname", "_weight"];


disableSerialization;
_display = findDisplay 39400;

if(isNull _display) exitWith {hint "Dialog not open!"; };

//Unholster ##112
if(life_n_holstered) then
{
	[false] call life_fnc_holsterWeapons;
};


/////////////////

_index = lbCurSel 1500;

if(_index == -1) exitWith { };

_classname = lbData [1500, _index];
_itemtype = lbValue [1500, _index];

_shortname = "";

//Check
if(life_action_inUse) exitWith {};

/////////////////
{
	if(_classname == (_x select 1)) then
	{
		_shortname = _x select 0;
	};
}
foreach life_vitems_shrtToClass;


if(_shortname == "") exitWith
{
	hint format["Error while fetching VSHORTNAME! Item '%1'", _classname];
};

life_action_inUse = true;

hintSilent "Packe ein ...";
sleep 2;

/////////////////
if ([false, "box" , 1] call life_fnc_handleInv) then //remove item
{
	if([true, _shortname, 1] call life_fnc_handleInv) then //add item
	{
		switch(true) do //strip original item
		{
			case (_itemtype == 0 || _itemtype == 1 || _itemtype == 2):
			{
				player removeWeaponGlobal _classname;								
			};
			case (_itemtype == 3): //item
			{
				player removeItem _classname;
			};
			case (_itemtype == 4): //uniform
			{
				removeUniform player;
			};
			case (_itemtype == 5): //west
			{
				removeVest player;
			};
			case (_itemtype == 6): //magazines
			{
				player removeMagazine _classname;
			};
			case (_itemtype == 7): //west
			{
				removeBackpack player;
			};
			case (_itemtype == 8): //goggles
			{
				removeGoggles player;
			};
			case (_itemtype == 9): //headgear
			{
				removeHeadgear player;
			};
			default
			{
				hint "Fehler!";
				[false, _shortname, 1] call life_fnc_handleInv;
				[true, "box", 1] call life_fnc_handleInv
			};
		};
		
		//Update
		[] call life_fnc_vitem_refreshPackDialog;
		
		//Hotfix in for cop gear
		if(playerSide == west) then
		{
			[] call life_fnc_saveGear;
		}
		else
		{
			[] call life_fnc_civSaveGear;
		};
		
		[1,false] call life_fnc_sessionHandle;

	}
	else
	{
		hint "Kein Inventarplatz!";
		[true, "box" , 1] call life_fnc_handleInv;
	};
}
else
{
	hint "Keine Kiste mehr!";
};

life_action_inUse = false;