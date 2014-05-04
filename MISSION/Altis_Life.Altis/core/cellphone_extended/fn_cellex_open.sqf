/*
	Opens extended cellphone menu
*/
private["_display","_units","_type","_index"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;

lbClear 1500;

if((call life_adminlevel) < 1) then
{
	ctrlShow [2402, false];
};

//Fill listbox with default stuff
/////////////////////////////////

_index = lbAdd [1500, "Alle Polizisten"];
lbSetValue[1500,_index,1];
lbSetColor[1500,_index,[0,0.1,1,1]];

if( (call life_coplevel) >= 1) then
{
	_index = lbAdd [1500, "Polizeimeldung"];
	lbSetValue[1500,_index,5];
	lbSetColor[1500,_index,[0,0.1,1,1]];
};

_index = lbAdd [1500, "Admins/Support"];
lbSetValue[1500,_index,2];
lbSetColor[1500,_index,[0.8,0,0,1]];

if( (call life_adminlevel) >= 1) then
{
	_index = lbAdd [1500, "Adminmeldung"];
	lbSetValue[1500,_index,4];
	lbSetColor[1500,_index,[0.8,0,0,1]];
};

//ADAC
_index = lbAdd [1500, "ADAC rufen"];
lbSetValue[1500,_index,6]; //ID:6
lbSetColor[1500,_index,[1,1,0,1]];

//EMPTY PLACEHOLDER
_index = lbAdd [1500, ""];
lbSetValue[1500,_index,-1];

//Fill listbox with online players
/////////////////////////////////
{
	if(alive _x && _x != player) then
	{
		_index = lbAdd [1500, name _x];
		lbSetData[1500,_index,str(_x)];
		lbSetValue[1500,_index,0];		
		
		switch (side _x) do
		{
			case west: {lbSetColor[1500,_index,[0.33,0.62,0.78,1]];};
			case civilian: {lbSetColor[1500,_index,[1,1,1,1]];};
		};		
	};
} foreach playableUnits;

lbSetCurSel [1500,0]; //default