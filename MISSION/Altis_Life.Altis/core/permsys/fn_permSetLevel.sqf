/*

	Sets the permlevel of PERMID for this player 
	
	permSetLevel [SRC, PERMID, LEVEL, SRCLVL, SRCADMLVL]

*/

private["_permid", "_level", "_source", "_src_lvl", "_src_adm_lvl","_perm_max_level","_perm_name","_perm_perm", "_perm_logo","_done","_valid","_message","_oldlevel", "_adminmode"];

_source = _this select 0;
_permid = _this select 1;
_level = _this select 2;
_src_lvl = _this select 3;
_src_adm_lvl = _this select 4;

_adminmode = _src_adm_lvl > 0;
_oldlevel = [_permid] call life_fnc_permLevel; //get old level of player

//Check if PERM is available
[] call life_fnc_dynPermCheckout;

if(life_dynperm_checkout_running) then
{
	systemChat "Du bekommst einen Perm gesetzt, der gerade nicht geladen ist. Bitte warten.";
};

waitUntil { !life_dynperm_checkout_running; };

/*
Collect all perm information here
*/
_perm_max_level = -1;
_perm_name = "INVALID";
_perm_perm = [];
_perm_logo = "";

//Load perm data
{
	if ( (_x select 0) == _permid) exitWith
	{		
		_perm_max_level = (_x select 2);
		_perm_name = (_x select 1);
		_perm_perm = (_x select 4);		
		_perm_logo = (_x select 5);
	};
}
foreach ([] call life_fnc_perms);

/*
Perm found?
*/
if(_perm_max_level == -1 || _perm_name == "INVALID") exitWith
{
	[[0,format[">PERM< Spieler %1 wollte auf nicht vorhandenes Perm %2 zugreifen! BITTE ADMIN MELDEN!", name player, _permid]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};


//Access and integrity check
_valid = true;
switch(true) do
{
	//Integrity Check (here!!!!)
	case (_level < 0): { _valid = false; };
	case (_level > _perm_max_level): {_valid = false; };
	case (_level == _oldlevel): { _valid = false; }; //prevent database update spamming
	
	//Permission check
	case (_adminmode) : { _valid = true; }; //Just allow all admin stuff
	
	case ( !([_permid, "LEADER", _src_lvl] call life_fnc_permRule)): {_valid = false; }; //Prevent non leader messing up with stuff
	
	case (_level > _oldlevel && !([_permid, "RANKUP", _src_lvl] call life_fnc_permRule)): {_valid = false;};
	case (_level < _oldlevel && !([_permid, "RANKDOWN", _src_lvl] call life_fnc_permRule)): {_valid = false;};
	
	case (_level > _src_lvl ): {_valid = false;}; //Dont allow granting more permission, you are able to grant
	case (_oldlevel > _src_lvl ): {_valid = false;}; //Dont mess with persons with greater levels	
	case (_level >= _src_lvl && !([_permid, "SUPER", _src_lvl] call life_fnc_permRule)): {_valid = false;}; //Prevent setting level as high as own level if not SUPER
	
	case (_oldlevel == _src_lvl && !([_permid, "SUPER", _src_lvl] call life_fnc_permRule)): {_valid = false;}; //Prevent messing up with level of person with same rights if not SUPER
	case (_source == player && !([_permid, "SELF", _src_lvl] call life_fnc_permRule)): {_valid = false;}; //if not SELF, dont allow messing up with own rank!
};

if(!_valid) exitWith
{
	[[0,format[">PERM< Konnte Perm für Spieler %1 der Gruppe '%2' nicht auf %3 setzen!", name player, _perm_name, _level]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};


//PermissionCheck
_valid = true;
{
	switch(_x) do 
	{
		case "cop":
		{
			if(playerSide != west) then
			{
				_valid = false;
			};
		};
		
		case "donator":
		{
			if((call life_donator) < 1) then
			{
				_valid = false;
			};
		};
		
		case "reb":
		{
			if(!license_civ_rebel) then
			{
				_valid = false;
			};
		};
	};
}
foreach _perm_perm;

if(!_valid) exitWith
{
	[[0,format[">PERM< Spieler %1 hat keine Erlaubnis für '%2'!", name player, _perm_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};

/*

	Exceute PERM set

*/
_done = false;

{
	if ( (_x select 0) == _permid) exitWith
	{
		_x set [1, _level];
		_done = true;
	};
}
foreach life_player_perms;

if(!_done) then
{
	life_player_perms set [count life_player_perms, [_permid, _level]];
};

//[[0,format[">PERM< Spieler %1 hat nun Level %2 für die Gruppe'%3'.", name player, _level, _perm_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;


switch(true) do 
{
	case (_oldlevel == _level) : {};
	case (_level == 0):
	{
		_message = format["<img size='10' color='#FFFFFF' image='%1'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.5'>Herausgeworfen!</t><br/><t size='1'>Du bist nun kein Mitglied der Gruppe mehr!</t>", _perm_logo,_perm_name];
		hint parseText _message;
	};
	case (_oldlevel == 0):
	{
		_message = format["<img size='10' color='#FFFFFF' image='%1'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.5'>Level %3</t><br/><t size='1'>Du wurdest in die Gruppe aufgenommen!</t>", _perm_logo,_perm_name, _level];
		hint parseText _message;
	};
	case (_level > _oldlevel):
	{
		_message = format["<img size='10' color='#FFFFFF' image='%1'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.5'>Level %3</t><br/><t size='1'>Du hast einen höheren Rang bekommen!</t>", _perm_logo,_perm_name, _level];
		hint parseText _message;
	};
	case (_level < _oldlevel):
	{
		_message = format["<img size='10' color='#FFFFFF' image='%1'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.5'>Level %3</t><br/><t size='1'>Dein Rang wurde herabgestuft!</t>", _perm_logo,_perm_name, _level];
		hint parseText _message;
	};
};

if(_adminmode) then
{
	[[0,format["!!!ADMIN: >PERM< %2 von %1 wurde auf %3 gesetzt!", name player, _perm_name, _level]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};

//Sync
 [1,false] call life_fnc_sessionHandle;