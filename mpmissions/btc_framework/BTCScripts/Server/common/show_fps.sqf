
/* ----------------------------------------------------------------------------
Function: btc_fnc_debug_marker_show_fps

Description:
    Inserts marker which holds fps and display it on the map

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#define MARKER_SIZE 0.7
params[
	["_sourcestr","",[""]],
	["_corner",[0,0],[[]],2],
	["_distance",200,[0]],
	["_slot",0,[0]]
];
_corner params ["_corner_x","_corner_y"];
private _myfpsmarker = createMarker [ format ["fpsmarker%1", _sourcestr ], [ _corner_x, _corner_y + (_distance * _slot) ] ];
_myfpsmarker setMarkerType "mil_start";
_myfpsmarker setMarkerSize [ MARKER_SIZE, MARKER_SIZE ];
private _handle=[{
	_args params ["_myfpsmarker","_sourcestr"];
	_myfps = diag_fps;
	_localunits = { local _x } count allUnits;
	_localvehicles = { local _x } count vehicles;
	_localgroups = {local _x} count allGroups;

	_myfpsmarker setMarkerColor "ColorGREEN";
	if ( _myfps < 30 ) then { _myfpsmarker setMarkerColor "ColorYELLOW"; };
	if ( _myfps < 20 ) then { _myfpsmarker setMarkerColor "ColorORANGE"; };
	if ( _myfps < 10 ) then { _myfpsmarker setMarkerColor "ColorRED"; };

	_myfpsmarker setMarkerText format [ "%1: %2 fps, %3 units, %4 vehicles, %5 groups", _sourcestr, ( round ( _myfps * 100.0 ) ) / 100.0 , _localunits, _localvehicles, _localgroups];
},
1, [_myfpsmarker,_sourcestr]] call CBA_fnc_addPerFrameHandler;

if(BTC_DEBUG) then{
	["btc_fnc_debug_marker_show_fps",format["managing client: %1", clientOwner]] call btc_fnc_logDebug;
};

[_myfpsmarker,_handle]