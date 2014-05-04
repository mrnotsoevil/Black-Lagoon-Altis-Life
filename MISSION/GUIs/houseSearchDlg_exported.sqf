////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Pecexe)
////////////////////////////////////////////////////////

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
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
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
};
class cEnableImpoundMoney: RscCheckbox
{
	idc = 2800;
	text = "Geld beschlagnahmen"; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Geld beschlagnahmen"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
