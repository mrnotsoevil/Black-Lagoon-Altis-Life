class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class welcomeNotification {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class admininfo_Extended {};
		class adminid {};
		class admingetID {};
		
		class adminMenu {};
		class adminQuery {};
		
		class adminKick {};
		class adminBan {};
		
		class adminMenu_Extended {};
		class adminQuery_Extended {};
		
		class adminGodMode {};
		class adminAddMoney {};	
		class adminSpawnVehicle {};
		class adminInstaHealth {};
		
		class adminTpTo {};
		class adminTpHere {};
		
		class adminRestrain {};
		class adminUnrestrain {};
		
		class adminAuthentificate {};
		class adminCheckAuth {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherHeroin {};
		class gatherOil {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class robBankAction {};
		class sellOil {};
		class suicideBomb {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class pumpRepair {};
		class packupSpikes {};
		class robFederal {};
		class storeVehicle {};
		class robAction {};
		class sellTurtle {};
		
		//#2
		class putToGarage {};
		
		//##26
		class useHeroin {};
		class useMarijuana {};
		class useCocaine {};
		class useWeed {};
		
		//##49
		class useVRepairkit {};
		
		//##53
		class useVFirstaidkit{};
		
		//##61
		class copShowLicense{};
		class copLicenseShown {};
		
		//LSD
		class CatchFrogAction {};
		
		class CookFrogAction {};
		class CookHermitLSD {};
		
		//##93
		class TorturePlayer{};
		
		//##108
		class putHandsUp {};
		
		//##110
		class playerUseBomb {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class vehicleWeight {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class copDefault {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_adac {};
		class clothing_reb {};
		class clothing_dive {};
		
		class civDefault {};
		
		//For custom uniforms, etc
		class updateClothing {};
		
		//Vehicle configuration
		class vehicleColorsCentralized {};
		
		//Vehicle configuration
		class vehiclesCentralized {};
		
		
	};
	
	class session
	{
		file = "core\session";
		class sessionSetup {};
		class sessionReceive {};
		class sessionUpdate {};
		class sessionCreate {};
		class sessionHandle {};
		class syncData {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		
		class newwanted{};
		class newwanted_send{};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class fetchGear{};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class onDeath {};
		class onRespawn {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
		class nearUnits {};
		class fedSuccess {};
		class actionKeyHandler {};
		class getInventoryArray {};
		class appendInventory{};	
		
		class randomRound {};
		class random {};
		
		class bagSound {};
		
		class globalSound {};
		class globalSoundClient {};
		
		class animSyncSmooth {};
		
		class holsterWeapons {};
		
		class showQuickHelp {};
		
		class dbbanExec {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class civSaveGear {};
		class civLoadGear {};
		class robReserve {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleUpdateTrunkWeight {};
		
		class openGarage {};
		//class parkVehicle {};
		
		class vehicleAfterSpawn {}; //called for vehicle after spawning it
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class loadGear {};
		class saveGear {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		
		class ticketPayed {};
		
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		
		//holster
		class holsterSaveGear {};
		class holsterLoadGear {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class createGang {};
		class gangBrowser {};
		class gangManagement {};
		class gangMenu {};
		class joinGang {};
		class kickGang {};
		class leaveGang {};
		class setGangLeader {};
		class lockGang {};
		class unlockGang {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShop {};
		class vehicleColorList {};
		class vehicleShopBuy {};
		class vehicleShopBuySave {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		
		//##17
		class buyLicences_extended {};
		
		
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
	};
	
	class House
	{
		file = "core\house";
		//
		
		//
		//class houseSleep;
		
		//class houseSetupMapMarker;
		//class houseIsOwnedByPlayer;
		
		//House Actions
		//Actions are calling DATA PIPELINE
		class houseMenu;
		class buyHouse;
		class sellHouse;
		class houseSleep;
		class houseInventory;
		class houseSearch;
		class houseImpound;
		
		//Non PIPELINE actions
		//Are not called by pipeline
		class houseGarage_Park;
		class houseGarage_Open;
		class houseAirGarage_Open;
		class houseRefreshMarkers;
		
		//Car inventory stuff
		class houseInventory_count;
		class houseInventory_store;
		class houseInventory_take;
		class houseInventory_refresh;
		class houseInventory_apply;
		
		//House Data Pipeline
		class houseRequestCommand; //Request to @life-server command
		class houseExecCommand; //Executed from @life-server, parses input command
		
		//House Data Pipeline Execs
		class execHouseMenu;
		class execBuyHouse;
		class execSellHouse;
		class execHouseSleep;
		class execHouseInventory;
		class execHouseInventory_apply;
		class execHouseSearch;
		class execHouseImpound;
		
		//Utils
		class houseExtractData; //Returns usable data array
		class houseExtractDataVal; //Gets one value of data array
		class houseBelongsToPlayer;
		
		//inuse
		class houseIsInuse;
		class houseSetInuse;
		
		//House Inventory Upgrade system
		class houseUseFurniture;
		class execHouseUseFurniture;
		
		//House Key stuff
		class houseOpenKeyDialog;
		class houseGiveKey;
		class houseResetKeys;
		class houseExecGiveKey;
		class houseExecResetKeys;
		
		class houseCanAccess; //if player can access
	};
	
	class Rebel
	{
		file = "core\rebel";
		
		class rebelInteractionMenu;
	};
	
	class Money_Launder
	{
		file = "core\money_launder";
		
		class launder;
		class launderTimer;
		class execLaunder;
		class execLaunderTimer;
		
		class launderAction;
		class launderClick;
		
		class launderCalculateMoney;
	};
	
	class Interactionmenus
	{
		file = "core\interactionmenus";
		
		class pInteraction_cop;
		class pInteraction_reb;
		class vInteraction_cop;
		class vInteraction_civ;
	};
	
	class VItems
	{
		file = "core\vitems";
		
		class vitemconfig;
		class vitem_varToStr;
		class vitem_itemWeight;
		class vitem_varHandle;
		class vitem_isVItem;
		class vitem_unpack;
		
		class vitem_openPackDialog;
		class vitem_refreshPackDialog;
		class vitem_pack;
		
	};
	
	class Market
	{
		file = "core\market";
		
		class openMarketView;
		class refreshMarketView;
		class marketShortView;
		
		class marketBuy;
		class marketSell;
		class marketGetBuyPrice;
		class marketGetSellPrice;
		
		class marketconfiguration;
		class marketReset;
		
		class marketChange;
		
		class marketGetRow;
		class marketGetPriceRow;
		class marketSetPriceRow;
	};
	
	class UItems
	{
		file = "core\unifieditems";
		
		class uitemconfig;
		class uitem_varToStr;
		class uitem_itemWeight;
		class uitem_varHandle;
		class uitem_isUItem;	
		
	};
	
	class Cellphone_Extended
	{
		file = "core\cellphone_extended";
		
		class cellex_open;
		class cellex_sendClick;
	};
	
	class Birddown
	{
		file = "core\birddown";
		
		class fireBirdDown;
		class birdDownShot;
	};
	
	class Events
	{
		file = "core\event";
		
		class playerInEvent;
		class playerEventTazed;
		class playerEventAddScore;
		
		class eventServerInit;
		class eventConfig;
		
		class eventCapturePole;
	};
	
	class Permsys
	{
		file = "core\permsys";
		
		class permLevel;
		class permLevelName;
		class permSetLevel;
		class permRule;
		class permRuleG;
		
		class permconfiguration;	
		class perms;
		
		class permManager;
		class permManager_update;		
		class permManager_requestData;
		class permManager_gotData;
		class permManager_updateData;
		class permManager_uiMode;
		class permManager_refreshList;
		
		class permManager_set;
		
		class dynPermUpdate;
		class dynPermCheckout;
	};
	
	class ADAC
	{
		file = "core\adac";
		
		class adacRepairTruck;
		class adacImpound;
		class adacRepaintMenu;
		class adacRepaintVehicle;
	};

};