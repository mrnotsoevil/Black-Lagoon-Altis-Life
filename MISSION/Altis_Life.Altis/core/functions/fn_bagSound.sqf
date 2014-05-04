/*

	Play bag sound if not playing

*/

if(life_bagsound_playing) exitWith {};

life_bagsound_playing = true;

switch( round (random 3)) do
{
	case 0: { player say3D "bag_1"; };
	case 1: { player say3D "bag_2"; };
	default { player say3D "bag_3"; };
};

sleep 1;

life_bagsound_playing = false;