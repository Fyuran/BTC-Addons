
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createEnVeh

Description:
    Create a vehicle with desired crews.

Parameters:
    [# of Light Vehicles, # of Units inside, Probability(Default 1=100%)],
    [# of Heavy Vehicles, Probability], 
    [# of Statics, Probability(Default 1=100%)],
    [# of Helicopters, # of Units inside, Probability(Default 1=100%)],
Returns:

Examples:
    (begin example)
        _veh = [] call btc_framework_fnc_createEnVeh;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */
#include "script_component.hpp"
#define __LIGHTVEH__ 2
#define __HEAVYVEH__ 3
#define __STATIC__ 4
#define __HELI__ 5

_handle = _this spawn {
    scriptName QGVAR(createEnVeh_handle);
    params [
        ["_module", objNull, [objNull]],
        ["_category", __LIGHTVEH__, [0]], //which array element of _groups to add _group to
        ["_settings", [], [[]]],
        ["_spawnPoints", [], [[]]],
        ["_classes", [], [[]]],
        ["_crewClasses", [], [[]]]
    ];
    _settings params [
        ["_nGroups", 0, [0]],
        ["_countCrew", 1, [0]],
        ["_probability", 1, [0]]  
    ];
    if (_nGroups <= 0 || {_countCrew < 0}) exitWith {};
    if(_category < 2 || _category > 5) exitWith {ERROR_1("btc_framework_fnc_createEnVeh: bad _category (must be within 2 and 5)",_category)};
    if(_classes isEqualTo [] || {_spawnPoints isEqualTo []}) exitWith {};

    _groups = _module getVariable [QGVAR(groups),[[],[],[],[],[],[]]];
    _side = [getNumber(configfile >> "CfgVehicles" >> _classes select 0 >> "side")] call BIS_fnc_sideType;
    _boats = _classes select {_x isKindOf "Boat_F"};
    _classes = _classes - _boats;
    _patrolRadius = _module getVariable [QGVAR(maxPatrolRadius), 300];
    _groundPoints = _spawnPoints select {!(surfaceIsWater _x)};
    _waterPoints = _spawnPoints - _groundPoints;

    for "_i" from 1 to _nGroups do {
        if (random 1 < _probability) then {
            _group = createGroup [_side, true];
            (_groups select _category) pushBack _group;
            _class = selectRandom _classes;
            _wp = selectRandom _groundPoints;

            _pos = [] call {
                if(_category == __HELI__) exitWith { //Helicopters
                    _wp = selectRandom _spawnPoints;
                    _helipads = nearestObjects [_wp, ["HeliH"], 10, true];
                    if !(_helipads isEqualTo []) exitWith {
                        _helipad = selectRandom _helipads;
                        getPos _helipad
                    };
                    [_wp, 0, _patrolRadius, 10, 0, 0.2, 0, [], [_wp,_wp]] call BIS_fnc_findSafePos
                }; 
                if(_class isKindOf "Boat_F") exitWith { //boats
                    _class = selectRandom _boats;
                    _wp = selectRandom _waterPoints;
                    [_wp, 0, _patrolRadius, 10, 2, 0, 0, [], [_wp,_wp]] call BIS_fnc_findSafePos
                };
                if(_class isKindOf "StaticWeapon") exitWith {[_wp, 0, _patrolRadius/2, 10, 0, 0.2, 0, [], [_wp,_wp]] call BIS_fnc_findSafePos}; 
                [_wp, 0, _patrolRadius/2, 10, 0, 0.8, 0, [], [_wp,_wp]] call BIS_fnc_findSafePos         
            };
            _pos = [_pos] call FUNC(findPosOutsideRock);
            _pos set [2,0];
            _posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
            waitUntil {
                count (([] call CBA_fnc_players) select {_x distance _pos < 50 || {(_x distance _pos < 150 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}}) == 0
            };
            _veh = createVehicle[_class , _pos, [], 0, "NONE"];

            #ifdef DEBUG_MODE_FULL
            GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
            GVAR(EnUnits) pushBack _veh;
            #endif

            //vehicle crew
            _crew = [_veh, _group, false, "", selectRandom _crewClasses] call BIS_fnc_spawnCrew;
            _seatsAvaialable = count (fullCrew [_veh, "cargo", true] select {isNull (_x select 0)}); //get number of empty seats only
            if (_seatsAvaialable < _countCrew) then {_countCrew = _seatsAvaialable};
            while {count _crew < _countCrew && {alive _veh}} do {
                _unit = _group createUnit [selectRandom _crewClasses, [0,0,0], [], 0, "CAN_COLLIDE"];
                _unit assignAsCargo _veh; _unit moveInCargo _veh;
                _crew pushBack _unit;
                #ifdef DEBUG_MODE_FULL
                GVAR(EnUnits) = missionNamespace getVariable [QGVAR(EnUnits), []];
                GVAR(EnUnits) pushBack _unit;
                #endif
                sleep 1;
            };

            _group addVehicle _veh;
            [_group] call CBA_fnc_clearWaypoints;
            [] call {
                if (_class isKindOf "StaticWeapon") exitWith {_group setVariable [QGVAR(enType), "static"]  };
                if (_class isKindOf "Helicopter") exitWith {
                        waypoints _group apply { //ensure waypoints are placed at adequate height for the vehicle
                        private _pos = waypointPosition _x;
                        _pos set [2,200];
                        _x setWaypointPosition [_pos, -1];
                    };
                    _group setVariable [QGVAR(enType), "helicopter"];
                    [_group, getPosASL _module, _patrolRadius, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol;
                };
                if (_class isKindOf "Boat_F") exitWith { //boats
                    _group setVariable [QGVAR(enType), "boat"];
                    [_group, getPosASL _module, _patrolRadius, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_water
                }; //ground vehicles
                [_group, getPosASL _module, _patrolRadius, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [0, 0, 0]] call CBA_fnc_taskPatrol_ground;
                _group setVariable [QGVAR(enType), "vehicle"];
            };
            LOG_2("createEnVeh at %1(%2)",_pos,units _group);
            sleep 1;
        };
    };      
    _module setVariable [QGVAR(groups), _groups];   
};

waitUntil {scriptDone _handle};