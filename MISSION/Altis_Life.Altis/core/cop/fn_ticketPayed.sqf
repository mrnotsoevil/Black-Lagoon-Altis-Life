/*
	Called when user payed the ticket
*/
private["_money"];

_money = _this select 1;

life_cash = life_cash + _money;
hint format["Du hast $%1 bekommen!", _money];

