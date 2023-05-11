/* ----------------------------------------------------------------------------
Function: btc_fnc_database_mhqs_undeployHq

Description:
    Un-deploys HQ

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject, west] call btc_fnc_database_mhqs_undeployHq;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params [
    ["_target", objNull, [objNull]]
];
_target setVariable ["btc_database_MHQisActive", false, true];
private _objs = _target getVariable ["btc_database_MHQobjs", []];
if (_objs isEqualTo []) exitWith {["btc_fnc_database_mhqs_undeployHq: no HQ objects found to undeploy for %1", _target] call btc_fnc_debugLog};
_objs apply {deleteVehicle _x};
_fuel = _target getVariable ["btc_database_MHQfuel", 1];
[_target, _fuel] remoteExecCall ["setFuel", _target];

if (BTC_DEBUG) then {
    private _mrk = _target getVariable ["btc_database_zone_marker", ""];
    deleteMarker _mrk;
};