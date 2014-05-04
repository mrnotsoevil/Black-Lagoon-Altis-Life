/*

	returns ALL perms (static perms and dyn perms)

*/

private["_staticperms", "_dynperms"];

_staticperms = call life_perms;
_dynperms = life_dynperms;

_staticperms + _dynperms;