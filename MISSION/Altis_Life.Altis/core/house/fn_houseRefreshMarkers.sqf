/*
*	refreshes all markers
*
*/

private ["_house_names", "_marker_name", "_house_marker_position"];

_house_names = missionNamespace getVariable "spawn_home_list";

hint "Aktualisiere Hausmarkierungen ...";

{
	//Only for default house scheme!!!
	_house_marker_position = getMarkerPos format["%1_spawn", _x];
	
	_marker_name = format["marker__%1", _x];
	//Try to delete marker
	
	deleteMarkerLocal _marker_name; //crash?
	createMarkerLocal [_marker_name, _house_marker_position];
	_marker_name setMarkerTextLocal "Haus";
	_marker_name setMarkerShapeLocal "RECTANGLE";
	_marker_name setMarkerColorLocal "ColorGreen";
	_marker_name setMarkerSizeLocal [1,1];
	
}
foreach (_house_names select 0) select 0;

hint "Hausmarkierungen aktualisiert!";