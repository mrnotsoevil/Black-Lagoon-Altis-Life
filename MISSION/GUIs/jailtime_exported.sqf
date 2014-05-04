////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Bejely)
////////////////////////////////////////////////////////

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "<t align='center' size='1.2'>Knast</t>"; //--- ToDo: Localize;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 11 * GUI_GRID_H;
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Abbrechen"; //--- ToDo: Localize;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class IGUIBack_2201: IGUIBack
{
	idc = 2201;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	text = "Zeit angeben, wie viele Minuten die Person im Knast bleiben soll."; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Zeit:"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class editTime: RscEdit
{
	idc = 1400;
	text = "15"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Minuten"; //--- ToDo: Localize;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class bOK: RscButtonMenu
{
	idc = 2402;
	text = "OK"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
