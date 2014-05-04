////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Qomype)
////////////////////////////////////////////////////////

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "<t align='center' size='1.2'>Einpacken</t>"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 24 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 24 * GUI_GRID_W;
	h = 17 * GUI_GRID_H;
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 24 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class listItems: RscListbox
{
	idc = 1500;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 14 * GUI_GRID_H;
};
class bPack: RscButtonMenu
{
	idc = 2401;
	text = "Einpacken"; //--- ToDo: Localize;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	text = "Du kannst einige Waffen und<br/>Ausrustungsgegenstande in Kisten einpacken.<br/><br/>Diese eingepacken GegenstÃ¤nde kannst du sicher in deinem Auto, Haus oder Inventar verstauen.<br/><br/><t color='#00FF00'>Du kannst einen Gegenstand auspacken, wenn du ihn im Inventar benutzt.</t>"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 9.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class lblBoxes: RscText
{
	idc = 1000;
	text = "## Kisten"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = 1.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
