/*



	Generates inventory Array [ [item,count], ... ] from inventory


	##43
*/ 

private ["_inventory", "_shortname", "_count"];

_inventory = [];

{
	_count = missionNamespace getVariable _x;
	_shortname = [_x, 1] call life_fnc_varHandle; //convert to short name
	
	if(_count > 0) then
	{
		_inventory = _inventory + [ [_shortname, _count ] ];
	};
}
foreach life_inv_items;

/*hint format ["Created Inventory array %1", str _inventory];
sleep 3;*/

_inventory;