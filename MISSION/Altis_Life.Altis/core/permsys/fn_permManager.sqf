/*

	Opens the PERM manager
	
*/

life_permmanager_admin = false;
life_permmanager_player_perms = []; // [player, PERMS]
life_permmanager_data_receive_time = time;
life_permmanager_permid = "";
life_permmanager_permindex = -1;
life_permmanager_list_refreshing = false;

if(life_dynperm_checkout_running) exitWith
{
	hint "Es werden gerade PERMS geladen. Bitte ein wenig warten.";
};

private["_display","_index"];
disableSerialization;

createDialog "perm_dlg_new";

_display = findDisplay 29550;

//Populate list with GROUPS
lbClear 2100;

{
	_index = lbAdd[2100, _x select 1];
	lbSetData[2100, _index, _x select 0];
	lbSetValue[2100, _index, _forEachIndex];
}
foreach ([] call life_fnc_perms);

//[] call life_fnc_permManager_update;

//Trigger UPATE by selecting one item (assuming, there are > 0 groups)
lbSetCurSel[2100, 0];