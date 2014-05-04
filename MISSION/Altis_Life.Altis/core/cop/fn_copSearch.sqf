#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun","_weapons","_wp","__info","__item","__count","__marketprice","_policeitems","_illegal","_illegalwp","_illegalpolice"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
_weapons = [_this,3,[],[[]]] call BIS_fnc_param;
_policeitems = [_this,4,[],[[]]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_illegal = 0;
_illegalpolice = 0;
_illegalwp = 0;
_inv = "";
if((count _invs) + (count _weapons) > 0) then
{
    //calculate bounty for items
	/*{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;*/
    
    //use the price, defined in the array!
    {
        __item = _x select 0;
        __count = _x select 1;
        __marketprice = [__item] call life_fnc_marketGetSellPrice; //use market if possible
        
        if(__marketprice > 0) then //check for valid market price
        {
            _illegal = round (_illegal + ((__count * __marketprice) / 2));
        }
        else
        {
            //look in array
            {
            	if( (_x select 0) == __item) exitWith
            	{
                	_illegal = _illegal + (__count * (_x select 1));
           	};
	    }
	    foreach life_illegal_items;
        };
        
        
        //Add ui entry
        _inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
       
    }
    foreach _invs;
	
	{
        __item = _x select 0;
        __count = _x select 1;
      
            //look in array
            {
            	if( (_x select 0) == __item) exitWith
            	{
                	_illegalpolice = _illegalpolice + (__count * (_x select 1));
           		};
       		}
        	foreach life_police_only_items_bounty;
        
        
        //Add ui entry
        _inv = _inv + format["(Polizei) %1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
       
    }
    foreach _policeitems;
	
	
	{
		__info = [_x] call life_fnc_fetchCfgDetails;
		_inv = _inv + format["Waffe: %1<br/>", __info select 1]; 
		
		_illegalwp = _illegalwp + 5000; //Pauschaler Betrag
	}
	foreach _weapons;
	
	
	/////////////////////////////////////////////////Give wanteds
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,name _civ,"482"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};	
	if(_illegal > 0) then
	{
		[[getPlayerUID _civ,name _civ,"481"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	
	if(_illegalwp > 0) then
	{
		[[getPlayerUID _civ,name _civ,"weapon"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	
	if(_illegalpolice > 0) then
	{
		[[getPlayerUID _civ,name _civ,"policeitems"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	
	
	_illegal = _illegal + _illegalpolice + _illegalwp;	
	
	[[0,format["%1 hat Items im Wert von $%2 dabei.",name _civ,[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	
	
	//Pay the cop 
	life_atmcash = life_atmcash + _illegal;
	
}
	else
{
	_inv = "Keine illegalen Items.";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Couldn't search %1", name _civ]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Gegenstände</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,name _civ,_inv,if(_robber) then {"Hat die Bank ausgeraubt"} else {""}];

if(_robber) then
{
	[[0,format["%1 wurde als Bankräuber identifiziert!",name _civ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};