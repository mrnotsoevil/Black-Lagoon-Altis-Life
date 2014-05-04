/*
	
	Requests database to update money timings

*/
private["_query"];

//call command
[ [player, getPlayerUID player], "LAUNDER_fnc_launderMoneyTimer" ,false, false] call life_fnc_MP;