/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the player / cops gear in a formatted array.
*/
private["_launcher","_allowedItems","_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];

//Pre-approved weapons / attachments
/*_allowedItems =
[
	"arifle_MXC_Black_F",
	"muzzle_snds_H",
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer",
	"SMG_02_F",
	"muzzle_snds_L",
	"30Rnd_9x21_Mag",
	"SMG_01_F",
	"muzzle_snds_acp",
	"30Rnd_45ACP_Mag_SMG_01",
	"30Rnd_45ACP_Mag_SMG_01_tracer_green",
	"acc_flashlight",
	"acc_pointer_IR",
	"optic_Holosight",
	"optic_Holosight_smg",
	"optic_Hamr",
	"optic_MRCO",
	"hgun_Pistol_heavy_01_F",
	"11Rnd_45ACP_Mag",
	"optic_MRD",
	"arifle_MX_Black_F",
	"arifle_MX_SW_Black_F",
	"muzzle_snds_H_MG",
	"100Rnd_65x39_caseless_mag",
	"100Rnd_65x39_caseless_mag_Tracer",
	"arifle_MXM_Black_F",
	"srifle_EBR_F",
	"20Rnd_762x51_Mag",
	"optic_Arco",
	"optic_SOS",
	"optic_NVS"	
];*/

//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];
_launcher = secondaryWeapon player; //added

//if(!(_primary in _allowedItems)) then {_primary = ""};
//if(!(_handgun in _allowedItems)) then {_handgun = ""};
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

player selectWeapon _curWep;

life_n_holster_data = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_launcher];