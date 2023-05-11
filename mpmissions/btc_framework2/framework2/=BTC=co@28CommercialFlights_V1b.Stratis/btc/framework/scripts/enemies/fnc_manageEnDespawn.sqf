
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_destroyEnModule

Description:
    Destroy Civilian Presence module and deletes assigned units and waypoints

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_destroyEnModule;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]]
]) exitWith {};

private _module = _trg getVariable [QGVAR(EnModule), objNull];
if(isNull _module) exitWith {};

_module spawn {
	params["_module"];
	waitUntil {!(_module getVariable [QGVAR(unitHandlingRunning),false])};
	_module setVariable [QGVAR(initialized),false];
	_groups = _module getVariable [QGVAR(groups), [[],[],[],[],[],[]]];
	_savedGroups = [[],[],[],[],[],[]];
	_module setVariable [QGVAR(unitHandlingRunning),true];
	{
		_x apply {
			(_savedGroups select _forEachIndex) pushBack (_x call FUNC(getEnGroupData));		
			units _x apply {
				if(alive _x) then {
					_pos = getPos _x;
					_posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
					waitUntil {
						count (([] call CBA_fnc_players) select {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5}) == 0
					};
					_veh = objectParent _x;
					crew _veh apply {_veh deleteVehicleCrew _x};
					deleteVehicle _veh;
					deleteVehicle _x; 
					sleep 0.1;
				};
			};
		};
	}forEach _groups;
	_groups apply {_x apply {deleteGroup _x}};
	_module setVariable [QGVAR(unitHandlingRunning),false];

	_module setVariable [QGVAR(groups), [[],[],[],[],[],[]]];
	_module setVariable [QGVAR(modulesSavedGroups), _savedGroups];
	_module setVariable [QGVAR(hasSaved), true];

};

#ifdef DEBUG_MODE_FULL
(_trg getVariable [QGVAR(debugMrk), ""]) setMarkerAlpha 0.6;
#endif