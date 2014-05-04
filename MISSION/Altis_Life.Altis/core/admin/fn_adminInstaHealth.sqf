/**
*	instaHealth(BOOL health, food, water)
*
*/



private ["_health", "_food", "_water"];
_health = _this select 0;
_food = _this select 1;
_water = _this select 2;

if((call life_adminlevel) < 1) exitWith {};



if(_health) then
{
	[[0,format["ADMIN: %1 hat Gesundheit auf 100 gesetzt.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	player setDamage 0;
	player setFatigue 0;
};

if(_food) then
{
	[[0,format["ADMIN: %1 hat Hunger auf 100 gesetzt.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	life_hunger = 100;
	player setFatigue 0;
};

if(_water) then
{
	[[0,format["ADMIN: %1 hat Durst auf 100 gesetzt.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	life_thirst = 100;
	player setFatigue 0;
};


/////////////Hints
if(_health) then
{
	hint "Gesundheit auf 100 gesetzt.";
	sleep 2;
};

if(_food) then
{
	hint "Hunger auf 100 gesetzt.";
	sleep 2;
};

if(_water) then
{
	hint "Durst auf 100 gesetzt.";
};

