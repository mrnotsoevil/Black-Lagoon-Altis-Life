#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_plist","_pside","_vlist"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_plist = _display displayCtrl 1500;
_vlist = _display displayCtrl 1501;


if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _plist;

{
	_pside = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"?"};};
	_plist lbAdd format["%1 - %2", name _x,_pside];
	_plist lbSetdata [(lbSize _plist)-1,str(_x)];
} foreach playableUnits;

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

////////////Init vehicle list
lbClear _vlist;

/*{
	_vlist lbAdd "TYPE | NAME";
	_vlist lbSetData [(lbSize _vlist) - 1,"ID"];
}*/

/*	_vlist lbAdd "Auto | Off Road Truck";
	_vlist lbSetData [(lbSize _vlist) - 1,"C_Offroad_01_F"];


	_vlist lbAdd "Heli | MH-9 Hummingbird";
	_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Light_01_F"];


	_vlist lbAdd "Boot | Rescue Boat";
	_vlist lbSetData [(lbSize _vlist) - 1,"C_Rubberboat"];


	_vlist lbAdd "Bike | Quad";
	_vlist lbSetData [(lbSize _vlist) - 1,"B_Quadbike_01_F"];*/
	

_vlist lbAdd "Bike | Quad";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Quadbike_01_F"];
	
	
_vlist lbAdd "Boot | Rescue Boat";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Lifeboat"];


_vlist lbAdd "Boot | Assault Boat";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Boat_Transport_01_F"];


_vlist lbAdd "Boot | Motorboat";
_vlist lbSetData [(lbSize _vlist) - 1,"C_Boat_Civil_01_F"];


_vlist lbAdd "Boot | Speedboat HMG";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Boat_Armed_01_HMG_F"];


_vlist lbAdd "Boot | Speedboat Minigun";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Boat_Armed_01_Minigun_F"];


_vlist lbAdd "Boot | SDV";
_vlist lbSetData [(lbSize _vlist) - 1,"B_SVD_01_F, O_SVD_01_F"];


_vlist lbAdd "Auto | HEMTT";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Truck_01_mover_F, B_Truck_01_box_F"];


_vlist lbAdd "Auto | HEMTT Container";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Truck_01_box_F"];


_vlist lbAdd "Auto | Tempest";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Truck_03_transport_F"];


_vlist lbAdd "Auto | Tempest abgedeckt";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Truck_03_covered_F"];


_vlist lbAdd "Auto | Boxer";
_vlist lbSetData [(lbSize _vlist) - 1,"C_Van_01_box_F"];


_vlist lbAdd "Auto | SUV";
_vlist lbSetData [(lbSize _vlist) - 1,"C_SUV_01_F"];


_vlist lbAdd "Auto | Hatchback";
_vlist lbSetData [(lbSize _vlist) - 1,"C_Hatchback_01_F"];


_vlist lbAdd "Auto | Hatchback Sport";
_vlist lbSetData [(lbSize _vlist) - 1,"C_Hatchback_01_sport_F"];


_vlist lbAdd "Auto | Offroader";
_vlist lbSetData [(lbSize _vlist) - 1,"B_G_Offroad_01_F"];


_vlist lbAdd "Auto | Hunter";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MRAP_01_F"];


_vlist lbAdd "Auto | Ifrit";
_vlist lbSetData [(lbSize _vlist) - 1,"O_MRAP_02_F"];


_vlist lbAdd "Auto | Strider";
_vlist lbSetData [(lbSize _vlist) - 1,"I_MRAP_03_F"];


_vlist lbAdd "Auto | Van";
_vlist lbSetData [(lbSize _vlist) - 1,"B_G_Van_01_transport_F"];


_vlist lbAdd "Auto | Zamak abgedeckt";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Truck_02_covered_F"];


_vlist lbAdd "Auto | Zamak offen";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Truck_02_transport_F"];


_vlist lbAdd "Auto | Offroader HMG";
_vlist lbSetData [(lbSize _vlist) - 1,"B_G_Offroad_01_armed_F"];


_vlist lbAdd "Auto | Hunter HMG";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MRAP_01_hmg_F"];


_vlist lbAdd "Auto | Ifrit HMG";
_vlist lbSetData [(lbSize _vlist) - 1,"O_MRAP_02_hmg_F"];


_vlist lbAdd "Auto | Strider HMG";
_vlist lbSetData [(lbSize _vlist) - 1,"I_MRAP_03_hmg_F"];


_vlist lbAdd "Auto | Hunter GMG";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MRAP_01_gmg_F"];


_vlist lbAdd "Auto | Ifrit GMG";
_vlist lbSetData [(lbSize _vlist) - 1,"O_MRAP_02_gmg_F"];


_vlist lbAdd "Auto | Strider GMG";
_vlist lbSetData [(lbSize _vlist) - 1,"I_MRAP_03_gmg_F"];


_vlist lbAdd "Panzer | MSE-3 Marid";
_vlist lbSetData [(lbSize _vlist) - 1,"O_APC_Wheeled_02_rcws_F"];


_vlist lbAdd "Panzer | IFV-6c Panther";
_vlist lbSetData [(lbSize _vlist) - 1,"B_APC_Tracked_01_rcws_F"];


_vlist lbAdd "Panzer | AMV-7 Marshall";
_vlist lbSetData [(lbSize _vlist) - 1,"B_APC_Wheeled_01_cannon_F"];


_vlist lbAdd "Panzer | BTR-K Kamysh";
_vlist lbSetData [(lbSize _vlist) - 1,"O_APC_Tracked_02_cannon_F"];


_vlist lbAdd "Panzer | AFV-4 Gorgon";
_vlist lbSetData [(lbSize _vlist) - 1,"I_APC_Wheeled_03_cannon_F"];


_vlist lbAdd "Panzer | IFV-6a Cheetah";
_vlist lbSetData [(lbSize _vlist) - 1,"B_APC_Tracked_01_AA_F"];


_vlist lbAdd "Panzer | ZSU-39 Tigris";
_vlist lbSetData [(lbSize _vlist) - 1,"O_APC_Tracked_02_AA_F"];


_vlist lbAdd "Panzer | M5 Sandstorm MLRS";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MBT_01_mlrs_F"];


_vlist lbAdd "Panzer | 2S9 Sochor";
_vlist lbSetData [(lbSize _vlist) - 1,"O_MBT_02_arty_F"];


_vlist lbAdd "Panzer | M4 Scorcher";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MBT_01_arty_F"];


_vlist lbAdd "Panzer | M2A1 Slammer";
_vlist lbSetData [(lbSize _vlist) - 1,"B_MBT_01_cannon_F"];


_vlist lbAdd "Panzer | T-100 Varsuk";
_vlist lbSetData [(lbSize _vlist) - 1,"O_MBT_02_cannon_F"];


_vlist lbAdd "Panzer | FV-720 Mora";
_vlist lbSetData [(lbSize _vlist) - 1,"I_APC_tracked_03_cannon_F"];


_vlist lbAdd "Panzer | MBT-52 Kuma";
_vlist lbSetData [(lbSize _vlist) - 1,"I_MBT_03_cannon_F"];


_vlist lbAdd "Heli | MH-9 Hummingbird";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Light_01_F"];


_vlist lbAdd "Heli | MH-9 Hummingbird bewaffnet";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Light_01_armed_F"];


_vlist lbAdd "Heli | PO-30 Orca";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Heli_Light_02_unarmed_F"];


_vlist lbAdd "Heli | PO-30 Orca bewaffnet";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Heli_Light_02_F"];


_vlist lbAdd "Heli | WY-55 Hellcat";
_vlist lbSetData [(lbSize _vlist) - 1,"I_Heli_light_03_unarmed_F"];


_vlist lbAdd "heli | WY-55 Hellcat bewaffnet";
_vlist lbSetData [(lbSize _vlist) - 1,"I_Heli_light_03_F"];


_vlist lbAdd "Heli | CH-49 Mohawk";
_vlist lbSetData [(lbSize _vlist) - 1,"I_Heli_Transport_02_F"];


/*_vlist lbAdd "Heli | AH-9 Pawnee";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Light_01_armed_F"];*/


_vlist lbAdd "Heli | UH-80 Ghosthawk";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Transport_01_camo_F"];


_vlist lbAdd "Heli | Mi-48 Kajman";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Heli_Attack_02_F"];


_vlist lbAdd "Heli | AH-99 Blackfoot";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Heli_Attack_01_F"];


_vlist lbAdd "Jet | A-143 Buzzard Luftabwehr";
_vlist lbSetData [(lbSize _vlist) - 1,"I_Plane_Fighter_03_AA_F"];


_vlist lbAdd "Jet | A-143 Buzzard Luftunterstützung";
_vlist lbSetData [(lbSize _vlist) - 1,"I_Plane_Fighter_03_CAS_F"];


_vlist lbAdd "Jet | To 199 Neophron";
_vlist lbSetData [(lbSize _vlist) - 1,"O_Plane_CAS_02_F"];


_vlist lbAdd "Jet | A-164 Wipeout";
_vlist lbSetData [(lbSize _vlist) - 1,"B_Plane_CAS_01_F"];
