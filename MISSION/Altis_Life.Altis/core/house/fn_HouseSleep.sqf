/**
* houseMenu [*,*,*,HOUSE_NAME]
* Calls house menu  EXEC
*/

private["_house_name"];

_house_name = _this select 3;

["life_fnc_execHouseSleep", _house_name, []] call life_fnc_houseRequestCommand; //Call server for executing house menu