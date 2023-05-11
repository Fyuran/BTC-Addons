
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_burnObject

Description:
    Adds action to burn an object

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_burnObject;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params[
    ["_obj", objNull, [objNull]]
];

_obj addAction 
[ 
    "Set on Fire", 
    { 
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target removeAction _actionId;
        [_target, QGVAR(zippo), 300, 0.7] remoteExecCall [QFUNC(forceSay3D), 0]; //[_target,_sound,_distance,_duration]
        sleep 2;
        [_target, QGVAR(fire), 300, 15] remoteExecCall [QFUNC(forceSay3D), 0];
        sleep 1;
        _v = createVehicle ["test_EmptyObjectForFireBig", getPosATL _target, [], 0, "CAN_COLLIDE"];
        sleep 13;
        (attachedObjects _target) apply {deleteVehicle _x;};
        deleteVehicle _v;
        deleteVehicle _target;
        createSimpleObject ["Oil_Spill_F", getPosASL _target];
        createSimpleObject ["Land_Garbage_square3_F", getPosASL _target];
    }, 
    [], 
    4, 
    true, 
    false, 
    "", 
    "true", 
    5 
];

#ifdef DEBUG_MODE_FULL
_mkr = [format["%1_loc",_obj], getPosASL _obj, 
"Icon", [1, 1], "TYPE:", "hd_dot", "COLOR:", "ColorBlack", "TEXT:", vehicleVarName _obj, "PERSIST"] call CBA_fnc_createMarker;
#endif