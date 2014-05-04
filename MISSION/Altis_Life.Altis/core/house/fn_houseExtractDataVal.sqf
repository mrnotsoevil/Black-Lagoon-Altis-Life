/*
* houseExtractDataVal [DATA_ARR, VAL];
*
*/

private ["_data","_val"];

_data = _this select 0;
_val = _this select 1;

if( count _data < 11) exitWith
{
	hint "houseExtractDataVal: invalid number of data entries!";
};

switch(_val) do
{
	case "id": { (_data select 0); };
	case "owner": { (_data select 1); };
	case "price": { (_data select 2); };
	case "home_group": { (_data select 3); };
	case "group": { (_data select 3); };
	case "name": { (_data select 4); };
	case "marker_spawn": { (_data select 5); };
	case "marker_car_spawn": { (_data select 6); };
	case "inventory": { (_data select 7); };
	case "owned": { (_data select 8); };
	case "price_sell": { (_data select 9); };
	case "inventory_weight": { (_data select 10); };
	case "ownername": { (_data select 11); };
	case "inventory_maxweight": { (_data select 12); };
	case "safe_upgrade": { (_data select 13); };	
	case "safe_inventory": { (_data select 14); };
	case "trustedpersons": { (_data select 15); };
	case "buyable": { (_data select 16); };
	case "donator": { (_data select 17); };
	default { hint format ["houseExtractDataVal: Conversion error %1 not found.", _val]; -1; };
};
