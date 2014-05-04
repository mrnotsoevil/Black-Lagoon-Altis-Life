/*

	Returns if player is in event

*/

private["_ret"];

_ret = false;

if(playerSide == west) then
{
	_ret = license_cop_event;
}
else
{
	_ret = license_civ_event;
};

_ret;