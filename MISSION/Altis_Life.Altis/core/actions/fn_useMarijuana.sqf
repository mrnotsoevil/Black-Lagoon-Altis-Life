/*
	@Version: 2.0
	@Author: Tonic, [BWG] Joe
	@Edited: 07.11.2013
*/
_smoke = "SmokeShell" createVehicle position player;
if (vehicle player != player) then {
	_smoke attachTo [vehicle player, [0,-1,0]];
} else {
	_smoke attachTo [player, [0,0,1]];
};
	
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
sleep 2.25;	

private["_force"];
for "_i" from 0 to 20 do {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
	"colorCorrections" ppEffectCommit 1;	
	sleep 2.25;
};

"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;