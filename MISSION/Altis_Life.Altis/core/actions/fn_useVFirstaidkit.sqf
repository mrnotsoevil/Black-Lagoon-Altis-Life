/*


	Unpack a repairkit
	Gives back kit if no MAININV place

*/

hint "First-Aid Kit wird ausgepackt ...";
sleep 2;

if(player canAdd "FirstAidKit") then
{
	//Add item
	["FirstAidKit",true,false,true,false] call life_fnc_handleItem;

	//Hotfix in for cop gear
	if(playerSide == west) then
	{
		[] call life_fnc_saveGear;
	};
	
	hint "Erfolgreich ausgepackt.";
}
else
{

	[true,"vfirstaidkit",1] call life_fnc_handleInv;
	
	hint "First-Aid Kit konnte nicht ausgepackt werden.";
	sleep 3;
	hint "Du hast das Item wiederbekommen.";
};