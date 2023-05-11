
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_draw3Ds

Description:
Shows unit icons on screen on each frame

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_draw3Ds;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
addMissionEventHandler ["Draw3D",{
        _cities = missionNamespace getVariable [QGVAR(city_all_pos), []];
        _cities apply {
            drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\default_ca.paa", [1,1,1,0.5], _x select 0, 1, 1, 0, _x select 1, 2];
        };
        _enemySpawns = missionNamespace getVariable [QGVAR(enTrgs), []];
        _enemySpawns apply {
            getPosATLVisual _x params ["_xPos","_yPos","_zPos"];
            drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\kill_ca.paa", [0.5,0,0,0.5], [_xPos,_yPos,_zPos+50], 1, 1, 0, str _x, 2];
        };
        _units = missionNamespace getVariable [QGVAR(trafficUnits), []];
        _units = _units select {alive _x};
        {
            _wp = (expectedDestination _x) select 0;
            if(!isNil "_wp") then {
                drawIcon3D [getText (configFile/"CfgVehicles"/ typeOf vehicle _x /"Icon"), [0.4,0,0.5,0.5], getPosATLVisual _x, 1, 1, 0, format["Traffic(%1)",_forEachIndex], 2];
                drawLine3D [GetPosATLVisual _x, _wp, [0.4,0,0.5,0.5]];
                drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\move_ca.paa", [0.4,0,0.5,0.5], _wp, 1, 1, 0, format["Destination(%1)",_forEachIndex], 2];
            };
        }forEach _units;

        _units = missionNamespace getVariable [QGVAR(Civs), []];
        _units = _units select {alive _x};
        _units apply {
            drawIcon3D [getText (configFile/"CfgVehicles"/ typeOf vehicle _x /"Icon"), [1,0,1,0.5], getPosATLVisual _x, 1, 1, 0, "Civilian", 2];
        };
        _units = missionNamespace getVariable [QGVAR(EnUnits), []];
        _units = _units select {alive _x};
        _units apply {
            if (isNull objectParent _x) then {
                _sideColor = ([side _x, false] call BIS_fnc_sideColor); _sideColor set [3,0.5];
                drawIcon3D [getText (configFile/"CfgVehicles"/ typeOf vehicle _x /"Icon"), _sideColor, [getPosATLVisual _x, getPosASLVisual _x] select surfaceIsWater getPosASL _x, 1, 1, 0, format["%1", _x], 2];
            };
        }; 
        _units = missionNamespace getVariable [QGVAR(FlyByes), []];
        _units = _units select {alive _x};
        _units apply {
            _wp = (expectedDestination _x) select 0;
            drawIcon3D [getText (configFile/"CfgVehicles"/ typeOf vehicle _x /"Icon"), [0.2,1,0,0.5], [getPosATLVisual _x, getPosASLVisual _x] select surfaceIsWater getPosASL _x, 1, 1, 0, "FlyBy", 2];
            drawLine3D [getPosASLVisual _x, _wp, [1,0,1,1]];
            drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\move_ca.paa", [0.2,1,0,0.5], _wp, 1, 1, 0, "FlyBy Destination", 2];
        };
        _animals = missionNamespace getVariable [QGVAR(ambientAnimals_debug), []];
        _animals apply {
            drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\simpleTasks\letters\a_ca.paa", [0,1,0,0.5], getPosATLVisual _x, 1, 1, 0, "Animal", 2];
        };
    }
];