/*


	Show launder dialog
	
	 this addAction ["Geldwäscher", life_fnc_launderAction]; 

*/

if(side player  == west) exitWith
{
	hint "Du bist ein Cop!";
};

if(!(createDialog "launderdlg")) exitWith {};
waitUntil{!isNull (findDisplay 38400)};

ctrlSetText [1400, [missionNamespace getVariable "life_inv_illegalmoney"] call life_fnc_numberText];