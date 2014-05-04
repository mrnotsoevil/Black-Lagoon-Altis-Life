/*

	handsUp [???, ???, ???, BOOL up/down] 

*/

private["_player", "_putup","_playerpos","_curMags"];

_putup = _this select 3;

/*if(life_hands_up) then //if hands are already up
{
	if(_putup) exitWith {};
	
	//Put hands down
	////////////////
	[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	life_hands_up = true;
}*/
if(!life_hands_up) then //if hands are down => hands up
{
	if(!_putup) exitWith {};
	if(player getVariable ["restrained", false] || life_istazed || !(alive player) || player getVariable["Escorting",false] ) exitWith {};
	
	
	systemChat "Du nimmst die Hände hoch.";
	
	if(currentWeapon player != "") then
	{
		[true] call life_fnc_holsterWeapons;
		sleep 2;
	};
			
	
	//Put hands up
	////////////////
	[[player,"AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	
	life_hands_up = true;		
	_playerpos = position player;
	
	sleep 2;
	
	//wait until set down or tazed or restrained
	waitUntil 
	{ 
		private["_ret"];
		_ret = !life_hands_up || player getVariable ["restrained", false] || life_istazed || !(alive player) || player getVariable["Escorting",false];

		if(!_ret) then
		{
			if(_playerpos distance (position player) > 0.1) then
			{
				_ret = true;
			};
			
		};
		
		_ret;
	};
	
	systemChat "Du nimmst die Hände wieder herunter.";
	
	//Disable animation
	[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;	 //amovppnemstpsraswrfldnon
	life_hands_up = false;
	
	//waitUntil{animationState player != "AmovPercMstpSnonWnonDnon";};
	
	/*sleep 4;
	[false] call life_fnc_holsterWeapons;*/

}
else
{
	life_hands_up = true;
};