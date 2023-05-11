
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createEnpatrol

Description:
    Fill me when you edit me !

Parameters:
    [# of Patrols, size of Patrols, Probability(Default 1=100%)]
Returns:

Examples:
    (begin example)
        _result = [] call btc_framework_fnc_createEnpatrol;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
_handle = _this spawn {
    scriptName QGVAR(createEnPatrol_handle);
    params [
        ["_module", objNull, [objNull]],
        ["_settings", [], [[]], [2,3]],
        ["_spawnPoints", [], [[]]],
        ["_classes", [], [[]]]
    ];
    _classes params [
        ["_infantry", [], [[]]],
        ["_divers", [], [[]]]
    ];
    _settings params [
        ["_nGroups", 0, [0]],
        ["_sizeGroups", 0, [0]],
        ["_probability", 1, [0]]  
    ];

    _groups = _module getVariable [QGVAR(groups),[[],[],[],[],[],[]]];
    _side = [getNumber(configfile >> "CfgVehicles" >> _infantry select 0 >> "side")] call BIS_fnc_sideType;

    if (_nGroups<=0 || {_sizeGroups<=0}) exitWith {};
    
    for "_i" from 1 to _nGroups do {
        if (random 1 < _probability) then {
            _group = createGroup [_side, true];
            (_groups select 1) pushBack _group;
            _pos = selectRandom _spawnPoints;
            _isSurfaceWater = surfaceIsWater _pos;
            for "_j" from 1 to _sizeGroups do {
                _class = [selectRandom _infantry, selectRandom _divers] select _isSurfaceWater;
                _unit = _group createUnit [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
                _group setVariable [QGVAR(enType), "patrol"];
                _unit setPos _pos;
                #ifdef DEBUG_MODE_FULL
                GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
                GVAR(EnUnits) pushBack _unit;
                #endif
            };
            _patrolRadius = _module getVariable [QGVAR(maxPatrolRadius), 300];
            [_group] call CBA_fnc_clearWaypoints;
            if(_isSurfaceWater) then {
                [_group, getPosASL _module, _patrolRadius, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_water;
            } else {
                [_group, getPosASL _module, _patrolRadius, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_ground;
            };
            LOG_2("createEnPatrol at %1(%2)",_pos,units _group);
        sleep 1;
        };
    };
    _module setVariable [QGVAR(groups), _groups];  
};

waitUntil {scriptDone _handle};