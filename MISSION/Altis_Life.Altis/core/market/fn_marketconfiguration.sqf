/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
	["goldr", 2700, 0, 4050, 5, 3, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		]
	],
	
	["oilp", 1960, 0, 2940, 3, 1, 
		[ 
			["diamondc",1], 
			["goldr",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["iron_r", 1100, 0, 1650, 3, 1,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["goldr",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["diamondc", 3000, 0, 4500, 5, 2, 
		[ 
			["goldr",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["copper_r", 500, 0, 750, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["goldr",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["salt_r", 900, 0, 1350, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["goldr",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["glass", 1200, 0, 1800, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["coalr",1],
			["goldr",1] 
		] 
	],
	
	["cement", 900, 0, 1350, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["goldr",1],
			["silverr",1],
			["coalr",1],
			["glass",1]
		] 
	],
	
	["silverr", 2200, 0, 3300, 4, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["goldr",1],
			["coalr",1],
			["glass",1] 
		] 
	],
	
	["coalr", 300, 0, 450, 1, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silverr",1],
			["goldr",1],
			["glass",1] 
		] 
	],
	
	///////////////////////////////////
	
	["turtle", 12000, 0, 18000, 20, 18,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["froglsd",1]					
		] 
	],
	
	["marijuana", 4600, 0, 6900, 7, 5,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1],
			["froglsd",1]					
		] 
	],
	
	["cocainep", 6200, 0, 9300, 11, 8,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["heroinp",1],
			["froglsd",1]					
		] 
	],
	
	["heroinp", 6800, 0, 10200, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["froglsd",1]					
		] 
	],
	
	["froglsd", 4100, 0, 6150, 7, 5,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["turtle",1]					
		] 
	]

];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};