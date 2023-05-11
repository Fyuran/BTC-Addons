
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createEnHouse

Description:
    Fill me when you edit me !

Parameters:
    [# of Groups in Houses, Units in Group, Probability(Default 1=100%)]
Returns:

Examples:
    (begin example)
        _result = [] call btc_framework_fnc_createEnHouse;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
_handle = _this spawn {
    scriptName QGVAR(createEnHouse_handle);
    params [
        ["_module", objNull, [objNull]],
        ["_settings", [], [], [2,3]],
        ["_spawnPoints", [], [[]]],
        ["_classes", [], [[]]]
    ];
    _settings params [
        ["_nGroups", 0, [0]],
        ["_sizeGroups", 0, [0]],
        ["_probability", 1, [0]]  
    ];
    _spawnPoints = _spawnPoints select {!surfaceIsWater _x}; //in case _p points are used instead of house spots
    _groups = _module getVariable [QGVAR(groups),[[],[],[],[],[],[]]];
    _side = [getNumber(configfile >> "CfgVehicles" >> _classes select 0 >> "side")] call BIS_fnc_sideType;

    if (_nGroups<=0 || {_sizeGroups<=0}) exitWith {};
    
    for "_i" from 1 to _nGroups do {
        if (random 1 < _probability) then {
            _group = createGroup [_side, true];
            _group setVariable [QGVAR(enType), "house"];
            _group setVariable ["VCM_DisableForm",true]; //This command will disable AI group from changing formations.
            _group setVariable ["VCM_NOFLANK",true]; //This command will stop the AI squad from executing advanced movement maneuvers.
            (_groups select 0) pushBack _group;
            _pos = selectRandom _spawnPoints;
            for "_j" from 1 to _sizeGroups do {
                _unit = _group createUnit [selectRandom _classes, _pos, [], 0, "NONE"];
                #ifdef DEBUG_MODE_FULL
                GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
                GVAR(EnUnits) pushBack _unit;
                #endif
            };
            [_group] call CBA_fnc_clearWaypoints;
            [_group, _pos] call CBA_fnc_waypointGarrison;
            LOG_2("createEnPatrol at %1(%2)",_pos,units _group);
        sleep 1;
        }; 
    };     
    _module setVariable [QGVAR(groups), _groups];  
};

waitUntil {scriptDone _handle};