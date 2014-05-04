/*
*
* void houseExecCommand [STRING COMMAND, ARGUMENTS, SQL]
* Executes COMMAND (switch case)
*/

private["_cmd", "_house", "_args", "_data"];

_cmd = _this select 0;
_house = _this select 1;
_args = _this select 2;
_data = _this select 3;

//hintSilent format["Successful input cmd: %1", _cmd];
hintSilent "Abfrage von Datenbank wurde beantwortet.";

//sleep 2;

switch (_cmd) do
{
	case "life_fnc_execHouseMenu":
	{
		hintSilent "Gehe ins Hausmenü";
		[_house, _args, _data] call life_fnc_execHouseMenu;
	};
	case "life_fnc_execBuyHouse":
	{
		[_house, _args, _data] call life_fnc_execBuyHouse;
	};
	case "life_fnc_execSellHouse":
	{
		[_house, _args, _data] call life_fnc_execSellHouse;
	};
	case "life_fnc_execHouseSleep":
	{
		[_house, _args, _data] call life_fnc_execHouseSleep;
	};
	case "life_fnc_execHouseInventory":
	{
		[_house, _args, _data] call life_fnc_execHouseInventory;
	};
	case "life_fnc_execHouseInventory_apply":
	{
		[_house, _args, _data] call life_fnc_execHouseInventory_apply;
	};
	case "life_fnc_execHouseSearch":
	{
		[_house, _args, _data] call life_fnc_execHouseSearch;
	};
	case "life_fnc_execHouseImpound":
	{
		[_house, _args, _data] call life_fnc_execHouseImpound;
	};
	case "life_fnc_execHouseUseFurniture":
	{
		[_house, _args, _data] call life_fnc_execHouseUseFurniture;
	};
	//Key stuff
	case "life_fnc_houseExecGiveKey":
	{
		[_house, _args, _data] call life_fnc_houseExecGiveKey;
	};
	case "life_fnc_houseExecResetKeys":
	{
		[_house, _args, _data] call life_fnc_houseExecResetKeys;
	};
	
	default
	{
		hint format ["ERR: houseExecCommand: %1 not found", _cmd];
	};
};