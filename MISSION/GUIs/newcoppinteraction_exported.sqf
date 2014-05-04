////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Nyjuve)
////////////////////////////////////////////////////////

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
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class picUnrestrain: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picArrest: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picTicket: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picEscort: RscPicture
{
	idc = 1203;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picPutInCar: RscPicture
{
	idc = 1204;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picSearch: RscPicture
{
	idc = 1205;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class picShowLicenses: RscPicture
{
	idc = 1206;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class bUnrestrain: RscButtonMenu
{
	idc = 2401;
	text = "Unrestrain"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bArrest: RscButtonMenu
{
	idc = 2402;
	text = "Arrest"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bTicket: RscButtonMenu
{
	idc = 2403;
	text = "Ticket"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bEscort: RscButtonMenu
{
	idc = 2404;
	text = "STOP"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {0,0,0,0};
};
class bPutInCar: RscButtonMenu
{
	idc = 2405;
	text = "PutInCar"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bSearch: RscButtonMenu
{
	idc = 2406;
	text = "Search"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class bShowLicenses: RscButtonMenu
{
	idc = 2407;
	text = "ShowLicenses"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
