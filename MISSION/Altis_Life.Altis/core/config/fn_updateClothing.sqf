/*

	Updates player clothing by replacing vanilla by custom ones

*/

private["_uniform","_backpack"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{
	case (playerSide == west && _uniform == "U_Rangemaster"):
	{
		if( (call life_coplevel) > 1) then
		{
			player setObjectTextureGlobal  [0, "uniforms\police_uniform.paa"]; //recruit uniform
		}
		else
		{
			player setObjectTextureGlobal  [0, "uniforms\police_recruit_uniform.paa"]; //recruit uniform
		};
	};
	case (playerSide == west && _uniform == "U_B_SpecopsUniform_sgg"):
	{
		player setObjectTextureGlobal  [0, "uniforms\sek.paa"]; //recruit uniform
	};
	case (playerSide == civilian && _uniform == "U_Rangemaster" && (["adac"] call life_fnc_permLevel) > 0 ):
	{
		player setObjectTextureGlobal  [0, "uniforms\adac_uniform.paa"]; //adac uniform
	};
};

///backpack
////////////////

/*_backpack = backpack player;

switch(true) do
{
	case (playerSide == west && _backpack == "B_Bergen_Base"):
	{
	};
};*/