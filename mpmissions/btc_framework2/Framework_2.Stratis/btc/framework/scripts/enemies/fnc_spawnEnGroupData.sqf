
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_spawnEnGroupData

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_framework_fnc_spawnEnGroupData;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp" //[_pos, _type, _units, _side, _behaviour, [_vehType, _vehPos, _dir]]
_handle = _this spawn {
    scriptName QGVAR(createEnGroup_handle);
    params [
        ["_module", objNull, [objNull, []]]
    ];

    _groups = _module getVariable [QGVAR(groups),[[],[],[],[],[],[]]];

    _savedData = _module getVariable [QGVAR(modulesSavedGroups), []];
    if(_savedData isEqualTo []) exitWith {
        _roadPoints = _module getVariable [QGVAR(modulesRoads), []];
        _roadPoints apply {_x call CBA_fnc_deleteNamespace; sleep 0.1};
        _module call CBA_fnc_deleteNamespace;
    };
    _module setVariable [QGVAR(unitHandlingRunning),true];
    {
        _x apply {
            _x params [
                ["_pos", [], [[]]],
                ["_type", "", [""]],
                ["_units", [], [[]]],
                ["_side", east, [west]],
                ["_behaviour", ["AWARE","YELLOW","STAG COLUMN"], [[]], 3],
                ["_vehData", [], [[]], 3]
            ];
            _behaviour params [
                ["_state", "SAFE", [""]],
                ["_combatMode", "YELLOW", [""]],
                ["_formation", "STAG COLUMN", [""]]
            ];
            _vehData params [
                ["_vehType", "", [""]], 
                ["_vehPos", [0,0,0], [[]]], 
                ["_dir", 0, [0]]
            ];

            TRACE_2("spawnGroupData",_x,_vehData);
            _group = createGroup [_side, true];
            (_groups select _forEachIndex) pushBack _group;

            _isSurfaceWater = surfaceIsWater _pos;
            _units apply {
                _posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
                waitUntil {
                    count (([] call CBA_fnc_players) select {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5}) == 0
                };
                _unit = _group createUnit [_x, _pos, [], 0, "NONE"];
                #ifdef DEBUG_MODE_FULL
                GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
                GVAR(EnUnits) pushBack _unit;
                #endif
            };

            _veh = objNull;
            if !(_vehType isEqualTo "") then {
                _posASL = (AGLToASL _vehPos) vectorAdd [0,0,1.5];
                waitUntil {
                    count (([] call CBA_fnc_players) select {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5}) == 0
                };
                _veh = createVehicle[_vehType , _vehPos, [], 0, "FLY"];
                _veh setDir _dir;
                _group addVehicle _veh;
                units _group apply {_x moveInAny _veh};
                #ifdef DEBUG_MODE_FULL
                GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
                GVAR(EnUnits) pushBack _veh;
                #endif
            };

            _patrolRadius = _module getVariable [QGVAR(maxPatrolRadius), 300];
            [_group] call CBA_fnc_clearWaypoints;
            [] call {
                if !(_type isEqualTo "static") exitWith {
                    _patrolRadius = _module getVariable [QGVAR(maxPatrolRadius), 300];
                };
                if (_type isEqualTo "helicopter") exitWith {
                    [_group, getPosASL _module, _patrolRadius, 7, "MOVE", _state, _combatMode, "FULL", _formation, "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol;
                    waypoints _group apply { //ensure waypoints are placed at adequate height for the vehicle
                        private _pos = waypointPosition _x;
                        _pos set [2,200];
                        _x setWaypointPosition [_pos, -1];
                    };
                };
                if (_isSurfaceWater) exitWith { //boats and divers
                    [_group, getPosASL _module, _patrolRadius, 7, "MOVE", _state, _combatMode, "FULL", _formation, "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_water
                }; 
                if(_type isEqualTo "house") exitWith { //House
                    [_group] call CBA_fnc_clearWaypoints;
                    leader _group setVariable [QGVAR(enType), "house"];
                    [_group, _pos] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";  
                };//ground vehicles
                [_group, getPosASL _module, _patrolRadius, 7, "MOVE", _state, _combatMode, "FULL", _formation, "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_ground;
            };
            sleep 1;
        };
    }forEach _savedData;
    _module setVariable [QGVAR(unitHandlingRunning),false];
    _module setVariable [QGVAR(groups), _groups];
};

waitUntil {scriptDone _handle};