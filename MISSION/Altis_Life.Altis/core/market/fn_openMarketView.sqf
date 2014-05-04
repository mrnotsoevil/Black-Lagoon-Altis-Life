/*

	Open pack-up dlg

*/

if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;



waitUntil {!isnull (findDisplay 39500)};


//Refresh
[] spawn life_fnc_refreshMarketView;