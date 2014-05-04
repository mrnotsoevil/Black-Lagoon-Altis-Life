[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint "Du hast dich zu tode gehungert.";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "Du hast dich zu tode gehungert.";};
		switch(life_hunger) do {
			case 30: {hint "Du hast eine Weile nichts gegessen, du solltest bald etwas essen!";};
			case 20: {hint "Du fängst an zu verhungern, du solltest etwas essen oder du stirbst!";};
			case 10: {hint "Du verhungerst nun, du wirst sehr bald sterben wenn du nicht schnell etwas isst!";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Du bist dehydriert.";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Du bist wegen Dehydration gestorben.";};
			switch(life_thirst) do 
			{
				case 30: {hint "Du hast eine Weile nichts getrunken, du solltest bald etwas trinken!";};
				case 20: {hint "Du fängst an zu verdursten, du solltest etwas trinken oder du stirbst!"; player setFatigue 1;};
				case 10: {hint "Du verdurstest nun, du wirst sehr bald sterben wenn du nicht schnell etwas trinkst!"; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		
		
		
		
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		//_cfg = 50;
		//hint "DEBUG initSurvival";	
		
		_load = round(_cfg / 8);
		
		//##50 Rucksäcke bringen Gewicht auf 64
		_load = 64 - life_maxWeightT; //Hier ändern für anderes Gewicht für alle Rucksäcke
		
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Du bist überladen, solange du nichts wegwirfst kannst du auch nicht rennen.";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};