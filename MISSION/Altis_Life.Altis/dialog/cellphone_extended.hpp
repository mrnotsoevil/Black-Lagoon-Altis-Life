class cellphone_extended {
	idd = 3000;
	name= "cellphone_extended";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellex_open";
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2'>Handy</t>"; //--- ToDo: Localize;
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
	};
	
	class controls 
	{
		class bClose: RscButtonMenu
	    {
	    	idc = 2400;
	    	text = "Schliessen"; //--- ToDo: Localize;
	    	x = 8 * GUI_GRID_W + GUI_GRID_X;
	    	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	    	w = 24 * GUI_GRID_W;
	    	h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
	    };
	    class lbDst: RscListbox
	    {
	    	idc = 1500;
	    	x = 8 * GUI_GRID_W + GUI_GRID_X;
	    	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	    	w = 10 * GUI_GRID_W;
	    	h = 15 * GUI_GRID_H;
			sizeEx = 0.030;
	    };
	    class editMessage: Life_RscEdit
	    {
	    	idc = 1400;
	    	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	    	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	    	w = 13 * GUI_GRID_W;
	    	h = 12 * GUI_GRID_H;
	    	text="";
	    };
	    class bSend: RscButtonMenu
		{
			idc = 2401;
			text = "Senden"; //--- ToDo: Localize;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[false] spawn life_fnc_cellex_sendClick;";
			tooltip="Nachricht senden";
		};
		class bSendAdmin: RscButtonMenu
		{
			idc = 2402;
			text = "Admin Msg"; //--- ToDo: Localize;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,0,0,1};
			onButtonClick="[true] spawn life_fnc_cellex_sendClick;";
			tooltip="Nachricht als Admin senden. Funktioniert nur bei privaten Nachrichten an einen Spieler.";
		};
	};
};