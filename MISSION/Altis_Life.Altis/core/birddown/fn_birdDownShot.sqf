/*

	Called when vehicle is hit by BD-Weapon

*/

private["_sender","_vehicle","_type","_sender"];

_sender = _this select 0;
_vehicle = _this select 1;
_type = _this select 2;
_sender = _this select 3;

if(_sender == _vehicle) exitWith {};

switch(_type) do 
{
	case "BDMK1":
	{
		_vehicle setFuel 0.05;
	};
	case "BDMK2":
	{
        _vehicle setFuel 0;
		_vehicle setDamage 0.95;
	};
};