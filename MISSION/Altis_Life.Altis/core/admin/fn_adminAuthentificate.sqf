/*
 *	Runs admin authentification 
 *
 */ 

private["_pw"];

if(serverCommandAvailable "#kick") exitWith
{
    hint "Du bist bereits authentifiziert!";
};

_pw = ctrlText 1400;

if(isNil("_pw") || _pw == "") exitWith
{
    hint "Du musst ein Passwort eingeben!";
};

closeDialog 0;

serverCommand format [ "#login %1", _pw];

if(!(serverCommandAvailable "#kick")) exitWith
{
    hint "Authentifizierung fehlgeschlagen!";
};
