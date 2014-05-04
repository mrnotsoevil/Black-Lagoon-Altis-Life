////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Ducadi)
////////////////////////////////////////////////////////

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "<t align='center' size='1.2'>Zu Wantedliste hinzufugen ...</t>"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 17 * GUI_GRID_H;
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class cmbPlayers: RscCombo
{
	idc = 2100;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Grund"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class tReason: RscEdit
{
	idc = 1400;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Kopfgeld  $"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class tBounty: RscEdit
{
	idc = 1401;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 14.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class bAdd: RscButtonMenu
{
	idc = 2401;
	text = "OK"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
