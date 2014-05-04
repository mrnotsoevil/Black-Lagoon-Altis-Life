//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class vInteraction_Cop
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
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		
		//////////Pictures
		class picRepair: RscPicture
		{
			idc = 1200;
			text = "icons\interaction\repair.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picPutToGarage: RscPicture
		{
			idc = 1201;
			text = "icons\interaction\puttogarage.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picRegister: RscPicture
		{
			idc = 1204;
			text = "icons\interaction\register.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picPullOut: RscPicture
		{
			idc = 1205;
			text = "icons\interaction\pullout.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picImpound: RscPicture
		{
			idc = 1206;
			text = "icons\interaction\impound.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picSearch: RscPicture
		{
			idc = 1207;
			text = "icons\interaction\search.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class bRepair: Life_PictureButtonMenu
		{
			idc = 2401;
			text = ""; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bPutToGarage: Life_PictureButtonMenu
		{
			idc = 2402;
			text = ""; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bRegister: Life_PictureButtonMenu
		{
			idc = 2403;
			text = ""; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bSearch: Life_PictureButtonMenu
		{
			idc = 2404;
			text = ""; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bPullOut: Life_PictureButtonMenu
		{
			idc = 2405;
			text = ""; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
		class bImpound: Life_PictureButtonMenu
		{
			idc = 2406;
			text = ""; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
		};
	};
};

