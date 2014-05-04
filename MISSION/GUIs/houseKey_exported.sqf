////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Videco)
////////////////////////////////////////////////////////

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "<t align='center' size='1.2'>Hausschlüssel geben</t>"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 16 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 16 * GUI_GRID_W;
	h = 17 * GUI_GRID_H;
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 16 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	text = "Du kannst einem Spieler den Hausschlüssel geben, sodass dieser auf einige Haus-Funktionen zugreifen kann (er kann das Haus aber nicht verkaufen!)<br/>Wenn du einem Spieler nicht mehr traust, dann kannst du das Schloss austauschen und musst aber vertrauenswürdigen Spielern wieder neue Schlüssel geben!"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class IGUIBack_2201: IGUIBack
{
	idc = 2201;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class cmbPlayers: RscCombo
{
	idc = 2100;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class bGiveKey: RscButtonMenu
{
	idc = 2401;
	text = "Schlüssel geben"; //--- ToDo: Localize;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class IGUIBack_2202: IGUIBack
{
	idc = 2202;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
};
class bResetKeys: RscButtonMenu
{
	idc = 2402;
	text = "Schloss austauschen"; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
