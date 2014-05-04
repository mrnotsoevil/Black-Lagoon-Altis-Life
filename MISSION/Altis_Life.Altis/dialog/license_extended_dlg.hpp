class license_extended_dlg
 {
	idd = 2900;
	name= "license_extended_dlg";
	movingEnable = false;
	enableSimulation = true;	
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Lizenzen und Fähigkeiten</t>"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
	};
	
	class controls 
	{
		class b_Close: RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class licenseList: RscListbox
		{
			idc = 1500;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
		};
		class b_buy: RscButtonMenu
		{
			idc = 2401;
			text = "Kaufen"; //--- ToDo: Localize;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick = "if( (lbData[1500,lbCurSel (1500)] != """") ) then { [false, false, false, lbData[1500,lbCurSel (1500)]] call life_fnc_buyLicense; closeDialog 0; };";
		};
		class licenseDescr: RscStructuredText
		{
			idc = 1400;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
		};
	};
};