/*

	Shows the quick help

*/

private["_text"];


_text = "<t size='2'>Hilfe: Tasten</t><br/><br/><t size='1.2'>Aktionstaste 10</t><br/>Interaktion mit Spieler oder Fahrzeug<br/><br/><t size='1.2'>Z</t><br/>Spielermenü/Z-Inventar<br/><br/><t size='1.2'>U</t><br/>Fahrzeug auf-/zuschließen<br/><br/><t size='1.2'>T</t><br/>Kofferraum öffnen<br/><br/><t size='1.2'>Shift + H</t><br/>Waffen wegstecken/zurückholen<br/><br/><t size='1.2'>Strg + Shift + H</t><br/>Hände hoch<br/><br/><t size='1.2'>Shift + R</t><br/>Fesseln<br/><br/><t size='1.2'>Shift + G</t><br/>Umhauen<br/><br/><t size='1.2'>Shift + L</t><br/>Fahrzeugsirene (Polizei)<br/><br/><t size='1.2'>F</t><br/>Sirene (Polizei)<br/><br/>";

hint parseText _text;