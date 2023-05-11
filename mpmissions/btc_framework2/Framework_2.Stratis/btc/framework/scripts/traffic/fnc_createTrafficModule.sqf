
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createTrafficModule

Description:
    Create a civilian presence module.

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_createTrafficModule;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]],
	["_unitCount", 3, [0]]
]) exitWith {ERROR_1("%1 bad _trg",QFUNC(createTrafficModule))};

if(!isNull (_trg getVariable [QGVAR(enModule), objNull])) exitWith {};

private _unitTypes = missionNameSpace getVariable [QGVAR(trafficClasses), []];
if(_unitTypes isEqualTo []) exitWith {LOG("no traffic classes found")};

// Traverse a grid covering the entire area specified
_handle = [_trg, _unitCount, _unitTypes] spawn {
	scriptName QGVAR(createTrafficModule_handle);
	params[ "_trg", "_unitCount", "_unitTypes"];
	_pos = getPosASL _trg;
	_trgArea = triggerArea _trg; _trgArea set [0, (_trgArea select 0) / 2]; _trgArea set [1, (_trgArea select 1) / 2];
	_border = [_pos]; _border append _trgArea;
	_border params ["_pos0", "_a", "_b"];

	//BIS_fnc_moduleCivilianPresence code needs to have a module so we create one
	private _module = [true] call CBA_fnc_createNamespace; // needs to be a object
	_module setpos _pos;
	_module setVariable ["#unitTypes",_unitTypes];
	_module setVariable ["#unitCount",_unitCount];
	_trg setVariable [QGVAR(trafficModule), _module];
	_module setVariable [QGVAR(trafficTrg), _trg];

	#ifdef DEBUG_MODE_FULL
		private _trafficMarkers = [];
		_module setVariable [QGVAR(trafficMarkers), _trafficMarkers];
	#endif

	//loop through the border
	private _roadPoints = [];//road segments
	// in meters, average distance between spawn/way points
	private _res = (_a max _b) / 4;
	private _maxSize = sqrt (_a^2 + _b^2);
	
	for "_xp" from -_maxSize to _maxSize step _res do{
		for "_yp" from -_maxSize to _maxSize step _res do{
			//calculate position reletive to whole map
			private _p = [_xp + _pos0#0, _yp + _pos0#1];

			//skipping the ones out side the area
			if(_p inArea _border && {GVAR(traffic_blacklist) findIf {_p inArea _x} == -1}) then {
				private _nearRoad = selectRandom ((_p nearRoads _res/2) apply { [_x, roadsConnectedTo _x] } select { count (_x#1) > 0 });
				if(!isnil "_nearRoad") then {
					_nearRoad params ["_road", "_rct"];
					private _dir = _road getDir _rct#0;
					private _pos = getPos _road;

					private _waypoint = [true] call CBA_fnc_createNamespace;
					_waypoint setpos _pos;
					_waypoint setDir _dir;
					_roadPoints pushback _waypoint;
					#ifdef DEBUG_MODE_FULL	
						private _markerName = createMarker [format["%1",random 99999], _pos];
						_markerName setMarkerShape "ICON";
						_markerName setMarkerType "hd_dot";
						_markerName setMarkerColor "colorCivilian";
						_markerName setMarkerAlpha 0.5;
						_trafficMarkers pushBack _markerName;
					#endif
					
				};
				//};//end if _useBuilding
			};
		};//for loop _y
		sleep 0.05;
	};
	_module setVariable ["#modulesUnit", _roadPoints];
	_module setVariable ["#modulesSafeSpots", _roadPoints];

	if(count _roadPoints == 0) exitWith {
		ERROR_2("%1 module doesnt have road waypoints pos:%2", QFUNC(createTrafficModule), _pos);
		[_trg] call FUNC(destroyTrafficModule);
	};

	_module call FUNC(manageTrafficSpawn);
};