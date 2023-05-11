
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_manageEnSpawn

Description:
    Creates enemy groups according to parameters.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_framework_fnc_manageEnSpawn;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
#define __LIGHTVEH__ 2
#define __HEAVYVEH__ 3
#define __STATIC__ 4
#define __HELI__ 5
params [
	["_trg",objnull,[objnull]]
];

_module = _trg getVariable [QGVAR(enModule), objNull];

//check if module is valide
if(isNull _module) exitWith {ERROR_1("No module present on _trg at %1",getPosASL _trg)};

//block sub-sequent executions
if (_module getVariable [QGVAR(initialized),false]) exitWith {};
_module setVariable [QGVAR(initialized),true];
if (_module getVariable [QGVAR(unitHandlingRunning),false]) exitWith {};

private _handle = [_module] spawn {
	scriptName QGVAR(manageEnSpawn_handle);
	params ["_module"];
	
	_hasSaved = _module getVariable [QGVAR(hasSaved), false];
	_EnemySpawn_Setup = _module getVariable [QGVAR(EnemySpawn), []];
	_EnemySpawn_Setup params [
		["_houseSettings", [], [[]], [1,2,3]],
		["_patrolSettings", [], [[]], [1,2,3]],
		["_lightVehsSettings", [], [[]], [1,2,3]],
		["_heavyVehsSettings", [], [[]], [1,2,3]],
		["_staticsSettings", [], [[]], [1,2,3]],
		["_helicoptersSettings", [], [[]], [1,2,3]]
	];
	_waypoints = _module getVariable [QGVAR(modulesSafeSpots), []];
	_spawnPoints = _module getVariable [QGVAR(modulesUnit), []];
	_flightPoints = _module getVariable [QGVAR(modulesFlightPoints), []];
	
	_enemyTypes = _module getVariable [QGVAR(enemyTypes), []];
	_enemyTypes params [
		["_infantry", [], [[]]],
		["_lightVehs", [], [[]]],
		["_heavyVehs", [], [[]]],
		["_attackHeli", [], [[]]],
		["_heli", [], [[]]],
		["_UAV", [], [[]]],
		["_statics", [], [[]]],
		["_boats", [], [[]]],
		["_divers", [], [[]]],
		["_crew", [], [[]]],
		["_flightCrew", [], [[]]]
	];
	_module setVariable [QGVAR(unitHandlingRunning),true];
	if (!_hasSaved) then {
		[_module,_houseSettings,_spawnPoints,_infantry] call FUNC(createEnHouse); //Houses
		[_module,_patrolSettings,_spawnPoints,[_infantry,_divers]] call FUNC(createEnPatrol); //Patrol
		[_module,__LIGHTVEH__,_lightVehsSettings,_waypoints,_lightVehs,_crew] call FUNC(createEnVeh); //Light Vehicles
		[_module,__HEAVYVEH__,_heavyVehsSettings,_waypoints,_heavyVehs,_crew] call FUNC(createEnVeh); //Heavy Vehicles
		[_module,__STATIC__,_staticsSettings,_waypoints,_statics,_crew] call FUNC(createEnVeh); //Statics
		[_module,__HELI__,_helicoptersSettings,_flightPoints,_heli+_attackHeli,_flightCrew] call FUNC(createEnVeh); //Helicopters
		[_module,__HELI__,_helicoptersSettings,_flightPoints,_UAV,_flightCrew] call FUNC(createEnVeh); //UAVs
	} else {	
		[_module] call FUNC(spawnEnGroupData);
	};
	#ifdef DEBUG_MODE_FULL
	publicVariable QGVAR(EnUnits); 
	#endif
	[true] call acex_headless_fnc_transferGroups;
	_module setVariable [QGVAR(unitHandlingRunning),false];
};