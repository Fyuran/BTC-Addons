
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_findposoutsiderock

Description:
    Found position outside rock.

Parameters:
    _rpos - Position to check. [Array]

Returns:
    _rpos - New position outside rock.

Examples:
    (begin example)
        _rpos = [getPos player] call btc_framework_fnc_findposoutsiderock;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [
    ["_rpos", [0, 0, 0], [[]]]
];
_rpos params ["_x", "_y"];

private _objects = lineIntersectsObjs [[_x, _y, (getTerrainHeightASL _rpos) + 1], [_x, _y, (getTerrainHeightASL _rpos) + 100], objNull, objNull, false, 16];

if (_objects isEqualTo []) exitWith {_rpos};

private _object = _objects select 0;
if (_object in nearestTerrainObjects [_object, ["HIDE", "ROCK", "ROCKS"], 1]) then {
    private _roads = _rpos nearRoads 100;
    if (_roads isEqualTo []) then {
        _rpos = [_rpos, 5, 50, 10, 0] call BIS_fnc_findSafePos;
    } else {
        _rpos = getPos (_roads select 0);
    };
};

#ifdef DEBUG_MODE_FULL
_objects = lineIntersectsObjs [[_x, _y, (getTerrainHeightASL _rpos) + 1], [_x, _y, (getTerrainHeightASL _rpos) + 100], objNull, objNull, false, 16];
if !(_objects isEqualTo []) then {
    _object = _objects select 0;
    if (_object in nearestTerrainObjects [_object, ["HIDE", "ROCK", "ROCKS"], 1]) then {
        ERROR_1(["POS %1 Still inside rock", _rpos]);
        private _marker = createMarker [format ["btc_inrock_%1", _rpos], _rpos];
        _marker setMarkerType "mil_unknown";
        _marker setMarkerText "In rock";
        _marker setMarkerSize [0.5, 0.5];
    };
};
#endif

_rpos
