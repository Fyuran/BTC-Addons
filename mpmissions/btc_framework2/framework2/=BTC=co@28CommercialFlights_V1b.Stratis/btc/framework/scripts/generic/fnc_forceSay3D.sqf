/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_forceSay3D

Description:
    Prepares location for say3D to targets

Parameters:
    _objs : ARRAY of OBJECT

Returns:

Examples:
    (begin example)
        [cursorObject, "sound", 1000, 30] call btc_framework_fnc_forceSay3D;
    (end)

Public: No

=BTC=

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params[
	["_target", [0,0,0], [objNull]],
	["_sound", "", [""]],
	["_distance", 0, [0]],
	["_duration", 5, [0]]
];
if(!alive _target) exitWith {ERROR_2("%1 %2","btc_fnc_say3D", format["bad params", _this])};

_dummy = _target getVariable ["#dynamicsound", objNull];
deleteVehicle _dummy;
_dummy = "#dynamicsound" createVehicleLocal getPos _target;
_target setVariable ["#dynamicsound", _dummy];
_dummy say3D [_sound, _distance];

[{deleteVehicle _this}, _dummy, _duration] call CBA_fnc_waitAndExecute;