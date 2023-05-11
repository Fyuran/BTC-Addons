
if (isnil "server")then{hint "YOU MUST PLACE A GAME LOGIC NAMED SERVER!";};
call compile preprocessfilelinenumbers "Scripts\Server\eos\AI_Skill.sqf";

EOS_Deactivate = {
	private ["_mkr"];
	_mkr=(_this select 0);
	{
		_x setmarkercolor "colorblack";
		_x setmarkerAlpha 0;
	}foreach _mkr;
};

EOS_debug = {
	private ["_note"];
	_mkr=(_this select 0);
	_n=(_this select 1);
	_note=(_this select 2);
	_pos=(_this select 3);

	_mkrID=format ["%3:%1,%2",_mkr,_n,_note];
	deletemarker _mkrID;
	_debugMkr = createMarker[_mkrID,_pos];
	_mkrID setMarkerType "Mil_dot";
	_mkrID setMarkercolor "colorBlue";
	_mkrID setMarkerText _mkrID;
	_mkrID setMarkerAlpha 0.5;
};