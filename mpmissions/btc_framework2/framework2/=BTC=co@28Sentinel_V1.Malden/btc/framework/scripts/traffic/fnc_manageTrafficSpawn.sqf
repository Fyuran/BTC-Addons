
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_manageTrafficSpawn

Description:
    Creates traffic randomly directed to city road waypoints.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_framework_fnc_manageTrafficSpawn;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [["_module",objnull,[objnull]]];

//check if module is valide
if(isNull _module) exitWith {ERROR("No traffic module present")};

_module setVariable ["#active",true];

//block sub-sequent executions
if (_module getVariable ["#initialized",false]) exitWith {};
_module setVariable ["#initialized",true];


private _handle = [_module] spawn {
	scriptName QGVAR(manageTrafficSpawn_handle);
	params ["_module"];
	_spawnPoints = _module getVariable ["#modulesUnit", []];
	_units = _module getVariable ["#units",[]];
	_maxUnits = _module getVariable ["#unitCount",0];
	_active = false;
	_trg = _module getVariable [QGVAR(trafficTrg), objNull];
	_trgArea = triggerArea _trg;

	while {
		_active = _module getVariable ["#active",false];
		_units = _units select {!isNull _x && {alive _x}};
		_active
	} do {
		if (_active) then {
			//spawn in units when module is active and total number is not reached.
			if (count _units < _maxUnits) then{
				_unit = [_module, _spawnPoints, _trgArea] call FUNC(createTrafficAgent);
				if (!isNull _unit) then {_units pushBack _unit};
            };
			_units apply {
				_pos = getPos _x;
				_destination = _x getVariable [QGVAR(trafficDestination), getPos _x];
				_timeout = _x getVariable [QGVAR(TrafficTimeout), CBA_missionTime];
				if (_x distance2D _destination < 50 || {(CBA_missionTime - _timeout) > 300}) then {
					_posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
					waitUntil {
						count (([] call CBA_fnc_players) select {_x distance _pos < 50 || {(_x distance _pos < 150 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}}) == 0
					};
					_veh = vehicle _x;
					_veh deleteVehicleCrew _x;
					deleteVehicle _x;
				};
			};
			#ifdef DEBUG_MODE_FULL    
			publicVariable QGVAR(trafficUnits); 
			#endif
		};
		//compact & store units array
		_units = _units select {alive _x};
		_module setVariable ["#units",_units];

		sleep 1;
	};
};