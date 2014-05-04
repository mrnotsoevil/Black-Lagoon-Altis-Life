/*


	Unpack a repairkit
	Gives back kit if no MAININV place

*/

hint "Repairkit wird ausgepackt ...";
sleep 2;

if(player canAdd "ToolKit") then
{
	//Add item
	["ToolKit",true,false,true,false] call life_fnc_handleItem;

	//Hotfix in for cop gear
	if(playerSide == west) then
	{
		[] call life_fnc_saveGear;
	};
	
	hint "Erfolgreich ausgepackt.";
}
else
{

	[true,"vrepairkit",1] call life_fnc_handleInv;
	
	hint "Repairkit konnte nicht ausgepackt werden.";
	sleep 3;
	hint "Du hast das Item wiederbekommen.";
};