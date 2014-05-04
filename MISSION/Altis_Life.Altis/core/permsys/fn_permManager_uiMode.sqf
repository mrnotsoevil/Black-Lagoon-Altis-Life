/*

	set uimode of perm manager

*/

private["_mode"];

_mode = _this select 0;

switch(_mode) do 
{
	case "LEADER":
	{
		//Edit controls
		ctrlShow[2202, true];
		ctrlShow[1400, true];
		ctrlShow[2402, true];
		ctrlShow[2403, true];
		ctrlShow[1000, true];
		
		//View controls
		ctrlShow[1500, true];
	};
	case "VIEW":
	{
		//Edit controls
		ctrlShow[2202, false];
		ctrlShow[1400, false];
		ctrlShow[2402, false];
		ctrlShow[2403, false];
		ctrlShow[1000, false];
		
		//View controls
		ctrlShow[1500, true];
	};
	case "HIDDEN":
	{
		//Edit controls
		ctrlShow[2202, false];
		ctrlShow[1400, false];
		ctrlShow[2402, false];
		ctrlShow[2403, false];
		ctrlShow[1000, false];
		
		//View controls
		ctrlShow[1500, false];
	};
};