
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_getEnGroupData

Description:
    Get groups parameters (position, waypoints, behaviour ...), save them and delete.

Parameters:
    _group - Group of units. [Group]

Returns:

Examples:
    (begin example)
        _result = [] call btc_framework_fnc_getEnGroupData
;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [
    ["_group", grpNull, [grpNull]]
];
if(isNull _group) exitWith {};

_leader = leader _group;
private _pos = [getPosATL _leader, getPosASL _leader] select surfaceIsWater getPosASL _leader;
private _type = _group getVariable [QGVAR(enType), ""];
private _units = [];
private _behaviour = [behaviour (leader _group), combatMode _group, formation _group];
private _side = side _leader;

units _group apply {
    if(alive _x) then { _units pushBack typeOf _x};
};
if(_units isEqualTo []) exitWith {};

private _veh = objectParent _leader;
private _vehType = typeOf _veh;
private _vehPos = getPosATL _veh;
private _dir = getDir _veh;

[_pos, _type, _units, _side, _behaviour, [_vehType, _vehPos, _dir]]
