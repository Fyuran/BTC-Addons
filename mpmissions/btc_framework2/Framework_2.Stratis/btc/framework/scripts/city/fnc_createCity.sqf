
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createCity

Description:
    Create a city at the desired position with all necessary variable and the trigger to detect player presence.

Parameters:
    _position - The position where the city will be created. [Array]
    _type - Type of city. [String]
    _name - The name of the city. [String]
    _radius_x - The city radius along x. [Number]
    _radius_y - The city radius along y. [Number]
    _id - ID of the city in the cfgworlds. [Number]

Returns:
    _city - City created [Onject]

Examples:
    (begin example)
        [] call btc_framework_fnc_createCity;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [
    ["_position", [0, 0, 0], [[]]],
    ["_type", "", [""]],
    ["_name", "", [""]],
    ["_radius_x", 0, [0]],
    ["_radius_y", 0, [0]],
    ["_id", count GVAR(city_all), [0]]
];

private _trg = createTrigger ["EmptyDetector", _position, false]; 
_trg setVariable [QGVAR(type), _type];
_trg setVariable [QGVAR(name), if(_name isEqualTo "") then {_type} else {_name}, true];
_trg setTriggerArea [_radius_x + _radius_y + GVAR(city_extra_radius), _radius_x + _radius_y + GVAR(city_extra_radius), 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", QUOTE([thisTrigger] call FUNC(activateCity)), QUOTE([thisTrigger] call FUNC(deactivateCity))];
_trg setTriggerInterval 5;

GVAR(city_all) pushBack _trg;

#ifdef DEBUG_MODE_FULL
    _mkrname = format["%1(%2)",_name, _id];
    if(_name isEqualTo "") then {_mkrname = format["%1(%2)",_type, _id]};
    _mkr = [_mkrname, [_position select 0, (_position select 1) + 100], 
    "Icon", [1, 1], "TYPE:", "hd_dot", "COLOR:", "ColorBlack", "TEXT:", format["%1(%2)", _mkrname, _type], "PERSIST"] call CBA_fnc_createMarker;
    _mkr = [_mkrname + "_radius", [_position select 0,_position select 1], 
    "Ellipse", [_radius_x + _radius_y + GVAR(city_extra_radius), _radius_x + _radius_y + GVAR(city_extra_radius)], "COLOR:", "ColorOrange", "PERSIST"] call CBA_fnc_createMarker;
    _mkr setMarkerAlpha 0.3;
#endif

_trg
