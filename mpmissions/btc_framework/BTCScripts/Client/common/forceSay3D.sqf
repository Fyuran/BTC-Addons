/* ----------------------------------------------------------------------------
Function: btc_fnc_forceSay3D

Description:
    Prepares location for say3D to targets

Parameters:
    _objs : ARRAY of OBJECT

Returns:

Examples:
    (begin example)
        [cursorObject, "sound", 1000, 30] call btc_fnc_forceSay3D;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_target", [0,0,0], [objNull]],
	["_sound", "", [""]],
	["_distance", 0, [0]],
	["_duration", 5, [0]]
];
if(!alive _target) exitWith {["btc_fnc_say3D", format["bad params", _this]] call btc_fnc_logDebug};

_dummy = _target getVariable ["#dynamicsound", objNull];
deleteVehicle _dummy;
_dummy = "#dynamicsound" createVehicleLocal getPos _target;
_target setVariable ["#dynamicsound", _dummy];
_dummy say3D [_sound, _distance];

[{deleteVehicle _this}, _dummy, _duration] call CBA_fnc_waitAndExecute;