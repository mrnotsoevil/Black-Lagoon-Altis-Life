class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\core\MySQL";
			class insert{};
			class query{};
			class update{};
			class numberSafe {};
			class formatArray {};
			class mresArray {};
			class mresToArray {};
			class addQueue {};
			class processQueue {};
			class queueManagement {};
			class insertVehicle {};
			class queryVehicle {};
			class queryVehicles {};
			class bool{};
			class mresString {};
			
			class repaintVehicle {};
			
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\core\wantedsys";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\core\jail";
			class jailSys {};
			class jailTimer {};
			class jailPlayer {};
		};
		
		class Client_Code
		{
			file = "\life_server\core\clientside";
			class safeOpen {};
			class safeInventory {};
			class safeTake {};
			class safeStore {};
		};
		
		//##84
		class DBBAN
		{
			file = "\life_server\core\dbban";
			
			class dbBanSet {};
			class dbBanGet {};
			class dbBanQuery {};
			class dbBanBan {};
		};
		
		class PERM
		{
			file = "\life_server\core\dynperm";
			
			class dynPermQuery {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class System
		{
			file = "\life_server\core\system";
			class query {};
			class add {};
			class update {};			
			class managesc {};
			class cleanup {};
			class timeStamp {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class addVehicle2Chain {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleSaveInventory {};
			class vehicleDelete {};
			class spikeStrip {};
			class robReserve {};
			class robberyState {};
			class logIt {};
			class federalUpdate {};
			class isUIDActive {};
			class chopShopSell {};
			
			class vehicleRepaint {};
		};
	};
	
	//HOUSE
	class HOUSE_System
	{
		tag = "HOUSE";
		class House
		{
			file = "\life_server\core\house";
			class writeData {};
			class requestCommand {};
			class requestSpawnMenu {};
			
			class writeDataToNearest {};
			
			//addon methods
			class DBbuyHouse {};
			class DBsellHouse {};
			class DBgiveKey {};
			class DBresetKeys {};
			class DBapplyInventory {};
			class DBuseFurniture {};
			class DBimpound {};
		};
	};
	
	//LAUNDER
	class LAUNDER_System
	{
		tag = "LAUNDER";
		class Launder
		{
			file = "\life_server\core\launder_money";
			class launderMoney {};
			class launderMoneyTimer {};
		};
	};
	
	//ANTICHEAT
	class ANTICHEAT_System
	{
		tag = "ANTICHEAT";
		class Launder
		{
			file = "\life_server\core\anticheat";
			class configureAnticheat {};
			class commitMOT {};
			class commitMOTValid {};
			
			class setPlayTime {};
			class getPlayTime {};
		};
	};
	
	//MARKET
	/*class MARKET_System
	{
		tag = "life";
		class Market
		{
			file = "\life_server\core\market";
			
			class marketconfiguration;
		
			class marketGetSellPrice;
			class marketGetBuyPrice;
		
			class marketBuy;
			class marketSell;
		};
	};*/
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
	
	class Offroad_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class Hatchback_01_base_F: Car_F
	{
		class EventHandlers;
	};
	class SUV_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class C_Hatchback_01_sport_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_sport_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		displayName = "$STR_A3_CfgVehicles_C_car_sport0";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
	};
	
	class C_SUV_01_F: SUV_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_SUV_01_F";
		scope = 2;
		crew = "C_man_1";
		typicalCargo[] = {"C_man_1"};
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		hiddenSelectionsTextures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\SUV\color.sqf""";
		};
	};
	class C_Hatchback_01_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
	};
	
	class C_Offroad_01_F: Offroad_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Offroad_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		class Turrets{};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\offroad\color.sqf""";
		};
	};
};

/*class CfgWeapons
{
	class Uniform_Base;//External Reference
	class UniformItem;//External Reference
	
	class U_Life_PoliceUniform : Uniform_Base  //The uniform class for fully clothed soldier
	{
		access = 3;
		aiDispersionCoefX = 1;
		aiDispersionCoefY = 1;
		aiRateOfFire = 5;
		aiRateOfFireDistance = 500;
		allowedSlots[] = {901};
		ammo = "";
		artilleryCharge = 1;
		artilleryDispersion = 1;
		autoFire = 0;
		autoReload = 1;
		backgroundReload = 0;
		ballisticsComputer = 0;
		burst = 1;
		canDrop = 1;
		canLock = 2;
		canShootInWater = 0;
		cartridgePos = "nabojnicestart";
		cartridgeVel = "nabojniceend";
		changeFiremodeSound[] = {"",1,1};
		cmImmunity = 1;
		count = 0;
		cursor = "";
		cursorAim = "";
		cursorAimOn = "";
		cursorSize = 1;
		descriptionShort = "";
		detectRange = 0;
		dispersion = 0.002;
		displayName = "Polizeiuniform";
		distanceZoomMax = 400;
		distanceZoomMin = 400;
		drySound[] = {"",1,1};
		emptySound[] = {"",1,1};
		enableAttack = 1;
		ffCount = 1;
		ffFrequency = 1;
		ffMagnitude = 0;
		fireAnims[] = {};
		fireLightAmbient[] = {0,0,0};
		fireLightDiffuse[] = {0.937,0.631,0.259};
		fireLightDuration = 0.05;
		fireLightIntensity = 0.2;
fireSpreadAngle = "3.0f";
		forceOptics = 0;
		handAnim[] = {};
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};
		initSpeed = 0;
		irDistance = 0;
		irDotIntensity = 0.001;
		irLaserEnd = "laser dir";
		irLaserPos = "laser pos";
		laser = 0;
		lockAcquire = 1;
		lockedTargetSound[] = {"",0.000316228,6};
		lockingTargetSound[] = {"",0.000316228,2};
		magazineReloadTime = 0;
		magazines[] = {};
		maxRange = 500;
		maxRangeProbab = 0.04;
		maxRecoilSway = 0.008;
		memoryPointCamera = "eye";
		midRange = 150;
		midRangeProbab = 0.58;
		minRange = 1;
		minRangeProbab = 0.3;
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		modelMagazine = "";
		modelOptics = "";
		modelSpecial = "";
		modes[] = {"this"};
		multiplier = 1;
		muzzleEnd = "konec hlavne";
		muzzlePos = "usti hlavne";
		muzzles[] = {};
		nameSound = "";
		optics = 1;
		opticsDisablePeripherialVision = 0.67;
		opticsFlare = 1;
		opticsID = 0;
		opticsPPEffects[] = {};
		opticsZoomInit = 0.35;
		opticsZoomMax = 0.35;
		opticsZoomMin = 0.35;
		picture = "\A3\characters_f\data\ui\icon_U_C_miller_ca.paa";
		primary = 10;
		recoil = "empty";
		recoilProne = "";
		reloadAction = "";
		reloadMagazineSound[] = {"",1,1};
		reloadSound[] = {"",1,1};
		reloadTime = 1;
		scope = 2;
		selectionFireAnim = "zasleh";
		showAimCursorInternal = 1;
		showEmpty = 1;
		shownUnderwaterSelections[] = {};
		showSwitchAction = 0;
		showToPlayer = 1;
		simulation = "Weapon";
		sound[] = {"",1,1};
		soundBegin[] = {"sound",1};
		soundBeginWater[] = {"sound",1};
		soundBullet[] = {"emptySound",1};
		soundBurst = 1;
		soundClosure[] = {"sound",1};
		soundContinuous = 0;
		soundEnd[] = {"sound",1};
		soundLoop[] = {"sound",1};
		swayDecaySpeed = 2;
		textureType = "default";
		type = 131072;
		uiPicture = "";
		useAction = 0;
		useActionTitle = "";
		useAsBinocular = 0;
		useModelOptics = 1;
		value = 2;
		weaponLockDelay = 0;
		weaponLockSystem = 0;
		weaponSoundEffect = "";
		weight = 0;

	};*/
};