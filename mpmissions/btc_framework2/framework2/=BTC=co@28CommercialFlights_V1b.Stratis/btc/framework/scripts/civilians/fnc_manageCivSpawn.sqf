
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_manageCivSpawn

Description:
Slowly starts to spawn in civilians in the module's area 

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_manageCivSpawn;
    (end)

Author:
    Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [["_module",objnull,[objnull]]];

//check if module is valide
if(isNull _module) exitWith {ERROR("No civil module present")};

_module setVariable ["#active",true];

//block sub-sequent executions
if (_module getVariable ["#initialized",false]) exitWith {};
_module setVariable ["#initialized",true];


private _handle = [_module] spawn {
	scriptName QGVAR(manageCivSpawn_handle);
	params ["_module"];
	_spawnPoints = _module getVariable ["#modulesUnit",[]];
	private _units = _module getVariable ["#units",[]];
	private _maxUnits = _module getVariable ["#unitCount",0];
	private _active = false;

	while {
		_active = _module getVariable ["#active",false];
		_units = _units select {!isNull _x && {alive _x}};
		_active
	} do {
		if (_active) then {
			//spawn in units when module is active and total number is not reached.
			if (count _units < _maxUnits) then{
				private _unit = _module call FUNC(createCivAgent);
				if (!isNull _unit) then {_units pushBack _unit};
			};
		};
		//compact & store units array
		_units = _units select {alive _x};
		#ifdef DEBUG_MODE_FULL
		publicVariable QGVAR(Civs);
		#endif
		_module setVariable ["#units",_units];

		sleep 0.5;
	};
};