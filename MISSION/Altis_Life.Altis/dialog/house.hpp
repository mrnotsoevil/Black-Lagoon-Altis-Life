class house_houseDialog
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Haus</t>"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		class IGUIBack_2203: IGUIBack
		{
			idc = 2203;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
		};
		class house_value: RscStructuredText
		{
			idc = 1102;
			text = "<t size='2' align='center'>Wert: $xxxxxxxx</t>"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {1,1,1,0};
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "<t size='1.1'>Willkommen bei der Altis Wohngesellschaft!<br/></br>Leben Sie nicht mehr in der Gosse, sondern kaufen Sie sich dieses wunderschöne Haus in toller Lage!<br/><br/><br/><br/>Folgende Vorteile bekommen Sie:<br/> <t color='#00dd00'><br/>* Respawnen Sie in ihrem Haus!<br/>* Lagern Sie Ihre Gegenstände!<br/>* Parken Sie Ihr Auto ein und aus<br/>* Legen Sie sich Schlafen und heilen sich</t></t> "; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schließen"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class bBuyHouse: RscButtonMenu
		{
			idc = 2401;
			text = "Kaufen"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class bSellHouse: RscButtonMenu
		{
			idc = 2402;
			text = "Verkaufen"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class bVehiclePark: RscButtonMenu
		{
			idc = 2403;
			text = "Fahrzeug parken"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Fahrzeug in der Nähe einparken."; //--- ToDo: Localize;
		};
		class bVehicleOpenGarage: RscButtonMenu
		{
			idc = 2404;
			text = "Auto ausparken"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Garage öffnen und Fahrzeug ausparken."; //--- ToDo: Localize;
		};
		class bKeyDialog: RscButtonMenu
		{
			idc = 2405;
			text = "Hausschlüssel ..."; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Einem anderen Spieler Hausschlüssel geben."; //--- ToDo: Localize;
		};
		class bVehicleHeliOpenGarage: RscButtonMenu
		{
			idc = 2406;
			text = "Helikopter ausparken"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Heli-Garage öffnen."; //--- ToDo: Localize;
		};
	};
};
