/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop","_conditions","_condok"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
//if(_shop == "cop" && playerSide != west) exitWith {hint "You are not a cop."};

//Check conditions
_shop_data = [life_shop_type] call life_fnc_virt_shops;
_condok = true;

if(count _shop_data >= 3) then
{
	_conditions = _shop_data select 2;
	
	{
		switch (_x) do 
		{
			case "cop": { _condok = _condok && (playerSide == west); };
			case "reb": { _condok = _condok && license_civ_rebel; };
			case "event": { _condok = _condok && [] call life_fnc_playerInEvent; };
			case "donator": { _condok = _condok && ((call life_donator) > 0); };
			case "adac": { _condok = _condok && (["adac"] call life_fnc_permLevel) > 0; };
		};
	}
	foreach _conditions;
};

if(!_condok) exitWith {hint "Du kannst hier nicht kaufen!"; };


createDialog "shops_menu";



[] call life_fnc_virt_update;