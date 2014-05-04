/*
*
* houseImpound [house_name]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy", "_house_inventory", "_money_val", "__item", "__count", "__impound_money", "_impound_val", "_illegal_value_cop", "__i_item", "__i_value", "__willimpound"];

__impound_money = false; //HARDCODE select 0


/////////////////////////////

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_money_val = 0;
_impound_val = missionNamespace getVariable "house_cop_illegal_value";

_name = [_exdata, "name"] call life_fnc_houseExtractDataVal;
_house_inventory = [_exdata, "inventory"] call life_fnc_houseExtractDataVal;

//////////////////modify array
for "_i" from 0 to (count _house_inventory) - 1 do
{
	__item = (_house_inventory select _i) select 0;
	__count = (_house_inventory select _i) select 1;
	
	
	if(__count > 0) then
	{
		__willimpound = false; //check if will impound
	
		//Check if will impound
		/*if(__item == "money") then
		{
			if(__impound_money) then
			{
				_money_val = _money_val + __count; //add money to money val
			
				//set array pos i to -1
				__willimpound = true;
			};
		};*/
	
		//Check if illegal and add illegal value
		{
			__i_item = _x select 0;
			__i_value = _x select 1;
	
			if(__i_item == __item) then //illegal item found
			{
				//add count * VALUE to _impound_val
				//_impound_val = _impound_val + (_count * __i_value);
		
				//set array pos i to -1
				//_house_inventory set [___index, -1];
			
				__willimpound = true;
			};
		}
		foreach life_illegal_items;
	
	
		///////////Apply impound
		//INJECT House upgrade ##34 here
		if(__willimpound) then
		{
			_house_inventory set [_i, [__item, 0] ]; //set array @ position to zero (hopefully will be OK)
		};
	};
};

//_house_inventory = _house_inventory - [-1]; //modified inventory //@@@ removed due set to zero

//calculate money for cop
_illegal_value_cop = round ( _impound_val * 0.5);

if(isNil "_illegal_value_cop") exitWith {hint "Fehler!";};

/////////////////refresh lic
//call command
[ [_name, player, _house_inventory, _illegal_value_cop] , "HOUSE_fnc_DBimpound" ,false, false] call life_fnc_MP;