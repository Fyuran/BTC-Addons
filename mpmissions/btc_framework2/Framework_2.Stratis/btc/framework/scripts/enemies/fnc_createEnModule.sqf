
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createEnModule

Description:
    Create a civilian presence module.

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_createEnModule;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]]
]) exitWith {ERROR_2("%1 bad params %2",QFUNC(createEnModule),_this)};

_EnemySpawn_Setup = _trg getVariable [QGVAR(enemySpawn_Setup), []];
_settings = _trg getVariable [QGVAR(enemySpawn_Settings), []];
_settings params [
	["_factionID", 0, [0]]
];

if(!isNull (_trg getVariable [QGVAR(enModule), objNull])) exitWith {};

private _enemyTypes = (missionNameSpace getVariable [QGVAR(enClasses), []]) select _factionID;
if(_enemyTypes isEqualTo []) exitWith {LOG("no enemy classes found")};

// Traverse a grid covering the entire area specified
_handle = [_trg, _EnemySpawn_Setup, _enemyTypes] spawn {
	scriptName QGVAR(createEnModule_handle);
	params["_trg", "_EnemySpawn_Setup", "_enemyTypes"];
	_pos = getPosASL _trg;
	_trgArea = triggerArea _trg; _trgArea set [0, (_trgArea select 0) / 2]; _trgArea set [1, (_trgArea select 1) / 2];
	_border = [_pos]; _border append _trgArea;

	_border params ["_pos0", "_a", "_b"];
	_a = _a/2;_b = _b/2;
	//BIS_fnc_moduleCivilianPresence code needs to have a module so we create one
	private _module = [true] call CBA_fnc_createNamespace; // needs to be a object
	_module setpos _pos;
	_module setVariable [QGVAR(enemyTypes),_enemyTypes];
	_module setVariable [QGVAR(EnemySpawn),_EnemySpawn_Setup];
	_trg setVariable [QGVAR(enModule), _module];
	_trg setTriggerStatements ["this", QUOTE([thisTrigger] call FUNC(manageEnSpawn)), QUOTE([thisTrigger] call FUNC(manageEnDespawn))];

	//loop through the border
	_waypoints = [];//road segments and spawnpoints
	_spawnPoints = [];//locations in buildings
	_flightPoints = [];//_p points
	// in meters, average distance between spawn/way points
	_res = (_a max _b) / 4;
	_maxSize = sqrt (_a^2 + _b^2);
	
	for "_xp" from -_maxSize to _maxSize step _res do{
		for "_yp" from -_maxSize to _maxSize step _res do{
			//calculate position reletive to whole map
			_p = [_xp + _pos0#0, _yp + _pos0#1];

			//skipping the ones out side the area
			if(_p inArea _border) then {
				_flightPoints pushBack _p;
				_waypoints pushBack _p;
				//paint markers for debugging
				#ifdef DEBUG_MODE_FULL
					_markerName = createMarker [format["%1",random 99999], _p];
					_markerName setMarkerShape "ICON";
					_markerName setMarkerType "hd_dot";
					_markerName setMarkerColor (["ColorBlack","ColorYellow"] select surfaceIsWater _p);
					_markerName setMarkerAlpha 0.5;
				#endif
				
				_buildings = nearestObjects [_p, ["House"], 50, true]; // (nearestBuilding doesn't return objects placed in editor)
				_buildings = _buildings select {!(_x isKindOf "Piers_base_F")}; //they are considered House
				_buildings apply {
					_positions = _x buildingPos -1;
					if (count _positions > 0) then {
						_spawnPoints pushBackUnique selectRandom _positions;
						#ifdef DEBUG_MODE_FULL
						{
							_markerName = createMarker [format["%1",random 99999], _x];
							_markerName setMarkerShape "ICON";
							_markerName setMarkerType "hd_dot";
							_markerName setMarkerColor "ColorOrange";
							_markerName setMarkerAlpha 0.5;
						}forEach _positions;
						#endif
					};
				};
				_nearRoad = selectRandom ((_p nearRoads _res/2) apply { [_x, roadsConnectedTo _x] } select { count (_x#1) > 0 });
				if(!isnil "_nearRoad") then {
					_nearRoad params ["_road", "_rct"];
					_dir = _road getDir _rct#0;
					_pos = getPos _road;

					_waypoints pushBackUnique _pos;
					#ifdef DEBUG_MODE_FULL	
						_markerName = createMarker [format["%1",random 99999], _pos];
						_markerName setMarkerShape "ICON";
						_markerName setMarkerType "hd_dot";
						_markerName setMarkerColor "Color2_FD_F";
						_markerName setMarkerAlpha 0.5;
					#endif
					
				};
				//};//end if _useBuilding
			};
		};//for loop _y
		sleep 0.05;
	};
	_module setVariable [QGVAR(modulesSafeSpots), _waypoints];
	_module setVariable [QGVAR(modulesUnit), _spawnPoints];
	_module setVariable [QGVAR(modulesFlightPoints), _flightPoints];
	_module setVariable [QGVAR(maxPatrolRadius), (_a max _b)*2];

	if(count _waypoints == 0||count _spawnPoints ==0) then {
		LOG_2("%1 module at pos:%2 doesnt have spawn or waypoints, using _p points",QFUNC(createEnModule),_pos);
		_module setVariable [QGVAR(modulesSafeSpots), _flightPoints];
		_module setVariable [QGVAR(modulesUnit), _flightPoints];
	};

	[_trg] call FUNC(manageEnSpawn)
};