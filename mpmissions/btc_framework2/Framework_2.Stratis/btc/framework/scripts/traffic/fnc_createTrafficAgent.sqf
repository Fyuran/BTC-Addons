
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createCivAgent

Description:
    Create civilian agent for civilian presence module

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_framework_fnc_createCivAgent;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [
    ["_module",objNull,[objNull]],
    ["_spawnPoints", [], [[]]],
    ["_trgArea", [], [[]]]
];
_trgArea params [
    ["_a", GVAR(city_extra_radius), [0]],
    ["_b", GVAR(city_extra_radius), [0]]
];

//randomize position
_spawnPoint = selectRandom _spawnPoints;
_pos = getPos _spawnPoint;
_trgRadius = _a + _b;
_posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];

//check if any player can see the point of creation
_seenBy = allPlayers select {_x distance _pos < 50 || {(_x distance _pos < 150 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}};
//terminate if any player can see the position
if (count _seenBy > 0) exitWith {objNull};

_class = selectRandom (_module getVariable ["#unitTypes",[]]);

_destination = getPosATL selectRandom _spawnPoints;
if (_destination isEqualTo []) exitWith {objNull};
_destination = ([([_destination, random 100] call CBA_fnc_randPos) nearRoads _trgRadius/2, [], {_destination distance2D _x}, "DESCEND"] call BIS_fnc_sortBy) select 0;

if (_destination isEqualTo []) exitWith {objNull};

_direction = direction _spawnPoint;
_pos = [_pos, 0, 100, 5, 0, 0.8, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
_pos = getPosATL ((_pos nearRoads 100) param[0, _pos]);
_veh = createVehicle[_class , _pos, [], 0, "NONE"];
_veh setDir _direction;
_veh setVariable [QGVAR(TrafficTimeout), CBA_missionTime];

_unit = createAgent [getText(configfile >> "CfgVehicles" >> _class >> "crew"), [0,0,0], [], 0, "CAN_COLLIDE"];
_unit disableAI "FSM";
_unit setBehaviour "CARELESS";
_unit assignAsDriver _veh; _unit moveInDriver _veh;
_unit setDestination [_destination, "LEADER PLANNED", true];
_unit setVariable [QGVAR(trafficDestination), _destination];

#ifdef DEBUG_MODE_FULL
GVAR(trafficUnits) = missionNamespace getVariable [QGVAR(trafficUnits), []];
GVAR(trafficUnits) pushBack _unit;
#endif

//ehs backlinks
_unit setVariable [QGVAR(trafficVeh), _veh];
_unit setVariable [QGVAR(spawnPoints), _spawnPoints];
_veh setVariable [QGVAR(trafficAgent), _unit];
//add vehgicles to be deleted
_unit addEventHandler ["Deleted", {
    params ["_unit"];
    _veh = _unit getVariable [QGVAR(trafficVeh), objNull];
    if(local _veh || {!alive _veh}) then {deleteVehicle _veh}; //in case players obtained this vehicle
}];
_veh addEventHandler ["Deleted", {
    params ["_veh"];
    _unit = _veh getVariable [QGVAR(trafficAgent), objNull];
    deleteVehicle _unit;
}];
_veh addEventHandler ["HandleDamage", {
	params ["_veh", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator"];
    if(isPlayer _instigator) then {
        _unit = driver _veh;
        unassignVehicle _unit;
        MoveOut _unit;
        LOG_2("%1 hit traffic agent's vehicle at %2",_instigator,GetPosASL _unit);
        [_unit, [_instigator]] call bis_fnc_cp_main;
    };
    nil
}];
_unit addEventHandler ["FiredNear", {
    params ["_unit", "_firer"];
    unassignVehicle _unit;
    MoveOut  _unit;
    LOG_2("%1 fired near %2",_firer,GetPosASL _unit);
    [_unit, [_firer]] call bis_fnc_cp_main;
}];
_unit addEventHandler ["Hit", {
    params ["_unit", "_source", "_damage", "_instigator"];
    if(isPlayer _instigator) then {
        LOG_2("%1 hit traffic agent at %2",_instigator,GetPosASL _unit);
        unassignVehicle _unit;
        MoveOut  _unit;
        [_unit, [_instigator]] call bis_fnc_cp_main;
    };
}];
_unit addEventHandler ["GetOutMan", {
	params ["_unit"];
    LOG_1("traffic agent at %1 got out of the vehicle",GetPosASL _unit);
    [{
        _veh = _this getVariable [QGVAR(trafficVeh), objNull];
        deleteVehicle _this;
        if(local _veh) then {deleteVehicle _veh};
    }, _unit, 100] call CBA_fnc_waitAndExecute;
}];

_unit