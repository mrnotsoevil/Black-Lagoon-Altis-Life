#include <macro.h>

/*

	Black Lagoon Altis Life Permission System (perm)

*/

//Schema:
//   0        1         2            3            4                                5      6
// PERMID, PERMNAME, MAXLEVEL, RULECONFIG, MEMBER_CONDITIONS [cop,reb,donator], LOGO, LEVELNAMES

/*


	RULECONFIG:
	Array of leader rules
	
	[ [LEVEL, [RULESET+] ]

	RULESET = [LEADER, RANKUP, RANKDOWN, SELF, SUPER, VIEW, (CUSTOM PERMS)] 
	
	* SUPER ... CAN CONTROL RANK OF HIGHER LEVELS
	* SELF ... Can set own rank
	* VIEW ... can view list of players
	


*/

life_perms = [

	//Polizei-Verwaltung, will overwrite sessionReceive!
	["cop", "Altis Police Department", 9, [ 
	
		[1, ["VIEW"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW","RESTRAIN"]],
		[5, ["VIEW","RESTRAIN"]],
		[6, ["VIEW","RESTRAIN"]],
		[7, ["VIEW","RESTRAIN"]],
		[8, ["VIEW","RESTRAIN"]],
		[9, ["LEADER", "RANKUP", "RANKDOWN", "SUPER", "VIEW","RESTRAIN"]]
	], 
	[], "images\police_gold.paa",
	["Kein Mitglied","Rekrut", "Officer", "Corporal","Sergeant","Lieutenant","Captain","Major","Colonel","Chief"]], 
	
	//ADAC
	["adac", "ADAC", 3, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["LEADER", "RANKUP", "RANKDOWN", "VIEW","RESTRAIN"]]
	],  
	[], "images\ADAC_256.paa",
	["Kein Mitglied","ADAC-Rekrut", "ADAC-Mitarbeiter", "ADAC-Chef"]],
	
	//EVENTS
	["event","Black Lagoon Events", 3,[ 
		[2, ["VIEW"]],
		[3, ["LEADER", "RANKUP", "RANKDOWN", "VIEW"]]
	],  
	[], "images\Black_lagoon_Flame_256.paa",
	["Kein Mitglied","Mitglied", "Helfer", "Leiter"]]
	
	/*
	User requested groups
	*/
	//BloodZ User Group
	/*["user_bloodz", "BloodZ", 7, [ 
		[0, []],
		[1, ["VIEW"]],
		[2, ["VIEW"]],
		[3, ["VIEW"]],
		[4, ["VIEW"]],
		[5, ["VIEW"]],		
		[6, ["LEADER", "RANKUP", "RANKDOWN", "VIEW"]],
		[7, ["LEADER", "RANKUP", "RANKDOWN", "VIEW"]]
	],  
	[], "images\logo_user\bloodz.paa",
	["Kein Mitglied",
	"Blood-Praktikant",
	"Blood-Grünschnabel",
	"Blood-Dealer",
	"Blood-Hitman",
	"Blood-Rechte Hand",
	"Blood-CoLeader",
	"Blood-Leader"]]*/

];

life_dynperms = []; //Dynamic perms, loaded by database


///////////////////////////// Autoconfig
life_player_perms = []; //[PERMID, LEVEL]
life_dynperm_checkout_running = false;

__CONST__(life_perms,life_perms);

