class admin_pw
{
	idd = 38450;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Authentifizierung notwendig</t>"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {1,1,1,0.1};
		};
// 		class RscText_1000: RscText
// 		{
// 			idc = 1000;
// 			text = " $ "; //--- ToDo: Localize;
// 			x = 11 * GUI_GRID_W + GUI_GRID_X;
// 			y = 16 * GUI_GRID_H + GUI_GRID_Y;
// 			w = 2 * GUI_GRID_W;
// 			h = 2 * GUI_GRID_H;
// 			sizeEx = 1.5 * GUI_GRID_H;
// 		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "Bitte Admin-Passwort eingeben, um dich zu authorisieren!"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 8.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class passwEdit: RscEdit
		{
			idc = 1400;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "";
		};		
		class bLaunder: RscButtonMenu
		{
			idc = 2401;
			text = "OK"; //--- ToDo: Localize;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Authentifizieren"; //--- ToDo: Localize;
			onButtonClick="[] spawn life_fnc_adminAuthentificate;";
		};
	};
};
