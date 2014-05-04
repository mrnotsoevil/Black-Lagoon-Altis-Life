/*
	File: fn_fetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches the players current gear and returns it in the correct formatted array.
	
	Using the FeatchGear of cops
	Because tonics balance is crap
*/
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles"];

_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon player;
_launcher = secondaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
if(primaryWeapon player != "") then {_primitems = primaryWeaponItems player;};
if(handgunWeapon player != "") then {_handgunItems = handgunItems player;};
_headgear = headgear player;
_goggles = goggles player;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};
	
if(primaryWeapon player != "") then
{
	player selectWeapon (primaryWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};
		
if(secondaryWeapon player != "") then
{
	player selectWeapon (secondaryWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};
		
if(handgunWeapon player != "") then
{
	player selectWeapon (handgunWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};
player selectWeapon (primaryWeapon player);

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};

//using civ format for compatibility issues
//uniform,backpack,goggles,headgear,assigneditems,uitems,bitems, |vest,primary,launcher,handgun,magazines,primitems,secitems,handgunitems,vitems
//[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];

if(life_n_holstered) then
{
	//Translate holster gear to civ gear
	//_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_launcher
	_primary = life_n_holster_data select 0;
	_handgun = life_n_holster_data select 1;
	_magazines = life_n_holster_data select 2;
	_uniform = life_n_holster_data select 3;
	_vest = life_n_holster_data select 4;
	_backpack = life_n_holster_data select 5;
	_items = life_n_holster_data select 6;
	_primitems = life_n_holster_data select 7;
	_secitems = life_n_holster_data select 8;
	_handgunItems = life_n_holster_data select 9;
	_uitems = life_n_holster_data select 10;
	_vitems = life_n_holster_data select 11;
	_bItems = life_n_holster_data select 12;
	_launcher = life_n_holster_data select 13;
};

civ_gear = [_uniform,_backpack,_goggles,_headgear,_items,_uitems,_bItems,_vest,_primary,_launcher,_handgun,_magazines,_primitems,_secitems,_handgunItems,_vitems];


/*
	File: fn_civFetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches specific key items from the civilian for a persistent state.
*/
/*private["_ret","_uItems","_bItems"];
_ret = [];

_ret set[count _ret,uniform player];
_ret set[count _ret,backpack player];
_ret set[count _ret,goggles player];
_ret set[count _ret,headgear player];
_ret set[count _ret,assignedItems player];

_uItems = [];
_bItems = [];

if(uniform player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (uniformItems player);
};

if(backpack player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (backpackItems player);
};

_ret set[count _ret,_uItems];
_ret set[count _ret,_bItems];

civ_gear = _ret;*/