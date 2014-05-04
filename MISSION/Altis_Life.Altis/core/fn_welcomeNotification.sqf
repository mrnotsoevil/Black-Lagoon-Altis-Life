/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
/*format["Willkommen %1, lies unbedingt folgende Hinweise!",name player] hintC
[
	"Manche Aktionen kannst du nur mit einem Druck auf die Action-Taste aktivieren.",
	"Mit der Zeit werden möglichst viele Aktionen mit Maus-Scrollen und Klick dadurch ersetzt!",
	"",
	"",
	"!!! Setze daher UNBEDINGT die 'Action 10'-Taste in der Konfiguration !!!",
	"Konfigurieren > Steuerung > Indiv. Steuerung > Aktionstaste 10",
	"Am besten Strg links",
	"",
	"",
	"",
	"Beispiele für Aktionen mit Action-Taste:",
	"Fischen",
	"Sachen aufheben",
	"Mit Spieler interagieren",
	"Mit Fahrzeugen interagieren"
];*/

"" hintC parseText "<t><t size='1.5'>Willkommen auf dem Black Lagoon Altis Life Server!</t><br/><t color='#EE0000'>Wichtiger Hinweis:</t><br/><t>Setze UNBEDINGT die Aktion10-Taste in der ARMA 3 -Konfiguration auf z.B. Strg.</t></br><t>Du findest die Einstellung in </t><t color='#00FF00'>Konfigurieren - Steuerung - Indiv. Steuerung - Aktionstaste 10</t></t>";


sleep 6;

hintSilent "Hinweis: Drücke H, um einen kleinen Tasten-Guide anzeigen zu lassen.";