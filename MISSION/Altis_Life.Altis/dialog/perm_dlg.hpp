class perm_dlg
{
	idd = 29550;
	name = "perm_dlg";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Gruppenverwaltung</t>"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class lblMessage: RscText
		{
			idc = 1000;
			text = "Message"; //--- ToDo: Localize;
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Level"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
		};
	};
	
	class controls 
	{
		class bAdminGroupMgr: RscButtonMenu
		{
			idc = 2400;
			text = "Admin"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Startet Gruppenverwaltung mit Adminrechten"; //--- ToDo: Localize;
			onButtonClick = "if((call life_adminlevel) > 0) then { life_permmanager_admin = true; [] call life_fnc_permManager_update; hint ""Adminmodus aktiviert."";};";
		};
		class bClose: RscButtonMenu
		{
			idc = 2401;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class lbPlayers: Life_RscListBox
		{
			idc = 1500;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
			sizeEx = 0.030;
			onLBSelChanged = "[] call life_fnc_permManager_update";
		};	
		class cmbPermissions: RscCombo
		{
			idc = 2100;
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "[] call life_fnc_permManager_updateData";
		};
		class lblLevel: Life_RscEdit
		{
			idc = 1400;
			text = "0"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class bSetPerm: RscButtonMenu
		{
			idc = 2402;
			text = "Ändern"; //--- ToDo: Localize;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[] spawn life_fnc_permManager_set;";
		};
		class bThrowOut: RscButtonMenu
		{
			idc = 2403;
			text = "Herauswerfen"; //--- ToDo: Localize;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[0] spawn life_fnc_permManager_set;";
		};
	};
};