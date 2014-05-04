////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Tileja)
////////////////////////////////////////////////////////

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
class picRepair: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class picPutToGarage: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class picRegister: RscPicture
{
	idc = 1204;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class picPullOut: RscPicture
{
	idc = 1205;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class picImpound: RscPicture
{
	idc = 1206;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class picSearch: RscPicture
{
	idc = 1207;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class bRepair: RscButtonMenu
{
	idc = 2401;
	text = "Repair"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bPutToGarage: RscButtonMenu
{
	idc = 2402;
	text = "PutToGarage"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bRegister: RscButtonMenu
{
	idc = 2403;
	text = "Register"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bSearch: RscButtonMenu
{
	idc = 2404;
	text = "Search"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bPullOut: RscButtonMenu
{
	idc = 2405;
	text = "PullOut"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bImpound: RscButtonMenu
{
	idc = 2406;
	text = "Impound"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
