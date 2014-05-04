class perm_dlg_new
{
	idd = 29650;
	name = "perm_dlg_new";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center'>Gruppenverwaltung</t>"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
		class picLogo: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		class gbackEdit: IGUIBack
		{
			idc = 2202;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Rang"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class lblRank: RscText
		{
			idc = 1001;
			text = "Rang 0 (Default)"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	
	class controls 
	{
		class bAdmin: RscButtonMenu
		{
			idc = 2400;
			text = "Admin"; //--- ToDo: Localize;
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick = "if((call life_adminlevel) > 0) then { life_permmanager_admin = true; [] spawn life_fnc_permManager_update; hint ""Adminmodus aktiviert."";};";
		};
		class bClose: RscButtonMenu
		{
			idc = 2401;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class cmbGroup: RscCombo
		{
			idc = 2100;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onLBSelChanged = "[] spawn life_fnc_permManager_update";
		};
		class cmbPlayers: RscListbox
		{
			idc = 1500;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26.5 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_permManager_updateData";
		};
		class tRank: RscEdit
		{
			idc = 1400;
			text = "0"; //--- ToDo: Localize;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class bSetRank: RscButtonMenu
		{
			idc = 2402;
			text = "Setzen"; //--- ToDo: Localize;
			x = 24 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Rang setzen (0 entspricht herauswerfen)"; //--- ToDo: Localize;
			onButtonClick="[] spawn life_fnc_permManager_set;";
		};
		class bSetLevel0: RscButtonMenu
		{
			idc = 2403;
			text = "Herauswerfen"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Spieler herauswerfen"; //--- ToDo: Localize;
			onButtonClick="[0] spawn life_fnc_permManager_set;";
		};
	};
};