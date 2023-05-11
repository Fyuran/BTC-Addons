
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createCivModule

Description:
    Create a civilian presence module.

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_createCivModule;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]],
	["_unitCount", 3, [0]]
]) exitWith {ERROR_1("%1 bad _trg",QFUNC(createCivModule))};

if(!isNull (_trg getVariable [QGVAR(enModule), objNull])) exitWith {};

private _unitTypes = missionNameSpace getVariable [QGVAR(civClasses), []];
if(_unitTypes isEqualTo []) exitWith {LOG("no civilian classes found")};

// Traverse a grid covering the entire area specified
_handle = [ _trg, _unitCount, _unitTypes] spawn {
	scriptName QGVAR(createCivModule_handle);
	params["_trg", "_unitCount", "_unitTypes"];
	_pos = getPosASL _trg;
	_trgArea = triggerArea _trg; _trgArea set [0, (_trgArea select 0) / 2]; _trgArea set [1, (_trgArea select 1) / 2];
	_border = [_pos]; _border append _trgArea;
	_border params ["_pos0", "_a", "_b"];
	
	//BIS_fnc_moduleCivilianPresence code needs to have a module so we create one
	private _module = [true] call CBA_fnc_createNamespace; // needs to be a object
	_module setpos _pos;
	_module setVariable ["#unitTypes",_unitTypes];
	_module setVariable ["#usePanicMode",true];
	_module setVariable ["#unitCount",_unitCount];
	_module setVariable ["#useAgents",true];
	_trg setVariable [QGVAR(civModule), _module];

	#ifdef DEBUG_MODE_FULL
		private _civ_mrks = [];
		_module setVariable [QGVAR(civ_markers), _civ_mrks];
	#endif

	//loop through the border
	private _waypoints = [];//road segments and spawnpoints
	private _spawnPoints = [];//locations in buildings
	private _roadsPoints = [];
	// in meters, average distance between spawn/way points
	private _res = (_a max _b) / 4;
	private _maxSize = sqrt (_a^2 + _b^2);
	
	for "_xp" from -_maxSize to _maxSize step _res do{
		for "_yp" from -_maxSize to _maxSize step _res do{
			//calculate position reletive to whole map
			private _p = [_xp + _pos0#0, _yp + _pos0#1];
			//skipping the ones out side the area
			if(_p inArea _border && {GVAR(civ_blacklist) findIf {_p inArea _x} == -1}) then {
				//paint markers for debugging
/* 				#ifdef DEBUG_MODE_FULL
					private _markerName = createMarker [format["%1",random 99999], _p];
					_markerName setMarkerShape "ICON";
					_markerName setMarkerType "hd_dot";
					_markerName setMarkerColor "ColorBlack";
					_civ_mrks pushBack _markerName;
				#endif */

				private _building = nearestObject [_p, "House"]; // (nearestBuilding doesn't return objects placed in editor)
				private _positions = (_building buildingPos -1);
				if ((_building distance2D _p < _res/2) && {count _positions > 0}) then {
					_positions = (_positions call BIS_fnc_arrayShuffle);
					private _waypoint = [true] call CBA_fnc_createNamespace;
					_waypoint setpos (_positions#0);
					_waypoint setVariable ["#type",1];//waypoint & cover
					_waypoint setVariable ["#positions",_positions];
					_waypoints pushback _waypoint;
					_spawnPoints pushback _waypoint;
					#ifdef DEBUG_MODE_FULL
					{
						private _markerName = createMarker [format["%1",random 99999], _x];
						_markerName setMarkerShape "ICON";
						_markerName setMarkerType "hd_dot";
						_markerName setMarkerColor "colorCivilian";
						_markerName setMarkerAlpha 0.5;
						_civ_mrks pushBack _markerName;
					}forEach _positions;
					#endif
				};
				private _nearRoad = selectRandom ((_p nearRoads _res/2) apply { [_x, roadsConnectedTo _x] } select { count (_x#1) > 0 });
				if(!isnil "_nearRoad") then {
					_nearRoad params ["_road", "_rct"];
					private _dir = _road getDir _rct#0;
					// Check position if it's safe
					private _width = [_road, 1, 8] call FUNC(getRoadWidth);
					// Move to the edge
					private _pos = [getPos _road, _width - 4, _dir + (selectRandom [90, 270]) ] call BIS_Fnc_relPos;
					// Move up and down the street a bit
					_pos = [_pos, _width * 0.5, _dir + (selectRandom [0, 180]) ] call BIS_Fnc_relPos;

					private _waypoint = [true] call CBA_fnc_createNamespace;
					_waypoint setpos _pos;
					_waypoint setVariable ["#type",2];//waypoint
					_waypoint setVariable ["#positions",[_pos]];
					_waypoints pushback _waypoint;
/* 					#ifdef DEBUG_MODE_FULL	
						private _markerName = createMarker [format["%1",random 99999], _pos];
						_markerName setMarkerShape "ICON";
						_markerName setMarkerType "hd_dot";
						_markerName setMarkerColor "ColorBlue";
						_civ_mrks pushBack _markerName;
					#endif */
					
				};
				//};//end if _useBuilding
			};
		};//for loop _y
		sleep 0.05;
	};
	_module setVariable ["#modulesSafeSpots", _waypoints];
	_module setVariable ["#modulesUnit", _spawnPoints];

	if(count _waypoints == 0||count _spawnPoints ==0) exitWith {
		INFO_2("%1 module doesnt have spawn or waypoints pos:%2", QFUNC(createCivModule), _pos);
		[_trg] call FUNC(destroyCivModule);
	};

	_module call FUNC(manageCivSpawn);
};