
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_destroyCivModule

Description:
    Destroy Civilian Presence module and deletes assigned units and waypoints

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_destroyCivModule;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]]
]) exitWith {};

private _module = _trg getVariable [QGVAR(civModule), objNull];
if(isNull _module) exitWith {};

_module spawn {
	params["_module"];
	waitUntil {_module getVariable ["#initialized",false]};
	_module setVariable ["#active",false];
	_units = _module getVariable ["#units",[]];
	_wps = _module getVariable ["#modulesSafeSpots",[]];
	_spawns = _module getVariable ["#modulesUnit",[]];

	_units apply {
		_pos = getPos _x;
		_posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
		waitUntil {
			count (([] call CBA_fnc_players) select {_x distance _pos < 50 || {(_x distance _pos < 150 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}}) == 0
		};
		deleteVehicle _x; sleep 0.1
	};
	_wps apply {_x call CBA_fnc_deleteNamespace; sleep 0.1};
	_spawns apply {_x call CBA_fnc_deleteNamespace; sleep 0.1};

	_module call CBA_fnc_deleteNamespace;
};

#ifdef DEBUG_MODE_FULL
(_module getVariable [QGVAR(civ_markers), []]) apply {deleteMarker _x};
#endif
