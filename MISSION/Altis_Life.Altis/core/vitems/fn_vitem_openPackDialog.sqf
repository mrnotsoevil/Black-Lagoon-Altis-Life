/*

	Open pack-up dlg

*/

if(!createDialog "packItem") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

//Unholster ##112
if(life_n_holstered) then
{
	[false] call life_fnc_holsterWeapons;
};




waitUntil {!isnull (findDisplay 39400)};


//Refresh
[] spawn life_fnc_vitem_refreshPackDialog;


waitUntil {isnull (findDisplay 39400)};
//Refresh inventory dialog!

[] call life_fnc_p_updateMenu;