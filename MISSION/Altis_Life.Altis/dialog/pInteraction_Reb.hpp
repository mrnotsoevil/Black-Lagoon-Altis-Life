//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class pInteraction_Reb
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center'>Aktion ...</t>"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		//Pictures
		class picUnrestrain: RscPicture
		{
			idc = 1200;
			text = "icons\interaction\unrestrain.paa";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		/*class picArrest: RscPicture
		{
			idc = 1201;
			text = "icons\interaction\arrest.paa";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class picTicket: RscPicture
		{
			idc = 1202;
			text = "icons\interaction\ticket.paa";
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};*/
		class picEscort: RscPicture
		{
			idc = 1203;
			text = "icons\interaction\escort.paa";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class picPutInCar: RscPicture
		{
			idc = 1204;
			text = "icons\interaction\putintocar.paa";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		/*class picSearch: RscPicture
		{
			idc = 1205;
			text = "icons\interaction\search_person.paa";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class picShowLicenses: RscPicture
		{
			idc = 1206;
			text = "icons\interaction\showlicenses.paa";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};*/
		class picTorture: RscPicture
		{
			idc = 1205;
			text = "icons\interaction\torture.paa";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class bUnrestrain: Life_PictureButtonMenu
		{
			idc = 2401;
			text = ""; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		/*class bArrest: Life_PictureButtonMenu
		{
			idc = 2402;
			text = "Arrest"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bTicket: Life_PictureButtonMenu
		{
			idc = 2403;
			text = "Ticket"; //--- ToDo: Localize;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};*/
		class bEscort: Life_PictureButtonMenu
		{
			idc = 2404;
			text = ""; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorText[] = {1,0,0,1};
			
		};
		class bPutInCar: Life_PictureButtonMenu
		{
			idc = 2405;
			text = ""; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		/*class bSearch: Life_PictureButtonMenu
		{
			idc = 2406;
			text = "Search"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bShowLicenses: Life_PictureButtonMenu
		{
			idc = 2407;
			text = "ShowLicenses"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};*/
		class bTorture: Life_PictureButtonMenu
		{
			idc = 2406;
			text = ""; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
	};
};

