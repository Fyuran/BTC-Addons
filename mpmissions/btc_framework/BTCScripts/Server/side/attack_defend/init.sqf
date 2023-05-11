/* ----------------------------------------------------------------------------
Function: btc_fnc_side_attack_defend

Description:
    Parse an array of objects to be set as goals, objects will have to be killed sequentially, if the first one is not dead the second one can't be damaged
Parameters:
    _objs: array of OBJECTS
Returns:

Examples:
    (begin example)
        [[veh_1,veh_2]] call btc_fnc_side_attack_defend
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
    ["_objs",[objNull],[[objNull]]]
];

{
    _x allowDamage false;
    _x lock 2;
    private _marker = createMarker [format ["side_attack_defend_%1", _x], _x];
    _marker setMarkerType "mil_dot";
    _marker setMarkerColor "colorOPFOR";
    _marker setMarkerText format["Objective %1",_forEachIndex];
    _x setVariable ["marker",_marker];
}forEach _objs;

allCurators apply {_x addCuratorEditableObjects [_objs,true]};

_objs spawn {
    _this apply {
        _x allowDamage true;
        waitUntil {!alive _x};
        _marker = _x getVariable "marker";
        _marker setMarkerColor "colorBLUFOR";
    };
};