class house_houseSearchDlg
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Durchsuchungsergebnis</t>"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schließen"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class itemlist: RscListbox
		{
			idc = 1500;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "bMessage"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
		class bImpound: RscButtonMenu
		{
			idc = 2402;
			text = "Beschlagnahmen"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			//onButtonClick="__impound_money = cbChecked [2800]; [__impound_money] spawn life_fnc_houseImpound; closeDialog 0;";
			onButtonClick="[false] spawn life_fnc_houseImpound; closeDialog 0;";
		};
		/*class cEnableImpoundMoney: RscCheckbox
		{
			idc = 2800;
			text = "Geld beschlagnahmen"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};*/
		/*class RscText_1001: RscText
		{
			idc = 1001;
			text = "Geld beschlagnahmen"; //--- ToDo: Localize;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};*/
	};
};
