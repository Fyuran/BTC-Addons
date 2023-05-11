
/* ----------------------------------------------------------------------------
Function: btc_fnc_show_fps_init

Description:
    Init for the fps markers

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
params
[
	["_strcorner","", [""]],
	["_distance",200,[0]]
];

private _Map_size = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
private _corner = call {
	if(_strcorner isEqualTo "") exitWith {[0,0]};
	if(_strcorner isEqualTo "south_east") exitWith {[_Map_size,0]};
	if(_strcorner isEqualTo "north_west") exitWith {[0,_Map_size]};
	if(_strcorner isEqualTo "north_east") exitWith {[_Map_size,_Map_size]};
	["btc_fnc_show_fps_init: unidentified corner %1", _strcorner] call BIS_fnc_error;
	[0,0]
};

["Server",_corner,_distance,0] call btc_fnc_show_fps;

[{!((entities "HeadlessClient_F") isEqualTo [])},{
	params["_corner","_distance"];
	{
		[format["HC%1",_foreachIndex +1],_corner,_distance,_foreachIndex + 1] remoteExecCall ["btc_fnc_show_fps",_x];
	}forEach entities "HeadlessClient_F";
},[_corner,_distance]] call CBA_fnc_waitUntilAndExecute;

if(BTC_DEBUG) then{
	["btc_fnc_show_fps_init","showing server fps"] call btc_fnc_logDebug;
};

true