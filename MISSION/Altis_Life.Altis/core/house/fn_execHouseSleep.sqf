private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_player_damage", "_house_price_sell", "_heal"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

//hint _house_data;

_house_data = call compile format["%1", _house_data]; //compile data

//////////////////Parse data
_exdata = _house_data call life_fnc_houseExtractData;

if (count _exdata == 0) exitWith { hint "Konnte zugehoriges Haus nicht laden."; };

//Set player variable house_current_exdata
missionNameSpace setVariable ["house_current_exdata", _exdata];

//////////////////TODO
//Check if house belongs to player

diag_log format [ "%1 is trying to access %2 ...", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];

/*_canview = true;
if( [_exdata, "owned"] call life_fnc_houseExtractDataVal ) then //If owned
{
	if ( ([_exdata, "owner"] call life_fnc_houseExtractDataVal) != name player) then //if player not owner
	{
		_canview = false;
	};
};*/

_canview = _exdata call life_fnc_houseCanAccess; //replaced by life_fnc_houseCanAccess

if(!_canview) exitWith
{
	hint "Kein Zugriff!";
	diag_log format [ "%1 tried to access to %2, not belonging to player", name player, [_exdata, "name"] call life_fnc_houseExtractDataVal];
};

//Sleep
disableUserInput true;

//Remember damage
_player_damage = damage player;
_heal = true;

for "_i" from 0 to 10 do 
{
	sleep 2;
	titleText["Zzzz zzzzzzzzzzzz .........","BLACK FADED"];
	
	if( _player_damage != damage player) exitWith
	{
		_heal = false;
	};
};

disableUserInput false;

if(!_heal) then
{
	hint "Du wurdest unterbrochen und wurdest nicht geheilt. Du hast dich aber etwas erholt.";
	player setFatigue 0;
}
else
{
	hint "Du hast dich ausgeruht und bist etwas geheilt worden.";
	player setFatigue 0;
	
	if(damage player > 0.2) then
	{	
		player setDamage 0.2;
	};
};