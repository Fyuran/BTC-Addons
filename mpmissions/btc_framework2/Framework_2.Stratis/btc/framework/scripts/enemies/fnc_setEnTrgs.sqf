
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_setEnTrgs

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_framework_fnc_setEnTrgs;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if (count _this > 3) exitWith {ERROR_1("btc_framework_fnc_setEnTrgs Wrong count of params, %1",_this)};
params [
	["_trgs", [], [[]]],
	["_EnemySpawn_Setup", [], [[]], [1,2,3,4,5,6]],
	["_settings", [0,0], [[]], 2]
];
_settings params [
	["_factionID", 0, [0]],
	["_extraRadius", 0, [0]]
];

_trgs apply {
	if(isNull _x) then {ERROR_MSG_1("bad enemy spawn trigger",_x)};
	_x setVariable [QGVAR(enemySpawn_Setup), _EnemySpawn_Setup];
	_x setVariable [QGVAR(enemySpawn_Settings), _settings];
	
	_x setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_x setTriggerInterval 5;
	_x setTriggerStatements ["this", QUOTE([thisTrigger] call FUNC(createEnModule)), ""];
	triggerArea _x params["_a", "_b", "_angle", "_isRectangle", "_c"];
	_x setTriggerArea [_a + _extraRadius, _b + _extraRadius, _angle, _isRectangle];

	GVAR(enTrgs) pushBack _x;

	#ifdef DEBUG_MODE_FULL
	_trgPos = getPosASL _x;
	_mkr = [format["%1_loc",_x], _trgPos, 
	"Icon", [1, 1], "TYPE:", "hd_dot", "COLOR:", "ColorOPFOR", "TEXT:", vehicleVarName _x, "PERSIST"] call CBA_fnc_createMarker;
	_mkr = [format["%1_locn",_x], _trgPos, 
	"Ellipse", [_a + _extraRadius, _b + _extraRadius], "COLOR:", "ColorOPFOR", "PERSIST"] call CBA_fnc_createMarker;
	_mkr setMarkerAlpha 0.8;
	_mkr setMarkerBrush "DiagGrid";
	_mkr = [format["%1_locn2",_x], _trgPos, 
	"Ellipse", [(_a+_extraRadius)/2, (_b+_extraRadius)/2], "COLOR:", "ColorRed", "PERSIST"] call CBA_fnc_createMarker;
	_mkr setMarkerAlpha 0.6;
	_x setVariable [QGVAR(debugMrk), _mkr];
	#endif
};

#ifdef DEBUG_MODE_FULL
publicVariable QGVAR(enTrgs);
#endif