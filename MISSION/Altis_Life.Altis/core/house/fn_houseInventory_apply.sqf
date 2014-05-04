/*
*
*
*	Applies all changes
* 	Sends SQL Request to Database
*
*/

private ["_house_inv", "_house_current_exdata", "_setarr", "_house_name", "_inventory_str"];

hint "Synchronisiere ...";

//Set exdata for later use
_house_current_exdata = missionNamespace getVariable "house_current_exdata";

//get house name
_house_name = [_house_current_exdata, "name"] call life_fnc_houseExtractDataVal;

//Use listbox 3502 to recreate HOUSEINV and put it to database
///////////////////////////////////////////////////////////////
/*_house_inv = [];

//generate ARRAY [ [NAME, COUNT] , ... ] array
for "_i" from 0 to (lbSize 3502) - 1 do //For all old items
{
	//Always get the 1st item
	_item = lbData [3502, _i];
	_count = lbValue [3502, _i];
	
	if (_count > 0) then 
	{
		_house_inv = _house_inv + [ [_item, _count] ];
	};
};*/

//call command
[ [_house_name, player, life_house_current_inv] , "HOUSE_fnc_DBapplyInventory" ,false, false] call life_fnc_MP;


//TODO
//Exec => life_action_inUse = false setzen
[1,false] call life_fnc_sessionHandle; //update player vars
