/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_cash < 50) exitWith {hint "Du benötigst $50!"};
titleText["Der wirklich vertrauenswerte Doktor Mabuse wird Sie behandeln ...","PLAIN"];
sleep 2;
titleText["Ich goog*hust*... schaue im Medizinprogramm nach ...","PLAIN"];
sleep 5;
titleText["Es hat Funktioniert! Ich bin doch nicht unfähig!","PLAIN"];
sleep 2;
if(player distance (_this select 0) > 5) exitWith {titleText["Du musst in der Nähe des Doktors bleiben.","PLAIN"]};
titleText["Du bist nun geheilt!","PLAIN"];
player setdamage 0;
life_cash = life_cash - 50;