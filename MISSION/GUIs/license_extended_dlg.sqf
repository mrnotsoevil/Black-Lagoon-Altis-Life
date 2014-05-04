////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrboese, v1.063, #Viloge)
////////////////////////////////////////////////////////

class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 23 * GUI_GRID_H;
};
class IGUIBack_2201: IGUIBack
{
	idc = 2201;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 16.5 * GUI_GRID_H;
};
class IGUIBack_2202: IGUIBack
{
	idc = 2202;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
};
class IGUIBack_2203: IGUIBack
{
	idc = 2203;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 22 * GUI_GRID_H;
};
class IGUIBack_2204: IGUIBack
{
	idc = 2204;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "<t align='center'>Lizenzen</t>"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	text = "<t align='center'>FÃ¤higkeiten</t>"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	text = "<t align='center'>Mitgliedschaft</t>"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class bClose: RscButtonMenu
{
	idc = 2400;
	text = "Schliessen"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 24 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class driver: RscButtonMenu
{
	idc = 2401;
	text = "Fuhrerschein"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class boat: RscButtonMenu
{
	idc = 2402;
	text = "Bootschein"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class pilot: RscButtonMenu
{
	idc = 2403;
	text = "Pilotenschein"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class gun: RscButtonMenu
{
	idc = 2404;
	text = "Waffenschein"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class dive: RscButtonMenu
{
	idc = 2405;
	text = "Taucherschein"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class truck: RscButtonMenu
{
	idc = 2406;
	text = "LKW-Schein"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class cair: RscButtonMenu
{
	idc = 2407;
	text = "Cop Pilotenschein"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class swat: RscButtonMenu
{
	idc = 2408;
	text = "Swat"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class cg: RscButtonMenu
{
	idc = 2409;
	text = "Kustenwache"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class gang: RscButtonMenu
{
	idc = 2410;
	text = "Gang"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class rebel: RscButtonMenu
{
	idc = 2411;
	text = "Rebellen"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class heroin: RscButtonMenu
{
	idc = 2412;
	text = "Heroinverarbeitung"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class marijuana: RscButtonMenu
{
	idc = 2413;
	text = "Marijuanaver."; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class medmarijuana: RscButtonMenu
{
	idc = 2414;
	text = "Med. Marijuanaver."; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class diamond: RscButtonMenu
{
	idc = 2415;
	text = "DIamantenver."; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class cocaine: RscButtonMenu
{
	idc = 2416;
	text = "Kokainver."; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class home: RscButtonMenu
{
	idc = 2417;
	text = "Besitzurkunde"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class salt: RscButtonMenu
{
	idc = 2418;
	text = "Salzverarbeitung"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class iron: RscButtonMenu
{
	idc = 2419;
	text = "Eisenverarb."; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class copper: RscButtonMenu
{
	idc = 2420;
	text = "Kupferarbeitung"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class gold: RscButtonMenu
{
	idc = 2421;
	text = "Goldverarbeitung"; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class silver: RscButtonMenu
{
	idc = 2422;
	text = "Silberverarb."; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class sand: RscButtonMenu
{
	idc = 2423;
	text = "Glas schmelzen"; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class coal: RscButtonMenu
{
	idc = 2424;
	text = "Kohleverarbeitung"; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class cement: RscButtonMenu
{
	idc = 2425;
	text = "Zementverarbeitung"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
