/*

	Show cop license to target player

*/

private["_target", "_message","_rank","_coplevel"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_rank = "Kein Cop !?";
_coplevel = call life_coplevel;

//Set rank
/*switch ( _coplevel ) do
{
	case 1: { _rank = "Rekrut"; };
	case 2: { _rank = "Private"; };
	case 3: { _rank = "Lieutenant"; };
	case 4: { _rank = "* Captain *"; };
	case 5: { _rank = "** Colonel **"; };
	case 6: { _rank = "*** General ***"; };
	default {_rank =  "# Uber-General #";};
};*/
/*switch ( _coplevel ) do
{
	case 1: { _rank = "Rekrut"; };
	case 2: { _rank = "Officer"; };	
	case 3: { _rank = "Corporal"; };	
	case 4: { _rank = "Sergeant"; };
	case 5: { _rank = "Lieutenant"; };
	case 6: { _rank = "Captain"; };
	case 7: { _rank = "Major"; };
	case 8: { _rank = "Colonel"; };
	case 9: { _rank = "Chief"; };
	default {_rank =  "SSoMSttm";}; //Super Sergeant of Master Sergeants to the max
};*/

_rank = ["cop", _coplevel] call life_fnc_permLevelName;

//Compose message
//_message = composeText [ image "images\police_gold.paa", lineBreak, lineBreak, name player, lineBreak, "Altis Police Department" ];
_message = format["<img size='10' color='#FFFFFF' image='images\police_gold.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.5'>%2</t><br/><t size='1'>Altis Police Department</t>", name player, _rank];

//Show license to target player
[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
//[[[_message],{ hintSilent (_this select 0); }],"BIS_fnc_call",_target,false] spawn life_fnc_MP;
//[_message,"hintSilent",_target,false] spawn BIS_fnc_MP;