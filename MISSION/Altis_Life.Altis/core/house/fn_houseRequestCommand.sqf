/**
* void houseRequestCommand [COMMANDNAME, HOUSE, ARGUMENTS, (QUERY)]
*
*Sends data to @life-server to process database stuff
**/ 

hint "Frage Datenbank ab ...";

private["_command","_args","_house", "_query"];

_command  = _this select 0;
_house = _this select 1;
_args = _this select 2;
//_query = format["SELECT * FROM homes WHERE name='%1' ", _house]; //DEFAULT QUERY CUSTOMIZED FOR OTHER COMMANDS
_query = [_this, 3, format["SELECT * FROM homes WHERE name='%1' ", _house]] call BIS_fnc_param; //Accept query param

//call command
[ [_command, _house, _args, player, _query], "HOUSE_fnc_requestCommand" ,false, false] call life_fnc_MP;